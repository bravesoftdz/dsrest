unit ufrmJurnal;

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
  dxStatusBar, cxDBExtLookupComboBox, cxCurrencyEdit, dxCore, cxDateUtils,
  cxDropDownEdit, cxMemo, cxLookupEdit, cxDBLookupEdit, cxMaskEdit, cxCalendar,
  cxTextEdit,uDBUtils,uAppUtils, uJurnal, ClientModule, uModel, uDMReport, Data.FireDACJSONReflect;

type
  TfrmJurnal = class(TfrmDefault)
    pnlHeader: TPanel;
    lblNoBukti: TLabel;
    lblTglBukti: TLabel;
    lblKeterangan: TLabel;
    edNoBukti: TcxTextEdit;
    edTglBukti: TcxDateEdit;
    memKeterangan: TcxMemo;
    cxGridJurnal: TcxGrid;
    cxGridTableJurnal: TcxGridTableView;
    cxGridColKode: TcxGridColumn;
    cxGridColNama: TcxGridColumn;
    cxGridColDebet: TcxGridColumn;
    cxGridColKeterangan: TcxGridColumn;
    cxgrdlvlJurnal: TcxGridLevel;
    cxGridColKredit: TcxGridColumn;
    procedure ActionBaruExecute(Sender: TObject);
    procedure ActionHapusExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGridColKodePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridDBTableOverviewCellDblClick(Sender: TcxCustomGridTableView;
        ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
        TShiftState; var AHandled: Boolean);
    procedure cxGridColNamaPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    FCDSAccount: tclientDataSet;
    FJurnal: TJurnal;
    function GetJurnal: TJurnal;
    procedure InisialisasiAccount;
    { Private declarations }
  protected
    function GetJenisJurnal: String;
  public
    procedure CetakSlip; override;
    procedure LoadData(AID : String);
    property Jurnal: TJurnal read GetJurnal write FJurnal;
    { Public declarations }
  end;

var
  frmJurnal: TfrmJurnal;

implementation

{$R *.dfm}

procedure TfrmJurnal.ActionBaruExecute(Sender: TObject);
begin
  inherited;
  LoadData('');
end;

procedure TfrmJurnal.ActionHapusExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Anda yakin akan menghapus data ?') then
    Exit;

  if ClientDataModule.ServerJurnalClient.Delete(Jurnal) then
  begin
    TAppUtils.InformationBerhasilHapus;
    ActionBaruExecute(Sender);
  end;
end;

procedure TfrmJurnal.ActionRefreshExecute(Sender: TObject);
var
  lcds: TClientDataSet;
begin
  inherited;
  if chkKonsolidasi1.Checked then
    lcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.RetriveJurnal(dtpAwal.DateTime, dtpAkhir.DateTime, nil, GetJenisJurnal), cxGridDBTableOverview)
  else
    lcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.RetriveJurnal(dtpAwal.DateTime, dtpAkhir.DateTime, ClientDataModule.Cabang, GetJenisJurnal), cxGridDBTableOverview);

  cxGridDBTableOverview.SetDataset(lcds, True);
  cxGridDBTableOverview.SetVisibleColumns(['ID', 'CABANGID'], False);
  cxGridDBTableOverview.ApplyBestFit();
end;

procedure TfrmJurnal.ActionSimpanExecute(Sender: TObject);
var
  I: Integer;
  lJurnalItem: TJurnalItem;
begin

  inherited;
  if Jurnal.ID = '' then
    edNoBukti.Text := ClientDataModule.ServerJurnalClient.GenerateNoBukti(edTglBukti.Date, ClientDataModule.Cabang.Kode);

  if not ValidateEmptyCtrl([1]) then
    Exit;

  Jurnal.NoBukti     := edNoBukti.Text;
  Jurnal.TglBukti    := edTglBukti.Date;
  Jurnal.Keterangan  := memKeterangan.Lines.Text;
  Jurnal.Cabang      := TCabang.CreateID(ClientDataModule.Cabang.ID);

  Jurnal.JurnalItems.Clear;
  for I := 0 to cxGridTableJurnal.DataController.RecordCount - 1 do
  begin
    lJurnalItem := TJurnalItem.Create();
    cxGridTableJurnal.LoadObjectData(lJurnalItem, i);
    Jurnal.JurnalItems.Add(lJurnalItem);
  end;

  if Jurnal.Debet <> Jurnal.Kredit then
  begin
    TAppUtils.Warning('Nilai Debet Tidak Sama Dengan Kredit');
    Exit;
  end;

  if ClientDataModule.ServerJurnalClient.Save(Jurnal) then
  begin
    TAppUtils.InformationBerhasilSimpan;
    ActionBaruExecute(Sender);
  end;
