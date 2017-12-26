unit uSettingApp;

interface

uses
  uModel, System.SysUtils;

type
  TSettingApp = class(TAppObject)
  private
    FCabang: TCabang;
    FGudangPenjualan: tgudang;
    FGudangTransit: tgudang;
    FMaxBelanjaSantri: Double;
    procedure SetCabang(const Value: TCabang);
    procedure SetGudangPenjualan(const Value: tgudang);
    procedure SetGudangTransit(const Value: tgudang);
  published
    property Cabang: TCabang read FCabang write SetCabang;
    property GudangPenjualan: tgudang read FGudangPenjualan write
        SetGudangPenjualan;
    property GudangTransit: tgudang read FGudangTransit write SetGudangTransit;
    property MaxBelanjaSantri: Double read FMaxBelanjaSantri write
        FMaxBelanjaSantri;
  end;

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
