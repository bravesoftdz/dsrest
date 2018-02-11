unit ufrmUser;

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
  dxStatusBar, cxTextEdit, uAppUtils, uUser, ClientModule, uDBUtils;

type
  TfrmUser = class(TfrmDefault)
    pnlUser: TPanel;
    lblUser: TLabel;
    lblPassword: TLabel;
    edUser: TcxTextEdit;
    edPassword: TcxTextEdit;
    cxgrdlvlMenu: TcxGridLevel;
    cxGridMenu: TcxGrid;
    cxGridTableMenu: TcxGridTableView;
    cxGridColID: TcxGridColumn;
    cxGridColMenuName: TcxGridColumn;
    cxGridColMenuCaption: TcxGridColumn;
    cxGridColStatus: TcxGridColumn;
    procedure ActionBaruExecute(Sender: TObject);
    procedure ActionHapusExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
    procedure cxGridDBTableOverviewCellDblClick(Sender: TcxCustomGridTableView;
        ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
        TShiftState; var AHandled: Boolean);
  private
    fcds: TClientDataset;
    FCDSMenuItem: tclientDataSet;
    FUser: TUser;
    function GetUser: TUser;
    procedure LoadDaftarMenu;
    procedure UpdateStatusMenu;
    procedure UpdateUserMenuItem;
    function IsBisaSimpan: Boolean;
    { Private declarations }
  public
    procedure LoadDataTransaksi(AID : String); override;
    property User: TUser read GetUser write FUser;
    { Public declarations }
  end;

var
  frmUser: TfrmUser;

implementation

{$R *.dfm}

procedure TfrmUser.ActionBaruExecute(Sender: TObject);
begin
  inherited;
  LoadDataTransaksi('');
end;

procedure TfrmUser.ActionHapusExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Anda yakin akan menghapus data ?') then
    Exit;

  if ClientDataModule.ServerUserClient.Delete(User) then
  begin
    TAppUtils.InformationBerhasilHapus;
    ActionBaruExecute(Sender);
  end;
end;

procedure TfrmUser.ActionRefreshExecute(Sender: TObject);
begin
  inherited;
  FreeAndNil(fcds);
  fcds := TDBUtils.DSToCDS(ClientDataModule.DSDataCLient.DS_UserLookUp(), Self);

  cxGridDBTableOverview.SetDataset(Fcds, True);
  cxGridDBTableOverview.ApplyBestFit();
  cxGridDBTableOverview.SetVisibleColumns(['ID'], False);
end;

procedure TfrmUser.ActionSimpanExecute(Sender: TObject);
begin
  inherited;
  if not IsBisaSimpan then
    Exit;

  User.UserName := edUser.Text;
  User.Password := edPassword.Text;

  UpdateUserMenuItem;
  if ClientDataModule.ServerUserClient.Save(User) then
  begin
    TAppUtils.InformationBerhasilSimpan;
    ActionBaruExecute(Sender);
  end;
end;

procedure TfrmUser.cxGridDBTableOverviewCellDblClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  LoadDataTransaksi(cxGridDBTableOverview.DS.FieldByName('ID').AsString);
  if User.ID <> '' then
    cxPCData.ActivePageIndex := 1;
end;

function TfrmUser.GetUser: TUser;
begin
  if FUser = nil then
    FUser := TUser.Create;

  Result := FUser;
end;

procedure TfrmUser.LoadDaftarMenu;
var
  iBaris: Integer;
begin
  FCDSMenuItem := TDBUtils.DSToCDS(ClientDataModule.DSDataCLient.DS_MenuLookUp(),Self);

  FCDSMenuItem.First;
  cxGridTableMenu.ClearRows;
  while not FCDSMenuItem.Eof do
  begin
    iBaris := cxGridTableMenu.DataController.AppendRecord;
    cxGridTableMenu.SetValue(iBaris,cxGridColID.Index, FCDSMenuItem.FieldByName('id').AsString);
    cxGridTableMenu.SetValue(iBaris,cxGridColMenuName.Index, FCDSMenuItem.FieldByName('menuname').AsString);
    cxGridTableMenu.SetValue(iBaris,cxGridColMenuCaption.Index, FCDSMenuItem.FieldByName('menucaption').AsString);
    cxGridTableMenu.SetValue(iBaris,cxGridColStatus.Index, FCDSMenuItem.FieldByName('status').AsString);

    FCDSMenuItem.Next;
  end;
  cxGridTableMenu.ApplyBestFit();
end;

function TfrmUser.IsBisaSimpan : Boolean;
begin
  Result := False;

  if not ValidateEmptyCtrl then
    Exit;

//  if not TAppUtils.Confirm('Anda yakin akan menyimpan data?') then
//    Exit;

  Result := True;

end;

procedure TfrmUser.LoadDataTransaksi(AID : String);
begin
  inherited;
  FreeAndNil(FCDSMenuItem);
  LoadDaftarMenu;

  if AID = '' then
    Exit;

  FreeAndNil(FUser);
  FUser := ClientDataModule.ServerUserClient.Retrieve(AID);

  edUser.Text     := User.UserName;
  edPassword.Text := User.Password;

  UpdateStatusMenu;

end;

procedure TfrmUser.UpdateStatusMenu;
var
  I: Integer;
begin
  for I := 0 to User.UserMenuItems.Count - 1 do
  begin
    if cxGridTableMenu.DataController.Values[i,cxGridColID.Index] = User.UserMenuItems[i].Menu.ID then
    begin
      cxGridTableMenu.DataController.Values[i,cxGridColStatus.Index] := 1;

    end;
  end;
end;

procedure TfrmUser.UpdateUserMenuItem;
var
  I: Integer;
  lUMItem: TUserMenuItem;
begin
  User.UserMenuItems.Clear;
  for I := 0 to cxGridTableMenu.DataController.RecordCount - 1 do
  begin
    if cxGridTableMenu.DataController.Values[i,cxGridColStatus.Index] = 1 then
    begin
      lUMItem := TUserMenuItem.Create;
      lUMItem.Menu := TMenu.CreateID(cxGridTableMenu.DataController.Values[i,cxGridColID.Index]);

      User.UserMenuItems.Add(lUMItem);
    end;
  end;
end;

end.
