unit uRekBank;

interface

uses
  uModel, uAccount;

type
  TRekBank = class(TAppObject)
  private
    FAccount: TAccount;
    FAlamat: string;
    FBank: string;
    FNamaPemegang: string;
    FNoRek: string;
  published
    property Account: TAccount read FAccount write FAccount;
    property Alamat: string read FAlamat write FAlamat;
    property Bank: string read FBank write FBank;
    property NamaPemegang: string read FNamaPemegang write FNamaPemegang;
    property NoRek: string read FNoRek write FNoRek;
  end;

implementation

end.
