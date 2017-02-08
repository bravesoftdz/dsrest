unit ufrmLapStockSekarang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.ImgList, cxGrid, cxStyles,
  cxClasses, System.Actions, Vcl.ActnList, dxBar, Vcl.ExtCtrls, dxStatusBar,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, uModel, Datasnap.DBClient,
  Datasnap.Provider, cxCurrencyEdit, cxDBExtLookupComboBox, cxContainer,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  Vcl.StdCtrls, dxBarExtDBItems, cxCheckBox, cxBarEditItem, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPrnDlg, dxPgsDlg, dxPSCore, dxPScxGridLnk, dxPScxGridLayoutViewLnk, frxClass;

type
  TfrmLapStockSekarang = class(TfrmDefault)
    cxGridDBTableStockSekarang: TcxGridDBTableView;
    cxgrdlvlGridDBStockSekarangLevel1: TcxGridLevel;
    cxGridDBStockSekarang: TcxGrid;
    dtstprvdrStockSekarang: TDataSetProvider;
    cdsStockSekarang: TClientDataSet;
    cxGridColGridDBTableStockSekarangColumnSKU: TcxGridDBColumn;
    cxGridColGridDBTableStockSekarangColumnNama: TcxGridDBColumn;
    cxGridColGridDBTableStockSekarangColumnUOM: TcxGridDBColumn;
    cxGridColGridDBTableStockSekarangColumnQty: TcxGridDBColumn;
    cxGridColGridDBTableStockSekarangColumnRP: TcxGridDBColumn;
    cxGridDBTableBarang: TcxGridDBTableView;
    cxGridColGridDBTableGridRepTransaksiDBTableViewBarangColumnSKU: TcxGridDBColumn;
    cxGridColGridDBTableGridRepTransaksiDBTableViewBarangColumnNama: TcxGridDBColumn;
    cxGridDBTableUOM: TcxGridDBTableView;
    cxGridColGridDBTableGridRepTransaksiDBTableViewUOMColumnNama: TcxGridDBColumn;
    procedure ActionRefreshExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure InisialisasiCDSBarang;
    procedure InisialisasiCDSUOM;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLapStockSekarang: TfrmLapStockSekarang;

implementation
uses
  uAppUtils, ClientModule, ClientClassesUnit2, uDBUtils,
  System.StrUtils, System.DateUtils;

{$R *.dfm}

procedure TfrmLapStockSekarang.ActionRefreshExecute(Sender: TObject);
var
  lStockSekarang: TStockSekarang;
begin
  inherited;
  with TServerLaporanClient.Create(ClientDataModule.DSRestConnection, False) do
  begin
    lStockSekarang := TStockSekarang.Create;
    try
      if chkKonsolidasi.EditValue then
        dtstprvdrStockSekarang.DataSet := LaporanStockSekarang(nil)
      else
        dtstprvdrStockSekarang.DataSet := LaporanStockSekarang(TCabang.CreateID(cbbLUCabang.KeyValue));

      cdsStockSekarang.Close;
      cdsStockSekarang.Open;

      cxGridDBTableStockSekarang.SetDataset(cdsStockSekarang);
      cxGridColGridDBTableStockSekarangColumnNama.ApplyBestFit();
    finally
      lStockSekarang.Free;
      Free;
    end;
  end;
end;

procedure TfrmLapStockSekarang.FormCreate(Sender: TObject);
begin
  inherited;
  pnlListTransaksi.Visible := False;
  splTransaksi.Visible     := False;

  InisialisasiCDSUOM;
  InisialisasiCDSBarang;

//  cbbLUCabang.EditValue := ClientDataModule.Cabang.ID;
//  cbbLUCabang.Enabled   := ClientDataModule.Cabang.IsHO <> 0;
//  cbbLUCabang.
end;

procedure TfrmLapStockSekarang.InisialisasiCDSBarang;
var
  sSQL: string;
begin
  sSQL := 'Select * from TBarang';
  cxGridDBTableBarang.SetDataset(sSQL);
end;

procedure TfrmLapStockSekarang.InisialisasiCDSUOM;
var
  sSQL: string;
begin
  sSQL := 'Select * from TUOM';
  cxGridDBTableUOM.SetDataset(sSQL);
end;

end.
