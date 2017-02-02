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
    FKode: string;
    FNama: string;
  public
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
    FKode: string;
    FNama: string;
  public
    property Alamat: string read FAlamat write FAlamat;
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
    FQty: Double;
    FRp: Double;
    FUOM: TUOM;
  public
    property Barang: TBarang read FBarang write FBarang;
    property Cabang: TCabang read FCabang write FCabang;
    property Qty: Double read FQty write FQty;
    property Rp: Double read FRp write FRp;
    property UOM: TUOM read FUOM write FUOM;
  end;

  TReturSupplierItem = class(TAppObjectItem)
  private
    FBarang: TBarang;
    FDiskon: Double;
    FHargaAVG: Double;
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
    property HargaAVG: Double read FHargaAVG write FHargaAVG;
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
    FKeterangan: string;
    FNoBukti: string;
    FPeriode: Integer;
    FReturSupplierItems: TObjectList<TReturSupplierItem>;
    FSupplier: TSupplier;
    FTglBukti: TDatetime;
    function GetReturSupplierItems: TObjectList<TReturSupplierItem>;
    procedure SetKeterangan(const Value: string);
    procedure SetTglBukti(const Value: TDatetime);
  public
    property Cabang: TCabang read FCabang write FCabang;
    property Keterangan: string read FKeterangan write SetKeterangan;
    property NoBukti: string read FNoBukti write FNoBukti;
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

end.
