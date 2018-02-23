unit ufrmBarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDefault, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxClasses, ActnList, dxBar, ExtCtrls,
  dxStatusBar, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox, cxTextEdit, StdCtrls, ClientClassesUnit,
  ClientModule, cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, cxGridLevel, cxPCdxBarPopupMenu, cxPC, cxCurrencyEdit, ImgList, uModel,
  cxNavigator, System.Actions, Datasnap.DBClient, Datasnap.Provider,
  dxBarExtDBItems, cxCheckBox, cxBarEditItem, dxBarBuiltInMenu, dxBarExtItems,
  System.ImageList, Vcl.Menus, cxButtons, Vcl.ComCtrls;

type
  TfrmBarang = class(TfrmDefault)
    cxGridDBTableGroupBarang: TcxGridDBTableView;
    cxgrdbclmnGridDBTableGroupBarangColumnNama: TcxGridDBColumn;
    cxgrdbclmnGridDBTableGroupBarangColumnKode: TcxGridDBColumn;
    cxgrdbclmnGridDBTableGroupBarangColumnID: TcxGridDBColumn;
    pnlFilterBarang: TPanel;
    cxGridDBDaftarBarang: TcxGrid;
    cxGridDBTableBarang: TcxGridDBTableView;
    cxgrdlvlDaftarBarang: TcxGridLevel;
    cxgrdbclmnGridDBTableBarangColumnKode: TcxGridDBColumn;
    cxgrdbclmnGridDBTableBarangColumnNama: TcxGridDBColumn;
    cxgrdbclmnGridDBTableBarangColumnGroup: TcxGridDBColumn;
    cxGridDBTableUOM: TcxGridDBTableView;
    cxgrdbclmnGridDBTableUOMColumnUOM: TcxGridDBColumn;
    cxgrdbclmnGridDBTableBarangColumnPPN: TcxGridDBColumn;
    cxPCHeader: TcxPageControl;
    cxTSHeader: TcxTabSheet;
    lblKode: TLabel;
    lblNama: TLabel;
    lblGroup: TLabel;
    lblPPN: TLabel;
    lblSatuanStock: TLabel;
    edKode: TcxTextEdit;
    edNama: TcxTextEdit;
    cbbGroup: TcxExtLookupComboBox;
    cbbPPN: TcxComboBox;
    cbbSatuanStock: TcxExtLookupComboBox;
    cxTSSatuan: TcxTabSheet;
    cxGridDBSatuan: TcxGrid;
    cxGridTableSatuan: TcxGridTableView;
    cxGridTableSatuanColumnUOM: TcxGridColumn;
    cxGridTableSatuanColumnKonversi: TcxGridColumn;
    cxGridTableSatuanColumnHargaJual: TcxGridColumn;
    cxGridTableSatuanColumnHargaJualBengkel: TcxGridColumn;
    cxGridTableSatuanColumnHargaJualKeliling: TcxGridColumn;
    cxGridTableSatuanColumnHargaJualGrosir: TcxGridColumn;
    cxgrdlvlSatuan: TcxGridLevel;
    cxGridTableSatuanColumnBarcode: TcxGridColumn;
    lblHarga: TLabel;
    edHarga: TcxCurrencyEdit;
    bAddGroup: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure ActionBaruExecute(Sender: TObject);
    procedure ActionHapusExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
    procedure cxGridDBTableBarangCellDblClick(Sender: TcxCustomGridTableView;
        ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
        TShiftState; var AHandled: Boolean);
    procedure edKodeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure bAddGroupClick(Sender: TObject);
  private
    FBarang: TBarang;
    FCDSGB: TClientDataset;
    function GetBarang: TBarang;
    function IsBisaSimpan: Boolean;
    function IsDetailSatuanValid: Boolean;
    { Private declarations }
  protected
    procedure InisialisaiGroupBarang;
    procedure InisialisasiUOM;
    procedure LoadDaftarBarang;
    property Barang: TBarang read GetBarang write FBarang;
  public
    procedure LoadDataBarang(AID : String);
    { Public declarations }
  end;

var
  frmBarang: TfrmBarang;

implementation

uses
   uDBUtils, uAppUtils,uBarangUtils;

{$R *.dfm}

procedure TfrmBarang.FormCreate(Sender: TObject);
begin
  inherited;
  cxPCHeader.ActivePageIndex := 0;
  InisialisaiGroupBarang;
  InisialisasiUOM;

end;

procedure TfrmBarang.ActionBaruExecute(Sender: TObject);
begin
  inherited;
  edKode.Text := '';
  edNama.Text := '';
  cbbSatuanStock.ItemIndex := 0;
  edKode.SetFocus;

  FreeAndNil(FBarang);

  cxGridTableSatuan.DataController.RecordCount := 0;

end;

