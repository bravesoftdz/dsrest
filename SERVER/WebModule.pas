unit WebModule;

interface

uses
  SysUtils, Classes, HTTPApp, DSHTTPCommon, DSHTTPWebBroker, DSServer, WebFileDispatcher, HTTPProd,
  DSProxyJavaScript, DSAuth, DSClientMetadata, DSCommonServer, StdCtrls,
  IPPeerServer, Datasnap.DSMetadata, Datasnap.DSServerMetadata, Datasnap.DSHTTP, uDSUtils;

type
  TWebModule2 = class(TWebModule)
    DSServer1: TDSServer;
    DSHTTPWebDispatcher1: TDSHTTPWebDispatcher;
    ServerFunctionInvoker: TPageProducer;
    ReverseString: TPageProducer;
    WebFileDispatcher1: TWebFileDispatcher;
    DSProxyGenerator1: TDSProxyGenerator;
    DSServerMetaDataProvider1: TDSServerMetaDataProvider;
    DSServerClass1: TDSServerClass;
    procedure dsrvrclsBarangGetClass(DSServerClass: TDSServerClass; var
        PersistentClass: TPersistentClass);
    procedure dsrvrclsCabangGetClass(DSServerClass: TDSServerClass; var
        PersistentClass: TPersistentClass);
    procedure dsrvrclsClosingInventoryGetClass(DSServerClass: TDSServerClass; var
        PersistentClass: TPersistentClass);
    procedure dsrvrclsCustomerInvoiceGetClass(DSServerClass: TDSServerClass; var
        PersistentClass: TPersistentClass);
    procedure dsrvrclsGroupBarangGetClass(DSServerClass: TDSServerClass; var
        PersistentClass: TPersistentClass);
    procedure dsrvrclsGudangGetClass(DSServerClass: TDSServerClass; var
        PersistentClass: TPersistentClass);
    procedure dsrvrclsLogAppObjectGetClass(DSServerClass: TDSServerClass; var
        PersistentClass: TPersistentClass);
    procedure dsrvrclsPenerimaanBarangGetClass(DSServerClass: TDSServerClass; var
        PersistentClass: TPersistentClass);
    procedure dsrvrclsServerUtilsGetClass(DSServerClass: TDSServerClass; var
        PersistentClass: TPersistentClass);
    procedure dsrvrclsSupplierGetClass(DSServerClass: TDSServerClass; var
        PersistentClass: TPersistentClass);
    procedure dsrvrclsUOMGetClass(DSServerClass: TDSServerClass; var
        PersistentClass: TPersistentClass);
    procedure DSServer1Connect(DSConnectEventObject: TDSConnectEventObject);
    procedure DSServer1Disconnect(DSConnectEventObject: TDSConnectEventObject);
    procedure DSServer1Error(DSErrorEventObject: TDSErrorEventObject);
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure ServerFunctionInvokerHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: string; TagParams: TStrings; var ReplaceText: string);
    procedure WebFileDispatcher1BeforeDispatch(Sender: TObject;
      const AFileName: string; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure WebModuleBeforeDispatch(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModuleDefaultAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModuleCreate(Sender: TObject);
    procedure dsrvrclsLaporanGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure dsrvrclsPembayaranSupplierGetClass(DSServerClass: TDSServerClass; var
        PersistentClass: TPersistentClass);
    procedure dsrvrclsPenjualanGetClass(DSServerClass: TDSServerClass; var
        PersistentClass: TPersistentClass);
    procedure dsrvrclsReturSupplierGetClass(DSServerClass: TDSServerClass; var
        PersistentClass: TPersistentClass);
    procedure dsrvrclsStockSekarangGetClass(DSServerClass: TDSServerClass; var
        PersistentClass: TPersistentClass);
  private
    FIP: string;
    { Private declarations }
    FServerFunctionInvokerAction: TWebActionItem;
    function AllowServerFunctionInvoker: Boolean;
    procedure SetIP(const Value: string);
  protected
    property IP: string read FIP write SetIP;
  public
    procedure RegisterServerClasses;
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModule2;
  WebModule2 : TWebModule2;
  mmoLogs : TMemo;

implementation

uses ServerMethodsUnit, WebReq;

{$R *.dfm}

procedure TWebModule2.DSServerClass1GetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethodsUnit.TServerMethods1;
end;

procedure TWebModule2.ServerFunctionInvokerHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: string; TagParams: TStrings; var ReplaceText: string);
begin
  if SameText(TagString, 'urlpath') then
    ReplaceText := string(Request.InternalScriptName)
  else if SameText(TagString, 'port') then
    ReplaceText := IntToStr(Request.ServerPort)
  else if SameText(TagString, 'host') then
    ReplaceText := string(Request.Host)
  else if SameText(TagString, 'classname') then
    ReplaceText := ServerMethodsUnit.TServerMethods1.ClassName
  else if SameText(TagString, 'loginrequired') then
    if DSHTTPWebDispatcher1.AuthenticationManager <> nil then
      ReplaceText := 'true'
    else
      ReplaceText := 'false'
  else if SameText(TagString, 'serverfunctionsjs') then
    ReplaceText := string(Request.InternalScriptName) + '/js/serverfunctions.js'
  else if SameText(TagString, 'servertime') then
    ReplaceText := DateTimeToStr(Now)
  else if  SameText(TagString, 'serverfunctioninvoker') then
    if AllowServerFunctionInvoker then
      ReplaceText :=
      '<div><a href="' + string(Request.InternalScriptName) +
      '/ServerFunctionInvoker" target="_blank">Server Functions</a></div>'
    else
      ReplaceText := '';
end;

procedure TWebModule2.WebFileDispatcher1BeforeDispatch(Sender: TObject;
  const AFileName: string; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  D1, D2: TDateTime;
begin
  Handled := False;
  if SameFileName(ExtractFileName(AFileName), 'serverfunctions.js') then
    if FileAge(AFileName, D1) and FileAge(WebApplicationFileName, D2) and (D1 < D2) then
    begin
      DSProxyGenerator1.TargetDirectory := ExtractFilePath(AFileName);
      DSProxyGenerator1.TargetUnitName := ExtractFileName(AFileName);
      DSProxyGenerator1.Write;
    end;

//  IP := 'Address : ' + Request.RemoteAddr + 'Host : ' + Request.RemoteAddr;
end;

procedure TWebModule2.WebModuleDefaultAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  if (Request.InternalPathInfo = '') or (Request.InternalPathInfo = '/')then
    Response.Content := ReverseString.Content
  else
    Response.SendRedirect(Request.InternalScriptName + '/');
end;

procedure TWebModule2.WebModuleBeforeDispatch(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  if FServerFunctionInvokerAction <> nil then
    FServerFunctionInvokerAction.Enabled := AllowServerFunctionInvoker;
end;

function TWebModule2.AllowServerFunctionInvoker: Boolean;
begin
  Result := (Request.RemoteAddr = '127.0.0.1') or
    (Request.RemoteAddr = '0:0:0:0:0:0:0:1') or (Request.RemoteAddr = '::1');
end;

procedure TWebModule2.dsrvrclsBarangGetClass(DSServerClass: TDSServerClass; var
    PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethodsUnit.TServerBarang;
end;

procedure TWebModule2.dsrvrclsCabangGetClass(DSServerClass: TDSServerClass; var
    PersistentClass: TPersistentClass);
begin
  PersistentClass := TServerCabang;
end;

procedure TWebModule2.dsrvrclsClosingInventoryGetClass(DSServerClass:
    TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethodsUnit.TServerClosingInventory;
end;

procedure TWebModule2.dsrvrclsCustomerInvoiceGetClass(DSServerClass:
    TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethodsUnit.TServerCustomerInvoice;
end;

procedure TWebModule2.dsrvrclsGroupBarangGetClass(DSServerClass:
    TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethodsUnit.TServerGroupBarang;

end;

procedure TWebModule2.dsrvrclsGudangGetClass(DSServerClass: TDSServerClass; var
    PersistentClass: TPersistentClass);
begin
  PersistentClass := TServerGudang;
end;

procedure TWebModule2.dsrvrclsLaporanGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := TServerLaporan;
end;

procedure TWebModule2.dsrvrclsLogAppObjectGetClass(DSServerClass:
    TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := TServerLogAppObject;
end;

procedure TWebModule2.dsrvrclsPembayaranSupplierGetClass(DSServerClass:
    TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := TServerPembayaranSupplier;
end;

procedure TWebModule2.dsrvrclsPenerimaanBarangGetClass(DSServerClass:
    TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := TServerPenerimaanBarang;
end;

procedure TWebModule2.dsrvrclsPenjualanGetClass(DSServerClass: TDSServerClass;
    var PersistentClass: TPersistentClass);
begin
  PersistentClass := TServerPenjualan;
end;

procedure TWebModule2.dsrvrclsReturSupplierGetClass(DSServerClass:
    TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := TServerReturSupplier;
end;

procedure TWebModule2.dsrvrclsServerUtilsGetClass(DSServerClass:
    TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := TServerUtils;

end;

procedure TWebModule2.dsrvrclsStockSekarangGetClass(DSServerClass:
    TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethodsUnit.TServerStockSekarang;
end;

procedure TWebModule2.dsrvrclsSupplierGetClass(DSServerClass: TDSServerClass;
    var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethodsUnit.TServerSupplier;
end;

procedure TWebModule2.dsrvrclsUOMGetClass(DSServerClass: TDSServerClass; var
    PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethodsUnit.TServerUOM;
end;

procedure TWebModule2.DSServer1Connect(DSConnectEventObject:
    TDSConnectEventObject);
begin
//  if mmoLogs <> nil then
//    mmoLogs.Lines.Add('Ada koneksi dari : ' + IP);
end;

procedure TWebModule2.DSServer1Disconnect(DSConnectEventObject:
    TDSConnectEventObject);
begin
//  if mmoLogs <> nil then
//    mmoLogs.Lines.Add('Koneksi putus dari IP : ' + IP);
end;

procedure TWebModule2.DSServer1Error(DSErrorEventObject: TDSErrorEventObject);
begin
//  if mmoLogs <> nil then
//    mmoLogs.Lines.Add(DSErrorEventObject.Error.Message);
end;

procedure TWebModule2.RegisterServerClasses;
begin
  Assert(DSServer1.Started = false, 'Server Active.' + #13 + 'Can''t add class to Active Server.');
  TCustServerClass.Create(Self, DSServer1, TServerLaporan, DSServerClass1.LifeCycle);
  TCustServerClass.Create(Self, DSServer1, TServerBarang, DSServerClass1.LifeCycle);
  TCustServerClass.Create(Self, DSServer1, TServerCustomerInvoice, DSServerClass1.LifeCycle);
  TCustServerClass.Create(Self, DSServer1, TServerUOM, DSServerClass1.LifeCycle);
  TCustServerClass.Create(Self, DSServer1, TServerSupplier, DSServerClass1.LifeCycle);
  TCustServerClass.Create(Self, DSServer1, TServerGroupBarang, DSServerClass1.LifeCycle);
  TCustServerClass.Create(Self, DSServer1, TServerPenerimaanBarang, DSServerClass1.LifeCycle);
  TCustServerClass.Create(Self, DSServer1, TServerCabang, DSServerClass1.LifeCycle);
  TCustServerClass.Create(Self, DSServer1, TServerLogAppObject, DSServerClass1.LifeCycle);
  TCustServerClass.Create(Self, DSServer1, TServerUtils, DSServerClass1.LifeCycle);
  TCustServerClass.Create(Self, DSServer1, TServerStockSekarang, DSServerClass1.LifeCycle);
  TCustServerClass.Create(Self, DSServer1, TServerReturSupplier, DSServerClass1.LifeCycle);
  TCustServerClass.Create(Self, DSServer1, TServerClosingInventory, DSServerClass1.LifeCycle);
  TCustServerClass.Create(Self, DSServer1, TServerPembayaranSupplier, DSServerClass1.LifeCycle);
  TCustServerClass.Create(Self, DSServer1, TServerGudang, DSServerClass1.LifeCycle);
  TCustServerClass.Create(Self, DSServer1, TServerPenjualan, DSServerClass1.LifeCycle);
  TCustServerClass.Create(Self, DSServer1, TServerAR, DSServerClass1.LifeCycle);
  TCustServerClass.Create(Self, DSServer1, TServerAccount, DSServerClass1.LifeCycle);
  TCustServerClass.Create(Self, DSServer1, TServerRekBank, DSServerClass1.LifeCycle);
  TCustServerClass.Create(Self, DSServer1, TServerPenerimaanKas, DSServerClass1.LifeCycle);
  TCustServerClass.Create(Self, DSServer1, TServerSettingApp, DSServerClass1.LifeCycle);
  TCustServerClass.Create(Self, DSServer1, TServerTransferAntarGudang, DSServerClass1.LifeCycle);
  TCustServerClass.Create(Self, DSServer1, TServerTAGRequest, DSServerClass1.LifeCycle);
  TCustServerClass.Create(Self, DSServer1, TServerTransferAntarCabangKirim, DSServerClass1.LifeCycle);
end;

procedure TWebModule2.SetIP(const Value: string);
begin
  FIP := Value;
end;

procedure TWebModule2.WebModuleCreate(Sender: TObject);
begin
  FServerFunctionInvokerAction := ActionByName('ServerFunctionInvokerAction');
  RegisterServerClasses;
end;

initialization
finalization
  WebReq.FreeWebModules;

end.

