unit uSettlementARAP;

interface

uses
  uModel, uAR, uSupplier, System.SysUtils, System.Generics.Collections;

type
  TSettlementARAPItemAR = class;
  TSettlementARAPItemAP = class;

  TSettlementARAP = class(TAPPobject)
  private
    FKeterangan: string;
    FNoBukti: string;
    FSettlementARAPItemAPs: TObjectList<TSettlementARAPItemAP>;
    FSettlementARAPItemARs: TObjectList<TSettlementARAPItemAR>;
    FSupplier: TSupplier;
    FTglBukti: TDatetime;
    function GetSettlementARAPItemAPs: TObjectList<TSettlementARAPItemAP>;
    function GetSettlementARAPItemARs: TObjectList<TSettlementARAPItemAR>;
  public
    destructor Destroy; override;
  published
    property Keterangan: string read FKeterangan write FKeterangan;
    property NoBukti: string read FNoBukti write FNoBukti;
    property SettlementARAPItemAPs: TObjectList<TSettlementARAPItemAP> read
        GetSettlementARAPItemAPs write FSettlementARAPItemAPs;
    property SettlementARAPItemARs: TObjectList<TSettlementARAPItemAR> read
        GetSettlementARAPItemARs write FSettlementARAPItemARs;
    property Supplier: TSupplier read FSupplier write FSupplier;
    property TglBukti: TDatetime read FTglBukti write FTglBukti;
  end;

  TSettlementARAPItemAR = class(TAppObjectItem)
  private
    FAR: TAR;
    FNominal: Double;
    FSettlementARAP: TSettlementARAP;
  public
    function GetHeaderField: string; override;
    procedure SetHeaderProperty(AHeaderProperty : TAppObject); override;
  published
    property AR: TAR read FAR write FAR;
    property Nominal: Double read FNominal write FNominal;
    property SettlementARAP: TSettlementARAP read FSettlementARAP write
        FSettlementARAP;
  end;

  TSettlementARAPItemAP = class(TAppObjectItem)
  private
    FAP: TAP;
    FNominal: Double;
    FSettlementARAP: TSettlementARAP;
  public
    function GetHeaderField: string; override;
    procedure SetHeaderProperty(AHeaderProperty : TAppObject); override;
  published
    property AP: TAP read FAP write FAP;
    property Nominal: Double read FNominal write FNominal;
    property SettlementARAP: TSettlementARAP read FSettlementARAP write
        FSettlementARAP;
  end;

implementation

destructor TSettlementARAP.Destroy;
begin
  inherited;
  FreeAndNil(FSupplier);

  SettlementARAPItemAPs.Clear;
  SettlementARAPItemARs.Clear;

  FreeAndNil(FSettlementARAPItemAPs);
  FreeAndNil(FSettlementARAPItemARs);
end;

function TSettlementARAP.GetSettlementARAPItemAPs:
    TObjectList<TSettlementARAPItemAP>;
begin
  if FSettlementARAPItemAPs = nil then
    FSettlementARAPItemAPs := TObjectList<TSettlementARAPItemAP>.Create();

  Result := FSettlementARAPItemAPs;
end;

function TSettlementARAP.GetSettlementARAPItemARs:
    TObjectList<TSettlementARAPItemAR>;
begin
  if FSettlementARAPItemARs = nil then
    FSettlementARAPItemARs := TObjectList<TSettlementARAPItemAR>.Create();

  Result := FSettlementARAPItemARs;
end;

function TSettlementARAPItemAR.GetHeaderField: string;
begin
  Result := 'SettlementARAP';
end;

procedure TSettlementARAPItemAR.SetHeaderProperty(AHeaderProperty : TAppObject);
begin
  Self.SettlementARAP := TSettlementARAP(AHeaderProperty);
end;

function TSettlementARAPItemAP.GetHeaderField: string;
begin
  Result := 'SettlementARAP';
end;

procedure TSettlementARAPItemAP.SetHeaderProperty(AHeaderProperty : TAppObject);
begin
  Self.SettlementARAP := TSettlementARAP(AHeaderProperty);
end;

end.
