unit ufrmPenerimaanKas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, Vcl.Menus, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, System.ImageList, Vcl.ImgList, Datasnap.DBClient,
  Datasnap.Provider, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, System.Actions, Vcl.ActnList, cxCheckBox, cxGridLevel, cxClasses,
  cxGridCustomView, Vcl.StdCtrls, cxButtons, Vcl.ComCtrls, Vcl.ExtCtrls, cxPC,
  dxStatusBar, uDBUtils, ClientModule, uAppUtils, dxCore, cxDateUtils,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit, cxMemo, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox, cxCurrencyEdit,uModel;

type
  TfrmPenerimaanKas = class(TfrmDefault)
    pnlHeader: TPanel;
    lblNoBukti: TLabel;
    edNoBukti: TcxTextEdit;
    lblTglBukti: TLabel;
    edTglBukti: TcxDateEdit;
    lblJenisTransaksi: TLabel;
    cbbJenisTransaksi: TcxComboBox;
    lblPenerima: TLabel;
    edPenerima: TcxTextEdit;
    lblCustomer: TLabel;
    cbbCustomer: TcxExtLookupComboBox;
    lblKeterangan: TLabel;
    memKeterangan: TcxMemo;
    cxGridDBAR: TcxGrid;
    cxGridTableAR: TcxGridTableView;
    cxgrdclmnARID: TcxGridColumn;
    cxgrdclmnARNo: TcxGridColumn;
    cxgrdclmnNominal: TcxGridColumn;
    cxgrdlvlAR: TcxGridLevel;
    cxgrdclmnBayar: TcxGridColumn;
    btnLoadAR: TcxButton;
    cxgrdlvlDP: TcxGridLevel;
    cxGridTableGridDBARTableView1: TcxGridTableView;
    cxgrdlvlOI: TcxGridLevel;
    cxGridTableGridDBARTableView2: TcxGridTableView;
    procedure FormCreate(Sender: TObject);
    procedure ActionBaruExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure btnLoadARClick(Sender: TObject);
  private
    procedure InisialisasiCBBSalesman;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPenerimaanKas: TfrmPenerimaanKas;

implementation

{$R *.dfm}

procedure TfrmPenerimaanKas.FormCreate(Sender: TObject);
begin
  inherited;
  InisialisasiCBBSalesman;
end;

procedure TfrmPenerimaanKas.ActionBaruExecute(Sender: TObject);
begin
  inherited;
  ClearByTag([0,1]);

end;

procedure TfrmPenerimaanKas.ActionRefreshExecute(Sender: TObject);
var
  lcds: TClientDataSet;
begin
  inherited;
  if chkKonsolidasi1.Checked then
    lcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.RetrivePenerimaanKas(dtpAwal.DateTime, dtpAkhir.DateTime, nil), cxGridDBTableOverview)
  else
    lcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.RetrivePenerimaanKas(dtpAwal.DateTime, dtpAkhir.DateTime, ClientDataModule.Cabang), cxGridDBTableOverview);

  cxGridDBTableOverview.SetDataset(lcds, True);
  cxGridDBTableOverview.SetVisibleColumns(['ID', 'CABANG','PEMBELI'], False);
  cxGridDBTableOverview.ApplyBestFit();
end;

procedure TfrmPenerimaanKas.btnLoadARClick(Sender: TObject);
var
  iBaris: Integer;
  lds: TDataset;
begin
  inherited;

  lds := ClientDataModule.ServerLaporanClient.RetriveAR(TSupplier.CreateID(cbbCustomer.EditValue));
  try
    cxGridTableAR.ClearRows;

    while not lds.Eof do
    begin
      cxGridTableAR.DataController.RecordCount := cxGridTableAR.DataController.RecordCount + 1;
      iBaris :=cxGridTableAR.DataController.RecordCount - 1;

      cxGridTableAR.SetValue(iBaris,cxgrdclmnARID.Index, lds.FieldByName('ID').AsString);
      cxGridTableAR.SetValue(iBaris,cxgrdclmnARNo.Index, lds.FieldByName('NoBukti').AsString);
      cxGridTableAR.SetValue(iBaris,cxgrdclmnNominal.Index, lds.FieldByName('Nominal').AsString);
      cxGridTableAR.SetValue(iBaris,cxgrdclmnBayar.Index, lds.FieldByName('Nominal').AsString);

      lds.Next;
    end;

  finally
    lds.Free;
  end;
end;

procedure TfrmPenerimaanKas.InisialisasiCBBSalesman;
var
  lCDSSalesman: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select Nama,Kode,ID from TSupplier where issalesman = 1';
  lCDSSalesman := TDBUtils.OpenDataset(sSQL);
  cbbCustomer.Properties.LoadFromCDS(lCDSSalesman,'ID','Nama',['ID'],Self);
  cbbCustomer.Properties.SetMultiPurposeLookup;
end;

end.
