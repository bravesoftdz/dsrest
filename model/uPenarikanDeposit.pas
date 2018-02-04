unit uPenarikanDeposit;

interface

uses
  uAccount, uModel, uSupplier, uAR;

type
  TPenarikanDeposit = class(TAppObject)
  private
    FAP: TAP;
    FKeterangan: string;
    FNoBukti: string;
    FNominal: Double;
    FSantri: TSupplier;
    FTanggal: TDatetime;
    function GetAP: TAP;
  public
  published
    property AP: TAP read GetAP write FAP;
    property Keterangan: string read FKeterangan write FKeterangan;
    property NoBukti: string read FNoBukti write FNoBukti;
    property Nominal: Double read FNominal write FNominal;
    property Santri: TSupplier read FSantri write FSantri;
    property Tanggal: TDatetime read FTanggal write FTanggal;
  end;

implementation

function TPenarikanDeposit.GetAP: TAP;
begin
  if FAP = nil then
    FAP := TAP.Create;

  FAP.Supplier          := TSupplier.CreateID(Santri.ID);
  FAP.IDTransaksi       := Self.ID;
  FAP.Nominal           := -1 * Self.Nominal;
  FAP.NoBukti           := Self.NoBukti;
  FAP.NoBuktiTransaksi  := Self.NoBukti;
  FAP.Transaksi         := Self.ClassName;
  FAP.TglBukti          := Self.Tanggal;

  Result := FAP;

end;

initialization
  TPenarikanDeposit.PokeRTTI;

end.
