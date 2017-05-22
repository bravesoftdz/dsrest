unit ClientModule;

interface

uses
  System.SysUtils, System.Classes,  ClientClassesUnit2, IPPeerClient,
  Datasnap.DSClientRest, uModel, cxStyles, cxClasses, uSettingApp;

type
  TClientDataModule = class(TDataModule)
    DSRestConnection: TDSRestConnection;
    cxStyleRepTrans: TcxStyleRepository;
    cxstylGridHeader: TcxStyle;
    cxstylGridOdd: TcxStyle;
    cxstylGridEven: TcxStyle;
    procedure DataModuleCreate(Sender: TObject);
  private
    FCabang: tcabang;
    FInstanceOwner: Boolean;
    FServerUOMClient: TServerUOMClient;
    FServerSupplierClient: TServerSupplierClient;
    FServerBarangClient: TServerBarangClient;
    FServerGroupBarangClient: TServerGroupBarangClient;
    FServerPenerimaanBarangClient: TServerPenerimaanBarangClient;
    FServerCabangClient: TServerCabangClient;
    FServerLogAppObjectClient: TServerLogAppObjectClient;
    FServerUtilsClient: TServerUtilsClient;
    FServerReturSupplierClient: TServerReturSupplierClient;
    FServerGudangClient: TServerGudangClient;
    FServerLaporanClient: TServerLaporanClient;
    FServerCustomerInvoiceClient: TServerCustomerInvoiceClient;
    FServerPenjualanClient: TServerPenjualanClient;
    FServerAccountClient: TServerAccountClient;
    FServerRekBankClient: TServerRekBankClient;
    FServerPenerimaanKasClient: TServerPenerimaanKasClient;
    FServerSettingAppClient: TServerSettingAppClient;
    FServerTAGRequestClient: TServerTAGRequestClient;
    FServerTransferAntarGudang: TServerTransferAntarGudangClient;
    FSettingApp: TSettingApp;
    FServerTransferAntarCabangKirimClient: TServerTransferAntarCabangKirimClient;
    FServerTransferAntarCabangTerimaClient: TServerTransferAntarCabangTerimaClient;
    function GetCabang: tcabang;
    function GetServerUOMClient: TServerUOMClient;
    function GetServerSupplierClient: TServerSupplierClient;
    function GetServerBarangClient: TServerBarangClient;
    function GetServerGroupBarangClient: TServerGroupBarangClient;
    function GetServerPenerimaanBarangClient: TServerPenerimaanBarangClient;
    function GetServerCabangClient: TServerCabangClient;
    function GetServerLogAppObjectClient: TServerLogAppObjectClient;
    function GetServerUtilsClient: TServerUtilsClient;
    function GetServerReturSupplierClient: TServerReturSupplierClient;
    function GetServerGudangClient: TServerGudangClient;
    function GetServerLaporanClient: TServerLaporanClient;
    function GetServerCustomerInvoiceClient: TServerCustomerInvoiceClient;
    function GetServerPenjualanClient: TServerPenjualanClient;
    function GetServerAccountClient: TServerAccountClient;
    function GetServerRekBankClient: TServerRekBankClient;
    function GetServerPenerimaanKasClient: TServerPenerimaanKasClient;
    function GetServerSettingAppClient: TServerSettingAppClient;
    function GetServerTAGRequestClient: TServerTAGRequestClient;
    function GetServerTransferAntarGudang: TServerTransferAntarGudangClient;
    function GetSettingApp: TSettingApp;
    function GetServerTransferAntarCabangKirimClient:
        TServerTransferAntarCabangKirimClient;
    function GetServerTransferAntarCabangTerimaClient:
        TServerTransferAntarCabangTerimaClient;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Cabang: tcabang read GetCabang write FCabang;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property ServerAccountClient: TServerAccountClient read GetServerAccountClient
        write FServerAccountClient;
    property ServerRekBankClient: TServerRekBankClient read GetServerRekBankClient
        write FServerRekBankClient;
    property ServerUOMClient: TServerUOMClient read GetServerUOMClient write FServerUOMClient;
    property ServerSupplierClient: TServerSupplierClient read GetServerSupplierClient write FServerSupplierClient;
    property ServerBarangClient: TServerBarangClient read GetServerBarangClient write FServerBarangClient;
    property ServerGroupBarangClient: TServerGroupBarangClient read GetServerGroupBarangClient write FServerGroupBarangClient;
    property ServerPenerimaanBarangClient: TServerPenerimaanBarangClient read GetServerPenerimaanBarangClient write FServerPenerimaanBarangClient;
    property ServerCabangClient: TServerCabangClient read GetServerCabangClient write FServerCabangClient;
    property ServerLogAppObjectClient: TServerLogAppObjectClient read GetServerLogAppObjectClient write FServerLogAppObjectClient;
    property ServerUtilsClient: TServerUtilsClient read GetServerUtilsClient write FServerUtilsClient;
    property ServerReturSupplierClient: TServerReturSupplierClient read
        GetServerReturSupplierClient write FServerReturSupplierClient;
    property ServerGudangClient: TServerGudangClient read GetServerGudangClient
        write FServerGudangClient;
    property ServerLaporanClient: TServerLaporanClient read GetServerLaporanClient
        write FServerLaporanClient;
    property ServerCustomerInvoiceClient: TServerCustomerInvoiceClient read
        GetServerCustomerInvoiceClient write FServerCustomerInvoiceClient;
    property ServerPenjualanClient: TServerPenjualanClient read
        GetServerPenjualanClient write FServerPenjualanClient;
    property ServerPenerimaanKasClient: TServerPenerimaanKasClient read
        GetServerPenerimaanKasClient write FServerPenerimaanKasClient;
    property ServerSettingAppClient: TServerSettingAppClient read
        GetServerSettingAppClient write FServerSettingAppClient;
    property ServerTAGRequestClient: TServerTAGRequestClient read
        GetServerTAGRequestClient write FServerTAGRequestClient;
    property ServerTransferAntarGudang: TServerTransferAntarGudangClient read
        GetServerTransferAntarGudang write FServerTransferAntarGudang;
    property SettingApp: TSettingApp read GetSettingApp write FSettingApp;
    property ServerTransferAntarCabangKirimClient:
        TServerTransferAntarCabangKirimClient read
        GetServerTransferAntarCabangKirimClient write
        FServerTransferAntarCabangKirimClient;
    property ServerTransferAntarCabangTerimaClient:
        TServerTransferAntarCabangTerimaClient read
        GetServerTransferAntarCabangTerimaClient write
        FServerTransferAntarCabangTerimaClient;
