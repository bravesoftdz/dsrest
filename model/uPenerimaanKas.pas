unit uPenerimaanKas;

interface

uses
  uModel, uRekBank, uAR, System.Generics.Collections,System.SysUtils,
  uSupplier, uAccount;

type
  TPenerimaanKas = class;
  TPenerimaanKasAR = class;
  TPenerimaanKasAPNew = class;
  TPenerimaanKasLain = class;

  TPenerimaanKasAR = class(TAppObjectItem)
  private
    FAR: TAR;
    FKeterangan: string;
    FNominal: Double;
    FPenerimaanKas: TPenerimaanKas;
    FUangBayar: Double;
    FUangSisa: Double;
    function GetUangSisa: Double;
  public
    function GetHeaderField: string; override;
    procedure SetHeaderProperty(AHeaderProperty : TAppObject); override;
  published
    property AR: TAR read FAR write FAR;
    property Keterangan: string read FKeterangan write FKeterangan;
    property Nominal: Double read FNominal write FNominal;
    property PenerimaanKas: TPenerimaanKas read FPenerimaanKas write FPenerimaanKas;
    property UangBayar: Double read FUangBayar write FUangBayar;
    property UangSisa: Double read GetUangSisa write FUangSisa;
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
    FPetugas: string;
    FRekBank: TRekBank;
    FTglBukti: TDatetime;
    FPenerimaanKasAPNewItems: TObjectList<TPenerimaanKasAPNew>;
    FPenerimaanKasLainItems: TObjectList<TPenerimaanKasLain>;
    function GetPenerimaanKasARItems: TObjectlist<TPenerimaanKasAR>;
    function GetPenerimaanKasAPNewItems: TObjectList<TPenerimaanKasAPNew>;
    function GetPenerimaanKasLainItems: TObjectList<TPenerimaanKasLain>;
  public
    destructor Destroy; override;
  published
    property Cabang: TCabang read FCabang write FCabang;
    property JenisTransaksi: string read FJenisTransaksi write FJenisTransaksi;
    property Keterangan: string read FKeterangan write FKeterangan;
    property NoBukti: string read FNoBukti write FNoBukti;
    property Nominal: Double read FNominal write FNominal;
    property Pembeli: TSupplier read FPembeli write FPembeli;
    property PenerimaanKasARItems: TObjectlist<TPenerimaanKasAR> read
        GetPenerimaanKasARItems write FPenerimaanKasARItems;
    property Petugas: string read FPetugas write FPetugas;
    property RekBank: TRekBank read FRekBank write FRekBank;
    property TglBukti: TDatetime read FTglBukti write FTglBukti;
    property PenerimaanKasAPNewItems: TObjectList<TPenerimaanKasAPNew> read
        GetPenerimaanKasAPNewItems write FPenerimaanKasAPNewItems;
    property PenerimaanKasLainItems: TObjectList<TPenerimaanKasLain> read
        GetPenerimaanKasLainItems write FPenerimaanKasLainItems;
  end;

  TPenerimaanKasAPNew = class(TAppObjectItem)
  private
    FAccount: TAccount;
    FAP: TAP;
    FKeterangan: string;
    FNominal: Double;
    FPenerimaanKas: TPenerimaanKas;
  public
    function GetHeaderField: string; override;
    procedure SetHeaderProperty(AHeaderProperty : TAppObject); override;
  published
    property Account: TAccount read FAccount write FAccount;
    property AP: TAP read FAP write FAP;
    property Keterangan: string read FKeterangan write FKeterangan;
    property Nominal: Double read FNominal write FNominal;
    property PenerimaanKas: TPenerimaanKas read FPenerimaanKas write FPenerimaanKas;
  end;

  TPenerimaanKasLain = class(TAppObjectItem)
  private
    FAccount: TAccount;
    FKeterangan: string;
    FNominal: Double;
    FPenerimaanKas: TPenerimaanKas;
  public
    function GetHeaderField: string; override;
    procedure SetHeaderProperty(AHeaderProperty : TAppObject); override;
  published
    property Account: TAccount read FAccount write FAccount;
    property Keterangan: string read FKeterangan write FKeterangan;
    property Nominal: Double read FNominal write FNominal;
    property PenerimaanKas: TPenerimaanKas read FPenerimaanKas write FPenerimaanKas;
  end;

implementation

function TPenerimaanKasAR.GetHeaderField: string;
begin
  Result := 'PenerimaanKas';
end;

function TPenerimaanKasAR.GetUangSisa: Double;
begin
  FUangSisa := FUangBayar - FNominal;

  Result := FUangSisa;
end;

procedure TPenerimaanKasAR.SetHeaderProperty(AHeaderProperty : TAppObject);
begin
  Self.PenerimaanKas := TPenerimaanKas(AHeaderProperty);
end;

destructor TPenerimaanKas.Destroy;
var
  I: Integer;
begin
  inherited;
  FreeAndNil(FRekBank);
  FreeAndNil(FPembeli);
  FreeAndNil(FCabang);

  for I := 0 to PenerimaanKasARItems.Count - 1 do
  begin
    PenerimaanKasARItems[i].AR.Free;
  end;

  PenerimaanKasARItems.Free;
end;

function TPenerimaanKas.GetPenerimaanKasARItems: TObjectlist<TPenerimaanKasAR>;
begin
  if FPenerimaanKasARItems = nil then
    FPenerimaanKasARItems := TObjectList<TPenerimaanKasAR>.Create(False);

  Result := FPenerimaanKasARItems;
end;

function TPenerimaanKas.GetPenerimaanKasAPNewItems:
    TObjectList<TPenerimaanKasAPNew>;
begin
  if FPenerimaanKasAPNewItems = nil then
    FPenerimaanKasAPNewItems := TObjectList<TPenerimaanKasAPNew>.Create;

  Result := FPenerimaanKasAPNewItems;
end;

function TPenerimaanKas.GetPenerimaanKasLainItems:
    TObjectList<TPenerimaanKasLain>;
begin
  if FPenerimaanKasLainItems = nil then
    FPenerimaanKasLainItems := TObjectList<TPenerimaanKasLain>.Create;

  Result := FPenerimaanKasLainItems;
end;

function TPenerimaanKasAPNew.GetHeaderField: string;
begin
  Result := 'PenerimaanKas';
end;

procedure TPenerimaanKasAPNew.SetHeaderProperty(AHeaderProperty : TAppObject);
begin
  Self.PenerimaanKas := TPenerimaanKas(AHeaderProperty);
end;

function TPenerimaanKasLain.GetHeaderField: string;
begin
  Result := 'PenerimaanKas';
end;

procedure TPenerimaanKasLain.SetHeaderProperty(AHeaderProperty : TAppObject);
begin
  Self.PenerimaanKas := TPenerimaanKas(AHeaderProperty);
end;

end.
