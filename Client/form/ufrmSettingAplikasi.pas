unit ufrmSettingAplikasi;

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
  dxStatusBar, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox, uSettingApp, cxCurrencyEdit, uRekBank;

type
  TfrmSettingAplikasi = class(TfrmDefault)
    lblGudangPenjualan: TLabel;
    cbbGudangPenjualan: TcxExtLookupComboBox;
    lblCabang: TLabel;
    cbbCabang: TcxExtLookupComboBox;
    lblGudangTransit: TLabel;
    cbbGudangTransit: TcxExtLookupComboBox;
    lblMaxBelanja: TLabel;
    edMaxBelanjaHari: TcxCurrencyEdit;
    lblAkunKasPOS: TLabel;
    cbbKasPOS: TcxExtLookupComboBox;
    procedure ActionBaruExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
    procedure cxPCDataChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGridDBTableOverviewCellDblClick(Sender: TcxCustomGridTableView;
        ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
        TShiftState; var AHandled: Boolean);
    procedure btnHapusClick(Sender: TObject);
  private
    FCDSBank: tclientDataSet;
    FSettingApp: TSettingApp;
    function GetSettingApp: TSettingApp;
    procedure InisialisasiCBBGudang;
    procedure InisialisasiCBBCabang;
    procedure InisialisasiRekBang;
    property SettingApp: TSettingApp read GetSettingApp write FSettingApp;
    { Private declarations }
  public
    destructor Destroy; override;
    procedure LoadData(AID : String);
    { Public declarations }
  end;

var
  frmSettingAplikasi: TfrmSettingAplikasi;

implementation
uses
  uDBUtils, uAppUtils, uModel, ClientModule;

{$R *.dfm}

destructor TfrmSettingAplikasi.Destroy;
begin
  inherited;
  SettingApp.Free;
end;

procedure TfrmSettingAplikasi.ActionBaruExecute(Sender: TObject);
begin
  inherited;
  LoadData('');
end;

procedure TfrmSettingAplikasi.ActionRefreshExecute(Sender: TObject);
var
  lcds: TClientDataSet;
begin
  inherited;
  if chkKonsolidasi1.Checked then
    lcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.RetriveSettingApp(nil), cxGridDBTableOverview)
  else
    lcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.RetriveSettingApp(ClientDataModule.Cabang), cxGridDBTableOverview);

  cxGridDBTableOverview.SetDataset(lcds, True);
  cxGridDBTableOverview.SetVisibleColumns(['ID', 'CABANGID'], False);
  cxGridDBTableOverview.ApplyBestFit();
end;

procedure TfrmSettingAplikasi.ActionSimpanExecute(Sender: TObject);
begin
  inherited;
  if not ValidateEmptyCtrl([1]) then
    Exit;

  SettingApp.Cabang          := TCabang.CreateID(cbbCabang.EditValue);
  SettingApp.GudangPenjualan := TGudang.CreateID(cbbGudangPenjualan.EditValue);
  SettingApp.GudangTransit   := TGudang.CreateID(cbbGudangTransit.EditValue);
  SettingApp.MaxBelanjaSantri:= edMaxBelanjaHari.Value;
  SettingApp.KasPOS          := TRekBank.CreateID(cbbKasPOS.EditValue);

  try
    if ClientDataModule.ServerSettingAppClient.Save(SettingApp) then
    begin
      TAppUtils.InformationBerhasilSimpan;

      ClientDataModule.SettingApp.Free;
      ClientDataModule.SettingApp := ClientDataModule.ServerSettingAppClient.RetrieveByCabang(ClientDataModule.Cabang.ID);
    end;
  except
    raise
  end;

end;

procedure TfrmSettingAplikasi.btnHapusClick(Sender: TObject);
begin
  inherited;
  if not TAppUtils.ConfirmHapus then
    Exit;

  try
    if ClientDataModule.ServerSettingAppClient.Delete(SettingApp) then
    begin
      TAppUtils.InformationBerhasilHapus;
      LoadData('');
    end;
  except
    raise
  end;
end;

procedure TfrmSettingAplikasi.cxGridDBTableOverviewCellDblClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  LoadData(cxGridDBTableOverview.DS.FieldByName('ID').AsString);
  cxPCData.ActivePageIndex := 1;
end;

procedure TfrmSettingAplikasi.cxPCDataChange(Sender: TObject);
begin
  inherited;
  btnCetak.Enabled := False;
end;

procedure TfrmSettingAplikasi.FormCreate(Sender: TObject);
begin
  inherited;
  InisialisasiCBBGudang;
  InisialisasiCBBCabang;
  InisialisasiRekBang();
end;

function TfrmSettingAplikasi.GetSettingApp: TSettingApp;
begin
  if FSettingApp = nil then
    FSettingApp := TSettingApp.Create;

  Result := FSettingApp;
end;

procedure TfrmSettingAplikasi.InisialisasiCBBGudang;
var
  lCDSGudang: TClientDataSet;
  sSQL: string;
begin
  // gudang penjualan
  sSQL := 'select Nama,Kode,ID from TGudang';
  lCDSGudang := TDBUtils.OpenDataset(sSQL);
  cbbGudangPenjualan.Properties.LoadFromCDS(lCDSGudang,'ID','Nama',['ID'],Self);
  cbbGudangPenjualan.Properties.SetMultiPurposeLookup;

  //Gudang transit
  sSQL := 'select Nama,Kode,ID from TGudang';
  lCDSGudang := TDBUtils.OpenDataset(sSQL);
  cbbGudangTransit.Properties.LoadFromCDS(lCDSGudang,'ID','Nama',['ID'],Self);
  cbbGudangTransit.Properties.SetMultiPurposeLookup;
end;

procedure TfrmSettingAplikasi.InisialisasiCBBCabang;
var
  lCDSCabang: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select * from tcabang';
  lCDSCabang := TDBUtils.OpenDataset(sSQL);
  cbbCabang.Properties.LoadFromCDS(lCDSCabang,'ID','Nama',['ID'],Self);
  cbbCabang.Properties.SetMultiPurposeLookup;
end;

procedure TfrmSettingAplikasi.InisialisasiRekBang;
begin
  FCDSBank := TDBUtils.DSToCDS(ClientDataModule.DSDataCLient.DS_Bank(), Self);
//  ShowMessage(FCDSBank.FieldByName('bank').AsString);
  cbbKasPOS.Properties.LoadFromCDS(FCDSBank,'ID','Bank',['ID'],Self);
  cbbKasPOS.Properties.SetMultiPurposeLookup;
end;

procedure TfrmSettingAplikasi.LoadData(AID : String);
begin
  ClearByTag([0,1]);
  FreeAndNil(FSettingApp);

  if AID = '' then
    Exit;

  FSettingApp := ClientDataModule.ServerSettingAppClient.Retrieve(AID);
  if FSettingApp = nil then
    Exit;

  if FSettingApp.ID = '' then
    Exit;

  cbbCabang.EditValue          := FSettingApp.Cabang.ID;
  cbbGudangPenjualan.EditValue := FSettingApp.GudangPenjualan.ID;
  cbbGudangTransit.EditValue   := FSettingApp.GudangTransit.ID;
  edMaxBelanjaHari.Value       := FSettingApp.MaxBelanjaSantri;
  cbbKasPOS.EditValue          := FSettingApp.KasPOS.ID;


end;

end.
