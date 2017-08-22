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
  Data.FireDACJSONReflect, uModelHelper,uDMReport, cxCurrencyEdit;

type
  TfrmKartuAP = class(TfrmDefaultLaporan)
    cbbCustomer: TcxExtLookupComboBox;
    lblCustomer: TLabel;
    pnlfOOTER: TPanel;
    lblTotal: TLabel;
    edtOTAL: TcxCurrencyEdit;
    lblNoAP: TLabel;
    edNoAP: TcxTextEdit;
    procedure ActionRefreshExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FCDSS: TFDJSONDataSets;
    function GetNoAP: string;
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
  dTotal: Double;
  lSupplier: TSupplier;
  lDS: TClientDataSet;
  lCabang: TCabang;
begin
  inherited;

  lSupplier := TSupplier.CreateID(cbbCustomer.EditValue);
  lCabang := TCabang.CreateID(cbbCabang.EditValue);

  FCDSS := ClientDataModule.ServerLaporanClient.LaporanKarAP(dtpAwal.Date, dtpAkhir.Date,lSupplier, lCabang, GetNoAP);

  lDS := TDBUtils.DSToCDS(TDataSet(TFDJSONDataSetsReader.GetListValue(FCDSS, 1)), Self);

  cxGridDBTableOverview.SetDataset(lDS, True);
  cxGridDBTableOverview.ApplyBestFit();
  cxGridDBTableOverview.SetVisibleColumns(['urutan','PERIODEAWAL','PERIODEAKHIR','CABANG','SUPPLIER'], False);

  dTotal := 0;
  while not lDS.Eof do
  begin
    dTotal := dTotal + lDS.FieldByName('masuk').AsFloat - lDS.FieldByName('keluar').AsFloat;
    lDS.Next;
  end;

  edtOTAL.Value := dTotal;

end;

procedure TfrmKartuAP.CetakSlip;
var
  lSupplier: TSupplier;
  lCabang: TCabang;
begin
  inherited;

  lSupplier := TSupplier.CreateID(cbbCustomer.EditValue);
  lCabang := TCabang.CreateID(cbbCabang.EditValue);

  FCDSS := ClientDataModule.ServerLaporanClient.LaporanKarAP(dtpAwal.Date, dtpAkhir.Date,lSupplier, lCabang, GetNoAP);

  with dmReport do
  begin
    AddReportVariable('UserCetak', User);
    AddReportVariable('NoBukti', GetNoAP);

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

function TfrmKartuAP.GetNoAP: string;
begin
  if Trim(edNoAP.Text) = '' then
    Result := 'XXX'
  else
    Result := Trim(edNoAP.Text);
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
