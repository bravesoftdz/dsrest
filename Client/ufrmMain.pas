unit ufrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxPCdxBarPopupMenu, cxPC, Menus, ActnList, cxClasses,
  dxBar, dxBarApplicationMenu, dxRibbon, ImgList, dxRibbonSkins,
  StdCtrls,
  ComCtrls, System.Actions, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, FireDAC.Phys.PG, FireDAC.Stan.Intf, FireDAC.Phys,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL, Firedac.Dapt,
  dxRibbonCustomizationForm, FireDAC.Phys.MSSQLDef, FireDAC.Phys.PGDef,
  System.ImageList, ufrmLapKartuStock;

type
//  RawUTF8 = type AnsiString;
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
    dxrbntbPenerimaanBarangMainTab1: TdxRibbonTab;
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
    procedure actAlatGantiCabangExecute(Sender: TObject);
    procedure actApplicationExitExecute(Sender: TObject);
    procedure actClosingInventoryExecute(Sender: TObject);
    procedure actLapKartokExecute(Sender: TObject);
    procedure actMasSupplierExecute(Sender: TObject);
    procedure actMasterBarangExecute(Sender: TObject);
    procedure actPenerimaanBarangExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actLapMutasiBarangExecute(Sender: TObject);
    procedure actLapStockSekarangExecute(Sender: TObject);
    procedure actMasterGudangExecute(Sender: TObject);
    procedure actReturSupplierExecute(Sender: TObject);
    procedure actSettingKoneksiExecute(Sender: TObject);
  private
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
  ClientClassesUnit2, ClientModule, ufrmPilihCabang, ufrmLapMutasiBarangPerTransaksi,
  ufrmReturSupplier, udbutils, ufrmClosingInventory, ufrmLapStockSekarang,
  ufrmGudang;

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

procedure TfrmMain.actApplicationExitExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.actClosingInventoryExecute(Sender: TObject);
begin
  frmClosingInventory := TfrmClosingInventory.Create(Self);
end;

procedure TfrmMain.actLapKartokExecute(Sender: TObject);
begin
  frmLapKartuStock := TfrmLapKartuStock.Create(Self);
end;

procedure TfrmMain.actLapMutasiBarangExecute(Sender: TObject);
begin
  frmLapMutasiBarangPerTransaksi := TfrmLapMutasiBarangPerTransaksi.Create(Self);
end;

procedure TfrmMain.actLapStockSekarangExecute(Sender: TObject);
begin
  frmLapStockSekarang := TfrmLapStockSekarang.Create(Self);
end;

procedure TfrmMain.actMasSupplierExecute(Sender: TObject);
begin
  frmSupplier := TfrmSupplier.Create(Self);
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

procedure TfrmMain.actReturSupplierExecute(Sender: TObject);
begin
  frmReturSupplier := TfrmReturSupplier.Create(Self);
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
      except
        frmKoneksi.ShowModal;
      end;
    end;

    if TAppUtils.BacaRegistry('cabang') <> '' then
    begin
      TDBUtils.LoadFromDB(ClientDataModule.Cabang, TAppUtils.BacaRegistry('cabang'));
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

procedure TfrmMain.UpdateStatusBar;
begin
  statDS.Panels[2].Text := 'Cabang : ' + ClientDataModule.Cabang.Nama;
  statDS.Panels[1].Text := 'Rest Server : ' + ClientDataModule.DSRestConnection.Host + ':' + IntToStr(ClientDataModule.DSRestConnection.Port);
  statDS.Panels[0].Text := 'Local DB : ' + ADConnection.Params.Text;
end;

end.
