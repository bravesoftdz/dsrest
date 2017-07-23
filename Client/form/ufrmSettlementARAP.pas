unit ufrmSettlementARAP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, Vcl.Menus, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, System.ImageList, Vcl.ImgList, Datasnap.DBClient,
  Datasnap.Provider, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, System.Actions, Vcl.ActnList, cxCheckBox, cxGridLevel, cxClasses,
  cxGridCustomView, Vcl.StdCtrls, cxButtons, Vcl.ComCtrls, Vcl.ExtCtrls, cxPC,
  dxStatusBar, dxCore, cxDateUtils, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox, cxMaskEdit, cxCalendar, cxTextEdit,
  cxLabel, ClientModule, uSettlementARAP, uAppUtils, System.DateUtils,
  cxCurrencyEdit,uDBUtils, uSupplier;

type
  TfrmSettlementARAP = class(TfrmDefault)
    pnlHeader: TPanel;
    lblNoBukti: TcxLabel;
    lblTglBukti: TcxLabel;
    lblSupplier: TcxLabel;
    edNoBukti: TcxTextEdit;
    edTglBukti: TcxDateEdit;
    cbbSupplier: TcxExtLookupComboBox;
    cxgrdlvlARLevel: TcxGridLevel;
    cxGridAR: TcxGrid;
    cxGridTableAR: TcxGridTableView;
    cxGridColARAR: TcxGridColumn;
    cxGridColARNominal: TcxGridColumn;
    cxGridColARSisa: TcxGridColumn;
    cxGridColARNominalSettlement: TcxGridColumn;
    splARAP: TSplitter;
    cxGridAP: TcxGrid;
    cxGridTableAP: TcxGridTableView;
    cxGridColAPAP: TcxGridColumn;
    cxGridColAPNominal: TcxGridColumn;
    cxGridColAPSisa: TcxGridColumn;
    cxGridColAPNominalSettlement: TcxGridColumn;
    cxgrdlvlAP: TcxGridLevel;
    lblKeterangan: TcxLabel;
    mmoKeterangan: TMemo;
    procedure FormDestroy(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbbSupplierPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridColARARPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridColAPAPPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridTableAPEditing(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; var AAllow: Boolean);
    procedure cxGridTableAREditing(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; var AAllow: Boolean);
  private
    FCDSAP: tclientDataSet;
    FCDSAR: tclientDataSet;
    FCDSSalesman: tclientDataSet;
    FSettlementARAP: TSettlementARAP;
    function GetSettlementARAP: TSettlementARAP;
    procedure InisialisasiCBBSupplier;
    function IsBisaSimpan: Boolean;
    procedure LoadDataAR(AIDCustomer : String);
    procedure LoadDataAP(AIDCustomer : String);
    procedure LoadDataSettlementARAPItemARs;
    procedure UpdateSettlementARAPItemARs;
    procedure UpdateSettlementARAPItemAPs;
    { Private declarations }
  public
    procedure LoadDataSettlementARAP(const AID: string);
    property SettlementARAP: TSettlementARAP read GetSettlementARAP write
        FSettlementARAP;
    { Public declarations }
  end;

var
  frmSettlementARAP: TfrmSettlementARAP;

implementation

{$R *.dfm}

procedure TfrmSettlementARAP.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FSettlementARAP);
end;

procedure TfrmSettlementARAP.ActionSimpanExecute(Sender: TObject);
begin
  inherited;
  if not IsBisaSimpan then
    Exit;

  SettlementARAP.NoBukti    := edNoBukti.Text;
  SettlementARAP.Supplier   := TSupplier.CreateID(cbbSupplier.EditValue);
  SettlementARAP.TglBukti   := edTglBukti.Date;
  SettlementARAP.Keterangan := mmoKeterangan.Text;

  UpdateSettlementARAPItemARs;
  UpdateSettlementARAPItemAPs;

  if ClientDataModule.ServerSerttlementARAPClient.Save(SettlementARAP) then
  begin
    TAppUtils.InformationBerhasilSimpan;
    LoadDataSettlementARAP('');
  end;
end;

procedure TfrmSettlementARAP.cbbSupplierPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  LoadDataAR(cbbSupplier.EditValue);
  LoadDataAP(cbbSupplier.EditValue);

  cxGridTableAR.ClearRows;
  cxGridTableAP.ClearRows;
end;

procedure TfrmSettlementARAP.cxGridColAPAPPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  cxGridTableAP.SetValue(cxGridTableAP.FocusedIndex, cxGridColAPNominal.Index, FCDSAP.FieldByName('nominal').AsFloat);
  cxGridTableAP.SetValue(cxGridTableAP.FocusedIndex, cxGridColAPSisa.Index, FCDSAP.FieldByName('sisa').AsFloat);
end;

procedure TfrmSettlementARAP.cxGridColARARPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  if FCDSAR = nil then
    Exit;

  cxGridTableAR.SetValue(cxGridTableAR.FocusedIndex, cxGridColARNominal.Index, FCDSAR.FieldByName('nominal').AsFloat);
  cxGridTableAR.SetValue(cxGridTableAR.FocusedIndex, cxGridColARSisa.Index, FCDSAR.FieldByName('sisa').AsFloat);
end;

