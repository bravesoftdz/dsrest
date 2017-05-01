unit uTAGRequests;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uModel, System.Generics.Collections;

type
  TTAGRequestItem = class;
  TTAGRequest = class(TAppObject)
  private
    FCabang: TCabang;
    FKeterangan: string;
    FNoBukti: string;
    FPetugas: string;
    FStatus: string;
    FTAGRequestItems: tobjectlist<TTAGRequestItem>;
    FTglBukti: TDateTime;
    FToCabang: TCabang;
    function GetTAGRequestItems: tobjectlist<TTAGRequestItem>;
  public
    destructor Destroy; override;
    property Status: string read FStatus write FStatus;

  published
    property TAGRequestItems: tobjectlist<TTAGRequestItem> read GetTAGRequestItems
        write FTAGRequestItems;
    property Cabang: TCabang read FCabang write FCabang;
    property Keterangan: string read FKeterangan write FKeterangan;
    property NoBukti: string read FNoBukti write FNoBukti;
    property Petugas: string read FPetugas write FPetugas;
    property TglBukti: TDateTime read FTglBukti write FTglBukti;
    property ToCabang: TCabang read FToCabang write FToCabang;
  end;

  TTAGRequestItem = class(TAppObjectItem)
  private
    FBarang: TBarang;
    FBarangSatuangItemID: string;
    FKeterangan: string;
    FQty: Double;
    FTAGRequest: TTAGRequest;
    FUOM: TUOM;
  public
    destructor Destroy; override;
    function GetHeaderField: string; override;
    procedure SetHeaderProperty(AHeaderProperty : TAppObject); override;
    property BarangSatuangItemID: string read FBarangSatuangItemID write
        FBarangSatuangItemID;
  published
    property Barang: TBarang read FBarang write FBarang;
    property Keterangan: string read FKeterangan write FKeterangan;
    property Qty: Double read FQty write FQty;
    property TAGRequest: TTAGRequest read FTAGRequest write FTAGRequest;
    property UOM: TUOM read FUOM write FUOM;
  end;


implementation

destructor TTAGRequestItem.Destroy;
begin
  inherited;
  FreeAndNil(FBarang);
  FreeAndNil(FUOM);
end;

function TTAGRequestItem.GetHeaderField: string;
begin
  Result := 'TAGRequest';
end;

procedure TTAGRequestItem.SetHeaderProperty(AHeaderProperty : TAppObject);
begin
  Self.TAGRequest := TTAGRequest(AHeaderProperty);
end;

destructor TTAGRequest.Destroy;
var
  I: Integer;
begin
  inherited;
  FreeAndNil(FCabang);
  FreeAndNil(FToCabang);

  for I := 0 to TAGRequestItems.Count - 1 do
  begin
    TAGRequestItems[i].Free;
  end;

  FreeAndNil(FTAGRequestItems);
end;

function TTAGRequest.GetTAGRequestItems: tobjectlist<TTAGRequestItem>;
begin
  if FTAGRequestItems = nil then
    FTAGRequestItems := TObjectList<TTAGRequestItem>.Create(False);

  Result := FTAGRequestItems;
end;



end.
