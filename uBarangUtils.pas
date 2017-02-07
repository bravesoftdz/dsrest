unit uBarangUtils;

interface
uses
  uDBUtils, uAppUtils, uModel, System.SysUtils, System.StrUtils;

type
  TBarangUtils = class
    public
      class function IsKodeBarangSudahAda(AKode , AID : String): Boolean;
      class function KonversiUOM(ABarangID, AUOMID : string) : Double;
  end;

implementation

class function TBarangUtils.IsKodeBarangSudahAda(AKode , AID : String): Boolean;
var
  sSQL: string;
begin
  Result := False;

  sSQL := 'select count(id)' +
          ' from tbarang where id <> ' + QuotedStr(AID) +
          ' and sku = ' + QuotedStr(AKode);

  with TDBUtils.OpenDataset(sSQL) do
  begin
    try
      if Fields[0].AsInteger > 0 then
      begin
        Result := True;
        Exit;
      end;
    finally
      Free;
    end;
  end;
end;

{ TBarangUtils }

class function TBarangUtils.KonversiUOM(ABarangID, AUOMID: string): Double;
var
  sSQL : string;
begin
  Result := 0;

  sSQL := 'select konversi from  tbarangsatuanitem '
          + ' where barang = ' + QuotedStr(ABarangID)
          + ' and uom = ' + QuotedStr(AUOMID);

  with TDBUtils.OpenDataset(sSQL) do
  begin
    try
      while not Eof do
      begin
        Result := FieldByName('Konversi').AsFloat;
        Next;
      end;
    finally
      Free;
    end;
  end;
end;

end.
