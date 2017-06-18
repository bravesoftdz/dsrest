unit ufrmReturSupplier;

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
  System.Actions, dxBarExtDBItems, cxCheckBox, cxBarEditItem, System.ImageList,
  dxBarExtItems, ufrmLookUpTransaksi, dxBarBuiltInMenu, Vcl.Menus, cxButtons,
  cxPC,uAppUtils,System.StrUtils, Data.FireDACJSONReflect,uDMReport;

type
  TfrmReturSupplier = class(TfrmDefault)
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
    cxGridTableReturSupplier: TcxGridTableView;
    cxgrdclmnGridTableReturSupplierColumnSKU: TcxGridColumn;
    cxgrdclmnGridTableReturSupplierColumnNama: TcxGridColumn;
    cxgrdclmnGridTableReturSupplierColumnSatuan: TcxGridColumn;
    cxgrdclmnGridTableReturSupplierColumnHarga: TcxGridColumn;
    cxgrdclmnGridTableReturSupplierColumnQty: TcxGridColumn;
    cxgrdclmnGridTableReturSupplierColumnDiskon: TcxGridColumn;
    cxgrdclmnGridTableReturSupplierColumnPPN: TcxGridColumn;
    cxgrdclmnGridTableReturSupplierColumnTotal: TcxGridColumn;
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
    cxgrdclmnGridTableReturSupplierColumnDiskonRp: TcxGridColumn;
    cxgrdclmnGridTableReturSupplierColumnPPNRp: TcxGridColumn;
    cxgrdclmnGridTableReturSupplierColumnSubTotalRp: TcxGridColumn;
    pnlFilterBarang: TPanel;
    dsPB: TDataSource;
    ProvPB: TDataSetProvider;
    cdsPB: TClientDataSet;
    lblNoPB: TLabel;
    edNoPB: TcxTextEdit;
    btnCari: TButton;
    procedure actCetakExecute(Sender: TObject);
    procedure ActionBaruExecute(Sender: TObject);
    procedure ActionHapusExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
    procedure btnCariClick(Sender: TObject);
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
    procedure cxGridDBTableOverviewCellDblClick(Sender: TcxCustomGridTableView;
        ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
        TShiftState; var AHandled: Boolean);
    procedure edNoPBKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FReturSupplier: TReturSupplier;
    function GetReturSupplier: TReturSupplier;
    procedure HitungNilaiNilaiPerBaris(dNilai: Double; Acolumn : Integer);
    procedure InisialisasiSupplier;
    procedure InisialisasiSKU;
    procedure InisialisasiUOM;
    function IsBisaHapus : Boolean;
    function IsBisaSimpan: Boolean;
    function IsDetailValid: Boolean;
    procedure LoadDataPenerimaanBarang(ANoPB : String);
    { Private declarations }
  protected
    procedure CetakSlip; override;
    property ReturSupplier: TReturSupplier read GetReturSupplier write
        FReturSupplier;
  public
    procedure LoadDataReturSupplier(ANoBukti : String);

    { Public declarations }
  end;

var
  frmReturSupplier: TfrmReturSupplier;

implementation
uses
  ClientModule, uDBUtils, uBarangUtils;

{$R *.dfm}

procedure TfrmReturSupplier.actCetakExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmReturSupplier.ActionBaruExecute(Sender: TObject);
begin
  inherited;
  with TServerReturSupplierClient.Create(ClientDataModule.DSRestConnection, False) do
  begin
    try
      edTglBukti.Date       := Now;
      edNoBukti.Text        := GenerateNoBukti(edTglBukti.Date, ClientDataModule.Cabang.Kode);
      edNoPB.Text           := '';
      cbbSupplier.EditValue := Null;

      cxGridTableReturSupplier.ClearRows;
      memKeterangan.Clear;

      FreeAndNil(FReturSupplier);


    finally
      Free;
    end;
  end;


end;

procedure TfrmReturSupplier.ActionHapusExecute(Sender: TObject);
begin
  inherited;
  if not IsBisaHapus then
    Exit;

  if ClientDataModule.ServerReturSupplierClient.Delete(ReturSupplier) then
  begin
    ActionRefreshExecute(Sender);
    ActionBaruExecute(Sender);
  end;
end;

