unit uInterface;

interface

type
  IForm = interface(IInterface)
  ['{C1547A42-DB9F-48E2-BE76-D8D7DDD111C2}']
    function LoadData(AID : String): Boolean; stdcall;
  end;

implementation

end.
