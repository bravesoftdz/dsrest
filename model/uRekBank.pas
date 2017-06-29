unit uRekBank;

interface

uses
  uAccount, System.SysUtils, uModel;

type
  TRekBank = class(TAppObject)
  private
    FAccount: TAccount;
    FAlamat: string;
    FBank: string;
    FNamaPemegang: string;
    FNoRek: string;
  public
    destructor Destroy; override;
  published
    property Account: TAccount read FAccount write FAccount;
    property Alamat: string read FAlamat write FAlamat;
    property Bank: string read FBank write FBank;
    property NamaPemegang: string read FNamaPemegang write FNamaPemegang;
    property NoRek: string read FNoRek write FNoRek;
  end;

implementation

destructor TRekBank.Destroy;
begin
  inherited;
  FreeAndNil(FAccount);
end;

end.
