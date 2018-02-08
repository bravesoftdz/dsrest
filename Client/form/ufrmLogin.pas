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
    procedure bLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

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

end.
