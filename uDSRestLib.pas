unit uDSRestLib;


interface
uses
  uAppUtils;

const
  _PANJANG_NOBUKTI_ANGKA : Integer = 10;

type
  TDSRestLib = class(TObject)
  public
    class function FormatNoBukti(APrefix : String; ACounter : Integer): string;
  end;

implementation

class function TDSRestLib.FormatNoBukti(APrefix : String; ACounter : Integer):
    string;
begin
  Result := APrefix + '.' + TAppUtils.TambahkanKarakterNol(ACounter, _PANJANG_NOBUKTI_ANGKA);
end;

end.
