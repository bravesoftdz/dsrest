unit ServerMethodsUnit;

interface

uses
  SysUtils, Classes, DSServer, uModel, Windows, uDBUtils, Generics.Collections,
  DBXJSON, DBClient, DB, rtti, uInterface;

type
  {$METHODINFO ON}

  TServerLaporan = class(TInterfacedPersistent)
  public
    function RetriveMutasiBarang(ATglAwal , ATglAtglAkhir : TDateTime) : TDataset;

  end;
  TCRUD = class(TInterfacedPersistent)
  private
  protected
    function AfterDelete(AAppObject : TAppObject): Boolean; virtual;
    function AfterSave(AOBject : TAppObject): Boolean; virtual;
    function BeforeDelete(AAppObject : TAppObject): Boolean; virtual;
    function BeforeSave(AOBject : TAppObject): Boolean; virtual;
    function GetTableName: string; virtual;
    function SaveNoCommit(AOBject : TAppObject): Boolean; virtual;
  public
    function Delete(AAppObject : TAppObject): Boolean; virtual;
    function RetrieveCDS(AAppObject : TAppObject): TDataSet; virtual;
    function RetrieveCDSJSON: TJSONArray;
    function Save(AOBject : TAppObject): Boolean; virtual;
  end;

  TServerMaster = class(TCRUD)
  protected
    function AfterDelete(AAppObject : TAppObject): Boolean; override;
    function AfterSave(AOBject : TAppObject): Boolean; override;
  end;

  TServerTransaction = class(TCRUD)
  public
    function GenerateNoBukti(ATglBukti : TdateTime; APrefix : String): string;
  end;

  TServerMethods1 = class(TComponent)
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function GetUOM: TUOM;
    function Hitung : Integer;

    function ReverseString(Value: string): string;
    function SaveUOM(AUOM : TUOM): Boolean;

  end;

  TServerUOM = class(TComponent)
  public
    function Retrieve(AID : String): TUOM;
    function RetrieveKode(AKode : String): TUOM;
  end;

  TServerSupplier = class(TServerMaster)
  protected
  public
    function Retrieve(AID : String): TSupplier;
  end;

  TServerBarang = class(TServerMaster)
  protected
  public
    function Retrieve(AID : String): TBarang;
  end;

type
  TServerGroupBarang = class(TCRUD)
  protected
  public
    function Retrieve(AID : String): TGroupBarang;
  end;

  TServerPenerimaanBarang = class(TServerTransaction, IBisaSimpanStock)
  private
    function SimpanStockSekarang(AAppObject : TAppObject): Boolean; stdcall;
  protected
    function AfterSave(AOBject : TAppObject): Boolean; override;
    function BeforeSave(AOBject : TAppObject): Boolean; override;
  public
    function Retrieve(AID : String): TPenerimaanBarang;
    function RetrieveNoBukti(ANoBukti : String): TPenerimaanBarang;
  end;

  TServerCabang = class(TServerMaster)
  protected
  public
    function Retrieve(AID : String): TCabang;
  end;

  TServerLogAppObject = class(TCRUD)
  protected
  public
    function Retrieve(AID : String): TLogAppObject;
  end;

  TServerUtils = class(TComponent)
  public
    function CheckKoneksi: Boolean;
  end;

  TServerStockSekarang = class(TCRUD)
  public
    function Retrieve(ABarang : TBarang): TStockSekarang;
  end;

  TServerReturSupplier = class(TServerTransaction, IBisaSimpanStock)
  private
    function SimpanStockSekarang(AAppObject : TAppObject): Boolean; stdcall;
  protected
    function AfterSave(AOBject : TAppObject): Boolean; override;
    function BeforeSave(AOBject : TAppObject): Boolean; override;
  public
    function Retrieve(AID : String): TReturSupplier;
    function RetrieveNoBukti(ANoBukti : String): TReturSupplier;
  end;

  TServerClosingInventory = class(TCRUD)
  private
  public
    function Close(APeriode : Integer): Boolean;
  end;





{$METHODINFO OFF}

