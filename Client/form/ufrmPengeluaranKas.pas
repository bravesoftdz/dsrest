unit ufrmPengeluaranKas;

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
  cxDBLookupEdit, cxDBExtLookupComboBox, cxCurrencyEdit,uModel,uPengeluaranKas,
  uReport, uRekBank,uDMReport, Data.FireDACJSONReflect, uReturSupplier, uSupplier;

type
  TfrmPengeluaranKas = class(TfrmDefault)
    pnlHeader: TPanel;
    lblNoBukti: TLabel;
    edNoBukti: TcxTextEdit;
    lblTglBukti: TLabel;
    edTglBukti: TcxDateEdit;
    lblKasBank: TLabel;
    lblPenerima: TLabel;
    edPenerima: TcxTextEdit;
    lblCustomer: TLabel;
    cbbCustomer: TcxExtLookupComboBox;
    lblKeterangan: TLabel;
    memKeterangan: TcxMemo;
    cxGridDBAR: TcxGrid;
    cxGridTableAP: TcxGridTableView;
    cxGridColAP: TcxGridColumn;
    cxGridColNominal: TcxGridColumn;
    cxgrdlvlAR: TcxGridLevel;
    cxGridColBayar: TcxGridColumn;
    cxgrdlvlDP: TcxGridLevel;
    lblNominal: TLabel;
    edNominal: TcxCurrencyEdit;
    cxGridColKeterangan: TcxGridColumn;
    cbbRekBank: TcxExtLookupComboBox;
    edNoRek: TcxTextEdit;
    edAlamatBank: TcxTextEdit;
    cxGridTableNonAP: TcxGridTableView;
    cxGridColNonAPKode: TcxGridColumn;
    cxGridColNonAPNama: TcxGridColumn;
    cxGridColNonAPNominal: TcxGridColumn;
    cxGridColNonAPKeterangan: TcxGridColumn;
    cbbJenisTransaksi: TcxComboBox;
    lblNoBG: TLabel;
    edNoBG: TcxTextEdit;
    edTglJthTempo: TcxDateEdit;
    lblTglJthTempo: TLabel;
    lblJenisTransaksi: TLabel;
    procedure actCetakExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionBaruExecute(Sender: TObject);
    procedure ActionHapusExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
    procedure btnLoadARClick(Sender: TObject);
    procedure cbbRekBankExit(Sender: TObject);
    procedure cxGridTableAPEditing(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; var AAllow: Boolean);
    procedure edTglBuktiExit(Sender: TObject);
    procedure cxGridDBTableOverviewCellDblClick(Sender: TcxCustomGridTableView;
        ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
        TShiftState; var AHandled: Boolean);
    procedure cbbCustomerPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridColAPPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridTableAPDataControllerAfterInsert(
      ADataController: TcxCustomDataController);
    procedure cxGridTableAPDataControllerAfterDelete(
      ADataController: TcxCustomDataController);
    procedure cxGridTableNonAPDataControllerAfterInsert(
      ADataController: TcxCustomDataController);
    procedure cxGridTableNonAPDataControllerAfterDelete(
      ADataController: TcxCustomDataController);
    procedure cxGridColNonAPKodePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridColNonAPNamaPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    FCDSAccountPengeluaranKasLain: tclientDataSet;
    FCDSAP: TClientDataSet;
    FCDSRekBank: TClientDataSet;
    FPengeluaranKas: TPengeluaranKas;
    function GetPengeluaranKas: TPengeluaranKas;
    function GetTotalNominalGrid: Double;
    procedure InisialisasiAccount;
    procedure InisialisasiCBBSupplier;
    procedure InisialisasiRekBank;
    procedure LoadDataAPSupplier(AIDSupplier : String);
    procedure SetUser;
    procedure UpdatePengeluaranKasAPs;
    procedure UpdatePengeluaranKasNonAPs;
    property CDSRekBank: TClientDataSet read FCDSRekBank write FCDSRekBank;
    property PengeluaranKas: TPengeluaranKas read GetPengeluaranKas write
        FPengeluaranKas;
    { Private declarations }
  public
    destructor Destroy; override;
    procedure LoadData(AID : String);
    { Public declarations }
  end;

