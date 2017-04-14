unit uTAGKirim;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs;

type
  TAGTerimaItem = class(TAppObjectItem)
  private
    FBarang: TBarang;
    FHarga: Double;
    FKeterangan: Integer;
    FKonversi: Double;
    FQty: Double;
    FUOM: TUOM;
  published
    property Barang: TBarang read FBarang write FBarang;
    property Harga: Double read FHarga write FHarga;
    property Keterangan: Integer read FKeterangan write FKeterangan;
    property Konversi: Double read FKonversi write FKonversi;
    property Qty: Double read FQty write FQty;
    property UOM: TUOM read FUOM write FUOM;
  end;

  TTAGKirimItem = class(TAppObjectItem)
  private
    FBarang: TBarang;
    FHarga: Double;
    FKeterangan: Integer;
    FKonversi: Double;
    FQty: Double;
    FUOM: TUOM;
  published
    property Barang: TBarang read FBarang write FBarang;
    property Harga: Double read FHarga write FHarga;
    property Keterangan: Integer read FKeterangan write FKeterangan;
    property Konversi: Double read FKonversi write FKonversi;
    property Qty: Double read FQty write FQty;
    property UOM: TUOM read FUOM write FUOM;
  end;

  TTAGKirim = class(TAppObject)
  private
    FAGKirimItems: TObjectList<TTAGKirimItem>;
    FCabang: TCabang;
    FGudangAsal: TGudang;
    FGudangTujuan: TGudang;
    FKeterangan: string;
    FNoBukti: string;
    FPetugas: string;
    FTAGRequest: TTAGRequest;
    FTglBukti: string;
    FToCabang: TCabang;
    function GetAGKirimItems: TObjectList<TTAGKirimItem>;
  public
    property GudangTujuan: TGudang read FGudangTujuan write FGudangTujuan;
  published
    property AGKirimItems: TObjectList<TTAGKirimItem> read GetAGKirimItems
        write FAGKirimItems;
    property Cabang: TCabang read FCabang write FCabang;
    property GudangAsal: TGudang read FGudangAsal write FGudangAsal;
    property Keterangan: string read FKeterangan write FKeterangan;
    property NoBukti: string read FNoBukti write FNoBukti;
    property Petugas: string read FPetugas write FPetugas;
    property TAGRequest: TTAGRequest read FTAGRequest write FTAGRequest;
    property TglBukti: string read FTglBukti write FTglBukti;
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
    FTAGKirim: TTAGKirim;
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
    property TAGKirim: TTAGKirim read FTAGKirim write FTAGKirim;
    property TAGRequest: TTAGRequest read FTAGRequest write FTAGRequest;
    property TglBukti: string read FTglBukti write FTglBukti;
    property ToCabang: TCabang read FToCabang write FToCabang;
  end;


implementation

{
********************************** TTAGKirim ***********************************
}
function TTAGKirim.GetAGKirimItems: TObjectList<TTAGKirimItem>;
begin
  Result := FAGKirimItems;
end;

{
********************************** TTAGTerima **********************************
}
function TTAGTerima.GetAGKirimItems: TObjectList<TAGTerimaItem>;
begin
  Result := FAGKirimItems;
end;



end.
