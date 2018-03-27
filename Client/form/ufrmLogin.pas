unit ufrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  Vcl.Menus, cxButtons, ClientModule, uSettingApp, uAppUtils;

type
  TfrmLogin = class(TForm)
    lblUser: TLabel;
    lblPassword: TLabel;
    edUser: TcxTextEdit;
    edPassword: TcxTextEdit;
    bLogin: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure bLoginClick(Sender: TObject);
    procedure edPasswordKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edUserKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  if TAppUtils.IsDeveloperMode then
  begin
    edUser.Text     := 'admin';
    edPassword.Text := 'admin1';
  end else begin
    edUser.Text     := '';
    edPassword.Text := '';

  end;
end;

procedure TfrmLogin.bLoginClick(Sender: TObject);
begin
  FreeAndNil(uSettingApp.UserApplikasi);
  uSettingApp.UserApplikasi := ClientDataModule.ServerUserClient.DoLogin(edUser.Text, edPassword.Text);

  if uSettingApp.UserApplikasi.ID <> '' then
  begin
    ModalResult := mrOk;
  end else begin
    TAppUtils.Warning('User / Password Salah');
  end;
end;

procedure TfrmLogin.edPasswordKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  if Key = VK_RETURN then
    bLogin.SetFocus;
end;

procedure TfrmLogin.edUserKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  if Key = VK_RETURN then
    edPassword.SetFocus;
end;

end.
