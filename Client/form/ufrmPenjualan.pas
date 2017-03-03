unit ufrmPenjualan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxCheckBox, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  System.ImageList, Vcl.ImgList, Datasnap.DBClient, Datasnap.Provider,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, cxClasses, System.Actions, Vcl.ActnList, dxBar, dxBarExtItems,
  cxBarEditItem, dxBarExtDBItems, Vcl.ExtCtrls, dxStatusBar,
  cxDBExtLookupComboBox, cxCurrencyEdit, cxContainer, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxGridLevel, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxMemo, cxMaskEdit, cxCalendar, cxTextEdit, Vcl.StdCtrls, ClientModule,
  uPenjualan, uDBUtils, uAppUtils;

type
  TfrmPenjualan = class(TfrmDefault)
    pnlInput: TPanel;
    pgcHeader: TPageControl;
    tsHeader: TTabSheet;
    lblNoBukti: TLabel;
    lblTglBukti: TLabel;
    lblSupplier: TLabel;
    lblKeterangan: TLabel;
    lblGudang: TLabel;
    edNoBukti: TcxTextEdit;
    edTglBukti: TcxDateEdit;
    memKeterangan: TcxMemo;
    cbbSalesman: TcxExtLookupComboBox;
    cbbGudang: TcxExtLookupComboBox;
    pgcDetail: TPageControl;
    tsDetailPenerimaan: TTabSheet;
    cxGridDBPenjualan: TcxGrid;
    cxGridTablePenjualan: TcxGridTableView;
    cxgrdclmnGridTablePenjualanColumnSKU: TcxGridColumn;
    cxgrdclmnGridTablePenjualanColumnNama: TcxGridColumn;
    cxgrdclmnGridTablePenjualanColumnSatuan: TcxGridColumn;
    cxgrdclmnGridTablePenjualanColumnHarga: TcxGridColumn;
    cxgrdclmnGridTablePenjualanColumnQty: TcxGridColumn;
    cxgrdclmnGridTablePenjualanColumnDiskon: TcxGridColumn;
    cxgrdclmnGridTablePenjualanColumnPPN: TcxGridColumn;
    cxgrdclmnGridTablePenjualanColumnSubTotalRp: TcxGridColumn;
    cxgrdclmnGridTablePenjualanColumnDiskonRp: TcxGridColumn;
    cxgrdclmnGridTablePenjualanColumnPPNRp: TcxGridColumn;
    cxgrdclmnGridTablePenjualanColumnTotal: TcxGridColumn;
    cxgrdlvlPenerimaanBarang: TcxGridLevel;
    lblJthTempo: TLabel;
    edJthTempo: TcxDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure ActionBaruExecute(Sender: TObject);
    procedure cxgrdclmnGridTablePenjualanColumnSatuanPropertiesInitPopup(
      Sender: TObject);
  private
    FPenjualan: TPenjualan;
    function GetPenjualan: TPenjualan;
    procedure InisialisasiCBBSalesman;
    procedure InisialisasiCBBGudang;
    procedure InisialisasiCBBSKU;
    procedure InisialisasiCBBUOM;
    { Private declarations }
  protected
    function JenisPenjualan: string;
  public
    property Penjualan: TPenjualan read GetPenjualan write FPenjualan;
    { Public declarations }
  end;

var
  frmPenjualan: TfrmPenjualan;

implementation

uses
  uModel;

{$R *.dfm}

procedure TfrmPenjualan.cxgrdclmnGridTablePenjualanColumnSatuanPropertiesInitPopup(
  Sender: TObject);
var
  i: Integer;
  lBrg: TBarang;
  lObject: TObject;
  sIDBarang: string;
begin
  inherited;
  sIDBarang := cxGridTablePenjualan.GetString(cxGridTablePenjualan.DataController.FocusedRecordIndex, cxgrdclmnGridTablePenjualanColumnSKU.Index);
  if sIDBarang = '' then
    Exit;

  with (TcxExtLookupComboBoxProperties(cxgrdclmnGridTablePenjualanColumnSatuan.Properties).View as TcxGridDBTableView).DataController.Filter do
  begin
    BeginUpdate;
    lBrg := TBarang.Create;
    TDBUtils.LoadFromDB(lBrg, sIDBarang);
    try
      Root.Clear;
      Root.BoolOperatorKind :=  fboOr;
      for i := 0 to lBrg.BarangSatuanItems.Count - 1 do
      begin
       lObject := (TcxExtLookupComboBoxProperties(cxgrdclmnGridTablePenjualanColumnSatuan.Properties).View as TcxGridDBTableView).Columns[1];
       Root.AddItem(lObject, foEqual,lBrg.BarangSatuanItems[i].UOM.ID, lBrg.BarangSatuanItems[i].UOM.ID);
      end;

     DataController.Filter.Active := True;

    finally
      EndUpdate;
      lBrg.Free;
    end;
  end;
