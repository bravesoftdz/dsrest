unit ufrmTACKirim;

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
  dxStatusBar, cxDBExtLookupComboBox, cxCurrencyEdit, dxCore, cxDateUtils,
  cxMemo, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxMaskEdit, cxCalendar,
  cxTextEdit, ClientModule, uModel, uTransferAntarGudang , uDSRestLib,
  uTAGRequests,uAppUtils, uDBUtils, uTransferAntarCabang;

type
  TfrmTACKirim = class(TfrmDefault)
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
    lblNoReq: TLabel;
    edNoRequest: TcxTextEdit;
    lblGudang: TLabel;
    cbbGudang: TcxExtLookupComboBox;
    cxgrdclmnTAGQtyRequest: TcxGridColumn;
    procedure ActionBaruExecute(Sender: TObject);
    procedure ActionHapusExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
    procedure cxGridDBTableOverviewCellDblClick(Sender: TcxCustomGridTableView;
        ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
        TShiftState; var AHandled: Boolean);
    procedure cxGridTableTAGDetailEditing(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; var AAllow: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure edNoRequestKeyDown(Sender: TObject; var Key: Word; Shift:
        TShiftState);
  private
    FCDSSKU: TClientDataSet;
    FTACKirim: TTransferAntarCabangKirim;
    FTAGReq: TTAGRequest;
    function GeTTransferAntarCabangKirim: TTransferAntarCabangKirim;
    procedure InisialisasiCBBCabangTujuan;
    procedure InisialisasiCBBGudang;
    procedure InisialisasiCBBSKU;
    procedure InisialisasiCBBUOM;
    procedure LoadDataRequest(ANoBuktiRequest : String);
    procedure LoadDataKirimItem;
    { Private declarations }
  public
    function LoadData(AID : String): Boolean;

    { Public declarations }
  published
    property TACKirim: TTransferAntarCabangKirim read GeTTransferAntarCabangKirim write FTACKirim;
  end;

var
  frmTACKirim: TfrmTACKirim;

implementation
uses
  System.StrUtils;

{$R *.dfm}

procedure TfrmTACKirim.ActionBaruExecute(Sender: TObject);
begin
  inherited;
  LoadData('');
end;

procedure TfrmTACKirim.ActionHapusExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.ConfirmHapus then
    Exit;

  if ClientDataModule.ServerTransferAntarCabangKirimClient.Delete(TACKirim) then
  begin
    TAppUtils.InformationBerhasilHapus;
    ActionBaruExecute(Sender);
  end;
end;

procedure TfrmTACKirim.ActionRefreshExecute(Sender: TObject);
var
  lcds: TClientDataSet;
begin
  inherited;
  if chkKonsolidasi1.Checked then
    lcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.RetrieveTACKirim(dtpAwal.DateTime, dtpAkhir.DateTime, nil), cxGridDBTableOverview)
  else
    lcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.RetrieveTACKirim(dtpAwal.DateTime, dtpAkhir.DateTime, ClientDataModule.Cabang), cxGridDBTableOverview);

  cxGridDBTableOverview.SetDataset(lcds, True);
  cxGridDBTableOverview.SetVisibleColumns(['ID', 'TOCABANGID','CABANGID'], False);
  cxGridDBTableOverview.ApplyBestFit();
end;

procedure TfrmTACKirim.ActionSimpanExecute(Sender: TObject);
var
  I: Integer;
  lTACKirimItem: TTransferAntarCabangKirimItem;
begin
  inherited;
  if not ValidateEmptyCtrl([1]) then
    Exit;

  if TACKirim.ObjectState = 1 then
    edNoBukti.Text := ClientDataModule.ServerTransferAntarCabangKirimClient.GenerateNoBukti(Now,
    ClientDataModule.Cabang.Kode);


  TACKirim.GudangTujuan := TGudang.CreateID(ClientDataModule.SettingApp.GudangTransit.ID);
  TACKirim.Cabang       := TCabang.CreateID(ClientDataModule.Cabang.ID);
  TACKirim.GudangAsal   := TGudang.CreateID(cbbGudang.EditValue);
  TACKirim.Keterangan   := memKeterangan.Text;
  TACKirim.NoBukti      := edNoBukti.Text;
  TACKirim.Petugas      := edPetugas.Text;
  TACKirim.TAGRequest   := TTAGRequest.CreateID(FTAGReq.ID);
  TACKirim.TglBukti     := edTglBukti.Date;
  TACKirim.ToCabang     := TCabang.CreateID(cbbCabangTujuan.EditValue);

  TACKirim.TransferAntarCabangKirimItems.Clear;
  for I := 0 to cxGridTableTAGDetail.DataController.RecordCount - 1 do
  begin
    lTACKirimItem := TTransferAntarCabangKirimItem.Create;
    cxGridTableTAGDetail.LoadObjectData(lTACKirimItem, i);
    TACKirim.TransferAntarCabangKirimItems.Add(lTACKirimItem);
  end;

  if ClientDataModule.ServerTransferAntarCabangKirimClient.Save(TACKirim) then
  begin
    TAppUtils.InformationBerhasilSimpan;
    ActionBaruExecute(Sender);
  end;
