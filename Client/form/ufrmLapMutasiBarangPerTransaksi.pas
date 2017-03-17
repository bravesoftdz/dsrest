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
  dxBarExtItems;

type
  TfrmLapMutasiBarangPerTransaksi = class(TfrmDefault)
    cxGridDBTableMutasiBarang: TcxGridDBTableView;
    cxGridLapMutasiLevelLapMutasi: TcxGridLevel;
    cxGridLapMutasi: TcxGrid;
    cxGridColsku: TcxGridDBColumn;
    cxGridColNama: TcxGridDBColumn;
    cxGridColSaldoAwal: TcxGridDBColumn;
    cxGridColPenerimaan: TcxGridDBColumn;
    cxGridColReturSupplier: TcxGridDBColumn;
    cxGridColPenjualan: TcxGridDBColumn;
    cxGridColReturCustomer: TcxGridDBColumn;
    cxGridColKoreksiPlus: TcxGridDBColumn;
    cxGridColKoreksiMinus: TcxGridDBColumn;
    cxGridColSaldoAkhir: TcxGridDBColumn;
    ProvMutasi: TDataSetProvider;
    cdsMutasi: TClientDataSet;
    lblAwal: TLabel;
    lblSD: TLabel;
    edAwal: TcxDateEdit;
    edAkhir: TcxDateEdit;
    cxGridColGudang: TcxGridDBColumn;
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
begin
  inherited;
  with TServerLaporanClient.Create(ClientDataModule.DSRestConnection, False) do
  begin
    try
      cdsMutasi.Close;
      ProvMutasi.DataSet := RetriveMutasiBarang(edAwal.Date,edAkhir.Date);

      cdsMutasi.Open;

      TDBUtils.DataSetToCxDBGrid(cdsMutasi, cxGridDBTableMutasiBarang);
      cxGridDBTableMutasiBarang.ApplyBestFit();
    finally
      Free;
    end;
  end;
end;

procedure TfrmLapMutasiBarangPerTransaksi.FormShow(Sender: TObject);
begin
  inherited;
  edAwal.Date := StartOfTheMonth(Now);
  edAkhir.Date:= Now;
end;

end.
