unit uJurnal;

interface

uses
  uModel, uAccount, System.Classes, System.SysUtils, System.Generics.Collections;

type
  TJurnalItem = class;

  TJurnal = class(TAppObject)
  private
    FCabang: TCabang;
    FDebet: Double;
    FIDTransaksi: string;
    FIsPosted: Integer;
    FJurnalItems: TObjectList<TJurnalItem>;
    FKeterangan: string;
    FKredit: Double;
    FNoBukti: string;
    FNoReferensi: string;
    FTglBukti: TDatetime;
    FTransaksi: string;
    function GetDebet: Double;
    function GetJurnalItems: TObjectList<TJurnalItem>;
    function GetKredit: Double;
  published
    property Cabang: TCabang read FCabang write FCabang;
    property Debet: Double read GetDebet write FDebet;
    property IDTransaksi: string read FIDTransaksi write FIDTransaksi;
    property IsPosted: Integer read FIsPosted write FIsPosted;
    property JurnalItems: TObjectList<TJurnalItem> read GetJurnalItems write
        FJurnalItems;
    property Keterangan: string read FKeterangan write FKeterangan;
    property Kredit: Double read GetKredit write FKredit;
    property NoBukti: string read FNoBukti write FNoBukti;
    property NoReferensi: string read FNoReferensi write FNoReferensi;
    property TglBukti: TDatetime read FTglBukti write FTglBukti;
    property Transaksi: string read FTransaksi write FTransaksi;
  end;

  TJurnalItem = class(TAppObjectItem)
  private
    FAccount: TAccount;
    FDebet: Double;
    FJurnal: TJurnal;
    FKeterangan: string;
    FKredit: Double;
  public
    function GetHeaderField: string; override;
    procedure SetHeaderProperty(AHeaderProperty : TAppObject); override;
  published
    property Account: TAccount read FAccount write FAccount;
    property Debet: Double read FDebet write FDebet;
    property Jurnal: TJurnal read FJurnal write FJurnal;
    property Kredit: Double read FKredit write FKredit;
    property Keterangan: string read FKeterangan write FKeterangan;
  end;

implementation

function TJurnal.GetDebet: Double;
var
  I: Integer;
begin
  FDebet := 0;

  for I := 0 to JurnalItems.Count - 1 do
  begin
    FDebet := FDebet + JurnalItems[i].Debet;
  end;

  Result := FDebet;
end;

function TJurnal.GetJurnalItems: TObjectList<TJurnalItem>;
begin
  if FJurnalItems = nil then
    FJurnalItems := TObjectList<TJurnalItem>.Create;

  Result := FJurnalItems;
end;

function TJurnal.GetKredit: Double;
var
  I: Integer;
begin
  FKredit := 0;

  for I := 0 to JurnalItems.Count - 1 do
  begin
    FKredit := FKredit + JurnalItems[i].Kredit;
  end;

  Result := FKredit;
end;

function TJurnalItem.GetHeaderField: string;
begin
  Result := 'Jurnal';
end;

procedure TJurnalItem.SetHeaderProperty(AHeaderProperty : TAppObject);
begin
  Self.Jurnal := TJurnal(AHeaderProperty);
end;

end.
