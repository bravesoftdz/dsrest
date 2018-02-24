unit uModel;

interface

uses
  DB, Classes, SysUtils,Generics.Collections;

type
  TBarangSatuanItem = class;
//  TPenerimaanBarang = class;
//  TReturSupplier = class;

  {$TYPEINFO ON}
  TAppObject = class(TObject)
  {$TYPEINFO OFF}
  private
    FID: string;
    FObjectState: Integer;
  protected
  public
    constructor Create; reintroduce;
    constructor CreateID(AID : String);
    class procedure PokeRTTI;
    property ObjectState: Integer read FObjectState write FObjectState;   // 1 Baru, 3 Edit, 5 Hapus
  published
    property ID: string read FID write FID;
  end;

  TCabang = class(TAppObject)
  private
    FIsHO: Integer;
    FKode: string;
    FNama: string;
  public
  published
    property IsHO: Integer read FIsHO write FIsHO;
    property Kode: string read FKode write FKode;
    property Nama: string read FNama write FNama;
  end;

   TGudang = class(TAppObject)
  private
    FCabang: TCabang;
    FKode: string;
    FNama: string;
  public
  published
    property Cabang: TCabang read FCabang write FCabang;
    property Kode: string read FKode write FKode;
    property Nama: string read FNama write FNama;
  end;

  {$TYPEINFO ON}
  TAppObjectItem = class(TAppObject)
  {$TYPEINFO OFF}
  private
    FUrutan: Integer;
  public
    function GetHeaderField: string; virtual; abstract;
    procedure SetHeaderProperty(AHeaderProperty : TAppObject); virtual; abstract;
  published
    property Urutan: Integer read FUrutan write FUrutan;
  end;

  TGroupBarang = class(TAppObject)
  private
    FKode: string;
    FNama: string;
  public
  published
    property Kode: string read FKode write FKode;
    property Nama: string read FNama write FNama;
  end;

  TUOM = class(TAppObject)
  private
    FKode: string;
  public
  published
    property Kode: string read FKode write FKode;
  end;

  {$TYPEINFO ON}
  TBarang = class(TAppObject)
  {$TYPEINFO OFF}
  private
    FBarangSatuanItems: TObjectList<TBarangSatuanItem>;
    FDiskonMember: Double;
    FGroupBarang: TGroupBarang;
    FNama: string;
    FPPN: string;
    FSKU: string;
    FSatuanStock : TUOM;
    function GetBarangSatuanItems: TObjectList<TBarangSatuanItem>;
//    function GetSatuanStock: TUOM;
  public
  published
    function KonversiPC(AUOM : TUOM): Double;
    property BarangSatuanItems: TObjectList<TBarangSatuanItem> read
        GetBarangSatuanItems write FBarangSatuanItems;
    property DiskonMember: Double read FDiskonMember write FDiskonMember;
    property GroupBarang: TGroupBarang read FGroupBarang write FGroupBarang;
    property Nama: string read FNama write FNama;
    property PPN: string read FPPN write FPPN;
    property SatuanStock: TUOM read FSatuanStock write FSatuanStock;
    property SKU: string read FSKU write FSKU;
  end;

  {$TYPEINFO ON}

  {$TYPEINFO ON}
  TBarangSatuanItem = class(TAppObjectItem)
  {$TYPEINFO OFF}
  private
    FBarang: TBarang;
    FBarcode: string;
    FHargaJual: Double;
    FHargaJualBengkel: Double;
    FHargaJualGrosir: Double;
    FHargaJualKeliling: Double;
    FIsSatuanStock: Integer;
    FKonversi: Double;
    FUOM: TUOM;
  protected
  public
    function GetHeaderField: string; override;
    procedure SetHeaderProperty(AHeaderProperty : TAppObject); override;
  published
    property Barang: TBarang read FBarang write FBarang;
    property Barcode: string read FBarcode write FBarcode;
    property HargaJual: Double read FHargaJual write FHargaJual;
    property HargaJualBengkel: Double read FHargaJualBengkel write
        FHargaJualBengkel;
    property HargaJualGrosir: Double read FHargaJualGrosir write FHargaJualGrosir;
    property HargaJualKeliling: Double read FHargaJualKeliling write
        FHargaJualKeliling;
    property IsSatuanStock: Integer read FIsSatuanStock write FIsSatuanStock;
    property Konversi: Double read FKonversi write FKonversi;
    property UOM: TUOM read FUOM write FUOM;
  end;

  
  TLogAppObject = class(TAppObject)
  private
    FCabang: TCabang;
    FIDTrans: string;
    FNamaKelas: string;
    FOperasi: string;
    FTanggal: TDatetime;
  public
  published
    property Cabang: TCabang read FCabang write FCabang;
    property IDTrans: string read FIDTrans write FIDTrans;
    property NamaKelas: string read FNamaKelas write FNamaKelas;
    property Operasi: string read FOperasi write FOperasi;
    property Tanggal: TDatetime read FTanggal write FTanggal;
  end;

  TStockSekarang = class(TAppObject)
  private
    FBarang: TBarang;
    FCabang: TCabang;
    FGudang: TGudang;
    FQty: Double;
    FRp: Double;
    FUOM: TUOM;
    procedure SetBarang(const Value: TBarang);
    procedure SetCabang(const Value: TCabang);
    procedure SetGudang(const Value: TGudang);
  public
  published
    property Barang: TBarang read FBarang write SetBarang;
    property Cabang: TCabang read FCabang write SetCabang;
    property Gudang: TGudang read FGudang write SetGudang;
    property Qty: Double read FQty write FQty;
    property Rp: Double read FRp write FRp;
    property UOM: TUOM read FUOM write FUOM;
  end;

  {$TYPEINFO ON}
