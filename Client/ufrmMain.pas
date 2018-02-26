unit ufrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxPCdxBarPopupMenu, cxPC, Menus, ActnList, cxClasses,
  dxBar, dxBarApplicationMenu, dxRibbon, ImgList, dxRibbonSkins,
  StdCtrls,ufrmLaporanPenjualan,
  ComCtrls, System.Actions, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, FireDAC.Phys.PG, FireDAC.Stan.Intf, FireDAC.Phys,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL, Firedac.Dapt,
  dxRibbonCustomizationForm, FireDAC.Phys.MSSQLDef, FireDAC.Phys.PGDef,
  System.ImageList, ufrmLapKartuStock, ufrmPenjualan, ufrmPenjualanPOS,
  ufrmCustomerInvoice,ufrmPenerimaanKas, ufrmRekBank,
  ufrmSettingAplikasi, ufrmTransferAntarGudang, ufrmTAGRequest,
  Datasnap.DBClient, ufrmTACKirim, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, ufrmPengeluaranKas, ufrmJurnal, ufrmLapPenerimaanBarang,
  ufrmKartuAP, ufrmLaporanAP, ufrmKartuAR,ufrmLaporanAR,
  ufrmLaporanReturSupplier, ufrmGenerateJurnal, ufrmBukuBesar,
  Vcl.AppEvnts, ufrmPenarikanDeposit, ufrmUser, ufrmLogin, uSettingApp,
  uUser, ufrmLaporanLabaRugi;