procedure TfrmReturSupplier.ActionRefreshExecute(Sender: TObject);
var
  lcds: TClientDataSet;
  sIDCabang: string;
begin
  inherited;
  if chkKonsolidasi1.Checked then
    sIDCabang := ''
  else
    sIDCabang := ClientDataModule.Cabang.ID;

  lcds := TDBUtils.DSToCDS(ClientDataModule.ServerReturSupplierClient.RetrieveData(dtpAwal.DateTime, dtpAkhir.DateTime, sIDCabang), Self);
  cxGridDBTableOverview.SetDataset(lcds, True);
  cxGridDBTableOverview.ApplyBestFit();
  cxGridDBTableOverview.SetVisibleColumns([{'ID',} 'CABANGID'], False);
end;

procedure TfrmReturSupplier.ActionSimpanExecute(Sender: TObject);
var
  i: Integer;
  lReturSupplierItem: TReturSupplierItem;
begin
  inherited;
  if not IsBisaSimpan then
    Exit;

  with TServerReturSupplierClient.Create(ClientDataModule.DSRestConnection, False) do
  begin
    try
//      ReturSupplier.ID          := FID;
      ReturSupplier.NoBukti     := edNoBukti.Text;
      ReturSupplier.Keterangan  := memKeterangan.Text;
      ReturSupplier.Supplier    := TSupplier.CreateID(cbbSupplier.EditValue);
      ReturSupplier.TglBukti    := edTglBukti.Date;
      ReturSupplier.Cabang      := TCabang.CreateID(ClientDataModule.Cabang.ID);
      ReturSupplier.Gudang      := TGudang.CreateID(ReturSupplier.PenerimaanBarang.Gudang.ID);

      ReturSupplier.ReturSupplierItems.Clear;
      for i := 0 to cxGridTableReturSupplier.DataController.RecordCount - 1 do
      begin
        lReturSupplierItem                  := TReturSupplierItem.Create;
        lReturSupplierItem.Barang           := TBarang.Create;
        lReturSupplierItem.Barang.ID        := cxGridTableReturSupplier.GetString(i, cxgrdclmnGridTableReturSupplierColumnSKU.Index);

        lReturSupplierItem.Diskon           := cxGridTableReturSupplier.GetDouble(i, cxgrdclmnGridTableReturSupplierColumnDiskon.Index);
        lReturSupplierItem.HargaBeli        := cxGridTableReturSupplier.GetDouble(i, cxgrdclmnGridTableReturSupplierColumnHarga.Index);
//        lReturSupplierItem.HargaAVG         :=
        lReturSupplierItem.PPN              := cxGridTableReturSupplier.GetDouble(i, cxgrdclmnGridTableReturSupplierColumnPPN.Index);
        lReturSupplierItem.Qty              := cxGridTableReturSupplier.GetDouble(i, cxgrdclmnGridTableReturSupplierColumnQty.Index);
        lReturSupplierItem.UOM              := TUOM.Create;
        lReturSupplierItem.UOM.ID           := cxGridTableReturSupplier.GetString(i, cxgrdclmnGridTableReturSupplierColumnSatuan.Index);
        lReturSupplierItem.Konversi         := TBarangUtils.KonversiUOM(lReturSupplierItem.Barang.ID, lReturSupplierItem.UOM.ID);

        lReturSupplierItem.ReturSupplier := ReturSupplier;

        ReturSupplier.ReturSupplierItems.Add(lReturSupplierItem);

      end;

      if Save(ReturSupplier) then
      begin
        ActionBaruExecute(Sender);
      end;
    finally
      FreeAndNil(FReturSupplier);
      Free;
    end;
  end;
end;

procedure TfrmReturSupplier.btnCariClick(Sender: TObject);
var
  lPB: TPenerimaanBarang;
  sIDPB: string;
begin
  inherited;
  sIDPB := TfrmLookUpTransaksi.LookUp('Daftar Penerimaan Barang', TPenerimaanBarang.ClassName);

  if sIDPB <> '' then
  begin
    lPB   := ClientDataModule.ServerPenerimaanBarangClient.Retrieve(sIDPB);
    try
      edNoPB.Text := lPB.NoBukti;
      LoadDataPenerimaanBarang(lPB.NoBukti);
    finally
      FreeAndNil(lPB);
    end;
  end;
