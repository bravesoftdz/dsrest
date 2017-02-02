unit ufrmKoneksi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, StdCtrls, cxTextEdit,uDBUtils, uAppUtils, ClientModule,
  FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.SQLite;

type
  TfrmKoneksi = class(TForm)
    grpKoneksiLokasi: TGroupBox;
    lblServer: TLabel;
    lblUser: TLabel;
    lblPassword: TLabel;
    lblEngine: TLabel;
    lblDatabase: TLabel;
    lblPort: TLabel;
    edServer: TcxTextEdit;
    edUser: TcxTextEdit;
    edPassword: TcxTextEdit;
    cbbEngine: TComboBox;
    edDatabase: TcxTextEdit;
    edPort: TcxTextEdit;
    btnKonekDB: TButton;
    grpKoneksiRestServer: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    edRestServer: TcxTextEdit;
    edRestUser: TcxTextEdit;
    edRestPassword: TcxTextEdit;
    edRestPort: TcxTextEdit;
    btnTestRestServer: TButton;
    fdphysqltdrvrlnk1: TFDPhysSQLiteDriverLink;
    procedure FormCreate(Sender: TObject);
    procedure btnKonekDBClick(Sender: TObject);
    procedure btnTestRestServerClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKoneksi: TfrmKoneksi;

implementation

{$R *.dfm}

procedure TfrmKoneksi.FormCreate(Sender: TObject);
begin
  if TAppUtils.BacaRegistry('Database') <> '' then
  begin
    cbbEngine.ItemIndex  := cbbEngine.Items.IndexOf(TAppUtils.BacaRegistry('Engine'));
    edServer.Text        := TAppUtils.BacaRegistry('Server');
    edDatabase.Text      := TAppUtils.BacaRegistry('Database');
    edUser.Text          := TAppUtils.BacaRegistry('User_Name');
    edPassword.Text      := TAppUtils.BacaRegistry('Password');
    edPort.Text          := TAppUtils.BacaRegistry('Port');

    edRestServer.Text    := TAppUtils.BacaRegistry('RestServer');
    edRestPort.Text    := TAppUtils.BacaRegistry('RestPort');
  end;
end;

procedure TfrmKoneksi.btnKonekDBClick(Sender: TObject);
begin
  if btnKonekDB.Caption = 'Connect' then
  begin
    if TDBUtils.ConnectDB(cbbEngine.Text, edServer.Text, edDatabase.Text, edUser.Text, edPassword.Text, edPort.Text) then
    begin
      btnKonekDB.Caption := 'Disconect';
//      grpRestServer.Enabled := True;
    end;
  end else begin
    ADConnection.Close;
    btnKonekDB.Caption := 'Connect';
//    grpRestServer.Enabled := False;
  end;
end;

procedure TfrmKoneksi.btnTestRestServerClick(Sender: TObject);
begin
  ClientDataModule.DSRestConnection.Host := edRestServer.Text;
  ClientDataModule.DSRestConnection.Port := StrToInt(edRestPort.Text);

  try
    ClientDataModule.DSRestConnection.TestConnection();

    TAppUtils.TulisRegistry('RestServer', edRestServer.Text);
    TAppUtils.TulisRegistry('RestPort', edRestPort.Text);

    TAppUtils.Information('Berhasil Membangun Koneksi ke Rest Server');
  except
    on E : Exception do
    begin
      TAppUtils.Error(E.Message);
    end;

  end;
end;

procedure TfrmKoneksi.FormShow(Sender: TObject);
begin
  //
end;

end.