implementation


uses StrUtils, Provider,uAppUtils, System.DateUtils;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.GetUOM: TUOM;
begin
  Result    := TUOM.Create;
  Result.ID := TDBUtils.GetNextIDGUIDToString

//  Result.Kode := 'Kode : ' + IntToStr(Result.ID);
//  Result.Nama := 'Nama : ' + IntToStr(Result.ID);

end;

function TServerMethods1.Hitung : Integer;
begin
  Result := 120;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := StrUtils.ReverseString(Value);
end;

function TServerMethods1.SaveUOM(AUOM : TUOM): Boolean;
var
  Nama: string;
begin
  Result := True;
  Nama := AUOM.Kode;
end;

function TServerUOM.Retrieve(AID : String): TUOM;
begin
  Result := TUOM.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;

function TServerUOM.RetrieveKode(AKode : String): TUOM;
var
  sSQL: string;
begin
  sSQL := 'select id from tuom where UOM = ' + QuotedStr(AKode);

  with TDBUtils.OpenDataset(sSQL) do
  begin
    try
      Result := Retrieve(FieldByName('id').AsString);
    finally
      Free;
    end;
  end;

end;

function TServerSupplier.Retrieve(AID : String): TSupplier;
begin
  Result      := TSupplier.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;

function TCRUD.AfterDelete(AAppObject : TAppObject): Boolean;
begin
  Result := True;
end;

function TCRUD.BeforeDelete(AAppObject : TAppObject): Boolean;
begin
  Result := True;
end;

function TCRUD.Delete(AAppObject : TAppObject): Boolean;
var
  sSQL: string;
begin
  Result := False;

  ADConnection.StartTransaction;
  try
    if not BeforeDelete(AAppObject) then
      Exit;

    sSQL := TDBUtils.GenerateSQLDelete(AAppObject, AAppObject.ID);

    if not TDBUtils.ExecuteSQL(sSQL) > 0 then
      Exit;

    if AfterDelete(AAppObject) then
    begin
      ADConnection.Commit;
      Result := True;
    end;
  finally
    ADConnection.Rollback;
  end;


end;

function TCRUD.RetrieveCDS(AAppObject : TAppObject): TDataSet;
var
  lcds: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select * from ' + AAppObject.ClassName;

  lcds   := TDBUtils.OpenDataset(sSQL);
//  lcds.MergeChangeLog;
  Result := lcds;
end;

function TCRUD.Save(AOBject : TAppObject): Boolean;
begin
  Result := False;

  ADConnection.StartTransaction;

  try
    if not BeforeSave(AOBject) then
      Exit;

    if not TDBUtils.ExecuteSQL(TDBUtils.GenerateSQL(AOBject)) > 0 then
      Exit;

    if AfterSave(AOBject) then
    begin
      ADConnection.Commit;
      Result := True;
    end;
  finally
    ADConnection.Rollback;
  end;

end;

function TCRUD.BeforeSave(AOBject : TAppObject): Boolean;
begin
  Result := True;
end;

function TCRUD.AfterSave(AOBject : TAppObject): Boolean;
begin
  Result := True;
end;

function TCRUD.GetTableName: string;
begin
  Result := StringReplace(Self.ClassName,'Server','', [rfIgnoreCase]);
end;

function TCRUD.RetrieveCDSJSON: TJSONArray;
var
  I: Integer;
  jRecord: TJSONObject;
begin
  Result := TJSONArray.Create; ;

  with TDBUtils.OpenDataset('select* from tbarang') do
  begin
    try
      while not Eof do
      begin
        jRecord := TJSONObject.Create;
        for I := 0 to FieldCount - 1 do
        jRecord.AddPair(
        Fields[I].FieldName,TJSONString.Create (Fields[I].AsString));
        Result.AddElement(jRecord);

        Next;
      end;
    finally
      Free;
    end;
  end;
end;

