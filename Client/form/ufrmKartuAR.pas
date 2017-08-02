unit ufrmKartuAR;

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
  uDBUtils, ClientModule, uAppUtils, uSupplier, uModel,
  Data.FireDACJSONReflect, uModelHelper,uDMReport, cxCurrencyEdit;

type
  TfrmKartuAR = class(TfrmDefaultLaporan)
    cbbCustomer: TcxExtLookupComboBox;
    lblCustomer: TLabel;
    pnlfOOTER: TPanel;
    lblTotal: TLabel;
    edtOTAL: TcxCurrencyEdit;
    procedure ActionRefreshExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FCDSS: TFDJSONDataSets;
    procedure InisialisasiCBBSupplier;
    { Private declarations }
  public
    procedure CetakSlip; override;
    { Public declarations }
  end;

var
  frmKartuAR: TfrmKartuAR;

implementation

{$R *.dfm}

procedure TfrmKartuAR.ActionRefreshExecute(Sender: TObject);
var
  dTotal: double;
  lCustomer: TSupplier;
  lDS: TClientDataSet;
  lCabang: TCabang;
begin
  inherited;

  lCustomer := TSupplier.CreateID(cbbCustomer.EditValue);
  lCabang := TCabang.CreateID(cbbCabang.EditValue);

  FCDSS := ClientDataModule.ServerLaporanClient.LaporanKarAR(dtpAwal.Date, dtpAkhir.Date,lCustomer, lCabang);

  lDS := TDBUtils.DSToCDS(TDataSet(TFDJSONDataSetsReader.GetListValue(FCDSS, 1)), Self);

  cxGridDBTableOverview.SetDataset(lDS, True);
  cxGridDBTableOverview.ApplyBestFit();
  cxGridDBTableOverview.SetVisibleColumns(['urutan','PERIODEAWAL','PERIODEAKHIR','CABANG','CUSTOMER'], False);

  dTotal := 0;
  while not lDS.Eof do
  begin
    dTotal := dTotal + lDS.FieldByName('masuk').AsFloat - lDS.FieldByName('keluar').AsFloat;
    lDS.Next;
  end;

  edtOTAL.Value := dTotal;
end;

procedure TfrmKartuAR.CetakSlip;
var
  lCustomer: TSupplier;
  lCabang: TCabang;
begin
  inherited;

  lCustomer := TSupplier.CreateID(cbbCustomer.EditValue);
  lCabang := TCabang.CreateID(cbbCabang.EditValue);

  FCDSS := ClientDataModule.ServerLaporanClient.LaporanKarAR(dtpAwal.Date, dtpAkhir.Date,lCustomer, lCabang);

  with dmReport do
  begin
    AddReportVariable('UserCetak', User);

    ExecuteReport( 'Reports/Lap_KarAR' ,
      FCDSS
    );
  end;
end;

procedure TfrmKartuAR.FormCreate(Sender: TObject);
begin
  inherited;
  InisialisasiCBBSupplier;

  cbbCabang.EditValue := ClientDataModule.Cabang.ID;
end;

procedure TfrmKartuAR.InisialisasiCBBSupplier;
var
  lCDSSalesman: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select Nama,Kode,ID from TSupplier';
  lCDSSalesman := TDBUtils.OpenDataset(sSQL);
  cbbCustomer.Properties.LoadFromCDS(lCDSSalesman,'ID','Nama',['ID'],Self);
  cbbCustomer.Properties.SetMultiPurposeLookup;
end;

end.
