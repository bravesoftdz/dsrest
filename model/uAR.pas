unit uAR;

interface

uses
  uModel;

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
  public
  published
    property Cabang: TCabang read FCabang write FCabang;
    property Customer: TSupplier read FCustomer write FCustomer;
    property NoBukti: string read FNoBukti write FNoBukti;
    property Nominal: Double read FNominal write FNominal;
    property PembayaranTerakhir: TDatetime read FPembayaranTerakhir write
        FPembayaranTerakhir;
    property TerBayar: Double read FTerBayar write FTerBayar;
    property Transaksi: string read FTransaksi write FTransaksi;
  end;

implementation

end.