function TCRUD.SaveNoCommit(AOBject : TAppObject): Boolean;
begin
  Result := False;

  if not BeforeSave(AOBject) then
    Exit;

  if not TDBUtils.ExecuteSQL(TDBUtils.GenerateSQL(AOBject)) > 0 then
    Exit;

  if AfterSave(AOBject) then
  begin
    Result := True;
  end;

end;

function TServerBarang.Retrieve(AID : String): TBarang;
begin
  Result      := TBarang.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;

function TServerGroupBarang.Retrieve(AID : String): TGroupBarang;
begin
  Result      := TGroupBarang.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;

function TServerPenerimaanBarang.AfterSave(AOBject : TAppObject): Boolean;
begin
  Result := SimpanStockSekarang(AOBject);
end;

function TServerPenerimaanBarang.BeforeSave(AOBject : TAppObject): Boolean;
var
  i: Integer;
  lPBLama: TPenerimaanBarang;
begin
  Result := False;

  lPBLama := Retrieve(AOBject.ID);
  try
    if AOBject.ObjectState <> 1 then
    begin
      for i := 0 to lPBLama.PenerimaanBarangItems.Count - 1 do
      begin
        lPBLama.PenerimaanBarangItems[i].Qty := -1 * lPBLama.PenerimaanBarangItems[i].Qty;
      end;

      if NOT SimpanStockSekarang(lPBLama) then
        Exit;
    end;
  finally
    lPBLama.Free;
  end;

  
  Result := True;

end;

function TServerPenerimaanBarang.Retrieve(AID : String): TPenerimaanBarang;
begin
  Result := TPenerimaanBarang.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;

function TServerPenerimaanBarang.RetrieveNoBukti(ANoBukti : String):
    TPenerimaanBarang;
var
  sID: string;
  sSQL: string;
begin
  sSQL := 'select * from ' + GetTableName
          + ' where nobukti = ' + QuotedStr(ANoBukti);

  with TDBUtils.OpenDataset(sSQL) do
  begin
    try
      sID := FieldByName('ID').AsString;
      Result := Retrieve(sID);
    finally
      Free;
    end;
  end;


end;

function TServerPenerimaanBarang.SimpanStockSekarang(AAppObject : TAppObject):
    Boolean;
var
  dKonversi: Double;
  i: Integer;
  lPB: TPenerimaanBarang;
  lStockSekarang: TStockSekarang;
begin
  Result := False;

  with TServerStockSekarang.Create do
  begin
    try
      lPB := TPenerimaanBarang(AAppObject);
      for i := 0 to lPB.PenerimaanBarangItems.Count - 1 do
      begin
        lStockSekarang           := Retrieve(lPB.PenerimaanBarangItems[i].Barang);
        lStockSekarang.Cabang    := TCabang.Create;
        lStockSekarang.Cabang.ID := lPB.Cabang.ID;
//        dKonversi                := lPB.PenerimaanBarangItems[i].Konversi;

        with TServerBarang.Create do
        begin
          try
            lStockSekarang.Barang    := Retrieve(lPB.PenerimaanBarangItems[i].Barang.ID);
            dKonversi                := lStockSekarang.Barang.KonversiPC(lPB.PenerimaanBarangItems[i].UOM);

          finally
            Free;
          end;
        end;

        lStockSekarang.Qty       := lStockSekarang.Qty + (lPB.PenerimaanBarangItems[i].Qty * dKonversi);
        lStockSekarang.Rp        := lStockSekarang.Rp  + (lPB.PenerimaanBarangItems[i].Qty * lPB.PenerimaanBarangItems[i].HargaSetelahDiskon);
        lStockSekarang.UOM       := TUOM.Create;
        lStockSekarang.UOM.ID    := lStockSekarang.Barang.SatuanStock.ID;

        Result := SaveNoCommit(lStockSekarang);
      end;
    finally
      Free;
    end;
  end;


end;

function TServerTransaction.GenerateNoBukti(ATglBukti : TdateTime; APrefix :
    String): string;
var
  iCounter: Integer;
  sSQL: string;
