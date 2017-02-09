unit ServerMethodsUnit;

interface

uses
  SysUtils, Classes, DSServer, uModel, Windows, uDBUtils, Generics.Collections,
  DBXJSON, DBClient, DB, rtti, uInterface;

type
  {$METHODINFO ON}

  TServerLaporan = class(TInterfacedPersistent)
  public
    function LaporanStockSekarang(ACabang : TCabang): TDataset;
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
    function RetrieveKode(AKode : String): TBarang;
  end;

type
  TServerGroupBarang = class(TCRUD)
  protected
  public
    function Retrieve(AID : String): TGroupBarang;
  end;

  TServerPenerimaanBarang = class(TServerTransaction, IBisaSimpanStock)
  strict private
    function HapusMutasi(ANoBukti : String): Boolean; stdcall;
  private
    function SimpanMutasiStock(AAppObject : TAppObject): Boolean; stdcall;
    function SimpanStockSekarang(AAppObject : TAppObject; AIsMenghapus : Boolean =
        False): Boolean; stdcall;
  protected
    function AfterSave(AOBject : TAppObject): Boolean; override;
    function AfterDelete(AOBject : TAppObject): Boolean; override;
    function BeforeSave(AOBject : TAppObject): Boolean; override;
  public
    function Retrieve(AID : String): TPenerimaanBarang;
    function RetrieveCDSlip(AID : String): TDataset;
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
    function HapusMutasi(ANoBukti : String): Boolean;
    function Retrieve(ABarang : TBarang): TStockSekarang;
  end;

  TServerReturSupplier = class(TServerTransaction, IBisaSimpanStock)
  strict private
    function HapusMutasi(ANoBukti : String): Boolean; stdcall;
    function SimpanMutasiStock(AAppObject : TAppObject): Boolean; stdcall;
  private
    function SimpanStockSekarang(AAppObject : TAppObject; AIsMenghapus : Boolean =
        False): Boolean; stdcall;
  protected
    function AfterDelete(AOBject : TAppObject): Boolean; override;
    function AfterSave(AOBject : TAppObject): Boolean; override;
    function BeforeSave(AOBject : TAppObject): Boolean; override;
  public
    function Retrieve(AID : String): TReturSupplier;
    function RetrieveNoBukti(ANoBukti : String): TReturSupplier;
  end;

  TServerClosingInventory = class(TCRUD)
  private
//    function ClosingPenerimaan(APeriode: Integer): Boolean;
  public
    function Close(APeriode : Integer; ACabang : TCabang): Boolean;
  end;

  TServerPembayaranSupplier = class(TCRUD)
  public
    function Retrieve(AID : String): TPembayaranSupplier;
    function RetrieveCDS2: TDataset;
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

function TServerBarang.RetrieveKode(AKode : String): TBarang;
var
  sSQL: string;
begin
  Result      := TBarang.Create;

  sSQL := 'select id from tbarang where sku = ' + QuotedStr(AKode);
  with TDBUtils.OpenDataset(sSQL) do
  begin
    try
      if not IsEmpty then
        TDBUtils.LoadFromDB(Result, FieldByName('id').AsString);
    finally
      Free;
    end;
  end;
end;

function TServerGroupBarang.Retrieve(AID : String): TGroupBarang;
begin
  Result      := TGroupBarang.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;

function TServerPenerimaanBarang.AfterSave(AOBject : TAppObject): Boolean;
begin
  Result := False;

  if SimpanStockSekarang(AOBject) then
    if SimpanMutasiStock(AOBject) then
      Result := True;
end;

function TServerPenerimaanBarang.AfterDelete(AOBject : TAppObject): Boolean;
begin
  Result := False;

  if SimpanStockSekarang(AOBject, True) then
  begin
    if HapusMutasi(TPenerimaanBarang(AOBject).NoBukti) then
      Result := True;
  end;
end;

function TServerPenerimaanBarang.BeforeSave(AOBject : TAppObject): Boolean;
var
  lPBLama: TPenerimaanBarang;
begin
  Result := False;

  lPBLama := Retrieve(AOBject.ID);
  try
    if AOBject.ObjectState <> 1 then
    begin
      if NOT SimpanStockSekarang(lPBLama, True) then
        Exit;
    end;
  finally
    lPBLama.Free;
  end;

  
  Result := True;

end;