procedure TfrmBarang.ActionHapusExecute(Sender: TObject);
begin
  inherited;
  with TServerBarangClient.Create(ClientDataModule.DSRestConnection, False) do
  begin
    try
      if Delete(Barang) then
      begin
        ActionBaruExecute(Sender);
        ActionRefreshExecute(Sender);
      end;
    finally
      FreeAndNil(FBarang);
      Free;
    end;
  end;
end;

procedure TfrmBarang.ActionRefreshExecute(Sender: TObject);
begin
  inherited;
  LoadDaftarBarang;
end;

procedure TfrmBarang.ActionSimpanExecute(Sender: TObject);
var
//  i: Integer;
  lBarangSatuanItem: TBarangSatuanItem;
begin
  inherited;

  if not IsBisaSimpan then
    Exit;

  with TServerBarangClient.Create(ClientDataModule.DSRestConnection, False) do
  begin
    try
      Barang.SKU            := edKode.Text;
      Barang.Nama           := edNama.Text;
      Barang.GroupBarang    := TGroupBarang.Create;
      Barang.GroupBarang.ID := cbbGroup.EditValue;
      Barang.SatuanStock    := TUOM.CreateID(cbbSatuanStock.EditValue);

      Barang.PPN            := cbbPPN.Text;


      Barang.BarangSatuanItems.Clear;
      lBarangSatuanItem                   := TBarangSatuanItem.Create;
      lBarangSatuanItem.Barang            := Barang;
      lBarangSatuanItem.HargaJual         := edHarga.Value;
      lBarangSatuanItem.HargaJualBengkel  := edHarga.Value;//cxGridTableSatuan.GetDouble(i, cxGridTableSatuanColumnHargaJualBengkel.Index);
      lBarangSatuanItem.HargaJualGrosir   := edHarga.Value;//cxGridTableSatuan.GetDouble(i, cxGridTableSatuanColumnHargaJualGrosir.Index);
      lBarangSatuanItem.HargaJualKeliling := edHarga.Value;//cxGridTableSatuan.GetDouble(i, cxGridTableSatuanColumnHargaJualKeliling.Index);
      lBarangSatuanItem.Konversi          := 1;//cxGridTableSatuan.GetDouble(i, cxGridTableSatuanColumnKonversi.Index);
      lBarangSatuanItem.UOM               := TUOM.Create;
      lBarangSatuanItem.UOM.ID            := cbbSatuanStock.EditValue;
      lBarangSatuanItem.Barcode           := edKode.Text;

      lBarangSatuanItem.Barang            := Barang;

      Barang.BarangSatuanItems.Add(lBarangSatuanItem);

      if Save(Barang) then
      begin
        ActionBaruExecute(Sender);
        ActionRefreshExecute(Sender);
      end;
    finally
      FreeAndNil(FBarang);
      Free;
    end;
  end;
end;

procedure TfrmBarang.bAddGroupClick(Sender: TObject);
var
  lGB: TGroupBarang;
  sGroup: string;
  sKode: string;
begin
  inherited;
  sKode  := InputBox('Kode','Kode','');
  sGroup := InputBox('Nama','Nama','');

  with TServerGroupBarangClient.Create(ClientDataModule.DSRestConnection, False) do
  begin
    try
      lGB := TGroupBarang.Create;
      lGB.Kode := sKode;
      lGB.Nama := sGroup;

      if trim(lGB.Kode) = '' then
        Exit;

      if (lGB.Nama) = '' then
        Exit;

      if Save(lGB) then
      begin
        InisialisaiGroupBarang;
        FCDSGB.Filter       := 'kode = ' + QuotedStr(lGB.Kode);
        FCDSGB.Filtered     := True;
        cbbGroup.EditValue  := FCDSGB.FieldByName('id').AsString;
      end;
    finally
      FCDSGB.Filtered := False;
    end;
  end;

end;

procedure TfrmBarang.cxGridDBTableBarangCellDblClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  LoadDataBarang(cxGridDBTableBarang.DataController.DataSource.DataSet.FieldByName('ID').AsString);
  cxPCData.ActivePageIndex := 1;
end;

procedure TfrmBarang.edKodeKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
var
  lBarang: tBarang;
begin
  inherited;
  if Key = VK_RETURN then
  begin
    lBarang := ClientDataModule.ServerBarangClient.RetrieveKode(edKode.Text);
    try
      if lBarang <> nil then
        if lBarang.ID <> '' then
          LoadDataBarang(lBarang.ID);
    finally
      lBarang.Free;
    end;
  end;

end;

procedure TfrmBarang.FormShow(Sender: TObject);
begin
  inherited;
  ActionBaruExecute(Sender);
end;

function TfrmBarang.GetBarang: TBarang;
begin
  if FBarang = nil then
    FBarang := TBarang.Create;

  Result := FBarang;
end;

procedure TfrmBarang.InisialisaiGroupBarang;
var
  sSQL: string;
