unit ufrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AppEvnts, StdCtrls, IdHTTPWebBrokerBridge, HTTPApp,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxTextEdit,  uDBUtils, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ServerMethodsUnit,

  ExtCtrls, WebModule, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Phys.PG, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSSQL, Data.DB, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.DApt, cxGraphics,
  FireDAC.Phys.MSSQLDef, FireDAC.Phys.PGDef, uTransferAntarCabang,
  FireDAC.Stan.StorageBin,uPenerimaanBarang;

type
  TfrmServer = class(TForm)
    ApplicationEvents1: TApplicationEvents;
    ds1: TDataSource;
    pnlKoneksi: TPanel;
    grpDB: TGroupBox;
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
    grpRestServer: TGroupBox;
    Label1: TLabel;
    ButtonStart: TButton;
    ButtonStop: TButton;
    EditPort: TEdit;
    ButtonOpenBrowser: TButton;
    mmoLogs: TMemo;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDConnection1: TFDConnection;
    FDTransaction1: TFDTransaction;
    FDMemTable1: TFDMemTable;
    FDQuery1: TFDQuery;
    btn1: TButton;
    fdstnstrgbnlnkMotoroli: TFDStanStorageBinLink;
    tmrDB: TTimer;
    btnBackUPDB: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure btn1Click(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
    procedure btnKonekDBClick(Sender: TObject);
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
    procedure ButtonOpenBrowserClick(Sender: TObject);
    procedure cbbEngineExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mmoLogsChange(Sender: TObject);
    procedure tmrDBTimer(Sender: TObject);
    procedure btnBackUPDBClick(Sender: TObject);
  private
    FCRUDServer: TCRUDServer;
    FServer: TIdHTTPWebBrokerBridge;
    function GetCRUDServer: TCRUDServer;
    procedure StartServer;
    property CRUDServer: TCRUDServer read GetCRUDServer write FCRUDServer;
    { Private declarations }
  public
    destructor Destroy; override;
    procedure SetServerLogs(AMessage : String);
    { Public declarations }
  end;

var
  frmServer: TfrmServer;

implementation

{$R *.dfm}

uses
  ShellApi, DSService, uAppUtils, uModel;

procedure TfrmServer.ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
begin
  ButtonStart.Enabled := not FServer.Active;
  ButtonStop.Enabled  := FServer.Active;
  EditPort.Enabled    := not FServer.Active;
end;

procedure TfrmServer.ButtonOpenBrowserClick(Sender: TObject);
var
  LURL: string;
begin
  StartServer;
  LURL := Format('http://localhost:%s', [EditPort.Text]);
  ShellExecute(0,
        nil,
        PChar(LURL), nil, nil, SW_SHOWNOACTIVATE);
end;

procedure TfrmServer.ButtonStartClick(Sender: TObject);
begin
  StartServer;
end;

procedure TerminateThreads;
begin
//  if TDSSessionManager.Instance <> nil then
//    TDSSessionManager.Instance.TerminateAllSessions;
end;

destructor TfrmServer.Destroy;
begin
  inherited;
  FreeAndNil(FCRUDServer);
end;

procedure TfrmServer.btn1Click(Sender: TObject);
begin
  mmoLogs.Clear;
end;

procedure TfrmServer.btnBackUPDBClick(Sender: TObject);
var
  sSQL : string;
  sNama : string;
  sFilePath : String;
begin
  sNama := FormatDateTime('yyyy-MM-dd-hhmmss', Now) + '.bak';
  sFilePath := ExtractFileDir(ParamStr(0));

  sSQL := 'BACKUP DATABASE ' + edDatabase.Text + ' TO DISK = ' + QuotedStr(sFilePath + '\backupdb\' + sNama) +
          ' WITH FORMAT,MEDIANAME = ' + QuotedStr('Z_SQLServerBackups') + ' ,NAME = ' + QuotedStr('Full Backup of MDS');
  if TDBUtils.ExecuteSQL(sSQL) then
  begin
    ShowMessage('Database berhasil di-backup ke folder backup dengan nama file ' + sNama);
  end;
end;

procedure TfrmServer.btnTestClick(Sender: TObject);
var
  lPB: TPenerimaanBarang;
begin
  with TServerPenerimaanBarang.Create do
  begin
    try
      lPB := TPenerimaanBarang.Create;
      mmoLogs.Lines.Text := TDBUtils.GenerateSQLSelect(lPB);
      lPB.Free;
    finally
      Free;
    end;
  end;
end;

procedure TfrmServer.btnKonekDBClick(Sender: TObject);
begin
  if btnKonekDB.Caption = 'Connect' then
  begin
    if TDBUtils.ConnectDB(cbbEngine.Text, edServer.Text, edDatabase.Text, edUser.Text, edPassword.Text, edPort.Text) then
    begin
      btnKonekDB.Caption := 'Disconect';
      grpRestServer.Enabled := True;
      mmoLogs.Lines.Add('Menambungkan DB ke ' + edServer.Text);
    end;
  end else begin
    ADConnection.Close;
    btnKonekDB.Caption := 'Connect';
    grpRestServer.Enabled := False;
    mmoLogs.Lines.Add('Memutus DB dari ' + edServer.Text);
  end;


end;

procedure TfrmServer.ButtonStopClick(Sender: TObject);
begin
  TerminateThreads;
  FServer.Active := False;
  FServer.Bindings.Clear;

  mmoLogs.Lines.Add('Rest Server dimatikan');
end;

procedure TfrmServer.cbbEngineExit(Sender: TObject);
begin
  if cbbEngine.Text = 'PG' then
  begin
    edPort.Text := '5432';
    edUser.Text := 'postgres';
  end else if cbbEngine.Text = 'SQLSERVER' then
  begin
    edPort.Text := '1433';
    edUser.Text := 'sa';
  end;

end;

procedure TfrmServer.FormCreate(Sender: TObject);
begin
  FServer := TIdHTTPWebBrokerBridge.Create(Self);

  if TAppUtils.BacaRegistry('Server') <> '' then
  begin
    cbbEngine.ItemIndex := cbbEngine.Items.IndexOf(TAppUtils.BacaRegistry('Engine'));
    edServer.Text := TAppUtils.BacaRegistry('Server');
    edDatabase.Text := TAppUtils.BacaRegistry('Database');
    edUser.Text := TAppUtils.BacaRegistry('User_Name');
    edPassword.Text := TAppUtils.BacaRegistry('Password');
    edPort.Text := TAppUtils.BacaRegistry('Port');

    tmrDB.Enabled     := True;
  end;

  webmodule.mmoLogs := Self.mmoLogs;
  uDBUtils.mmoLogs  := Self.mmoLogs;


end;

procedure TfrmServer.FormShow(Sender: TObject);
begin
//  btnKonekDBClick(Sender);
//  ButtonStartClick(Sender);
end;

function TfrmServer.GetCRUDServer: TCRUDServer;
begin
  if FCRUDServer = nil then
    FCRUDServer := TCRUDServer.Create;

  Result := FCRUDServer;
end;

procedure TfrmServer.mmoLogsChange(Sender: TObject);
begin
  if mmoLogs.Lines.Count > 10000 then
  begin
//    mmoLogs.Lines.SaveToFile(ExtractFilePath(ParamStr(0)) + IntToStr(GetTickCount) + '.txt');
    mmoLogs.Lines.Clear;
  end;
end;

procedure TfrmServer.SetServerLogs(AMessage : String);
begin
  mmoLogs.Lines.Add(AMessage);
end;

procedure TfrmServer.StartServer;
begin
  if not FServer.Active then
  begin
    FServer.Bindings.Clear;
    FServer.DefaultPort := StrToInt(EditPort.Text);
    FServer.Active := True;
    WebModule2.DSServer1.Start;


    CRUDServer.InisialisasiSettingAppServer;

    mmoLogs.Lines.Add('Rest server dijalankan');
  end;
end;

procedure TfrmServer.tmrDBTimer(Sender: TObject);
begin
  try
    btnKonekDB.Click;
    ButtonStart.Click;
  finally
    tmrDB.Enabled := False;
  end;
end;

end.