end;

procedure TfrmReturSupplier.CetakSlip;
var
  lcds: TFDJSONDataSets;
  sID: string;
  sIDCabang: string;
//  lcds: TClientDataSet;
begin
  with dmReport do
  begin
    AddReportVariable('UserCetak', User);
    if cxPCData.ActivePageIndex = 0 then
    begin
      sID := 'XXX';
      if not chkKonsolidasi1.Checked then
        sIDCabang := ClientDataModule.Cabang.ID;
    end else begin
      sID := ReturSupplier.ID;
      sIDCabang := 'XXX';
    end;

    lcds := ClientDataModule.ServerReturSupplierClient.RetrieveDataSlip(dtpAwal.DateTime, dtpAkhir.DateTime, sIDCabang, sID);


    ExecuteReport( 'Reports/Slip_ReturSupplier' ,
      lcds

    );
  end;
end;

procedure TfrmReturSupplier.cxGridDBTableDaftarPBEditing(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  var AAllow: Boolean);
begin
  inherited;
  AAllow := False;
end;

procedure TfrmReturSupplier.cxGridDBTableOverviewCellDblClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  LoadDataReturSupplier(cxGridDBTableOverview.DS.FieldByName('ID').AsString);
  cxPCData.ActivePageIndex := 1;
end;

procedure TfrmReturSupplier.cxGridTablePenerimaanBarangColumnDiskonPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  dNilai: Double;
begin
  inherited;
  dNilai :=  DisplayValue;
  HitungNilaiNilaiPerBaris(dNilai, cxgrdclmnGridTableReturSupplierColumnDiskon.Index);
end;

procedure TfrmReturSupplier.cxGridTablePenerimaanBarangColumnHargaPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  dNilai: Double;
begin
  inherited;
  dNilai :=  DisplayValue;
  HitungNilaiNilaiPerBaris(dNilai, cxgrdclmnGridTableReturSupplierColumnHarga.Index);
end;

procedure TfrmReturSupplier.cxGridTablePenerimaanBarangColumnNamaPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  sID: string;
begin
  inherited;
  sID := cxGridDBTableSKU.DataController.DataSource.DataSet.FieldByName('ID').AsString;
  cxGridTableReturSupplier.DataController.Values[cxGridTableReturSupplier.DataController.FocusedRecordIndex, cxgrdclmnGridTableReturSupplierColumnSKU.Index] := sID;
end;

procedure TfrmReturSupplier.cxGridTablePenerimaanBarangColumnPPNPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  dNilai: Double;
begin
  inherited;
  dNilai := DisplayValue;
  HitungNilaiNilaiPerBaris(dNilai, cxgrdclmnGridTableReturSupplierColumnPPN.Index);
end;

procedure TfrmReturSupplier.cxGridTablePenerimaanBarangColumnQtyPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  dNilai: Double;
begin
  inherited;
  dNilai :=  DisplayValue;
  HitungNilaiNilaiPerBaris(dNilai, cxgrdclmnGridTableReturSupplierColumnQty.Index);
end;

procedure TfrmReturSupplier.cxGridTablePenerimaanBarangColumnSKUPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  sID: string;
begin
  inherited;
  sID := cxGridDBTableSKU.DataController.DataSource.DataSet.FieldByName('ID').AsString;
  cxGridTableReturSupplier.DataController.Values[cxGridTableReturSupplier.DataController.FocusedRecordIndex, cxgrdclmnGridTableReturSupplierColumnNama.Index] := sID;
end;

procedure TfrmReturSupplier.edNoPBKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
var
  sAngka: string;
begin
  inherited;
  if Key = VK_RETURN then
  begin
    sAngka := RightStr(edNoPB.Text, Length(edNoPB.Text) - Pos('/', edNoPB.Text));
    TAppUtils.TambahkanKarakterNol(StrToIntDef(sAngka,0),PanjangNoBukti);

    edNoPB.Text := StringReplace(edNoPB.Text,sAngka,'',[rfReplaceAll]);
    edNoPB.Text := edNoPB.Text + TAppUtils.TambahkanKarakterNol(StrToIntDef(sAngka,0),PanjangNoBukti);

    LoadDataPenerimaanBarang(edNoPB.Text);
  end;
