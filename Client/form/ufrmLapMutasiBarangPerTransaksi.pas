unit ufrmLapMutasiBarangPerTransaksi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.ImgList, cxGrid, cxStyles,
  cxClasses, System.Actions, Vcl.ActnList, dxBar, Vcl.ExtCtrls, dxStatusBar,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxGridCustomView, cxCurrencyEdit,uAppUtils, ClientModule, ClientClassesUnit2,
  Datasnap.Provider, Datasnap.DBClient, uDBUtils, Vcl.StdCtrls, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, dxBarExtDBItems, cxCheckBox, cxBarEditItem, System.ImageList,
  dxBarExtItems, dxBarBuiltInMenu, Vcl.Menus, cxButtons, cxPC;

type
  TfrmLapMutasiBarangPerTransaksi = class(TfrmDefault)
    ProvMutasi: TDataSetProvider;
    cdsMutasi: TClientDataSet;
    lblAwal: TLabel;
    cxGridLapMutasi: TcxGrid;
    cxGridDBTableMutasiBarang: TcxGridDBTableView;
    cxGridColsku: TcxGridDBColumn;
    cxGridColNama: TcxGridDBColumn;
    cxGridColGudang: TcxGridDBColumn;
    cxGridColSaldoAwal: TcxGridDBColumn;
    cxGridColPenerimaan: TcxGridDBColumn;
    cxGridColReturSupplier: TcxGridDBColumn;
    cxGridColPenjualan: TcxGridDBColumn;
    cxGridColReturCustomer: TcxGridDBColumn;
    cxGridColKoreksiPlus: TcxGridDBColumn;
    cxGridColKoreksiMinus: TcxGridDBColumn;
    cxGridColSaldoAkhir: TcxGridDBColumn;
    cxGridLapMutasiLevelLapMutasi: TcxGridLevel;
    procedure ActionRefreshExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLapMutasiBarangPerTransaksi: TfrmLapMutasiBarangPerTransaksi;

implementation
uses
  System.DateUtils;

{$R *.dfm}

procedure TfrmLapMutasiBarangPerTransaksi.ActionRefreshExecute(Sender: TObject);
var
  lcds: TClientDataSet;
begin
  inherited;
  with TServerLaporanClient.Create(ClientDataModule.DSRestConnection, False) do
  begin
    try
      lcds := TDBUtils.DSToCDS(RetriveMutasiBarang(dtpAwal.DateTime, dtpAkhir.DateTime), cxGridDBTableMutasiBarang);
      cxGridDBTableMutasiBarang.SetDataset(lcds);
      cxGridDBTableMutasiBarang.ApplyBestFit();
    finally
      Free;
    end;
  end;
end;

procedure TfrmLapMutasiBarangPerTransaksi.FormShow(Sender: TObject);
begin
  inherited;
  dtpAwal.Date := StartOfTheMonth(Now);
  dtpAkhir.Date:= Now;
end;

end.
