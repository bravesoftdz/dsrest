unit uBarangUtils;

interface
uses
  uDBUtils, uAppUtils, uModel, System.SysUtils, System.StrUtils;

type
  TBarangUtils = class
    public
      class function KonversiUOM(ABarangID, AUOMID : string) : Double;
  end;

implementation

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
