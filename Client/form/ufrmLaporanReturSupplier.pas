unit ufrmLaporanReturSupplier;

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
  Data.FireDACJSONReflect, uModel, uModelHelper, uAppUtils, uDMReport,
  ClientModule, uDBUtils;

type
  TfrmLaporanReturSupplier = class(TfrmDefaultLaporan)
    procedure ActionRefreshExecute(Sender: TObject);
  private
    FCDSS: TFDJSONDataSets;
    procedure GenerateJSONDatasets;
    { Private declarations }

  public
    procedure CetakSlip; override;
    { Public declarations }
  end;

var
  frmLaporanReturSupplier: TfrmLaporanReturSupplier;

implementation

{$R *.dfm}

procedure TfrmLaporanReturSupplier.ActionRefreshExecute(Sender: TObject);
var
  lDS: tclientDataSet;
begin
  inherited;
  GenerateJSONDatasets;
  lDS := TDBUtils.DSToCDS(TDataSet(TFDJSONDataSetsReader.GetListValue(FCDSS, 1)), Self);

  cxGridDBTableOverview.SetDataset(lDS, True);
  cxGridDBTableOverview.ApplyBestFit();
  cxGridDBTableOverview.SetVisibleColumns(['cabang','URUTAN'], False);

end;

procedure TfrmLaporanReturSupplier.CetakSlip;
begin
  inherited;
  GenerateJSONDatasets();

  with dmReport do
  begin
    AddReportVariable('UserCetak', UserAplikasi.UserName);
    AddReportVariable('PeriodeAwal', FormatDateTime('dd/MM/yyyy', dtpAwal.DateTime));
    AddReportVariable('PeriodeAkhir', FormatDateTime('dd/MM/yyyy', dtpAkhir.DateTime));

    ExecuteReport( 'Reports/Lap_ReturSupplier' ,
      FCDSS
    );
  end;
end;

procedure TfrmLaporanReturSupplier.GenerateJSONDatasets;
var
  lCabang: TCabang;
begin
  inherited;
  if chkKonsolidasi1.Checked then
    FCDSS := ClientDataModule.ServerLaporanClient.LaporanReturSupplier(dtpAwal.Date, dtpAkhir.Date,nil)
  else begin
    lCabang := TCabang.CreateID(cbbCabang.EditValue);
    FCDSS := ClientDataModule.ServerLaporanClient.LaporanReturSupplier(dtpAwal.Date, dtpAkhir.Date,lCabang);
  end;
end;

end.
