unit uPenerimaanKas;

interface

uses
  uModel, uRekBank, uAR, System.Generics.Collections;

type
  TPenerimaanKas = class;
  TPenerimaanKasAR = class;
//  TPenerimaanKasAP = class;

  TPenerimaanKasAR = class(TAppObjectItem)
  private
    FAR: TAR;
    FKeterangan: Integer;
    FNominal: Double;
    FPenerimaanKas: TPenerimaanKas;
  public
    function GetHeaderField: string; override;
    procedure SetHeaderProperty(AHeaderProperty : TAppObject); override;
  published
    property AR: TAR read FAR write FAR;
    property Keterangan: Integer read FKeterangan write FKeterangan;
    property Nominal: Double read FNominal write FNominal;
    property PenerimaanKas: TPenerimaanKas read FPenerimaanKas write FPenerimaanKas;
  end;

  TPenerimaanKas = class(TAPPobject)
  private
    FCabang: TCabang;
    FJenisTransaksi: string;
    FKeterangan: string;
    FNoBukti: string;
    FNominal: Double;
    FPembeli: TSupplier;
    FPenerimaanKasARItems: TObjectlist<TPenerimaanKasAR>;
    FRekBank: TRekBank;
    FTglBukti: TDatetime;
    function GetPenerimaanKasARItems: TObjectlist<TPenerimaanKasAR>;
  published
    property Cabang: TCabang read FCabang write FCabang;
    property JenisTransaksi: string read FJenisTransaksi write FJenisTransaksi;
    property Keterangan: string read FKeterangan write FKeterangan;
    property NoBukti: string read FNoBukti write FNoBukti;
    property Nominal: Double read FNominal write FNominal;
    property Pembeli: TSupplier read FPembeli write FPembeli;
    property PenerimaanKasARItems: TObjectlist<TPenerimaanKasAR> read
        GetPenerimaanKasARItems write FPenerimaanKasARItems;
    property RekBank: TRekBank read FRekBank write FRekBank;
    property TglBukti: TDatetime read FTglBukti write FTglBukti;
  end;
implementation

function TPenerimaanKasAR.GetHeaderField: string;
begin
  Result := 'PenerimaanKasAR';
end;

procedure TPenerimaanKasAR.SetHeaderProperty(AHeaderProperty : TAppObject);
begin
  Self.PenerimaanKas := TPenerimaanKas(AHeaderProperty);
end;

function TPenerimaanKas.GetPenerimaanKasARItems: TObjectlist<TPenerimaanKasAR>;
begin
  Result := FPenerimaanKasARItems;
end;

end.
