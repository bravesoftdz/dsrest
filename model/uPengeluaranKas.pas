unit uPengeluaranKas;

interface

uses
  uModel, uRekBank;

type
  TPengeluaranKas = class(TAppObject)
  private
    FRekBank: TRekBank;
    FJenisTransaksi: string;
    FKeterangan: string;
    FNoBG: string;
    FNoBukti: string;
    FPenerima: TSupplier;
    FTglBukti: TDatetime;
  published
    property RekBank: TRekBank read FRekBank write FRekBank;
    property JenisTransaksi: string read FJenisTransaksi write FJenisTransaksi;
    property Keterangan: string read FKeterangan write FKeterangan;
    property NoBG: string read FNoBG write FNoBG;
    property NoBukti: string read FNoBukti write FNoBukti;
    property Penerima: TSupplier read FPenerima write FPenerima;
    property TglBukti: TDatetime read FTglBukti write FTglBukti;
  end;

implementation

end.
