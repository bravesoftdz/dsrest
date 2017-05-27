unit ufrmTACTerima;

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
  dxStatusBar, uModel, uDBUtils, ClientModule,  cxDBExtLookupComboBox,
  cxCurrencyEdit, dxCore, cxDateUtils, cxMemo, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxMaskEdit, cxCalendar, cxTextEdit,  uTransferAntarCabang, uAppUtils,
  System.StrUtils, uModelHelper;

type
  TfrmTACTerima = class(TfrmDefault)
    pnlHeader: TPanel;
    lblNoBukti: TLabel;
    lblTglBukti: TLabel;
    lblPembeli: TLabel;
    lblKeterangan: TLabel;
    lblPetugas: TLabel;
    lblNoReq: TLabel;
    lblGudang: TLabel;
    edNoBukti: TcxTextEdit;
    edTglBukti: TcxDateEdit;
    cbbCabangAsal: TcxExtLookupComboBox;
    memKeterangan: TcxMemo;
    edPetugas: TcxTextEdit;
    edNoKirim: TcxTextEdit;
    cbbGudang: TcxExtLookupComboBox;
    cxGridDBTAGDetail: TcxGrid;
    cxGridTableTAGDetail: TcxGridTableView;
    cxgrdclmnTAGNamaBarang: TcxGridColumn;
    cxgrdclmnTAGKodeBarang: TcxGridColumn;
    cxgrdclmnTAGUOM: TcxGridColumn;
    cxgrdclmnTAGQtyRequest: TcxGridColumn;
    cxgrdclmnTAGQty: TcxGridColumn;
    cxgrdclmnTAGKeterangan: TcxGridColumn;
    cxgrdlvlTAGDetail: TcxGridLevel;
    procedure ActionBaruExecute(Sender: TObject);
    procedure ActionHapusExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
    procedure cxGridDBTableOverviewCellDblClick(Sender: TcxCustomGridTableView;
        ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
        TShiftState; var AHandled: Boolean);
    procedure cxGridTableTAGDetailEditing(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; var AAllow: Boolean);
    procedure edNoKirimKeyDown(Sender: TObject; var Key: Word; Shift:
        TShiftState);
  private
    FCDSSKU: TClientDataSet;
    FTACKirim: TTransferAntarCabangKirim;
    FTACTerima: TTransferAntarCabangTerima;
    function GetTACTerima: TTransferAntarCabangTerima;
    procedure InisialisasiCBBCabangAsal;
    procedure InisialisasiCBBGudang;
    procedure InisialisasiCBBSKU;
    procedure InisialisasiCBBUOM;
    function LoadData(AID : String): Boolean;
    procedure LoadDataKirim(ANoBukti : String); overload;
    procedure LoadDataKirim(ATransferAntarCabangKirim : TTransferAntarCabangKirim);
        overload;
    procedure LoadDataKirimTerima;
    property TACTerima: TTransferAntarCabangTerima read GetTACTerima write
        FTACTerima;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTACTerima: TfrmTACTerima;

implementation

{$R *.dfm}

procedure TfrmTACTerima.ActionBaruExecute(Sender: TObject);
begin
  inherited;
  LoadData('');
end;

procedure TfrmTACTerima.ActionHapusExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.ConfirmHapus then
    Exit;

  try
    if ClientDataModule.ServerTransferAntarCabangTerimaClient.Delete(TACTerima) then
    begin
      TAppUtils.InformationBerhasilHapus;
      ActionBaruExecute(Sender);
    end;
  except
    raise
  end;
end;

procedure TfrmTACTerima.FormCreate(Sender: TObject);
begin
  inherited;
  InisialisasiCBBGudang;
  InisialisasiCBBCabangAsal;
  InisialisasiCBBSKU;
  InisialisasiCBBUOM;

  ActionBaruExecute(Sender);
end;

procedure TfrmTACTerima.ActionRefreshExecute(Sender: TObject);
var
  lcds: TClientDataSet;
