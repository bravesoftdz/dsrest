unit ufrmTransferAntarGudang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uModel, uTransferAntarGudang, uAppUtils, uDBUtils,
  ufrmDefault, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, Vcl.Menus, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  System.ImageList, Vcl.ImgList, Datasnap.DBClient, Datasnap.Provider,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  System.Actions, Vcl.ActnList, cxCheckBox, cxGridLevel, cxClasses,
  cxGridCustomView, Vcl.StdCtrls, cxButtons, Vcl.ComCtrls, Vcl.ExtCtrls, cxPC,
  dxStatusBar, uInterface, dxCore, cxDateUtils, cxMemo, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, cxMaskEdit, cxCalendar,
  cxTextEdit, ClientModule, cxCurrencyEdit;

type
  TfrmTransferAntarGudang = class(TfrmDefault, IForm)
    pnlHeader: TPanel;
    lblNoBukti: TLabel;
    lblTglBukti: TLabel;
    lblSupplier: TLabel;
    lblPembeli: TLabel;
    lblKeterangan: TLabel;
    lblPetugas: TLabel;
    edNoBukti: TcxTextEdit;
    edTglBukti: TcxDateEdit;
    cbbGudangAsal: TcxExtLookupComboBox;
    cbbGudangTujuan: TcxExtLookupComboBox;
    memKeterangan: TcxMemo;
    edPetugas: TcxTextEdit;
    cxgrdlvlTAGDetail: TcxGridLevel;
    cxGridDBTAGDetail: TcxGrid;
    cxGridTableTAGDetail: TcxGridTableView;
    cxgrdclmnTAGKodeBarang: TcxGridColumn;
    cxgrdclmnTAGNamaBarang: TcxGridColumn;
    cxgrdclmnTAGUOM: TcxGridColumn;
    cxgrdclmnTAGQty: TcxGridColumn;
    cxgrdclmnTAGKonversi: TcxGridColumn;
    procedure actCetakExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionBaruExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
    procedure cxgrdclmnTAGKodeBarangPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxgrdclmnTAGNamaBarangPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridDBTableOverviewCellDblClick(Sender: TcxCustomGridTableView;
        ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
        TShiftState; var AHandled: Boolean);
  strict private
  private
    FCDSSKU: TClientDataSet;
    FTransferAntarGudang: TTransferAntarGudang;
    function GetTransferAntarGudang: TTransferAntarGudang;
    procedure InisialisasiCBBSKU;
    procedure InisialisasiCBBUOM;
    procedure InisialisasiGudangAsal;
    procedure InisialisasiGudangTujuan;
    function IsDetailTAGValid: Boolean;
    procedure SetCDSSKU(const Value: TClientDataSet);
    procedure SetUOMDanKonversi;
    property CDSSKU: TClientDataSet read FCDSSKU write SetCDSSKU;
    property TransferAntarGudang: TTransferAntarGudang read GetTransferAntarGudang
        write FTransferAntarGudang;
    { Private declarations }
  public
    destructor Destroy; override;
    function LoadData(AID : String): Boolean; stdcall;
    { Public declarations }
  end;

var
  frmTransferAntarGudang: TfrmTransferAntarGudang;

implementation

uses
  uReport;

{$R *.dfm}

procedure TfrmTransferAntarGudang.FormCreate(Sender: TObject);
begin
  inherited;
  InisialisasiGudangTujuan;
  InisialisasiGudangAsal;

  InisialisasiCBBSKU;
  InisialisasiCBBUOM;

  ActionBaruExecute(Sender);
end;

destructor TfrmTransferAntarGudang.Destroy;
begin
  inherited;
  FreeAndNil(FTransferAntarGudang);
end;

procedure TfrmTransferAntarGudang.actCetakExecute(Sender: TObject);
var
  lcds: TClientDataSet;
  lTSReport: TTSReport;
begin
  inherited;
  lTSReport := TTSReport.Create(self);
  try
    with ClientDataModule.ServerTransferAntarGudang do
    begin
      lcds := TDBUtils.DSToCDS(RetrieveCDSlip(Now-3000, Now + 3000, nil, TransferAntarGudang.NoBukti), cxGridTableTAGDetail);

      lTSReport.AddDataset(lcds, 'QTAG');
      lTSReport.ShowReport('SlipTAG');
    end;
  finally
    lTSReport.Free;
  end;