end;

procedure TfrmReturSupplier.FormClose(Sender: TObject; var Action:
    TCloseAction);
begin
  inherited;
  ReturSupplier.Free;
end;

procedure TfrmReturSupplier.FormShow(Sender: TObject);
begin
  inherited;
  InisialisasiSupplier;
  InisialisasiSKU;
  InisialisasiUOM;
  ActionBaruExecute(Sender);
end;

function TfrmReturSupplier.GetReturSupplier: TReturSupplier;
begin
  if FReturSupplier = nil then
    FReturSupplier := TReturSupplier.Create;

  Result := FReturSupplier;
end;

procedure TfrmReturSupplier.HitungNilaiNilaiPerBaris(dNilai: Double; Acolumn
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

  with cxGridTableReturSupplier do
  begin
    if Acolumn = cxgrdclmnGridTableReturSupplierColumnHarga.Index then
    begin
      dHarga  := dNilai;
      dQty    := GetDouble(DataController.FocusedRecordIndex, cxgrdclmnGridTableReturSupplierColumnQty.Index);
      dDiskon := GetDouble(DataController.FocusedRecordIndex, cxgrdclmnGridTableReturSupplierColumnDiskon.Index);
      dPPN    := GetDouble(DataController.FocusedRecordIndex, cxgrdclmnGridTableReturSupplierColumnPPN.Index);
    end else if Acolumn = cxgrdclmnGridTableReturSupplierColumnQty.Index then
    begin
      dHarga  := GetDouble(DataController.FocusedRecordIndex, cxgrdclmnGridTableReturSupplierColumnHarga.Index);
      dQty    := dNilai;
      dDiskon := GetDouble(DataController.FocusedRecordIndex, cxgrdclmnGridTableReturSupplierColumnDiskon.Index);
      dPPN    := GetDouble(DataController.FocusedRecordIndex, cxgrdclmnGridTableReturSupplierColumnPPN.Index);
    end else if Acolumn = cxgrdclmnGridTableReturSupplierColumnDiskon.Index then
    begin
      dHarga  := GetDouble(DataController.FocusedRecordIndex, cxgrdclmnGridTableReturSupplierColumnHarga.Index);
      dQty    := GetDouble(DataController.FocusedRecordIndex, cxgrdclmnGridTableReturSupplierColumnQty.Index);
      dDiskon := dNilai;
      dPPN    := GetDouble(DataController.FocusedRecordIndex, cxgrdclmnGridTableReturSupplierColumnPPN.Index);
    end else if Acolumn = cxgrdclmnGridTableReturSupplierColumnPPN.Index then
    begin
      dHarga  := GetDouble(DataController.FocusedRecordIndex, cxgrdclmnGridTableReturSupplierColumnHarga.Index);
      dQty    := GetDouble(DataController.FocusedRecordIndex, cxgrdclmnGridTableReturSupplierColumnQty.Index);
      dDiskon := GetDouble(DataController.FocusedRecordIndex, cxgrdclmnGridTableReturSupplierColumnDiskon.Index);
      dPPN    := dNilai;
    end;

    SetValue(DataController.FocusedRecordIndex, cxgrdclmnGridTableReturSupplierColumnSubTotalRp.Index, dHarga * dQty);
    SetValue(DataController.FocusedRecordIndex, cxgrdclmnGridTableReturSupplierColumnDiskonRp.Index, dHarga * dDiskon / 100 * dQty);
    SetValue(DataController.FocusedRecordIndex, cxgrdclmnGridTableReturSupplierColumnPPNRp.Index, dHarga * (100 - dDiskon) / 100 * dQty * dPPN / 100);
    SetValue(DataController.FocusedRecordIndex, cxgrdclmnGridTableReturSupplierColumnTotal.Index, dHarga * (100 - dDiskon) / 100 * dQty * (dPPN + 100) / 100);
  end;
end;

procedure TfrmReturSupplier.InisialisasiSKU;
var
  sSQL: string;
begin
  sSQL := 'select * from tBarang';
  cxGridDBTableSKU.SetDataset(sSQL);
end;

procedure TfrmReturSupplier.InisialisasiSupplier;
var
  sSQL: string;
begin
  sSQL := 'select * from tsupplier';
  cxGridDBTableSupplier.SetDataset(sSQL);
end;

procedure TfrmReturSupplier.InisialisasiUOM;
var
  sSQL: string;
begin
  sSQL := 'select * from tuom';
  cxGridDBTableUOM.SetDataset(sSQL);
end;

function TfrmReturSupplier.IsBisaHapus: Boolean;
begin
  Result := False;

    if not TAppUtils.Confirm('Anda yakin akan menghapus Data ?') then
      Exit;


  Result := True;
end;

function TfrmReturSupplier.IsBisaSimpan: Boolean;
begin
  Result := False;

  if cbbSupplier.EditValue = null then
  begin
    TAppUtils.Warning('Supplier Belum Dipilih');
    Exit;
  end else if not IsDetailValid then
  begin
    Exit;

  end;


  Result := True;
end;

function TfrmReturSupplier.IsDetailValid: Boolean;
var
  I: Integer;
begin
  Result := False;

  if cxGridTableReturSupplier.DataController.RecordCount <= 0 then
  begin
    TAppUtils.Warning('Detail Penerimaan Belum Diisi');
    Exit;
  end else begin
    for I := 0 to cxGridTableReturSupplier.DataController.RecordCount - 1 do
    begin
      if cxGridTableReturSupplier.DataController.Values[i, cxgrdclmnGridTableReturSupplierColumnSKU.Index] = null then
      begin
        TAppUtils.Warning('SKU Baris ke ' + IntToStr(i+1) + ' Belum Diisi');
        Exit;
      end else if cxGridTableReturSupplier.DataController.Values[i, cxgrdclmnGridTableReturSupplierColumnSatuan.Index] = null then
      begin
        TAppUtils.Warning('UOM Baris ke ' + IntToStr(i+1) + ' Belum Diisi');
        Exit;
      end else if cxGridTableReturSupplier.DataController.Values[i, cxgrdclmnGridTableReturSupplierColumnHarga.Index] = null then
      begin
        TAppUtils.Warning('Harga Baris ke ' + IntToStr(i+1) + ' Belum Diisi');
        Exit;
      end else if cxGridTableReturSupplier.DataController.Values[i, cxgrdclmnGridTableReturSupplierColumnQty.Index] = null then
      begin
        TAppUtils.Warning('Qty Baris ke ' + IntToStr(i+1) + ' Belum Diisi');
        Exit;
      end else if cxGridTableReturSupplier.DataController.Values[i, cxgrdclmnGridTableReturSupplierColumnHarga.Index] <= 0 then
      begin
        TAppUtils.Warning('Harga Baris ke ' + IntToStr(i+1) + ' Belum Diisi');
        Exit;
      end else if cxGridTableReturSupplier.DataController.Values[i, cxgrdclmnGridTableReturSupplierColumnQty.Index] <= 0 then
      begin
        TAppUtils.Warning('Qty Baris ke ' + IntToStr(i+1) + ' Belum Diisi');
        Exit;
      end;

    end;
  end;

  Result := True;
end;

procedure TfrmReturSupplier.LoadDataReturSupplier(ANoBukti : String);
var
  i: Integer;
begin
  with TServerReturSupplierClient.Create(ClientDataModule.DSRestConnection, False) do
  begin
    try
      FreeAndNil(FReturSupplier);
      FReturSupplier := Retrieve(ANoBukti);
//      FID            := ReturSupplier.ID;

      if ReturSupplier <> nil then
      begin
        edNoBukti.Text := ReturSupplier.NoBukti;
        edTglBukti.Date:= ReturSupplier.TglBukti;

        ReturSupplier.PenerimaanBarang := ClientDataModule.ServerPenerimaanBarangClient.Retrieve(ReturSupplier.PenerimaanBarang.ID);
        edNoPB.Text    := ReturSupplier.PenerimaanBarang.NoBukti;

        if ReturSupplier.Supplier.ID <> '' then
          cbbSupplier.EditValue := ReturSupplier.Supplier.ID;

        memKeterangan.Lines.Text := ReturSupplier.Keterangan;

        cxGridTableReturSupplier.ClearRows;
        for i := 0 to ReturSupplier.ReturSupplierItems.Count - 1 do
        begin
          cxGridTableReturSupplier.DataController.RecordCount := i + 1;
          cxGridTableReturSupplier.SetValue(i, cxgrdclmnGridTableReturSupplierColumnSKU.Index, FReturSupplier.ReturSupplierItems[i].Barang.ID);
          cxGridTableReturSupplier.SetValue(i, cxgrdclmnGridTableReturSupplierColumnNama.Index, FReturSupplier.ReturSupplierItems[i].Barang.ID);
          cxGridTableReturSupplier.SetValue(i, cxgrdclmnGridTableReturSupplierColumnSatuan.Index, FReturSupplier.ReturSupplierItems[i].UOM.ID);
          cxGridTableReturSupplier.SetDouble(i, cxgrdclmnGridTableReturSupplierColumnHarga.Index, FReturSupplier.ReturSupplierItems[i].HargaBeli);
          cxGridTableReturSupplier.SetDouble(i, cxgrdclmnGridTableReturSupplierColumnQty.Index, FReturSupplier.ReturSupplierItems[i].Qty);
          cxGridTableReturSupplier.SetDouble(i, cxgrdclmnGridTableReturSupplierColumnDiskon.Index,FReturSupplier.ReturSupplierItems[i].Diskon);
          cxGridTableReturSupplier.SetDouble(i, cxgrdclmnGridTableReturSupplierColumnPPN.Index, FReturSupplier.ReturSupplierItems[i].PPN);

          cxGridTableReturSupplier.DataController.FocusedRecordIndex := i;
          HitungNilaiNilaiPerBaris(FReturSupplier.ReturSupplierItems[i].PPN, cxgrdclmnGridTableReturSupplierColumnPPN.Index);


        end;

      end;
    finally
      Free;
    end;
  end;
end;

procedure TfrmReturSupplier.LoadDataPenerimaanBarang(ANoPB : String);
var
  i: Integer;
begin
  with ClientDataModule.ServerPenerimaanBarangClient do
  begin
    ReturSupplier.PenerimaanBarang := RetrieveNoBukti(ANoPB);
    cbbSupplier.EditValue := ReturSupplier.PenerimaanBarang.Supplier.ID;
    cxGridTableReturSupplier.ClearRows;
    for i := 0 to ReturSupplier.PenerimaanBarang.PenerimaanBarangItems.Count - 1 do
    begin
      cxGridTableReturSupplier.DataController.RecordCount := i + 1;
      cxGridTableReturSupplier.SetValue(i, cxgrdclmnGridTableReturSupplierColumnSKU.Index, FReturSupplier.PenerimaanBarang.PenerimaanBarangItems[i].Barang.ID);
      cxGridTableReturSupplier.SetValue(i, cxgrdclmnGridTableReturSupplierColumnNama.Index, FReturSupplier.PenerimaanBarang.PenerimaanBarangItems[i].Barang.ID);
      cxGridTableReturSupplier.SetValue(i, cxgrdclmnGridTableReturSupplierColumnSatuan.Index, FReturSupplier.PenerimaanBarang.PenerimaanBarangItems[i].UOM.ID);
      cxGridTableReturSupplier.SetDouble(i, cxgrdclmnGridTableReturSupplierColumnHarga.Index, FReturSupplier.PenerimaanBarang.PenerimaanBarangItems[i].HargaBeli);
      cxGridTableReturSupplier.SetDouble(i, cxgrdclmnGridTableReturSupplierColumnQty.Index, FReturSupplier.PenerimaanBarang.PenerimaanBarangItems[i].Qty);
      cxGridTableReturSupplier.SetDouble(i, cxgrdclmnGridTableReturSupplierColumnDiskon.Index, FReturSupplier.PenerimaanBarang.PenerimaanBarangItems[i].Diskon);
      cxGridTableReturSupplier.SetDouble(i, cxgrdclmnGridTableReturSupplierColumnPPN.Index, FReturSupplier.PenerimaanBarang.PenerimaanBarangItems[i].PPN);
      cxGridTableReturSupplier.DataController.FocusedRecordIndex := i;
      HitungNilaiNilaiPerBaris(FReturSupplier.PenerimaanBarang.PenerimaanBarangItems[i].PPN, cxgrdclmnGridTableReturSupplierColumnPPN.Index);
    end;
  end;
end;

end.
