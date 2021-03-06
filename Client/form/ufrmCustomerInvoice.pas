unit ufrmCustomerInvoice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxCheckBox, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  System.ImageList, Vcl.ImgList, Datasnap.DBClient, Datasnap.Provider,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, System.Actions, Vcl.ActnList, dxBar, dxBarExtItems,
  cxBarEditItem, dxBarExtDBItems, Vcl.ExtCtrls, dxStatusBar, Vcl.StdCtrls,
  cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, cxMemo, cxDropDownEdit,
  cxCalendar, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  cxTextEdit, uCustomerInvoice,uModel, uAR, uPenjualan,
  cxCurrencyEdit, cxGridLevel, ClientModule, dxBarBuiltInMenu, cxPC, Vcl.Menus,
  cxButtons, uReturSupplier, uSupplier;

type
  TfrmCustomerInvoice = class(TfrmDefault)
    pnlTransaksi: TPanel;
    pnlHeader: TPanel;
    lblNoBukti: TLabel;
    lblCustomer: TLabel;
    lblJatuhTempo: TLabel;
    lblKeterangan: TLabel;
    edNoBukti: TcxTextEdit;
    cbbCustomer: TcxExtLookupComboBox;
    edJthTempo: TcxDateEdit;
    memKeterangan: TcxMemo;
    lblTglBukti: TLabel;
    edTglBukti: TcxDateEdit;
    lblNoPenjualan: TLabel;
    edNoPenjualan: TcxTextEdit;
    cxGridDBPenjualan: TcxGrid;
    cxGridTablePenjualan: TcxGridTableView;
    cxgrdclmnGridTablePenjualanColumnNama: TcxGridColumn;
    cxgrdclmnGridTablePenjualanColumnSKU: TcxGridColumn;
    cxgrdclmnGridTablePenjualanColumnSatuan: TcxGridColumn;
    cxgrdclmnGridTablePenjualanColumnHarga: TcxGridColumn;
    cxgrdclmnGridTablePenjualanColumnQty: TcxGridColumn;
    cxgrdclmnGridTablePenjualanColumnDiskon: TcxGridColumn;
    cxgrdclmnGridTablePenjualanColumnPPN: TcxGridColumn;
    cxgrdclmnGridTablePenjualanColumnSubTotalRp: TcxGridColumn;
    cxgrdclmnGridTablePenjualanColumnDiskonRp: TcxGridColumn;
    cxgrdclmnGridTablePenjualanColumnPPNRp: TcxGridColumn;
    cxgrdclmnGridTablePenjualanColumnTotal: TcxGridColumn;
    cxgrdclmnGridTablePenjualanColumnKonversi: TcxGridColumn;
    cxgrdlvlPenerimaanBarang: TcxGridLevel;
    procedure ActionBaruExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
    procedure edNoPenjualanKeyDown(Sender: TObject; var Key: Word; Shift:
        TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cxgrdclmnGridTablePenjualanColumnHargaPropertiesValidate(
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
    procedure cxGridDBTableOverviewCellDblClick(Sender: TcxCustomGridTableView;
        ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
        TShiftState; var AHandled: Boolean);
    procedure edNoPenjualanDblClick(Sender: TObject);
    procedure edTglBuktiExit(Sender: TObject);
  private
    FCustomerInvoice: TCustomerInvoice;
    FPenjualan: TPenjualan;
    function GetCustomerInvoice: TCustomerInvoice;
    procedure HitungNilaiNilaiPerBaris(dNilai: Double; Acolumn : Integer);
    procedure InisialisasiCBBSalesman;
    procedure InisialisasiCBBSKU;
    procedure InisialisasiCBBUOM;
    procedure LoadDataCIItem(ACustomerInvoice: TCustomerInvoice);
    procedure LoadDataPenjualanItem(APenjualan : TPenjualan);
    property CustomerInvoice: TCustomerInvoice read GetCustomerInvoice write
        FCustomerInvoice;
    { Private declarations }
  public
    procedure LoadDataCI(AID : String);
    procedure LoadDataPenjualan(ANoBuktiPenjualan : String);
    { Public declarations }
  end;

var
  frmCustomerInvoice: TfrmCustomerInvoice;

implementation
uses
  uDBUtils, uAppUtils;

{$R *.dfm}

procedure TfrmCustomerInvoice.ActionBaruExecute(Sender: TObject);
begin
  inherited;
  ClearByTag([0,1]);

  FreeAndNil(FCustomerInvoice);
  FreeAndNil(FPenjualan);

  edTglBukti.Date := Now;
  edJthTempo.Date := Now + 7;
  edNoPenjualan.Clear;

  edNoBukti.Text  := ClientDataModule.ServerCustomerInvoiceClient.GenerateNoBukti(edTglBukti.Date,
                                                                                  ClientDataModule.Cabang.Kode + '/CI');
  cxGridTablePenjualan.ClearRows;
  memKeterangan.Clear;
end;

procedure TfrmCustomerInvoice.ActionRefreshExecute(Sender: TObject);
var
  lcds: TClientDataSet;
begin
  inherited;
  if chkKonsolidasi1.Checked then
    lcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.RetriveCI(dtpAwal.DateTime, dtpAkhir.DateTime, nil), cxGridDBTableOverview)
  else
    lcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.RetriveCI(dtpAwal.DateTime, dtpAkhir.DateTime, ClientDataModule.Cabang), cxGridDBTableOverview);

  cxGridDBTableOverview.SetDataset(lcds, True);
  cxGridDBTableOverview.SetVisibleColumns(['ID', 'CABANGID'], False);
  cxGridDBTableOverview.ApplyBestFit();
