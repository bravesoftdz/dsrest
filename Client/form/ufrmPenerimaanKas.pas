unit ufrmPenerimaanKas;

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
  dxStatusBar, uDBUtils, ClientModule, uAppUtils, dxCore, cxDateUtils,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit, cxMemo, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox, cxCurrencyEdit,uModel,uPenerimaanKas,
  uReport, uRekBank,uDMReport, Data.FireDACJSONReflect, uReturSupplier, uSupplier;

type
  TfrmPenerimaanKas = class(TfrmDefault)
    pnlHeader: TPanel;
    lblNoBukti: TLabel;
    edNoBukti: TcxTextEdit;
    lblTglBukti: TLabel;
    edTglBukti: TcxDateEdit;
    lblJenisTransaksi: TLabel;
    lblPenerima: TLabel;
    edPenerima: TcxTextEdit;
    lblCustomer: TLabel;
    cbbCustomer: TcxExtLookupComboBox;
    lblKeterangan: TLabel;
    memKeterangan: TcxMemo;
    cxGridDBAR: TcxGrid;
    cxGridTableAR: TcxGridTableView;
    cxGridColAR: TcxGridColumn;
    cxGridColNominal: TcxGridColumn;
    cxgrdlvlAR: TcxGridLevel;
    cxGridColBayar: TcxGridColumn;
    btnLoadAR: TcxButton;
    cxgrdlvlAPNew: TcxGridLevel;
    cxgrdlvlOI: TcxGridLevel;
    lblNominal: TLabel;
    edNominal: TcxCurrencyEdit;
    cxGridColKeterangan: TcxGridColumn;
    cbbRekBank: TcxExtLookupComboBox;
    edNoRek: TcxTextEdit;
    edAlamatBank: TcxTextEdit;
    cxGridTableAPNew: TcxGridTableView;
    cxGridColAPNewKode: TcxGridColumn;
    cxGridColAPNewNama: TcxGridColumn;
    cxGridColAPNewKeterangan: TcxGridColumn;
    cxGridColAPNewNominal: TcxGridColumn;
    cxGridTableOI: TcxGridTableView;
    cxGridColOIKode: TcxGridColumn;
    cxGridColOINama: TcxGridColumn;
    cxGridColOIKeterangan: TcxGridColumn;
    cxGridColOINominal: TcxGridColumn;
    procedure actCetakExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionBaruExecute(Sender: TObject);
    procedure ActionHapusExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
    procedure cbbRekBankExit(Sender: TObject);
    procedure cxGridTableAREditing(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; var AAllow: Boolean);
    procedure edTglBuktiExit(Sender: TObject);
    procedure edNominalPropertiesChange(Sender: TObject);
    procedure cxGridDBTableOverviewCellDblClick(Sender: TcxCustomGridTableView;
        ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
        TShiftState; var AHandled: Boolean);
    procedure cbbCustomerPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridColARPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridTableAPNewEditing(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; var AAllow: Boolean);
    procedure cxGridTableARDataControllerAfterDelete(
      ADataController: TcxCustomDataController);
    procedure cxGridColAPNewKodePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridTableARDataControllerAfterPost(
      ADataController: TcxCustomDataController);
    procedure cxGridTableAPNewDataControllerAfterDelete(
      ADataController: TcxCustomDataController);
    procedure cxGridTableAPNewDataControllerAfterPost(
      ADataController: TcxCustomDataController);
    procedure cxGridTableOIDataControllerAfterDelete(
      ADataController: TcxCustomDataController);
    procedure cxGridTableOIDataControllerAfterPost(
      ADataController: TcxCustomDataController);
    procedure cxGridColOIKodePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    FCDSAccountAPNew: tclientDataSet;
    FCDSAccountPenerimaanLain: tclientDataSet;
    FCDSAP: tclientDataSet;
    FCDSRekBank: TClientDataSet;
    FPenerimaanKas: TPenerimaanKas;
    function GetPenerimaanKas: TPenerimaanKas;
    function GetTotalNominalGrid: Double;
    procedure InisialisasiAccount;
    procedure InisialisasiCBBSalesman;
    procedure InisialisasiRekBank;
    procedure LoadDataAR(AIDCustomer : String);
    procedure LoadDataPenerimaanKasARItems;
    procedure LoadDataPenerimaanKasAPNewItems;
    procedure LoadDataPenerimaanKasOIItems;
    procedure SetStatusNominal;
    procedure SetUser;
    procedure UpdatePenerimaanKasAPNewItems;
    procedure UpdatePenerimaanKasAPLain;
    procedure UpdatePenerimaanKasARItems;
    property CDSRekBank: TClientDataSet read FCDSRekBank write FCDSRekBank;
    property PenerimaanKas: TPenerimaanKas read GetPenerimaanKas write
        FPenerimaanKas;
    { Private declarations }
  public
    destructor Destroy; override;
    function LoadData(AID : String): Boolean;
    { Public declarations }
  end;

