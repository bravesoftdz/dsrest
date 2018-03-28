unit uCetakBarcode;

interface
uses
  System.SysUtils,System.Classes, uModel, System.Generics.Collections;

type
  TCetakBarcode = class;

  TCetakBarcodeItem = class(TAppObjectItem)
  private
    FBarang: TBarang;
    FCetakBarcode: TCetakBarcode;
    FJenisLabel: string;
    FQty: Integer;
  public
    function GetHeaderField: string; override;
    procedure SetHeaderProperty(AHeaderProperty : TAppObject); override;
  published
    property Barang: TBarang read FBarang write FBarang;
    property CetakBarcode: TCetakBarcode read FCetakBarcode write FCetakBarcode;
    property JenisLabel: string read FJenisLabel write FJenisLabel;
    property Qty: Integer read FQty write FQty;
  end;

  TCetakBarcode = class(TAppObjectWithDate)
  private
    FCetakBarcodeItems: TObjectList<TCetakBarcodeItem>;
    FNoBukti: string;
    FTanggal: TDateTime;
    function GetCetakBarcodeItems: TObjectList<TCetakBarcodeItem>;
  public
  published
    property CetakBarcodeItems: TObjectList<TCetakBarcodeItem> read
        GetCetakBarcodeItems write FCetakBarcodeItems;
    property NoBukti: string read FNoBukti write FNoBukti;
    property Tanggal: TDateTime read FTanggal write FTanggal;
  end;


implementation

function TCetakBarcode.GetCetakBarcodeItems: TObjectList<TCetakBarcodeItem>;
begin
  Result := FCetakBarcodeItems;
end;

function TCetakBarcodeItem.GetHeaderField: string;
begin
  Result := 'CetakBarcode';
end;

procedure TCetakBarcodeItem.SetHeaderProperty(AHeaderProperty : TAppObject);
begin
  Self.CetakBarcode := TCetakBarcode(AHeaderProperty);
end;

initialization
  TCetakBarcode.PokeRTTI;
  TCetakBarcodeItem.PokeRTTI;

end.