end;

procedure TfrmPenjualan.FormCreate(Sender: TObject);
begin
  inherited;
  InisialisasiCBBSalesman;
  InisialisasiCBBGudang;
  InisialisasiCBBSKU;
  InisialisasiCBBUOM;

  ActionBaruExecute(Sender);
end;

procedure TfrmPenjualan.ActionBaruExecute(Sender: TObject);
begin
  inherited;
  with ClientDataModule.ServerPenjualanClient do
  begin
    FID := '';
    memKeterangan.Clear;
    edTglBukti.Date := Now;
    edJthTempo.Date := edTglBukti.Date + 7;

    edNoBukti.Text  := GenerateNoBukti(edTglBukti.Date, ClientDataModule.Cabang.Kode + '/PB');
    cxGridTablePenjualan.ClearRows;

    FreeAndNil(FPenjualan);
  end;
end;

function TfrmPenjualan.GetPenjualan: TPenjualan;
begin
  if FPenjualan =nil then
    Result := FPenjualan.Create;
end;

procedure TfrmPenjualan.InisialisasiCBBSalesman;
var
  lCDSSalesman: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select Nama,Kode,ID from TSupplier';
  lCDSSalesman := TDBUtils.OpenDataset(sSQL);
  cbbSalesman.Properties.LoadFromCDS(lCDSSalesman,'ID','Nama',['ID'],Self);
  cbbSalesman.Properties.SetMultiPurposeLookup;
end;

procedure TfrmPenjualan.InisialisasiCBBGudang;
var
  lCDSGudang: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select Nama,Kode,ID from TGudang';
  lCDSGudang := TDBUtils.OpenDataset(sSQL);
  cbbGudang.Properties.LoadFromCDS(lCDSGudang,'ID','Nama',['ID'],Self);
  cbbGudang.Properties.SetMultiPurposeLookup;
end;

procedure TfrmPenjualan.InisialisasiCBBSKU;
var
  lCDSSKU: TClientDataSet;
  lCDSNama: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select sku, Nama,ID from TBarang';
  lCDSSKU := TDBUtils.OpenDataset(sSQL);

  TcxExtLookupComboBoxProperties(cxGridTablePenjualan.Columns[cxgrdclmnGridTablePenjualanColumnSKU.Index].Properties).LoadFromCDS(lCDSSKU,'ID','SKU',['ID'],Self);
  TcxExtLookupComboBoxProperties(cxGridTablePenjualan.Columns[cxgrdclmnGridTablePenjualanColumnSKU.Index].Properties).SetMultiPurposeLookup;

  sSQL := 'select Nama,sku, ID from TBarang';
  lCDSNama := TDBUtils.OpenDataset(sSQL);
  TcxExtLookupComboBoxProperties(cxGridTablePenjualan.Columns[cxgrdclmnGridTablePenjualanColumnNama.Index].Properties).LoadFromCDS(lCDSNama,'ID','Nama',['ID'],Self);
  TcxExtLookupComboBoxProperties(cxGridTablePenjualan.Columns[cxgrdclmnGridTablePenjualanColumnNama.Index].Properties).SetMultiPurposeLookup;

end;

procedure TfrmPenjualan.InisialisasiCBBUOM;
var
  lCDSUOM: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select uom,ID from TUOM';
  lCDSUOM := TDBUtils.OpenDataset(sSQL);

  TcxExtLookupComboBoxProperties(cxGridTablePenjualan.Columns[cxgrdclmnGridTablePenjualanColumnSatuan.Index].Properties).LoadFromCDS(lCDSUOM,'ID','UOM',['ID'],Self);
  TcxExtLookupComboBoxProperties(cxGridTablePenjualan.Columns[cxgrdclmnGridTablePenjualanColumnSatuan.Index].Properties).SetMultiPurposeLookup;

end;

function TfrmPenjualan.JenisPenjualan: string;
begin
  Result := 'SALESMAN';
end;

end.
