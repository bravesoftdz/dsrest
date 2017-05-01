unit uTAGKirim;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs,uModel, uAppUtils, System.Generics.Collections, uTAGRequests;

type
  TTAGKirim2 = class;

  TAGTerimaItem = class(TAppObjectItem)
  private
    FBarang: TBarang;
    FHarga: Double;
    FKeterangan: string;
    FKonversi: Double;
    FQty: Double;
    FUOM: TUOM;
  public
    destructor Destroy; override;
  published
    property Barang: TBarang read FBarang write FBarang;
    property Harga: Double read FHarga write FHarga;
    property Keterangan: string read FKeterangan write FKeterangan;
    property Konversi: Double read FKonversi write FKonversi;
    property Qty: Double read FQty write FQty;
    property UOM: TUOM read FUOM write FUOM;
  end;

  TTAGKirimItem = class(TAppObjectItem)
  private
    FBarang: TBarang;
    FBarangSatuangItemID: string;
    FHarga: Double;
    FKeterangan: string;
    FKonversi: Double;
    FQty: Double;
    FTAGKirim: TTAGKirim2;
    FUOM: TUOM;
  public
    destructor Destroy; override;
    function GetHeaderField: string; override;
    procedure SetHeaderProperty(AHeaderProperty : TAppObject); override;
    property BarangSatuangItemID: string read FBarangSatuangItemID write
        FBarangSatuangItemID;
  published
    property Barang: TBarang read FBarang write FBarang;
    property Harga: Double read FHarga write FHarga;
    property Keterangan: string read FKeterangan write FKeterangan;
    property Konversi: Double read FKonversi write FKonversi;
    property Qty: Double read FQty write FQty;
    property TTAGKirim: TTAGKirim2 read FTAGKirim write FTAGKirim;
    property UOM: TUOM read FUOM write FUOM;
  end;

  TTAGKirim2 = class(TAppObject)
  private
    FTAGKirimItems: TObjectList<TTAGKirimItem>;
    FCabang: TCabang;
    FGudangAsal: TGudang;
    FGudangTujuan: TGudang;
    FKeterangan: string;
    FNoBukti: string;
    FPetugas: string;
    FTAGRequest: TTAGRequest;
    FTglBukti: TDatetime;
    FToCabang: TCabang;
    function GetTAGKirimItems: TObjectList<TTAGKirimItem>;
  public
    property GudangTujuan: TGudang read FGudangTujuan write FGudangTujuan;
  published
    property TAGKirimItems: TObjectList<TTAGKirimItem> read GetTAGKirimItems write
        FTAGKirimItems;
    property Cabang: TCabang read FCabang write FCabang;
    property GudangAsal: TGudang read FGudangAsal write FGudangAsal;
    property Keterangan: string read FKeterangan write FKeterangan;
    property NoBukti: string read FNoBukti write FNoBukti;
    property Petugas: string read FPetugas write FPetugas;
    property TAGRequest: TTAGRequest read FTAGRequest write FTAGRequest;
    property TglBukti: TDatetime read FTglBukti write FTglBukti;
    property ToCabang: TCabang read FToCabang write FToCabang;
  end;

  TTAGTerima = class(TAppObject)
  private
    FAGKirimItems: TObjectList<TAGTerimaItem>;
    FCabang: TCabang;
    FGudangAsal: TGudang;
    FGudangTujuan: TGudang;
    FKeterangan: string;
    FNoBukti: string;
    FPetugas: string;
    FTAGKirim: TTAGKirim2;
    FTAGRequest: TTAGRequest;
    FTglBukti: string;
    FToCabang: TCabang;
    function GetAGKirimItems: TObjectList<TAGTerimaItem>;
  published
    property AGKirimItems: TObjectList<TAGTerimaItem> read GetAGKirimItems
        write FAGKirimItems;
    property Cabang: TCabang read FCabang write FCabang;
    property GudangAsal: TGudang read FGudangAsal write FGudangAsal;
    property GudangTujuan: TGudang read FGudangTujuan write FGudangTujuan;
    property Keterangan: string read FKeterangan write FKeterangan;
    property NoBukti: string read FNoBukti write FNoBukti;
    property Petugas: string read FPetugas write FPetugas;
    property TTAGKirim: TTAGKirim2 read FTAGKirim write FTAGKirim;
    property TAGRequest: TTAGRequest read FTAGRequest write FTAGRequest;
    property TglBukti: string read FTglBukti write FTglBukti;
    property ToCabang: TCabang read FToCabang write FToCabang;
  end;

  TXX = class(TAppObject)
  end;


implementation

{
********************************** TTAGKirim2 ***********************************
}
function TTAGKirim2.GetTAGKirimItems: TObjectList<TTAGKirimItem>;
begin
  if FTAGKirimItems = nil then
    FTAGKirimItems := TObjectList<TTAGKirimItem>.Create(False);

  Result := FTAGKirimItems;
end;

{
********************************** TTAGTerima **********************************
}
function TTAGTerima.GetAGKirimItems: TObjectList<TAGTerimaItem>;
begin
  Result := FAGKirimItems;
end;

destructor TTAGKirimItem.Destroy;
begin
  inherited;
  FreeAndNil(FBarang);
  FreeAndNil(FUOM);
end;

function TTAGKirimItem.GetHeaderField: string;
begin
  Result := 'TTAGKirim';
end;

procedure TTAGKirimItem.SetHeaderProperty(AHeaderProperty : TAppObject);
begin
  Self.TTAGKirim := TTAGKirim2(AHeaderProperty);
end;

destructor TAGTerimaItem.Destroy;
begin
  inherited;
  FreeAndNil(FBarang);
  FreeAndNil(FUOM);
end;



end.
