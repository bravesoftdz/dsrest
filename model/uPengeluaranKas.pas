unit uPengeluaranKas;

interface

uses
  uModel, uRekBank, uAR, uAccount, System.Generics.Collections;

type
  TPengeluaranKasAP = class;
  TPengeluaranKasNonAP = class;

  TPengeluaranKas = class(TAppObject)
  private
    FJenisTransaksi: string;
    FKeterangan: string;
    FNoBG: string;
    FNoBukti: string;
    FPenerima: TSupplier;
    FPengeluaranKasAPs: TobjectList<TPengeluaranKasAP>;
    FPengeluaranKasNonAPs: TobjectList<TPengeluaranKasNonAP>;
    FRekBank: TRekBank;
    FTglBukti: TDatetime;
  published
    property JenisTransaksi: string read FJenisTransaksi write FJenisTransaksi;
    property Keterangan: string read FKeterangan write FKeterangan;
    property NoBG: string read FNoBG write FNoBG;
    property NoBukti: string read FNoBukti write FNoBukti;
    property Penerima: TSupplier read FPenerima write FPenerima;
    property PengeluaranKasAPs: TobjectList<TPengeluaranKasAP> read
        FPengeluaranKasAPs write FPengeluaranKasAPs;
    property PengeluaranKasNonAPs: TobjectList<TPengeluaranKasNonAP> read
        FPengeluaranKasNonAPs write FPengeluaranKasNonAPs;
    property RekBank: TRekBank read FRekBank write FRekBank;
    property TglBukti: TDatetime read FTglBukti write FTglBukti;
  end;

  TPengeluaranKasAP = class(TAppObjectItem)
  private
    FAP: TAP;
    FKeterangan: string;
    FNominal: Double;
  published
    property AP: TAP read FAP write FAP;
    property Keterangan: string read FKeterangan write FKeterangan;
    property Nominal: Double read FNominal write FNominal;
  end;

  TPengeluaranKasNonAP = class(TAppObjectItem)
  private
    FAccount: TAccount;
    FKeterangan: string;
    FNominal: Double;
  published
    property Account: TAccount read FAccount write FAccount;
    property Keterangan: string read FKeterangan write FKeterangan;
    property Nominal: Double read FNominal write FNominal;
  end;

implementation

end.