begin
  inherited;
  if chkKonsolidasi1.Checked then
    lcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.RetrieveTACTerima(dtpAwal.DateTime, dtpAkhir.DateTime, nil), cxGridDBTableOverview)
  else
    lcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.RetrieveTACTerima(dtpAwal.DateTime, dtpAkhir.DateTime, ClientDataModule.Cabang), cxGridDBTableOverview);

  cxGridDBTableOverview.SetDataset(lcds, True);
  cxGridDBTableOverview.SetVisibleColumns(['ID', 'FROMCABANGID','CABANGID'], False);
  cxGridDBTableOverview.ApplyBestFit();
end;

procedure TfrmTACTerima.ActionSimpanExecute(Sender: TObject);
var
  I: Integer;
  lTACTerimaItem: TTransferAntarCabangTerimaItem;
begin

  inherited;
  if TACTerima.ObjectState = 1 then
    edNoBukti.Text := ClientDataModule.ServerTransferAntarCabangTerimaClient.GenerateNoBukti(Now,
    ClientDataModule.Cabang.Kode);


  if not ValidateEmptyCtrl([1]) then
    Exit;


  TACTerima.GudangAsal   := TGudang.CreateID(ClientDataModule.SettingApp.GudangTransit.ID);
  TACTerima.Cabang       := TCabang.CreateID(ClientDataModule.Cabang.ID);
  TACTerima.Gudang       := TGudang.CreateID(cbbGudang.EditValue);
  TACTerima.Keterangan   := memKeterangan.Text;
  TACTerima.NoBukti      := edNoBukti.Text;
  TACTerima.Petugas      := edPetugas.Text;
  TACTerima.TransferAntarCabangKirim   := TTransferAntarCabangKirim.CreateID(FTACKirim.ID);
  TACTerima.TglBukti     := edTglBukti.Date;
  TACTerima.FromCabang   := TCabang.CreateID(cbbCabangAsal.EditValue);

  TACTerima.TransferAntarCabangTerimaItems.Clear;
  for I := 0 to cxGridTableTAGDetail.DataController.RecordCount - 1 do
  begin
    lTACTerimaItem := TTransferAntarCabangTerimaItem.Create;
    cxGridTableTAGDetail.LoadObjectData(lTACTerimaItem, i);
    TACTerima.TransferAntarCabangTerimaItems.Add(lTACTerimaItem);
  end;

  if ClientDataModule.ServerTransferAntarCabangTerimaClient.Save(TACTerima) then
  begin
    TAppUtils.InformationBerhasilSimpan;
    ActionBaruExecute(Sender);
  end;

end;

procedure TfrmTACTerima.cxGridDBTableOverviewCellDblClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if LoadData(cxGridDBTableOverview.DS.FieldByName('ID').AsString) then
    cxPCData.ActivePageIndex := 1;

end;

