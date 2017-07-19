unit ufrmKartuAP;

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
  Data.FireDACJSONReflect, uModelHelper,uDMReport;

type
  TfrmKartuAP = class(TfrmDefaultLaporan)
    cbbCustomer: TcxExtLookupComboBox;
    lblCustomer: TLabel;
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
  frmKartuAP: TfrmKartuAP;

implementation

{$R *.dfm}

procedure TfrmKartuAP.ActionRefreshExecute(Sender: TObject);
var
  lSupplier: TSupplier;
  lDS: TClientDataSet;
  lCabang: TCabang;
begin
  inherited;

  lSupplier := TSupplier.CreateID(cbbCustomer.EditValue);
  lCabang := TCabang.CreateID(cbbCabang.EditValue);

  FCDSS := ClientDataModule.ServerLaporanClient.LaporanKarAP(dtpAwal.Date, dtpAkhir.Date,lSupplier, lCabang);

  lDS := TDBUtils.DSToCDS(TDataSet(TFDJSONDataSetsReader.GetListValue(FCDSS, 1)), Self);

  cxGridDBTableOverview.SetDataset(lDS, True);
  cxGridDBTableOverview.ApplyBestFit();
  cxGridDBTableOverview.SetVisibleColumns(['urutan'], False);

end;

procedure TfrmKartuAP.CetakSlip;
var
  lSupplier: TSupplier;
  lCabang: TCabang;
begin
  inherited;

  lSupplier := TSupplier.CreateID(cbbCustomer.EditValue);
  lCabang := TCabang.CreateID(cbbCabang.EditValue);

  FCDSS := ClientDataModule.ServerLaporanClient.LaporanKarAP(dtpAwal.Date, dtpAkhir.Date,lSupplier, lCabang);

  with dmReport do
  begin
    AddReportVariable('UserCetak', User);

    ExecuteReport( 'Reports/Lap_KarAP' ,
      FCDSS
    );
  end;
end;

procedure TfrmKartuAP.FormCreate(Sender: TObject);
begin
  inherited;
  InisialisasiCBBSupplier;

  cbbCabang.EditValue := ClientDataModule.Cabang.ID;
end;

procedure TfrmKartuAP.InisialisasiCBBSupplier;
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