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
  ClientClassesUnit2 in 'ClientClassesUnit2.pas',
  ufrmLapMutasiBarangPerTransaksi in 'form\ufrmLapMutasiBarangPerTransaksi.pas' {frmLapMutasiBarangPerTransaksi},
  uBarangUtils in '..\uBarangUtils.pas',
  ufrmPenerimaanBarang in 'form\ufrmPenerimaanBarang.pas' {frmPenerimaanBarang},
  ufrmClosingInventory in 'form\ufrmClosingInventory.pas' {frmClosingInventory},
  ufrmLapStockSekarang in 'form\ufrmLapStockSekarang.pas' {frmLapStockSekarang},
  ufrmPembayaranSupplier in 'form\ufrmPembayaranSupplier.pas' {frmPembayaranSupplier},
  uReport in '..\uReport.pas',
  ufrmGudang in 'form\ufrmGudang.pas' {frmGudang},
  ufrmLapKartuStock in 'form\ufrmLapKartuStock.pas' {frmLapKartuStock},
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
  ufrmPenerimaanKas in 'form\ufrmPenerimaanKas.pas' {frmPenerimaanKas},
  ufrmAccount in 'form\ufrmAccount.pas' {frmAccount},
  uAccount in '..\model\uAccount.pas',
  ufrmRekBank in 'form\ufrmRekBank.pas' {frmRekBank},
  ufrmDefaultLaporan in 'form\ufrmDefaultLaporan.pas' {frmDefaultLaporan},
  ufrmLaporanAR in 'form\ufrmLaporanAR.pas' {frmLaporanAR},
  ufrmSettingAplikasi in 'form\ufrmSettingAplikasi.pas' {frmSettingAplikasi},
  uSettingApp in '..\model\uSettingApp.pas',
  uInterface in 'lib\uInterface.pas',
  uTransferAntarGudang in '..\model\uTransferAntarGudang.pas',
  ufrmTransferAntarGudang in 'form\ufrmTransferAntarGudang.pas' {frmTransferAntarGudang},
  uTAGRequests in '..\model\uTAGRequests.pas',
  ufrmTAGRequest in 'form\ufrmTAGRequest.pas' {frmTAGRequest};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TClientDataModule, ClientDataModule);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
