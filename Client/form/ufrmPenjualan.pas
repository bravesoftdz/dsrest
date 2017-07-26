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
  uPenjualan, uDBUtils, uAppUtils, Vcl.Menus, cxCalc, dxBarBuiltInMenu, cxPC,
  cxButtons, uReport, uInterface,uDMReport,Data.FireDACJSONReflect,
  uReturSupplier, uSupplier, ufrmPembayaranPOS;

type
  TfrmPenjualan = class(TfrmDefault)
    pnlInput: TPanel;
    pgcHeader: TPageControl;
    tsHeader: TTabSheet;
    lblNoBukti: TLabel;
    lblTglBukti: TLabel;
    lblSupplier: TLabel;
    lblKeterangan: TLabel;
    lblPembeli: TLabel;
    edNoBukti: TcxTextEdit;
    edTglBukti: TcxDateEdit;
    memKeterangan: TcxMemo;
    cbbSalesman: TcxExtLookupComboBox;
    cbbPembeli: TcxExtLookupComboBox;
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
    btnInvoice: TcxButton;
    lblFee: TLabel;
    cbbFee: TcxComboBox;
    cxgrdclmnGridTablePenjualanColumnJenisHarga: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure ActionBaruExecute(Sender: TObject);
    procedure ActionHapusExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
    procedure actNextTransactionExecute(Sender: TObject);
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
    procedure cxGridDBTableOverviewCellDblClick(Sender: TcxCustomGridTableView;
        ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
        TShiftState; var AHandled: Boolean);
    procedure Grosir1Click(Sender: TObject);
    procedure Keliling1Click(Sender: TObject);
    procedure Umum1Click(Sender: TObject);
    procedure edTempoPropertiesChange(Sender: TObject);
    procedure edTglBuktiPropertiesChange(Sender: TObject);
    procedure cbbJenisPembayaranPropertiesChange(Sender: TObject);
  private
    FCDSPembeli: TClientDataset;
    FCDSSalesman: TClientDataset;
    FInfix: string;
    FPenjualan: TPenjualan;
    function GetPenjualan: TPenjualan;
    procedure HitungNilaiNilaiPerBaris(dNilai: Double; Acolumn : Integer);
    procedure InisialisasiCBBSalesman;
    procedure InisialisasiCBBPembeli;
    procedure InisialisasiCBBSKU;
    procedure InisialisasiCBBUOM;
    function IsPenjualanItemValid: Boolean;
    { Private declarations }
  protected
    function getDefaultHarga: string; virtual;
    function JenisPenjualan: string; virtual;
    procedure SetHarga(AJenisHarga : String);
    procedure SetInfix; virtual;
    property CDSPembeli: TClientDataset read FCDSPembeli write FCDSPembeli;
    property CDSSalesman: TClientDataset read FCDSSalesman write FCDSSalesman;
    property Infix: string read FInfix write FInfix;
  public
    procedure CetakSlip; override;
    procedure LoadData(AID : String); stdcall;
    property Penjualan: TPenjualan read GetPenjualan write FPenjualan;
    { Public declarations }
  end;

var
  frmPenjualan: TfrmPenjualan;

implementation

uses
  uModel, ufrmCustomerInvoice, System.Math;

{$R *.dfm}

procedure TfrmPenjualan.cbbJenisPembayaranPropertiesChange(Sender: TObject);
begin
  inherited;
  if cbbJenisPembayaran.Text = 'CASH' then
  begin
    edTempo.Text := '0';
    edTempo.Enabled := False;
  end else begin
    edTempo.Enabled := True;
  end;
end;

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
  cxGridTablePenjualan.SetValue(iBaris, cxgrdclmnGridTablePenjualanColumnJenisHarga.Index,getDefaultHarga);
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
  InisialisasiCBBPembeli;
  InisialisasiCBBSKU;
  InisialisasiCBBUOM;

  ActionBaruExecute(Sender);

  IsLangsungPrint := True;
