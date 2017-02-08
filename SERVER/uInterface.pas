unit uInterface;

interface

uses
  uModel;

type
  IBisaSimpanStock = interface(IInvokable)
  ['{4A1B1C2C-00DB-44BA-B5F7-EB004DCA0E3A}']
    function SimpanStockSekarang(AAppObject : TAppObject; AIsMenghapus : Boolean =
        False): Boolean; stdcall;
    function SimpanMutasiStock(AAppObject : TAppObject): Boolean; stdcall;
    function HapusMutasi(ANoBukti : String): Boolean; stdcall;
  end;

implementation

end.
