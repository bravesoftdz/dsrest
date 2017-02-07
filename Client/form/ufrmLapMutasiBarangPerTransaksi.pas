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
  cxCalendar, dxBarExtDBItems, cxCheckBox, cxBarEditItem;

type
  TfrmLapMutasiBarangPerTransaksi = class(TfrmDefault)
    cxGridDBTableMutasiBarang: TcxGridDBTableView;
    cxGridLapMutasiLevelLapMutasi: TcxGridLevel;
    cxGridLapMutasi: TcxGrid;
    cxGridDBTableMutasiBarangColumn1: TcxGridDBColumn;
    cxGridDBTableMutasiBarangColumn2: TcxGridDBColumn;
    cxGridDBTableMutasiBarangColumn3: TcxGridDBColumn;
    cxGridDBTableMutasiBarangColumn4: TcxGridDBColumn;
    cxGridDBTableMutasiBarangColumn5: TcxGridDBColumn;
    cxGridDBTableMutasiBarangColumn6: TcxGridDBColumn;
    cxGridDBTableMutasiBarangColumn7: TcxGridDBColumn;
    cxGridDBTableMutasiBarangColumn8: TcxGridDBColumn;
    cxGridDBTableMutasiBarangColumn9: TcxGridDBColumn;
    cxGridDBTableMutasiBarangColumn10: TcxGridDBColumn;
    ProvMutasi: TDataSetProvider;
    cdsMutasi: TClientDataSet;
    lblAwal: TLabel;
    lblSD: TLabel;
    edAwal: TcxDateEdit;
    edAkhir: TcxDateEdit;
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
