unit uSettingApp;

interface

uses
  uModel, System.SysUtils;

type
  TSettingApp = class(TAppObject)
  private
    FCabang: TCabang;
    FGudangPenjualan: tgudang;
    procedure SetCabang(const Value: TCabang);
    procedure SetGudangPenjualan(const Value: tgudang);
  published
    property Cabang: TCabang read FCabang write SetCabang;
    property GudangPenjualan: tgudang read FGudangPenjualan write
        SetGudangPenjualan;
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

end.
