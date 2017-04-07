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
    cxgrdclmnTAGUOMID: TcxGridColumn;
    cxgrdclmnTAGKonversi: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure ActionBaruExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
    procedure cxgrdclmnTAGKodeBarangPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxgrdclmnTAGNamaBarangPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  strict private
  private
    FCDSSKU: TClientDataSet;
    FTransferAntarGudang: TTransferAntarGudang;
    function GetTransferAntarGudang: TTransferAntarGudang;
    procedure InisialisasiGudangAsal;
    procedure InisialisasiGudangTujuan;
    procedure InisialisasiLookUpBarang;
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

{$R *.dfm}

procedure TfrmTransferAntarGudang.FormCreate(Sender: TObject);
begin
  inherited;
  InisialisasiGudangTujuan;
  InisialisasiGudangAsal;
  InisialisasiLookUpBarang;

  ActionBaruExecute(Sender);
end;

destructor TfrmTransferAntarGudang.Destroy;
begin
  inherited;
  FreeAndNil(FTransferAntarGudang);
end;

procedure TfrmTransferAntarGudang.ActionBaruExecute(Sender: TObject);
begin
  inherited;
  LoadData('');
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

   if cxGridTableTAGDetail.DataController.RecordCount = 0 then
   begin
     TAppUtils.Warning('Detail Transfer Belum Diisi');
     Exit;
   end;

  edNoBukti.Text                    := ClientDataModule.ServerTransferAntarGudang.GenerateNoBukti(edTglBukti.Date, 'TAG');
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
    lTransferAntarGudangItem.Barang   := TBarang.CreateID(cxGridTableTAGDetail.GetString(i, cxgrdclmnTAGNamaBarang.Index));
    lTransferAntarGudangItem.UOM      := TUOM.CreateID(cxGridTableTAGDetail.GetString(i, cxgrdclmnTAGNamaBarang.Index));
    lTransferAntarGudangItem.Konversi := cxGridTableTAGDetail.GetDouble(i, cxgrdclmnTAGKonversi.Index);
    lTransferAntarGudangItem.Qty      := cxGridTableTAGDetail.GetDouble(i, cxgrdclmnTAGQty.Index);

    lTransferAntarGudangItem.SetHeaderProperty(TransferAntarGudang);
    TransferAntarGudang.TransferAntarGudangItems.Add(lTransferAntarGudangItem);
  end;

  if ClientDataModule.ServerTransferAntarGudang.Save(TransferAntarGudang) then
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
  cxGridTableTAGDetail.SetValue(cxGridTableTAGDetail.DataController.FocusedRecordIndex, cxgrdclmnTAGNamaBarang.Index, CDSSKU.FieldByName('barang').AsString);
  SetUOMDanKonversi;
end;

procedure TfrmTransferAntarGudang.cxgrdclmnTAGNamaBarangPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  cxGridTableTAGDetail.SetValue(cxGridTableTAGDetail.DataController.FocusedRecordIndex, cxgrdclmnTAGKodeBarang.Index, CDSSKU.FieldByName('barang').AsString);
  SetUOMDanKonversi;
end;

function TfrmTransferAntarGudang.GetTransferAntarGudang: TTransferAntarGudang;
begin
  if FTransferAntarGudang = nil then
    FTransferAntarGudang := TTransferAntarGudang.Create;

  Result := FTransferAntarGudang;
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

procedure TfrmTransferAntarGudang.InisialisasiLookUpBarang;
var
  sSQL: string;
begin
  sSQL := 'select b.nama, b.sku, c.uom as satuan,' +
          ' a.konversi, a.barang, a.uom' +
          ' from tbarangsatuanitem a' +
          ' inner join tbarang b on a.barang = b.id' +
          ' inner join tuom c on a.uom = c.id';

  CDSSKU := TDBUtils.OpenDataset(sSQL);

  TcxExtLookupComboBoxProperties(cxGridTableTAGDetail.Columns[cxgrdclmnTAGKodeBarang.Index].Properties).LoadFromCDS(CDSSKU,'BARANG','SKU',['BARANG'],Self);
  TcxExtLookupComboBoxProperties(cxGridTableTAGDetail.Columns[cxgrdclmnTAGKodeBarang.Index].Properties).SetMultiPurposeLookup();
  TcxExtLookupComboBoxProperties(cxGridTableTAGDetail.Columns[cxgrdclmnTAGKodeBarang.Index].Properties).cxDBTableGrid.SetVisibleColumns(['barang','uom','id','KONVERSI'], FALSE);

  TcxExtLookupComboBoxProperties(cxGridTableTAGDetail.Columns[cxgrdclmnTAGNamaBarang.Index].Properties).LoadFromCDS(CDSSKU,'BARANG','NAMA',['BARANG'],Self);
  TcxExtLookupComboBoxProperties(cxGridTableTAGDetail.Columns[cxgrdclmnTAGNamaBarang.Index].Properties).SetMultiPurposeLookup();
  TcxExtLookupComboBoxProperties(cxGridTableTAGDetail.Columns[cxgrdclmnTAGNamaBarang.Index].Properties).cxDBTableGrid.SetVisibleColumns(['barang','uom','id','KONVERSI'], FALSE);

end;

function TfrmTransferAntarGudang.LoadData(AID : String): Boolean;
begin
  Result := False;
  FreeAndNil(FTransferAntarGudang);

  try
    ClearByTag([0,1]);
    edNoBukti.Text  := 'Otomatis';
    edPetugas.Text  := User;

    memKeterangan.Clear;


    if AID = '' then
      Exit;

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
  cxGridTableTAGDetail.SetValue(cxGridTableTAGDetail.DataController.FocusedRecordIndex, cxgrdclmnTAGUOM.Index, CDSSKU.FieldByName('satuan').AsString);
  cxGridTableTAGDetail.SetValue(cxGridTableTAGDetail.DataController.FocusedRecordIndex, cxgrdclmnTAGUOMID.Index, CDSSKU.FieldByName('uom').AsString);
  cxGridTableTAGDetail.SetValue(cxGridTableTAGDetail.DataController.FocusedRecordIndex, cxgrdclmnTAGKonversi.Index, CDSSKU.FieldByName('konversi').AsString);
end;

end.
