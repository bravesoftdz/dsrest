unit uCustomerInvoice;

interface

uses
  uModel, uPenjualan, System.Generics.Collections, uAR, System.SysUtils;

type
  {$TYPEINFO ON}
  TCustomerInvoicePenjualan = class;
  TCustomerInvoicePenjualanItem = class;
  TCustomerInvoice = class(TAppObject)
  {$TYPEINFO OFF}
  private
    FAR: TAR;
    FCabang: TCabang;
    FCustomer: TSupplier;
    FCustomerInvoicePenjualans: tobjectlist<TCustomerInvoicePenjualan>;
    FJatuhTempo: TDatetime;
    FKeterangan: string;
    FNoBukti: string;
    FNominal: Double;
    FTglBukti: TDatetime;
    function GetCustomerInvoicePenjualans: tobjectlist<TCustomerInvoicePenjualan>;
    function GetNominal: Double;
  public
    destructor Destroy; override;
    property Nominal: Double read GetNominal write FNominal;
  published
    property AR: TAR read FAR write FAR;
    property Cabang: TCabang read FCabang write FCabang;
    property Customer: TSupplier read FCustomer write FCustomer;
    property CustomerInvoicePenjualans: tobjectlist<TCustomerInvoicePenjualan> read
        GetCustomerInvoicePenjualans write FCustomerInvoicePenjualans;
    property JatuhTempo: TDatetime read FJatuhTempo write FJatuhTempo;
    property Keterangan: string read FKeterangan write FKeterangan;
    property NoBukti: string read FNoBukti write FNoBukti;
    property TglBukti: TDatetime read FTglBukti write FTglBukti;
  end;

  TCustomerInvoicePenjualan = class(TAppObject)
  private
    FCustomerInvoice: TCustomerInvoice;
    FCustomerInvoicePenjualanItems: tobjectlist<TCustomerInvoicePenjualanItem>;
    FTPenjualan: TPenjualan;
    function GetCustomerInvoicePenjualanItems:
        tobjectlist<TCustomerInvoicePenjualanItem>;
  published
    property CustomerInvoice: TCustomerInvoice read FCustomerInvoice write
        FCustomerInvoice;
    property CustomerInvoicePenjualanItems:
        tobjectlist<TCustomerInvoicePenjualanItem> read
        GetCustomerInvoicePenjualanItems write FCustomerInvoicePenjualanItems;
    property TPenjualan: TPenjualan read FTPenjualan write FTPenjualan;
  end;

  TCustomerInvoicePenjualanItem = class(TAppObject)
  private
    FBarang: TBarang;
    FCustomerInvoicePenjualan: TCustomerInvoicePenjualan;
    FDiskon: Double;
    FHarga: Double;
    FJenisHarga: string;
    FKonversi: Double;
    FPPN: Double;
    FQty: Double;
    FUOM: TUOM;
    function GetHargaSetelahDiskon: Double;
  public
    property HargaSetelahDiskon: Double read GetHargaSetelahDiskon;
  published
    property Barang: TBarang read FBarang write FBarang;
    property CustomerInvoicePenjualan: TCustomerInvoicePenjualan read
        FCustomerInvoicePenjualan write FCustomerInvoicePenjualan;
    property Diskon: Double read FDiskon write FDiskon;
    property Harga: Double read FHarga write FHarga;
    property JenisHarga: string read FJenisHarga write FJenisHarga;
    property Konversi: Double read FKonversi write FKonversi;
    property PPN: Double read FPPN write FPPN;
    property Qty: Double read FQty write FQty;
    property UOM: TUOM read FUOM write FUOM;
  end;

implementation

function TCustomerInvoicePenjualanItem.GetHargaSetelahDiskon: Double;
begin
  Result := Harga * (100 - Diskon) / 100;
end;

destructor TCustomerInvoice.Destroy;
begin
  inherited;
  FreeAndNil(FCabang);
  FreeAndNil(FAR);
end;

function TCustomerInvoice.GetCustomerInvoicePenjualans:
    tobjectlist<TCustomerInvoicePenjualan>;
begin
  if FCustomerInvoicePenjualans = nil then
    FCustomerInvoicePenjualans := TObjectList<TCustomerInvoicePenjualan>.Create(False);

  Result := FCustomerInvoicePenjualans;
end;

function TCustomerInvoice.GetNominal: Double;
var
  i: Integer;
  j: Integer;
begin
  FNominal := 0;
  for i := 0 to CustomerInvoicePenjualans.Count - 1 do
  begin
    for j := 0 to CustomerInvoicePenjualans[i].CustomerInvoicePenjualanItems.Count - 1 do
    begin
      FNominal := FNominal + (CustomerInvoicePenjualans[i].CustomerInvoicePenjualanItems[j].GetHargaSetelahDiskon
                              * (100 + CustomerInvoicePenjualans[i].CustomerInvoicePenjualanItems[j].PPN) / 100);

    end;
  end;

  Result := FNominal;
end;

function TCustomerInvoicePenjualan.GetCustomerInvoicePenjualanItems:
    tobjectlist<TCustomerInvoicePenjualanItem>;
begin
  if FCustomerInvoicePenjualanItems = nil then
    FCustomerInvoicePenjualanItems := TObjectList<TCustomerInvoicePenjualanItem>.Create(False);

  Result := FCustomerInvoicePenjualanItems;
end;

end.
