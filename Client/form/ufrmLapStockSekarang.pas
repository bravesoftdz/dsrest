unit ufrmLapStockSekarang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.ImgList, cxGrid, cxStyles,
  cxClasses, System.Actions, Vcl.ActnList, dxBar, Vcl.ExtCtrls, dxStatusBar,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, uModel, Datasnap.DBClient,
  Datasnap.Provider;

type
  TfrmLapStockSekarang = class(TfrmDefault)
    cxGridDBTableStockSekarang: TcxGridDBTableView;
    cxgrdlvlGridDBStockSekarangLevel1: TcxGridLevel;
    cxGridDBStockSekarang: TcxGrid;
    dtstprvdrStockSekarang: TDataSetProvider;
    cdsStockSekarang: TClientDataSet;
    procedure ActionRefreshExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLapStockSekarang: TfrmLapStockSekarang;

implementation
uses
  uAppUtils, ClientModule, ClientClassesUnit2, uDBUtils,
  System.StrUtils, System.DateUtils;

{$R *.dfm}

procedure TfrmLapStockSekarang.ActionRefreshExecute(Sender: TObject);
var
  lStockSekarang: TStockSekarang;
begin
  inherited;
  with TServerStockSekarangClient.Create(ClientDataModule.DSRestConnection, False) do
  begin
    lStockSekarang := TStockSekarang.Create;
    try
      dtstprvdrStockSekarang.DataSet := RetrieveCDS(lStockSekarang);
      cdsStockSekarang.Open;

      TDBUtils.DataSetToCxDBGrid(cdsStockSekarang, cxGridDBTableStockSekarang, True);
      cxGridDBTableStockSekarang.ApplyBestFit();
    finally
      lStockSekarang.Free;
      Free;
    end;
  end;
end;

procedure TfrmLapStockSekarang.FormCreate(Sender: TObject);
begin
  inherited;
  pnlListTransaksi.Visible := False;
  splTransaksi.Visible     := False;
end;

end.
