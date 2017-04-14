unit ufrmTAGRequest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, Vcl.Menus, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, System.ImageList, Vcl.ImgList, Datasnap.DBClient,
  Datasnap.Provider, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, System.Actions, Vcl.ActnList, cxCheckBox, cxGridLevel, cxClasses,
  cxGridCustomView, Vcl.StdCtrls, cxButtons, Vcl.ComCtrls, Vcl.ExtCtrls, cxPC,
  dxStatusBar, dxCore, cxDateUtils, cxMemo, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox, cxMaskEdit, cxCalendar, cxTextEdit,
  cxCurrencyEdit, uInterface, uAppUtils, uDBUtils, uModel, uTAGRequests, ClientModule;

type
  TfrmTAGRequest = class(TfrmDefault, IForm)
    cxgrdlvlTAGReqIn: TcxGridLevel;
    cxGridDBTableTAGReqIn: TcxGridDBTableView;
    pnlHeader: TPanel;
    lblNoBukti: TLabel;
    lblTglBukti: TLabel;
    lblPembeli: TLabel;
    lblKeterangan: TLabel;
    lblPetugas: TLabel;
    edNoBukti: TcxTextEdit;
    edTglBukti: TcxDateEdit;
    cbbCabangTujuan: TcxExtLookupComboBox;
    memKeterangan: TcxMemo;
    edPetugas: TcxTextEdit;
    cxGridDBTAGDetail: TcxGrid;
    cxGridTableTAGDetail: TcxGridTableView;
    cxgrdclmnTAGNamaBarang: TcxGridColumn;
    cxgrdclmnTAGKodeBarang: TcxGridColumn;
    cxgrdclmnTAGUOM: TcxGridColumn;
    cxgrdclmnTAGQty: TcxGridColumn;
    cxgrdclmnTAGKeterangan: TcxGridColumn;
    cxgrdlvlTAGDetail: TcxGridLevel;
    procedure ActionBaruExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
    procedure cxgrdclmnTAGNamaBarangPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    FCDSSKU: TClientDataSet;
    FTAGRequest: TTAGRequest;
    function GetTAGRequest: TTAGRequest;
    procedure InisialisasiCBBCabangTujuan;
    procedure InisialisasiCBBSKU;
    procedure InisialisasiCBBUOM;
//    procedure SetUOM;
    property CDSSKU: TClientDataSet read FCDSSKU write FCDSSKU;
    property TAGRequest: TTAGRequest read GetTAGRequest write FTAGRequest;
    { Private declarations }
  public
    destructor Destroy; override;
    function LoadData(AID : String): Boolean; stdcall;
    { Public declarations }
  end;

var
  frmTAGRequest: TfrmTAGRequest;

implementation

{$R *.dfm}

destructor TfrmTAGRequest.Destroy;
begin
  inherited;
  TAGRequest.Free;
end;

procedure TfrmTAGRequest.ActionBaruExecute(Sender: TObject);
begin
  inherited;
  LoadData('')
end;

procedure TfrmTAGRequest.ActionRefreshExecute(Sender: TObject);
var
  lcds: TClientDataSet;
begin
  inherited;
  if chkKonsolidasi1.Checked then
    lcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.RetrieveCDSTAGRequestKepada(dtpAwal.DateTime, dtpAkhir.DateTime, nil), cxGridDBTableOverview)
  else
    lcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.RetrieveCDSTAGRequestKepada(dtpAwal.DateTime, dtpAkhir.DateTime, ClientDataModule.Cabang), cxGridDBTableOverview);

  cxGridDBTableOverview.SetDataset(lcds, True);
  cxGridDBTableOverview.SetVisibleColumns(['ID', 'TOCABANGID','CABANGID'], False);
  cxGridDBTableOverview.ApplyBestFit();

  if chkKonsolidasi1.Checked then
    lcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.RetrieveCDSTAGRequestDari(dtpAwal.DateTime, dtpAkhir.DateTime, nil), cxGridDBTableTAGReqIn)
  else
    lcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.RetrieveCDSTAGRequestDari(dtpAwal.DateTime, dtpAkhir.DateTime, ClientDataModule.Cabang), cxGridDBTableTAGReqIn);

  cxGridDBTableTAGReqIn.SetDataset(lcds, True);
  cxGridDBTableTAGReqIn.SetVisibleColumns(['ID', 'TOCABANGID', 'CABANGID'], False);
  cxGridDBTableTAGReqIn.ApplyBestFit();
end;

procedure TfrmTAGRequest.FormCreate(Sender: TObject);
begin
  inherited;
  InisialisasiCBBCabangTujuan;
  InisialisasiCBBSKU;
  InisialisasiCBBUOM;

  ActionBaruExecute(Sender);
end;