begin
  Result := APrefix + '/' + FormatDateTime('yyyyMM/', ATglBukti);

  iCounter := 0;

  sSQL := 'select max(nobukti) as NoBukti from ' + GetTableName
          + ' where nobukti like ' + QuotedStr(Result + '%');

  with TDBUtils.OpenDataset(sSQL) do
  begin
    try
      if not IsEmpty then
      begin
        iCounter := StrToIntDef(RightStr(FieldByName('nobukti').AsString,4), 0);
      end;

      iCounter := iCounter + 1;

      Result := Result + TAppUtils.TambahkanKarakterNol(iCounter,4);
    finally
      Free;
    end;
  end;
end;

function TServerCabang.Retrieve(AID : String): TCabang;
begin
  Result      := TCabang.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;

function TServerMaster.AfterDelete(AAppObject : TAppObject): Boolean;
var
  lLogAppObject: TLogAppObject;
  sSQL: string;
begin

  Result := False;

  sSQL := 'select * from TCabang where kode <> ''HO''';
  with TDBUtils.OpenDataset(sSQL) do
  begin
    while not Eof do
    begin
      lLogAppObject           := TLogAppObject.Create;
      lLogAppObject.NamaKelas := AAppObject.ClassName;
      lLogAppObject.Cabang    := TCabang.Create;
      lLogAppObject.Cabang.ID := FieldByName('ID').AsString;
      lLogAppObject.IDTrans   := AAppObject.ID;
      lLogAppObject.Operasi   := '5';
      lLogAppObject.Tanggal   := Now;


      with TServerLogAppObject.Create do
      begin
        try
          if not SaveNoCommit(lLogAppObject) then
            Exit;
        finally
          lLogAppObject.Free;
          Free;
        end;
      end;

      Next;
    end;
  end;

  Result := True;
end;

function TServerMaster.AfterSave(AOBject : TAppObject): Boolean;
//var
//  lLogAppObject: TLogAppObject;
//  sSQL: string;
begin
//  Result := False;
//
//  sSQL := 'select * from TCabang where kode <> ''HO''';
//  with TDBUtils.OpenDataset(sSQL) do
//  begin
//    while not Eof do
//    begin
//      lLogAppObject           := TLogAppObject.Create;
//      lLogAppObject.NamaKelas := AOBject.ClassName;
//      lLogAppObject.Cabang    := TCabang.Create;
//      lLogAppObject.Cabang.ID := FieldByName('ID').AsString;
//      lLogAppObject.IDTrans   := AOBject.ID;
//      lLogAppObject.Operasi   := IntToStr(AOBject.ObjectState);
//      lLogAppObject.Tanggal   := Now;
//
//
//      with TServerLogAppObject.Create do
//      begin
//        try
//          if not SaveNoCommit(lLogAppObject) then
//            Exit;
//        finally
//          Free;
//        end;
//      end;
//
//      Next;
//    end;
//  end;

  Result := True;
end;

function TServerLogAppObject.Retrieve(AID : String): TLogAppObject;
begin
  Result      := TLogAppObject.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;

function TServerUtils.CheckKoneksi: Boolean;
begin
  Result := True;
end;

function TServerStockSekarang.Retrieve(ABarang : TBarang): TStockSekarang;
var
  sID: string;
  sSQL: string;
begin
  Result := TStockSekarang.Create;

  if ABarang = nil then
    Exit;

  sSQL := 'select id from ' + TStockSekarang.ClassName
          + ' where barang = ' + QuotedStr(ABarang.ID);
  with TDBUtils.OpenDataset(sSQL) do
  begin
    try
      sID := FieldByName('ID').AsString;
      TDBUtils.LoadFromDB(Result, sID);
    finally
      Free;
    end;
  end;
end;

{ TLaporan }

function TServerLaporan.RetriveMutasiBarang(ATglAwal,
  ATglAtglAkhir: TDateTime): TDataset;
var
  sSQL : String;
