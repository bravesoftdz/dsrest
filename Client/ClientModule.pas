unit ClientModule;

interface

uses
  System.SysUtils, System.Classes,  ClientClassesUnit2, IPPeerClient,
  Datasnap.DSClientRest;

type
  TClientDataModule = class(TDataModule)
    DSRestConnection: TDSRestConnection;
  private
    FInstanceOwner: Boolean;
    FServerMethods1Client: TServerMethods1Client;
    FServerUOMClient: TServerUOMClient;
    FServerSupplierClient: TServerSupplierClient;
    FServerBarangClient: TServerBarangClient;
    FServerGroupBarangClient: TServerGroupBarangClient;
    FServerPenerimaanBarangClient: TServerPenerimaanBarangClient;
    FServerCabangClient: TServerCabangClient;
    FServerLogAppObjectClient: TServerLogAppObjectClient;
    FServerUtilsClient: TServerUtilsClient;
    function GetServerMethods1Client: TServerMethods1Client;
    function GetServerUOMClient: TServerUOMClient;
    function GetServerSupplierClient: TServerSupplierClient;
    function GetServerBarangClient: TServerBarangClient;
    function GetServerGroupBarangClient: TServerGroupBarangClient;
    function GetServerPenerimaanBarangClient: TServerPenerimaanBarangClient;
    function GetServerCabangClient: TServerCabangClient;
    function GetServerLogAppObjectClient: TServerLogAppObjectClient;
    function GetServerUtilsClient: TServerUtilsClient;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property ServerMethods1Client: TServerMethods1Client read GetServerMethods1Client write FServerMethods1Client;
    property ServerUOMClient: TServerUOMClient read GetServerUOMClient write FServerUOMClient;
    property ServerSupplierClient: TServerSupplierClient read GetServerSupplierClient write FServerSupplierClient;
    property ServerBarangClient: TServerBarangClient read GetServerBarangClient write FServerBarangClient;
    property ServerGroupBarangClient: TServerGroupBarangClient read GetServerGroupBarangClient write FServerGroupBarangClient;
    property ServerPenerimaanBarangClient: TServerPenerimaanBarangClient read GetServerPenerimaanBarangClient write FServerPenerimaanBarangClient;
    property ServerCabangClient: TServerCabangClient read GetServerCabangClient write FServerCabangClient;
    property ServerLogAppObjectClient: TServerLogAppObjectClient read GetServerLogAppObjectClient write FServerLogAppObjectClient;
    property ServerUtilsClient: TServerUtilsClient read GetServerUtilsClient write FServerUtilsClient;

end;

var
  ClientDataModule: TClientDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

constructor TClientDataModule.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TClientDataModule.Destroy;
begin
  FServerMethods1Client.Free;
  FServerUOMClient.Free;
  FServerSupplierClient.Free;
  FServerBarangClient.Free;
  FServerGroupBarangClient.Free;
  FServerPenerimaanBarangClient.Free;
  FServerCabangClient.Free;
  FServerLogAppObjectClient.Free;
  FServerUtilsClient.Free;
  inherited;
end;

function TClientDataModule.GetServerMethods1Client: TServerMethods1Client;
begin
  if FServerMethods1Client = nil then
    FServerMethods1Client:= TServerMethods1Client.Create(DSRestConnection, FInstanceOwner);
  Result := FServerMethods1Client;
end;
function TClientDataModule.GetServerUOMClient: TServerUOMClient;
begin
  if FServerUOMClient = nil then
    FServerUOMClient:= TServerUOMClient.Create(DSRestConnection, FInstanceOwner);
  Result := FServerUOMClient;
end;
function TClientDataModule.GetServerSupplierClient: TServerSupplierClient;
begin
  if FServerSupplierClient = nil then
    FServerSupplierClient:= TServerSupplierClient.Create(DSRestConnection, FInstanceOwner);
  Result := FServerSupplierClient;
end;
function TClientDataModule.GetServerBarangClient: TServerBarangClient;
begin
  if FServerBarangClient = nil then
    FServerBarangClient:= TServerBarangClient.Create(DSRestConnection, FInstanceOwner);
  Result := FServerBarangClient;
end;
function TClientDataModule.GetServerGroupBarangClient: TServerGroupBarangClient;
begin
  if FServerGroupBarangClient = nil then
    FServerGroupBarangClient:= TServerGroupBarangClient.Create(DSRestConnection, FInstanceOwner);
  Result := FServerGroupBarangClient;
end;
function TClientDataModule.GetServerPenerimaanBarangClient: TServerPenerimaanBarangClient;
begin
  if FServerPenerimaanBarangClient = nil then
    FServerPenerimaanBarangClient:= TServerPenerimaanBarangClient.Create(DSRestConnection, FInstanceOwner);
  Result := FServerPenerimaanBarangClient;
end;
function TClientDataModule.GetServerCabangClient: TServerCabangClient;
begin
  if FServerCabangClient = nil then
    FServerCabangClient:= TServerCabangClient.Create(DSRestConnection, FInstanceOwner);
  Result := FServerCabangClient;
end;
function TClientDataModule.GetServerLogAppObjectClient: TServerLogAppObjectClient;
begin
  if FServerLogAppObjectClient = nil then
    FServerLogAppObjectClient:= TServerLogAppObjectClient.Create(DSRestConnection, FInstanceOwner);
  Result := FServerLogAppObjectClient;
end;
function TClientDataModule.GetServerUtilsClient: TServerUtilsClient;
begin
  if FServerUtilsClient = nil then
    FServerUtilsClient:= TServerUtilsClient.Create(DSRestConnection, FInstanceOwner);
  Result := FServerUtilsClient;
end;

end.
