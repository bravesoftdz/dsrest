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
  cxDBLookupEdit, cxDBExtLookupComboBox, cxCurrencyEdit,uModel,uPenerimaanKas,
  uReport, uRekBank;

type
  TfrmPengeluaranKas = class(TfrmDefault)
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
    cxGridTableAP: TcxGridTableView;
    cxgrdclmnARID: TcxGridColumn;
    cxgrdclmnARNo: TcxGridColumn;
    cxgrdclmnNominal: TcxGridColumn;
    cxgrdlvlAR: TcxGridLevel;
    cxgrdclmnBayar: TcxGridColumn;
    btnLoadAR: TcxButton;
    cxgrdlvlDP: TcxGridLevel;
    cxGridTableGridDBAPTableView1: TcxGridTableView;
    lblNominal: TLabel;
    edNominal: TcxCurrencyEdit;
    cxgrdclmnKeterangan: TcxGridColumn;
    cbbRekBank: TcxExtLookupComboBox;
    edNoRek: TcxTextEdit;
    edAlamatBank: TcxTextEdit;
    lblStatusNominal: TLabel;
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
    procedure edNominalPropertiesChange(Sender: TObject);
    procedure cxgrdclmnBayarPropertiesChange(Sender: TObject);
    procedure cxGridDBTableOverviewCellDblClick(Sender: TcxCustomGridTableView;
        ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
        TShiftState; var AHandled: Boolean);
  private
    FCDSRekBank: TClientDataSet;
    FPenerimaanKas: TPenerimaanKas;
    function GetPenerimaanKas: TPenerimaanKas;
    function GetTotalNominalGrid: Double;
    procedure InisialisasiCBBSalesman;
    procedure InisialisasiRekBank;
    procedure SetStatusNominal;
    procedure SetUser;
    property CDSRekBank: TClientDataSet read FCDSRekBank write FCDSRekBank;
    property PenerimaanKas: TPenerimaanKas read GetPenerimaanKas write
        FPenerimaanKas;
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
  FreeAndNil(FPenerimaanKas);
end;

procedure TfrmPengeluaranKas.actCetakExecute(Sender: TObject);
var
  lcds: TClientDataSet;
  lTSReport: TTSReport;
begin
  inherited;
  lTSReport := TTSReport.Create(self);
  try
    with ClientDataModule.ServerPenerimaanKasClient do
    begin
      lcds := TDBUtils.DSToCDS(RetrieveCDSlip(Now-3000, Now + 3000, nil, PenerimaanKas.NoBukti), cxGridTableAP);

      lTSReport.AddDataset(lcds, 'QPenerimaanKas');
      lTSReport.ShowReport('SlipPenerimaanKas');
    end;
  finally
    lTSReport.Free;
  end;

end;

procedure TfrmPengeluaranKas.FormCreate(Sender: TObject);
begin
  inherited;
  InisialisasiCBBSalesman;
  InisialisasiRekBank;

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
  if TAppUtils.Confirm('Anda yakin akan menghapus data ?') then
    Exit;

  if ClientDataModule.ServerPenerimaanKasClient.Delete(PenerimaanKas) then
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
    lcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.RetrivePenerimaanKas(dtpAwal.DateTime, dtpAkhir.DateTime, nil), cxGridDBTableOverview)
  else
    lcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.RetrivePenerimaanKas(dtpAwal.DateTime, dtpAkhir.DateTime, ClientDataModule.Cabang), cxGridDBTableOverview);

  cxGridDBTableOverview.SetDataset(lcds, True);
  cxGridDBTableOverview.SetVisibleColumns(['ID', 'CABANGID'], False);
  cxGridDBTableOverview.ApplyBestFit();
end;

procedure TfrmPengeluaranKas.ActionSimpanExecute(Sender: TObject);
var
  I: Integer;
  lPKAR: TPenerimaanKasAR;
begin
  inherited;
  if not ValidateEmptyCtrl([1]) then
    Exit
  else if edNominal.Value <= 0 then
  begin
    TAppUtils.Warning('Nominal Harus > 0');
    edNominal.SetFocus;
    Exit;
  end else if lblStatusNominal.Caption = 'Beda' then
  begin
    TAppUtils.Warning('Detail Nominal dan Nominal Total Belum Sama');
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

  PenerimaanKas.PenerimaanKasARItems.Clear;
  for I := 0 to cxGridTableAP.DataController.RecordCount - 1 do
  begin
    lPKAR               := TPenerimaanKasAR.Create;
    lPKAR.AR            := TAR.CreateID(cxGridTableAP.GetString(i, cxgrdclmnARID.Index));
    lPKAR.Nominal       := cxGridTableAP.GetDouble(i, cxgrdclmnBayar.Index);
    lPKAR.Keterangan    := cxGridTableAP.GetString(i, cxgrdclmnKeterangan.Index);
    lPKAR.PenerimaanKas := PenerimaanKas;


    PenerimaanKas.PenerimaanKasARItems.Add(lPKAR);
  end;

  if ClientDataModule.ServerPenerimaanKasClient.Save(PenerimaanKas) then
  begin
    TAppUtils.InformationBerhasilSimpan;
    ActionBaruExecute(Sender);
  end;


end;

procedure TfrmPengeluaranKas.btnLoadARClick(Sender: TObject);
var
  iBaris: Integer;
  lds: TDataset;