end;

procedure TfrmTransferAntarGudang.ActionBaruExecute(Sender: TObject);
begin
  inherited;
  if LoadData('') then
    cxPCData.ActivePageIndex := 1;
end;

procedure TfrmTransferAntarGudang.ActionRefreshExecute(Sender: TObject);
var
  lcds: TClientDataSet;
begin
  inherited;
  if chkKonsolidasi1.Checked then
    lcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.RetrieveTransferAntarGudang(dtpAwal.DateTime, dtpAkhir.DateTime, nil), cxGridDBTableOverview)
  else
    lcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.RetrieveTransferAntarGudang(dtpAwal.DateTime, dtpAkhir.DateTime, ClientDataModule.Cabang), cxGridDBTableOverview);

  cxGridDBTableOverview.SetDataset(lcds, True);
  cxGridDBTableOverview.SetVisibleColumns(['ID', 'CABANGID'], False);
  cxGridDBTableOverview.ApplyBestFit();
end;

procedure TfrmTransferAntarGudang.ActionSimpanExecute(Sender: TObject);
var
  I: Integer;
  lTransferAntarGudangItem: TTransferAntarGudangItem;
begin
  inherited;

  if not ValidateEmptyCtrl([1]) then
    Exit;

  if cbbGudangAsal.EditValue = cbbGudangTujuan.EditValue then
  begin
    TAppUtils.Warning('Gudang Asal Dan Tujuan Harus Berbeda');
    Exit;
  end;

  if not IsDetailTAGValid then
    Exit;

  if TransferAntarGudang.ObjectState = 1 then
    edNoBukti.Text                   := ClientDataModule.ServerTransferAntarGudang.GenerateNoBukti(edTglBukti.Date, 'TAG');

  TransferAntarGudang.NoBukti      := edNoBukti.Text;
  TransferAntarGudang.TglBukti     := edTglBukti.Date;
  TransferAntarGudang.GudangAsal   := TGudang.CreateID(cbbGudangAsal.EditValue);
  TransferAntarGudang.GudangTujuan := TGudang.CreateID(cbbGudangTujuan.EditValue);
  TransferAntarGudang.Cabang       := TCabang.CreateID(ClientDataModule.Cabang.ID);
  TransferAntarGudang.Petugas      := edPetugas.Text;
  TransferAntarGudang.Keterangan   := memKeterangan.Text;

  TransferAntarGudang.TransferAntarGudangItems.Clear;
  for I := 0 to cxGridTableTAGDetail.DataController.RecordCount - 1 do
  begin
    lTransferAntarGudangItem          := TTransferAntarGudangItem.Create;
    lTransferAntarGudangItem.Barang   := TBarang.CreateID(cxGridTableTAGDetail.GetString(i, cxgrdclmnTAGKodeBarang.Index));
    lTransferAntarGudangItem.UOM      := TUOM.CreateID(cxGridTableTAGDetail.GetString(i, cxgrdclmnTAGUOM.Index));
    lTransferAntarGudangItem.Konversi := cxGridTableTAGDetail.GetDouble(i, cxgrdclmnTAGKonversi.Index);
    lTransferAntarGudangItem.Qty      := cxGridTableTAGDetail.GetDouble(i, cxgrdclmnTAGQty.Index);

    lTransferAntarGudangItem.SetHeaderProperty(TransferAntarGudang);
    TransferAntarGudang.TransferAntarGudangItems.Add(lTransferAntarGudangItem);
  end;

  if ClientDataModule.ServerTransferAntarGudang.SaveTransferAntarGudang(TransferAntarGudang) then
  begin
    TAppUtils.Information('Berhasil Simpan Dengan No Bukti ' + edNoBukti.Text);
    ActionBaruExecute(Sender);
  end;
end;

procedure TfrmTransferAntarGudang.cxgrdclmnTAGKodeBarangPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  cxGridTableTAGDetail.SetValue(cxGridTableTAGDetail.DataController.FocusedRecordIndex, cxgrdclmnTAGNamaBarang.Index, CDSSKU.FieldByName('barangsatuanitem_id').AsString);
  SetUOMDanKonversi;
end;

procedure TfrmTransferAntarGudang.cxgrdclmnTAGNamaBarangPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  iBaris: Integer;
  lDSt: TDataSet;