begin
  sSQL := 'select * from ' + TGroupBarang.ClassName;
  FCDSGB := TDBUtils.OpenDataset(sSQL);

  cbbGroup.Properties.LoadFromCDS(FCDSGB,'ID','Nama',['ID'],Self);
  cbbGroup.Properties.SetMultiPurposeLookup;
end;

procedure TfrmBarang.InisialisasiUOM;
var
  sSQL: string;
begin
  sSQL := 'select * from ' + TUOM.ClassName;
  cxGridDBTableUOM.SetDataset(sSQL);
end;

function TfrmBarang.IsBisaSimpan: Boolean;
begin
  Result := False;

  if Trim(edKode.Text) = '' then
  begin
    TAppUtils.Warning('Kode Belum Diisi');
    Exit;
  end else if TBarangUtils.IsKodeBarangSudahAda(trim(edKode.Text), Barang.ID) then
  begin
    TAppUtils.Warning('Kode Sudah Dipakai');
    Exit;
  end else if Trim(edNama.Text) = '' then
  begin
    TAppUtils.Warning('Nama Belum Diisi');
    Exit;
  end else if cbbGroup.EditValue = null then
  begin
    TAppUtils.Warning('Group Barang Belum Dipilih');
    Exit;
  end else if cbbSatuanStock.EditValue = null then
  begin
    TAppUtils.Warning('Satuan Stock Belum Dipilih');
    Exit;
  end else if not IsDetailSatuanValid then
  begin
    Exit;
  end;


  Result := True;
end;

function TfrmBarang.IsDetailSatuanValid: Boolean;
var
  I: Integer;
  IsSatuanStockAda: Boolean;
begin
  Result := True;

  Exit;

  if cxGridTableSatuan.DataController.RecordCount <= 0 then
  begin
    TAppUtils.Warning('Konversi Satuan Belum diisi');
    Exit;
  end;

  IsSatuanStockAda := False;
  for I := 0 to cxGridTableSatuan.DataController.RecordCount - 1 do
  begin
    if cxGridTableSatuan.GetString(i, cxGridTableSatuanColumnUOM.Index) = cbbSatuanStock.EditValue then
    begin
      IsSatuanStockAda := True;
      if cxGridTableSatuan.GetDouble(i, cxGridTableSatuanColumnKonversi.Index) <> 1 then
      begin
        TAppUtils.Warning('Satuan Stock Harus Mempunyai Konversi = 1');
        Exit;
      end;
    end;
  end;

  if not IsSatuanStockAda then
  begin
    TAppUtils.Warning('Satuan Stock Belum Ada Di Daftar Satuan');
    Exit;
  end;

  Result := True;
end;

procedure TfrmBarang.LoadDaftarBarang;
var
  sSQL: string;
begin
  sSQL := 'select * from ' + TBarang.ClassName;
  cxGridDBTableBarang.SetDataset(sSQL);
end;

procedure TfrmBarang.LoadDataBarang(AID : String);
//var
//  i: Integer;
begin
  with ClientDataModule.ServerBarangClient do
  begin
    FreeAndNil(FBarang);
    FBarang                  := Retrieve(AID);

//    FID                      := Barang.ID;
    edKode.Text              := Barang.SKU;

    if Barang.BarangSatuanItems.Count = 0 then
      edHarga.Value          := 0
    else
      edHarga.Value          := Barang.BarangSatuanItems[0].HargaJual;

    edNama.Text              := Barang.Nama;
    cbbGroup.EditValue       := Barang.GroupBarang.ID;
    cbbSatuanStock.EditValue := Barang.SatuanStock.ID;
    cbbPPN.ItemIndex         := cbbPPN.Properties.Items.IndexOf(Barang.PPN);

//    cxGridTableSatuan.DataController.RecordCount := Barang.BarangSatuanItems.Count;
//    for i := 0 to Barang.BarangSatuanItems.Count - 1 do
//    begin
//      cxGridTableSatuan.DataController.Values[i, cxGridTableSatuanColumnUOM.Index]               := Barang.BarangSatuanItems[i].UOM.ID;
//      cxGridTableSatuan.DataController.Values[i, cxGridTableSatuanColumnKonversi.Index]          := Barang.BarangSatuanItems[i].Konversi;
//      cxGridTableSatuan.DataController.Values[i, cxGridTableSatuanColumnHargaJual.Index]         := Barang.BarangSatuanItems[i].HargaJual;
//      cxGridTableSatuan.DataController.Values[i, cxGridTableSatuanColumnHargaJualBengkel.Index]  := Barang.BarangSatuanItems[i].HargaJualBengkel;
//      cxGridTableSatuan.DataController.Values[i, cxGridTableSatuanColumnHargaJualGrosir.Index]   := Barang.BarangSatuanItems[i].HargaJualGrosir;
//      cxGridTableSatuan.DataController.Values[i, cxGridTableSatuanColumnHargaJualKeliling.Index] := Barang.BarangSatuanItems[i].HargaJualKeliling;
//    end;
  end;
end;

end.
