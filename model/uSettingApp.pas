unit uSettingApp;

interface

uses
  uModel, System.SysUtils, uUser, uAccount, uRekBank;

type
  TSettingApp = class(TAppObject)
  private
    FKasPOS: TRekBank;
    FCabang: TCabang;
    FGudangPenjualan: tgudang;
    FGudangTransit: tgudang;
    FMaxBelanjaSantri: Double;
    procedure SetCabang(const Value: TCabang);
    procedure SetGudangPenjualan(const Value: tgudang);
    procedure SetGudangTransit(const Value: tgudang);
  published
    property KasPOS: TRekBank read FKasPOS write FKasPOS;
    property Cabang: TCabang read FCabang write SetCabang;
    property GudangPenjualan: tgudang read FGudangPenjualan write
        SetGudangPenjualan;
    property GudangTransit: tgudang read FGudangTransit write SetGudangTransit;
    property MaxBelanjaSantri: Double read FMaxBelanjaSantri write
        FMaxBelanjaSantri;
  end;

var
  UserApplikasi : TUser;
implementation

procedure TSettingApp.SetCabang(const Value: TCabang);
begin
  FreeAndNil(FCabang);
  FCabang := Value;
end;

procedure TSettingApp.SetGudangPenjualan(const Value: tgudang);
begin
  FreeAndNil(FGudangPenjualan);
  FGudangPenjualan := Value;
end;

procedure TSettingApp.SetGudangTransit(const Value: tgudang);
begin
  FreeAndNil(FGudangTransit);
  FGudangTransit := Value;
end;

end.