var
  frmPenerimaanKas: TfrmPenerimaanKas;

implementation
uses uAR;

{$R *.dfm}

destructor TfrmPenerimaanKas.Destroy;
begin
  inherited;
  FreeAndNil(FPenerimaanKas);
end;

procedure TfrmPenerimaanKas.actCetakExecute(Sender: TObject);
var
  lcds: TFDJSONDataSets;
//  lcds: TClientDataSet;
begin
  inherited;

  with dmReport do
  begin
    AddReportVariable('UserCetak', User);

    if cxPCData.ActivePageIndex = 0 then
      lcds := ClientDataModule.ServerPenerimaanKasClient.RetrieveCDSlip(dtpAwal.DateTime, dtpAkhir.DateTime, ClientDataModule.Cabang, '%')
    else
      lcds := ClientDataModule.ServerPenerimaanKasClient.RetrieveCDSlip(dtpAwal.DateTime, dtpAkhir.DateTime, ClientDataModule.Cabang, PenerimaanKas.NoBukti);


    ExecuteReport( 'Reports/Slip_PenerimaanKas' ,
      lcds

    );
  end;
end;

procedure TfrmPenerimaanKas.FormCreate(Sender: TObject);
begin
  inherited;
  InisialisasiCBBSalesman;
  InisialisasiRekBank;
  InisialisasiAccount;

  ActionBaruExecute(Sender);

end;

procedure TfrmPenerimaanKas.ActionBaruExecute(Sender: TObject);
begin
  inherited;
  LoadData('');
end;

procedure TfrmPenerimaanKas.ActionHapusExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Anda yakin akan menghapus data ?') then
    Exit;

  if ClientDataModule.ServerPenerimaanKasClient.Delete(PenerimaanKas) then
  begin
    TAppUtils.InformationBerhasilHapus;
    ActionBaruExecute(Sender);
  end;

end;

procedure TfrmPenerimaanKas.ActionRefreshExecute(Sender: TObject);
var
  lcds: TClientDataSet;
begin
  inherited;
  if chkKonsolidasi1.Checked then
    lcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.RetrivePenerimaanKas(dtpAwal.DateTime, dtpAkhir.DateTime, nil), cxGridDBTableOverview)
  else
    lcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.RetrivePenerimaanKas(dtpAwal.DateTime, dtpAkhir.DateTime, ClientDataModule.Cabang), cxGridDBTableOverview);

  cxGridDBTableOverview.ClearRows;
  cxGridDBTableOverview.SetDataset(lcds, True);
  cxGridDBTableOverview.SetVisibleColumns(['ID', 'CABANGID'], False);
  cxGridDBTableOverview.ApplyBestFit();
end;

procedure TfrmPenerimaanKas.ActionSimpanExecute(Sender: TObject);
begin
  inherited;
  edNominal.Value := GetTotalNominalGrid;

  if not ValidateEmptyCtrl([1]) then
    Exit
  else if edNominal.Value <= 0 then
  begin
    TAppUtils.Warning('Nominal Harus > 0');
    edNominal.SetFocus;
    Exit;
  end;


  PenerimaanKas.Cabang         := TCabang.CreateID(ClientDataModule.Cabang.ID);
  PenerimaanKas.RekBank        := TRekBank.CreateID(cbbRekBank.EditValue);
  PenerimaanKas.Keterangan     := memKeterangan.Text;
  PenerimaanKas.NoBukti        := edNoBukti.Text;
  PenerimaanKas.TglBukti       := edTglBukti.Date;
  PenerimaanKas.Nominal        := edNominal.Value;
  PenerimaanKas.Pembeli        := TSupplier.CreateID(cbbCustomer.EditValue);
  PenerimaanKas.Petugas        := edPenerima.Text;

  UpdatePenerimaanKasARItems;
  UpdatePenerimaanKasAPNewItems;
  UpdatePenerimaanKasAPLain;

  if ClientDataModule.ServerPenerimaanKasClient.Save(PenerimaanKas) then
  begin
    TAppUtils.InformationBerhasilSimpan;
    ActionBaruExecute(Sender);
  end;