var
  frmPengeluaranKas: TfrmPengeluaranKas;

implementation
uses uAR;

{$R *.dfm}

destructor TfrmPengeluaranKas.Destroy;
begin
  inherited;
  FreeAndNil(FPengeluaranKas);
end;

procedure TfrmPengeluaranKas.actCetakExecute(Sender: TObject);
var
  lcds: TFDJSONDataSets;
//  lcds: TClientDataSet;
begin
  inherited;

  with dmReport do
  begin
    AddReportVariable('UserCetak', User);

    if cxPCData.ActivePageIndex = 0 then
      lcds := ClientDataModule.ServerPengeluaranKasClient.RetrieveCDSlip(dtpAwal.DateTime, dtpAkhir.DateTime, ClientDataModule.Cabang, '%')
    else
      lcds := ClientDataModule.ServerPengeluaranKasClient.RetrieveCDSlip(dtpAwal.DateTime, dtpAkhir.DateTime, ClientDataModule.Cabang, PengeluaranKas.NoBukti);


    ExecuteReport( 'Reports/Slip_PengeluaranKas' ,
      lcds

    );
  end;
end;

procedure TfrmPengeluaranKas.FormCreate(Sender: TObject);
begin
  inherited;
  InisialisasiCBBSupplier;
  InisialisasiRekBank;
  InisialisasiAccount;

  ActionBaruExecute(Sender);

end;

procedure TfrmPengeluaranKas.ActionBaruExecute(Sender: TObject);
begin
  inherited;
  LoadData('');
end;

procedure TfrmPengeluaranKas.ActionHapusExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Anda yakin akan menghapus data ?') then
    Exit;

  if ClientDataModule.ServerPengeluaranKasClient.Delete(PengeluaranKas) then
  begin
    TAppUtils.InformationBerhasilHapus;
    ActionBaruExecute(Sender);
  end;

end;

procedure TfrmPengeluaranKas.ActionRefreshExecute(Sender: TObject);
var
  lcds: TClientDataSet;
begin
  inherited;
  if chkKonsolidasi1.Checked then
    lcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.RetrivePengeluaranKas(dtpAwal.DateTime, dtpAkhir.DateTime, nil), cxGridDBTableOverview)
  else
    lcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.RetrivePengeluaranKas(dtpAwal.DateTime, dtpAkhir.DateTime, ClientDataModule.Cabang), cxGridDBTableOverview);

  cxGridDBTableOverview.SetDataset(lcds, True);
  cxGridDBTableOverview.SetVisibleColumns(['ID', 'CABANGID'], False);
  cxGridDBTableOverview.ApplyBestFit();
end;

procedure TfrmPengeluaranKas.ActionSimpanExecute(Sender: TObject);
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

  PengeluaranKas.Cabang         := TCabang.CreateID(ClientDataModule.Cabang.ID);
  PengeluaranKas.RekBank        := TRekBank.CreateID(cbbRekBank.EditValue);
  PengeluaranKas.Keterangan     := memKeterangan.Text;
  PengeluaranKas.NoBukti        := edNoBukti.Text;
  PengeluaranKas.TglBukti       := edTglBukti.Date;
  PengeluaranKas.Nominal        := edNominal.Value;
  PengeluaranKas.Penerima       := TSupplier.CreateID(cbbCustomer.EditValue);
  PengeluaranKas.Petugas        := edPenerima.Text;
  PengeluaranKas.JenisTransaksi := cbbJenisTransaksi.Text;
  PengeluaranKas.NoBG           := edNoBG.Text;
  PengeluaranKas.JthTempoBG     := edTglJthTempo.Date;

  UpdatePengeluaranKasAPs;
  UpdatePengeluaranKasNonAPs;

  if ClientDataModule.ServerPengeluaranKasClient.Save(PengeluaranKas) then
  begin
    TAppUtils.InformationBerhasilSimpan;
    ActionBaruExecute(Sender);
  end;


