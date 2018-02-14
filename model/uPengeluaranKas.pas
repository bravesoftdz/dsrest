unit uPengeluaranKas;

interface

uses
  uModel, uRekBank, uAR, uAccount, System.Generics.Collections,
  System.SysUtils, uSupplier, uPenerimaanKas;

type
  TPengeluaranKasARNew = class;
  TPengeluaranKasAP = class;
  TPengeluaranKasNonAP = class;

  TPengeluaranKas = class(TAppObject)
  private
    FCabang: TCabang;
    FJenisTransaksi: string;
    FJthTempoBG: TDatetime;
    FKeterangan: string;
    FNoBG: string;
    FNoBukti: string;
    FNominal: Double;
    FPenerima: TSupplier;
    FPengeluaranKasAPs: TobjectList<TPengeluaranKasAP>;
    FPengeluaranKasAPNews: TobjectList<TPengeluaranKasARNew>;
    FPengeluaranKasNonAPs: TobjectList<TPengeluaranKasNonAP>;
    FPetugas: string;
    FRekBank: TRekBank;
    FTglBukti: TDatetime;
    function GetPengeluaranKasAPs: TobjectList<TPengeluaranKasAP>;
    function GetPengeluaranKasAPNews: TobjectList<TPengeluaranKasARNew>;
    function GetPengeluaranKasNonAPs: TobjectList<TPengeluaranKasNonAP>;
    procedure SetCabang(const Value: TCabang);
  published
    property Cabang: TCabang read FCabang write SetCabang;
    property JenisTransaksi: string read FJenisTransaksi write FJenisTransaksi;
    property JthTempoBG: TDatetime read FJthTempoBG write FJthTempoBG;
    property Keterangan: string read FKeterangan write FKeterangan;
    property NoBG: string read FNoBG write FNoBG;
    property NoBukti: string read FNoBukti write FNoBukti;
    property Nominal: Double read FNominal write FNominal;
    property Penerima: TSupplier read FPenerima write FPenerima;
    property PengeluaranKasAPs: TobjectList<TPengeluaranKasAP> read
        GetPengeluaranKasAPs write FPengeluaranKasAPs;
    property PengeluaranKasAPNews: TobjectList<TPengeluaranKasARNew> read
        GetPengeluaranKasAPNews write FPengeluaranKasAPNews;
    property PengeluaranKasNonAPs: TobjectList<TPengeluaranKasNonAP> read
        GetPengeluaranKasNonAPs write FPengeluaranKasNonAPs;
    property Petugas: string read FPetugas write FPetugas;
    property RekBank: TRekBank read FRekBank write FRekBank;
    property TglBukti: TDatetime read FTglBukti write FTglBukti;
  end;

  TPengeluaranKasAP = class(TAppObjectItem)
  private
    FAP: TAP;
    FKeterangan: string;
    FNominal: Double;
    FPengeluaranKas: TPengeluaranKas;
  public
    function GetHeaderField: string; override;
    procedure SetHeaderProperty(AHeaderProperty : TAppObject); override;
  published
    property AP: TAP read FAP write FAP;
    property Keterangan: string read FKeterangan write FKeterangan;
    property Nominal: Double read FNominal write FNominal;
    property PengeluaranKas: TPengeluaranKas read FPengeluaranKas write
        FPengeluaranKas;
  end;

  TPengeluaranKasNonAP = class(TAppObjectItem)
  private
    FAccount: TAccount;
    FKeterangan: string;
    FNominal: Double;
    FPengeluaranKas: TPengeluaranKas;
  public
    function GetHeaderField: string; override;
    procedure SetHeaderProperty(AHeaderProperty : TAppObject); override;
  published
    property Account: TAccount read FAccount write FAccount;
    property Keterangan: string read FKeterangan write FKeterangan;
    property Nominal: Double read FNominal write FNominal;
    property PengeluaranKas: TPengeluaranKas read FPengeluaranKas write
        FPengeluaranKas;
  end;

  TPengeluaranKasARNew = class(TAppObjectItem)
  private
    FAccount: TAccount;
    FAP: TAP;
    FKeterangan: string;
    FNominal: Double;
    FPengeluaranKas: TPengeluaranKas;
  public
    function GetHeaderField: string; override;
    procedure SetHeaderProperty(AHeaderProperty : TAppObject); override;
  published
    property Account: TAccount read FAccount write FAccount;
    property AP: TAP read FAP write FAP;
    property Keterangan: string read FKeterangan write FKeterangan;
    property Nominal: Double read FNominal write FNominal;
    property PengeluaranKas: TPengeluaranKas read FPengeluaranKas write
        FPengeluaranKas;
  end;

implementation

function TPengeluaranKas.GetPengeluaranKasAPs: TobjectList<TPengeluaranKasAP>;
begin
  if FPengeluaranKasAPs = nil then
    FPengeluaranKasAPs := TObjectList<TPengeluaranKasAP>.Create();

  Result := FPengeluaranKasAPs;
end;

function TPengeluaranKas.GetPengeluaranKasAPNews:
    TobjectList<TPengeluaranKasARNew>;
begin
  if FPengeluaranKasAPNews = nil then
    FPengeluaranKasAPNews := TObjectList<TPengeluaranKasARNew>.Create();

  Result := FPengeluaranKasAPNews;
end;

function TPengeluaranKas.GetPengeluaranKasNonAPs:
    TobjectList<TPengeluaranKasNonAP>;
begin
  if FPengeluaranKasNonAPs = nil then
    FPengeluaranKasNonAPs := TObjectList<TPengeluaranKasNonAP>.Create();

  Result := FPengeluaranKasNonAPs;
end;

procedure TPengeluaranKas.SetCabang(const Value: TCabang);
begin
  if FCabang <> Value then
  begin
    FreeAndNil(FCabang);
    FCabang := Value;
  end;
  FCabang := Value;
end;

function TPengeluaranKasAP.GetHeaderField: string;
begin
  Result := 'PengeluaranKas';
end;

procedure TPengeluaranKasAP.SetHeaderProperty(AHeaderProperty : TAppObject);
begin
  Self.PengeluaranKas := TPengeluaranKas(AHeaderProperty);
end;

function TPengeluaranKasNonAP.GetHeaderField: string;
begin
  Result := 'PengeluaranKas';
end;

procedure TPengeluaranKasNonAP.SetHeaderProperty(AHeaderProperty : TAppObject);
begin
  Self.PengeluaranKas := TPengeluaranKas(AHeaderProperty);
end;

function TPengeluaranKasARNew.GetHeaderField: string;
begin
  Result := 'PengeluaranKas';
end;

procedure TPengeluaranKasARNew.SetHeaderProperty(AHeaderProperty : TAppObject);
begin
  Self.PengeluaranKas := TPengeluaranKas(AHeaderProperty);
end;

end.