function TServerPenerimaanBarang.HapusMutasi(ANoBukti : String): Boolean;
begin
  Result := False;

  with TServerStockSekarang.Create do
  begin
    try
      if not HapusMutasi(ANoBukti) then
        Exit;
    finally
      Free;
    end;
  end;
  Result := True;
end;

function TServerPenerimaanBarang.Retrieve(AID : String): TPenerimaanBarang;
begin
  Result := TPenerimaanBarang.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;

function TServerPenerimaanBarang.RetrieveCDSlip(AID : String): TDataset;
var
  sSQL: string;
begin
  sSQL   := 'select a.nobukti, a.tglbukti, f.nama as supplier, a.keterangan,' +
            ' e.nama as cabang, c.sku, c.nama as Barang, d.uom as uom,' +
            ' b.hargabeli, b.qty, b.diskon, b.ppn, b.konversi' +
            ' from tpenerimaanbarang a' +
            ' INNER JOIN tpenerimaanbarangitem b on a.id = b.penerimaanbarang' +
            ' INNER JOIN tbarang c on b.barang = c.id' +
            ' INNER JOIN tuom d on b.uom = d.id' +
            ' INNER JOIN tcabang e on a.cabang = e.id' +
            ' INNER JOIN tsupplier f on a.supplier = f.id ' +
            ' where a.id = ' + QuotedStr(AID);

  Result := TDBUtils.OpenDataset(sSQL);
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

function TServerPenerimaanBarang.SimpanMutasiStock(AAppObject : TAppObject):
    Boolean;
var
  i: Integer;
  lMutasiStock: TMutasiStock;
  lPB: TPenerimaanBarang;
begin
  Result := False;

  lPB := TPenerimaanBarang(AAppObject);
  if not HapusMutasi(lPB.NoBukti) then
    Exit;

  with TServerStockSekarang.Create do
  begin
    try
      for i := 0 to lPB.PenerimaanBarangItems.Count - 1 do
      begin
        lMutasiStock            := TMutasiStock.Create;
        lMutasiStock.Barang     := TBarang.CreateID(lPB.PenerimaanBarangItems[i].Barang.ID);
        lMutasiStock.Cabang     := TCabang.CreateID(lPB.Cabang.ID);
        lMutasiStock.UOM        := TUOM.CreateID(lPB.PenerimaanBarangItems[i].UOM.ID);
        lMutasiStock.Harga      := lPB.PenerimaanBarangItems[i].HargaBeli;
        lMutasiStock.QtyIn      := lPB.PenerimaanBarangItems[i].Qty;
        lMutasiStock.QtyOut     := 0;
        lMutasiStock.Keterangan := lPB.NoBukti;
        lMutasiStock.NoBukti    := lPB.NoBukti;
        lMutasiStock.Transaksi  := 'Penerimaan Barang';
        lMutasiStock.TglBukti   := lPB.TglBukti;
        lMutasiStock.Konversi   := lPB.PenerimaanBarangItems[i].Konversi;

        if not SaveNoCommit(lMutasiStock) then
          Exit;
      end;
    finally
      Free;
    end;
  end;

  Result := True;
end;

function TServerPenerimaanBarang.SimpanStockSekarang(AAppObject : TAppObject;
    AIsMenghapus : Boolean = False): Boolean;
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

      if AIsMenghapus then
      begin
        for i := 0 to lPB.PenerimaanBarangItems.Count - 1 do
        begin
          lPB.PenerimaanBarangItems[i].Qty := -1 * lPB.PenerimaanBarangItems[i].Qty;
        end;
      end;

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
      lLogAppObject.NamaKelas := AOBject.ClassName;
      lLogAppObject.Cabang    := TCabang.Create;
      lLogAppObject.Cabang.ID := FieldByName('ID').AsString;
      lLogAppObject.IDTrans   := AOBject.ID;
      lLogAppObject.Operasi   := IntToStr(AOBject.ObjectState);
      lLogAppObject.Tanggal   := Now;


      with TServerLogAppObject.Create do
      begin
        try
          if not SaveNoCommit(lLogAppObject) then
            Exit;
        finally
          Free;
        end;
      end;

      Next;
    end;
  end;

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

function TServerStockSekarang.HapusMutasi(ANoBukti : String): Boolean;
var
  sSQL: string;
begin
  sSQL   := 'delete from tmutasistock' +
            ' where nobukti = ' + QuotedStr(ANoBukti);

  try
    TDBUtils.ExecuteSQL(sSQL);
    Result := True;
  except
    Result := False;
  end;

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

