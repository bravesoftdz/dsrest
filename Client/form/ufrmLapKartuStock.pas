unit ufrmLapKartuStock;

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
  uDBUtils, ClientModule, uModel, ClientClassesUnit, uAppUtils,
  Data.FireDACJSONReflect, uDMReport, cxCurrencyEdit;

type
  TfrmLapKartuStock = class(TfrmDefaultLaporan)
    cbbBarang: TcxExtLookupComboBox;
    Label1: TLabel;
    pnlfOOTER: TPanel;
    edtOTAL: TcxCurrencyEdit;
    lblTotal: TLabel;
    procedure ActionRefreshExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FCDSS: TFDJSONDataSets;
    procedure InisialisasiCBBBarang;
    { Private declarations }
  public
    procedure CetakSlip; override;
    { Public declarations }
  end;

var
  frmLapKartuStock: TfrmLapKartuStock;

implementation

{$R *.dfm}

procedure TfrmLapKartuStock.ActionRefreshExecute(Sender: TObject);
var
  dTotal: double;
  lBarang: TBarang;
  lDS: TClientDataSet;
  lGudang: TGudang;
begin
  inherited;

  lBarang := TBarang.CreateID(cbbBarang.EditValue);
  lGudang := TGudang.CreateID(cbbGudang.EditValue);

  FCDSS := ClientDataModule.ServerLaporanClient.LaporanKartok(dtpAwal.Date, dtpAkhir.Date,lBarang, lGudang);

  lDS := TDBUtils.DSToCDS(TDataSet(TFDJSONDataSetsReader.GetListValue(FCDSS, 1)), Self);

  cxGridDBTableOverview.SetDataset(lDS, True);
  cxGridDBTableOverview.ApplyBestFit();
  cxGridDBTableOverview.SetVisibleColumns(['urutan'], False);

  dTotal := 0;
  while not lDS.Eof do
  begin
    dTotal := dTotal + lDS.FieldByName('qtyin').AsFloat - lDS.FieldByName('qtyout').AsFloat;
    lDS.Next;
  end;

  edtOTAL.Value := dTotal;
  
end;

procedure TfrmLapKartuStock.CetakSlip;
var
  lBarang: TBarang;
  lGudang: TGudang;
begin
  inherited;
  lBarang := TBarang.CreateID(cbbBarang.EditValue);
  lGudang := TGudang.CreateID(cbbGudang.EditValue);

  FCDSS := ClientDataModule.ServerLaporanClient.LaporanKartok(dtpAwal.Date, dtpAkhir.Date,lBarang, lGudang);
  with dmReport do
  begin
    AddReportVariable('UserCetak', UserAplikasi.UserName);

    ExecuteReport( 'Reports/Lap_Kartok' ,
      FCDSS
    );
  end;

end;

procedure TfrmLapKartuStock.FormShow(Sender: TObject);
begin
  inherited;
  InisialisasiCBBBarang;
end;

procedure TfrmLapKartuStock.InisialisasiCBBBarang;
var
  lCDSBarang: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select id,Nama,SKU from TBarang';
  lCDSBarang := TDBUtils.OpenDataset(sSQL);
  cbbBarang.Properties.LoadFromCDS(lCDSBarang,'ID','Nama',['ID'],Self);
  cbbBarang.Properties.SetMultiPurposeLookup;
end;

end.