end;

procedure TfrmPenjualan.ActionBaruExecute(Sender: TObject);
begin
  inherited;
  SetInfix;

  with ClientDataModule.ServerPenjualanClient do
  begin
    edTglBukti.Date := Now;
    edJthTempo.Date := edTglBukti.Date + 7;
    edNoBukti.Text  := GenerateNoBukti(edTglBukti.Date, ClientDataModule.Cabang.Kode + Infix);

    memKeterangan.Clear;
    cxGridTablePenjualan.ClearRows;

    FreeAndNil(FPenjualan);
  end;
end;

procedure TfrmPenjualan.ActionHapusExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Anda Yakin Akan Menghapus Data ?') then
    Exit;

  if ClientModule.ClientDataModule.ServerPenjualanClient.Delete(Penjualan) then
    ActionBaruExecute(Sender);
end;

procedure TfrmPenjualan.ActionRefreshExecute(Sender: TObject);
var
  lcds: TClientDataSet;
  lDS: TDataset;
begin
  inherited;
  if chkKonsolidasi1.Checked then
    lDS := ClientDataModule.ServerLaporanClient.RetrivePenjualan(dtpAwal.DateTime, dtpAkhir.DateTime, nil)
  else
    lDS := ClientDataModule.ServerLaporanClient.RetrivePenjualan(dtpAwal.DateTime, dtpAkhir.DateTime, ClientDataModule.Cabang);

  lcds := TDBUtils.DSToCDS(lDS, Self);

  if lcds <> nil then
  begin
    lcds.Filter   := 'jenispenjualan = ' + QuotedStr(JenisPenjualan);
    lcds.Filtered := True;
  end;

  cxGridDBTableOverview.SetDataset(lcds, True);
  cxGridDBTableOverview.SetVisibleColumns(['id','cabangid','jenispenjualan', 'salesmanid'], False);
  cxGridDBTableOverview.ApplyBestFit();
end;

procedure TfrmPenjualan.ActionSimpanExecute(Sender: TObject);
var
  I: Integer;
  IsBerhasilSimpan: Boolean;
  lDibayar: Double;
  lPenjualanItem: TPenjualanItem;
