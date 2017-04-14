unit uSettingApp;

interface

uses
  uModel, System.SysUtils;

type
  TSettingApp = class(TAppObject)
  private
    FCabang: TCabang;
    FGudangAsalTAGTerima: tgudang;
    FGudangPenjualan: tgudang;
    FGudangTujuanTAGKirim: tgudang;
    procedure SetCabang(const Value: TCabang);
    procedure SetGudangAsalTAGTerima(const Value: tgudang);
    procedure SetGudangPenjualan(const Value: tgudang);
    procedure SetGudangTujuanTAGKirim(const Value: tgudang);
  published
    property Cabang: TCabang read FCabang write SetCabang;
    property GudangAsalTAGTerima: tgudang read FGudangAsalTAGTerima write
        SetGudangAsalTAGTerima;
    property GudangPenjualan: tgudang read FGudangPenjualan write
        SetGudangPenjualan;
    property GudangTujuanTAGKirim: tgudang read FGudangTujuanTAGKirim write
        SetGudangTujuanTAGKirim;
  end;

implementation

procedure TSettingApp.SetCabang(const Value: TCabang);
begin
  FreeAndNil(FCabang);
  FCabang := Value;
end;

procedure TSettingApp.SetGudangAsalTAGTerima(const Value: tgudang);
begin
  FreeAndNil(FGudangAsalTAGTerima);
  FGudangAsalTAGTerima := Value;
end;

procedure TSettingApp.SetGudangPenjualan(const Value: tgudang);
begin
  FreeAndNil(FGudangPenjualan);
  FGudangPenjualan := Value;
end;

procedure TSettingApp.SetGudangTujuanTAGKirim(const Value: tgudang);
begin
  FreeAndNil(FGudangTujuanTAGKirim);
  FGudangTujuanTAGKirim := Value;
end;

end.