procedure TfrmTAGRequest.ActionSimpanExecute(Sender: TObject);
var
  I: Integer;
  lTagRequestItem: TTAGRequestItem;
begin
  inherited;
  if not ValidateEmptyCtrl([1]) then
    Exit;

  if TAGRequest.ObjectState = 1 then
    edNoBukti.Text := ClientDataModule.ServerTAGRequestClient.GenerateNoBukti(edTglBukti.Date,'TACR');

  TAGRequest.Cabang     := TCabang.CreateID(ClientDataModule.Cabang.ID);
  TAGRequest.Keterangan := memKeterangan.Text;
  TAGRequest.NoBukti    := edNoBukti.Text;
  TAGRequest.Petugas    := edPetugas.Text;
  TAGRequest.TglBukti   := edTglBukti.Date;
  TAGRequest.ToCabang   := TCabang.CreateID(cbbCabangTujuan.EditValue);
  TAGRequest.Status     := 'ORDER';

  for I := 0 to cxGridTableTAGDetail.DataController.RecordCount - 1 do
  begin
    lTagRequestItem := TTAGRequestItem.Create;
    cxGridTableTAGDetail.LoadObjectData(lTagRequestItem,i);
    TAGRequest.TAGRequestItems.Add(lTagRequestItem);
  end;

  if ClientDataModule.ServerTAGRequestClient.Save(TAGRequest) then
  begin
    TAppUtils.InformationBerhasilSimpan;
    ActionBaruExecute(Sender);
  end;
end;

procedure TfrmTAGRequest.cxgrdclmnTAGNamaBarangPropertiesValidate(
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

end;

function TfrmTAGRequest.GetTAGRequest: TTAGRequest;
begin
  if FTAGRequest = nil then
    FTAGRequest := TTAGRequest.Create;

  Result := FTAGRequest;
end;

procedure TfrmTAGRequest.InisialisasiCBBCabangTujuan;
var
  lCDSCabangTujuan: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select ID,Nama,Kode from tcabang order by Nama';
  lCDSCabangTujuan := TDBUtils.OpenDataset(sSQL);
  cbbCabangTujuan.Properties.LoadFromCDS(lCDSCabangTujuan,'ID','Nama',['ID'],Self);
  cbbCabangTujuan.Properties.SetMultiPurposeLookup;
end;

procedure TfrmTAGRequest.InisialisasiCBBSKU;
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

procedure TfrmTAGRequest.InisialisasiCBBUOM;
var
  lCDSUOM: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select uom,ID from TUOM';
  lCDSUOM := TDBUtils.OpenDataset(sSQL);

  TcxExtLookupComboBoxProperties(cxGridTableTAGDetail.Columns[cxgrdclmnTAGUOM.Index].Properties).LoadFromCDS(lCDSUOM,'ID','UOM',['ID'],Self);
  TcxExtLookupComboBoxProperties(cxGridTableTAGDetail.Columns[cxgrdclmnTAGUOM.Index].Properties).SetMultiPurposeLookup;

end;

function TfrmTAGRequest.LoadData(AID : String): Boolean;
var
  I: Integer;
begin
  Result := False;

  ClearByTag([0,1]);
  FreeAndNil(FTAGRequest);
  cxGridTableTAGDetail.ClearRows;
  edPetugas.Text := 'AKU';
  edNoBukti.Text := 'Otomatis';

  if AID = '' then
  begin
    Result := True;
    Exit;
  end;

  FTAGRequest := ClientDataModule.ServerTAGRequestClient.Retrieve(AID);

  if FTAGRequest = nil then
    Exit;

  edNoBukti.Text            := FTAGRequest.NoBukti;
  edTglBukti.Date           := FTAGRequest.TglBukti;
  edPetugas.Text            := FTAGRequest.Petugas;
  memKeterangan.Text        := FTAGRequest.Keterangan;
  cbbCabangTujuan.EditValue := FTAGRequest.Cabang.ID;

  for I := 0 to FTAGRequest.TAGRequestItems.Count - 1 do
  begin
    cxGridTableTAGDetail.DataController.RecordCount := cxGridTableTAGDetail.DataController.RecordCount + 1;
    cxGridTableTAGDetail.SetObjectData(FTAGRequest.TAGRequestItems[i], i);
  end;
end;

//procedure TfrmTAGRequest.SetUOM;
//begin
//  cxGridTableTAGDetail.SetValue(cxGridTableTAGDetail.DataController.FocusedRecordIndex, cxgrdclmnTAGKodeBarang.Index, CDSSKU.FieldByName('barang').AsString);
//  cxGridTableTAGDetail.SetValue(cxGridTableTAGDetail.DataController.FocusedRecordIndex, cxgrdclmnTAGUOM.Index, CDSSKU.FieldByName('uom').AsString);
//end;

end.