begin
  inherited;

  if not ValidateEmptyCtrl([1], True) then
    Exit;

  if not IsPenjualanItemValid then
    Exit;

  if Penjualan.ID = '' then
    edNoBukti.Text  := ClientModule.ClientDataModule.ServerPenjualanClient.GenerateNoBukti(edTglBukti.Date, ClientDataModule.Cabang.Kode + Infix);

  Penjualan.NoBukti        := edNoBukti.Text;
  Penjualan.Cabang         := TCabang.CreateID(ClientDataModule.Cabang.ID);
  Penjualan.JatuhTempo     := edJthTempo.Date;
  Penjualan.TglBukti       := edTglBukti.Date;
  Penjualan.JenisPenjualan := JenisPenjualan;
  Penjualan.JenisPembayaran:= cbbJenisPembayaran.Properties.Items[cbbJenisPembayaran.ItemIndex];

  Penjualan.Salesman       := TSupplier.CreateID(cbbSalesman.EditValue);
  Penjualan.Pembeli        := TSupplier.CreateID(cbbPembeli.EditValue);
  Penjualan.Gudang         := TGudang.CreateID(ClientDataModule.SettingApp.GudangPenjualan.ID);

  Penjualan.Kasir          := 'AKU';
  Penjualan.Keterangan     := memKeterangan.Text;
  Penjualan.Fee            := cbbFee.Properties.Items[cbbFee.ItemIndex];
  Penjualan.TermOfPayment  := Floor(edTempo.Value);

  Penjualan.PenjualanItems.Clear;
  for I := 0 to cxGridTablePenjualan.DataController.RecordCount - 1 do
  begin
    lPenjualanItem           := TPenjualanItem.Create;
    lPenjualanItem.Barang    := TBarang.CreateID(cxGridTablePenjualan.GetString(i, cxgrdclmnGridTablePenjualanColumnSKU.Index));
    lPenjualanItem.Diskon    := cxGridTablePenjualan.GetDouble(i, cxgrdclmnGridTablePenjualanColumnDiskon.Index);
    lPenjualanItem.Harga     := cxGridTablePenjualan.GetDouble(i, cxgrdclmnGridTablePenjualanColumnHarga.Index);
    lPenjualanItem.PPN       := cxGridTablePenjualan.GetDouble(i, cxgrdclmnGridTablePenjualanColumnPPN.Index);
    lPenjualanItem.Qty       := cxGridTablePenjualan.GetDouble(i, cxgrdclmnGridTablePenjualanColumnQty.Index);
    lPenjualanItem.UOM       := TUOM.CreateID(cxGridTablePenjualan.GetString(i, cxgrdclmnGridTablePenjualanColumnSatuan.Index));
    lPenjualanItem.Konversi  := cxGridTablePenjualan.GetDouble(i, cxgrdclmnGridTablePenjualanColumnKonversi.Index);
    lPenjualanItem.JenisHarga:= cxGridTablePenjualan.GetString(i, cxgrdclmnGridTablePenjualanColumnJenisHarga.Index);
    lPenjualanItem.Penjualan := Penjualan;

    Penjualan.PenjualanItems.Add(lPenjualanItem);
  end;

  if cbbJenisPembayaran.Text = 'CASH' then
  begin
    lDibayar         := TfrmPembayaranPOS.Bayar(Penjualan.Total);
    IsBerhasilSimpan := ClientModule.ClientDataModule.ServerPenjualanClient.SaveToDBDibayar(Penjualan,lDibayar);
  end else
    IsBerhasilSimpan := ClientModule.ClientDataModule.ServerPenjualanClient.Save(Penjualan);

  if IsBerhasilSimpan then
  begin
    CetakSlip;
    ActionBaruExecute(Sender);
  end;
end;

procedure TfrmPenjualan.actNextTransactionExecute(Sender: TObject);
begin
  inherited;
  if FPenjualan = nil then
    Exit;

  frmCustomerInvoice := TfrmCustomerInvoice.Create(Application);
  frmCustomerInvoice.ActionBaruExecute(Sender);
  frmCustomerInvoice.LoadDataCI(FPenjualan.NoBukti);
end;

procedure TfrmPenjualan.Bengkel1Click(Sender: TObject);
begin
  inherited;
  SetHarga('bengkel');
end;

procedure TfrmPenjualan.CetakSlip;
var
  lcds: TFDJSONDataSets;
begin
  with dmReport do
  begin
    AddReportVariable('UserCetak', User);

    if cxPCData.ActivePageIndex = 0 then
      lcds := ClientDataModule.ServerPenjualanClient.RetrieveCDSlip(dtpAwal.DateTime, dtpAkhir.DateTime, ClientDataModule.Cabang, '%')
    else
      lcds := ClientDataModule.ServerPenjualanClient.RetrieveCDSlip(dtpAwal.DateTime, dtpAkhir.DateTime, ClientDataModule.Cabang, Penjualan.NoBukti);

    if JenisPenjualan = 'SALESMAN'then
      ExecuteReport('Reports/Slip_Penjualan' ,
        lcds

      )
    else
      ExecuteReport('Reports/Slip_Penjualan_POS' ,
        lcds

      )
  end;
end;

procedure TfrmPenjualan.cxGridDBTableOverviewCellDblClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  LoadData(cxGridDBTableOverview.DS.FieldByName('ID').AsString);
  cxPCData.ActivePageIndex := 1;
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
  sSQL: string;
begin
  sSQL := 'select Nama,Kode,ID from vbusinesspartner where is_salesman = 1';
  CDSSalesman := TDBUtils.OpenDataset(sSQL);
  cbbSalesman.Properties.LoadFromCDS(CDSSalesman,'ID','Nama',['ID'],Self);
  cbbSalesman.Properties.SetMultiPurposeLookup;
