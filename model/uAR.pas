unit uAR;

interface

uses
  uModel, System.SysUtils,System.Classes;

type
  TAR = class(TAppObject)
  private
    FCabang: TCabang;
    FCustomer: TSupplier;
    FIDTransaksi: string;
    FNoBukti: string;
    FNominal: Double;
    FPembayaranTerakhir: TDatetime;
    FTerBayar: Double;
    FTransaksi: string;
    FJatuhTempo: TDateTime;
    FNoBuktiTransaksi: string;
    FTglBukti: TDatetime;
  public
    destructor Destroy; override;
  published
    property Cabang: TCabang read FCabang write FCabang;
    property Customer: TSupplier read FCustomer write FCustomer;
    property IDTransaksi: string read FIDTransaksi write FIDTransaksi;
    property NoBukti: string read FNoBukti write FNoBukti;
    property Nominal: Double read FNominal write FNominal;
    property PembayaranTerakhir: TDatetime read FPembayaranTerakhir write
        FPembayaranTerakhir;
    property TerBayar: Double read FTerBayar write FTerBayar;
    property Transaksi: string read FTransaksi write FTransaksi;
    property JatuhTempo: TDateTime read FJatuhTempo write FJatuhTempo;
    property NoBuktiTransaksi: string read FNoBuktiTransaksi write
        FNoBuktiTransaksi;
    property TglBukti: TDatetime read FTglBukti write FTglBukti;
  end;

  TAP = class(TAppObject)
  private
    FCabang: TCabang;
    FSupplier: TSupplier;
    FIDTransaksi: string;
    FNoBukti: string;
    FNominal: Double;
    FPembayaranTerakhir: TDatetime;
    FTerBayar: Double;
    FTransaksi: string;
    FJatuhTempo: TDateTime;
    FNoBuktiTransaksi: string;
    FTglBukti: TDatetime;
  public
    destructor Destroy; override;
  published
    property Cabang: TCabang read FCabang write FCabang;
    property Supplier: TSupplier read FSupplier write FSupplier;
    property IDTransaksi: string read FIDTransaksi write FIDTransaksi;
    property NoBukti: string read FNoBukti write FNoBukti;
    property Nominal: Double read FNominal write FNominal;
    property PembayaranTerakhir: TDatetime read FPembayaranTerakhir write
        FPembayaranTerakhir;
    property TerBayar: Double read FTerBayar write FTerBayar;
    property Transaksi: string read FTransaksi write FTransaksi;
    property JatuhTempo: TDateTime read FJatuhTempo write FJatuhTempo;
    property NoBuktiTransaksi: string read FNoBuktiTransaksi write
        FNoBuktiTransaksi;
    property TglBukti: TDatetime read FTglBukti write FTglBukti;
  end;

implementation

destructor TAR.Destroy;
begin
  inherited;
  FreeAndNil(FCabang);
  FreeAndNil(FCustomer);
end;

destructor TAP.Destroy;
begin
  inherited;
  FreeAndNil(FCabang);
  FreeAndNil(FSupplier);
end;

end.
