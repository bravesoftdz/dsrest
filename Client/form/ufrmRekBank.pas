unit ufrmRekBank;

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
  dxStatusBar, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox, uAccount, uRekBank;

type
  TfrmRekBank = class(TfrmDefault)
    lblBank: TLabel;
    lblNoRek: TLabel;
    lblPemegang: TLabel;
    lblCabang: TLabel;
    lblAccount: TLabel;
    edBank: TcxTextEdit;
    edCabang: TcxTextEdit;
    edNoRek: TcxTextEdit;
    edPemegang: TcxTextEdit;
    cbbAccount: TcxExtLookupComboBox;
    edAccountName: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure ActionBaruExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
    procedure cbbAccountExit(Sender: TObject);
    procedure cxGridDBTableOverviewCellDblClick(Sender: TcxCustomGridTableView;
        ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
        TShiftState; var AHandled: Boolean);
  private
    FcdsAccount: TClientDataSet;
    FRekBang: TRekBank;
    function GetRekBang: TRekBank;
    procedure InisialisasiCBBAccount;
    { Private declarations }
  public
    destructor Destroy; override;
    procedure LoadData(AID : string);
    property cdsAccount: TClientDataSet read FcdsAccount write FcdsAccount;
    { Public declarations }
  published
    property RekBang: TRekBank read GetRekBang write FRekBang;
  end;

var
  frmRekBank: TfrmRekBank;

implementation
uses
  uAppUtils, uDBUtils, ClientModule;

{$R *.dfm}

destructor TfrmRekBank.Destroy;
begin
  inherited;
  FreeAndNil(FcdsAccount);
  FreeAndNil(FRekBang);
end;

procedure TfrmRekBank.FormCreate(Sender: TObject);
begin
  inherited;
  ActionBaruExecute(Sender);
  InisialisasiCBBAccount;
end;

procedure TfrmRekBank.ActionBaruExecute(Sender: TObject);
begin
  inherited;
  LoadData('');
end;

procedure TfrmRekBank.ActionRefreshExecute(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := 'select a.bank,a.alamat,a.norek,a.namapemegang as nama_pemegang,' +
          ' b.kode as kode_acccount ,' +
          ' b.nama as Nama_Account ,a.id' +
          ' from trekbank a' +
          ' left join taccount b on a.account = b.id' +
          ' order by a.bank';

  cxGridDBTableOverview.SetDataset(sSQL, True);
  cxGridDBTableOverview.SetVisibleColumns(['id'],False);
  cxGridDBTableOverview.ApplyBestFit();
end;

procedure TfrmRekBank.ActionSimpanExecute(Sender: TObject);
begin
  inherited;
  if not ValidateEmptyCtrl([1]) then
    Exit;

  RekBang.Bank         := edBank.Text;
  RekBang.Alamat       := edCabang.Text;
  RekBang.Account      := TAccount.CreateID(cbbAccount.EditValue);
  RekBang.NamaPemegang := edPemegang.Text;
  RekBang.NoRek        := edNoRek.Text;

  if ClientDataModule.ServerRekBankClient.Save(RekBang) then
  begin
    TAppUtils.InformationBerhasilSimpan;
    ActionBaruExecute(Sender);
  end;

end;

procedure TfrmRekBank.cbbAccountExit(Sender: TObject);
begin
  inherited;
  edAccountName.Text := cdsAccount.FieldByName('nama').AsString;
end;

procedure TfrmRekBank.cxGridDBTableOverviewCellDblClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;

  LoadData(cxGridDBTableOverview.DS.FieldByName('ID').AsString);
  cxPCData.ActivePageIndex := 1;
end;

function TfrmRekBank.GetRekBang: TRekBank;
begin
  if FRekBang = nil then
    FRekBang := TRekBank.Create;

  Result := FRekBang;
end;

procedure TfrmRekBank.InisialisasiCBBAccount;
var
  sSQL: string;
begin
  sSQL := 'Select id,kode,nama from taccount where isakuntransaksi = 1';
  cdsAccount := TDBUtils.OpenDataset(sSQL);

  cbbAccount.Properties.LoadFromCDS(cdsAccount,'ID','Kode',['ID'],Self);
  cbbAccount.Properties.SetMultiPurposeLookup;
end;

procedure TfrmRekBank.LoadData(AID : string);
begin
  ClearByTag([0,1]);
  FreeAndNil(FRekBang);

  if AID = '' then
    Exit;

  FRekBang := ClientDataModule.ServerRekBankClient.Retrieve(AID);
  if FRekBang = nil then
    Exit;

  if FRekBang.ID = '' then
    Exit;

  edBank.Text          := RekBang.Bank;
  edCabang.Text        := RekBang.Alamat;

  try
    cbbAccount.EditValue := RekBang.Account.ID;
    FcdsAccount.Filter   := 'ID = ' + QuotedStr(RekBang.Account.ID);
    FcdsAccount.Filtered := True;
    edAccountName.Text   := FcdsAccount.FieldByName('nama').AsString;
  finally
    FcdsAccount.Filtered := False;

  end;


  edPemegang.Text      := RekBang.NamaPemegang;
  edNoRek.Text         := RekBang.NoRek;
end;

end.