end;

procedure TfrmCustomerInvoice.ActionSimpanExecute(Sender: TObject);
var
  lCIPjl: TCustomerInvoicePenjualan;
  I: Integer;
  lCIPjlItem: TCustomerInvoicePenjualanItem;
begin
  inherited;

  if not ValidateEmptyCtrl([1], True) then
    Exit;

  if FPenjualan = nil then
  begin
    TAppUtils.Warning('Data Penjualan Belum Dipilih');
    edNoPenjualan.SetFocus;
    Exit;
  end;

  CustomerInvoice.NoBukti    := edNoBukti.Text;
  CustomerInvoice.TglBukti   := edTglBukti.Date;
  CustomerInvoice.JatuhTempo := edJthTempo.Date;
  CustomerInvoice.Keterangan := memKeterangan.Text;
  CustomerInvoice.Customer   := TSupplier.CreateID(cbbCustomer.EditValue);
//  CustomerInvoice.AR         := TAR.CreateID(cbbCustomer.EditValue);
  CustomerInvoice.Cabang     := TCabang.CreateID(ClientDataModule.Cabang.ID);

  lCIPjl := TCustomerInvoicePenjualan.Create;
  lCIPjl.CustomerInvoice := FCustomerInvoice;
  lCIPjl.Penjualan       := TPenjualan.CreateID(FPenjualan.ID);

  for I := 0 to cxGridTablePenjualan.DataController.RecordCount- 1 do
  begin
    lCIPjlItem            := TCustomerInvoicePenjualanItem.Create;
    lCIPjlItem.Barang     := TBarang.CreateID(cxGridTablePenjualan.GetString(i, cxgrdclmnGridTablePenjualanColumnSKU.Index));
    lCIPjlItem.Diskon     := cxGridTablePenjualan.GetDouble(i, cxgrdclmnGridTablePenjualanColumnDiskon.Index);
    lCIPjlItem.Harga      := cxGridTablePenjualan.GetDouble(i, cxgrdclmnGridTablePenjualanColumnHarga.Index);
    lCIPjlItem.JenisHarga := '';
    lCIPjlItem.Konversi   := cxGridTablePenjualan.GetDouble(i, cxgrdclmnGridTablePenjualanColumnKonversi.Index);
    lCIPjlItem.PPN        := cxGridTablePenjualan.GetDouble(i, cxgrdclmnGridTablePenjualanColumnPPN.Index);
    lCIPjlItem.Qty        := cxGridTablePenjualan.GetDouble(i, cxgrdclmnGridTablePenjualanColumnQty.Index);
    lCIPjlItem.UOM        := TUOM.CreateID(cxGridTablePenjualan.GetString(i, cxgrdclmnGridTablePenjualanColumnSatuan.Index));

    lCIPjl.CustomerInvoicePenjualanItems.Add(lCIPjlItem);
  end;

  CustomerInvoice.CustomerInvoicePenjualans.Add(lCIPjl);

  if ClientDataModule.ServerCustomerInvoiceClient.Save(CustomerInvoice) then
  begin
    TAppUtils.InformationBerhasilSimpan;
    ActionBaruExecute(Sender);
  end;
end;

procedure TfrmCustomerInvoice.cxgrdclmnGridTablePenjualanColumnDiskonPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  dNilai: Double;
begin
  inherited;
  dNilai := DisplayValue;
  HitungNilaiNilaiPerBaris(dNilai, cxgrdclmnGridTablePenjualanColumnDiskon.Index);
end;

procedure TfrmCustomerInvoice.cxgrdclmnGridTablePenjualanColumnHargaPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  dNilai: Double;
begin
  inherited;
  dNilai := DisplayValue;
  HitungNilaiNilaiPerBaris(dNilai, cxgrdclmnGridTablePenjualanColumnHarga.Index);
end;

procedure TfrmCustomerInvoice.cxgrdclmnGridTablePenjualanColumnPPNPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  dNilai: Double;
begin
  inherited;
  dNilai := DisplayValue;
  HitungNilaiNilaiPerBaris(dNilai, cxgrdclmnGridTablePenjualanColumnPPN.Index);
