unit uTransferAntarGudang;

interface

uses
  uModel, System.SysUtils, System.Generics.Collections;

type
  TTransferAntarGudangItem = class;
  TTransferAntarGudang = class(TappObject)
  private
    FCabang: TCabang;
    FKeterangan: string;
    FNoBukti: string;
    FPetugas: string;
    FTglBukti: TDatetime;
    FTransferAntarGudang: TTransferAntarGudang;
    FTransferAntarGudangItems: Tobjectlist<TTransferAntarGudangItem>;
    FGudangAsal: tgudang;
    FGudangTujuan: tgudang;
    function GetTransferAntarGudangItems: Tobjectlist<TTransferAntarGudangItem>;
    procedure SetCabang(const Value: TCabang);
    procedure SetGudangAsal(const Value: tgudang);
    procedure SetGudangTujuan(const Value: tgudang);

  public
    destructor Destroy; override;
  published
    property Cabang: TCabang read FCabang write SetCabang;
    property Keterangan: string read FKeterangan write FKeterangan;
    property NoBukti: string read FNoBukti write FNoBukti;
    property Petugas: string read FPetugas write FPetugas;
    property TglBukti: TDatetime read FTglBukti write FTglBukti;
    property TransferAntarGudang: TTransferAntarGudang read FTransferAntarGudang
        write FTransferAntarGudang;
    property TransferAntarGudangItems: Tobjectlist<TTransferAntarGudangItem> read
        GetTransferAntarGudangItems write FTransferAntarGudangItems;
    property GudangAsal: tgudang read FGudangAsal write SetGudangAsal;
    property GudangTujuan: tgudang read FGudangTujuan write SetGudangTujuan;
  end;

  TTransferAntarGudangItem = class(TAppObjectItem)
  private
    FBarang: TBarang;
    FHarga: Double;
    FKonversi: double;
    FQty: Double;
    FTransferAntarGudang: TTransferAntarGudang;
    FUOM: TUOM;
  public
    destructor Destroy; override;
    function GetHeaderField: string; override;
    procedure SetHeaderProperty(AHeaderProperty : TAppObject); override;
  published
    property Barang: TBarang read FBarang write FBarang;
    property Harga: Double read FHarga write FHarga;
    property Konversi: double read FKonversi write FKonversi;
    property Qty: Double read FQty write FQty;
    property TransferAntarGudang: TTransferAntarGudang read FTransferAntarGudang
        write FTransferAntarGudang;
    property UOM: TUOM read FUOM write FUOM;
  end;

  TTransferAntarGudangOut = class(TTransferAntarGudang)
  end;

  TTransferAntarGudangIn = class(TTransferAntarGudang)
  end;

implementation

destructor TTransferAntarGudangItem.Destroy;
begin
  inherited;
  Barang.Free;
  UOM.Free;
end;

function TTransferAntarGudangItem.GetHeaderField: string;
begin
  Result := 'TransferAntarGudang';
end;

procedure TTransferAntarGudangItem.SetHeaderProperty(AHeaderProperty :
    TAppObject);
begin
  Self.TransferAntarGudang := TTransferAntarGudang(AHeaderProperty);
end;

destructor TTransferAntarGudang.Destroy;
begin
  inherited;
  GudangAsal.Free;
  GudangTujuan.Free;
  Cabang.Free;
end;

function TTransferAntarGudang.GetTransferAntarGudangItems:
    Tobjectlist<TTransferAntarGudangItem>;
begin
  if FTransferAntarGudangItems = nil then
    FTransferAntarGudangItems := TObjectList<TTransferAntarGudangItem>.Create(False);

  Result := FTransferAntarGudangItems;
end;

procedure TTransferAntarGudang.SetCabang(const Value: TCabang);
begin
  FreeAndNil(FCabang);
  FCabang := Value;
end;

procedure TTransferAntarGudang.SetGudangAsal(const Value: tgudang);
begin
  FreeAndNil(FGudangAsal);
  FGudangAsal := Value;
end;

procedure TTransferAntarGudang.SetGudangTujuan(const Value: tgudang);
begin
  FreeAndNil(FGudangTujuan);
  FGudangTujuan := Value;
end;

end.