end;

var
  ClientDataModule: TClientDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

constructor TClientDataModule.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := False;
end;

procedure TClientDataModule.DataModuleCreate(Sender: TObject);
begin
  FreeAndNil(FCabang);

  ClientDataModule.DSRestConnection.PreserveSessionID := False;
end;

destructor TClientDataModule.Destroy;
begin
  Cabang.Free;
  SettingApp.Free;

  ServerUOMClient.Free;
  ServerSupplierClient.Free;
  ServerBarangClient.Free;
  ServerGroupBarangClient.Free;
  ServerPenerimaanBarangClient.Free;
  ServerCabangClient.Free;
  ServerLogAppObjectClient.Free;
  ServerUtilsClient.Free;
  ServerReturSupplierClient.Free;
  ServerLaporanClient.Free;
  ServerPenjualanClient.Free;
  ServerGudangClient.Free;
  ServerAccountClient.Free;
  ServerPenerimaanKasClient.Free;
  ServerSettingAppClient.Free;
  ServerTransferAntarCabangKirimClient.Free;

  inherited;
end;

function TClientDataModule.GetCabang: tcabang;
begin
  if FCabang = nil then
  begin
    FCabang := TCabang.Create;
  end;

  Result := FCabang;
end;

function TClientDataModule.GetServerUOMClient: TServerUOMClient;
begin
  if FServerUOMClient <> nil then
    FreeAndNil(FServerUOMClient);

  FServerUOMClient:= TServerUOMClient.Create(DSRestConnection, FInstanceOwner);
  Result := FServerUOMClient;