end;

procedure TfrmPengeluaranKas.btnLoadARClick(Sender: TObject);
//var
//  iBaris: Integer;
//  lds: TDataset;
begin
  inherited;
//  if cbbCustomer.EditValue = null then
//  begin
//    TAppUtils.Warning('Salesman/Pembeli Belum Dipilih');
//    Exit;
//  end;
//
//  lds := ClientDataModule.ServerLaporanClient.RetriveAR(TSupplier.CreateID(cbbCustomer.EditValue));
//  try
//    cxGridTableAP.ClearRows;
//
//    while not lds.Eof do
//    begin
//      cxGridTableAP.DataController.RecordCount := cxGridTableAP.DataController.RecordCount + 1;
//      iBaris :=cxGridTableAP.DataController.RecordCount - 1;
//
//      cxGridTableAP.SetValue(iBaris,cxgrdclmnARID.Index, lds.FieldByName('ID').AsString);
//      cxGridTableAP.SetValue(iBaris,cxgrdclmnARNo.Index, lds.FieldByName('NoBukti').AsString);
//      cxGridTableAP.SetValue(iBaris,cxgrdclmnNominal.Index, lds.FieldByName('Nominal').AsFloat - lds.FieldByName('Terbayar').AsFloat);
//      cxGridTableAP.SetValue(iBaris,cxgrdclmnBayar.Index, lds.FieldByName('Nominal').AsFloat - lds.FieldByName('Terbayar').AsFloat);
//
//      lds.Next;
//    end;
//
//    cxGridTableAP.ApplyBestFit();
//    SetStatusNominal;
//  finally
//    lds.Free;
//  end;
end;

procedure TfrmPengeluaranKas.cbbCustomerPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  LoadDataAPSupplier(cbbCustomer.EditValue);
  cxGridTableAP.ClearRows;
end;

procedure TfrmPengeluaranKas.cbbRekBankExit(Sender: TObject);
begin
  inherited;
  edAlamatBank.Text := CDSRekBank.FieldByName('alamat').AsString;
  edNoRek.Text      := CDSRekBank.FieldByName('norek').AsString;
end;

procedure TfrmPengeluaranKas.cxGridColAPPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  cxGridTableAP.SetValue(cxGridTableAP.FocusedIndex, cxGridColNominal.Index, FCDSAP.FieldByName('sisa').AsFloat);
  cxGridTableAP.SetValue(cxGridTableAP.FocusedIndex, cxGridColBayar.Index, FCDSAP.FieldByName('sisa').AsFloat);
end;

procedure TfrmPengeluaranKas.cxGridColNonAPKodePropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  cxGridTableNonAP.SetValue(cxGridTableNonAP.FocusedIndex,cxGridColNonAPNama.Index, FCDSAccountPengeluaranKasLain.FieldByName('ID').AsString);
end;

procedure TfrmPengeluaranKas.cxGridColNonAPNamaPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  cxGridTableNonAP.SetValue(cxGridTableNonAP.FocusedIndex,cxGridColNonAPKode.Index, FCDSAccountPengeluaranKasLain.FieldByName('ID').AsString);
end;

procedure TfrmPengeluaranKas.cxGridDBTableOverviewCellDblClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  LoadData(cxGridDBTableOverview.DS.FieldByName('ID').AsString);
end;

procedure TfrmPengeluaranKas.cxGridTableAPDataControllerAfterDelete(
  ADataController: TcxCustomDataController);
begin
  inherited;
  edNominal.Value := GetTotalNominalGrid;
end;

procedure TfrmPengeluaranKas.cxGridTableAPDataControllerAfterInsert(
  ADataController: TcxCustomDataController);
begin
  inherited;
  edNominal.Value := GetTotalNominalGrid;
end;

