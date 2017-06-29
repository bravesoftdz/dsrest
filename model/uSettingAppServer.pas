unit uSettingAppServer;

interface

uses
  uModel, uRekBank, System.SysUtils, System.Classes;

type
  TSettingAppServer = class(TAppObject)
  private
    FRekBankCash: TRekBank;
  public
    destructor Destroy; override;
  published
    property RekBankCash: TRekBank read FRekBankCash write FRekBankCash;
  end;

implementation

destructor TSettingAppServer.Destroy;
begin
  inherited;
  FreeAndNil(FRekBankCash);
end;

end.
