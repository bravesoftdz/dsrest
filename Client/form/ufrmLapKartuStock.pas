unit ufrmLapKartuStock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxCheckBox, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  Datasnap.DBClient, Datasnap.Provider, System.ImageList, Vcl.ImgList,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, cxClasses, System.Actions, Vcl.ActnList, cxBarEditItem, dxBar,
  dxBarExtDBItems, Vcl.ExtCtrls, dxStatusBar, cxGridLevel, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, Vcl.StdCtrls, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  uModel;

type
  TfrmLapKartuStock = class(TfrmDefault)
    cxGridDBLapMutasi: TcxGrid;
    cxgrdlvlGridLapMutasiLevelLapMutasi: TcxGridLevel;
    cxGridDBTableKartok: TcxGridDBTableView;
    lblAwal: TLabel;
    edAwal: TcxDateEdit;
    lblSD: TLabel;
    edAkhir: TcxDateEdit;
    lblGudang: TLabel;
    cbbGudang: TcxExtLookupComboBox;
    procedure ActionRefreshExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure InisialisasiGudang;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLapKartuStock: TfrmLapKartuStock;

implementation
uses
  uAppUtils, uDBUtils, System.DateUtils, ClientModule, ClientClassesUnit2;

{$R *.dfm}

procedure TfrmLapKartuStock.ActionRefreshExecute(Sender: TObject);
var
  lDS: TDataset;
begin
  inherited;

  with TServerLaporanClient.Create(ClientDataModule.DSRestConnection, False) do
  begin
    try
      lDS := LaporanKartok(edAwal.Date, edAkhir.Date,tbarang.CreateID('77c6982b-e923-49c8-8083-93d3db27df72'), nil, nil);
      cxGridDBTableKartok.SetDataset(lDS, True);
      cxGridDBTableKartok.ApplyBestFit();
    finally

    end;
  end;

end;

procedure TfrmLapKartuStock.FormShow(Sender: TObject);
begin
  inherited;
  edAwal.Date := StartOfTheMonth(Now);
  edAkhir.Date:= Now;

  InisialisasiGudang;
end;

procedure TfrmLapKartuStock.InisialisasiGudang;
var
  sSQL: string;
begin
  sSQL := 'select * from TGudang';
  cxGridDBTableWarehouse.SetDataset(sSQL);
end;

end.
