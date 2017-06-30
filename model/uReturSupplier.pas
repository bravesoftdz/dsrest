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
    FGudang: TGudang;
    FKeterangan: string;
    FNoBukti: string;
    FPenerimaanBarang: TPenerimaanBarang;
    FPeriode: Integer;
    FReturSupplierItems: TObjectList<TReturSupplierItem>;
    FSupplier: TSupplier;
    FTglBukti: TDatetime;
    function GetReturSupplierItems: TObjectList<TReturSupplierItem>;
    function GetTotal: Double;
    procedure SetKeterangan(const Value: string);
    procedure SetTglBukti(const Value: TDatetime);
  public
    property Total: Double read GetTotal;
  published
    property Cabang: TCabang read FCabang write FCabang;
    property Gudang: TGudang read FGudang write FGudang;
    property Keterangan: string read FKeterangan write SetKeterangan;
    property NoBukti: string read FNoBukti write FNoBukti;
    property PenerimaanBarang: TPenerimaanBarang read FPenerimaanBarang write
        FPenerimaanBarang;
    property Periode: Integer read FPeriode write FPeriode;
    property ReturSupplierItems: TObjectList<TReturSupplierItem> read
        GetReturSupplierItems write FReturSupplierItems;
    property Supplier: TSupplier read FSupplier write FSupplier;
    property TglBukti: TDatetime read FTglBukti write SetTglBukti;
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

function TReturSupplier.GetReturSupplierItems: TObjectList<TReturSupplierItem>;
begin
  if FReturSupplierItems =nil then
    FReturSupplierItems := TObjectList<TReturSupplierItem>.Create(True);

  Result := FReturSupplierItems;
end;

function TReturSupplier.GetTotal: Double;
var
  dLinePrice: Double;
  I: Integer;
begin
  Result := 0;

  for I := 0 to ReturSupplierItems.Count - 1 do
  begin
    dLinePrice := ReturSupplierItems[i].Qty *
                  ReturSupplierItems[i].HargaSetelahDiskon;

    dLinePrice := (100 + ReturSupplierItems[i].PPN) / 100 * dLinePrice;
    Result := Result + dLinePrice;
  end;
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