procedure TfrmSettlementARAP.cxGridTableAPEditing(Sender:
    TcxCustomGridTableView; AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  inherited;
  AAllow := False;
  if AItem.Index in [cxGridColAPAP.Index, cxGridColAPNominalSettlement.Index] then
    AAllow := True;
end;

procedure TfrmSettlementARAP.cxGridTableAREditing(Sender:
    TcxCustomGridTableView; AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  inherited;
  AAllow := False;
  if AItem.Index in [cxGridColARAR.Index, cxGridColARNominalSettlement.Index] then
    AAllow := True;
end;

procedure TfrmSettlementARAP.FormCreate(Sender: TObject);
begin
  inherited;
  edNoBukti.Text := 'Otomatis';
  edTglBukti.Date:= Now;

  InisialisasiCBBSupplier;
end;

function TfrmSettlementARAP.GetSettlementARAP: TSettlementARAP;
begin
  if FSettlementARAP = nil then
    FSettlementARAP := TSettlementARAP.Create;

  Result := FSettlementARAP;
end;

procedure TfrmSettlementARAP.InisialisasiCBBSupplier;
var
  sSQL: string;
begin
  sSQL := 'select Nama,Kode,ID from TSupplier where (ispembeli = 1 or issupplier = 1)';
  FCDSSalesman := TDBUtils.OpenDataset(sSQL);
  cbbSupplier.Properties.LoadFromCDS(FCDSSalesman,'ID','Nama',['ID'],Self);
  cbbSupplier.Properties.SetMultiPurposeLookup;
end;

function TfrmSettlementARAP.IsBisaSimpan: Boolean;
begin
  Result := True;
end;

procedure TfrmSettlementARAP.LoadDataSettlementARAP(const AID: string);
begin
  edNoBukti.Text := ClientDataModule.ServerSerttlementARAPClient.GenerateNoBukti(edTglBukti.Date, '');
  cbbSupplier.EditValue := nil;
  mmoKeterangan.Clear;
  FreeAndNil(FSettlementARAP);

  if AID = '' then
    Exit;

  FSettlementARAP := ClientDataModule.ServerSerttlementARAPClient.Retrieve(AID);
  edNoBukti.Text  := SettlementARAP.NoBukti;
  cbbSupplier.EditValue := SettlementARAP.Supplier.ID;
  mmoKeterangan.Text := SettlementARAP.Keterangan;

  LoadDataSettlementARAPItemARs;


end;

procedure TfrmSettlementARAP.LoadDataAR(AIDCustomer : String);
var
  lCustomer: TSupplier;
begin
  lCustomer := TSupplier.CreateID(AIDCustomer);
  try
    FCDSAR := TDBUtils.DSToCDS(ClientDataModule.DSDataCLient.LoadAR(lCustomer), Self);
    TcxExtLookupComboBoxProperties(cxGridColARAR.Properties).LoadFromCDS(FCDSAR, 'ID', 'NOBUKTI', ['ID','CUSTOMERID','CUSTOMER','TERBAYAR'],Self);
  finally
    lCustomer.Free;
  end;

end;

procedure TfrmSettlementARAP.LoadDataAP(AIDCustomer : String);
var
  lSupplier: TSupplier;
begin
  lSupplier := TSupplier.CreateID(AIDCustomer);
  try
    FCDSAP := TDBUtils.DSToCDS(ClientDataModule.DSDataCLient.LoadAP(lSupplier), Self);
    TcxExtLookupComboBoxProperties(cxGridColAPAP.Properties).LoadFromCDS(FCDSAP, 'ID', 'NOBUKTI', ['ID','SUPPLIERID'],Self);
  finally
    lSupplier.Free;
  end;

end;

procedure TfrmSettlementARAP.LoadDataSettlementARAPItemARs;
begin
  cxGridTableAR.ClearRows;
  for I := 0 to SettlementARAP.SettlementARAPItemARs.Count - 1 do
  begin
    cxGridTableAR.SetObjectData(SettlementARAP.SettlementARAPItemARs[i], i);
  end;
end;

procedure TfrmSettlementARAP.UpdateSettlementARAPItemARs;
var
  I: Integer;
  lSettlementARAPItemAR: TSettlementARAPItemAR;
begin
  SettlementARAP.SettlementARAPItemARs.Clear;
  for I := 0 to cxGridTableAR.DataController.RecordCount - 1 do
  begin
    lSettlementARAPItemAR := TSettlementARAPItemAR.Create();
    cxGridTableAR.LoadObjectData(lSettlementARAPItemAR, i);
    SettlementARAP.SettlementARAPItemARs.Add(lSettlementARAPItemAR);
  end;
end;

procedure TfrmSettlementARAP.UpdateSettlementARAPItemAPs;
var
  I: Integer;
  lSettlementAPAPItemAP: TSettlementARAPItemAP;
begin
  SettlementARAP.SettlementARAPItemAPs.Clear;
  for I := 0 to cxGridTableAP.DataController.RecordCount - 1 do
  begin
    lSettlementAPAPItemAP := TSettlementARAPItemAP.Create();
    cxGridTableAP.LoadObjectData(lSettlementAPAPItemAP, i);
    SettlementARAP.SettlementARAPItemAPs.Add(lSettlementAPAPItemAP);
  end;
end;

end.
