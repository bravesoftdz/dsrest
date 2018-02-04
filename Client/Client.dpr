program Client;

uses
  Forms,
  ufrmMain in 'ufrmMain.pas' {frmMain},
  ufrmReturSupplier in 'form\ufrmReturSupplier.pas' {frmReturSupplier},
  uModel in '..\uModel.pas',
  ufrmSupplier in 'form\ufrmSupplier.pas' {frmSupplier},
  ufrmKoneksi in 'form\ufrmKoneksi.pas' {frmKoneksi},
  uDBUtils in '..\uDBUtils.pas',
  uAppUtils in '..\uAppUtils.pas',
  ufrmBarang in 'form\ufrmBarang.pas' {frmBarang},
  ufrmPilihCabang in 'form\ufrmPilihCabang.pas' {frmPilihCabang},
  ClientModule in 'ClientModule.pas' {ClientDataModule: TDataModule},
  ufrmLapMutasiBarangPerTransaksi in 'form\ufrmLapMutasiBarangPerTransaksi.pas' {frmLapMutasiBarangPerTransaksi},
  uBarangUtils in '..\uBarangUtils.pas',
  ufrmPenerimaanBarang in 'form\ufrmPenerimaanBarang.pas' {frmPenerimaanBarang},
  ufrmClosingInventory in 'form\ufrmClosingInventory.pas' {frmClosingInventory},
  ufrmLapStockSekarang in 'form\ufrmLapStockSekarang.pas' {frmLapStockSekarang},
  ufrmPembayaranSupplier in 'form\ufrmPembayaranSupplier.pas' {frmPembayaranSupplier},
  uReport in '..\uReport.pas',
  ufrmGudang in 'form\ufrmGudang.pas' {frmGudang},
  ufrmDefault in 'form\ufrmDefault.pas' {frmDefault},
  ufrmPilihGrid in 'form\ufrmPilihGrid.pas' {frmPilihGrid},
  ufrmPenjualan in 'form\ufrmPenjualan.pas' {frmPenjualan},
  uPenjualan in '..\model\uPenjualan.pas',
  ufrmPenjualanPOS in 'form\ufrmPenjualanPOS.pas' {frmPenjualanPOS},
  ufrmLookUpTransaksi in 'form\ufrmLookUpTransaksi.pas' {frmLookUpTransaksi},
  ufrmPembayaranPenjualan in 'form\ufrmPembayaranPenjualan.pas' {frmPembayaranPenjualan},
  uPembayaranPenjualan in '..\model\uPembayaranPenjualan.pas',
  uAR in '..\model\uAR.pas',
  uCustomerInvoice in '..\model\uCustomerInvoice.pas',
  ufrmCustomerInvoice in 'form\ufrmCustomerInvoice.pas' {frmCustomerInvoice},
  uRekBank in '..\model\uRekBank.pas',
  uPengeluaranKas in '..\model\uPengeluaranKas.pas',
  uPenerimaanKas in '..\model\uPenerimaanKas.pas',
  ufrmPengeluaranKas in 'form\ufrmPengeluaranKas.pas' {frmPengeluaranKas},
  ufrmAccount in 'form\ufrmAccount.pas' {frmAccount},
  uAccount in '..\model\uAccount.pas',
  ufrmRekBank in 'form\ufrmRekBank.pas' {frmRekBank},
  ufrmSettingAplikasi in 'form\ufrmSettingAplikasi.pas' {frmSettingAplikasi},
  uSettingApp in '..\model\uSettingApp.pas',
  uInterface in 'lib\uInterface.pas',
  uTransferAntarGudang in '..\model\uTransferAntarGudang.pas',
  ufrmTransferAntarGudang in 'form\ufrmTransferAntarGudang.pas' {frmTransferAntarGudang},
  uTAGRequests in '..\model\uTAGRequests.pas',
  ufrmTAGRequest in 'form\ufrmTAGRequest.pas' {frmTAGRequest},
  uDSRestLib in '..\uDSRestLib.pas',
  uTAGKirim in '..\model\uTAGKirim.pas',
  uTransferAntarCabang in '..\model\uTransferAntarCabang.pas',
  ufrmTACKirim in 'form\ufrmTACKirim.pas' {frmTACKirim},
  ufrmTACTerima in 'form\ufrmTACTerima.pas' {frmTACTerima},
  uModelHelper in '..\model\uModelHelper.pas',
  uDMReport in '..\uDMReport.pas' {DMReport},
  ufrmPenerimaanKas in 'form\ufrmPenerimaanKas.pas' {frmPenerimaanKas},
  ufrmPembayaranPOS in 'form\ufrmPembayaranPOS.pas' {frmPembayaranPOS},
  uJurnal in '..\model\uJurnal.pas',
  ufrmJurnal in 'form\ufrmJurnal.pas' {frmJurnal},
  uSupplier in '..\model\uSupplier.pas',
  uPenerimaanBarang in '..\model\uPenerimaanBarang.pas',
  uReturSupplier in '..\model\uReturSupplier.pas',
  ufrmDefaultLaporan in 'form\ufrmDefaultLaporan.pas' {frmDefaultLaporan},
  ufrmLapPenerimaanBarang in 'form\ufrmLapPenerimaanBarang.pas' {frmLapPenerimaanBarang},
  ufrmLapKartuStock in 'form\ufrmLapKartuStock.pas' {frmLapKartuStock},
  uSelfFastReportFunction in 'lib\uSelfFastReportFunction.pas',
  ufrmKartuAR in 'form\ufrmKartuAR.pas' {frmKartuAR},
  ufrmKartuAP in 'form\ufrmKartuAP.pas' {frmKartuAP},
  ufrmLaporanAP in 'form\ufrmLaporanAP.pas' {frmLaporanAP},
  ufrmLaporanAR in 'form\ufrmLaporanAR.pas' {frmLaporanAR},
  ufrmLaporanReturSupplier in 'form\ufrmLaporanReturSupplier.pas' {frmLaporanReturSupplier},
  uSettlementARAP in '..\model\uSettlementARAP.pas',
  ufrmSettlementARAP in 'form\ufrmSettlementARAP.pas' {frmSettlementARAP},
  uUser in '..\model\uUser.pas',
  ufrmGenerateJurnal in 'form\ufrmGenerateJurnal.pas' {frmGenerateJurnal},
  ufrmLaporanNeracaSaldo in 'form\ufrmLaporanNeracaSaldo.pas' {frmLaporanNeracaSaldo},
  ClientClassesUnit in 'ClientClassesUnit.pas',
  ufrmBukuBesar in 'form\ufrmBukuBesar.pas' {frmBukuBesar},
  ufrmLaporanPenjualan in 'form\ufrmLaporanPenjualan.pas' {frmLaporanPenjualan},
  uPenarikanDeposit in '..\model\uPenarikanDeposit.pas',
  ufrmPenarikanDeposit in 'form\ufrmPenarikanDeposit.pas' {frmPenarikanDeposit};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TClientDataModule, ClientDataModule);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDMReport, DMReport);
  Application.Run;
end.
