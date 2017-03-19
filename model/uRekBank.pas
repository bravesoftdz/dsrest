unit uRekBank;

interface

uses
  uModel;

type
  TRekBank = class(TAppObject)
  private
    FAlamat: string;
    FBank: string;
    FNamaPemegang: string;
    FNoRek: string;
  published
    property Alamat: string read FAlamat write FAlamat;
    property Bank: string read FBank write FBank;
    property NamaPemegang: string read FNamaPemegang write FNamaPemegang;
    property NoRek: string read FNoRek write FNoRek;
  end;

implementation

end.