function TServerLaporan.LaporanStockSekarang(ACabang : TCabang): TDataset;
var
  sSQL: string;
begin
  sSQL := 'select b.sku, b.nama, c.uom , d.nama as cabang, a.qty, a.rp' +
          ' from tstocksekarang a' +
          ' INNER JOIN tbarang b on a.barang = b.id' +
          ' INNER JOIN tuom c on a.uom = c.id' +
          ' INNER JOIN tcabang d on a.cabang = d.id' ;
//          ' order b.sku, b.nama'
//          ;

  if ACabang <> nil then
    sSQL := sSQL + ' where a.cabang = ' + QuotedStr(ACabang.Id);

  sSQL := sSQL + ' order by b.sku';

  Result := TDBUtils.OpenDataset(sSQL);
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
          ' group by cabang , barang , nama' +
          ' order by barang, nama';

  Result   := TDBUtils.OpenDataset(sSQL);
end;

function TServerReturSupplier.AfterDelete(AOBject : TAppObject): Boolean;
begin
  Result := False;

  if SimpanStockSekarang(AOBject, True) then
  begin
    if HapusMutasi(TPenerimaanBarang(AOBject).NoBukti) then
      Result := True;
  end;
end;

function TServerReturSupplier.AfterSave(AOBject : TAppObject): Boolean;
begin
  Result := False;

  if SimpanStockSekarang(AOBject) then
    if SimpanMutasiStock(AOBject) then
      Result := True;

end;

function TServerReturSupplier.BeforeSave(AOBject : TAppObject): Boolean;
var
  lRSupLama: TReturSupplier;
begin
  Result := False;

  lRSupLama := Retrieve(AOBject.ID);
  try
    if AOBject.ObjectState <> 1 then
    begin
       if NOT SimpanStockSekarang(lRSupLama, True) then
        Exit;
    end;
  finally
    lRSupLama.Free;
  end;


  Result := True;

end;

function TServerReturSupplier.HapusMutasi(ANoBukti : String): Boolean;
begin
  Result := False;

  with TServerStockSekarang.Create do
  begin
    try
      if not HapusMutasi(ANoBukti) then
        Exit;
    finally
      Free;
    end;
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

function TServerReturSupplier.SimpanMutasiStock(AAppObject : TAppObject):
    Boolean;
var
  i: Integer;
  lMutasiStock: TMutasiStock;
  lRS: TReturSupplier;
begin
  Result := False;

  lRS := TReturSupplier(AAppObject);
  if not HapusMutasi(lRS.NoBukti) then
    Exit;

  with TServerStockSekarang.Create do
  begin
    try
      for i := 0 to lRS.ReturSupplierItems.Count - 1 do
      begin
        lMutasiStock            := TMutasiStock.Create;
        lMutasiStock.Barang     := TBarang.CreateID(lRS.ReturSupplierItems[i].Barang.ID);
        lMutasiStock.Cabang     := TCabang.CreateID(lRS.Cabang.ID);
        lMutasiStock.UOM        := TUOM.CreateID(lRS.ReturSupplierItems[i].UOM.ID);
        lMutasiStock.Harga      := lRS.ReturSupplierItems[i].HargaBeli;
        lMutasiStock.QtyIn      := 0;
        lMutasiStock.QtyOut     := lRS.ReturSupplierItems[i].Qty;
        lMutasiStock.Keterangan := lRS.NoBukti;
        lMutasiStock.NoBukti    := lRS.NoBukti;
        lMutasiStock.Transaksi  := 'Retur Supplier';
        lMutasiStock.TglBukti   := lRS.TglBukti;
        lMutasiStock.Konversi   := lRS.ReturSupplierItems[i].Konversi;

        if not SaveNoCommit(lMutasiStock) then
          Exit;
      end;
    finally
      Free;
    end;
  end;

  Result := True;end;

function TServerReturSupplier.SimpanStockSekarang(AAppObject : TAppObject;
    AIsMenghapus : Boolean = False): Boolean;
var
  dKonversi: Double;
  i: Integer;
  lRSup: TReturSupplier;
  lStockSekarang: TStockSekarang;