end;

procedure TfrmCustomerInvoice.cxgrdclmnGridTablePenjualanColumnQtyPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  dNilai: Double;
begin
  inherited;
  dNilai := DisplayValue;
  HitungNilaiNilaiPerBaris(dNilai, cxgrdclmnGridTablePenjualanColumnQty.Index);
end;

procedure TfrmCustomerInvoice.cxGridDBTableOverviewCellDblClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  LoadDataCI(cxGridDBTableOverview.DS.FieldByName('ID').AsString);
  cxPCData.ActivePageIndex := 1;
end;

procedure TfrmCustomerInvoice.edNoPenjualanDblClick(Sender: TObject);
begin
  inherited;
  edNoPenjualan.Text := 'NUS/PJL/201703/0005';
end;

procedure TfrmCustomerInvoice.edNoPenjualanKeyDown(Sender: TObject; var Key:
    Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    LoadDataPenjualan(edNoPenjualan.Text);
  end;
end;

procedure TfrmCustomerInvoice.edTglBuktiExit(Sender: TObject);
begin
  inherited;
  if FPenjualan.ID = '' then
    edNoBukti.Text  := ClientDataModule.ServerCustomerInvoiceClient.GenerateNoBukti(edTglBukti.Date,
                                                                                  ClientDataModule.Cabang.Kode + '/CI');

end;

procedure TfrmCustomerInvoice.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(FCustomerInvoice);
  FreeAndNil(FPenjualan);
end;

procedure TfrmCustomerInvoice.FormShow(Sender: TObject);
begin
  inherited;
  InisialisasiCBBSalesman;
  InisialisasiCBBSKU;
  InisialisasiCBBUOM;

  ActionBaruExecute(Sender);
end;

function TfrmCustomerInvoice.GetCustomerInvoice: TCustomerInvoice;
begin
  if FCustomerInvoice =nil then
    FCustomerInvoice := TCustomerInvoice.Create;

  Result := FCustomerInvoice;
end;

procedure TfrmCustomerInvoice.HitungNilaiNilaiPerBaris(dNilai: Double; Acolumn
    : Integer);
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

procedure TfrmCustomerInvoice.InisialisasiCBBSalesman;
var
  lCDSSalesman: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select Nama,Kode,ID from TSupplier where issalesman = 1';
  lCDSSalesman := TDBUtils.OpenDataset(sSQL);
  cbbCustomer.Properties.LoadFromCDS(lCDSSalesman,'ID','Nama',['ID'],Self);
  cbbCustomer.Properties.SetMultiPurposeLookup;
end;

procedure TfrmCustomerInvoice.InisialisasiCBBSKU;
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

procedure TfrmCustomerInvoice.InisialisasiCBBUOM;
var
  lCDSUOM: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select uom,ID from TUOM';
  lCDSUOM := TDBUtils.OpenDataset(sSQL);

  TcxExtLookupComboBoxProperties(cxGridTablePenjualan.Columns[cxgrdclmnGridTablePenjualanColumnSatuan.Index].Properties).LoadFromCDS(lCDSUOM,'ID','UOM',['ID'],Self);
  TcxExtLookupComboBoxProperties(cxGridTablePenjualan.Columns[cxgrdclmnGridTablePenjualanColumnSatuan.Index].Properties).SetMultiPurposeLookup;

end;

procedure TfrmCustomerInvoice.LoadDataCI(AID : String);
begin
  FreeAndNil(FCustomerInvoice);
  FCustomerInvoice := ClientDataModule.ServerCustomerInvoiceClient.Retrieve(AID);

  if FCustomerInvoice = nil then
    Exit;

  if FCustomerInvoice.ID = '' then
    Exit;

  edNoBukti.Text := CustomerInvoice.NoBukti;
  edTglBukti.Date := CustomerInvoice.TglBukti;
  edJthTempo.Date := CustomerInvoice.JatuhTempo;
  memKeterangan.Text := CustomerInvoice.Keterangan;
  cbbCustomer.EditValue := CustomerInvoice.Customer.ID;

  FPenjualan := ClientDataModule.ServerPenjualanClient.Retrieve(CustomerInvoice.CustomerInvoicePenjualans[0].Penjualan.ID);
  edNoPenjualan.Text := FPenjualan.NoBukti;

  LoadDataCIItem(FCustomerInvoice);

end;

procedure TfrmCustomerInvoice.LoadDataCIItem(ACustomerInvoice:
    TCustomerInvoice);
var
  I: Integer;
begin
  cxGridTablePenjualan.ClearRows;
  for I := 0 to CustomerInvoice.CustomerInvoicePenjualans[0].CustomerInvoicePenjualanItems.Count - 1 do
  begin
    cxGridTablePenjualan.DataController.RecordCount := i + 1;
    cxGridTablePenjualan.SetValue(i, cxgrdclmnGridTablePenjualanColumnSKU.Index, CustomerInvoice.CustomerInvoicePenjualans[0].CustomerInvoicePenjualanItems[i].Barang.ID);
    cxGridTablePenjualan.SetValue(i, cxgrdclmnGridTablePenjualanColumnNama.Index, CustomerInvoice.CustomerInvoicePenjualans[0].CustomerInvoicePenjualanItems[i].BarangSatuangItemID);
    cxGridTablePenjualan.SetValue(i, cxgrdclmnGridTablePenjualanColumnSatuan.Index, CustomerInvoice.CustomerInvoicePenjualans[0].CustomerInvoicePenjualanItems[i].UOM.ID);
    cxGridTablePenjualan.SetDouble(i, cxgrdclmnGridTablePenjualanColumnHarga.Index, CustomerInvoice.CustomerInvoicePenjualans[0].CustomerInvoicePenjualanItems[i].Harga);
    cxGridTablePenjualan.SetDouble(i, cxgrdclmnGridTablePenjualanColumnQty.Index, CustomerInvoice.CustomerInvoicePenjualans[0].CustomerInvoicePenjualanItems[i].Qty);
    cxGridTablePenjualan.SetDouble(i, cxgrdclmnGridTablePenjualanColumnDiskon.Index,CustomerInvoice.CustomerInvoicePenjualans[0].CustomerInvoicePenjualanItems[i].Diskon);
    cxGridTablePenjualan.SetDouble(i, cxgrdclmnGridTablePenjualanColumnPPN.Index, CustomerInvoice.CustomerInvoicePenjualans[0].CustomerInvoicePenjualanItems[i].PPN);

    cxGridTablePenjualan.DataController.FocusedRecordIndex := i;
    HitungNilaiNilaiPerBaris(FPenjualan.PenjualanItems[i].PPN, cxgrdclmnGridTablePenjualanColumnPPN.Index);
  end;
end;

procedure TfrmCustomerInvoice.LoadDataPenjualan(ANoBuktiPenjualan : String);
begin
  FPenjualan := ClientDataModule.ServerPenjualanClient.RetrieveNoBukti(ANoBuktiPenjualan);
  if FPenjualan = NIL then
    eXIT;

  if FPenjualan.ID = '' then
    eXIT;

  cbbCustomer.EditValue := FPenjualan.Pembeli.ID;
  edJthTempo.Date       := FPenjualan.JatuhTempo;
  edNoPenjualan.Text    := FPenjualan.NoBukti;

  LoadDataPenjualanItem(FPenjualan);
end;

procedure TfrmCustomerInvoice.LoadDataPenjualanItem(APenjualan : TPenjualan);
var
  I: Integer;
begin
  cxGridTablePenjualan.ClearRows;

  if APenjualan = nil then
    Exit;

  for I := 0 to APenjualan.PenjualanItems.Count - 1 do
  begin
    cxGridTablePenjualan.DataController.RecordCount := i + 1;
    cxGridTablePenjualan.SetValue(i,cxgrdclmnGridTablePenjualanColumnNama.Index, APenjualan.PenjualanItems[i].BarangSatuangItemID);


    cxGridTablePenjualan.SetValue(i,cxgrdclmnGridTablePenjualanColumnSKU.Index, APenjualan.PenjualanItems[i].Barang.ID);
    cxGridTablePenjualan.SetValue(i,cxgrdclmnGridTablePenjualanColumnSatuan.Index, APenjualan.PenjualanItems[i].UOM.ID);
    cxGridTablePenjualan.SetValue(i,cxgrdclmnGridTablePenjualanColumnHarga.Index, APenjualan.PenjualanItems[i].Harga);
    cxGridTablePenjualan.SetValue(i,cxgrdclmnGridTablePenjualanColumnQty.Index, APenjualan.PenjualanItems[i].Qty);
    cxGridTablePenjualan.SetValue(i,cxgrdclmnGridTablePenjualanColumnDiskon.Index, APenjualan.PenjualanItems[i].Diskon);
    cxGridTablePenjualan.SetValue(i,cxgrdclmnGridTablePenjualanColumnPPN.Index, APenjualan.PenjualanItems[i].PPN);
    cxGridTablePenjualan.SetValue(i,cxgrdclmnGridTablePenjualanColumnKonversi.Index, APenjualan.PenjualanItems[i].Konversi);

    cxGridTablePenjualan.DataController.FocusedRecordIndex := i;
    HitungNilaiNilaiPerBaris(APenjualan.PenjualanItems[i].PPN,cxgrdclmnGridTablePenjualanColumnPPN.Index);
  end;
end;

end.
