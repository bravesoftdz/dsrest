unit ufrmBarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDefault, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxClasses, ActnList, dxBar, ExtCtrls,
  dxStatusBar, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox, cxTextEdit, StdCtrls, ClientClassesUnit2,
  ClientModule, cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, cxGridLevel, cxPCdxBarPopupMenu, cxPC, cxCurrencyEdit, ImgList, uModel,
  cxNavigator, System.Actions;

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
    cxPCHeader: TcxPageControl;
    cxTSHeader: TcxTabSheet;
    lblKode: TLabel;
    lblNama: TLabel;
    lblGroup: TLabel;
    edKode: TcxTextEdit;
    edNama: TcxTextEdit;
    cbbGroup: TcxExtLookupComboBox;
    cxTSSatuan: TcxTabSheet;
    cxGridDBSatuan: TcxGrid;
    cxgrdlvlSatuan: TcxGridLevel;
    cxGridTableSatuan: TcxGridTableView;
    cxGridTableSatuanColumnUOM: TcxGridColumn;
    cxGridTableSatuanColumnKonversi: TcxGridColumn;
    cxGridTableSatuanColumnHargaJual: TcxGridColumn;
    cxGridDBTableUOM: TcxGridDBTableView;
    cxgrdbclmnGridDBTableUOMColumnUOM: TcxGridDBColumn;
    lblPPN: TLabel;
    cbbPPN: TcxComboBox;
    cxgrdbclmnGridDBTableBarangColumnPPN: TcxGridDBColumn;
    cxGridTableSatuanColumnHargaJualBengkel: TcxGridColumn;
    cxGridTableSatuanColumnHargaJualGrosir: TcxGridColumn;
    cxGridTableSatuanColumnHargaJualKeliling: TcxGridColumn;
    lblSatuanStock: TLabel;
    cbbSatuanStock: TcxExtLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure ActionBaruExecute(Sender: TObject);
    procedure ActionHapusExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
    procedure cxGridDBTableBarangCellDblClick(Sender: TcxCustomGridTableView;
        ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
        TShiftState; var AHandled: Boolean);
  private
    FBarang: TBarang;
    function GetBarang: TBarang;
    function IsBisaSimpan: Boolean;
    { Private declarations }
  protected
    procedure InisialisaiSupplier;
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
  DBClient, uDBUtils, uAppUtils;

{$R *.dfm}

procedure TfrmBarang.FormCreate(Sender: TObject);
begin
  inherited;
  cxPCHeader.ActivePageIndex := 0;
  InisialisaiSupplier;
  InisialisasiUOM;
  ActionBaruExecute(Sender);
end;

procedure TfrmBarang.ActionBaruExecute(Sender: TObject);
begin
  inherited;
  FID := '';
  edKode.Text := '';
  edNama.Text := '';

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
  i: Integer;
  lBarangSatuanItem: TBarangSatuanItem;
begin
  inherited;

  if not IsBisaSimpan then
    Exit;

  with TServerBarangClient.Create(ClientDataModule.DSRestConnection, False) do
  begin
    try
//      Barang              := TBarang.Create;
      Barang.ID             := FID;
      Barang.SKU            := edKode.Text;
      Barang.Nama           := edNama.Text;
      Barang.GroupBarang    := TGroupBarang.Create;
      Barang.GroupBarang.ID := cbbGroup.EditValue;
      Barang.SatuanStock    := TUOM.CreateID(cbbSatuanStock.EditValue);

      Barang.PPN            := cbbPPN.Text;


      Barang.BarangSatuanItems.Clear;
      for i := 0 to cxGridTableSatuan.DataController.RecordCount - 1 do
      begin
        lBarangSatuanItem                   := TBarangSatuanItem.Create;
        lBarangSatuanItem.Barang            := Barang;
        lBarangSatuanItem.HargaJual         := cxGridTableSatuan.GetDouble(i, cxGridTableSatuanColumnHargaJual.Index);
        lBarangSatuanItem.HargaJualBengkel  := cxGridTableSatuan.GetDouble(i, cxGridTableSatuanColumnHargaJualBengkel.Index);
        lBarangSatuanItem.HargaJualGrosir   := cxGridTableSatuan.GetDouble(i, cxGridTableSatuanColumnHargaJualGrosir.Index);
        lBarangSatuanItem.HargaJualKeliling := cxGridTableSatuan.GetDouble(i, cxGridTableSatuanColumnHargaJualKeliling.Index);
        lBarangSatuanItem.Konversi          := cxGridTableSatuan.GetDouble(i, cxGridTableSatuanColumnKonversi.Index);
        lBarangSatuanItem.UOM               := TUOM.Create;
        lBarangSatuanItem.UOM.ID            := cxGridTableSatuan.GetString(i, cxGridTableSatuanColumnUOM.Index);

        lBarangSatuanItem.Barang            := Barang;

        Barang.BarangSatuanItems.Add(lBarangSatuanItem);
      end;

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

procedure TfrmBarang.cxGridDBTableBarangCellDblClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  LoadDataBarang(cxGridDBTableBarang.DataController.DataSource.DataSet.FieldByName('ID').AsString);
end;

function TfrmBarang.GetBarang: TBarang;
begin
  if FBarang = nil then
    FBarang := TBarang.Create;

  Result := FBarang;
end;

procedure TfrmBarang.InisialisaiSupplier;
var
  lCDS: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select * from ' + TGroupBarang.ClassName;

  lCDS := TDBUtils.OpenDataset(sSQL);
  cxGridDBTableGroupBarang.SetDataset(lCDS);

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
  end else if Trim(edNama.Text) = '' then
  begin
    TAppUtils.Warning('Nama Belum Diisi');
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
var
  i: Integer;
begin
  with TServerBarangClient.Create(ClientDataModule.DSRestConnection, False) do
  begin
    try
      FreeAndNil(FBarang);
      FBarang                  := Retrieve(AID);

      FID                      := Barang.ID;
      edKode.Text              := Barang.SKU;
      edNama.Text              := Barang.Nama;
      cbbGroup.EditValue       := Barang.GroupBarang.ID;
      cbbSatuanStock.EditValue := Barang.SatuanStock.ID;
      cbbPPN.ItemIndex         := cbbPPN.Properties.Items.IndexOf(Barang.PPN);

      cxGridTableSatuan.DataController.RecordCount := Barang.BarangSatuanItems.Count;
      for i := 0 to Barang.BarangSatuanItems.Count - 1 do
      begin
        cxGridTableSatuan.DataController.Values[i, cxGridTableSatuanColumnUOM.Index]               := Barang.BarangSatuanItems[i].UOM.ID;
        cxGridTableSatuan.DataController.Values[i, cxGridTableSatuanColumnKonversi.Index]          := Barang.BarangSatuanItems[i].Konversi;
        cxGridTableSatuan.DataController.Values[i, cxGridTableSatuanColumnHargaJual.Index]         := Barang.BarangSatuanItems[i].HargaJual;
        cxGridTableSatuan.DataController.Values[i, cxGridTableSatuanColumnHargaJualBengkel.Index]  := Barang.BarangSatuanItems[i].HargaJualBengkel;
        cxGridTableSatuan.DataController.Values[i, cxGridTableSatuanColumnHargaJualGrosir.Index]   := Barang.BarangSatuanItems[i].HargaJualGrosir;
        cxGridTableSatuan.DataController.Values[i, cxGridTableSatuanColumnHargaJualKeliling.Index] := Barang.BarangSatuanItems[i].HargaJualKeliling;
      end;
    finally

    end;
  end;
end;

end.
