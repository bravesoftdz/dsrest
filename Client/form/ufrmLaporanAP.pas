unit ufrmLaporanAP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultLaporan, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu,
  Vcl.Menus, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, System.ImageList, Vcl.ImgList,
  Datasnap.DBClient, Datasnap.Provider, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, System.Actions, Vcl.ActnList, cxCheckBox,
  cxGridLevel, cxClasses, cxGridCustomView, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  Vcl.StdCtrls, cxButtons, Vcl.ComCtrls, Vcl.ExtCtrls, cxPC, dxStatusBar,
  uAppUtils, uModel, uModelHelper, Data.FireDACJSONReflect,
  uDMReport, ClientModule, uDBUtils;

type
  TfrmLaporanAP = class(TfrmDefaultLaporan)
    chkIsTglJthTempo: TcxCheckBox;
    procedure ActionRefreshExecute(Sender: TObject);
  private
    FCDSS: TFDJSONDataSets;
    { Private declarations }
  public
    procedure CetakSlip; override;
    { Public declarations }
  end;

var
  frmLaporanAP: TfrmLaporanAP;

implementation

{$R *.dfm}

procedure TfrmLaporanAP.ActionRefreshExecute(Sender: TObject);
var
  lDS: TClientDataSet;
  lCabang: TCabang;
begin
  inherited;

  lCabang := TCabang.CreateID(cbbCabang.EditValue);

  if chkKonsolidasi1.Checked then
    FCDSS := ClientDataModule.ServerLaporanClient.LaporanAP(dtpAwal.Date, dtpAkhir.Date,nil, chkIsTglJthTempo.Checked)
  else
    FCDSS := ClientDataModule.ServerLaporanClient.LaporanAP(dtpAwal.Date, dtpAkhir.Date,lCabang, chkIsTglJthTempo.Checked);

  lDS := TDBUtils.DSToCDS(TDataSet(TFDJSONDataSetsReader.GetListValue(FCDSS, 1)), Self);

  cxGridDBTableOverview.SetDataset(lDS, True);
  cxGridDBTableOverview.ApplyBestFit();
  cxGridDBTableOverview.SetVisibleColumns(['cabang','supplier'], False);

end;

procedure TfrmLaporanAP.CetakSlip;
var
  lCabang: TCabang;
begin
  inherited;

  lCabang := TCabang.CreateID(cbbCabang.EditValue);

  if chkKonsolidasi1.Checked then
    FCDSS := ClientDataModule.ServerLaporanClient.LaporanAP(dtpAwal.Date, dtpAkhir.Date,nil, chkIsTglJthTempo.Checked)
  else
    FCDSS := ClientDataModule.ServerLaporanClient.LaporanAP(dtpAwal.Date, dtpAkhir.Date,lCabang, chkIsTglJthTempo.Checked);

  with dmReport do
  begin
    AddReportVariable('UserCetak', UserAplikasi.UserName);
    AddReportVariable('PeriodeAwal', FormatDateTime('dd/MM/yyyy', dtpAwal.DateTime));
    AddReportVariable('PeriodeAkhir', FormatDateTime('dd/MM/yyyy', dtpAkhir.DateTime));

    if chkIsTglJthTempo.Checked then
      AddReportVariable('JenisTanggal', 'Tanggal Jatuh Tempo')
    else
      AddReportVariable('JenisTanggal', 'Tanggal AP');

    ExecuteReport( 'Reports/Lap_AP' ,
      FCDSS
    );
  end;
end;

end.
