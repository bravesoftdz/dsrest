unit uSupplier;

interface

uses
  uAccount, uModel;

type
  TSupplier = class(TAppObject)
  private
    FAkunHutang: TAccount;
    FAkunPiutang: TAccount;
    FAlamat: string;
    FIsPembeli: Integer;
    FIsSalesman: Integer;
    FIsSupplier: Integer;
    FKode: string;
    FNama: string;
  public
  published
    property AkunHutang: TAccount read FAkunHutang write FAkunHutang;
    property AkunPiutang: TAccount read FAkunPiutang write FAkunPiutang;
    property Alamat: string read FAlamat write FAlamat;
    property IsPembeli: Integer read FIsPembeli write FIsPembeli;
    property IsSalesman: Integer read FIsSalesman write FIsSalesman;
    property IsSupplier: Integer read FIsSupplier write FIsSupplier;
    property Kode: string read FKode write FKode;
    property Nama: string read FNama write FNama;
  end;

implementation

end.
