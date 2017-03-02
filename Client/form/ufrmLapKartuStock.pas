unit ufrmLapKartuStock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxCheckBox, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  Datasnap.DBClient, Datasnap.Provider, System.ImageList, Vcl.ImgList,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, cxClasses, System.Actions, Vcl.ActnList, cxBarEditItem, dxBar,
  dxBarExtDBItems, Vcl.ExtCtrls, dxStatusBar, cxGridLevel, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, Vcl.StdCtrls, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  uModel, dxBarExtItems;

type
  TfrmLapKartuStock = class(TfrmDefault)
    cxGridDBLapMutasi: TcxGrid;
    cxgrdlvlGridLapMutasiLevelLapMutasi: TcxGridLevel;
    cxGridDBTableKartok: TcxGridDBTableView;
    lblAwal: TLabel;
    edAwal: TcxDateEdit;
    lblSD: TLabel;
    edAkhir: TcxDateEdit;
    lblGudang: TLabel;
    cbbGudang: TcxExtLookupComboBox;
    lblBarang: TLabel;
    cbbBarang: TcxExtLookupComboBox;
    procedure ActionRefreshExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure InisialisasiCBBBarang;
    procedure InisialisasiGudang;
    { Private declarations }
  protected
  public
    { Public declarations }
  end;

var
  frmLapKartuStock: TfrmLapKartuStock;

implementation
uses
  uAppUtils, uDBUtils, System.DateUtils, ClientModule, ClientClassesUnit2;

{$R *.dfm}

procedure TfrmLapKartuStock.ActionRefreshExecute(Sender: TObject);
var
  lBarang: TBarang;
  lCabang: TCabang;
  lDS: TDataset;
  lGudang: TGudang;
begin
  inherited;

  with TServerLaporanClient.Create(ClientDataModule.DSRestConnection) do
  begin
    try
      lBarang := TBarang.CreateID(cbbBarang.EditValue);
      lGudang := TGudang.CreateID(cbbGudang.EditValue);
      lCabang := TCabang.CreateID(cbbLUCabang.KeyValue);

      lDS := LaporanKartok(edAwal.Date, edAkhir.Date,lBarang, lGudang, lCabang);
      cxGridDBTableKartok.SetDataset(lDS, True);
      cxGridDBTableKartok.ApplyBestFit();
      cxGridDBTableKartok.SetVisibleColumns(['urutan'], False);
    finally

    end;
  end;

end;

procedure TfrmLapKartuStock.FormShow(Sender: TObject);
begin
  inherited;
  edAwal.Date := StartOfTheMonth(Now);
  edAkhir.Date:= Now;

  InisialisasiGudang;
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

procedure TfrmLapKartuStock.InisialisasiGudang;
var
  lCDSGudang: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select Nama,Kode,ID from TGudang';
  lCDSGudang := TDBUtils.OpenDataset(sSQL);
  cbbGudang.Properties.LoadFromCDS(lCDSGudang,'ID','Nama',['ID'],Self);
  cbbGudang.Properties.SetMultiPurposeLookup;
end;

end.
