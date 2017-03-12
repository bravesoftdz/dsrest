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
  uPenjualan, uDBUtils, uAppUtils, Vcl.Menus, cxCalc;

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
    cxgrdclmnGridTablePenjualanColumnKonversi: TcxGridColumn;
    pmHarga: TPopupMenu;
    Umum1: TMenuItem;
    Bengkel1: TMenuItem;
    Keliling1: TMenuItem;
    Grosir1: TMenuItem;
    lblJenisPembayaran: TLabel;
    cbbJenisPembayaran: TcxComboBox;
    lblTempo: TLabel;
    edTempo: TcxCalcEdit;
    procedure FormCreate(Sender: TObject);
    procedure ActionBaruExecute(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
    procedure Bengkel1Click(Sender: TObject);
    procedure cxgrdclmnGridTablePenjualanColumnSatuanPropertiesInitPopup(
      Sender: TObject);
    procedure cxgrdclmnGridTablePenjualanColumnNamaPropertiesValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxgrdclmnGridTablePenjualanColumnQtyPropertiesValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxgrdclmnGridTablePenjualanColumnDiskonPropertiesValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxgrdclmnGridTablePenjualanColumnPPNPropertiesValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure Grosir1Click(Sender: TObject);
    procedure Keliling1Click(Sender: TObject);
    procedure Umum1Click(Sender: TObject);
    procedure edTempoPropertiesChange(Sender: TObject);
    procedure edTglBuktiPropertiesChange(Sender: TObject);
  private
    FPenjualan: TPenjualan;
    function GetPenjualan: TPenjualan;
    procedure HitungNilaiNilaiPerBaris(dNilai: Double; Acolumn : Integer);
    procedure InisialisasiCBBSalesman;
    procedure InisialisasiCBBGudang;
    procedure InisialisasiCBBSKU;
    procedure InisialisasiCBBUOM;
    { Private declarations }
  protected
    function getDefaultHarga: string; virtual;
    function JenisPenjualan: string; virtual;
    procedure SetHarga(AJenisHarga : String);
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

procedure TfrmPenjualan.cxgrdclmnGridTablePenjualanColumnDiskonPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  dNilai: Double;
begin
  inherited;
  dNilai := DisplayValue;
  HitungNilaiNilaiPerBaris(dNilai, cxgrdclmnGridTablePenjualanColumnDiskon.Index);
end;

procedure TfrmPenjualan.cxgrdclmnGridTablePenjualanColumnNamaPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  iBaris: Integer;
  lDSt: TDataset;
begin
  inherited;
  iBaris := cxGridTablePenjualan.DataController.FocusedRecordIndex;
  lDSt   := (TcxExtLookupComboBoxProperties(cxgrdclmnGridTablePenjualanColumnNama.Properties)).Dataset;

  cxGridTablePenjualan.SetValue(iBaris, cxgrdclmnGridTablePenjualanColumnSKU.Index,lDSt.FieldByName('barang').AsString);
  cxGridTablePenjualan.SetValue(iBaris, cxgrdclmnGridTablePenjualanColumnSatuan.Index,lDSt.FieldByName('uom').AsString);

  cxGridTablePenjualan.SetValue(iBaris, cxgrdclmnGridTablePenjualanColumnHarga.Index,lDSt.FieldByName(getDefaultHarga).AsString);

  cxGridTablePenjualan.SetValue(iBaris, cxgrdclmnGridTablePenjualanColumnKonversi.Index,lDSt.FieldByName('konversi').AsFloat);
end;

procedure TfrmPenjualan.cxgrdclmnGridTablePenjualanColumnPPNPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  dNilai: Double;
begin
  inherited;
  dNilai := DisplayValue;
  HitungNilaiNilaiPerBaris(dNilai, cxgrdclmnGridTablePenjualanColumnPPN.Index);
end;

procedure TfrmPenjualan.cxgrdclmnGridTablePenjualanColumnQtyPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  dNilai: Double;
begin
  inherited;
  dNilai := DisplayValue;
  HitungNilaiNilaiPerBaris(dNilai, cxgrdclmnGridTablePenjualanColumnQty.Index);
end;

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

procedure TfrmPenjualan.edTempoPropertiesChange(Sender: TObject);
begin
  inherited;
  edJthTempo.Date := edTglBukti.Date + edTempo.Value;
end;

procedure TfrmPenjualan.edTglBuktiPropertiesChange(Sender: TObject);
begin
  inherited;
  edJthTempo.Date := edTglBukti.Date + edTempo.Value;
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

    edNoBukti.Text  := GenerateNoBukti(edTglBukti.Date, ClientDataModule.Cabang.Kode + '/PJL');
    cxGridTablePenjualan.ClearRows;

    FreeAndNil(FPenjualan);
  end;
end;

procedure TfrmPenjualan.ActionSimpanExecute(Sender: TObject);
var
  I: Integer;
  lPenjualanItem: TPenjualanItem;
begin
  inherited;
  Penjualan.ID             := FID;
  Penjualan.NoBukti        := edNoBukti.Text;
  Penjualan.Cabang         := TCabang.CreateID(cbbLUCabang.KeyValue);
  Penjualan.Gudang         := TGudang.CreateID(cbbGudang.EditValue);
  Penjualan.JatuhTempo     := edJthTempo.Date;
  Penjualan.TglBukti       := edTglBukti.Date;
  Penjualan.JenisPenjualan := JenisPenjualan;
  Penjualan.Pembeli        := TSupplier.CreateID(cbbSalesman.EditValue);
  Penjualan.Kasir          := 'AKU';
  Penjualan.Keterangan     := memKeterangan.Text;
//  Penjualan.TOP            := fl

  Penjualan.PenjualanItems.Clear;
  for I := 0 to cxGridTablePenjualan.DataController.RecordCount - 1 do
  begin
    lPenjualanItem           := TPenjualanItem.Create;
    lPenjualanItem.Barang    := TBarang.CreateID(cxGridTablePenjualan.GetString(i, cxgrdclmnGridTablePenjualanColumnSKU.Index));
    lPenjualanItem.Diskon    := cxGridTablePenjualan.GetDouble(i, cxgrdclmnGridTablePenjualanColumnDiskon.Index);
    lPenjualanItem.Harga     := cxGridTablePenjualan.GetDouble(i, cxgrdclmnGridTablePenjualanColumnHarga.Index);
    lPenjualanItem.PPN       := cxGridTablePenjualan.GetDouble(i, cxgrdclmnGridTablePenjualanColumnPPN.Index);
    lPenjualanItem.Qty       := cxGridTablePenjualan.GetDouble(i, cxgrdclmnGridTablePenjualanColumnQty.Index);
    lPenjualanItem.Harga     := cxGridTablePenjualan.GetDouble(i, cxgrdclmnGridTablePenjualanColumnHarga.Index);
    lPenjualanItem.UOM       := TUOM.CreateID(cxGridTablePenjualan.GetString(i, cxgrdclmnGridTablePenjualanColumnSatuan.Index));
    lPenjualanItem.Konversi  := cxGridTablePenjualan.GetDouble(i, cxgrdclmnGridTablePenjualanColumnKonversi.Index);
    lPenjualanItem.Penjualan := Penjualan;

    Penjualan.PenjualanItems.Add(lPenjualanItem);
  end;

  if ClientModule.ClientDataModule.ServerPenjualanClient.Save(Penjualan) then
    ActionBaruExecute(Sender);

end;

procedure TfrmPenjualan.Bengkel1Click(Sender: TObject);
begin
  inherited;
  SetHarga('bengkel');
end;

function TfrmPenjualan.getDefaultHarga: string;
begin
  Result := 'keliling';
end;

function TfrmPenjualan.GetPenjualan: TPenjualan;
begin
  if FPenjualan =nil then
    FPenjualan := TPenjualan.Create;

  Result := FPenjualan
end;

procedure TfrmPenjualan.Grosir1Click(Sender: TObject);
begin
  inherited;
  SetHarga('grosir');
end;

procedure TfrmPenjualan.HitungNilaiNilaiPerBaris(dNilai: Double; Acolumn :
    Integer);
var
  dDiskon: Double;
  dHarga: Double;
  dPPN: Double;
  dQty: Double;
begin
  dHarga  := 0;
  dQty    := 0;
  dDiskon := 0;
  dPPN    := 0;

//  Exit;

  with cxGridTablePenjualan do
  begin
    if Acolumn = cxgrdclmnGridTablePenjualanColumnHarga.Index then
    begin
      dHarga  := dNilai;
      dQty    := GetDouble(DataController.FocusedRecordIndex, cxgrdclmnGridTablePenjualanColumnQty.Index);
      dDiskon := GetDouble(DataController.FocusedRecordIndex, cxgrdclmnGridTablePenjualanColumnDiskon.Index);
      dPPN    := GetDouble(DataController.FocusedRecordIndex, cxgrdclmnGridTablePenjualanColumnPPN.Index);
    end else if Acolumn = cxgrdclmnGridTablePenjualanColumnQty.Index then
    begin
      dHarga  := GetDouble(DataController.FocusedRecordIndex, cxgrdclmnGridTablePenjualanColumnHarga.Index);
      dQty    := dNilai;
      dDiskon := GetDouble(DataController.FocusedRecordIndex, cxgrdclmnGridTablePenjualanColumnDiskon.Index);
      dPPN    := GetDouble(DataController.FocusedRecordIndex, cxgrdclmnGridTablePenjualanColumnPPN.Index);
    end else if Acolumn = cxgrdclmnGridTablePenjualanColumnDiskon.Index then
    begin
      dHarga  := GetDouble(DataController.FocusedRecordIndex, cxgrdclmnGridTablePenjualanColumnHarga.Index);
      dQty    := GetDouble(DataController.FocusedRecordIndex, cxgrdclmnGridTablePenjualanColumnQty.Index);
      dDiskon := dNilai;
      dPPN    := GetDouble(DataController.FocusedRecordIndex, cxgrdclmnGridTablePenjualanColumnPPN.Index);
    end else if Acolumn = cxgrdclmnGridTablePenjualanColumnPPN.Index then
    begin
      dHarga  := GetDouble(DataController.FocusedRecordIndex, cxgrdclmnGridTablePenjualanColumnHarga.Index);
      dQty    := GetDouble(DataController.FocusedRecordIndex, cxgrdclmnGridTablePenjualanColumnQty.Index);
      dDiskon := GetDouble(DataController.FocusedRecordIndex, cxgrdclmnGridTablePenjualanColumnDiskon.Index);
      dPPN    := dNilai;
    end;

    SetValue(DataController.FocusedRecordIndex, cxgrdclmnGridTablePenjualanColumnSubTotalRp.Index, dHarga * dQty);
    SetValue(DataController.FocusedRecordIndex, cxgrdclmnGridTablePenjualanColumnDiskonRp.Index, dHarga * dDiskon / 100 * dQty);
    SetValue(DataController.FocusedRecordIndex, cxgrdclmnGridTablePenjualanColumnPPNRp.Index, dHarga * (100 - dDiskon) / 100 * dQty * dPPN / 100);
    SetValue(DataController.FocusedRecordIndex, cxgrdclmnGridTablePenjualanColumnTotal.Index, dHarga * (100 - dDiskon) / 100 * dQty * (dPPN + 100) / 100);
  end;
end;

procedure TfrmPenjualan.InisialisasiCBBSalesman;
var
  lCDSSalesman: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select Nama,Kode,ID from TSupplier where issalesman = 1';
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
//  sSQL := 'select sku, Nama,ID from TBarang';
  sSQL := 'select b.nama, b.sku, c.uom as satuan, a.hargajual as Umum,' +
          ' a.hargajualbengkel as bengkel,' +
          ' a.hargajualkeliling as keliling, a.hargajualgrosir as grosir, ' +
          ' a.konversi, a.id, a.barang, a.uom' +
          ' from tbarangsatuanitem a' +
          ' inner join tbarang b on a.barang = b.id' +
          ' inner join tuom c on a.uom = c.id';

  lCDSSKU := TDBUtils.OpenDataset(sSQL);

  TcxExtLookupComboBoxProperties(cxGridTablePenjualan.Columns[cxgrdclmnGridTablePenjualanColumnNama.Index].Properties).LoadFromCDS(lCDSSKU,'ID','Nama',['ID'],Self);
  TcxExtLookupComboBoxProperties(cxGridTablePenjualan.Columns[cxgrdclmnGridTablePenjualanColumnNama.Index].Properties).SetMultiPurposeLookup();
  TcxExtLookupComboBoxProperties(cxGridTablePenjualan.Columns[cxgrdclmnGridTablePenjualanColumnNama.Index].Properties).cxDBTableGrid.SetVisibleColumns(['SKU','barang','uom','id','KONVERSI'], FALSE);
  TcxExtLookupComboBoxProperties(cxGridTablePenjualan.Columns[cxgrdclmnGridTablePenjualanColumnNama.Index].Properties).cxDBTableGrid.ApplyBestFit();

  sSQL := 'select Nama,sku, ID from TBarang';
  lCDSNama := TDBUtils.OpenDataset(sSQL);
  TcxExtLookupComboBoxProperties(cxGridTablePenjualan.Columns[cxgrdclmnGridTablePenjualanColumnSKU.Index].Properties).LoadFromCDS(lCDSNama,'ID','SKU',['ID'],Self);
  TcxExtLookupComboBoxProperties(cxGridTablePenjualan.Columns[cxgrdclmnGridTablePenjualanColumnSKU.Index].Properties).SetMultiPurposeLookup;

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

procedure TfrmPenjualan.Keliling1Click(Sender: TObject);
begin
  inherited;
  SetHarga('keliling');
end;

procedure TfrmPenjualan.SetHarga(AJenisHarga : String);
var
  dHarga: Double;
  dst: TDataset;
  iBaris: Integer;
begin
  iBaris := cxGridTablePenjualan.DataController.FocusedRecordIndex;
  dst    := ((TcxExtLookupComboBoxProperties(cxgrdclmnGridTablePenjualanColumnNama.Properties).View) as TcxGridDBTableView).DataController.DataSource.DataSet;


  dHarga := dst.FieldByName(AJenisHarga).AsFloat;

  cxGridTablePenjualan.DataController.Values[iBaris, cxgrdclmnGridTablePenjualanColumnHarga.Index] := dHarga;
//  cxGridTablePenjualan.DataController.Values[iBaris, cxgrdclmnGridTablePenjualanColumnHarga.Index] := dHarga;

  HitungNilaiNilaiPerBaris(dHarga, cxgrdclmnGridTablePenjualanColumnHarga.Index);
end;

procedure TfrmPenjualan.Umum1Click(Sender: TObject);
begin
  inherited;
  SetHarga('umum');
end;

end.