begin
  if DayOf(ATglAwal) <> 1 then
    raise Exception.Create('Periode laporan harus dimulai dari awal bulan');

  sSQL := 'select cabang , barang , nama , sum(saldoawal) as saldoawal,' +
          ' sum(penerimaan) as penerimaan , sum(retursupplier) as retursupplier,' +
          ' sum(penjualan) as penjualan , sum(returcustomer) as returcustomer,' +
          ' sum(koreksiplus) as koreksiplus, sum(koreksiminus) as koreksiminus,' +
          ' sum(saldoakhir) as saldoakhir' +
          ' from proc_mutasi_barang_per_transaksi(' + TAppUtils.QuotD(ATglAwal) + ',' +
            TAppUtils.QuotDt(EndOfTheDay(ATglAtglAkhir)) + ')' +
          ' group by cabang , barang , nama';

  Result   := TDBUtils.OpenDataset(sSQL);
end;

function TServerReturSupplier.AfterSave(AOBject : TAppObject): Boolean;
begin
  Result := SimpanStockSekarang(AOBject);

end;

function TServerReturSupplier.BeforeSave(AOBject : TAppObject): Boolean;
var
  i: Integer;
  lRSupLama: TReturSupplier;
begin
  Result := False;

  lRSupLama := Retrieve(AOBject.ID);
  try
    if AOBject.ObjectState <> 1 then
    begin
      for i := 0 to lRSupLama.ReturSupplierItems.Count - 1 do
      begin
        lRSupLama.ReturSupplierItems[i].Qty := lRSupLama.ReturSupplierItems[i].Qty;
      end;

      if NOT SimpanStockSekarang(lRSupLama) then
        Exit;
    end;
  finally
    lRSupLama.Free;
  end;


  Result := True;

end;

function TServerReturSupplier.Retrieve(AID : String): TReturSupplier;
begin
  Result := TReturSupplier.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;

function TServerReturSupplier.RetrieveNoBukti(ANoBukti : String):
    TReturSupplier;
var
  sID: string;
  sSQL: string;
begin
  sSQL := 'select * from ' + GetTableName
          + ' where nobukti = ' + QuotedStr(ANoBukti);

  with TDBUtils.OpenDataset(sSQL) do
  begin
    try
      sID := FieldByName('ID').AsString;
      Result := Retrieve(sID);
    finally
      Free;
    end;
  end;


end;

function TServerReturSupplier.SimpanStockSekarang(AAppObject : TAppObject):
    Boolean;
var
  dKonversi: Double;
  i: Integer;
  lRSup: TReturSupplier;
  lStockSekarang: TStockSekarang;
begin
  Result := False;

  with TServerStockSekarang.Create do
  begin
    try
     lRSup := TReturSupplier(AAppObject);
      for i := 0 to lRSup.ReturSupplierItems.Count - 1 do
      begin
        lStockSekarang           := Retrieve(lRSup.ReturSupplierItems[i].Barang);
        lStockSekarang.Cabang    := TCabang.Create;
        lStockSekarang.Cabang.ID := lRSup.Cabang.ID;
//        dKonversi                := lRSup.ReturSupplierItems[i].Konversi;

        with TServerBarang.Create do
        begin
          try
            lStockSekarang.Barang    := Retrieve(lRSup.ReturSupplierItems[i].Barang.ID);
            dKonversi                := lStockSekarang.Barang.KonversiPC(lRSup.ReturSupplierItems[i].UOM);

          finally
            Free;
          end;
        end;

        lStockSekarang.Qty       := lStockSekarang.Qty - (lRSup.ReturSupplierItems[i].Qty * dKonversi);
        lStockSekarang.Rp        := lStockSekarang.Rp  - (lRSup.ReturSupplierItems[i].Qty *lRSup.ReturSupplierItems[i].HargaSetelahDiskon);
        lStockSekarang.UOM       := TUOM.Create;
        lStockSekarang.UOM.ID    := lStockSekarang.Barang.SatuanStock.ID;

        Result := SaveNoCommit(lStockSekarang);
      end;
    finally
      Free;
    end;
  end;


end;

function TServerClosingInventory.Close(APeriode : Integer): Boolean;
begin
//  Result := False;



  Result := True;
end;

end.