begin
  inherited;
  iBaris := cxGridTableTAGDetail.DataController.FocusedRecordIndex;
  lDSt   := (TcxExtLookupComboBoxProperties(cxgrdclmnTAGNamaBarang.Properties)).Dataset;

  cxGridTableTAGDetail.SetValue(iBaris, cxgrdclmnTAGKodeBarang.Index,lDSt.FieldByName('barang').AsString);
  cxGridTableTAGDetail.SetValue(iBaris, cxgrdclmnTAGUOM.Index,lDSt.FieldByName('uom').AsString);

  cxGridTableTAGDetail.SetValue(iBaris, cxgrdclmnTAGKonversi.Index,lDSt.FieldByName('konversi').AsFloat);
end;

procedure TfrmTransferAntarGudang.cxGridDBTableOverviewCellDblClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if LoadData(cxGridDBTableOverview.DS.FieldByName('ID').AsString) then
    cxPCData.ActivePageIndex := 1;
end;

function TfrmTransferAntarGudang.GetTransferAntarGudang: TTransferAntarGudang;
begin
  if FTransferAntarGudang = nil then
    FTransferAntarGudang := TTransferAntarGudang.Create;

  Result := FTransferAntarGudang;
end;

procedure TfrmTransferAntarGudang.InisialisasiCBBSKU;
var
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

  CDSSKU := TDBUtils.OpenDataset(sSQL);

  TcxExtLookupComboBoxProperties(cxGridTableTAGDetail.Columns[cxgrdclmnTAGNamaBarang.Index].Properties).LoadFromCDS(CDSSKU,'ID','Nama',['ID'],Self);
  TcxExtLookupComboBoxProperties(cxGridTableTAGDetail.Columns[cxgrdclmnTAGNamaBarang.Index].Properties).SetMultiPurposeLookup();
  TcxExtLookupComboBoxProperties(cxGridTableTAGDetail.Columns[cxgrdclmnTAGNamaBarang.Index].Properties).cxDBTableGrid.SetVisibleColumns(['barang','uom','id','KONVERSI'], FALSE);
  TcxExtLookupComboBoxProperties(cxGridTableTAGDetail.Columns[cxgrdclmnTAGNamaBarang.Index].Properties).cxDBTableGrid.ApplyBestFit();

  sSQL := 'select Nama,sku, ID from TBarang';
  lCDSNama := TDBUtils.OpenDataset(sSQL);
  TcxExtLookupComboBoxProperties(cxGridTableTAGDetail.Columns[cxgrdclmnTAGKodeBarang.Index].Properties).LoadFromCDS(lCDSNama,'ID','SKU',['ID'],Self);
  TcxExtLookupComboBoxProperties(cxGridTableTAGDetail.Columns[cxgrdclmnTAGKodeBarang.Index].Properties).SetMultiPurposeLookup;

end;

procedure TfrmTransferAntarGudang.InisialisasiCBBUOM;
var
  lCDSUOM: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select uom,ID from TUOM';
  lCDSUOM := TDBUtils.OpenDataset(sSQL);

  TcxExtLookupComboBoxProperties(cxGridTableTAGDetail.Columns[cxgrdclmnTAGUOM.Index].Properties).LoadFromCDS(lCDSUOM,'ID','UOM',['ID'],Self);
  TcxExtLookupComboBoxProperties(cxGridTableTAGDetail.Columns[cxgrdclmnTAGUOM.Index].Properties).SetMultiPurposeLookup;

end;

procedure TfrmTransferAntarGudang.InisialisasiGudangAsal;
var
  lCDSGudang: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select Nama,Kode,ID from TGudang where Cabang = ' + QuotedStr(ClientDataModule.Cabang.ID);
  lCDSGudang := TDBUtils.OpenDataset(sSQL);
  cbbGudangAsal.Properties.LoadFromCDS(lCDSGudang,'ID','Nama',['ID'],Self);
  cbbGudangAsal.Properties.SetMultiPurposeLookup;
end;

procedure TfrmTransferAntarGudang.InisialisasiGudangTujuan;
var
  lCDSGudang: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select Nama,Kode,ID from TGudang where Cabang = ' + QuotedStr(ClientDataModule.Cabang.ID);
  lCDSGudang := TDBUtils.OpenDataset(sSQL);
  cbbGudangTujuan.Properties.LoadFromCDS(lCDSGudang,'ID','Nama',['ID'],Self);
  cbbGudangTujuan.Properties.SetMultiPurposeLookup;