end;

procedure TfrmPenjualan.InisialisasiCBBPembeli;
var
  sSQL: string;
begin
  sSQL := 'select * from vbusinesspartner where is_pembeli = 1';
  CDSPembeli := TDBUtils.OpenDataset(sSQL, Self);
  cbbPembeli.Properties.LoadFromCDS(CDSPembeli,'ID','Nama',['ID','is_pembeli','is_salesman','is_supplier'],Self);
  cbbPembeli.Properties.SetMultiPurposeLookup;
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
          ' inner join tbarang b on a.barang = b.id ' +
          ' inner join tuom c on a.uom = c.id ' +
          ' order by b.nama';

  lCDSSKU := TDBUtils.OpenDataset(sSQL);

  TcxExtLookupComboBoxProperties(cxGridTablePenjualan.Columns[cxgrdclmnGridTablePenjualanColumnNama.Index].Properties).LoadFromCDS(lCDSSKU,'ID','Nama',['ID'],Self);
  TcxExtLookupComboBoxProperties(cxGridTablePenjualan.Columns[cxgrdclmnGridTablePenjualanColumnNama.Index].Properties).SetMultiPurposeLookup();
  TcxExtLookupComboBoxProperties(cxGridTablePenjualan.Columns[cxgrdclmnGridTablePenjualanColumnNama.Index].Properties).cxDBTableGrid.SetVisibleColumns(['barang','uom','id','KONVERSI'], FALSE);
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

function TfrmPenjualan.IsPenjualanItemValid: Boolean;
var
  I: Integer;
  j: Integer;
begin
  Result := False;

  for I := 0 to cxGridTablePenjualan.DataController.RecordCount - 1 do
  begin
    cxGridTablePenjualan.DataController.FocusedRecordIndex := i;

    if cxGridTablePenjualan.GetString(i,cxgrdclmnGridTablePenjualanColumnNama.Index) = '' then
    begin
      TAppUtils.Warning('Barang Belum Diisi');
      Exit;
    end;

    if cxGridTablePenjualan.GetDouble(i,cxgrdclmnGridTablePenjualanColumnQty.Index) <= 0 then
    begin
      TAppUtils.Warning('Qty Harus >= 0');
      Exit;
    end;

    for j := i + 1 to cxGridTablePenjualan.DataController.RecordCount - 1 do
    begin
      if cxGridTablePenjualan.GetString(i,cxgrdclmnGridTablePenjualanColumnNama.Index) =
         cxGridTablePenjualan.GetString(j,cxgrdclmnGridTablePenjualanColumnNama.Index)then
      begin
        TAppUtils.Warning('Ada Barang Dan Satuan Double');
        Exit;
      end;
    end;
  end;

  Result := True;

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

procedure TfrmPenjualan.LoadData(AID : String);
var
  i: Integer;
