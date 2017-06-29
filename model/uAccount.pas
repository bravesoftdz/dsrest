unit uAccount;

interface
uses
  System.SysUtils,System.Classes, uModel;

type
  TAccount = class(TAppObject)
  private
    FIsAkunTransaksi: Integer;
    FKelompok: string;
    FKode: string;
    FNama: string;
    FParent: TAccount;
  public
    destructor Destroy; override;
  published
    property IsAkunTransaksi: Integer read FIsAkunTransaksi write FIsAkunTransaksi;
    property Kelompok: string read FKelompok write FKelompok;
    property Kode: string read FKode write FKode;
    property Nama: string read FNama write FNama;
    property Parent: TAccount read FParent write FParent;
  end;

implementation

destructor TAccount.Destroy;
begin
  inherited;
  FParent.Free;
end;

end.