end;

function TfrmTransferAntarGudang.IsDetailTAGValid: Boolean;
var
  I: Integer;
begin
  Result := False;

  if cxGridTableTAGDetail.DataController.RecordCount = 0 then
  begin
    TAppUtils.Warning('Detail Transfer Belum Diisi');
    Exit;
  end;

  for I := 0 to cxGridTableTAGDetail.DataController.RecordCount - 1 do
  begin
    if cxGridTableTAGDetail.GetDouble(i, cxgrdclmnTAGQty.Index) <= 0 then
    begin
      TAppUtils.Warning('Qty Baris ' + IntToStr(i+1) + ' Masih <= 0');
      Exit;
    end;

  end;


  Result := True;
end;

function TfrmTransferAntarGudang.LoadData(AID : String): Boolean;
var
  I: Integer;
begin
  Result := False;
  FreeAndNil(FTransferAntarGudang);

  try
    ClearByTag([0,1]);
    edNoBukti.Text  := 'Otomatis';
    edPetugas.Text  := UserAplikasi.UserName;
    cxGridTableTAGDetail.ClearRows;

    memKeterangan.Clear;


    if AID = '' then
    begin
      Result := True;
      Exit;
    end;

    FTransferAntarGudang := ClientDataModule.ServerTransferAntarGudang.Retrieve(AID);

    if FTransferAntarGudang = nil then
      Exit;

    if FTransferAntarGudang.ID = '' then
      Exit;

    edNoBukti.Text            := FTransferAntarGudang.NoBukti;
    edTglBukti.Date           := FTransferAntarGudang.TglBukti;
    cbbGudangAsal.EditValue   := FTransferAntarGudang.GudangAsal.ID;
    cbbGudangTujuan.EditValue := FTransferAntarGudang.GudangTujuan.ID;
    edPetugas.Text            := FTransferAntarGudang.Petugas;
    memKeterangan.Text        := FTransferAntarGudang.Keterangan;

    for I := 0 to FTransferAntarGudang.TransferAntarGudangItems.Count - 1 do
    begin
      cxGridTableTAGDetail.DataController.RecordCount := cxGridTableTAGDetail.DataController.RecordCount + 1;

      cxGridTableTAGDetail.SetValue(i, cxgrdclmnTAGNamaBarang.Index, FTransferAntarGudang.TransferAntarGudangItems[i].BarangSatuangItemID);
      cxGridTableTAGDetail.SetValue(i, cxgrdclmnTAGKodeBarang.Index, FTransferAntarGudang.TransferAntarGudangItems[i].Barang.ID);
      cxGridTableTAGDetail.SetValue(i, cxgrdclmnTAGUOM.Index, FTransferAntarGudang.TransferAntarGudangItems[i].UOM.ID);
      cxGridTableTAGDetail.SetValue(i, cxgrdclmnTAGQty.Index, FTransferAntarGudang.TransferAntarGudangItems[i].Qty);
      cxGridTableTAGDetail.SetValue(i, cxgrdclmnTAGKonversi.Index, FTransferAntarGudang.TransferAntarGudangItems[i].Konversi);
    end;

    Result                    := True;
  except
    raise;
  end;
end;

procedure TfrmTransferAntarGudang.SetCDSSKU(const Value: TClientDataSet);
begin
  FreeAndNil(FCDSSKU);
  FCDSSKU := Value;
end;

procedure TfrmTransferAntarGudang.SetUOMDanKonversi;
begin
  cxGridTableTAGDetail.SetValue(cxGridTableTAGDetail.DataController.FocusedRecordIndex, cxgrdclmnTAGKodeBarang.Index, CDSSKU.FieldByName('barang').AsString);
  cxGridTableTAGDetail.SetValue(cxGridTableTAGDetail.DataController.FocusedRecordIndex, cxgrdclmnTAGUOM.Index, CDSSKU.FieldByName('uom').AsString);
  cxGridTableTAGDetail.SetValue(cxGridTableTAGDetail.DataController.FocusedRecordIndex, cxgrdclmnTAGKonversi.Index, CDSSKU.FieldByName('konversi').AsString);
end;

end.