type
  TClosingInventory = class(TAppObject)
  private
    FBarang: TBarang;
    FCabang: TCabang;
    FPeriode: Integer;
    FQty: Double;
    FRp: Double;
    FUOM: TUOM;
  public
  published
    property Barang: TBarang read FBarang write FBarang;
    property Cabang: TCabang read FCabang write FCabang;
    property Periode: Integer read FPeriode write FPeriode;
    property Qty: Double read FQty write FQty;
    property Rp: Double read FRp write FRp;
    property UOM: TUOM read FUOM write FUOM;
  end;

  TPembayaranSupplier = class(TAppObject)
  private
    FBank: string;
    FBiaya: Double;
    FJenisBayar: string;
    FKeterangan: string;
    FNoBukti: string;
    FPokok: Double;
    FNoRef: String;
    FPenerimaanBarang: Double;
    FPPN: Double;
    FTglBukti: TDatetime;
    FTglGiro: Integer;
  public
  published
    property Bank: string read FBank write FBank;
    property Biaya: Double read FBiaya write FBiaya;
    property JenisBayar: string read FJenisBayar write FJenisBayar;
    property Keterangan: string read FKeterangan write FKeterangan;
    property NoBukti: string read FNoBukti write FNoBukti;
    property Pokok: Double read FPokok write FPokok;
    property NoRef: String read FNoRef write FNoRef;
    property PenerimaanBarang: Double read FPenerimaanBarang write
        FPenerimaanBarang;
    property PPN: Double read FPPN write FPPN;
    property TglBukti: TDatetime read FTglBukti write FTglBukti;
    property TglGiro: Integer read FTglGiro write FTglGiro;
  end;

  TMutasiStock = class(TAppObject)
  private
    FBarang: TBarang;
    FCabang: TCabang;
    FGudang: TGudang;
    FHarga: Double;
    FKeterangan: string;
    FKonversi: Double;
    FTransaksi: string;
    FNoBukti: string;
    FPeriode: Integer;
    FQtyIn: Double;
    FQtyOut: Double;
    FTglBukti: TDatetime;
    FUOM: TUOM;
    function GetPeriode: Integer;
    procedure SetBarang(const Value: TBarang);
    procedure SetCabang(const Value: TCabang);
    procedure SetGudang(const Value: TGudang);
    procedure SetUOM(const Value: TUOM);
  public
  published
    property Barang: TBarang read FBarang write SetBarang;
    property Cabang: TCabang read FCabang write SetCabang;
    property Gudang: TGudang read FGudang write SetGudang;
    property Harga: Double read FHarga write FHarga;
    property Keterangan: string read FKeterangan write FKeterangan;
    property Konversi: Double read FKonversi write FKonversi;
    property Transaksi: string read FTransaksi write FTransaksi;
    property NoBukti: string read FNoBukti write FNoBukti;
    property Periode: Integer read GetPeriode write FPeriode;
    property QtyIn: Double read FQtyIn write FQtyIn;
    property QtyOut: Double read FQtyOut write FQtyOut;
    property TglBukti: TDatetime read FTglBukti write FTglBukti;
    property UOM: TUOM read FUOM write SetUOM;
  end;

//type
  {$TYPEINFO ON}



implementation

function TBarang.GetBarangSatuanItems: TObjectList<TBarangSatuanItem>;
begin
  if FBarangSatuanItems = nil then
    FBarangSatuanItems := TObjectList<TBarangSatuanItem>.Create(False);

  Result := FBarangSatuanItems;
end;

function TBarang.KonversiPC(AUOM : TUOM): Double;
var
  i: Integer;
begin
  Result := 0;

  for i := 0 to BarangSatuanItems.Count - 1 do
  begin
    if BarangSatuanItems[i].UOM.ID = AUOM.ID then
    begin
      Result := BarangSatuanItems[i].Konversi;
    end;

  end;
end;

function TBarangSatuanItem.GetHeaderField: string;
begin
  Result := 'Barang';
end;

procedure TBarangSatuanItem.SetHeaderProperty(AHeaderProperty : TAppObject);
begin
  Barang := TBarang(AHeaderProperty);
end;

constructor TAppObject.Create;
begin
  inherited;
  ObjectState := 1;
end;

//initialization
//  RegisterClass(TBarangSatuanItem);


constructor TAppObject.CreateID(AID: String);
begin
  Self    := inherited Create;
  Self.ID := AID;

end;

class procedure TAppObject.PokeRTTI;
begin
  // Do Nothing
end;

function TMutasiStock.GetPeriode: Integer;
begin
  FPeriode  := StrToInt(FormatDateTime('yyyyMM', TglBukti));
  Result := FPeriode;
end;

procedure TMutasiStock.SetBarang(const Value: TBarang);
begin
  FreeAndNil(FBarang);
  FBarang := Value;
end;

procedure TMutasiStock.SetCabang(const Value: TCabang);
begin
  FreeAndNil(FCabang);
  FCabang := Value;
end;

procedure TMutasiStock.SetGudang(const Value: TGudang);
begin
  FreeAndNil(FGudang);
  FGudang := Value;
end;

procedure TMutasiStock.SetUOM(const Value: TUOM);
begin
  FreeAndNil(FUOM);
  FUOM := Value;
end;

procedure TStockSekarang.SetBarang(const Value: TBarang);
begin
  FreeAndNil(FBarang);
  FBarang := Value;
end;

procedure TStockSekarang.SetCabang(const Value: TCabang);
begin
  FreeAndNil(FCabang);
  FCabang := Value;
end;

procedure TStockSekarang.SetGudang(const Value: TGudang);
begin
  FreeAndNil(FGudang);
  FGudang := Value;
end;

end.
