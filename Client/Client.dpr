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
  ufrmPilihGrid in 'form\ufrmPilihGrid.pas' {frmPilihGrid};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TClientDataModule, ClientDataModule);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