begin
  inherited;
  if cbbCustomer.EditValue = null then
  begin
    TAppUtils.Warning('Salesman/Pembeli Belum Dipilih');
    Exit;
  end;

  lds := ClientDataModule.ServerLaporanClient.RetriveAR(TSupplier.CreateID(cbbCustomer.EditValue));
  try
    cxGridTableAP.ClearRows;

    while not lds.Eof do
    begin
      cxGridTableAP.DataController.RecordCount := cxGridTableAP.DataController.RecordCount + 1;
      iBaris :=cxGridTableAP.DataController.RecordCount - 1;

      cxGridTableAP.SetValue(iBaris,cxgrdclmnARID.Index, lds.FieldByName('ID').AsString);
      cxGridTableAP.SetValue(iBaris,cxgrdclmnARNo.Index, lds.FieldByName('NoBukti').AsString);
      cxGridTableAP.SetValue(iBaris,cxgrdclmnNominal.Index, lds.FieldByName('Nominal').AsFloat - lds.FieldByName('Terbayar').AsFloat);
      cxGridTableAP.SetValue(iBaris,cxgrdclmnBayar.Index, lds.FieldByName('Nominal').AsFloat - lds.FieldByName('Terbayar').AsFloat);

      lds.Next;
    end;

    cxGridTableAP.ApplyBestFit();
    SetStatusNominal;
  finally
    lds.Free;
  end;
end;

procedure TfrmPengeluaranKas.cbbRekBankExit(Sender: TObject);
begin
  inherited;
  edAlamatBank.Text := CDSRekBank.FieldByName('alamat').AsString;
  edNoRek.Text      := CDSRekBank.FieldByName('norek').AsString;
end;

procedure TfrmPengeluaranKas.cxgrdclmnBayarPropertiesChange(Sender: TObject);
begin
  inherited;
   SetStatusNominal;
end;

procedure TfrmPengeluaranKas.cxGridDBTableOverviewCellDblClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  LoadData(cxGridDBTableOverview.DS.FieldByName('ID').AsString);
end;

procedure TfrmPengeluaranKas.cxGridTableAPEditing(Sender:
    TcxCustomGridTableView; AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  inherited;
//  AAllow := False;
//  if AItem.Index in [cxgrdclmnBayar.Index,cxgrdclmnKeterangan.Index] then
//    AAllow := True;
end;

procedure TfrmPengeluaranKas.edNominalPropertiesChange(Sender: TObject);
begin
  inherited;
  SetStatusNominal;
end;

procedure TfrmPengeluaranKas.edTglBuktiExit(Sender: TObject);
begin
  inherited;
  if PenerimaanKas.ID = '' then
    edNoBukti.Text := ClientDataModule.ServerPenerimaanKasClient.GenerateNoBukti(edTglBukti.Date, ClientDataModule.Cabang.Kode + '/BKM/');
end;

function TfrmPengeluaranKas.GetPenerimaanKas: TPenerimaanKas;
begin
  if FPenerimaanKas = nil then
    FPenerimaanKas := TPenerimaanKas.Create;

  Result := FPenerimaanKas;
end;

function TfrmPengeluaranKas.GetTotalNominalGrid: Double;
var
  i: Integer;
begin
  Result := 0;

  for i := 0 to cxGridTableAP.DataController.RecordCount - 1 do
  begin
    Result := Result + cxGridTableAP.GetDouble(i, cxgrdclmnBayar.Index);
  end;

end;

procedure TfrmPengeluaranKas.InisialisasiCBBSalesman;
var
  lCDSSalesman: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select Nama,Kode,ID from TSupplier where issalesman = 1';
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
//  dNominal: Double;
//  I: Integer;
  iBaris: Integer;
  lds: TDataSet;
begin
  FreeAndNil(FPenerimaanKas);
  ClearByTag([0,1]);
  edNoBukti.Text := ClientDataModule.ServerPenerimaanKasClient.GenerateNoBukti(edTglBukti.Date, ClientDataModule.Cabang.Kode + '/');
  SetUser;

  cxGridTableAP.ClearRows;

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

  lds := ClientDataModule.ServerPenerimaanKasClient.RetrievePenerimaanARs(FPenerimaanKas.ID);
  try
    cxGridTableAP.ClearRows;

    while not lds.Eof do
    begin
      cxGridTableAP.DataController.RecordCount := cxGridTableAP.DataController.RecordCount + 1;
      iBaris :=cxGridTableAP.DataController.RecordCount - 1;

      cxGridTableAP.SetValue(iBaris,cxgrdclmnARID.Index, lds.FieldByName('ar').AsString);
      cxGridTableAP.SetValue(iBaris,cxgrdclmnARNo.Index, lds.FieldByName('NoBukti').AsString);
      cxGridTableAP.SetValue(iBaris,cxgrdclmnNominal.Index, lds.FieldByName('Nominalar').AsFloat - lds.FieldByName('Terbayar').AsFloat + lds.FieldByName('Nominal').AsFloat);
      cxGridTableAP.SetValue(iBaris,cxgrdclmnBayar.Index, lds.FieldByName('Nominal').AsFloat);
      cxGridTableAP.SetValue(iBaris,cxgrdclmnKeterangan.Index, lds.FieldByName('Keterangan').AsString);

      lds.Next;
    end;

    cxGridTableAP.ApplyBestFit();
    SetStatusNominal;
  finally
    lds.Free;
  end;

  cxPCData.ActivePageIndex := 1;

end;

procedure TfrmPengeluaranKas.SetStatusNominal;
begin
  if edNominal.Value = GetTotalNominalGrid then
  begin
    lblStatusNominal.Caption := 'Sama';
    lblStatusNominal.Font.Color := clGreen;
  end else begin
    lblStatusNominal.Caption := 'Beda';
    lblStatusNominal.Font.Color := clRed;
  end;
end;

procedure TfrmPengeluaranKas.SetUser;
begin
  edPenerima.Text := 'AKU';
end;

end.