procedure TfrmTACTerima.cxGridTableTAGDetailEditing(Sender:
    TcxCustomGridTableView; AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  inherited;
  AAllow := AItem.Index in [cxgrdclmnTAGQty.Index];
end;

procedure TfrmTACTerima.edNoKirimKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
var
  sAngka: string;
begin
  inherited;
  if Key = VK_RETURN then
  begin
    sAngka := RightStr(edNoKirim.Text, Length(edNoKirim.Text) - Pos('/', edNoKirim.Text));
    TAppUtils.TambahkanKarakterNol(StrToIntDef(sAngka,0),10);

    edNoKirim.Text := StringReplace(edNoKirim.Text,sAngka,'',[rfReplaceAll]);
    edNoKirim.Text := edNoKirim.Text + TAppUtils.TambahkanKarakterNol(StrToIntDef(sAngka,0),10);

    LoadDataKirim(edNoKirim.Text);
  end;
end;

function TfrmTACTerima.GetTACTerima: TTransferAntarCabangTerima;
begin
  if FTACTerima = nil then
    FTACTerima := TTransferAntarCabangTerima.Create;

  Result := FTACTerima;
end;

procedure TfrmTACTerima.InisialisasiCBBCabangAsal;
var
  lCDSCabangTujuan: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select ID,Nama,Kode from tcabang order by Nama';
  lCDSCabangTujuan := TDBUtils.OpenDataset(sSQL);
  cbbCabangAsal.Properties.LoadFromCDS(lCDSCabangTujuan,'ID','Nama',['ID'],Self);
  cbbCabangAsal.Properties.SetMultiPurposeLookup;
end;

procedure TfrmTACTerima.InisialisasiCBBGudang;
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

procedure TfrmTACTerima.InisialisasiCBBSKU;
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

procedure TfrmTACTerima.InisialisasiCBBUOM;
var
  lCDSUOM: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select uom,ID from TUOM';
  lCDSUOM := TDBUtils.OpenDataset(sSQL);

  TcxExtLookupComboBoxProperties(cxGridTableTAGDetail.Columns[cxgrdclmnTAGUOM.Index].Properties).LoadFromCDS(lCDSUOM,'ID','UOM',['ID'],Self);
  TcxExtLookupComboBoxProperties(cxGridTableTAGDetail.Columns[cxgrdclmnTAGUOM.Index].Properties).SetMultiPurposeLookup;

end;

function TfrmTACTerima.LoadData(AID : String): Boolean;
begin
  Result := False;

  try
    ClearByTag([0,1]);
    FreeAndNil(FTACKirim);
    FreeAndNil(FTACTerima);


    cxGridTableTAGDetail.ClearRows;

    edTglBukti.Date         := Now;
    edPetugas.Text          := 'AKU';

    if AID = '' then
    begin
      Result := True;
      Exit;
    end;

    FTACTerima := ClientDataModule.ServerTransferAntarCabangTerimaClient.Retrieve(AID);
    if FTACTerima = nil then
      Exit;

    if FTACTerima.ID = '' then
      Exit;

    cbbGudang.EditValue := FTACTerima.Gudang.ID;
    edNoBukti.Text := FTACTerima.NoBukti;
    edTglBukti.Date:= FTACTerima.TglBukti;
    edPetugas.Text := FTACTerima.Petugas;
    memKeterangan.Text := FTACTerima.Keterangan;
    cbbCabangAsal.EditValue := FTACTerima.FromCabang.ID;


    FTACKirim := ClientDataModule.ServerTransferAntarCabangKirimClient.Retrieve(FTACTerima.TransferAntarCabangKirim.ID);
    edNoKirim.Text := FTACKirim.NoBukti;
    LoadDataKirimTerima;

    Result := True;
  except
    raise;
  end;
end;

procedure TfrmTACTerima.LoadDataKirim(ANoBukti : String);
begin
  FreeAndNil(FTACKirim);
  FTACKirim := ClientDataModule.ServerTransferAntarCabangKirimClient.RetrieveNoBukti(ANoBukti);

  if FTACKirim = nil  then
    Exit;

  if FTACKirim.ID = ''  then
    Exit;


  LoadDataKirim(FTACKirim);
end;

procedure TfrmTACTerima.LoadDataKirim(ATransferAntarCabangKirim :
    TTransferAntarCabangKirim);
var
  i: Integer;
begin
  if ATransferAntarCabangKirim.Cabang.ID = ClientDataModule.Cabang.ID then
  begin
    TAppUtils.Error('Transfer Barang Tidak Ditujukan Untuk Cabang Ini');
    Exit;
  end;

  cbbCabangAsal.EditValue := FTACKirim.Cabang.ID;

  cxGridTableTAGDetail.ClearRows;
  for I := 0 to ATransferAntarCabangKirim.TransferAntarCabangKirimItems.Count - 1 do
  begin
    cxGridTableTAGDetail.AddRow;
    cxGridTableTAGDetail.SetObjectData(ATransferAntarCabangKirim.TransferAntarCabangKirimItems[i], i);
    cxGridTableTAGDetail.SetDouble(i, cxgrdclmnTAGQty.Index,cxGridTableTAGDetail.GetDouble(i, cxgrdclmnTAGQtyRequest.Index));
  end;
end;

procedure TfrmTACTerima.LoadDataKirimTerima;
var
  I: Integer;
begin
  cxGridTableTAGDetail.ClearRows;
  for I := 0 to FTACTerima.TransferAntarCabangTerimaItems.Count - 1 do
  begin
    cxGridTableTAGDetail.AddRow;
    cxGridTableTAGDetail.SetObjectData(FTACTerima.TransferAntarCabangTerimaItems[i], i);
  end;
end;

end.
