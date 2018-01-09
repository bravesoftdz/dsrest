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
  ImgList, uModel, ClientClassesUnit, DB, cxDBData, cxGridDBTableView,
  cxDBExtLookupComboBox, Provider, DBClient, cxNavigator, dxCore, cxDateUtils,
  System.Actions, dxBarExtDBItems, cxCheckBox, cxBarEditItem, System.ImageList,
  dxBarExtItems, cxCalc, dxBarBuiltInMenu, Vcl.Menus, cxButtons, cxPC,uDMReport,
  Data.FireDACJSONReflect, uPenerimaanBarang, uSupplier;

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
    dsPB: TDataSource;
    ProvPB: TDataSetProvider;
    cdsPB: TClientDataSet;
    DSPSlip: TDataSetProvider;
    cdsSlip: TClientDataSet;
    cxgrdbclmnGridDBTableUOMColumnID: TcxGridDBColumn;
    lblGudang: TLabel;
    cbbGudang: TcxExtLookupComboBox;
    cxGridDBTableGudang: TcxGridDBTableView;
    cxGridColGudangKode: TcxGridDBColumn;
    cxGridColGudangNama: TcxGridDBColumn;
    lblJenisPembayaran: TLabel;
    lblTempo: TLabel;
    edTempo: TcxCalcEdit;
    cbbJenisPembayaran: TcxComboBox;
    procedure actCetakExecute(Sender: TObject);
    procedure ActionBaruExecute(Sender: TObject);
    procedure ActionHapusExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
    procedure cbbJenisPembayaranExit(Sender: TObject);
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
    procedure cxGridTablePenerimaanBarangColumnSatuanPropertiesInitPopup(
      Sender: TObject);
    procedure cbbJenisPembayaranPropertiesChange(Sender: TObject);
    procedure cxGridDBTableOverviewCellDblClick(Sender: TcxCustomGridTableView;
        ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
        TShiftState; var AHandled: Boolean);
  private
    FPenerimaanBarang: TPenerimaanBarang;
    function GetPenerimaanBarang: TPenerimaanBarang;
    procedure HitungNilaiNilaiPerBaris(dNilai: Double; Acolumn : Integer);
    procedure InisialisasiSupplier;
    procedure InisialisasiSKU;
    procedure InisialisasiGudang;
    procedure InisialisasiUOM;
    function IsBisaHapus : Boolean;
    function IsBisaSimpan: Boolean;
    function IsDetailValid: Boolean;
    { Private declarations }
  protected
    procedure CetakSlip; override;
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
   ClientModule, uDBUtils, uAppUtils, uBarangUtils, uReport,System.Math;

{$R *.dfm}

procedure TfrmPenerimaanBarang.actCetakExecute(Sender: TObject);
begin
  inherited;
//  CetakSlip;
//  lReport := TTSReport.Create(Self);
//  try
//    if cxPCData.ActivePageIndex = 0 then
//      DSPSlip.DataSet := ClientDataModule.ServerPenerimaanBarangClient.RetrieveCDSlip(cxGridDBTableOverview.DS.FieldByName('ID').AsString)
//    else
//      DSPSlip.DataSet := ClientDataModule.ServerPenerimaanBarangClient.RetrieveCDSlip(PenerimaanBarang.ID);
//
//    cdsSlip := TClientDataSet.Create(lReport);
//    cdsSlip.SetProvider(DSPSlip);
//    cdsSlip.Open;
//
//
//  //  cxGridDBTableDaftarPB.SetDataset(cdsSlip);
//    lReport.AddDataset(TDBUtils.OpenDataset('select * from tcabang'));
//    lReport.AddDataset(cdsSlip);
//    lReport.ShowReport('SlipPenerimaanBarang');
//  finally
//    lReport.Free;
//  end;


end;

procedure TfrmPenerimaanBarang.ActionBaruExecute(Sender: TObject);
begin
  inherited;
  with TServerPenerimaanBarangClient.Create(ClientDataModule.DSRestConnection, False) do
  begin
    try
//      FID                          := '';
      edNoBukti.Text               := GenerateNoBukti(edTglBukti.Date, ClientDataModule.Cabang.Kode);
      cbbJenisPembayaran.ItemIndex := 0;
      edTempo.Value                := 0;
      edTempo.Visible              := False;
      lblTempo.Visible             := False;

      cxGridTablePenerimaanBarang.ClearRows;
      memKeterangan.Clear;

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

  if ClientDataModule.ServerPenerimaanBarangClient.Delete(PenerimaanBarang) then
  begin
    ActionRefreshExecute(Sender);
    ActionBaruExecute(Sender);
  end;
