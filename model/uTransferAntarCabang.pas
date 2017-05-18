unit uTransferAntarCabang;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs,uModel, uAppUtils, System.Generics.Collections, uTAGRequests;

type
  TTransferAntarCabangKirim = class;
  TTransferAntarCabangTerima = class;

  TTransferAntarCabangTerimaItem = class(TAppObjectItem)
  private
    FBarang: TBarang;
    FBarangSatuangItemID: string;
    FHarga: Double;
    FKeterangan: string;
    FKonversi: Double;
    FQtyTerima: Double;
    FTransferAntarCabangTerima: TTransferAntarCabangTerima;
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
    property QtyTerima: Double read FQtyTerima write FQtyTerima;
    property TransferAntarCabangTerima: TTransferAntarCabangTerima read
        FTransferAntarCabangTerima write FTransferAntarCabangTerima;
    property UOM: TUOM read FUOM write FUOM;
  end;

  TTransferAntarCabangKirimItem = class(TAppObjectItem)
  private
    FBarang: TBarang;
    FBarangSatuangItemID: string;
    FHarga: Double;
    FKeterangan: string;
    FKonversi: Double;
    FQtyKirim: Double;
    FQtyRequest: Double;
    FTransferAntarCabangKirim: TTransferAntarCabangKirim;
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
    property QtyKirim: Double read FQtyKirim write FQtyKirim;
    property QtyRequest: Double read FQtyRequest write FQtyRequest;
    property TransferAntarCabangKirim: TTransferAntarCabangKirim read
        FTransferAntarCabangKirim write FTransferAntarCabangKirim;
    property UOM: TUOM read FUOM write FUOM;
  end;

  TTransferAntarCabangKirim = class(TAppObject)
  private
    FTransferAntarCabangKirimItems: TObjectList<TTransferAntarCabangKirimItem>;
    FCabang: TCabang;
    FGudangAsal: TGudang;
    FGudangTujuan: TGudang;
    FKeterangan: string;
    FNoBukti: string;
    FPetugas: string;
    FTAGRequest: TTAGRequest;
    FTglBukti: TDatetime;
    FToCabang: TCabang;
    function GetTransferAntarCabangKirimItems:
        TObjectList<TTransferAntarCabangKirimItem>;
  public
  published
    property TransferAntarCabangKirimItems:
        TObjectList<TTransferAntarCabangKirimItem> read
        GetTransferAntarCabangKirimItems write FTransferAntarCabangKirimItems;
    property Cabang: TCabang read FCabang write FCabang;
    property GudangAsal: TGudang read FGudangAsal write FGudangAsal;
    property GudangTujuan: TGudang read FGudangTujuan write FGudangTujuan;
    property Keterangan: string read FKeterangan write FKeterangan;
    property NoBukti: string read FNoBukti write FNoBukti;
    property Petugas: string read FPetugas write FPetugas;
    property TAGRequest: TTAGRequest read FTAGRequest write FTAGRequest;
    property TglBukti: TDatetime read FTglBukti write FTglBukti;
    property ToCabang: TCabang read FToCabang write FToCabang;
  end;

  TTransferAntarCabangTerima = class(TAppObject)
  private
    FTransferAntarCabangTerimaItems: TObjectList<TTransferAntarCabangTerimaItem>;
    FCabang: TCabang;
    FGudangAsal: TGudang;
    FGudang: TGudang;
    FKeterangan: string;
    FNoBukti: string;
    FPetugas: string;
    FTransferAntarCabangKirim: TTransferAntarCabangKirim;
    FTglBukti: string;
    FFromCabang: TCabang;
    function GetTransferAntarCabangTerimaItems:
        TObjectList<TTransferAntarCabangTerimaItem>;
  published
    property TransferAntarCabangTerimaItems:
        TObjectList<TTransferAntarCabangTerimaItem> read
        GetTransferAntarCabangTerimaItems write FTransferAntarCabangTerimaItems;
    property Cabang: TCabang read FCabang write FCabang;
    property GudangAsal: TGudang read FGudangAsal write FGudangAsal;
    property Gudang: TGudang read FGudang write FGudang;
    property Keterangan: string read FKeterangan write FKeterangan;
    property NoBukti: string read FNoBukti write FNoBukti;
    property Petugas: string read FPetugas write FPetugas;
    property TransferAntarCabangKirim: TTransferAntarCabangKirim read
        FTransferAntarCabangKirim write FTransferAntarCabangKirim;
    property TglBukti: string read FTglBukti write FTglBukti;
    property FromCabang: TCabang read FFromCabang write FFromCabang;
  end;


implementation

{
********************************** TTransferAntarCabangKirim ***********************************
}
function TTransferAntarCabangKirim.GetTransferAntarCabangKirimItems:
    TObjectList<TTransferAntarCabangKirimItem>;
begin
  if FTransferAntarCabangKirimItems = nil then
    FTransferAntarCabangKirimItems := TObjectList<TTransferAntarCabangKirimItem>.Create(False);

  Result := FTransferAntarCabangKirimItems;
end;

{
********************************** TTransferAntarCabangTerima **********************************
}
function TTransferAntarCabangTerima.GetTransferAntarCabangTerimaItems:
    TObjectList<TTransferAntarCabangTerimaItem>;
begin
  if FTransferAntarCabangTerimaItems = nil then
    FTransferAntarCabangTerimaItems := TObjectList<TTransferAntarCabangTerimaItem>.Create();

  Result := FTransferAntarCabangTerimaItems;
end;

destructor TTransferAntarCabangKirimItem.Destroy;
begin
  inherited;
  FreeAndNil(FBarang);
  FreeAndNil(FUOM);
end;

function TTransferAntarCabangKirimItem.GetHeaderField: string;
begin
  Result := 'TransferAntarCabangKirim';
end;

procedure TTransferAntarCabangKirimItem.SetHeaderProperty(AHeaderProperty : TAppObject);
begin
  Self.TransferAntarCabangKirim := TTransferAntarCabangKirim(AHeaderProperty);
end;

destructor TTransferAntarCabangTerimaItem.Destroy;
begin
  inherited;
  FreeAndNil(FBarang);
  FreeAndNil(FUOM);
end;

function TTransferAntarCabangTerimaItem.GetHeaderField: string;
begin
  Result := 'TransferAntarCabangTerima';
end;

procedure TTransferAntarCabangTerimaItem.SetHeaderProperty(AHeaderProperty :
    TAppObject);
begin
  Self.TransferAntarCabangTerima := TTransferAntarCabangTerima(AHeaderProperty);
end;



end.
