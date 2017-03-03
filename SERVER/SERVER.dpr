program SERVER;
{$APPTYPE GUI}

{$R *.dres}

uses
  Forms,
  WebReq,
  IdHTTPWebBrokerBridge,
  ufrmMain in 'ufrmMain.pas' {frmServer},
  ServerMethodsUnit in 'ServerMethodsUnit.pas',
  WebModule in 'WebModule.pas' {WebModule2: TWebModule},
  uModel in '..\uModel.pas',
  uDBUtils in '..\uDBUtils.pas',
  uAppUtils in '..\uAppUtils.pas',
  uInterface in 'uInterface.pas',
  uBarangUtils in '..\uBarangUtils.pas',
  uPenjualan in '..\model\uPenjualan.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TfrmServer, frmServer);
  Application.Run;
end.
