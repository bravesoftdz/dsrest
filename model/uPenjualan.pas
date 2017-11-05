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
    FDiskon: Double;
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
    FPPN: Double;
    FSubTotal: Double;
    FTglBukti: TDatetime;
    FTermOfPayment: Integer;
    FTotal: Double;
    function GetDiskon: Double;
    function GetPenjualanItems: TObjectList<TPenjualanItem>;
    function GetPPN: Double;
    function GetSubTotal: Double;
    function GetTotal: Double;
  public
  published
    property Cabang: TCabang read FCabang write FCabang;
    property Diskon: Double read GetDiskon write FDiskon;
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
    property PPN: Double read GetPPN write FPPN;
    property SubTotal: Double read GetSubTotal write FSubTotal;
    property TglBukti: TDatetime read FTglBukti write FTglBukti;
    property TermOfPayment: Integer read FTermOfPayment write FTermOfPayment;
    property Total: Double read GetTotal write FTotal;
  end;


implementation

function TPenjualan.GetDiskon: Double;
var
  dLineDisc: Double;
  I: Integer;
begin
  FDiskon := 0;

  for I := 0 to PenjualanItems.Count - 1 do
  begin
    dLineDisc := PenjualanItems[i].Qty *
                 PenjualanItems[i].Harga *
                 PenjualanItems[i].Diskon / 100;

    FDiskon  := FDiskon + dLineDisc;
  end;

  Result := FDiskon;
end;

function TPenjualan.GetPenjualanItems: TObjectList<TPenjualanItem>;
begin
  if FPenjualanItems = nil then
    FPenjualanItems := TObjectList<TPenjualanItem>.Create(False);

  Result := FPenjualanItems;
end;

function TPenjualan.GetPPN: Double;
var
  dLinePPN: Double;
  I: Integer;
begin
  FPPN := 0;

  for I := 0 to PenjualanItems.Count - 1 do
  begin
    dLinePPN := PenjualanItems[i].Qty *
                PenjualanItems[i].HargaSetelahDiskon *
                PenjualanItems[i].PPN / 100;

    FPPN  := FPPN + dLinePPN;
  end;

  Result := FPPN;
end;

function TPenjualan.GetSubTotal: Double;
var
  dLinePrice: Double;
  I: Integer;
begin
  FSubTotal := 0;

  for I := 0 to PenjualanItems.Count - 1 do
  begin
    dLinePrice := PenjualanItems[i].Qty *
                  PenjualanItems[i].Harga;

    FSubTotal  := FSubTotal + dLinePrice;
  end;

  Result := FSubTotal;
end;

function TPenjualan.GetTotal: Double;
begin
  FTotal := SubTotal - Diskon + PPN;
  Result := FTotal;
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