end;

procedure TfrmTACKirim.cxGridDBTableOverviewCellDblClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if LoadData(cxGridDBTableOverview.DS.FieldByName('id').AsString) then
    cxPCData.ActivePageIndex := 1;
end;

procedure TfrmTACKirim.cxGridTableTAGDetailEditing(Sender:
    TcxCustomGridTableView; AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  inherited;
  AAllow := True;
  if AItem.Index in [cxgrdclmnTAGQtyRequest.Index] then
    AAllow := False;
end;

procedure TfrmTACKirim.FormCreate(Sender: TObject);
begin
  inherited;
  InisialisasiCBBGudang;
  InisialisasiCBBCabangTujuan;
  InisialisasiCBBSKU;
  InisialisasiCBBUOM;

  ActionBaruExecute(Sender);
end;

procedure TfrmTACKirim.edNoRequestKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
var
  sAngka: string;
begin
  inherited;
  if Key = VK_RETURN then
  begin
    sAngka := RightStr(edNoRequest.Text, Length(edNoRequest.Text) - Pos('/', edNoRequest.Text));
    TAppUtils.TambahkanKarakterNol(StrToIntDef(sAngka,0),10);

    edNoRequest.Text := StringReplace(edNoRequest.Text,sAngka,'',[rfReplaceAll]);
    edNoRequest.Text := edNoRequest.Text + TAppUtils.TambahkanKarakterNol(StrToIntDef(sAngka,0),10);

    LoadDataRequest(edNoRequest.Text);
  end;
end;

function TfrmTACKirim.GeTTransferAntarCabangKirim: TTransferAntarCabangKirim;
begin
  if FTACKirim = nil then
    FTACKirim := TTransferAntarCabangKirim.Create;

  Result := FTACKirim;
end;

procedure TfrmTACKirim.InisialisasiCBBCabangTujuan;
var
  lCDSCabangTujuan: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select ID,Nama,Kode from tcabang order by Nama';
  lCDSCabangTujuan := TDBUtils.OpenDataset(sSQL);
  cbbCabangTujuan.Properties.LoadFromCDS(lCDSCabangTujuan,'ID','Nama',['ID'],Self);
  cbbCabangTujuan.Properties.SetMultiPurposeLookup;
end;

procedure TfrmTACKirim.InisialisasiCBBGudang;
var
  lCDSGudang: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select nama,kode,id from tgudang ' +
          ' where cabang = ' + QuotedStr(ClientDataModule.Cabang.ID);

  lCDSGudang := TDBUtils.OpenDataset(sSQL, Self);
  cbbGudang.Properties.LoadFromCDS(lCDSGudang,'ID','Nama',['ID'],Self);
  cbbGudang.Properties.SetMultiPurposeLookup;
end;

procedure TfrmTACKirim.InisialisasiCBBSKU;
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

  FCDSSKU := TDBUtils.OpenDataset(sSQL);

  TcxExtLookupComboBoxProperties(cxGridTableTAGDetail.Columns[cxgrdclmnTAGNamaBarang.Index].Properties).LoadFromCDS(FCDSSKU,'ID','Nama',['ID'],Self);
  TcxExtLookupComboBoxProperties(cxGridTableTAGDetail.Columns[cxgrdclmnTAGNamaBarang.Index].Properties).SetMultiPurposeLookup();
  TcxExtLookupComboBoxProperties(cxGridTableTAGDetail.Columns[cxgrdclmnTAGNamaBarang.Index].Properties).cxDBTableGrid.SetVisibleColumns(['barang','uom','id','KONVERSI'], FALSE);
  TcxExtLookupComboBoxProperties(cxGridTableTAGDetail.Columns[cxgrdclmnTAGNamaBarang.Index].Properties).cxDBTableGrid.ApplyBestFit();

  sSQL := 'select Nama,sku, ID from TBarang';
  lCDSNama := TDBUtils.OpenDataset(sSQL);
  TcxExtLookupComboBoxProperties(cxGridTableTAGDetail.Columns[cxgrdclmnTAGKodeBarang.Index].Properties).LoadFromCDS(lCDSNama,'ID','SKU',['ID'],Self);
  TcxExtLookupComboBoxProperties(cxGridTableTAGDetail.Columns[cxgrdclmnTAGKodeBarang.Index].Properties).SetMultiPurposeLookup;

end;

procedure TfrmTACKirim.InisialisasiCBBUOM;
var
  lCDSUOM: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select uom,ID from TUOM';
  lCDSUOM := TDBUtils.OpenDataset(sSQL);

  TcxExtLookupComboBoxProperties(cxGridTableTAGDetail.Columns[cxgrdclmnTAGUOM.Index].Properties).LoadFromCDS(lCDSUOM,'ID','UOM',['ID'],Self);
  TcxExtLookupComboBoxProperties(cxGridTableTAGDetail.Columns[cxgrdclmnTAGUOM.Index].Properties).SetMultiPurposeLookup;

end;

function TfrmTACKirim.LoadData(AID : String): Boolean;
begin
  Result := False;

  FID := '';
  FreeAndNil(FTACKirim);
  FreeAndNil(FTAGReq);
  ClearByTag([0,1]);
  cxGridTableTAGDetail.ClearRows;

  edPetugas.Text := 'AKU';
  edNoBukti.Text := 'Otomatis';

  if AID = '' then
    Exit;

  FTACKirim := ClientDataModule.ServerTransferAntarCabangKirimClient.Retrieve(AID);
  if TACKirim.ID = '' then
    Exit;

  edNoBukti.Text := TACKirim.NoBukti;
  edTglBukti.Date:= TACKirim.TglBukti;
  edPetugas.Text := TACKirim.Petugas;

  FTAGReq := ClientDataModule.ServerTAGRequestClient.Retrieve(TACKirim.TAGRequest.ID);
  cbbCabangTujuan.EditValue := FTAGReq.Cabang.ID;
  edNoRequest.Text := FTAGReq.NoBukti;
  LoadDataKirimItem;

  cbbGudang.EditValue := TACKirim.GudangAsal.ID;

  Result := True;
end;

procedure TfrmTACKirim.LoadDataKirimItem;
var
  I: Integer;
begin
  cxGridTableTAGDetail.ClearRows;
  for I := 0 to FTACKirim.TransferAntarCabangKirimItems.Count - 1 do
  begin
    cxGridTableTAGDetail.AddRow;
    cxGridTableTAGDetail.SetObjectData(FTACKirim.TransferAntarCabangKirimItems[i], i);
  end;
end;

procedure TfrmTACKirim.LoadDataRequest(ANoBuktiRequest : String);
var
  I: Integer;
begin
  FreeAndNil(FTAGReq);
  FTAGReq := ClientDataModule.ServerTAGRequestClient.RetrieveNoBukti(ANoBuktiRequest);

  if FTAGReq = nil  then
    Exit;

  if FTAGReq.ID = ''  then
    Exit;


  if FTAGReq.Cabang.ID = ClientDataModule.Cabang.ID then
  begin
    TAppUtils.Error('Permintaan Transfer Barang Tidak Ditujukan Untuk Cabang Ini');
    Exit;
  end;

  cbbCabangTujuan.EditValue := FTAGReq.Cabang.ID;

  cxGridTableTAGDetail.ClearRows;
  for I := 0 to FTAGReq.TAGRequestItems.Count - 1 do
  begin
    cxGridTableTAGDetail.AddRow;
    cxGridTableTAGDetail.SetObjectData(FTAGReq.TAGRequestItems[i], i);
    cxGridTableTAGDetail.SetDouble(i, cxgrdclmnTAGQty.Index,cxGridTableTAGDetail.GetDouble(i, cxgrdclmnTAGQtyRequest.Index) );
  end;
end;

end.