end;

procedure TfrmPenerimaanKas.cbbCustomerPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  LoadDataAR(cbbCustomer.EditValue);
  cxGridTableAR.ClearRows;
end;

procedure TfrmPenerimaanKas.cbbRekBankExit(Sender: TObject);
begin
  inherited;
  edAlamatBank.Text := CDSRekBank.FieldByName('alamat').AsString;
  edNoRek.Text      := CDSRekBank.FieldByName('norek').AsString;
end;

procedure TfrmPenerimaanKas.cxGridColAPNewKodePropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  cxGridTableAPNew.DataController.Values[cxGridTableAPNew.DataController.FocusedRecordIndex, cxGridColAPNewNama.Index] := DisplayValue;
end;

procedure TfrmPenerimaanKas.cxGridColARPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  cxGridTableAR.SetValue(cxGridTableAR.FocusedIndex, cxGridColNominal.Index, FCDSAP.FieldByName('sisa').AsFloat);
  cxGridTableAR.SetValue(cxGridTableAR.FocusedIndex, cxGridColBayar.Index, FCDSAP.FieldByName('sisa').AsFloat);
end;

procedure TfrmPenerimaanKas.cxGridColOIKodePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  cxGridTableOI.DataController.SetValue(cxGridTableOI.DataController.FocusedRecordIndex, cxGridColOINama.Index, DisplayValue);
end;

procedure TfrmPenerimaanKas.cxGridDBTableOverviewCellDblClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  LoadData(cxGridDBTableOverview.DS.FieldByName('ID').AsString);
end;

procedure TfrmPenerimaanKas.cxGridTableAPNewDataControllerAfterDelete(
  ADataController: TcxCustomDataController);
begin
  inherited;
  edNominal.Value := GetTotalNominalGrid;
end;

procedure TfrmPenerimaanKas.cxGridTableAPNewDataControllerAfterPost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  edNominal.Value := GetTotalNominalGrid;
end;

