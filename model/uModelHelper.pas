unit uModelHelper;

interface

uses
  uTransferAntarCabang, ClientModule;

type
  TTransferAntarCabangTerimaHelper = class helper for TTransferAntarCabangTerima
  public
    procedure LoadTACKirim;
  end;

implementation

procedure TTransferAntarCabangTerimaHelper.LoadTACKirim;
begin
  if Self.TransferAntarCabangKirim = nil then
    Exit;

  if Self.TransferAntarCabangKirim.ID = '' then
    Exit;

  Self.TransferAntarCabangKirim := ClientDataModule.ServerTransferAntarCabangKirimClient.Retrieve(Self.TransferAntarCabangKirim.ID);
end;

end.
