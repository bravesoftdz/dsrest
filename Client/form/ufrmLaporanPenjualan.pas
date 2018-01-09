unit ufrmLaporanPenjualan;

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
  uAppUtils, ClientModule, uDBUtils, Data.FireDACJSONReflect,
  uModelHelper,uDMReport;

type
  TfrmLaporanPenjualan = class(TfrmDefaultLaporan)
    pmcETAK: TPopupMenu;
    Global1: TMenuItem;
    Rinci1: TMenuItem;
    procedure ActionRefreshExecute(Sender: TObject);
    procedure Global1Click(Sender: TObject);
    procedure Rinci1Click(Sender: TObject);
  private
    FCDSS: TFDJSONDataSets;
    isdetail: Integer;
    { Private declarations }
  public
    procedure CetakSlip; override;
    { Public declarations }
  end;

var
  frmLaporanPenjualan: TfrmLaporanPenjualan;

implementation

uses
  uModel;

{$R *.dfm}

procedure TfrmLaporanPenjualan.ActionRefreshExecute(Sender: TObject);
var
  lCabang: TCabang;
  lDS: TDataSet;
begin
  inherited;
  if VarIsNull(cbbCabang.EditValue) then
  begin
    TAppUtils.Warning('Cabang Belum Dipilih');
    Exit;
  end;

  lCabang := TCabang.CreateID(cbbCabang.EditValue);

  if chkKonsolidasi1.Checked then
    FCDSS := ClientDataModule.ServerLaporanClient.LaporanPenjualanByPembeli(dtpAwal.Date, dtpAkhir.Date,1, lCabang)
  else
    FCDSS := ClientDataModule.ServerLaporanClient.LaporanPenjualanByPembeli(dtpAwal.Date, dtpAkhir.Date,0, lCabang);

  lDS := TDBUtils.DSToCDS(TDataSet(TFDJSONDataSetsReader.GetListValue(FCDSS, 1)), Self);

  cxGridDBTableOverview.SetDataset(lDS, True);
  cxGridDBTableOverview.ApplyBestFit();
  cxGridDBTableOverview.SetVisibleColumns(['urutan','PERIODEAWAL','PERIODEAKHIR','CABANGID','ID','SALESMANID'], False);

end;

procedure TfrmLaporanPenjualan.CetakSlip;
var
  lCabang: TCabang;
begin
  inherited;

  lCabang := TCabang.CreateID(cbbCabang.EditValue);

  if chkKonsolidasi1.Checked then
    FCDSS := ClientDataModule.ServerLaporanClient.LaporanPenjualanByPembeli(dtpAwal.Date, dtpAkhir.Date,1, lCabang)
  else
    FCDSS := ClientDataModule.ServerLaporanClient.LaporanPenjualanByPembeli(dtpAwal.Date, dtpAkhir.Date,0, lCabang);

  with dmReport do
  begin
    AddReportVariable('UserCetak', User);
    AddReportVariable('P1', FormatDateTime('dd/MM/yyyy', dtpAwal.DateTime));
    AddReportVariable('P2', FormatDateTime('dd/MM/yyyy', dtpAkhir.DateTime));
    AddReportVariable('ISDETAIL', IntToStr(isdetail));

    ExecuteReport( 'Reports/LapPenjualanByPembeli' ,
      FCDSS
    );
  end;
end;

procedure TfrmLaporanPenjualan.Global1Click(Sender: TObject);
begin
  inherited;
  isdetail := 0;
  CetakSlip;
end;

procedure TfrmLaporanPenjualan.Rinci1Click(Sender: TObject);
begin
  inherited;
  isdetail := 1;
  CetakSlip;
end;

end.