end;
function TClientDataModule.GetServerSupplierClient: TServerSupplierClient;
begin
  if FServerSupplierClient <> nil then
    FreeAndNil(FServerSupplierClient);

  FServerSupplierClient:= TServerSupplierClient.Create(DSRestConnection, FInstanceOwner);
  Result := FServerSupplierClient;
end;
function TClientDataModule.GetServerBarangClient: TServerBarangClient;
begin
  if FServerBarangClient <> nil then
    FreeAndNil(FServerBarangClient);

  FServerBarangClient:= TServerBarangClient.Create(DSRestConnection, FInstanceOwner);
  Result := FServerBarangClient;
end;
function TClientDataModule.GetServerGroupBarangClient: TServerGroupBarangClient;
begin
  if FServerGroupBarangClient <> nil then
    FreeAndNil(FServerGroupBarangClient);

  FServerGroupBarangClient:= TServerGroupBarangClient.Create(DSRestConnection, FInstanceOwner);
  Result := FServerGroupBarangClient;
end;
function TClientDataModule.GetServerPenerimaanBarangClient: TServerPenerimaanBarangClient;
begin
  if FServerPenerimaanBarangClient <> nil then
    FreeAndNil(FServerPenerimaanBarangClient);

  FServerPenerimaanBarangClient:= TServerPenerimaanBarangClient.Create(DSRestConnection, FInstanceOwner);
  Result := FServerPenerimaanBarangClient;
end;
function TClientDataModule.GetServerCabangClient: TServerCabangClient;
begin
  if FServerCabangClient <> nil then
    FreeAndNil(FServerCabangClient);

  FServerCabangClient:= TServerCabangClient.Create(DSRestConnection, FInstanceOwner);
  Result := FServerCabangClient;
end;
function TClientDataModule.GetServerLogAppObjectClient: TServerLogAppObjectClient;
begin
  if FServerLogAppObjectClient <> nil then
    FreeAndNil(FServerLogAppObjectClient);

  FServerLogAppObjectClient:= TServerLogAppObjectClient.Create(DSRestConnection, FInstanceOwner);
  Result := FServerLogAppObjectClient;
end;
function TClientDataModule.GetServerUtilsClient: TServerUtilsClient;
begin
  if FServerUtilsClient <> nil then
    FreeAndNil(FServerUtilsClient);

  FServerUtilsClient:= TServerUtilsClient.Create(DSRestConnection, FInstanceOwner);
  Result := FServerUtilsClient;
end;

function TClientDataModule.GetServerReturSupplierClient:
    TServerReturSupplierClient;
begin
  if FServerReturSupplierClient <> nil then
    FreeAndNil(FServerReturSupplierClient);

  FServerReturSupplierClient:= TServerReturSupplierClient.Create(DSRestConnection, FInstanceOwner);
  Result := FServerReturSupplierClient;
end;

function TClientDataModule.GetServerGudangClient: TServerGudangClient;
begin
  if FServerGudangClient <> nil then
    FreeAndNil(FServerGudangClient);

  FServerGudangClient:= TServerGudangClient.Create(DSRestConnection, FInstanceOwner);
  Result := FServerGudangClient;
end;

function TClientDataModule.GetServerLaporanClient: TServerLaporanClient;
begin
  if FServerLaporanClient <> nil then
    FreeAndNil(FServerLaporanClient);

  FServerLaporanClient := TServerLaporanClient.Create(DSRestConnection, InstanceOwner);
  Result := FServerLaporanClient;
end;

function TClientDataModule.GetServerCustomerInvoiceClient:
    TServerCustomerInvoiceClient;