end;

procedure TfrmPenerimaanBarang.ActionRefreshExecute(Sender: TObject);
var
  lcds: TClientDataSet;
begin
  inherited;
  if chkKonsolidasi1.Checked then
    lcds := TDBUtils.DSToCDS(ClientDataModule.ServerPenerimaanBarangClient.RetrievePenerimaan(dtpAwal.DateTime, dtpAkhir.DateTime, ''), Self)
  else
    lcds := TDBUtils.DSToCDS(ClientDataModule.ServerPenerimaanBarangClient.RetrievePenerimaan(dtpAwal.DateTime, dtpAkhir.DateTime, ClientDataModule.Cabang.ID), Self);

  cxGridDBTableOverview.SetDataset(lcds, True);
  cxGridDBTableOverview.ApplyBestFit();
  cxGridDBTableOverview.SetVisibleColumns(['ID', 'CABANGID'], False);

end;

procedure TfrmPenerimaanBarang.ActionSimpanExecute(Sender: TObject);
var
  i: Integer;
  lPenerimaanBarangItem: TPenerimaanBarangItem;
begin
  inherited;
  if not IsBisaSimpan then
    Exit;


  with TServerPenerimaanBarangClient.Create(ClientDataModule.DSRestConnection, False) do
  begin
    try
//      PenerimaanBarang.ID              := FID;
      PenerimaanBarang.NoBukti         := edNoBukti.Text;
      PenerimaanBarang.Keterangan      := memKeterangan.Text;
      PenerimaanBarang.Supplier        := TSupplier.CreateID(cbbSupplier.EditValue);
      PenerimaanBarang.Gudang          := TGudang.CreateID(cbbGudang.EditValue);
      PenerimaanBarang.TglBukti        := edTglBukti.Date;
      PenerimaanBarang.JenisPembayaran := cbbJenisPembayaran.Text;

      if PenerimaanBarang.JenisPembayaran = 'CASH' then
        PenerimaanBarang.Tempo           := 0
      else
        PenerimaanBarang.Tempo           := Floor(EdTempo.Value);

      PenerimaanBarang.Cabang          := TCabang.CreateID(ClientDataModule.Cabang.ID);


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

procedure TfrmPenerimaanBarang.cbbJenisPembayaranExit(Sender: TObject);
begin
  inherited;
  edTempo.Visible := cbbJenisPembayaran.ItemIndex = 1;
  lblTempo.Visible:= cbbJenisPembayaran.ItemIndex = 1;
end;

procedure TfrmPenerimaanBarang.cbbJenisPembayaranPropertiesChange(
  Sender: TObject);
begin
  inherited;
  edTempo.Visible := cbbJenisPembayaran.ItemIndex = 1;
  lblTempo.Visible:= cbbJenisPembayaran.ItemIndex = 1;
end;

procedure TfrmPenerimaanBarang.CetakSlip;
var
  lcds: TFDJSONDataSets;
//  lcds: TClientDataSet;
begin
  inherited;

  with dmReport do
  begin
    AddReportVariable('UserCetak', User);

    if cxPCData.ActivePageIndex = 0 then
      lcds := ClientDataModule.ServerPenerimaanBarangClient.RetrieveCDSlip(cxGridDBTableOverview.DS.FieldByName('ID').AsString)
    else
      lcds := ClientDataModule.ServerPenerimaanBarangClient.RetrieveCDSlip(PenerimaanBarang.ID);


    ExecuteReport( 'Reports/Slip_PenerimaanBarang' ,
      lcds

    );
  end;
end;

procedure TfrmPenerimaanBarang.cxGridDBTableDaftarPBEditing(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  var AAllow: Boolean);
begin
  inherited;
  AAllow := False;
end;

procedure TfrmPenerimaanBarang.cxGridDBTableOverviewCellDblClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  LoadDataPenerimaanBarang(cxGridDBTableOverview.DS.FieldByName('ID').AsString);
  cxPCData.ActivePageIndex := 1;
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

procedure TfrmPenerimaanBarang.cxGridTablePenerimaanBarangColumnSatuanPropertiesInitPopup(
  Sender: TObject);
var
  lBrg: TBarang;
  sIDBarang: string;
  i: Integer;
