unit uAccount;

interface
uses
  uModel, System.SysUtils,System.Classes;

type
  TAccount = class(TAppObject)
  private
    FIsAkunTransaksi: Integer;
    FKelompok: Integer;
    FKode: string;
    FNama: string;
    FParent: TAccount;
  published
    property IsAkunTransaksi: Integer read FIsAkunTransaksi write FIsAkunTransaksi;
    property Kelompok: Integer read FKelompok write FKelompok;
    property Kode: string read FKode write FKode;
    property Nama: string read FNama write FNama;
    property Parent: TAccount read FParent write FParent;
  end;

implementation

end.
