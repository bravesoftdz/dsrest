unit ufrmGenerateJurnal;

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
  dxStatusBar, ClientModule, uDBUtils, uAppUtils, System.DateUtils,
  uPenerimaanBarang;

type
  TfrmGenerateJurnal = class(TfrmDefault)
    pnlFilterTrans: TPanel;
    lblPeriodeTrans: TLabel;
    dtpFilterJurnal1: TDateTimePicker;
    dtpFilterJurnal2: TDateTimePicker;
    btnactCnPrefixWizard: TcxButton;
    lblSDTrans: TLabel;
    cxGridDBTableSiapJurnal: TcxGridDBTableView;
    cxgrdlvlSiapJurnal: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxgridColSiapJurnalNo: TcxGridDBColumn;
    cxgridColSiapJurnalTglBukti: TcxGridDBColumn;
    cxgridColSiapJurnalKeterangan: TcxGridDBColumn;
    cxgridColSiapJurnalClassName: TcxGridDBColumn;
    cxgridColSiapJurnalAkanDijurnal: TcxGridDBColumn;
    chkCheckAll: TcxCheckBox;
    procedure ActionHapusExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnactCnPrefixWizardClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure chkCheckAllClick(Sender: TObject);
  private
    FCDS: tclientDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGenerateJurnal: TfrmGenerateJurnal;

implementation

{$R *.dfm}

procedure TfrmGenerateJurnal.ActionHapusExecute(Sender: TObject);
var
  I: Integer;
  sNamaKelas: string;
  sNoBukti: string;
begin
  inherited;
  if not TAppUtils.Confirm('Anda yakin akan menghapus jurnal ?') then
    Exit;

  TAppUtils.InisialisasiProgressBar(cxTSInputData, cxGridDBTableSiapJurnal.DataController.RecordCount, 0);
  try
    for I := 0 to cxGridDBTableSiapJurnal.DataController.RecordCount - 1 do
    begin
      if cxGridDBTableSiapJurnal.GetBoolean(i, cxgridColSiapJurnalAkanDijurnal.Index) then
      begin
        TAppUtils.IncStepProgressBar(1);
        cxGridDBTableSiapJurnal.DataController.FocusedRecordIndex := i;
        sNoBukti   := cxGridDBTableSiapJurnal.GetString(i,cxgridColSiapJurnalNo.Index);
        sNamaKelas := cxGridDBTableSiapJurnal.GetString(i,cxgridColSiapJurnalClassName.Index);

        ClientDataModule.ServerPenerimaanBarangClient.DoJournal(sNoBukti, sNamaKelas, 1);
      end;
    end;
  finally
    TAppUtils.FinalisasiProgressBar();
  end;
end;

procedure TfrmGenerateJurnal.ActionRefreshExecute(Sender: TObject);
begin
  inherited;
  Fcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.RetriveJurnal(dtpAwal.DateTime, dtpAkhir.DateTime, nil, ''), cxGridDBTableOverview);
  
  cxGridDBTableOverview.ClearRows;
  cxGridDBTableOverview.SetDataset(FCDS, True);
  cxGridDBTableOverview.SetVisibleColumns(['ID', 'CABANGID'], False);
  cxGridDBTableOverview.ApplyBestFit();

end;

procedure TfrmGenerateJurnal.ActionSimpanExecute(Sender: TObject);
var
  I: Integer;
  sNamaKelas: string;
  sNoBukti: string;
begin
  inherited;
  TAppUtils.InisialisasiProgressBar(cxTSInputData, cxGridDBTableSiapJurnal.DataController.RecordCount, 0);
  try
    for I := 0 to cxGridDBTableSiapJurnal.DataController.RecordCount - 1 do
    begin
      if cxGridDBTableSiapJurnal.GetBoolean(i, cxgridColSiapJurnalAkanDijurnal.Index) then
      begin
        TAppUtils.IncStepProgressBar(1);
        cxGridDBTableSiapJurnal.DataController.FocusedRecordIndex := i;
        sNoBukti   := cxGridDBTableSiapJurnal.GetString(i,cxgridColSiapJurnalNo.Index);
        sNamaKelas := cxGridDBTableSiapJurnal.GetString(i,cxgridColSiapJurnalClassName.Index);

        ClientDataModule.ServerPenerimaanBarangClient.DoJournal(sNoBukti, sNamaKelas, 0);
      end;

    end;
  finally
    TAppUtils.FinalisasiProgressBar();
  end;
end;

procedure TfrmGenerateJurnal.FormCreate(Sender: TObject);
begin
  inherited;
  dtpFilterJurnal1.DateTime := StartOfTheMonth(Now);
  dtpFilterJurnal2.DateTime := EndOfTheMonth(Now);
end;

procedure TfrmGenerateJurnal.btnactCnPrefixWizardClick(Sender: TObject);
var
  lcds: tclientDataSet;
begin
  inherited;
  lcds := TDBUtils.DSToCDS(ClientDataModule.ServerPenerimaanBarangClient.RetrieveDataSiapJurnal(dtpFilterJurnal1.DateTime, dtpFilterJurnal2.DateTime), cxGridDBTableSiapJurnal);

  cxGridDBTableSiapJurnal.SetDataset(lcds, True);
  cxGridDBTableSiapJurnal.SetVisibleColumns(['ID'], False);
  cxGridDBTableSiapJurnal.ApplyBestFit(cxGridDBTableSiapJurnal.Columns[cxGridDBTableSiapJurnal.ColumnCount - 1]);

  chkCheckAll.Caption := 'Pilih Semua';
  cxgridColSiapJurnalAkanDijurnal.Caption := '';

  chkCheckAll.OnClick(Sender);
end;

procedure TfrmGenerateJurnal.btnSimpanClick(Sender: TObject);
//var
//  I: Integer;
//  sNamaKelas: string;
//  sNoBukti: string;
begin
  inherited;
//  for I := 0 to cxGridDBTableSiapJurnal.DataController.RecordCount - 1 do
//  begin
//    if cxGridDBTableSiapJurnal.GetBoolean(i, cxgridColSiapJurnalAkanDijurnal.Index) then
//    begin
//      sNoBukti   := cxGridDBTableSiapJurnal.GetString(i,cxgridColSiapJurnalNo.Index);
//      sNamaKelas := cxGridDBTableSiapJurnal.GetString(i,cxgridColSiapJurnalClassName.Index);
//
//      ClientDataModule.ServerPenerimaanBarangClient.DoJournal(sNoBukti, sNamaKelas);
//    end;
//
//  end;
end;

procedure TfrmGenerateJurnal.chkCheckAllClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  for I := 0 to cxGridDBTableSiapJurnal.DataController.RecordCount - 1 do
  begin
    cxGridDBTableSiapJurnal.DataController.Values[i, cxgridColSiapJurnalAkanDijurnal.Index] := chkCheckAll.Checked;
  end;
end;

end.
