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

  TCustomerInvoicePenjualan = class(TAppObjectItem)
  private
    FCustomerInvoice: TCustomerInvoice;
    FCustomerInvoicePenjualanItems: tobjectlist<TCustomerInvoicePenjualanItem>;
    FPenjualan: TPenjualan;
    function GetCustomerInvoicePenjualanItems:
        tobjectlist<TCustomerInvoicePenjualanItem>;
  public
    destructor Destroy; override;
    function GetHeaderField: string; override;
    procedure SetHeaderProperty(AHeaderProperty : TAppObject); override;
  published
    property CustomerInvoice: TCustomerInvoice read FCustomerInvoice write
        FCustomerInvoice;
    property CustomerInvoicePenjualanItems:
        tobjectlist<TCustomerInvoicePenjualanItem> read
        GetCustomerInvoicePenjualanItems write FCustomerInvoicePenjualanItems;
    property Penjualan: TPenjualan read FPenjualan write FPenjualan;
  end;

  TCustomerInvoicePenjualanItem = class(TAppObjectItem)
  private
    FBarang: TBarang;
    FBarangSatuangItemID: string;
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
    destructor Destroy; override;
    function GetHeaderField: string; override;
    procedure SetHeaderProperty(AHeaderProperty : TAppObject); override;
    property BarangSatuangItemID: string read FBarangSatuangItemID write
        FBarangSatuangItemID;
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

destructor TCustomerInvoicePenjualanItem.Destroy;
begin
  inherited;
  FreeAndNil(FBarang);
  FreeAndNil(FUOM);
end;

function TCustomerInvoicePenjualanItem.GetHargaSetelahDiskon: Double;
begin
  Result := Harga * (100 - Diskon) / 100;
end;

function TCustomerInvoicePenjualanItem.GetHeaderField: string;
begin
  Result := 'CustomerInvoicePenjualan';
end;

procedure TCustomerInvoicePenjualanItem.SetHeaderProperty(AHeaderProperty :
    TAppObject);
begin
  Self.CustomerInvoicePenjualan := TCustomerInvoicePenjualan(AHeaderProperty);
end;

destructor TCustomerInvoice.Destroy;
var
  I: Integer;
begin
  inherited;
  FreeAndNil(FCabang);
  for I := 0 to CustomerInvoicePenjualans.Count - 1 do
  begin
    CustomerInvoicePenjualans[i].Free;
  end;

  CustomerInvoicePenjualans.Free;
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
                              * CustomerInvoicePenjualans[i].CustomerInvoicePenjualanItems[j].Qty
                              * (100 + CustomerInvoicePenjualans[i].CustomerInvoicePenjualanItems[j].PPN) / 100);

    end;
  end;

  Result := FNominal;
end;

destructor TCustomerInvoicePenjualan.Destroy;
var
  i: Integer;
begin
  inherited;
  for i := 0 to CustomerInvoicePenjualanItems.Count - 1 do
  begin
    CustomerInvoicePenjualanItems[i].Free;
  end;

  FreeAndNil(FCustomerInvoicePenjualanItems);
end;

function TCustomerInvoicePenjualan.GetCustomerInvoicePenjualanItems:
    tobjectlist<TCustomerInvoicePenjualanItem>;
begin
  if FCustomerInvoicePenjualanItems = nil then
    FCustomerInvoicePenjualanItems := TObjectList<TCustomerInvoicePenjualanItem>.Create(False);

  Result := FCustomerInvoicePenjualanItems;
end;

function TCustomerInvoicePenjualan.GetHeaderField: string;
begin
  Result := 'CustomerInvoice';
end;

procedure TCustomerInvoicePenjualan.SetHeaderProperty(AHeaderProperty :
    TAppObject);
begin
  Self.CustomerInvoice := TCustomerInvoice(AHeaderProperty);
end;

end.
