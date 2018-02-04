unit ufrmPenarikanDeposit;

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
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  cxMaskEdit, cxCalendar, cxTextEdit, cxMemo, cxCurrencyEdit,
  uPenarikanDeposit, uSupplier;

type
  TfrmPenarikanDeposit = class(TfrmDefault)
    lblNoBukti: TLabel;
    edNoBukti: TcxTextEdit;
    lblTgl: TLabel;
    dtTanggal: TcxDateEdit;
    lblCustomer: TLabel;
    edKelas: TcxTextEdit;
    cbbSantri: TcxExtLookupComboBox;
    lblNominal: TLabel;
    edNominal: TcxCurrencyEdit;
    lblKeterangan: TLabel;
    memKeterangan: TcxMemo;
    procedure ActionBaruExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
    procedure cbbSantriPropertiesInitPopup(Sender: TObject);
  private
    fcds: TClientDataset;
    FCDSSantri: tclientDataSet;
    FPenarikanDeposit: TPenarikanDeposit;
    function GetCDSSantri: tclientDataSet;
    function GetPenarikanDeposit: TPenarikanDeposit;
    procedure InisialisasiCBBSantri;
    property CDSSantri: tclientDataSet read GetCDSSantri write FCDSSantri;
    { Private declarations }
  public
    procedure LoadDataTransaksi(AID : String); override;
    property PenarikanDeposit: TPenarikanDeposit read GetPenarikanDeposit write
        FPenarikanDeposit;
    { Public declarations }
  end;

var
  frmPenarikanDeposit: TfrmPenarikanDeposit;

implementation

{$R *.dfm}

procedure TfrmPenarikanDeposit.ActionBaruExecute(Sender: TObject);
begin
  inherited;
  LoadDataTransaksi('');
end;

procedure TfrmPenarikanDeposit.FormCreate(Sender: TObject);
begin
  inherited;
  InisialisasiCBBSantri;
end;

procedure TfrmPenarikanDeposit.ActionRefreshExecute(Sender: TObject);
begin
  inherited;
  if chkKonsolidasi1.Checked then
    fcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.RetrivePenerimaanKas(dtpAwal.DateTime, dtpAkhir.DateTime, nil), cxGridDBTableOverview)
  else
    fcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.RetrivePenerimaanKas(dtpAwal.DateTime, dtpAkhir.DateTime, ClientDataModule.Cabang), cxGridDBTableOverview);

  cxGridDBTableOverview.ClearRows;
  cxGridDBTableOverview.SetDataset(fcds, True);
  cxGridDBTableOverview.SetVisibleColumns(['ID', 'CABANGID'], False);
  cxGridDBTableOverview.ApplyBestFit();
end;

procedure TfrmPenarikanDeposit.ActionSimpanExecute(Sender: TObject);
begin
  inherited;
  if not ValidateEmptyCtrl([1]) then
    Exit
  else if edNominal.Value <= 0 then
  begin
    TAppUtils.Warning('Nominal Harus > 0');
    edNominal.SetFocus;
    Exit;
  end;

  PenarikanDeposit.NoBukti    := edNoBukti.Text;
  PenarikanDeposit.Keterangan := memKeterangan.Text;
  PenarikanDeposit.Nominal    := edNominal.Value;
  PenarikanDeposit.Tanggal    := dtTanggal.Date;
  PenarikanDeposit.Santri     := TSupplier.CreateID(cbbSantri.EditValue);

  if ClientDataModule.ServerPenarikanDepositClient.Save(PenarikanDeposit) then
  begin
//    if TAppUtils.ConfirmBerhasilSimpanCetakReport('Slip Deposit') then
//    begin
//      actCetakExecute(Sender);
//    end;

    ActionBaruExecute(Sender);
  end;
end;

procedure TfrmPenarikanDeposit.cbbSantriPropertiesInitPopup(Sender: TObject);
begin
  inherited;
  if Trim(edKelas.Text) = '' then
    CDSSantri.Filtered := False
  else begin
    CDSSantri.Filter   := ' kelas = ' + QuotedStr(Trim(edKelas.Text));
    CDSSantri.Filtered := True;
  end;
end;

function TfrmPenarikanDeposit.GetCDSSantri: tclientDataSet;
var
  sSQL: string;
begin
  if FCDSSantri = nil then
  begin
    sSQL := 'select Nama,Kode,kelas,ID from TSupplier';
    FCDSSantri := TDBUtils.OpenDataset(sSQL);
  end;

  Result := FCDSSantri;
end;

function TfrmPenarikanDeposit.GetPenarikanDeposit: TPenarikanDeposit;
begin
  if FPenarikanDeposit = nil then
    FPenarikanDeposit := TPenarikanDeposit.Create;

  Result := FPenarikanDeposit;
end;

procedure TfrmPenarikanDeposit.InisialisasiCBBSantri;
begin
  cbbSantri.Properties.LoadFromCDS(CDSSantri,'ID','Nama',['ID'],Self);
  cbbSantri.Properties.SetMultiPurposeLookup;
end;

procedure TfrmPenarikanDeposit.LoadDataTransaksi(AID : String);
begin
  inherited;
  if AID = '' then
  begin
    edNoBukti.Text := ClientDataModule.ServerPenarikanDepositClient.GenerateNoBukti(dtTanggal.Date, 'PD');
  end else begin
    FreeAndNil(FPenarikanDeposit);
    FPenarikanDeposit := ClientDataModule.ServerPenarikanDepositClient.Retrieve(AID);

    edNoBukti.Text      := PenarikanDeposit.NoBukti;
    dtTanggal.Date      := PenarikanDeposit.Tanggal;
    cbbSantri.EditValue := PenarikanDeposit.Santri.ID;
    edNominal.Value     := PenarikanDeposit.Nominal;
    memKeterangan.Text  := PenarikanDeposit.Keterangan;
  end;
end;

end.
