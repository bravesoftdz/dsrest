unit uMukafaah;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics,
  Controls, Forms, Dialogs, uModel,uPengurus,
  System.Generics.Collections;

type
  TMukafaahItem = class;
  TMukafaah = class(TAppObject)
  private
    FBulan: Integer;
    FMukafaahItems: TObjectList<TMukafaahItem>;
    FNoBukti: string;
    FTahun: Integer;
    FTglBukti: TDateTime;
  published
    property Bulan: Integer read FBulan write FBulan;
    property MukafaahItems: TObjectList<TMukafaahItem> read FMukafaahItems
        write FMukafaahItems;
    property NoBukti: string read FNoBukti write FNoBukti;
    property Tahun: Integer read FTahun write FTahun;
    property TglBukti: TDateTime read FTglBukti write FTglBukti;
  end;

  TMukafaahItem = class(TAppObjectItem)
  private
    FJabatan: string;
    FJamDiniyah: Double;
    FJamHifdh: Double;
    FPengurus: TPengurus;
    FPokok: Double;
    FTunjanganJabatan: Double;
    FTunjanganTransport: Double;
  public
    property Pengurus: TPengurus read FPengurus write FPengurus;
  published
    property Jabatan: string read FJabatan write FJabatan;
    property JamDiniyah: Double read FJamDiniyah write FJamDiniyah;
    property JamHifdh: Double read FJamHifdh write FJamHifdh;
    property Pokok: Double read FPokok write FPokok;
    property TunjanganJabatan: Double read FTunjanganJabatan write
        FTunjanganJabatan;
    property TunjanganTransport: Double read FTunjanganTransport write
        FTunjanganTransport;
  end;


implementation



end.
