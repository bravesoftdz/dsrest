unit ufrmLapKartuStock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultLaporan, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu,
  Vcl.Menus, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, System.ImageList, Vcl.ImgList,
  Datasnap.DBClient, Datasnap.Provider, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, System.Actions, Vcl.ActnList, cxCheckBox,
  cxGridLevel, cxClasses, cxGridCustomView, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  Vcl.StdCtrls, cxButtons, Vcl.ComCtrls, Vcl.ExtCtrls, cxPC, dxStatusBar,
  uDBUtils, ClientModule, uModel, ClientClassesUnit2, uAppUtils;

type
  TfrmLapKartuStock = class(TfrmDefaultLaporan)
    cbbBarang: TcxExtLookupComboBox;
    Label1: TLabel;
    procedure ActionRefreshExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure InisialisasiCBBBarang;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLapKartuStock: TfrmLapKartuStock;

implementation

{$R *.dfm}

procedure TfrmLapKartuStock.ActionRefreshExecute(Sender: TObject);
var
  lBarang: TBarang;
  lDS: TClientDataSet;
  lGudang: TGudang;
begin
//  inherited;

  with TServerLaporanClient.Create(ClientDataModule.DSRestConnection) do
  begin
    try
      lBarang := TBarang.CreateID(cbbBarang.EditValue);
      lGudang := TGudang.CreateID(cbbGudang.EditValue);
      lDS := TDBUtils.DSToCDS(LaporanKartok(dtpAwal.Date, dtpAkhir.Date,lBarang, lGudang), Self);

      cxGridDBTableOverview.SetDataset(lDS, True);
      cxGridDBTableOverview.ApplyBestFit();
      cxGridDBTableOverview.SetVisibleColumns(['urutan'], False);
    finally

    end;
  end;

end;

procedure TfrmLapKartuStock.FormShow(Sender: TObject);
begin
  inherited;
  InisialisasiCBBBarang;
end;

procedure TfrmLapKartuStock.InisialisasiCBBBarang;
var
  lCDSBarang: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select id,Nama,SKU from TBarang';
  lCDSBarang := TDBUtils.OpenDataset(sSQL);
  cbbBarang.Properties.LoadFromCDS(lCDSBarang,'ID','Nama',['ID'],Self);
  cbbBarang.Properties.SetMultiPurposeLookup;
end;

end.
