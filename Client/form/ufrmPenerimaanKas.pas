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
  cxDBLookupEdit, cxDBExtLookupComboBox, cxCurrencyEdit,uModel,uPenerimaanKas;

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
    lblNominal: TLabel;
    edNominal: TcxCurrencyEdit;
    cxgrdclmnKeterangan: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure ActionBaruExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
    procedure btnLoadARClick(Sender: TObject);
    procedure edTglBuktiExit(Sender: TObject);
  private
    FPenerimaanKas: TPenerimaanKas;
    function GetPenerimaanKas: TPenerimaanKas;
    procedure InisialisasiCBBSalesman;
    property PenerimaanKas: TPenerimaanKas read GetPenerimaanKas write
        FPenerimaanKas;
    { Private declarations }
  public
    destructor Destroy; override;
    { Public declarations }
  end;

var
  frmPenerimaanKas: TfrmPenerimaanKas;

implementation
uses uAR;

{$R *.dfm}

destructor TfrmPenerimaanKas.Destroy;
begin
  inherited;
  FreeAndNil(FPenerimaanKas);
end;

procedure TfrmPenerimaanKas.FormCreate(Sender: TObject);
begin
  inherited;
  InisialisasiCBBSalesman;

  ActionBaruExecute(Sender);

end;

procedure TfrmPenerimaanKas.ActionBaruExecute(Sender: TObject);
begin
  inherited;
  ClearByTag([0,1]);
  edNoBukti.Text := ClientDataModule.ServerPenerimaanKasClient.GenerateNoBukti(edTglBukti.Date, ClientDataModule.Cabang.Kode + '/BKM/');
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

procedure TfrmPenerimaanKas.ActionSimpanExecute(Sender: TObject);
var
  I: Integer;
  lPKAR: TPenerimaanKasAR;
begin
  inherited;
  if not ValidateEmptyCtrl([1]) then
    Exit;

  PenerimaanKas.Cabang         := TCabang.CreateID(ClientDataModule.Cabang.ID);
  PenerimaanKas.JenisTransaksi := 'PENERIMAAN KAS';
  PenerimaanKas.Keterangan     := memKeterangan.Text;
  PenerimaanKas.NoBukti        := edNoBukti.Text;
  PenerimaanKas.Nominal        := edNominal.Value;
  PenerimaanKas.Pembeli        := TSupplier.CreateID(cbbCustomer.EditValue);

  PenerimaanKas.PenerimaanKasARItems.Clear;
  for I := 0 to cxGridTableAR.DataController.RecordCount - 1 do
  begin
    lPKAR               := TPenerimaanKasAR.Create;
    lPKAR.AR            := TAR.CreateID(cxGridTableAR.GetString(i, cxgrdclmnARNo.Index));
    lPKAR.Nominal       := cxGridTableAR.GetDouble(i, cxgrdclmnNominal.Index);
    lPKAR.Keterangan    := cxGridTableAR.GetString(i, cxgrdclmnKeterangan.Index);
    lPKAR.PenerimaanKas := PenerimaanKas;

    PenerimaanKas.PenerimaanKasARItems.Add(lPKAR);
  end;

  if ClientDataModule.ServerPenerimaanKasClient.Save(PenerimaanKas) then
  begin
    TAppUtils.InformationBerhasilSimpan;
    ActionBaruExecute(Sender);
  end;


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

procedure TfrmPenerimaanKas.edTglBuktiExit(Sender: TObject);
begin
  inherited;
  if PenerimaanKas.ID = '' then
    edNoBukti.Text := ClientDataModule.ServerPenerimaanKasClient.GenerateNoBukti(edTglBukti.Date, ClientDataModule.Cabang.Kode + '/BKM/');
end;

function TfrmPenerimaanKas.GetPenerimaanKas: TPenerimaanKas;
begin
  if FPenerimaanKas = nil then
    FPenerimaanKas := TPenerimaanKas.Create;

  Result := FPenerimaanKas;
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