begin
  Result := False;

  lRSup := TReturSupplier(AAppObject);
  if AIsMenghapus then
  begin
    for i := 0 to lRSup.ReturSupplierItems.Count - 1 do
    begin
      lRSup.ReturSupplierItems[i].Qty := -1 * lRSup.ReturSupplierItems[i].Qty;
    end;
  end;

  with TServerStockSekarang.Create do
  begin
    try
      for i := 0 to lRSup.ReturSupplierItems.Count - 1 do
      begin
        lStockSekarang           := Retrieve(lRSup.ReturSupplierItems[i].Barang);
        lStockSekarang.Cabang    := TCabang.Create;
        lStockSekarang.Cabang.ID := lRSup.Cabang.ID;

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

function TServerClosingInventory.Close(APeriode : Integer; ACabang : TCabang):
    Boolean;
var
  lCDS: TClientDataSet;
  lClosingInventory: TClosingInventory;
  lServerClosingInventory: TServerClosingInventory;
  sSQL: string;
begin
  Result := False;

  sSQL   := 'select barang, uom, sum(qty) as qty, sum(rp) as rp from (' +
            ' select barang,uom,qty,rp from tclosinginventory' +
            ' where periode = ' + IntToStr(TAppUtils.DecPeriode(APeriode)) +
            ' and cabang = ' + QuotedStr(ACabang.ID) +
            ' union all' +
            ' select c.id as barang,d.id as uom,' +
            '     sum(b.qty * b.konversi) as Qty,' +
            '     sum(b.qty * b.hargabeli) as Rp' +
            '     from tpenerimaanbarang a' +
            '     inner join tpenerimaanbarangitem b on a.id = b.penerimaanbarang' +
            '     inner join tbarang c on b.barang = c.id' +
            '     inner join tuom d on c.satuanstock = d.id' +
            '     left join tcabang e on a.cabang = e.id' +
            '     where a.periode = ' + IntToStr(APeriode) +
            '     and cabang =' + QuotedStr(ACabang.ID) +
            '     group by c.id,d.id' +
            '     union all' +
            '     select c.id,d.id,' +
            '     sum(-1 * b.qty * b.konversi),' +
            '     sum(-1 * b.qty * b.hargabeli)' +
            '     from tretursupplier a' +
            '     inner join tretursupplieritem b on a.id = b.retursupplier' +
            '     inner join tbarang c on b.barang = c.id' +
            '     inner join tuom d on c.satuanstock = d.id' +
            '     left join tcabang e on a.cabang = e.id' +
            '     where a.periode = ' + IntToStr(APeriode) +
            '     and cabang =' + QuotedStr(ACabang.ID) +
            '     group by c.id,d.id' +
            '    ) mutasi' +
            '    group by barang, uom';

  lCDS := TDBUtils.OpenDataset(sSQL);
  lServerClosingInventory := TServerClosingInventory.Create;
  ADConnection.StartTransaction;
  try
    while not lCDS.Eof do
    begin
      lClosingInventory := TClosingInventory.Create;
      try
        lClosingInventory.Barang := TBarang.CreateID(lCDS.FieldByName('barang').AsString);
        lClosingInventory.Cabang := TCabang.CreateID(ACabang.ID);
        lClosingInventory.UOM    := TUOM.CreateID(lCDS.FieldByName('uom').AsString);
        lClosingInventory.Qty    := lCDS.FieldByName('qty').AsFloat;
        lClosingInventory.Rp     := lCDS.FieldByName('rp').AsFloat;

        if not lServerClosingInventory.SaveNoCommit(lClosingInventory) then
        begin
          ADConnection.Rollback;
          Exit;
        end;
      finally
        lClosingInventory.Free;
      end;

      lCDS.Next;
    end;

    ADConnection.Commit;

  finally
    ADConnection.Rollback;
    lCDS.Free;
    lServerClosingInventory.Free;
  end;

  Result := True;
end;

function TServerPembayaranSupplier.Retrieve(AID : String): TPembayaranSupplier;
begin
  Result      := TPembayaranSupplier.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;

function TServerPembayaranSupplier.RetrieveCDS2: TDataset;
var
  sSQL: string;
begin
  sSQL := 'select a.nobukti, a.tglbukti,b.nobukti as Penerimaan, a.pokok, a.ppn' +
          ' , a.biaya, (a.pokok + a.ppn + a.biaya) as Total' +
          ' from tpembayaransupplier a ' +
          ' INNER JOIN tpenerimaanbarang b on a.penerimaanbarang = b.id' +
          ' ORDER BY a.tglbukti DESC';

  Result := TDBUtils.OpenDataset(sSQL);
end;


end.

