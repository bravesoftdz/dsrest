unit uSetoranModal;

interface

uses
  uAccount, uModel, uSupplier, uAR;

type
  TSetoranModal = class(TAppObjectWithDate)
  private
    FCabang: TCabang;
    FKeterangan: string;
    FNoBukti: string;
    FNominal: Double;
    FTanggal: TDatetime;
  public
  published
    property Cabang: TCabang read FCabang write FCabang;
    property Keterangan: string read FKeterangan write FKeterangan;
    property NoBukti: string read FNoBukti write FNoBukti;
    property Nominal: Double read FNominal write FNominal;
    property Tanggal: TDatetime read FTanggal write FTanggal;
  end;

implementation

initialization
  TSetoranModal.PokeRTTI;

end.
