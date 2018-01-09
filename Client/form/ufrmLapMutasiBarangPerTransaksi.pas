unit ufrmLapMutasiBarangPerTransaksi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.ImgList, cxGrid, cxStyles,
  cxClasses, System.Actions, Vcl.ActnList, dxBar, Vcl.ExtCtrls, dxStatusBar,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxGridCustomView, cxCurrencyEdit,uAppUtils, ClientModule, ClientClassesUnit,
  Datasnap.Provider, Datasnap.DBClient, uDBUtils, Vcl.StdCtrls, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, dxBarExtDBItems, cxCheckBox, cxBarEditItem, System.ImageList,
  dxBarExtItems, dxBarBuiltInMenu, Vcl.Menus, cxButtons, cxPC, ufrmDefaultLaporan,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, uModel, uDMReport, Data.FireDACJSONReflect;

type
  TfrmLapMutasiBarangPerTransaksi = class(TfrmDefaultLaporan)
    ProvMutasi: TDataSetProvider;
    cdsMutasi: TClientDataSet;
    procedure ActionRefreshExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CetakSlip; override;
    { Public declarations }
  end;

var
  frmLapMutasiBarangPerTransaksi: TfrmLapMutasiBarangPerTransaksi;

implementation
uses
  System.DateUtils;

{$R *.dfm}

procedure TfrmLapMutasiBarangPerTransaksi.ActionRefreshExecute(Sender: TObject);
var
  lcds: TClientDataSet;
begin
  inherited;
  with TServerLaporanClient.Create(ClientDataModule.DSRestConnection, False) do
  begin
    try
      if chkKonsolidasi1.Checked then
        lcds := TDBUtils.DSToCDS(RetriveMutasiBarang(dtpAwal.DateTime, dtpAkhir.DateTime, nil, nil), cxGridDBTableOverview)
      else
        lcds := TDBUtils.DSToCDS(RetriveMutasiBarang(dtpAwal.DateTime, dtpAkhir.DateTime, TCabang.CreateID(cbbCabang.EditValue), TGudang.CreateID(cbbGudang.EditValue)), cxGridDBTableOverview);

      cxGridDBTableOverview.SetDataset(lcds, True);
      cxGridDBTableOverview.SetVisibleColumns(['GUDANG','KODEGUDANG','NAMAGUDANG','KODECABANG','NAMACABANG', 'CABANG'], False);
      cxGridDBTableOverview.ApplyBestFit();
    finally
      Free;
    end;
  end;
end;

procedure TfrmLapMutasiBarangPerTransaksi.CetakSlip;
//var
//  ljson: TFDJSONDataSets;
begin
  inherited;
//  ljson := TFDJSONDataSets.Create;
//
//  TFDJSONDataSetsWriter.ListAdd(ljson, FCDSCabang);
//  TFDJSONDataSetsWriter.ListAdd(ljson, cdsMutasi);
//
//  DMReport.ExecuteReport( 'Reports/MutasiBarang' ,
//      ljson
//
//    );
end;

procedure TfrmLapMutasiBarangPerTransaksi.FormShow(Sender: TObject);
begin
  inherited;
  dtpAwal.Date := StartOfTheMonth(Now);
  dtpAkhir.Date:= Now;
end;

end.