procedure TfrmPengeluaranKas.cxGridTableAPEditing(Sender:
    TcxCustomGridTableView; AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  inherited;
//  AAllow := False;
//  if AItem.Index in [cxgrdclmnBayar.Index,cxgrdclmnKeterangan.Index] then
//    AAllow := True;
end;

procedure TfrmPengeluaranKas.cxGridTableNonAPDataControllerAfterDelete(
  ADataController: TcxCustomDataController);
begin
  inherited;
  edNominal.Value := GetTotalNominalGrid;
end;

procedure TfrmPengeluaranKas.cxGridTableNonAPDataControllerAfterInsert(
  ADataController: TcxCustomDataController);
begin
  inherited;
  edNominal.Value := GetTotalNominalGrid;
end;

procedure TfrmPengeluaranKas.edTglBuktiExit(Sender: TObject);
begin
  inherited;
  if PengeluaranKas.ID = '' then
    edNoBukti.Text := ClientDataModule.ServerPengeluaranKasClient.GenerateNoBukti(edTglBukti.Date, ClientDataModule.Cabang.Kode);
end;

function TfrmPengeluaranKas.GetPengeluaranKas: TPengeluaranKas;
begin
  if FPengeluaranKas = nil then
    FPengeluaranKas := TPengeluaranKas.Create;

  Result := FPengeluaranKas;
end;

function TfrmPengeluaranKas.GetTotalNominalGrid: Double;
var
  i: Integer;
begin
  Result := 0;

  for i := 0 to cxGridTableAP.DataController.RecordCount - 1 do
  begin
    Result := Result + cxGridTableAP.GetDouble(i, cxGridColBayar.Index);
  end;

  for i := 0 to cxGridTableNonAP.DataController.RecordCount - 1 do
  begin
    Result := Result + cxGridTableNonAP.GetDouble(i, cxGridColNonAPNominal.Index);
  end;

end;

procedure TfrmPengeluaranKas.InisialisasiAccount;
begin
  FCDSAccountPengeluaranKasLain := TDBUtils.DSToCDS(ClientDataModule.DSDataCLient.LoadAccountPengeluaranKasLain(), Self);
  TcxExtLookupComboBoxProperties(cxGridColNonAPKode.Properties).LoadFromCDS(FCDSAccountPengeluaranKasLain, 'ID', 'Kode', ['id'], Self);
  TcxExtLookupComboBoxProperties(cxGridColNonAPNama.Properties).LoadFromCDS(FCDSAccountPengeluaranKasLain, 'ID', 'Nama', ['id'], Self);
end;

procedure TfrmPengeluaranKas.InisialisasiCBBSupplier;
var
  lCDSSalesman: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select Nama,Kode,ID from TSupplier';
  lCDSSalesman := TDBUtils.OpenDataset(sSQL);
  cbbCustomer.Properties.LoadFromCDS(lCDSSalesman,'ID','Nama',['ID'],Self);
  cbbCustomer.Properties.SetMultiPurposeLookup;
end;

procedure TfrmPengeluaranKas.InisialisasiRekBank;
var
  sSQL: string;
begin
  sSQL := 'select bank,alamat,norek,namapemegang,id FROM trekbank';
  CDSRekBank := TDBUtils.OpenDataset(sSQL);
  cbbRekBank.Properties.LoadFromCDS(CDSRekBank,'ID','bank',['ID'],Self);
  cbbRekBank.Properties.SetMultiPurposeLookup;
end;

procedure TfrmPengeluaranKas.LoadData(AID : String);
var
  I: Integer;
begin
  FreeAndNil(FPengeluaranKas);
  ClearByTag([0,1]);
  edNoBukti.Text := ClientDataModule.ServerPengeluaranKasClient.GenerateNoBukti(edTglBukti.Date, ClientDataModule.Cabang.Kode);
  SetUser;

  cxGridTableAP.ClearRows;
  cxGridTableNonAP.ClearRows;

  FPengeluaranKas := ClientDataModule.ServerPengeluaranKasClient.Retrieve(AID);
  if FPengeluaranKas = nil then
    Exit;

  if FPengeluaranKas.ID = '' then
    Exit;

  edNoBukti.Text          := FPengeluaranKas.NoBukti;
  edTglBukti.Date         := FPengeluaranKas.TglBukti;
  edPenerima.Text         := FPengeluaranKas.Petugas;
  edNominal.Value         := FPengeluaranKas.Nominal;
  cbbJenisTransaksi.Text  := PengeluaranKas.JenisTransaksi;
  edNoBG.Text             := PengeluaranKas.NoBG;
  edTglJthTempo.Date      := PengeluaranKas.JthTempoBG;


  cbbRekBank.EditValue := FPengeluaranKas.RekBank.ID;
  cbbRekBankExit(nil);

  cbbCustomer.EditValue:= FPengeluaranKas.Penerima.ID;

  memKeterangan.Text   := FPengeluaranKas.Keterangan;

  LoadDataAPSupplier(PengeluaranKas.Penerima.ID);

  cxGridTableAP.ClearRows;
  for I := 0 to PengeluaranKas.PengeluaranKasAPs.Count - 1 do
  begin
    cxGridTableAP.DataController.AppendRecord;
    cxGridTableAP.SetObjectData(PengeluaranKas.PengeluaranKasAPs[i], i);
    cxGridTableAP.SetValue(i, cxGridColNominal.Index, FCDSAP.FieldByName('nominal').AsFloat + PengeluaranKas.PengeluaranKasAPs[i].Nominal);
  end;

  cxGridTableNonAP.ClearRows;
  for I := 0 to PengeluaranKas.PengeluaranKasNonAPs.Count - 1 do
  begin
    cxGridTableNonAP.DataController.AppendRecord;
    cxGridTableNonAP.SetObjectData(PengeluaranKas.PengeluaranKasNonAPs[i], i);
    cxGridTableNonAP.SetValue(i, cxGridColNonAPNama.Index, PengeluaranKas.PengeluaranKasNonAPs[i].Account.ID);
  end;

  cxPCData.ActivePageIndex := 1;

end;

procedure TfrmPengeluaranKas.LoadDataAPSupplier(AIDSupplier : String);
var
  lSupplier: TSupplier;
begin
  lSupplier := TSupplier.CreateID(AIDSupplier);
  try
    FCDSAP := TDBUtils.DSToCDS(ClientDataModule.DSDataCLient.LoadAP(lSupplier), Self);
    TcxExtLookupComboBoxProperties(cxGridColAP.Properties).LoadFromCDS(FCDSAP, 'ID', 'NOBUKTI', ['ID','SUPPLIERID'],Self);
  finally
    lSupplier.Free;
  end;
end;

procedure TfrmPengeluaranKas.SetUser;
begin
  edPenerima.Text := 'AKU';
end;

procedure TfrmPengeluaranKas.UpdatePengeluaranKasAPs;
var
  I: Integer;
  lPKAP: TPengeluaranKasAP;
begin
  PengeluaranKas.PengeluaranKasAPs.Clear;
  for I := 0 to cxGridTableAP.DataController.RecordCount - 1 do
  begin
    lPKAP               := TPengeluaranKasAP.Create;
    cxGridTableAP.LoadObjectData(lPKAP, i);
    lPKAP.AP            := TAP.CreateID(cxGridTableAP.GetString(i, cxGridColAP.Index));

    PengeluaranKas.PengeluaranKasAPs.Add(lPKAP);
  end;
end;

procedure TfrmPengeluaranKas.UpdatePengeluaranKasNonAPs;
var
  I: Integer;
  lPengeluaranKasNonAP: TPengeluaranKasNonAP;
begin
  PengeluaranKas.PengeluaranKasNonAPs.Clear;
  for I := 0 to cxGridTableNonAP.DataController.RecordCount - 1 do
  begin
    lPengeluaranKasNonAP := TPengeluaranKasNonAP.Create;
    cxGridTableNonAP.LoadObjectData(lPengeluaranKasNonAP, i);

    PengeluaranKas.PengeluaranKasNonAPs.Add(lPengeluaranKasNonAP);
  end;
end;

end.
