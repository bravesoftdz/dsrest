program Client;

uses
  Forms,
  ufrmMain in 'ufrmMain.pas' {frmMain},
  ufrmDefault in 'form\ufrmDefault.pas' {frmDefault},
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
  ufrmClosingInventory in 'form\ufrmClosingInventory.pas' {frmClosingInventory};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TClientDataModule, ClientDataModule);
  Application.Run;
end.