procedure TfrmPenerimaanKas.cxGridTableAPNewEditing(Sender:
    TcxCustomGridTableView; AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  inherited;
  AAllow := True;
  if AItem.Index = cxGridColAPNewNama.Index then
    AAllow := False;
end;

procedure TfrmPenerimaanKas.cxGridTableARDataControllerAfterDelete(
  ADataController: TcxCustomDataController);
begin
  inherited;
  edNominal.Value := GetTotalNominalGrid;
end;

procedure TfrmPenerimaanKas.cxGridTableARDataControllerAfterPost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  edNominal.Value := GetTotalNominalGrid;
end;

procedure TfrmPenerimaanKas.cxGridTableAREditing(Sender:
    TcxCustomGridTableView; AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  inherited;
  AAllow := False;
  if AItem.Index in [cxGridColAR.Index, cxGridColBayar.Index,cxGridColKeterangan.Index] then
    AAllow := True;
end;

procedure TfrmPenerimaanKas.cxGridTableOIDataControllerAfterDelete(
  ADataController: TcxCustomDataController);
begin
  inherited;
  edNominal.Value := GetTotalNominalGrid;
end;

procedure TfrmPenerimaanKas.cxGridTableOIDataControllerAfterPost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  edNominal.Value := GetTotalNominalGrid;
end;

procedure TfrmPenerimaanKas.edNominalPropertiesChange(Sender: TObject);
begin
  inherited;
  SetStatusNominal;
end;

procedure TfrmPenerimaanKas.edTglBuktiExit(Sender: TObject);
begin
  inherited;
  if PenerimaanKas.ID = '' then
    edNoBukti.Text := ClientDataModule.ServerPenerimaanKasClient.GenerateNoBukti(edTglBukti.Date, ClientDataModule.Cabang.Kode + '/BKK');
end;

function TfrmPenerimaanKas.GetPenerimaanKas: TPenerimaanKas;
begin
  if FPenerimaanKas = nil then
    FPenerimaanKas := TPenerimaanKas.Create;

  Result := FPenerimaanKas;
end;

function TfrmPenerimaanKas.GetTotalNominalGrid: Double;
var
  i: Integer;
begin
  Result := 0;

  for i := 0 to cxGridTableAR.DataController.RecordCount - 1 do
  begin
    Result := Result + cxGridTableAR.GetDouble(i, cxGridColBayar.Index);
  end;

  for i := 0 to cxGridTableAPNew.DataController.RecordCount - 1 do
  begin
    Result := Result + cxGridTableAPNew.GetDouble(i, cxGridColAPNewNominal.Index);
  end;

  for i := 0 to cxGridTableOI.DataController.RecordCount - 1 do
  begin
    Result := Result + cxGridTableOI.GetDouble(i, cxGridColOINominal.Index);
  end;

end;

procedure TfrmPenerimaanKas.InisialisasiAccount;
begin
  FCDSAccountAPNew := TDBUtils.DSToCDS(ClientDataModule.DSDataCLient.LoadAccountAPNew(), Self);
  TcxExtLookupComboBoxProperties(cxGridColAPNewKode.Properties).LoadFromCDS(FCDSAccountAPNew, 'ID', 'Kode', ['id'], Self);
  TcxExtLookupComboBoxProperties(cxGridColAPNewNama.Properties).LoadFromCDS(FCDSAccountAPNew, 'Kode', 'Nama', ['id'], Self);

  FCDSAccountPenerimaanLain := TDBUtils.DSToCDS(ClientDataModule.DSDataCLient.LoadAccountPenerimaanLain(), Self);
  TcxExtLookupComboBoxProperties(cxGridColOIKode.Properties).LoadFromCDS(FCDSAccountPenerimaanLain, 'ID', 'Kode', ['id'], Self);
  TcxExtLookupComboBoxProperties(cxGridColOINama.Properties).LoadFromCDS(FCDSAccountPenerimaanLain, 'Kode', 'Nama', ['id'], Self);
end;

procedure TfrmPenerimaanKas.InisialisasiCBBSalesman;
var
  lCDSSalesman: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select Nama,Kode,ID from TSupplier where ispembeli = 1';
  lCDSSalesman := TDBUtils.OpenDataset(sSQL);
  cbbCustomer.Properties.LoadFromCDS(lCDSSalesman,'ID','Nama',['ID'],Self);
  cbbCustomer.Properties.SetMultiPurposeLookup;
end;

procedure TfrmPenerimaanKas.InisialisasiRekBank;
var
  sSQL: string;
begin
  sSQL := 'select bank,alamat,norek,namapemegang,id FROM trekbank';
  CDSRekBank := TDBUtils.OpenDataset(sSQL);
  cbbRekBank.Properties.LoadFromCDS(CDSRekBank,'ID','bank',['ID'],Self);
  cbbRekBank.Properties.SetMultiPurposeLookup;
end;

function TfrmPenerimaanKas.LoadData(AID : String): Boolean;
begin
  Result := False;

  FreeAndNil(FPenerimaanKas);
  ClearByTag([0,1]);

  edNoBukti.Text := ClientDataModule.ServerPenerimaanKasClient.GenerateNoBukti(edTglBukti.Date, ClientDataModule.Cabang.Kode + '/BKK');
  SetUser;

  cxGridTableAR.ClearRows;
  cxGridTableAPNew.ClearRows;
  cxGridTableOI.ClearRows;

  FPenerimaanKas := ClientDataModule.ServerPenerimaanKasClient.Retrieve(AID);
  if FPenerimaanKas = nil then
    Exit;

  if FPenerimaanKas.ID = '' then
    Exit;

  edNoBukti.Text       := FPenerimaanKas.NoBukti;
  edTglBukti.Date      := FPenerimaanKas.TglBukti;
  edPenerima.Text      := FPenerimaanKas.Petugas;
  edNominal.Value      := FPenerimaanKas.Nominal;

  cbbRekBank.EditValue := FPenerimaanKas.RekBank.ID;
  cbbRekBankExit(nil);

  cbbCustomer.EditValue:= FPenerimaanKas.Pembeli.ID;
  memKeterangan.Text   := FPenerimaanKas.Keterangan;

  LoadDataPenerimaanKasARItems;
  LoadDataPenerimaanKasAPNewItems;
  LoadDataPenerimaanKasOIItems;

  cxPCData.ActivePageIndex := 1;

  Result := True;
end;

procedure TfrmPenerimaanKas.LoadDataAR(AIDCustomer : String);
var
  lCustomer: TSupplier;
begin
  lCustomer := TSupplier.CreateID(AIDCustomer);
  try
    FCDSAP := TDBUtils.DSToCDS(ClientDataModule.DSDataCLient.LoadAR(lCustomer), Self);
    TcxExtLookupComboBoxProperties(cxGridColAR.Properties).LoadFromCDS(FCDSAP, 'ID', 'NOBUKTI', ['ID','CUSTOMERID'],Self);
  finally
    lCustomer.Free;
  end;

end;

procedure TfrmPenerimaanKas.LoadDataPenerimaanKasARItems;
var
  i: Integer;
begin
  LoadDataAR(PenerimaanKas.Pembeli.ID);

  cxGridTableAR.ClearRows;
  for I := 0 to PenerimaanKas.PenerimaanKasARItems.Count - 1 do
  begin
    cxGridTableAR.DataController.AppendRecord;
    cxGridTableAR.SetObjectData(PenerimaanKas.PenerimaanKasARItems[i], i);
    cxGridTableAR.SetValue(i, cxGridColNominal.Index, FCDSAP.FieldByName('nominal').AsFloat + PenerimaanKas.PenerimaanKasARItems[i].Nominal);
  end;
end;

procedure TfrmPenerimaanKas.LoadDataPenerimaanKasAPNewItems;
var
  i: Integer;
begin
//  LoadDataAR(PenerimaanKas.Pembeli.ID);

  cxGridTableAPNew.ClearRows;
  for I := 0 to PenerimaanKas.PenerimaanKasAPNewItems.Count - 1 do
  begin
    cxGridTableAPNew.DataController.AppendRecord;
    cxGridTableAPNew.SetObjectData(PenerimaanKas.PenerimaanKasAPNewItems[i], i);
    cxGridTableAPNew.SetValue(i, cxGridColAPNewNama.Index, cxGridTableAPNew.DataController.DisplayTexts[i,cxGridColAPNewKode.Index]);
  end;
end;

procedure TfrmPenerimaanKas.LoadDataPenerimaanKasOIItems;
var
  I: Integer;
begin
   cxGridTableOI.ClearRows;
   for I := 0 to PenerimaanKas.PenerimaanKasLainItems.Count - 1 do
   begin
     cxGridTableOI.DataController.AppendRecord;
     cxGridTableOI.SetObjectData(PenerimaanKas.PenerimaanKasLainItems[i], i);
     cxGridTableOI.SetValue(i, cxGridColOINama.Index, cxGridTableOI.DataController.DisplayTexts[i,cxGridColOIKode.Index]);
   end;
end;

procedure TfrmPenerimaanKas.SetStatusNominal;
begin
//  if edNominal.Value = GetTotalNominalGrid then
//  begin
//    lblStatusNominal.Caption := 'Sama';
//    lblStatusNominal.Font.Color := clGreen;
//  end else begin
//    lblStatusNominal.Caption := 'Beda';
//    lblStatusNominal.Font.Color := clRed;
//  end;
end;

procedure TfrmPenerimaanKas.SetUser;
begin
  edPenerima.Text := 'AKU';
end;

procedure TfrmPenerimaanKas.UpdatePenerimaanKasAPNewItems;
var
  I: Integer;
  lPKAPNew: TPenerimaanKasAPNew;
begin
  PenerimaanKas.PenerimaanKasAPNewItems.Clear;
  for I := 0 to cxGridTableAPNew.DataController.RecordCount - 1 do
  begin
    lPKAPNew               := TPenerimaanKasAPNew.Create;
    cxGridTableAPNew.LoadObjectData(lPKAPNew,i);

    PenerimaanKas.PenerimaanKasAPNewItems.Add(lPKAPNew);
  end;
end;

procedure TfrmPenerimaanKas.UpdatePenerimaanKasAPLain;
var
  I: Integer;
  lPKAPLain: TPenerimaanKasLain;
begin
  PenerimaanKas.PenerimaanKasLainItems.Clear;
  for I := 0 to cxGridTableOI.DataController.RecordCount - 1 do
  begin
    lPKAPLain               := TPenerimaanKasLain.Create;
    cxGridTableOI.LoadObjectData(lPKAPLain,i);

    PenerimaanKas.PenerimaanKasLainItems.Add(lPKAPLain);
  end;
end;

procedure TfrmPenerimaanKas.UpdatePenerimaanKasARItems;
var
  I: Integer;
  lPKAR: TPenerimaanKasAR;
begin
  PenerimaanKas.PenerimaanKasARItems.Clear;
  for I := 0 to cxGridTableAR.DataController.RecordCount - 1 do
  begin
    lPKAR               := TPenerimaanKasAR.Create;
    cxGridTableAR.LoadObjectData(lPKAR,i);
    PenerimaanKas.PenerimaanKasARItems.Add(lPKAR);
  end;
end;

end.