begin
  inherited;
  sIDBarang := cxGridTablePenerimaanBarang.GetString(cxGridTablePenerimaanBarang.DataController.FocusedRecordIndex, cxGridTablePenerimaanBarangColumnSKU.Index);
  if sIDBarang = '' then
    Exit;

  with cxGridDBTableUOM.DataController.Filter do
  begin
    BeginUpdate;
    lBrg := TBarang.Create;
    TDBUtils.LoadFromDB(lBrg, sIDBarang);
    try
      Root.Clear;
      Root.BoolOperatorKind :=  fboOr;
      for i := 0 to lBrg.BarangSatuanItems.Count - 1 do
      begin
        Root.AddItem(cxgrdbclmnGridDBTableUOMColumnID, foEqual,lBrg.BarangSatuanItems[i].UOM.ID, lBrg.BarangSatuanItems[i].UOM.ID);
      end;

     DataController.Filter.Active := True;
    finally
      EndUpdate;
      lBrg.Free;
    end;
  end;
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
  InisialisasiGudang;

  edTglBukti.Date := Now;
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

procedure TfrmPenerimaanBarang.InisialisasiGudang;
var
  sSQL: string;
begin
  sSQL := 'select * from tgudang' +
          ' where cabang = ' + QuotedStr(ClientDataModule.Cabang.ID);

  cxGridDBTableGudang.SetDataset(sSQL);
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

function TfrmPenerimaanBarang.IsBisaSimpan: Boolean;
begin
  Result := False;
  if not ValidateEmptyCtrl([1]) then
    Exit;

  if cbbSupplier.EditValue = null then
  begin
    TAppUtils.Warning('Supplier Belum Dipilih');
    Exit;
  end else if cbbGudang.EditValue = null then
  begin
    TAppUtils.Warning('Gudang Belum Dipilih');
    Exit;
  end else if not IsDetailValid then
  begin
    Exit;

  end;


  Result := True;
end;

function TfrmPenerimaanBarang.IsDetailValid: Boolean;
var
  I: Integer;
begin
  Result := False;

  if cxGridTablePenerimaanBarang.DataController.RecordCount <= 0 then
  begin
    TAppUtils.Warning('Detail Penerimaan Belum Diisi');
    Exit;
  end else begin
    for I := 0 to cxGridTablePenerimaanBarang.DataController.RecordCount - 1 do
    begin
      if cxGridTablePenerimaanBarang.DataController.Values[i, cxGridTablePenerimaanBarangColumnSKU.Index] = null then
      begin
        TAppUtils.Warning('SKU Baris ke ' + IntToStr(i+1) + ' Belum Diisi');
        Exit;
      end else if cxGridTablePenerimaanBarang.DataController.Values[i, cxGridTablePenerimaanBarangColumnSatuan.Index] = null then
      begin
        TAppUtils.Warning('UOM Baris ke ' + IntToStr(i+1) + ' Belum Diisi');
        Exit;
      end else if cxGridTablePenerimaanBarang.DataController.Values[i, cxGridTablePenerimaanBarangColumnHarga.Index] = null then
      begin
        TAppUtils.Warning('Harga Baris ke ' + IntToStr(i+1) + ' Belum Diisi');
        Exit;
      end else if cxGridTablePenerimaanBarang.DataController.Values[i, cxGridTablePenerimaanBarangColumnHarga.Index] <= 0 then
      begin
        TAppUtils.Warning('Harga Baris ke ' + IntToStr(i+1) + ' Belum Diisi');
        Exit;
      end else if cxGridTablePenerimaanBarang.DataController.Values[i, cxGridTablePenerimaanBarangColumnQty.Index] = null then
      begin
        TAppUtils.Warning('Qty Baris ke ' + IntToStr(i+1) + ' Belum Diisi');
        Exit;
      end else if cxGridTablePenerimaanBarang.DataController.Values[i, cxGridTablePenerimaanBarangColumnQty.Index] <= 0 then
      begin
        TAppUtils.Warning('Qty Baris ke ' + IntToStr(i+1) + ' Belum Diisi');
        Exit;
      end;

    end;
  end;

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
      FPenerimaanBarang := Retrieve(ANoBukti);
//      FID               := PenerimaanBarang.ID;

      if PenerimaanBarang <> nil then
      begin
        edNoBukti.Text := PenerimaanBarang.NoBukti;
        edTglBukti.Date:= PenerimaanBarang.TglBukti;

        if PenerimaanBarang.Supplier.ID <> '' then
          cbbSupplier.EditValue := PenerimaanBarang.Supplier.ID;

        if PenerimaanBarang.Gudang.ID <> '' then
          cbbGudang.EditValue := PenerimaanBarang.Gudang.ID;

        memKeterangan.Lines.Text     := PenerimaanBarang.Keterangan;
        edTempo.Value                := PenerimaanBarang.Tempo;
        cbbJenisPembayaran.ItemIndex := cbbJenisPembayaran.Properties.Items.IndexOf(PenerimaanBarang.JenisPembayaran);

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
