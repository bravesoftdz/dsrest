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
  uRekBank in '..\model\uRekBank.pas',
  uAccount in '..\model\uAccount.pas',
  uTransferAntarGudang in '..\model\uTransferAntarGudang.pas',
  uSettingApp in '..\model\uSettingApp.pas',
  uTAGRequests in '..\model\uTAGRequests.pas',
  uMukafaah in '..\model\uMukafaah.pas',
  uPengurus in '..\model\uPengurus.pas',
  uTransferAntarCabang in '..\model\uTransferAntarCabang.pas',
  uPengeluaranKas in '..\model\uPengeluaranKas.pas',
  uSettingAppServer in '..\model\uSettingAppServer.pas',
  uJurnal in '..\model\uJurnal.pas',
  uSupplier in '..\model\uSupplier.pas',
  uReturSupplier in '..\model\uReturSupplier.pas',
  uPenerimaanBarang in '..\model\uPenerimaanBarang.pas',
  ufrmSettingAppServer in 'ufrmSettingAppServer.pas' {frmSettingAppServer},
  uSettlementARAP in '..\model\uSettlementARAP.pas',
  uUser in '..\model\uUser.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TfrmServer, frmServer);
  Application.CreateForm(TWebModule2, WebModule2);
  Application.CreateForm(TfrmSettingAppServer, frmSettingAppServer);
  Application.Run;
end.
