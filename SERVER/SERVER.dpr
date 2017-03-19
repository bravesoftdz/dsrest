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
  uPenjualan in '..\model\uPenjualan.pas',
  uCustomerInvoice in '..\model\uCustomerInvoice.pas',
  uAR in '..\model\uAR.pas',
  uDSUtils in 'lib\uDSUtils.pas',
  uPenerimaanKas in '..\model\uPenerimaanKas.pas',
  uRekBank in '..\model\uRekBank.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TfrmServer, frmServer);
  Application.CreateForm(TWebModule2, WebModule2);
  Application.Run;
end.
