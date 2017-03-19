unit uAR;

interface

uses
  uModel, System.SysUtils,System.Classes;

type
  TAR = class(TAppObject)
  private
    FCabang: TCabang;
    FCustomer: TSupplier;
    FNoBukti: string;
    FNominal: Double;
    FPembayaranTerakhir: TDatetime;
    FTerBayar: Double;
    FTransaksi: string;
    FJatuhTempo: TDateTime;
  public
    destructor Destroy; override;
  published
    property Cabang: TCabang read FCabang write FCabang;
    property Customer: TSupplier read FCustomer write FCustomer;
    property NoBukti: string read FNoBukti write FNoBukti;
    property Nominal: Double read FNominal write FNominal;
    property PembayaranTerakhir: TDatetime read FPembayaranTerakhir write
        FPembayaranTerakhir;
    property TerBayar: Double read FTerBayar write FTerBayar;
    property Transaksi: string read FTransaksi write FTransaksi;
    property JatuhTempo: TDateTime read FJatuhTempo write FJatuhTempo;
  end;

implementation

destructor TAR.Destroy;
begin
  inherited;
  FreeAndNil(FCabang);
  FreeAndNil(FCustomer);
end;

end.
