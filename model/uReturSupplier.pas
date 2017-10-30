unit uReturSupplier;

interface

uses
  uModel, uPenerimaanBarang, uSupplier, System.Classes, System.SysUtils, System.Generics.Collections;

type
  {$TYPEINFO ON}
  TReturSupplierItem = class;
  TReturSupplier = class(TAppObject)
  private
    FCabang: TCabang;
    FDiskon: Double;
    FGudang: TGudang;
    FIsJurnalized: Integer;
    FKeterangan: string;
    FNoBukti: string;
    FPenerimaanBarang: TPenerimaanBarang;
    FPeriode: Integer;
    FPPN: Double;
    FReturSupplierItems: TObjectList<TReturSupplierItem>;
    FSubTotal: Double;
    FSupplier: TSupplier;
    FTglBukti: TDatetime;
    FTotal: Double;
    function GetDiskon: Double;
    function GetPPN: Double;
    function GetReturSupplierItems: TObjectList<TReturSupplierItem>;
    function GetSubTotal: Double;
    function GetTotal: Double;
    procedure SetKeterangan(const Value: string);
    procedure SetTglBukti(const Value: TDatetime);
  public
  published
    property Cabang: TCabang read FCabang write FCabang;
    property Diskon: Double read GetDiskon write FDiskon;
    property Gudang: TGudang read FGudang write FGudang;
    property IsJurnalized: Integer read FIsJurnalized write FIsJurnalized;
    property Keterangan: string read FKeterangan write SetKeterangan;
    property NoBukti: string read FNoBukti write FNoBukti;
    property PenerimaanBarang: TPenerimaanBarang read FPenerimaanBarang write
        FPenerimaanBarang;
    property Periode: Integer read FPeriode write FPeriode;
    property PPN: Double read GetPPN write FPPN;
    property ReturSupplierItems: TObjectList<TReturSupplierItem> read
        GetReturSupplierItems write FReturSupplierItems;
    property SubTotal: Double read GetSubTotal write FSubTotal;
    property Supplier: TSupplier read FSupplier write FSupplier;
    property TglBukti: TDatetime read FTglBukti write SetTglBukti;
    property Total: Double read GetTotal write FTotal;
  end;

//type
  TReturSupplierItem = class(TAppObjectItem)
  {$TYPEINFO OFF}
  private
    FBarang: TBarang;
    FDiskon: Double;
    FHargaBeli: Double;
    FReturSupplier: TReturSupplier;
    FPPN: Double;
    FQty: Double;
    FUOM: TUOM;
    FKonversi : Double;
    function GetHargaSetelahDiskon: Double;
  public
    function GetHeaderField: string; override;
    procedure SetHeaderProperty(AHeaderProperty : TAppObject); override;
  published
    property Barang: TBarang read FBarang write FBarang;
    property Diskon: Double read FDiskon write FDiskon;
    property HargaBeli: Double read FHargaBeli write FHargaBeli;
    property HargaSetelahDiskon: Double read GetHargaSetelahDiskon;
    property ReturSupplier: TReturSupplier read FReturSupplier write FReturSupplier;
    property PPN: Double read FPPN write FPPN;
    property Qty: Double read FQty write FQty;
    property UOM: TUOM read FUOM write FUOM;
    property Konversi : Double read FKonversi write FKonversi;
  end;

implementation

function TReturSupplier.GetDiskon: Double;
var
  dLineDisc: Double;
  I: Integer;
begin
  FDiskon := 0;

  for I := 0 to ReturSupplierItems.Count - 1 do
  begin
    dLineDisc := ReturSupplierItems[i].Qty *
                 ReturSupplierItems[i].HargaBeli *
                 ReturSupplierItems[i].Diskon / 100;

    FDiskon  := FDiskon + dLineDisc;
  end;

  Result := FDiskon;
end;

function TReturSupplier.GetPPN: Double;
var
  dLinePPN: Double;
  I: Integer;
begin
  FPPN := 0;

  for I := 0 to ReturSupplierItems.Count - 1 do
  begin
    dLinePPN := ReturSupplierItems[i].Qty *
                ReturSupplierItems[i].HargaBeli *
                (100 - ReturSupplierItems[i].Diskon) / 100 *
                ReturSupplierItems[i].PPN / 100;

    FPPN  := FPPN + dLinePPN;
  end;

  Result := FPPN;
end;

function TReturSupplier.GetReturSupplierItems: TObjectList<TReturSupplierItem>;
begin
  if FReturSupplierItems =nil then
    FReturSupplierItems := TObjectList<TReturSupplierItem>.Create(True);

  Result := FReturSupplierItems;
end;

function TReturSupplier.GetSubTotal: Double;
var
  dLinePrice: Double;
  I: Integer;
begin
  FSubTotal := 0;

  for I := 0 to ReturSupplierItems.Count - 1 do
  begin
    dLinePrice := ReturSupplierItems[i].Qty *
                  ReturSupplierItems[i].HargaBeli;

    FSubTotal  := FSubTotal + dLinePrice;
  end;

  Result := FSubTotal;
end;

function TReturSupplier.GetTotal: Double;
begin
  FTotal := SubTotal - Diskon + PPN;
  Result := FTotal;
end;

procedure TReturSupplier.SetKeterangan(const Value: string);
begin
  FKeterangan := Value;
end;

procedure TReturSupplier.SetTglBukti(const Value: TDatetime);
begin
  FTglBukti := Value;
  Periode   := StrToInt(FormatDateTime('YYYYMM', Value));
end;

function TReturSupplierItem.GetHargaSetelahDiskon: Double;
begin
  Result := HargaBeli * (100 - Diskon) / 100;
end;

function TReturSupplierItem.GetHeaderField: string;
begin
  Result := 'ReturSupplier';
end;

procedure TReturSupplierItem.SetHeaderProperty(AHeaderProperty : TAppObject);
begin
  ReturSupplier := TReturSupplier(AHeaderProperty);
end;

end.
