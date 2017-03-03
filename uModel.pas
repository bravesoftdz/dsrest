unit uModel;

interface

uses
  DB, Classes, SysUtils,Generics.Collections;

type
  TBarangSatuanItem = class;
  TPenerimaanBarang = class;
  TReturSupplier = class;
  
  TAppObject = class(TObject)
  private
    FID: string;
    FObjectState: Integer;
  protected
  public
    constructor Create; reintroduce;
    constructor CreateID(AID : String);

    property ID: string read FID write FID;
    property ObjectState: Integer read FObjectState write FObjectState;   // 1 Baru, 3 Edit, 5 Hapus
  end;

  TCabang = class(TAppObject)
  private
    FIsHO: Integer;
    FKode: string;
    FNama: string;
  public
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
    property Cabang: TCabang read FCabang write FCabang;
    property Kode: string read FKode write FKode;
    property Nama: string read FNama write FNama;
  end;

  TAppObjectItem = class(TAppObject)
  public
    function GetHeaderField: string; virtual; abstract;
    procedure SetHeaderProperty(AHeaderProperty : TAppObject); virtual; abstract;
  end;

  TGroupBarang = class(TAppObject)
  private
    FKode: string;
    FNama: string;
  public
    property Kode: string read FKode write FKode;
    property Nama: string read FNama write FNama;
  end;

  TSupplier = class(TAppObject)
  private
    FAlamat: string;
    FIsPembeli: Integer;
    FIsSalesman: Integer;
    FIsSupplier: Integer;
    FKode: string;
    FNama: string;
  public
    property Alamat: string read FAlamat write FAlamat;
    property IsPembeli: Integer read FIsPembeli write FIsPembeli;
    property IsSalesman: Integer read FIsSalesman write FIsSalesman;
    property IsSupplier: Integer read FIsSupplier write FIsSupplier;
    property Kode: string read FKode write FKode;
    property Nama: string read FNama write FNama;
  end;

  TUOM = class(TAppObject)
  private
    FKode: string;
  public
    property Kode: string read FKode write FKode;
  end;

  TBarang = class(TAppObject)
  private
    FBarangSatuanItems: TObjectList<TBarangSatuanItem>;
    FGroupBarang: TGroupBarang;
    FNama: string;
    FPPN: string;
    FSKU: string;
    FSatuanStock : TUOM;
    function GetBarangSatuanItems: TObjectList<TBarangSatuanItem>;
//    function GetSatuanStock: TUOM;
  public
    function KonversiPC(AUOM : TUOM): Double;
    property BarangSatuanItems: TObjectList<TBarangSatuanItem> read
        GetBarangSatuanItems write FBarangSatuanItems;
    property GroupBarang: TGroupBarang read FGroupBarang write FGroupBarang;
    property Nama: string read FNama write FNama;
    property PPN: string read FPPN write FPPN;
    property SatuanStock: TUOM read FSatuanStock write FSatuanStock;
    property SKU: string read FSKU write FSKU;
  end;

  TPenerimaanBarangItem = class(TAppObjectItem)
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

  TPenerimaanBarang = class(TAppObject)
  private
    FCabang: TCabang;
    FGudang: TGudang;
    FKeterangan: string;
    FNoBukti: string;
    FPenerimaanBarangItems: TObjectList<TPenerimaanBarangItem>;
    FPeriode: Integer;
    FSupplier: TSupplier;
    FTglBukti: TDatetime;
    function GetPenerimaanBarangItems: TObjectList<TPenerimaanBarangItem>;
    procedure SetKeterangan(const Value: string);
    procedure SetTglBukti(const Value: TDatetime);
  public
    property Cabang: TCabang read FCabang write FCabang;
    property Gudang: TGudang read FGudang write FGudang;
    property Keterangan: string read FKeterangan write SetKeterangan;
    property NoBukti: string read FNoBukti write FNoBukti;
    property PenerimaanBarangItems: TObjectList<TPenerimaanBarangItem> read
        GetPenerimaanBarangItems write FPenerimaanBarangItems;
    property Periode: Integer read FPeriode write FPeriode;
    property Supplier: TSupplier read FSupplier write FSupplier;
    property TglBukti: TDatetime read FTglBukti write SetTglBukti;
  end;


  TBarangSatuanItem = class(TAppObjectItem)
  private
    FBarang: TBarang;
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
    property Barang: TBarang read FBarang write FBarang;
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
  public
    property Barang: TBarang read FBarang write FBarang;
    property Cabang: TCabang read FCabang write FCabang;
    property Gudang: TGudang read FGudang write FGudang;
    property Qty: Double read FQty write FQty;
    property Rp: Double read FRp write FRp;
    property UOM: TUOM read FUOM write FUOM;
  end;

  TReturSupplierItem = class(TAppObjectItem)
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
    procedure SetKeterangan(const Value: string);
    procedure SetTglBukti(const Value: TDatetime);
  public
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
  public
    property Barang: TBarang read FBarang write FBarang;
    property Cabang: TCabang read FCabang write FCabang;
    property Gudang: TGudang read FGudang write FGudang;
    property Harga: Double read FHarga write FHarga;
    property Keterangan: string read FKeterangan write FKeterangan;
    property Konversi: Double read FKonversi write FKonversi;
    property Transaksi: string read FTransaksi write FTransaksi;
    property NoBukti: string read FNoBukti write FNoBukti;
    property Periode: Integer read GetPeriode write FPeriode;
    property QtyIn: Double read FQtyIn write FQtyIn;
    property QtyOut: Double read FQtyOut write FQtyOut;
    property TglBukti: TDatetime read FTglBukti write FTglBukti;
    property UOM: TUOM read FUOM write FUOM;
  end;

type
  TInvoiceSupplierItem = class(TAppObjectItem)
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

procedure TPenerimaanBarang.SetKeterangan(const Value: string);
begin
  FKeterangan := Value;
end;

procedure TPenerimaanBarang.SetTglBukti(const Value: TDatetime);
begin
  FTglBukti := Value;
  Periode   := StrToInt(FormatDateTime('YYYYMM', Value));
end;

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

//initialization
//  RegisterClass(TBarangSatuanItem);


constructor TAppObject.CreateID(AID: String);
begin
  Self    := inherited Create;
  Self.ID := AID;

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

function TReturSupplier.GetReturSupplierItems: TObjectList<TReturSupplierItem>;
begin
  if FReturSupplierItems =nil then
    FReturSupplierItems := TObjectList<TReturSupplierItem>.Create(True);

  Result := FReturSupplierItems;
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

function TMutasiStock.GetPeriode: Integer;
begin
  FPeriode  := StrToInt(FormatDateTime('yyyyMM', TglBukti));
  Result := FPeriode;
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
