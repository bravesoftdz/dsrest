unit ufrmLaporanLabaRugi;

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
  Vcl.StdCtrls, cxButtons, Vcl.ComCtrls, Vcl.ExtCtrls, cxPC, dxStatusBar, uDBUtils, uAppUtils, ClientModule,
  Data.FireDACJSONReflect,
  uModelHelper,uDMReport;

type
  TfrmLaporanLabaRugi = class(TfrmDefaultLaporan)
    procedure ActionRefreshExecute(Sender: TObject);
  private
    FCDSS: TFDJSONDataSets;
    { Private declarations }
  public
    procedure CetakSlip; override;
    { Public declarations }
  end;

var
  frmLaporanLabaRugi: TfrmLaporanLabaRugi;

implementation

{$R *.dfm}

procedure TfrmLaporanLabaRugi.ActionRefreshExecute(Sender: TObject);
var
  lDS: tclientDataSet;
begin
  inherited;
  FCDSS := ClientDataModule.ServerLaporanClient.LaporanLabaRugi(dtpAwal.Date, dtpAkhir.Date);
  lDS := TDBUtils.DSToCDS(TDataSet(TFDJSONDataSetsReader.GetListValue(FCDSS, 1)), Self);

  cxGridDBTableOverview.SetDataset(lDS, True);
  cxGridDBTableOverview.ApplyBestFit();
//  cxGridDBTableOverview.SetVisibleColumns(['urutan','PERIODEAWAL','PERIODEAKHIR','CABANGID','ID','SALESMANID'], False);

end;

procedure TfrmLaporanLabaRugi.CetakSlip;
begin
  inherited;

  with dmReport do
  begin
    AddReportVariable('UserCetak', UserAplikasi.UserName);
    AddReportVariable('P1', FormatDateTime('dd/MM/yyyy', dtpAwal.DateTime));
    AddReportVariable('P2', FormatDateTime('dd/MM/yyyy', dtpAkhir.DateTime));
//    AddReportVariable('ISDETAIL', IntToStr(isdetail));

    FCDSS := ClientDataModule.ServerLaporanClient.LaporanLabaRugi(dtpAwal.Date, dtpAkhir.Date);
    ExecuteReport( 'Reports/LaplabaRugi' ,
      FCDSS
    );
  end;
end;

end.
