unit ufrmAccount;

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
  dxStatusBar, cxTL, cxMaskEdit, cxTLdxBarBuiltInMenu, cxInplaceContainer,
  cxDBTL, cxTLData, ClientModule, uAccount, uAppUtils, uDBUtils, cxDropDownEdit,
  cxTextEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox;

type
  TfrmAccount = class(TfrmDefault)
    lstAccount: TcxDBTreeList;
    cxdbtrlstclmnKode: TcxDBTreeListColumn;
    cxdbtrlstclmnKelompok: TcxDBTreeListColumn;
    cxdbtrlstclmnIsAkunTransaksi: TcxDBTreeListColumn;
    lblParent: TLabel;
    lblKode: TLabel;
    lblKelompok: TLabel;
    cbbParent: TcxExtLookupComboBox;
    edParentNama: TcxTextEdit;
    edKode: TcxTextEdit;
    edNama: TcxTextEdit;
    cbbKelompok: TcxComboBox;
    chkIsAkunTransaksi: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ActionBaruExecute(Sender: TObject);
    procedure ActionHapusExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
    procedure cbbParentExit(Sender: TObject);
    procedure lstAccountDblClick(Sender: TObject);
    procedure lstAccountEditing(Sender: TcxCustomTreeList; AColumn:
        TcxTreeListColumn; var Allow: Boolean);
  private
    cdsParent: TClientDataSet;
    FAccount: TAccount;
    function GetAccount: TAccount;
    procedure InisialisasiCBBParent;
    procedure LoadDataAccount(AID : String);
    property Account: TAccount read GetAccount write FAccount;
    { Private declarations }
  public
    destructor Destroy; override;
    { Public declarations }
  end;

var
  frmAccount: TfrmAccount;

implementation

{$R *.dfm}

procedure TfrmAccount.FormCreate(Sender: TObject);
begin
  inherited;
  InisialisasiCBBParent;

  ActionBaruExecute(Sender);


end;

destructor TfrmAccount.Destroy;
begin
  inherited;
  FAccount.Free;
end;

procedure TfrmAccount.ActionBaruExecute(Sender: TObject);
begin
  inherited;
  InisialisasiCBBParent;
  LoadDataAccount('')
end;

procedure TfrmAccount.ActionHapusExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Anda yakin akan menghapus data ?') then
    Exit;

  if ClientDataModule.ServerAccountClient.Delete(Account) then
  begin
    TAppUtils.InformationBerhasilHapus;

    ActionBaruExecute(Sender);
  end;
end;

procedure TfrmAccount.ActionRefreshExecute(Sender: TObject);
var
  lcds: TClientDataSet;
begin
  inherited;
  lcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.DS_OverviewAccount(), Self);
  if lstAccount.DataController.DataSource = nil then
    lstAccount.DataController.DataSource := TDataSource.Create(lstAccount);

  lstAccount.DataController.DataSource.DataSet := lcds;
//  lstAccount.FocusedNode.Expand(True);
  lstAccount.ApplyBestFit;
end;

procedure TfrmAccount.ActionSimpanExecute(Sender: TObject);
begin
  inherited;
  if not ValidateEmptyCtrl([1]) then
    Exit;

  Account.IsAkunTransaksi := 0;
  if chkIsAkunTransaksi.Checked then
    Account.IsAkunTransaksi := 1;

  Account.Kelompok  := cbbKelompok.Properties.Items[cbbKelompok.ItemIndex];
  Account.Kode      := trim(edKode.Text);
  Account.Nama      := trim(edNama.Text);

  if cbbParent.EditValue <> null then
    Account.Parent    := TAccount.CreateID(cbbParent.EditValue);

  if ClientDataModule.ServerAccountClient.Save(FAccount) then
  begin
    TAppUtils.InformationBerhasilSimpan;

    ActionBaruExecute(Sender);
  end;
end;

procedure TfrmAccount.cbbParentExit(Sender: TObject);
begin
  inherited;
  if cbbParent.EditValue <> null then
    edParentNama.Text := cdsParent.FieldByName('nama').AsString
  else
    edParentNama.Text := '';
end;

function TfrmAccount.GetAccount: TAccount;
begin
  if FAccount = nil then
    FAccount := TAccount.Create;

  Result := FAccount;
end;

procedure TfrmAccount.InisialisasiCBBParent;
begin
  cdsParent := TDBUtils.OpenDataset('Select ID,Kode,Nama' +
                               ' From TAccount' +
                               ' where isakuntransaksi = 0' +
                               ' order by kode ');

  cbbParent.Properties.LoadFromCDS(cdsParent,'ID','Kode',['ID'],Self);
  cbbParent.Properties.SetMultiPurposeLookup;
end;

procedure TfrmAccount.LoadDataAccount(AID : String);
begin
  ClearByTag([0,1]);
  chkIsAkunTransaksi.Checked := False;

  FreeAndNil(FAccount);

  if AID = '' then
    Exit;

  FAccount := ClientDataModule.ServerAccountClient.Retrieve(AID);
  if FAccount <> nil then
  begin
    cbbParent.EditValue        := FAccount.Parent.ID;
    edKode.Text                := FAccount.Kode;
    edNama.Text                := FAccount.Nama;
    cbbKelompok.ItemIndex      := cbbKelompok.Properties.Items.IndexOf(FAccount.Kelompok);
    chkIsAkunTransaksi.Checked := FAccount.IsAkunTransaksi = 1;
  end;
end;

procedure TfrmAccount.lstAccountDblClick(Sender: TObject);
begin
  LoadDataAccount(lstAccount.DataController.DataSource.DataSet.FieldByName('ID').AsString);
  cxPCData.ActivePageIndex := 1;
  inherited;
end;

procedure TfrmAccount.lstAccountEditing(Sender: TcxCustomTreeList; AColumn:
    TcxTreeListColumn; var Allow: Boolean);
begin
  inherited;
  Allow := False;
end;

end.
