unit ufrmLaporanNeracaSaldo;

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
  ClientModule, uDBUtils, Data.FireDACJSONReflect, uAppUtils, uDMReport;

type
  TfrmLaporanNeracaSaldo = class(TfrmDefaultLaporan)
    procedure ActionRefreshExecute(Sender: TObject);
  private
    FCDSS: TFDJSONDataSets;
    { Private declarations }
  public
    procedure CetakSlip; override;
    { Public declarations }
  end;

var
  frmLaporanNeracaSaldo: TfrmLaporanNeracaSaldo;

implementation

uses
  uModel;

{$R *.dfm}

procedure TfrmLaporanNeracaSaldo.ActionRefreshExecute(Sender: TObject);
var
  iIsKonsolidasi: Integer;
  lDS: TDataSet;
begin
  inherited;
  iIsKonsolidasi := 0;
  if chkKonsolidasi1.Checked then
    iIsKonsolidasi := 1;

  FCDSS := ClientDataModule.ServerLaporanClient.LaporanNeracaSaldo(dtpAwal.Date, dtpAkhir.Date, iIsKonsolidasi, TCabang.CreateID(cbbCabang.EditValue));

  if Sender <> nil then
  begin
    lDS := TDBUtils.DSToCDS(TDataSet(TFDJSONDataSetsReader.GetListValue(FCDSS, 1)), Self);

    cxGridDBTableOverview.SetDataset(lDS, True);
    cxGridDBTableOverview.ApplyBestFit();
  end;

end;

procedure TfrmLaporanNeracaSaldo.CetakSlip;
//var
//  lCabang: TCabang;
begin
  inherited;

//  if FCDSS = nil then
    ActionRefreshExecute(nil);

  with dmReport do
  begin
    AddReportVariable('UserCetak', User);
    AddReportVariable('PeriodeAwal', FormatDateTime('dd/MM/yyyy', dtpAwal.DateTime));
    AddReportVariable('PeriodeAkhir', FormatDateTime('dd/MM/yyyy', dtpAkhir.DateTime));

    ExecuteReport( 'Reports/NeracaSaldo' ,
      FCDSS
    );
  end;
end;

end.