type
  TfrmMain = class(TForm)
    mm1: TMainMenu;
    mniMaster1: TMenuItem;
    mniAsset1: TMenuItem;
    mniransaksi1: TMenuItem;
    mniSplitPemisahan1: TMenuItem;
    mniDisposal1: TMenuItem;
    mniRelocation1: TMenuItem;
    mniRevaluasi1: TMenuItem;
    mniDepresiai1: TMenuItem;
    mniExpense1: TMenuItem;
    mniMaintenance1: TMenuItem;
    mniLisensiPajakBiayalainnya1: TMenuItem;
    mniCapitalCost1: TMenuItem;
    mniReplacement1: TMenuItem;
    mniBiayaLegal1: TMenuItem;
    mniAssetCategory1: TMenuItem;
    mniDepreciationMethod1: TMenuItem;
    mniAssetConfigRole1: TMenuItem;
    mniAssetPropertyMaster1: TMenuItem;
    dxbrmngrAMS: TdxBarManager;
    dxbrplctnmnAMS: TdxBarApplicationMenu;
    actlstMainMenu: TActionList;
    actMasSupplier: TAction;
    ImgListMainLarge: TImageList;
    actMasAssetCategory: TAction;
    dxrbnTabMaster: TdxRibbonTab;
    dxrbnMain: TdxRibbon;
    dxbrApplication: TdxBar;
    dxrbnAplikasi: TdxRibbonTab;
    dxbrmngrAMSBar1: TdxBar;
    dxBarLargeButton: TdxBarLargeButton;
    dxbrlrgbtnBarLargeAsset: TdxBarLargeButton;
    actMasterBarang: TAction;
    actMasterGudang: TAction;
    dxbrlrgbtnBarLargeAssetProperty: TdxBarLargeButton;
    actApplicationExit: TAction;
    dxbrlrgbtnExit: TdxBarLargeButton;
    actApplicationSetting: TAction;
    dxbrlrgbtnSetting: TdxBarLargeButton;
    actMasterConfigRole: TAction;
    dxbrlrgbtnConfigRole: TdxBarLargeButton;
    dxbrlrgbtnAssetCat: TdxBarLargeButton;
    actMasterAssetCat: TAction;
    dxbrmngrAMSBarPenerimaanBarang: TdxBar;
    dxrbntbPenerimaanBarangTransaksi: TdxRibbonTab;
    dxbrlrgbtnPenerimaanBarang: TdxBarLargeButton;
    dxbrlrgbtnReturn: TdxBarLargeButton;
    dxbrlrgbtnLaporanPenerimaanBarang: TdxBarLargeButton;
    actPenerimaanBarang: TAction;
    statDS: TStatusBar;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    dxbrLaporanInventory: TdxBar;
    dxrbntbLaporan: TdxRibbonTab;
    dxbrlrgbtnMutasiBarang: TdxBarLargeButton;
    actLapMutasiBarang: TAction;
    actReturSupplier: TAction;
    dxrbntbPenerimaanBarangClosing: TdxRibbonTab;
    dxbrCLosing: TdxBar;
    dxbrlrgbtnCLosingInventory: TdxBarLargeButton;
    actClosingInventory: TAction;
    dxbrlrgbtnSettingKoneksi: TdxBarLargeButton;
    actSettingKoneksi: TAction;
    dxbrlrgbtnLapStockSekarang: TdxBarLargeButton;
    actLapStockSekarang: TAction;
    dxbrlrgbtnGantiCabang: TdxBarLargeButton;
    actAlatGantiCabang: TAction;
    actLapKartok: TAction;
    dxbrsbtm1: TdxBarSubItem;
    dxbrbtn1: TdxBarButton;
    dxbrlrgbtn1: TdxBarLargeButton;
    dxbrmngrAMSBarPenjualan: TdxBar;
    dxbrsbtm2: TdxBarSubItem;
    dxbrsbtm3: TdxBarSubItem;
    dxbrbtn2: TdxBarButton;
    dxbrlrgbtn2: TdxBarLargeButton;
    actPenjualanSales: TAction;
    dxbrlrgbtnPenjualanPOS: TdxBarLargeButton;
    actPenjualanPOS: TAction;
    actCustomerInvoice: TAction;
    dxbrmngrAMSBarKeuangan: TdxBar;
    dxbrbtnCustomerInvoice: TdxBarButton;
    dxbrlrgbtn3: TdxBarLargeButton;
    dxbrlrgbtnPenerimaanKas: TdxBarLargeButton;
    actPenerimaanKas: TAction;
    dxbrmngrAMSBarFA: TdxBar;
    dxbrlrgbtnAccount: TdxBarLargeButton;
    actMasterAccount: TAction;
    dxbrlrgbtnBank: TdxBarLargeButton;
    actMasterBank: TAction;
    dxbrlrgbtnSettingAplikasi: TdxBarLargeButton;
    dxbrlrgbtnSettingAplikas: TdxBarLargeButton;
    actSettingAplikasi: TAction;
    dxbrTAG: TdxBar;
    dxbrlrgbtnTAG: TdxBarLargeButton;
    actTAG: TAction;
    dxbrlrgbtnTAGReq: TdxBarLargeButton;
    actTAGGRequest: TAction;
    dxbrlrgbtnKirimBarang: TdxBarLargeButton;
    actTAGKirim: TAction;
    pnlGaji: TPanel;
    lblTahun: TLabel;
    lblBulan: TLabel;
    cbbTahun: TcxComboBox;
    cbbBulan: TcxComboBox;
    btnCetak: TButton;
    dxbrlrgbtnTACTerima: TdxBarLargeButton;
    actTACTerima: TAction;
    dxbrlrgbtnPengeluaranKas: TdxBarLargeButton;
    actPengeluaranKas: TAction;
    dxrbntbAkuntansi: TdxRibbonTab;
    dxbrJurnal: TdxBar;
    dxbrlrgbtnJurnalMemorial: TdxBarLargeButton;
    actJurnalMemorial: TAction;
    actLapPenerimaanBarang: TAction;
    actKartuAP: TAction;
    dxbrLapKasKeluar: TdxBar;
    dxbrlrgbtnKartuAP: TdxBarLargeButton;
    dxbrlrgbtnLapAP: TdxBarLargeButton;
    actDaftarAP: TAction;
    dxbrLapKasMasuk: TdxBar;
    dxbrlrgbtnKartuAR: TdxBarLargeButton;
    dxbrlrgbtnDaftarAR: TdxBarLargeButton;
    actKartuAR: TAction;
    actDaftarAR: TAction;
    dxbrlrgbtnReturSupplier: TdxBarLargeButton;
    actLapReturSupplier: TAction;
    dxbrlrgbtnsETTLEMENTarap: TdxBarLargeButton;
    actSettlementARAP: TAction;
    dxbrbtnGenerateJurnal: TdxBarButton;
    actGenerateJurnal: TAction;
    dxbrlrgbtnGenerateJurnal: TdxBarLargeButton;
    dxbrmngrAMSBar2: TdxBar;
    dxbrbtnBukuBesar: TdxBarButton;
    dxbrbtnNeracaSaldo: TdxBarButton;
    actLapNeracaSaldo: TAction;
    actLapBukuBesar: TAction;
    dxbrlrgbtnLapPenjualan: TdxBarLargeButton;
    actLapPenjualan: TAction;
    aplctnvntsApp: TApplicationEvents;
    dxbrbtnPengambilanDeposit: TdxBarButton;
    actPengambilanDeposit: TAction;
    dxbrlrgbtnPenarikanDeposit: TdxBarLargeButton;
    btnUser: TdxBarLargeButton;
    actUser: TAction;
    btnLogin: TdxBarLargeButton;
    dxbrlrgbtnLapLabaRugi: TdxBarLargeButton;
    actLapLabaRugi: TAction;
    procedure actAlatGantiCabangExecute(Sender: TObject);
    procedure actClosingInventoryExecute(Sender: TObject);
    procedure actCustomerInvoiceExecute(Sender: TObject);
    procedure actDaftarAPExecute(Sender: TObject);
    procedure actDaftarARExecute(Sender: TObject);
    procedure actGenerateJurnalExecute(Sender: TObject);
    procedure actJurnalMemorialExecute(Sender: TObject);
    procedure actKartuAPExecute(Sender: TObject);
    procedure actKartuARExecute(Sender: TObject);
    procedure actLapBukuBesarExecute(Sender: TObject);
    procedure actLapKartokExecute(Sender: TObject);
    procedure actLapLabaRugiExecute(Sender: TObject);
    procedure actMasSupplierExecute(Sender: TObject);
    procedure actMasterBarangExecute(Sender: TObject);
    procedure actPenerimaanBarangExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actLapMutasiBarangExecute(Sender: TObject);
    procedure actLapNeracaSaldoExecute(Sender: TObject);
    procedure actLapPenerimaanBarangExecute(Sender: TObject);
    procedure actLapPenjualanExecute(Sender: TObject);
    procedure actLapStockSekarangExecute(Sender: TObject);
    procedure actMasterAccountExecute(Sender: TObject);
    procedure actMasterBankExecute(Sender: TObject);
    procedure actMasterGudangExecute(Sender: TObject);
    procedure actPenerimaanKasExecute(Sender: TObject);
    procedure actPenjualanPOSExecute(Sender: TObject);
    procedure actPenjualanSalesExecute(Sender: TObject);
    procedure actReturSupplierExecute(Sender: TObject);
    procedure actSettingAplikasiExecute(Sender: TObject);
    procedure actSettingKoneksiExecute(Sender: TObject);
    procedure actTACTerimaExecute(Sender: TObject);
    procedure actTAGExecute(Sender: TObject);
    procedure actTAGGRequestExecute(Sender: TObject);
    procedure actTAGKirimExecute(Sender: TObject);
    procedure btnCetakClick(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure actPengeluaranKasExecute(Sender: TObject);
    procedure actLapReturSupplierExecute(Sender: TObject);
    procedure actPengambilanDepositExecute(Sender: TObject);
    procedure actSettlementARAPExecute(Sender: TObject);
    procedure actUserExecute(Sender: TObject);
    procedure aplctnvntsAppException(Sender: TObject; E: Exception);
    procedure dxbrlrgbtnExitClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure pnlGajiDblClick(Sender: TObject);
  private
    procedure SimpanAndDisableDataMenu;
    procedure UpdateStatusBar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
uses
  ufrmSupplier, ufrmKoneksi,uAppUtils, ufrmBarang, ufrmPenerimaanBarang,
  ClientClassesUnit, ClientModule, ufrmPilihCabang, ufrmLapMutasiBarangPerTransaksi,
  ufrmReturSupplier, udbutils, ufrmClosingInventory, ufrmLapStockSekarang,
  ufrmGudang, ufrmAccount, uReport, ufrmTACTerima, ufrmSettlementARAP, ufrmLaporanNeracaSaldo;

{$R *.dfm}

procedure TfrmMain.actAlatGantiCabangExecute(Sender: TObject);
var
  I: Integer;
begin
if TAppUtils.Confirm('Untuk Pindah Cabang semua form harus ditutup. Lanjutkan ?') then
  begin
    for I := ComponentCount - 1 downto 0  do
    begin
      if (Components[i] is TForm) then
        (Components[i] as TForm).Free;

    end;

    frmPilihCabang := TfrmPilihCabang.Create(Self);
    frmPilihCabang.ShowModal;

    UpdateStatusBar;
  end;
end;

procedure TfrmMain.actClosingInventoryExecute(Sender: TObject);
begin
  frmClosingInventory := TfrmClosingInventory.Create(Self);
end;

procedure TfrmMain.actCustomerInvoiceExecute(Sender: TObject);
begin
  frmCustomerInvoice := TfrmCustomerInvoice.Create(Self);
end;

procedure TfrmMain.actDaftarAPExecute(Sender: TObject);
begin
  frmlaporanAP := TfrmLaporanAP.Create(Self);
end;

procedure TfrmMain.actDaftarARExecute(Sender: TObject);
begin
  frmlaporanAR := TfrmLaporanAR.Create(Self);
end;

procedure TfrmMain.actGenerateJurnalExecute(Sender: TObject);
begin
  frmGenerateJurnal := TfrmGenerateJurnal.Create(Self);
end;

procedure TfrmMain.actJurnalMemorialExecute(Sender: TObject);
begin
  frmJurnal := TfrmJurnal.Create(Self);
end;

procedure TfrmMain.actKartuAPExecute(Sender: TObject);
begin
  frmKartuAP := TfrmKartuAP.Create(Self);
end;

procedure TfrmMain.actKartuARExecute(Sender: TObject);
begin
  frmKartuAR := TfrmKartuAR.Create(Self);
end;

procedure TfrmMain.actLapBukuBesarExecute(Sender: TObject);
begin
  frmBukuBesar := TfrmBukuBesar.Create(Self);
end;

procedure TfrmMain.actLapKartokExecute(Sender: TObject);
begin
  frmLapKartuStock := TfrmLapKartuStock.Create(Self);
end;

procedure TfrmMain.actLapLabaRugiExecute(Sender: TObject);
begin
  frmLaporanLabaRugi := TfrmLaporanLabaRugi.Create(Self);
end;

procedure TfrmMain.actLapMutasiBarangExecute(Sender: TObject);
begin
  frmLapMutasiBarangPerTransaksi := TfrmLapMutasiBarangPerTransaksi.Create(Self);
end;

procedure TfrmMain.actLapNeracaSaldoExecute(Sender: TObject);
begin
  frmLaporanNeracaSaldo := TfrmLaporanNeracaSaldo.Create(Self);
end;

procedure TfrmMain.actLapPenerimaanBarangExecute(Sender: TObject);
begin
  frmLapPenerimaanBarang := TfrmLapPenerimaanBarang.Create(Self);
end;

procedure TfrmMain.actLapPenjualanExecute(Sender: TObject);
begin
  frmLaporanPenjualan := TfrmLaporanPenjualan.Create(Self);
end;

procedure TfrmMain.actLapReturSupplierExecute(Sender: TObject);
begin
  frmLaporanReturSupplier := TfrmLaporanReturSupplier.Create(Self);
end;

procedure TfrmMain.actLapStockSekarangExecute(Sender: TObject);
begin
  frmLapStockSekarang := TfrmLapStockSekarang.Create(Self);
end;

procedure TfrmMain.actMasSupplierExecute(Sender: TObject);
begin
  frmSupplier := TfrmSupplier.Create(Self);
end;

procedure TfrmMain.actMasterAccountExecute(Sender: TObject);
begin
  frmAccount := TfrmAccount.Create(Self);
end;

procedure TfrmMain.actMasterBankExecute(Sender: TObject);
begin
  frmRekBank := TfrmRekBank.Create(Self);
end;

procedure TfrmMain.actMasterBarangExecute(Sender: TObject);
begin
  frmBarang := TfrmBarang.Create(Self);
end;

procedure TfrmMain.actMasterGudangExecute(Sender: TObject);
begin
  frmGudang := TfrmGudang.Create(Self);
end;

procedure TfrmMain.actPenerimaanBarangExecute(Sender: TObject);
begin
  frmPenerimaanBarang := TfrmPenerimaanBarang.Create(Self);
end;

procedure TfrmMain.actPenerimaanKasExecute(Sender: TObject);
begin
  frmPenerimaanKas := TfrmPenerimaanKas.Create(Self);
end;

procedure TfrmMain.actPengambilanDepositExecute(Sender: TObject);
begin
  frmPenarikanDeposit := TfrmPenarikanDeposit.Create(Self);
end;

procedure TfrmMain.actPengeluaranKasExecute(Sender: TObject);
begin
  frmPengeluaranKas := TfrmPengeluaranKas.Create(Self);
end;

procedure TfrmMain.actPenjualanPOSExecute(Sender: TObject);
begin
  frmPenjualanPOS := TfrmPenjualanPOS.Create(Self);
end;

procedure TfrmMain.actPenjualanSalesExecute(Sender: TObject);
begin
  frmPenjualan := TfrmPenjualan.Create(Self);
end;

procedure TfrmMain.actReturSupplierExecute(Sender: TObject);
begin
  frmReturSupplier := TfrmReturSupplier.Create(Self);
end;

procedure TfrmMain.actSettingAplikasiExecute(Sender: TObject);
begin
  frmSettingAplikasi := TfrmSettingAplikasi.Create(Self);
end;

procedure TfrmMain.actSettingKoneksiExecute(Sender: TObject);
var
  I: Integer;
begin
  if TAppUtils.Confirm('Untuk mengubah setting koneksi, semua form harus ditutup. Lanjutkan ?') then
  begin
    for I := ComponentCount - 1 downto 0  do
    begin
      if (Components[i] is TForm) then
        (Components[i] as TForm).Free;

    end;

    frmKoneksi := TfrmKoneksi.Create(Self);
    frmKoneksi.ShowModal;
  end;
end;

procedure TfrmMain.actSettlementARAPExecute(Sender: TObject);
begin
  frmSettlementARAP := TfrmSettlementARAP.Create(Self);
end;

procedure TfrmMain.actTACTerimaExecute(Sender: TObject);
begin
  frmTACTerima := TfrmTACTerima.Create(Self);
end;

procedure TfrmMain.actTAGExecute(Sender: TObject);
begin
  frmTransferAntarGudang := TfrmTransferAntarGudang.Create(Self);
end;

procedure TfrmMain.actTAGGRequestExecute(Sender: TObject);
begin
  frmTAGRequest := TfrmTAGRequest.Create(Self);
end;

procedure TfrmMain.actTAGKirimExecute(Sender: TObject);
begin
  frmTACKirim := TfrmTACKirim.Create(Self);
end;

procedure TfrmMain.actUserExecute(Sender: TObject);
begin
  frmUser := TfrmUser.Create(Self);
end;

procedure TfrmMain.aplctnvntsAppException(Sender: TObject; E: Exception);
begin
  TAppUtils.ShowException(E);
end;

procedure TfrmMain.btnCetakClick(Sender: TObject);
var
  iBulan: Integer;
  iTahun: Integer;
  lcds: TClientDataSet;
  lTSReport: TTSReport;
begin
  lTSReport := TTSReport.Create(self);
  try
    with ClientDataModule.ServerLaporanClient do
    begin
      iTahun := StrToInt(cbbTahun.Text);
      iBulan := StrToInt(cbbBulan.Text);

      lcds := TDBUtils.DSToCDS(RetrieveGaji(iTahun, iBulan), Self);

      lTSReport.AddDataset(lcds, 'Mukafaah');
      lTSReport.ShowReport('Mukafaah');
    end;
  finally
    lTSReport.Free;
  end;
end;

procedure TfrmMain.btnLoginClick(Sender: TObject);
var
  I: Integer;
begin
  uSettingApp.UserApplikasi := nil;
  for I := ComponentCount - 1 downto 0  do
  begin
    if (Components[i] is TForm) then
      (Components[i] as TForm).Free;
  end;

  SimpanAndDisableDataMenu;

  frmLogin := TfrmLogin.Create(Self);
  frmLogin.ShowModal;
  SimpanAndDisableDataMenu;
end;






procedure TfrmMain.dxbrlrgbtnExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  //  Caption := Caption + ' Ver : ' + TAppUtils.GetAppVersion;
  frmKoneksi := TfrmKoneksi.Create(Self);
  try
    if (TAppUtils.BacaRegistry('Database') = '') or (TAppUtils.BacaRegistry('RestServer') = '')then
    begin
      frmKoneksi.ShowModal;
    end else begin
      try
        frmKoneksi.btnKonekDBClick(Sender);

        ClientDataModule.DSRestConnection.Host := TAppUtils.BacaRegistry('RestServer');
        ClientDataModule.DSRestConnection.Port := StrToInt(TAppUtils.BacaRegistry('RestPort'));

        SimpanAndDisableDataMenu;
      except
        frmKoneksi.ShowModal;
      end;
    end;

    if TAppUtils.BacaRegistry('cabang') <> '' then
    begin
      TDBUtils.LoadFromDB(ClientDataModule.Cabang, TAppUtils.BacaRegistry('cabang'));

      ClientDataModule.SettingApp.Free;
      ClientDataModule.SettingApp := ClientDataModule.ServerSettingAppClient.RetrieveByCabang(ClientDataModule.Cabang.ID);
    end else begin
      frmPilihCabang := TfrmPilihCabang.Create(Self);
      try
        frmPilihCabang.ShowModal;
      finally
        frmPilihCabang.Free();
      end;
    end;

    UpdateStatusBar;
  finally
    frmKoneksi.Free;
  end;
end;

procedure TfrmMain.FormDblClick(Sender: TObject);
//var
//  lcds: TClientDataSet;
//  lTSReport: TTSReport;
begin
  pnlGaji.Visible := not pnlGaji.Visible;
//  lTSReport := TTSReport.Create(self);
//  try
//    with ClientDataModule.ServerLaporanClient do
//    begin
//      lcds := TDBUtils.DSToCDS(RetrieveGaji(2017, 5), Self);
//
//      lTSReport.AddDataset(lcds, 'Mukafaah');
//      lTSReport.ShowReport('Mukafaah');
//    end;
//  finally
//    lTSReport.Free;
//  end;
end;

procedure TfrmMain.pnlGajiDblClick(Sender: TObject);
begin
 // pnlGaji.Enabled := not pnlGaji.Enabled;
end;

procedure TfrmMain.SimpanAndDisableDataMenu;
var
  I: Integer;
  IsKetemu: Boolean;
  lFCDs: TClientDataset;
  lMenu: TMenu;
  j: Integer;
begin
  lFCDs := TDBUtils.DSToCDS(ClientDataModule.DSDataCLient.DS_MenuLookUp(), Self);
  try
    for I := 0 to actlstMainMenu.ActionCount - 1 do
    begin
      actlstMainMenu.Actions[I].Enabled := False;
      if uSettingApp.UserApplikasi <> nil then
      begin
        if UserApplikasi.UserName = 'admin' then
          actlstMainMenu.Actions[I].Enabled := True
        else begin
          for j := 0 to UserApplikasi.UserMenuItems.Count - 1 do
          begin
            lFCDs.Filter    := 'id = ' + QuotedStr(UserApplikasi.UserMenuItems[j].Menu.ID);
            lFCDs.Filtered  := True;
            try
              if actlstMainMenu.Actions[I].Name = lFCDs.FieldByName('menuname').AsString then
              begin
                actlstMainMenu.Actions[I].Enabled := True;
                Break;
              end;
            finally
              lFCDs.Filtered  := False;
            end;

          end;
        end;
      end;

      IsKetemu := False;

      if lFCDs <> nil then
      begin
        lFCDs.First;
        while not lFCDs.Eof do
        begin
          if lFCDs.FieldByName('menuname').AsString = actlstMainMenu.Actions[I].Name then
          begin
            IsKetemu := True;
            Break;
          end;
          lFCDs.Next;
        end;
      end;

      if not IsKetemu then
      begin
        lMenu             := TMenu.Create;
        lMenu.MenuCaption := actlstMainMenu.Actions[I].Caption;
        lMenu.MenuName    := actlstMainMenu.Actions[I].Name;

        ClientDataModule.ServerMenuClient.Save(lMenu);
      end;
    end;
  finally
    FreeAndNil(lFCDs);
  end;
end;

procedure TfrmMain.UpdateStatusBar;
begin
  statDS.Panels[2].Text := 'Cabang : ' + ClientDataModule.Cabang.Nama;
  statDS.Panels[1].Text := 'Rest Server : ' + ClientDataModule.DSRestConnection.Host + ':' + IntToStr(ClientDataModule.DSRestConnection.Port);
  statDS.Panels[0].Text := 'Local DB : ' + ADConnection.Params.Text;
end;

end.