end;

procedure TfrmJurnal.CetakSlip;
var
  lcds: TFDJSONDataSets;
begin
  inherited;

  with dmReport do
  begin
    AddReportVariable('UserCetak', UserAplikasi.UserName);

    if cxPCData.ActivePageIndex = 0 then
      lcds := ClientDataModule.ServerJurnalClient.RetrieveDataSlip(dtpAwal.DateTime, dtpAkhir.DateTime, ClientDataModule.Cabang.ID, 'XXX')
    else
      lcds := ClientDataModule.ServerJurnalClient.RetrieveDataSlip(dtpAwal.DateTime, dtpAkhir.DateTime, ClientDataModule.Cabang.ID, Jurnal.ID);


    ExecuteReport( 'Reports/Slip_Jurnal' ,
      lcds

    );
  end;
end;

procedure TfrmJurnal.cxGridColKodePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  cxGridTableJurnal.SetValue(cxGridTableJurnal.FocusedIndex,cxGridColNama.Index, FCDSAccount.FieldByName('ID').AsString);
end;

procedure TfrmJurnal.cxGridColNamaPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  cxGridTableJurnal.SetValue(cxGridTableJurnal.FocusedIndex,cxGridColKode.Index, FCDSAccount.FieldByName('ID').AsString);
end;

procedure TfrmJurnal.cxGridDBTableOverviewCellDblClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  LoadData(cxGridDBTableOverview.DS.FieldByName('ID').AsString);
  cxPCData.ActivePageIndex := 1;
end;

procedure TfrmJurnal.FormCreate(Sender: TObject);
begin
  inherited;
  InisialisasiAccount;

  ActionBaruExecute(Sender);
end;

function TfrmJurnal.GetJenisJurnal: String;
begin
  Result := TJurnal.ClassName;
end;

function TfrmJurnal.GetJurnal: TJurnal;
begin
  if FJurnal = nil then
    FJurnal := TJurnal.Create;

  Result := FJurnal;
end;

procedure TfrmJurnal.InisialisasiAccount;
begin
  FCDSAccount := TDBUtils.DSToCDS(ClientDataModule.DSDataCLient.LoadAccountPengeluaranKasLain(), Self);
  TcxExtLookupComboBoxProperties(cxGridColKode.Properties).LoadFromCDS(FCDSAccount, 'ID', 'Kode', ['id'], Self);
  TcxExtLookupComboBoxProperties(cxGridColNama.Properties).LoadFromCDS(FCDSAccount, 'ID', 'Nama', ['id'], Self);
end;

procedure TfrmJurnal.LoadData(AID : String);
var
  I: Integer;
begin
  ClearByTag([0,1]);
  FreeAndNil(FJurnal);
  cxGridTableJurnal.ClearRows;

  if AID = '' then
    Exit;

  FJurnal := ClientDataModule.ServerJurnalClient.Retrieve(AID);
  if FJurnal = nil then
    Exit;

  if FJurnal.ID = '' then
    Exit;

  edNoBukti.Text            := FJurnal.NoBukti;
  edTglBukti.Date           := FJurnal.TglBukti;
  memKeterangan.Lines.Text  := FJurnal.Keterangan;

  for I := 0 to FJurnal.JurnalItems.Count - 1 do
  begin
    cxGridTableJurnal.DataController.AppendRecord;
    cxGridTableJurnal.SetObjectData(FJurnal.JurnalItems[i], i);
    cxGridTableJurnal.SetValue(i, cxGridColNama.Index, FJurnal.JurnalItems[i].Account.ID);
  end;
end;

end.
