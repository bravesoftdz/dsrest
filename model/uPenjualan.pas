unit uPenjualan;

interface

uses
  uModel, System.Generics.Collections, uSupplier;


type
  TPenjualan = class;

  TPenjualanItem = class(TAppObjectItem)
  private
    FBarang: TBarang;
    FBarangSatuangItemID: string;
    FDiskon: Double;
    FHarga: Double;
    FJenisHarga: string;
    FKonversi: Double;
    FPenjualan: TPenjualan;
    FPPN: Double;
    FQty: Double;
    FUOM: TUOM;
    function GetHargaSetelahDiskon: Double;
  public
    function GetHeaderField: string; override;
    procedure SetHeaderProperty(AHeaderProperty : TAppObject); override;
    property BarangSatuangItemID: string read FBarangSatuangItemID write
        FBarangSatuangItemID;
  published
    property Barang: TBarang read FBarang write FBarang;
    property Diskon: Double read FDiskon write FDiskon;
    property Harga: Double read FHarga write FHarga;
    property HargaSetelahDiskon: Double read GetHargaSetelahDiskon;
    property JenisHarga: string read FJenisHarga write FJenisHarga;
    property Konversi: Double read FKonversi write FKonversi;
    property Penjualan: TPenjualan read FPenjualan write FPenjualan;
    property PPN: Double read FPPN write FPPN;
    property Qty: Double read FQty write FQty;
    property UOM: TUOM read FUOM write FUOM;
  end;

  TPenjualan = class(TAppObject)
  private
    FCabang: TCabang;
    FFee: string;
    FGudang: TGudang;
    FJatuhTempo: TDatetime;
    FJenisPembayaran: string;
    FJenisPenjualan: string;
    FKasir: string;
    FKeterangan: string;
    FNoBukti: string;
    FPembeli: TSupplier;
    FSalesman: TSupplier;
    FPenjualanItems: TObjectList<TPenjualanItem>;
    FTglBukti: TDatetime;
    FTermOfPayment: Integer;
    function GetPenjualanItems: TObjectList<TPenjualanItem>;
    function GetTotal: Double;
  public
    property Total: Double read GetTotal;
  published
    property Cabang: TCabang read FCabang write FCabang;
    property Fee: string read FFee write FFee;
    property Gudang: TGudang read FGudang write FGudang;
    property JatuhTempo: TDatetime read FJatuhTempo write FJatuhTempo;
    property JenisPembayaran: string read FJenisPembayaran write FJenisPembayaran;
    property JenisPenjualan: string read FJenisPenjualan write FJenisPenjualan;
    property Kasir: string read FKasir write FKasir;
    property Keterangan: string read FKeterangan write FKeterangan;
    property NoBukti: string read FNoBukti write FNoBukti;
    property Pembeli: TSupplier read FPembeli write FPembeli;
    property Salesman: TSupplier read FSalesman write FSalesman;
    property PenjualanItems: TObjectList<TPenjualanItem> read GetPenjualanItems
        write FPenjualanItems;
    property TglBukti: TDatetime read FTglBukti write FTglBukti;
    property TermOfPayment: Integer read FTermOfPayment write FTermOfPayment;
  end;


implementation

function TPenjualan.GetPenjualanItems: TObjectList<TPenjualanItem>;
begin
  if FPenjualanItems = nil then
    FPenjualanItems := TObjectList<TPenjualanItem>.Create(False);

  Result := FPenjualanItems;
end;

function TPenjualan.GetTotal: Double;
var
  dLinePrice: Double;
  I: Integer;
begin
  Result := 0;

  for I := 0 to PenjualanItems.Count - 1 do
  begin
    dLinePrice := PenjualanItems[i].Qty *
                  PenjualanItems[i].HargaSetelahDiskon;

    dLinePrice := (100 + PenjualanItems[i].PPN) / 100 * dLinePrice;
    Result := Result + dLinePrice;
  end;
end;

function TPenjualanItem.GetHargaSetelahDiskon: Double;
begin
  Result := Harga * (100 - Diskon) / 100;
end;

function TPenjualanItem.GetHeaderField: string;
begin
  Result := 'Penjualan';
end;

procedure TPenjualanItem.SetHeaderProperty(AHeaderProperty : TAppObject);
begin
  Self.Penjualan := TPenjualan(AHeaderProperty);
end;

end.