begin
  if FServerCustomerInvoiceClient <> nil then
    FreeAndNil(FServerCustomerInvoiceClient);

  FServerCustomerInvoiceClient:= TServerCustomerInvoiceClient.Create(DSRestConnection, FInstanceOwner);
  Result := FServerCustomerInvoiceClient;
end;

function TClientDataModule.GetServerPenjualanClient: TServerPenjualanClient;
begin
  if FServerPenjualanClient <> nil then
    FreeAndNil(FServerPenjualanClient);

  FServerPenjualanClient := TServerPenjualanClient.Create(DSRestConnection, FInstanceOwner);
  Result := FServerPenjualanClient;
end;

function TClientDataModule.GetServerAccountClient: TServerAccountClient;
begin
  if FServerAccountClient <> nil then
    FreeAndNil(FServerAccountClient);

  FServerAccountClient:= TServerAccountClient.Create(DSRestConnection, FInstanceOwner);
  Result := FServerAccountClient;
end;

function TClientDataModule.GetServerRekBankClient: TServerRekBankClient;
begin
  if FServerRekBankClient <> nil then
    FreeAndNil(FServerRekBankClient);

  FServerRekBankClient:= TServerRekBankClient.Create(DSRestConnection, FInstanceOwner);
  Result := FServerRekBankClient;
end;

function TClientDataModule.GetServerPenerimaanKasClient:
    TServerPenerimaanKasClient;
begin
  if FServerPenerimaanKasClient <> nil then
    FreeAndNil(FServerPenerimaanKasClient);

  FServerPenerimaanKasClient:= TServerPenerimaanKasClient.Create(DSRestConnection, FInstanceOwner);
  Result := FServerPenerimaanKasClient;
end;

function TClientDataModule.GetServerSettingAppClient: TServerSettingAppClient;
begin
  if FServerSettingAppClient <> nil then
    FreeAndNil(FServerSettingAppClient);

  FServerSettingAppClient:= TServerSettingAppClient.Create(DSRestConnection, FInstanceOwner);
  Result := FServerSettingAppClient;
end;

function TClientDataModule.GetServerTAGRequestClient: TServerTAGRequestClient;
begin
  if FServerTAGRequestClient <> nil then
    FreeAndNil(FServerTAGRequestClient);

  FServerTAGRequestClient := TServerTAGRequestClient.Create(DSRestConnection, FInstanceOwner);
  Result := FServerTAGRequestClient;
end;

function TClientDataModule.GetServerTransferAntarGudang:
    TServerTransferAntarGudangClient;
begin
  if FServerTransferAntarGudang <> nil then
    FreeAndNil(FServerTransferAntarGudang);

  FServerTransferAntarGudang:= TServerTransferAntarGudangClient.Create(DSRestConnection, FInstanceOwner);
  Result := FServerTransferAntarGudang;
end;

function TClientDataModule.GetSettingApp: TSettingApp;
begin
  if FSettingApp = nil then
    FSettingApp := TSettingApp.Create;

  Result := FSettingApp;
end;

function TClientDataModule.GetServerTransferAntarCabangKirimClient:
    TServerTransferAntarCabangKirimClient;
begin
  if FServerTransferAntarCabangKirimClient <> nil then
    FreeAndNil(FServerTransferAntarCabangKirimClient);

  FServerTransferAntarCabangKirimClient := TServerTransferAntarCabangKirimClient.Create(ClientDataModule.DSRestConnection, FInstanceOwner);
  Result := FServerTransferAntarCabangKirimClient;
end;

function TClientDataModule.GetServerTransferAntarCabangTerimaClient:
    TServerTransferAntarCabangTerimaClient;
begin
  if FServerTransferAntarCabangTerimaClient <> nil then
    FreeAndNil(FServerTransferAntarCabangTerimaClient);

  FServerTransferAntarCabangTerimaClient := TServerTransferAntarCabangTerimaClient.Create(ClientDataModule.DSRestConnection, FInstanceOwner);
  Result := FServerTransferAntarCabangTerimaClient;
end;

end.
