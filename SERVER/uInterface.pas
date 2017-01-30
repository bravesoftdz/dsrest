unit uInterface;

interface

uses
  uModel;

type
  IBisaSimpanStock = interface(IInvokable)
  ['{4A1B1C2C-00DB-44BA-B5F7-EB004DCA0E3A}']
    function SimpanStockSekarang(AAppObject : TAppObject): Boolean; stdcall;
  end;

implementation

end.
