unit ufrmSetoranKas;

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
  dxStatusBar, uDBUtils, uAppUtils, System.DateUtils, System.StrUtils, ClientModule,
  dxCore, cxDateUtils, cxMemo, cxCurrencyEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, uSetoranModal, uModel;

type
  TfrmSetoranKas = class(TfrmDefault)
    lblNoBukti: TLabel;
    lblTanggal: TLabel;
    lblNominal: TLabel;
    lblTKeterangan: TLabel;
    edNoBukti: TcxTextEdit;
    dtTanggal: TcxDateEdit;
    edNominal: TcxCurrencyEdit;
    memKeteranagan: TcxMemo;
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
    procedure cxGridDBTableOverviewCellDblClick(Sender: TcxCustomGridTableView;
        ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
        TShiftState; var AHandled: Boolean);
    procedure FormShow(Sender: TObject);
  private
    fcds: TClientDataset;
    FSetoranKas: TSetoranModal;
    function GetSetoranKas: TSetoranModal;
    property SetoranKas: TSetoranModal read GetSetoranKas write FSetoranKas;
    { Private declarations }
  public
    procedure LoadDataTransaksi(AID : String); override;
    { Public declarations }
  end;

var
  frmSetoranKas: TfrmSetoranKas;

implementation

{$R *.dfm}

procedure TfrmSetoranKas.ActionRefreshExecute(Sender: TObject);
begin
  inherited;
  if chkKonsolidasi1.Checked then
    fcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.RetriveSetoranModal(dtpAwal.DateTime, dtpAkhir.DateTime, nil), cxGridDBTableOverview)
  else
    fcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.RetriveSetoranModal(dtpAwal.DateTime, dtpAkhir.DateTime, ClientDataModule.Cabang), cxGridDBTableOverview);

  cxGridDBTableOverview.ClearRows;
  cxGridDBTableOverview.SetDataset(fcds, True);
  cxGridDBTableOverview.SetVisibleColumns(['ID', 'CABANGID'], False);
  cxGridDBTableOverview.ApplyBestFit();

end;

procedure TfrmSetoranKas.ActionSimpanExecute(Sender: TObject);
begin
  inherited;
  if SetoranKas.ObjectState = 1 then
    edNoBukti.Text := ClientDataModule.ServerSetoranModalClient.GenerateNoBukti(dtTanggal.Date, 'SM');

  if not ValidateEmptyCtrl([1]) then
    Exit;


  SetoranKas.NoBukti    := edNoBukti.Text;
  SetoranKas.Keterangan := memKeteranagan.Lines.Text;
  SetoranKas.Cabang     := TCabang.CreateID(ClientDataModule.Cabang.ID);
  SetoranKas.Nominal    := edNominal.Value;
  SetoranKas.Tanggal    := dtTanggal.Date;

  if ClientDataModule.ServerSetoranModalClient.Save(SetoranKas) then
  begin
    LoadDataTransaksi('');
    dtTanggal.SetFocus;
    TAppUtils.InformationBerhasilSimpan;
  end;



end;

procedure TfrmSetoranKas.cxGridDBTableOverviewCellDblClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  LoadDataTransaksi(cxGridDBTableOverview.DS.FieldByName('ID').AsString);
  cxPCData.ActivePageIndex := 1;
end;

procedure TfrmSetoranKas.FormShow(Sender: TObject);
begin
  inherited;
  ClearByTag([0,1]);
end;

function TfrmSetoranKas.GetSetoranKas: TSetoranModal;
begin
  if FSetoranKas = nil then
    FSetoranKas := TSetoranModal.Create;

  Result := FSetoranKas;
end;

procedure TfrmSetoranKas.LoadDataTransaksi(AID : String);
begin
  inherited;
  ClearByTag([0,1]);
  FreeAndNil(FSetoranKas);

  if AID = '' then
    Exit;

  FSetoranKas := ClientDataModule.ServerSetoranModalClient.Retrieve(aID);
  if FSetoranKas = nil then
    Exit;

  if FSetoranKas.ID = '' then
    Exit;

  edNoBukti.Text            := SetoranKas.NoBukti;
  edNominal.Value           := SetoranKas.Nominal;
  dtTanggal.Date            := SetoranKas.Tanggal;
  memKeteranagan.Lines.Text := SetoranKas.Keterangan;



end;

end.