begin
  try
    with ClientDataModule.ServerPenjualanClient do
    begin
      FreeAndNil(FPenjualan);
      FPenjualan := Retrieve(AID);

      if FPenjualan = nil then
        Exit;

      if FPenjualan.ID = '' then
        Exit;

      edNoBukti.Text := Penjualan.NoBukti;
      edTglBukti.Date:= Penjualan.TglBukti;

      if Penjualan.Pembeli.ID <> '' then
        cbbPembeli.EditValue := Penjualan.Pembeli.ID;

      if Penjualan.Salesman.ID <> '' then
        cbbSalesman.EditValue := Penjualan.Salesman.ID;

      memKeterangan.Lines.Text     := Penjualan.Keterangan;
      edTempo.Value                := Penjualan.TermOfPayment;
      cbbJenisPembayaran.ItemIndex := cbbJenisPembayaran.Properties.Items.IndexOf(Penjualan.JenisPembayaran);
      cbbFee.ItemIndex             := cbbFee.Properties.Items.IndexOf(Penjualan.Fee);

      cxGridTablePenjualan.ClearRows;
      for i := 0 to Penjualan.PenjualanItems.Count - 1 do
      begin
        cxGridTablePenjualan.DataController.RecordCount := i + 1;
        cxGridTablePenjualan.SetValue(i, cxgrdclmnGridTablePenjualanColumnSKU.Index, FPenjualan.PenjualanItems[i].Barang.ID);
        cxGridTablePenjualan.SetValue(i, cxgrdclmnGridTablePenjualanColumnNama.Index, FPenjualan.PenjualanItems[i].BarangSatuangItemID);
        cxGridTablePenjualan.SetValue(i, cxgrdclmnGridTablePenjualanColumnSatuan.Index, FPenjualan.PenjualanItems[i].UOM.ID);
        cxGridTablePenjualan.SetDouble(i, cxgrdclmnGridTablePenjualanColumnHarga.Index, FPenjualan.PenjualanItems[i].Harga);
        cxGridTablePenjualan.SetDouble(i, cxgrdclmnGridTablePenjualanColumnQty.Index, FPenjualan.PenjualanItems[i].Qty);
        cxGridTablePenjualan.SetDouble(i, cxgrdclmnGridTablePenjualanColumnDiskon.Index,FPenjualan.PenjualanItems[i].Diskon);
        cxGridTablePenjualan.SetDouble(i, cxgrdclmnGridTablePenjualanColumnPPN.Index, FPenjualan.PenjualanItems[i].PPN);
        cxGridTablePenjualan.SetDouble(i, cxgrdclmnGridTablePenjualanColumnKonversi.Index, FPenjualan.PenjualanItems[i].Konversi);
        cxGridTablePenjualan.SetValue(i, cxgrdclmnGridTablePenjualanColumnJenisHarga.Index, FPenjualan.PenjualanItems[i].JenisHarga);

        cxGridTablePenjualan.DataController.FocusedRecordIndex := i;
        HitungNilaiNilaiPerBaris(FPenjualan.PenjualanItems[i].PPN, cxgrdclmnGridTablePenjualanColumnPPN.Index);


      end;
    end;

//    Result := True;
  except
    raise
  end;
end;

procedure TfrmPenjualan.SetHarga(AJenisHarga : String);
var
  dHarga: Double;
  dst: tclientDataSet;
  iBaris: Integer;
  lCDS: tclientDataSet;
begin
  lCDS := TClientDataSet.Create(Self);
  try
    iBaris := cxGridTablePenjualan.FocusedIndex;

    dst    := tclientDataSet(((TcxExtLookupComboBoxProperties(cxgrdclmnGridTablePenjualanColumnNama.Properties).View) as TcxGridDBTableView).DataController.DataSource.DataSet);
    lCDS.CloneCursor(dst, False);
    lCDS.Filter := 'id = ' + QuotedStr(cxGridTablePenjualan.GetString(iBaris,cxgrdclmnGridTablePenjualanColumnNama.Index ));
    lCDS.Filtered :=True;

    dHarga := lCDS.FieldByName(AJenisHarga).AsFloat;

    cxGridTablePenjualan.DataController.Values[iBaris, cxgrdclmnGridTablePenjualanColumnHarga.Index] := dHarga;
    cxGridTablePenjualan.DataController.Values[iBaris, cxgrdclmnGridTablePenjualanColumnJenisHarga.Index] := AJenisHarga;

    HitungNilaiNilaiPerBaris(dHarga, cxgrdclmnGridTablePenjualanColumnHarga.Index);
  finally

  end;
end;

procedure TfrmPenjualan.SetInfix;
begin
  Infix := '/SLS';
end;

procedure TfrmPenjualan.Umum1Click(Sender: TObject);
begin
  inherited;
  SetHarga('umum');
end;

end.
