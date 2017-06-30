unit uPenerimaanBarang;

interface

uses
  uModel, uSupplier, System.Generics.Collections, System.Classes, System.SysUtils;

type
  TPenerimaanBarangItem = class;
  TPenerimaanBarang = class(TAppObject)
  private
    FCabang: TCabang;
    FGudang: TGudang;
    FJenisPembayaran: string;
    FKeterangan: string;
    FNoBukti: string;
    FPenerimaanBarangItems: TObjectList<TPenerimaanBarangItem>;
    FPeriode: Integer;
    FSupplier: TSupplier;
    FTglBukti: TDatetime;
    FTempo: Integer;
    function GetPenerimaanBarangItems: TObjectList<TPenerimaanBarangItem>;
    function GetTotal: Double;
    procedure SetKeterangan(const Value: string);
    procedure SetTglBukti(const Value: TDatetime);
  public
    property Total: Double read GetTotal;
  published
    property Cabang: TCabang read FCabang write FCabang;
    property Gudang: TGudang read FGudang write FGudang;
    property JenisPembayaran: string read FJenisPembayaran write FJenisPembayaran;
    property Keterangan: string read FKeterangan write SetKeterangan;
    property NoBukti: string read FNoBukti write FNoBukti;
    property PenerimaanBarangItems: TObjectList<TPenerimaanBarangItem> read
        GetPenerimaanBarangItems write FPenerimaanBarangItems;
    property Periode: Integer read FPeriode write FPeriode;
    property Supplier: TSupplier read FSupplier write FSupplier;
    property TglBukti: TDatetime read FTglBukti write SetTglBukti;
    property Tempo: Integer read FTempo write FTempo;
  end;

  TPenerimaanBarangItem = class(TAppObjectItem)
  {$TYPEINFO OFF}
  private
    FBarang: TBarang;
    FDiskon: Double;
    FHargaBeli: Double;
    FPenerimaanBarang: TPenerimaanBarang;
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
    property PenerimaanBarang: TPenerimaanBarang read FPenerimaanBarang write
        FPenerimaanBarang;
    property PPN: Double read FPPN write FPPN;
    property Qty: Double read FQty write FQty;
    property UOM: TUOM read FUOM write FUOM;
    property Konversi : Double read FKonversi write FKonversi;
  end;

type
  TInvoiceSupplierItem = class(TAppObjectItem)
  {$TYPEINFO OFF}
  private
    FBarang: TBarang;
    FDiskon: Double;
    FHargaBeli: Double;
    FPenerimaanBarang: TPenerimaanBarang;
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
    property PenerimaanBarang: TPenerimaanBarang read FPenerimaanBarang write
        FPenerimaanBarang;
    property PPN: Double read FPPN write FPPN;
    property Qty: Double read FQty write FQty;
    property UOM: TUOM read FUOM write FUOM;
    property Konversi : Double read FKonversi write FKonversi;
  end;

implementation

function TPenerimaanBarang.GetPenerimaanBarangItems:
    TObjectList<TPenerimaanBarangItem>;
begin
  if FPenerimaanBarangItems =nil then
    FPenerimaanBarangItems := TObjectList<TPenerimaanBarangItem>.Create(True);

  Result := FPenerimaanBarangItems;
end;

function TPenerimaanBarang.GetTotal: Double;
var
  dLinePrice: Double;
  I: Integer;
begin
  Result := 0;

  for I := 0 to PenerimaanBarangItems.Count - 1 do
  begin
    dLinePrice := PenerimaanBarangItems[i].Qty *
                  PenerimaanBarangItems[i].HargaSetelahDiskon;

    dLinePrice := (100 + PenerimaanBarangItems[i].PPN) / 100 * dLinePrice;
    Result := Result + dLinePrice;
  end;
end;

procedure TPenerimaanBarang.SetKeterangan(const Value: string);
begin
  FKeterangan := Value;
end;

procedure TPenerimaanBarang.SetTglBukti(const Value: TDatetime);
begin
  FTglBukti := Value;
  Periode   := StrToInt(FormatDateTime('YYYYMM', Value));
end;

function TPenerimaanBarangItem.GetHargaSetelahDiskon: Double;
begin
  Result := HargaBeli * (100 - Diskon) / 100;
end;

function TPenerimaanBarangItem.GetHeaderField: string;
begin
  Result := 'PenerimaanBarang';
end;

procedure TPenerimaanBarangItem.SetHeaderProperty(AHeaderProperty : TAppObject);
begin
  PenerimaanBarang := TPenerimaanBarang(AHeaderProperty);
end;

function TInvoiceSupplierItem.GetHargaSetelahDiskon: Double;
begin
  Result := HargaBeli * (100 - Diskon) / 100;
end;

function TInvoiceSupplierItem.GetHeaderField: string;
begin
  Result := 'InvoiceSupplier';
end;

procedure TInvoiceSupplierItem.SetHeaderProperty(AHeaderProperty : TAppObject);
begin
  PenerimaanBarang := TPenerimaanBarang(AHeaderProperty);
end;

end.
