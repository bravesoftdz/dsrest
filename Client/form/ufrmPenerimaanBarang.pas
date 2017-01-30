unit ufrmPenerimaanBarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDefault, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, ActnList, dxBar, cxClasses, ExtCtrls, dxStatusBar,
  ComCtrls, StdCtrls, cxContainer, cxEdit, cxMemo, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxMaskEdit, cxCalendar, cxTextEdit,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridLevel, cxGrid, cxCurrencyEdit,
  ImgList, uModel, ClientClassesUnit2, DB, cxDBData, cxGridDBTableView,
  cxDBExtLookupComboBox, Provider, DBClient, cxNavigator, dxCore, cxDateUtils,
  System.Actions;

type
  TfrmPenerimaanBarang = class(TfrmDefault)
    pnlTransaksi: TPanel;
    pgcHeader: TPageControl;
    tsHeader: TTabSheet;
    lblNoBukti: TLabel;
    lblTglBukti: TLabel;
    lblSupplier: TLabel;
    lblKeterangan: TLabel;
    pgcDetail: TPageControl;
    tsDetailPenerimaan: TTabSheet;
    cxgrdlvlPenerimaanBarang: TcxGridLevel;
    cxGridDBPenerimaanBarang: TcxGrid;
    cxGridTablePenerimaanBarang: TcxGridTableView;
    cxGridTablePenerimaanBarangColumnSKU: TcxGridColumn;
    cxGridTablePenerimaanBarangColumnNama: TcxGridColumn;
    cxGridTablePenerimaanBarangColumnSatuan: TcxGridColumn;
    cxGridTablePenerimaanBarangColumnHarga: TcxGridColumn;
    cxGridTablePenerimaanBarangColumnQty: TcxGridColumn;
    cxGridTablePenerimaanBarangColumnDiskon: TcxGridColumn;
    cxGridTablePenerimaanBarangColumnPPN: TcxGridColumn;
    cxGridTablePenerimaanBarangColumnTotal: TcxGridColumn;
    edNoBukti: TcxTextEdit;
    edTglBukti: TcxDateEdit;
    memKeterangan: TcxMemo;
    cxGridDBTableSupplier: TcxGridDBTableView;
    cxgrdbclmnGridDBTableSupplierColumnNama: TcxGridDBColumn;
    cxgrdbclmnGridDBTableSupplierColumnKode: TcxGridDBColumn;
    cbbSupplier: TcxExtLookupComboBox;
    cxGridDBTableSKU: TcxGridDBTableView;
    cxgrdbclmnGridDBTableSKUColumnSKU: TcxGridDBColumn;
    cxgrdbclmnGridDBTableSKUColumnNama: TcxGridDBColumn;
    cxGridDBTableUOM: TcxGridDBTableView;
    cxgrdbclmnGridDBTableUOMColumnUOM: TcxGridDBColumn;
    cxGridTablePenerimaanBarangColumnDiskonRp: TcxGridColumn;
    cxGridTablePenerimaanBarangColumnPPNRp: TcxGridColumn;
    cxGridTablePenerimaanBarangColumnSubTotalRp: TcxGridColumn;
    pnlFilterBarang: TPanel;
    cxGridDBDaftarPB: TcxGrid;
    cxGridDBTableDaftarPB: TcxGridDBTableView;
    cxgrdlvlDaftarPB: TcxGridLevel;
    dsPB: TDataSource;
    cxgrdbclmnGridDBTableDaftarPBNoBukti: TcxGridDBColumn;
    cxgrdbclmnGridDBTableDaftarPBTglBukti: TcxGridDBColumn;
    ProvPB: TDataSetProvider;
    cdsPB: TClientDataSet;
    cxgrdbclmnGridDBTableDaftarPBSupplier: TcxGridDBColumn;
    cxgrdbclmnGridDBTableDaftarPBKeterangan: TcxGridDBColumn;
    procedure actCetakExecute(Sender: TObject);
    procedure ActionBaruExecute(Sender: TObject);
    procedure ActionHapusExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
    procedure cxGridDBTableDaftarPBCellDblClick(Sender: TcxCustomGridTableView;
        ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
        TShiftState; var AHandled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure cxGridTablePenerimaanBarangColumnSKUPropertiesValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGridTablePenerimaanBarangColumnNamaPropertiesValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGridTablePenerimaanBarangColumnHargaPropertiesValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGridTablePenerimaanBarangColumnQtyPropertiesValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGridTablePenerimaanBarangColumnDiskonPropertiesValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGridTablePenerimaanBarangColumnPPNPropertiesValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGridDBTableDaftarPBEditing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
  private
    FPenerimaanBarang: TPenerimaanBarang;
    function GetPenerimaanBarang: TPenerimaanBarang;
    procedure HitungNilaiNilaiPerBaris(dNilai: Double; Acolumn : Integer);
    procedure InisialisasiSupplier;
    procedure InisialisasiSKU;
    procedure InisialisasiUOM;
    function IsBisaHapus : Boolean;
    { Private declarations }
  protected
    property PenerimaanBarang: TPenerimaanBarang read GetPenerimaanBarang write
        FPenerimaanBarang;
  public
    procedure LoadDataPenerimaanBarang(ANoBukti : String);

    { Public declarations }
  end;

var
  frmPenerimaanBarang: TfrmPenerimaanBarang;

implementation
uses
  ClientModule, uDBUtils, uAppUtils, uBarangUtils;

{$R *.dfm}

procedure TfrmPenerimaanBarang.actCetakExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmPenerimaanBarang.ActionBaruExecute(Sender: TObject);
begin
  inherited;
  with TServerPenerimaanBarangClient.Create(ClientDataModule.DSRestConnection, False) do
  begin
    try
      edTglBukti.Date := Now;
      memKeterangan.Clear;
      edNoBukti.Text  := GenerateNoBukti(edTglBukti.Date, 'PB');
      cxGridTablePenerimaanBarang.ClearRows;

      FreeAndNil(FPenerimaanBarang);


    finally
      Free;
    end;
  end;


end;

procedure TfrmPenerimaanBarang.ActionHapusExecute(Sender: TObject);
begin
  inherited;
  if not IsBisaHapus then
    Exit;
end;

procedure TfrmPenerimaanBarang.ActionRefreshExecute(Sender: TObject);
begin
  inherited;
    with TServerPenerimaanBarangClient.Create(ClientDataModule.DSRestConnection, False) do
    begin
      ProvPB.DataSet := RetrieveCDS(PenerimaanBarang);
      cdsPB.Open;

      try
        TDBUtils.DataSetToCxDBGrid(cdsPB, cxGridDBTableDaftarPB);
        cxGridDBTableDaftarPB.ApplyBestFit();
      finally
        Free;
      end;

  end;
end;

procedure TfrmPenerimaanBarang.ActionSimpanExecute(Sender: TObject);
var
  i: Integer;
  lPenerimaanBarangItem: TPenerimaanBarangItem;
begin
  inherited;
  with TServerPenerimaanBarangClient.Create(ClientDataModule.DSRestConnection, False) do
  begin
    try
      PenerimaanBarang.ID          := FID;
      PenerimaanBarang.NoBukti     := edNoBukti.Text;
      PenerimaanBarang.Keterangan  := memKeterangan.Text;
      PenerimaanBarang.Supplier    := TSupplier.Create;
      PenerimaanBarang.Supplier.ID := cbbSupplier.EditValue;
      PenerimaanBarang.TglBukti    := edTglBukti.Date;
      PenerimaanBarang.Cabang      := TCabang.Create;
//      PenerimaanBarang.Cabang.ID   := ClientDataModule.Cabang.ID;


      PenerimaanBarang.PenerimaanBarangItems.Clear;
      for i := 0 to cxGridTablePenerimaanBarang.DataController.RecordCount - 1 do
      begin
        lPenerimaanBarangItem                  := TPenerimaanBarangItem.Create;
        lPenerimaanBarangItem.Barang           := TBarang.Create;
        lPenerimaanBarangItem.Barang.ID        := cxGridTablePenerimaanBarang.GetString(i, cxGridTablePenerimaanBarangColumnSKU.Index);

        lPenerimaanBarangItem.Diskon           := cxGridTablePenerimaanBarang.GetDouble(i, cxGridTablePenerimaanBarangColumnDiskon.Index);
        lPenerimaanBarangItem.HargaBeli        := cxGridTablePenerimaanBarang.GetDouble(i, cxGridTablePenerimaanBarangColumnHarga.Index);
        lPenerimaanBarangItem.PPN              := cxGridTablePenerimaanBarang.GetDouble(i, cxGridTablePenerimaanBarangColumnPPN.Index);
        lPenerimaanBarangItem.Qty              := cxGridTablePenerimaanBarang.GetDouble(i, cxGridTablePenerimaanBarangColumnQty.Index);
        lPenerimaanBarangItem.UOM              := TUOM.Create;
        lPenerimaanBarangItem.UOM.ID           := cxGridTablePenerimaanBarang.GetString(i, cxGridTablePenerimaanBarangColumnSatuan.Index);
        lPenerimaanBarangItem.Konversi         := TBarangUtils.KonversiUOM(lPenerimaanBarangItem.Barang.ID, lPenerimaanBarangItem.UOM.ID);

        lPenerimaanBarangItem.PenerimaanBarang := PenerimaanBarang;

        PenerimaanBarang.PenerimaanBarangItems.Add(lPenerimaanBarangItem);

      end;

      if Save(PenerimaanBarang) then
      begin
        ActionBaruExecute(Sender);
      end;
    finally
      FreeAndNil(FPenerimaanBarang);
      Free;
    end;
  end;
end;

procedure TfrmPenerimaanBarang.cxGridDBTableDaftarPBCellDblClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  iCol: Integer;
  iRec: Integer;
begin
  inherited;
  iRec := cxGridDBTableDaftarPB.DataController.FocusedRecordIndex;
  iCol := cxgrdbclmnGridDBTableDaftarPBNoBukti.Index;

  LoadDataPenerimaanBarang(cxGridDBTableDaftarPB.GetString(iRec,iCol));

end;

procedure TfrmPenerimaanBarang.cxGridDBTableDaftarPBEditing(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  var AAllow: Boolean);
begin
  inherited;
  AAllow := False;
end;

procedure TfrmPenerimaanBarang.cxGridTablePenerimaanBarangColumnDiskonPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  dNilai: Double;
begin
  inherited;
  dNilai :=  DisplayValue;
  HitungNilaiNilaiPerBaris(dNilai, cxGridTablePenerimaanBarangColumnDiskon.Index);
end;

procedure TfrmPenerimaanBarang.cxGridTablePenerimaanBarangColumnHargaPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  dNilai: Double;
begin
  inherited;
  dNilai :=  DisplayValue;
  HitungNilaiNilaiPerBaris(dNilai, cxGridTablePenerimaanBarangColumnHarga.Index);
end;

procedure TfrmPenerimaanBarang.cxGridTablePenerimaanBarangColumnNamaPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  sID: string;
begin
  inherited;
  sID := cxGridDBTableSKU.DataController.DataSource.DataSet.FieldByName('ID').AsString;
  cxGridTablePenerimaanBarang.DataController.Values[cxGridTablePenerimaanBarang.DataController.FocusedRecordIndex, cxGridTablePenerimaanBarangColumnSKU.Index] := sID;
end;

procedure TfrmPenerimaanBarang.cxGridTablePenerimaanBarangColumnPPNPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  dNilai: Double;
begin
  inherited;
  dNilai := DisplayValue;
  HitungNilaiNilaiPerBaris(dNilai, cxGridTablePenerimaanBarangColumnPPN.Index);
end;

procedure TfrmPenerimaanBarang.cxGridTablePenerimaanBarangColumnQtyPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  dNilai: Double;
begin
  inherited;
  dNilai :=  DisplayValue;
  HitungNilaiNilaiPerBaris(dNilai, cxGridTablePenerimaanBarangColumnQty.Index);
end;

procedure TfrmPenerimaanBarang.cxGridTablePenerimaanBarangColumnSKUPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  sID: string;
begin
  inherited;
  sID := cxGridDBTableSKU.DataController.DataSource.DataSet.FieldByName('ID').AsString;
  cxGridTablePenerimaanBarang.DataController.Values[cxGridTablePenerimaanBarang.DataController.FocusedRecordIndex, cxGridTablePenerimaanBarangColumnNama.Index] := sID;
end;

procedure TfrmPenerimaanBarang.FormShow(Sender: TObject);
begin
  inherited;
  InisialisasiSupplier;
  InisialisasiSKU;
  InisialisasiUOM;
  ActionBaruExecute(Sender);
end;

function TfrmPenerimaanBarang.GetPenerimaanBarang: TPenerimaanBarang;
begin
  if FPenerimaanBarang = nil then
    FPenerimaanBarang := TPenerimaanBarang.Create;

  Result := FPenerimaanBarang;
end;

procedure TfrmPenerimaanBarang.HitungNilaiNilaiPerBaris(dNilai: Double; Acolumn
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

  with cxGridTablePenerimaanBarang do
  begin
    if Acolumn = cxGridTablePenerimaanBarangColumnHarga.Index then
    begin
      dHarga  := dNilai;
      dQty    := GetDouble(DataController.FocusedRecordIndex, cxGridTablePenerimaanBarangColumnQty.Index);
      dDiskon := GetDouble(DataController.FocusedRecordIndex, cxGridTablePenerimaanBarangColumnDiskon.Index);
      dPPN    := GetDouble(DataController.FocusedRecordIndex, cxGridTablePenerimaanBarangColumnPPN.Index);
    end else if Acolumn = cxGridTablePenerimaanBarangColumnQty.Index then
    begin
      dHarga  := GetDouble(DataController.FocusedRecordIndex, cxGridTablePenerimaanBarangColumnHarga.Index);
      dQty    := dNilai;
      dDiskon := GetDouble(DataController.FocusedRecordIndex, cxGridTablePenerimaanBarangColumnDiskon.Index);
      dPPN    := GetDouble(DataController.FocusedRecordIndex, cxGridTablePenerimaanBarangColumnPPN.Index);
    end else if Acolumn = cxGridTablePenerimaanBarangColumnDiskon.Index then
    begin
      dHarga  := GetDouble(DataController.FocusedRecordIndex, cxGridTablePenerimaanBarangColumnHarga.Index);
      dQty    := GetDouble(DataController.FocusedRecordIndex, cxGridTablePenerimaanBarangColumnQty.Index);
      dDiskon := dNilai;
      dPPN    := GetDouble(DataController.FocusedRecordIndex, cxGridTablePenerimaanBarangColumnPPN.Index);
    end else if Acolumn = cxGridTablePenerimaanBarangColumnPPN.Index then
    begin
      dHarga  := GetDouble(DataController.FocusedRecordIndex, cxGridTablePenerimaanBarangColumnHarga.Index);
      dQty    := GetDouble(DataController.FocusedRecordIndex, cxGridTablePenerimaanBarangColumnQty.Index);
      dDiskon := GetDouble(DataController.FocusedRecordIndex, cxGridTablePenerimaanBarangColumnDiskon.Index);
      dPPN    := dNilai;
    end;

    SetValue(DataController.FocusedRecordIndex, cxGridTablePenerimaanBarangColumnSubTotalRp.Index, dHarga * dQty);
    SetValue(DataController.FocusedRecordIndex, cxGridTablePenerimaanBarangColumnDiskonRp.Index, dHarga * dDiskon / 100 * dQty);
    SetValue(DataController.FocusedRecordIndex, cxGridTablePenerimaanBarangColumnPPNRp.Index, dHarga * (100 - dDiskon) / 100 * dQty * dPPN / 100);
    SetValue(DataController.FocusedRecordIndex, cxGridTablePenerimaanBarangColumnTotal.Index, dHarga * (100 - dDiskon) / 100 * dQty * (dPPN + 100) / 100);
  end;
end;

procedure TfrmPenerimaanBarang.InisialisasiSKU;
var
  sSQL: string;
begin
  sSQL := 'select * from tBarang';
  cxGridDBTableSKU.SetDataset(sSQL);
end;

procedure TfrmPenerimaanBarang.InisialisasiSupplier;
var
  sSQL: string;
begin
  sSQL := 'select * from tsupplier';
  cxGridDBTableSupplier.SetDataset(sSQL);
end;

procedure TfrmPenerimaanBarang.InisialisasiUOM;
var
  sSQL: string;
begin
  sSQL := 'select * from tuom';
  cxGridDBTableUOM.SetDataset(sSQL);
end;

function TfrmPenerimaanBarang.IsBisaHapus: Boolean;
begin
  Result := False;

    if not TAppUtils.Confirm('Anda yakin akan menghapus Data ?') then
      Exit;


  Result := True;
end;

procedure TfrmPenerimaanBarang.LoadDataPenerimaanBarang(ANoBukti : String);
var
  i: Integer;
begin
  with TServerPenerimaanBarangClient.Create(ClientDataModule.DSRestConnection, False) do
  begin
    try
      FreeAndNil(FPenerimaanBarang);
      FPenerimaanBarang := RetrieveNoBukti(ANoBukti);
      FID               := PenerimaanBarang.ID;

      if PenerimaanBarang <> nil then
      begin
        edNoBukti.Text := PenerimaanBarang.NoBukti;
        edTglBukti.Date:= PenerimaanBarang.TglBukti;

        if PenerimaanBarang.Supplier.ID <> '' then
          cbbSupplier.EditValue := PenerimaanBarang.Supplier.ID;

        memKeterangan.Lines.Text := PenerimaanBarang.Keterangan;

        cxGridTablePenerimaanBarang.ClearRows;
        for i := 0 to PenerimaanBarang.PenerimaanBarangItems.Count - 1 do
        begin
          cxGridTablePenerimaanBarang.DataController.RecordCount := i + 1;
          cxGridTablePenerimaanBarang.SetValue(i, cxGridTablePenerimaanBarangColumnSKU.Index, FPenerimaanBarang.PenerimaanBarangItems[i].Barang.ID);
          cxGridTablePenerimaanBarang.SetValue(i, cxGridTablePenerimaanBarangColumnNama.Index, FPenerimaanBarang.PenerimaanBarangItems[i].Barang.ID);
          cxGridTablePenerimaanBarang.SetValue(i, cxGridTablePenerimaanBarangColumnSatuan.Index, FPenerimaanBarang.PenerimaanBarangItems[i].UOM.ID);
          cxGridTablePenerimaanBarang.SetDouble(i, cxGridTablePenerimaanBarangColumnHarga.Index, FPenerimaanBarang.PenerimaanBarangItems[i].HargaBeli);
          cxGridTablePenerimaanBarang.SetDouble(i, cxGridTablePenerimaanBarangColumnQty.Index, FPenerimaanBarang.PenerimaanBarangItems[i].Qty);
          cxGridTablePenerimaanBarang.SetDouble(i, cxGridTablePenerimaanBarangColumnDiskon.Index,FPenerimaanBarang.PenerimaanBarangItems[i].Diskon);
          cxGridTablePenerimaanBarang.SetDouble(i, cxGridTablePenerimaanBarangColumnPPN.Index, FPenerimaanBarang.PenerimaanBarangItems[i].PPN);

          cxGridTablePenerimaanBarang.DataController.FocusedRecordIndex := i;
          HitungNilaiNilaiPerBaris(FPenerimaanBarang.PenerimaanBarangItems[i].PPN, cxGridTablePenerimaanBarangColumnPPN.Index);


        end;

      end;
    finally
      Free;
    end;
  end;
end;

end.
