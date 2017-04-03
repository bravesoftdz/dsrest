unit ServerMethodsUnit;

interface

uses
  SysUtils, Classes, DSServer, uModel, Windows, uDBUtils, Generics.Collections,
  DBXJSON, DBClient, DB, rtti, uInterface, uPenjualan,
  uCustomerInvoice, uAR, uPenerimaanKas, uAccount, uRekBank,
  uTransferAntarGudang, uSettingApp;

type
  {$METHODINFO ON}

//  TServerAR = class;
  TServerLaporan = class(TInterfacedPersistent)
  public
    function DS_OverviewAccount: TDataset;
    function LaporanKartok(ATglAwal , ATglAkhir : TDateTime; ABarang : TBarang;
        AGudang : TGudang; ACabang : TCabang): TDataset;
    function LaporanStockSekarang(ACabang : TCabang): TDataset;
    function LookUpPenerimaan(ABulan, ATahun : Integer): TDataset;
    function RetriveMutasiBarang(ATglAwal , ATglAtglAkhir : TDateTime) : TDataset;
    function RetrivePenjualan(ATglAwal , ATglAtglAkhir : TDateTime; ACabang :
        TCabang): TDataset;
    function RetriveCI(ATglAwal , ATglAtglAkhir : TDateTime; ACabang : TCabang):
        TDataset;
    function RetrivePenerimaanKas(ATglAwal , ATglAtglAkhir : TDateTime; ACabang :
        TCabang): TDataset;
    function RetriveAR(ASupplier : TSupplier): TDataset;
    function RetriveSettingApp(ACabang : TCabang): TDataset;

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
//    function RetrieveCDSJSON: TJSONArray;
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
    function Retrieve(ABarang : TBarang; AGudang : TGudang): TStockSekarang;
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

  TServerGudang = class(TServerMaster)
  public
    function Retrieve(AID : String): TGudang;
    function RetrieveKode(AKode : String): TGudang;
  end;

  TServerPenjualan = class(TServerTransaction, IBisaSimpanStock)
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
    function Retrieve(AID : String): TPenjualan;
    function RetrieveNoBukti(ANoBukti : String): TPenjualan;
    function RetrieveCDSlip(ATglAwal , ATglAtglAkhir : TDateTime; ACabang :
        TCabang; ANoBukti : String): TDataset;

  end;

  TServerAR = class(TServerTransaction)
  public
    function Retrieve(AID : String): TAR;
    function RetrieveCDSlip(AID : String): TDataset;
    function RetrieveNoBukti(ANoBukti : String): TAR;
  end;

  TServerCustomerInvoice = class(TServerTransaction)
  private
    FServerAR: TServerAR;
    FServerPenjualan: TServerPenjualan;
    function GetServerAR: TServerAR;
    function GetServerPenjualan: TServerPenjualan;
    property ServerAR: TServerAR read GetServerAR write FServerAR;
    property ServerPenjualan: TServerPenjualan read GetServerPenjualan write
        FServerPenjualan;
  public
    destructor Destroy; override;
    function AfterSave(AAppObject : TAppObject): Boolean; override;
    function BeforeSave(AAppObject : TAppObject): Boolean; override;
    function Retrieve(AID : String): TCustomerInvoice;
    function RetrieveCDSlip(AID : String): TDataset;
    function RetrieveNoBukti(ANoBukti : String): TCustomerInvoice;
  end;

  TServerBarangSatuanItem = class(TCRUD)
  private
    function RetirveBySKUUOM(ASKU : TBarang; AUOM : TUOM): TBarangSatuanItem;
  end;

  TServerPenerimaanKas = class(TServerTransaction)
  private
    FServerAR: TServerAR;
    function GetServerAR: TServerAR;
    property ServerAR: TServerAR read GetServerAR write FServerAR;
  protected
  public
    destructor Destroy; override;
    function AfterSave(AAppObject : TAppObject): Boolean; override;
    function AfterDelete(AAppObject : TAppObject): Boolean; override;
    function BeforeSave(AAppObject : TAppObject): Boolean; override;
    function Retrieve(AID : String): TPenerimaanKas;
    function RetrievePenerimaanARs(AID : String): TDataSet;
    function RetrieveCDSlip(ATglAwal , ATglAtglAkhir : TDateTime; ACabang :
        TCabang; ANoBukti : String): TDataset;
    function RetrieveNoBukti(ANoBukti : String): TPenerimaanKas;
  end;

type
  TServerAccount = class(TServerMaster)
  protected
  public
    function Retrieve(AID : String): TAccount;
  end;

type
  TServerRekBank = class(TServerMaster)
  protected
  public
    function Retrieve(AID : String): TRekBank;
  end;

type
  TServerTransferAntarGudang = class(TServerTransaction, IBisaSimpanStock)
  strict private
    function HapusMutasi(ANoBukti : String): Boolean; stdcall;
    function SimpanMutasiStock(AAppObject : TAppObject): Boolean; stdcall;
  private
    function SimpanStockSekarang(AAppObject : TAppObject; AIsMenghapus : Boolean =
        False): Boolean; stdcall;
    function SimpanStockSekarangOut(AAppObject : TAppObject; AIsMenghapus : Boolean
        = False): Boolean; stdcall;
    function SimpanStockSekarangIn(AAppObject : TAppObject; AIsMenghapus : Boolean
        = False): Boolean; stdcall;
  protected
    function AfterDelete(AOBject : TAppObject): Boolean; override;
    function AfterSave(AOBject : TAppObject): Boolean; override;
    function BeforeSave(AOBject : TAppObject): Boolean; override;
  public
    function Retrieve(AID : String): TTransferAntarGudang;
    function RetrieveNoBukti(ANoBukti : String): TTransferAntarGudang;
    function SaveTransferAntarGudang(ATransferAntarGudang : TTransferAntarGudang):
        Boolean;
  end;

  TServerSettingApp = class(TCRUD)
  public
    function Retrieve(AID : String): TSettingApp;
    function RetrieveByCabang(ACabangID : String): TSettingApp;
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

//function TCRUD.RetrieveCDSJSON: TJSONArray;
//var
//  I: Integer;
//  jRecord: TJSONObject;
//begin
//  Result := TJSONArray.Create; ;
//
//  with TDBUtils.OpenDataset('select* from tbarang') do
//  begin
//    try
//      while not Eof do
//      begin
//        jRecord := TJSONObject.Create;
//        for I := 0 to FieldCount - 1 do
//        jRecord.AddPair(
//        Fields[I].FieldName,TJSONString.Create (Fields[I].AsString));
//        Result.AddElement(jRecord);
//
//        Next;
//      end;
//    finally
//      Free;
//    end;
//  end;
//end;

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
        lMutasiStock.Gudang     := TGudang.CreateID(lPB.Gudang.ID);

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
        lStockSekarang           := Retrieve(lPB.PenerimaanBarangItems[i].Barang, lPB.Gudang);
        lStockSekarang.Cabang    := TCabang.CreateID(lPB.Cabang.ID);
        lStockSekarang.Gudang    := TGudang.CreateID(lPB.Gudang.ID);
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
        lStockSekarang.UOM       := TUOM.CreateID(lStockSekarang.Barang.SatuanStock.ID);

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

function TServerStockSekarang.Retrieve(ABarang : TBarang; AGudang : TGudang):
    TStockSekarang;
var
  sID: string;
  sSQL: string;
begin
  Result := TStockSekarang.Create;

  if ABarang = nil then
    Exit;

  sSQL := 'select id from ' + TStockSekarang.ClassName
          + ' where barang = ' + QuotedStr(ABarang.ID)
          + ' and gudang = ' + QuotedStr(AGudang.ID);

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

function TServerLaporan.DS_OverviewAccount: TDataset;
var
  sSQL: string;
begin
  sSQL := 'select cast(a.kode || ' + QuotedStr(' - ') + ' || a.nama as character varying(120))  as KodeNama, a.kode,a.nama,a.isakuntransaksi,a.kelompok,' +
          ' b.Kode as KodeParent, b.Nama as NamaParent, a.id, a.parent' +
          ' from TAccount a ' +
          ' left outer join Taccount b on a.parent = b.id' +
          ' order by kode ';

  Result := TDBUtils.OpenQuery(sSQL);

end;

function TServerLaporan.LaporanKartok(ATglAwal , ATglAkhir : TDateTime; ABarang
    : TBarang; AGudang : TGudang; ACabang : TCabang): TDataset;
var
  sSQL: string;
begin
  sSQL := 'select 1 as Urutan, cast(' + TAppUtils.QuotD(StartOfTheMonth(ATglAwal)) + ' as date) as TglBukti,' +
          QuotedStr('Saldo Awal') + ' as NoBukti, b.Nama as Cabang, c.Nama as Gudang,' +
          ' d.nama as Barang,  0 as Qtyout, qty as qtyin, e.uom, 1 as konversi,' +
          ' a.rp as harga, e.uom as satuanstock,' +
          QuotedStr('Saldo Awal') + ' as Transaksi ' +
          ' from tclosinginventory a' +
          ' inner join tcabang b on a.cabang =b.id' +
          ' inner join tgudang c on a.gudang = c.id' +
          ' inner join tbarang d on a.barang = d.id' +
          ' inner join tuom e on a.uom = e.id' +
          ' where periode = ' + FormatDateTime('yyyyMM', StartOfTheMonth(ATglAwal)) +
          ' and a.barang = ' + QuotedStr(ABarang.ID);

  if AGudang <> nil then
    sSQL := sSQL + ' and a.gudang = ' + QuotedStr(AGudang.ID);

  if ACabang <> nil then
    sSQL := sSQL + ' and a.cabang = ' + QuotedStr(ACabang.ID);

  sSQL := sSQL + ' union all ' +
                 ' select 2,a.Tglbukti, a.NoBukti, b.Nama as Cabang, c.Nama as Gudang, d.nama as Barang,  a.qtyout, a.qtyin, e.uom, a.konversi, a.harga,' +
                 ' f.uom as satuanstock, a.Transaksi' +
                 ' from tmutasistock a' +
                 ' inner join tcabang b on a.cabang =b.id' +
                 ' inner join tgudang c on a.gudang = c.id' +
                 ' inner join tbarang d on a.barang = d.id' +
                 ' inner join tuom e on a.uom = e.id' +
                 ' left join tuom f on d.satuanstock = f.id' +
                 ' where a.tglbukti <= ' + TAppUtils.QuotDt(EndOfTheDay(ATglAkhir)) +
                 ' and a.tglbukti >= ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal));

  if AGudang <> nil then
    sSQL := sSQL + ' and a.gudang = ' + QuotedStr(AGudang.ID);

  if ACabang <> nil then
    sSQL := sSQL + ' and a.cabang = ' + QuotedStr(ACabang.ID);

  sSQL := sSQL + ' order by 1 ,2,3 ';

  Result := TDBUtils.OpenDataset(sSQL);
end;

function TServerLaporan.LaporanStockSekarang(ACabang : TCabang): TDataset;
var
  sSQL: string;
begin
  sSQL := 'select e.nama as gudang, b.sku, b.nama, c.uom , d.nama as cabang, a.qty, a.rp' +
          ' from tstocksekarang a' +
          ' INNER JOIN tbarang b on a.barang = b.id' +
          ' INNER JOIN tuom c on a.uom = c.id' +
          ' INNER JOIN tcabang d on a.cabang = d.id' +
          ' INNER JOIN tgudang e on a.gudang = e.id'
          ;
//          ' order b.sku, b.nama'
//          ;

  if ACabang <> nil then
    sSQL := sSQL + ' where a.cabang = ' + QuotedStr(ACabang.Id);

  sSQL := sSQL + ' order by e.nama,  b.sku';

  Result := TDBUtils.OpenDataset(sSQL);
end;

function TServerLaporan.LookUpPenerimaan(ABulan, ATahun : Integer): TDataset;
var
  sSQL: string;
begin
  sSQL   := 'SELECT * FROM VLOOKUP_PENERIMAAN_BARANG' +
            ' WHERE extract(month from TGLBUKTI) = ' + IntToStr(ABulan) +
            ' AND extract(YEAR from TGLBUKTI) = ' + IntToStr(ATahun);

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

  sSQL := 'select cabang ,gudang, barang , nama , sum(saldoawal) as saldoawal,' +
          ' sum(penerimaan) as penerimaan , sum(retursupplier) as retursupplier,' +
          ' sum(penjualan) as penjualan , sum(returcustomer) as returcustomer,' +
          ' sum(koreksiplus) as koreksiplus, sum(koreksiminus) as koreksiminus,' +
          ' sum(saldoakhir) as saldoakhir' +
          ' from proc_mutasi_barang_per_transaksi(' + TAppUtils.QuotD(ATglAwal) + ',' +
            TAppUtils.QuotDt(EndOfTheDay(ATglAtglAkhir)) + ')' +
          ' group by cabang ,gudang, barang , nama' +
          ' order by barang, nama';

  Result   := TDBUtils.OpenDataset(sSQL);
end;

{ TLaporan }

function TServerLaporan.RetrivePenjualan(ATglAwal , ATglAtglAkhir : TDateTime;
    ACabang : TCabang): TDataset;
var
  sSQL : String;
begin
  sSQL := 'select * from vpenjualan a' +
          ' where a.tglbukti between ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal))+
          ' and ' + TAppUtils.QuotDt(EndOfTheDay(ATglAtglAkhir));

  if ACabang <> nil then
    sSQL := sSQL + ' and a.cabangid = ' + QuotedStr(ACabang.ID);

  Result   := TDBUtils.OpenDataset(sSQL);
end;

{ TLaporan }

function TServerLaporan.RetriveCI(ATglAwal , ATglAtglAkhir : TDateTime; ACabang
    : TCabang): TDataset;
var
  sSQL : String;
begin
  sSQL := 'SELECT * FROM vdaftar_customer_invoice A' +
          ' where a.tglbukti between ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal))+
          ' and ' + TAppUtils.QuotDt(EndOfTheDay(ATglAtglAkhir));

  if ACabang <> nil then
    sSQL := sSQL + ' and a.cabangID = ' + QuotedStr(ACabang.ID);

  Result   := TDBUtils.OpenDataset(sSQL);
end;

{ TLaporan }

function TServerLaporan.RetrivePenerimaanKas(ATglAwal , ATglAtglAkhir :
    TDateTime; ACabang : TCabang): TDataset;
var
  sSQL : String;
begin
  sSQL := 'SELECT * FROM vpenerimaan_kas A' +
          ' where a.tglbukti between ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal))+
          ' and ' + TAppUtils.QuotDt(EndOfTheDay(ATglAtglAkhir));

  if ACabang <> nil then
    sSQL := sSQL + ' and a.cabangID = ' + QuotedStr(ACabang.ID);

  Result   := TDBUtils.OpenDataset(sSQL);
end;

{ TLaporan }

function TServerLaporan.RetriveAR(ASupplier : TSupplier): TDataset;
var
  sSQL : String;
begin
  sSQL := 'select * from tar ' +
          ' where customer = ' + QuotedStr(ASupplier.ID);

  Result   := TDBUtils.OpenDataset(sSQL);
end;

{ TLaporan }

function TServerLaporan.RetriveSettingApp(ACabang : TCabang): TDataset;
var
  sSQL : String;
begin
  sSQL := 'select * from vsettingapp a' +
          ' where 1 = 1';

  if ACabang <> nil then
    sSQL := sSQL + ' and a.cabangid = ' + QuotedStr(ACabang.ID);

  Result   := TDBUtils.OpenDataset(sSQL);
end;

function TServerReturSupplier.AfterDelete(AOBject : TAppObject): Boolean;
begin
  Result := False;

  if SimpanStockSekarang(AOBject, True) then
  begin
    if HapusMutasi(TReturSupplier(AOBject).NoBukti) then
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
        lMutasiStock.Gudang     := TGudang.CreateID(lRS.Gudang.ID);
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
        lStockSekarang           := Retrieve(lRSup.ReturSupplierItems[i].Barang, lRSup.Gudang);
        lStockSekarang.Cabang    := TCabang.CreateID(lRSup.Cabang.ID);
        lStockSekarang.Gudang    := TGudang.CreateID(lRSup.Gudang.ID);

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

function TServerGudang.Retrieve(AID : String): TGudang;
begin
  Result      := TGudang.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;

function TServerGudang.RetrieveKode(AKode : String): TGudang;
var
  sSQL: string;
begin
  Result      := TGudang.Create;

  sSQL := 'select id from TGudang where kode = ' + QuotedStr(AKode);
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

function TServerPenjualan.AfterDelete(AOBject : TAppObject): Boolean;
begin
  Result := False;

  if SimpanStockSekarang(AOBject, True) then
  begin
    if HapusMutasi(TPenerimaanBarang(AOBject).NoBukti) then
      Result := True;
  end;
end;

function TServerPenjualan.AfterSave(AOBject : TAppObject): Boolean;
begin
  Result := False;

  if SimpanStockSekarang(AOBject) then
    if SimpanMutasiStock(AOBject) then
      Result := True;

end;

function TServerPenjualan.BeforeSave(AOBject : TAppObject): Boolean;
var
  lPenjualanLama: TPenjualan;
begin
  Result := False;

  lPenjualanLama := Retrieve(AOBject.ID);
  try
    if AOBject.ObjectState <> 1 then
    begin
       if NOT SimpanStockSekarang(lPenjualanLama, True) then
        Exit;
    end;
  finally
    lPenjualanLama.Free;
  end;

  with TPenjualan(AOBject) do
  begin
    JatuhTempo := TglBukti + TOP;
  end;

  Result := True;

end;

function TServerPenjualan.HapusMutasi(ANoBukti : String): Boolean;
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

function TServerPenjualan.Retrieve(AID : String): TPenjualan;
var
  sSQL: string;
  I: Integer;
begin
  Result := TPenjualan.Create;
  TDBUtils.LoadFromDB(Result, AID);

  sSQL := 'select c.* from tpenjualan a' +
          ' inner join tpenjualanitem b on a.id = b.penjualan' +
          ' inner join tbarangsatuanitem c on b.barang = c.barang and b.uom=c.uom' +
          ' where a.id = ' + QuotedStr(AID);

  with TDBUtils.OpenDataset(sSQL) do
  begin
    try
      for I := 0 to Result.PenjualanItems.Count - 1 do
      begin
        First;
        while not Eof do
        begin
          if FieldByName('barang').AsString = Result.PenjualanItems[i].Barang.ID then
            if FieldByName('uom').AsString = Result.PenjualanItems[i].UOM.ID then
            begin
              Result.PenjualanItems[i].BarangSatuangItemID := FieldByName('ID').AsString;
              Break;
            end;

          Next;
        end;
      end;
    finally
      Free;
    end;
  end;
end;

function TServerPenjualan.RetrieveCDSlip(ATglAwal , ATglAtglAkhir : TDateTime;
    ACabang : TCabang; ANoBukti : String): TDataset;
var
  sSQL: string;
begin
  sSQL := 'select * from VPenjualanSlip' +
          ' where tglbukti between ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal)) +
          ' and ' + TAppUtils.QuotDt(EndOfTheDay(ATglAtglAkhir)) +
          ' and nobukti like ' + QuotedStr('%' + Trim(ANoBukti) + '%');

  if ACabang <> nil then
    sSQL := ' and cabangid = ' + QuotedStr(ACabang.ID);





  Result := TDBUtils.OpenQuery(sSQL);
  // TODO -cMM: TServerPenjualan.RetrieveCDSlip default body inserted
end;

function TServerPenjualan.RetrieveNoBukti(ANoBukti : String): TPenjualan;
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

function TServerPenjualan.SimpanMutasiStock(AAppObject : TAppObject): Boolean;
var
  i: Integer;
  lMutasiStock: TMutasiStock;
  lPenjualan: TPenjualan;
begin
  Result := False;

  lPenjualan := TPenjualan(AAppObject);
  if not HapusMutasi(lPenjualan.NoBukti) then
    Exit;

  with TServerStockSekarang.Create do
  begin
    try
      for i := 0 to lPenjualan.PenjualanItems.Count - 1 do
      begin
        lMutasiStock            := TMutasiStock.Create;
        lMutasiStock.Barang     := TBarang.CreateID(lPenjualan.PenjualanItems[i].Barang.ID);
        lMutasiStock.Cabang     := TCabang.CreateID(lPenjualan.Cabang.ID);
        lMutasiStock.Gudang     := TGudang.CreateID(lPenjualan.Gudang.ID);
        lMutasiStock.UOM        := TUOM.CreateID(lPenjualan.PenjualanItems[i].UOM.ID);
        lMutasiStock.Harga      := lPenjualan.PenjualanItems[i].Harga;
        lMutasiStock.QtyIn      := 0;
        lMutasiStock.QtyOut     := lPenjualan.PenjualanItems[i].Qty;
        lMutasiStock.Keterangan := lPenjualan.NoBukti;
        lMutasiStock.NoBukti    := lPenjualan.NoBukti;
        lMutasiStock.Transaksi  := 'Penjualan';
        lMutasiStock.TglBukti   := lPenjualan.TglBukti;
        lMutasiStock.Konversi   := lPenjualan.PenjualanItems[i].Konversi;

        if not SaveNoCommit(lMutasiStock) then
          Exit;
      end;
    finally
      Free;
    end;
  end;

  Result := True;end;

function TServerPenjualan.SimpanStockSekarang(AAppObject : TAppObject;
    AIsMenghapus : Boolean = False): Boolean;
var
  dKonversi: Double;
  i: Integer;
  lPenjualan: TPenjualan;
  lStockSekarang: TStockSekarang;
begin
  Result := False;

  lPenjualan := TPenjualan(AAppObject);
  if AIsMenghapus then
  begin
    for i := 0 to lPenjualan.PenjualanItems.Count - 1 do
    begin
      lPenjualan.PenjualanItems[i].Qty := -1 * lPenjualan.PenjualanItems[i].Qty;
    end;
  end;

  with TServerStockSekarang.Create do
  begin
    try
      for i := 0 to lPenjualan.PenjualanItems.Count - 1 do
      begin
        lStockSekarang           := Retrieve(lPenjualan.PenjualanItems[i].Barang, lPenjualan.Gudang);
        lStockSekarang.Cabang    := TCabang.CreateID(lPenjualan.Cabang.ID);
        lStockSekarang.Gudang    := TGudang.CreateID(lPenjualan.Gudang.ID);

        with TServerBarang.Create do
        begin
          try
            lStockSekarang.Barang    := Retrieve(lPenjualan.PenjualanItems[i].Barang.ID);
            dKonversi                := lStockSekarang.Barang.KonversiPC(lPenjualan.PenjualanItems[i].UOM);

          finally
            Free;
          end;
        end;

        lStockSekarang.Qty       := lStockSekarang.Qty - (lPenjualan.PenjualanItems[i].Qty * dKonversi);
        lStockSekarang.Rp        := lStockSekarang.Rp  - (lPenjualan.PenjualanItems[i].Qty *lPenjualan.PenjualanItems[i].HargaSetelahDiskon);
        lStockSekarang.UOM       := TUOM.Create;
        lStockSekarang.UOM.ID    := lStockSekarang.Barang.SatuanStock.ID;

        Result := SaveNoCommit(lStockSekarang);
      end;
    finally
      Free;
    end;
  end;
end;

destructor TServerCustomerInvoice.Destroy;
begin
  inherited;
  FreeAndNil(FServerAR);
  FreeAndNil(FServerPenjualan);
end;

function TServerCustomerInvoice.AfterSave(AAppObject : TAppObject): Boolean;
//var
//  lCI: TCustomerInvoice;
begin
//  Result := False;
//
//  lCI    := TCustomerInvoice(AAppObject);
//
//  if lCI.AR = nil then
//  begin
//    lCI.AR := TAR.Create;
//  end;
//
//  lCI.AR.Nominal  := lCI.Nominal;
//  lCI.AR.Customer := TSupplier.CreateID(lCI.Customer.ID);
//
//  if lCI.AR.Cabang = nil then
//    lCI.AR.Cabang := TCabang.CreateID(lCI.Cabang.ID)
//  else
//    lCI.AR.Cabang.ID := lCI.ID;
//
//  lCI.AR.NoBukti   := lCI.NoBukti;
//  lCI.AR.Transaksi := lCI.ClassName;
//  lCI.AR.JatuhTempo:= lCI.JatuhTempo;
  Result := True;
end;

function TServerCustomerInvoice.BeforeSave(AAppObject : TAppObject): Boolean;
var
  lCI: TCustomerInvoice;
  lPenjualan: TPenjualan;
begin
  Result := False;

  lCI    := TCustomerInvoice(AAppObject);

  if lCI.AR = nil then
  begin
    lCI.AR := TAR.Create;
  end;

  lCI.AR.Nominal  := lCI.Nominal;
  lCI.AR.Customer := TSupplier.CreateID(lCI.Customer.ID);

  if lCI.AR.Cabang = nil then
    lCI.AR.Cabang := TCabang.CreateID(lCI.Cabang.ID)
  else
    lCI.AR.Cabang.ID := lCI.ID;

  lCI.AR.NoBukti          := lCI.NoBukti;
  lCI.AR.Transaksi        := lCI.ClassName;
  lCI.AR.JatuhTempo       := lCI.JatuhTempo;
  lCI.AR.TglBukti         := lCI.TglBukti;

  lPenjualan              := ServerPenjualan.Retrieve(lCI.CustomerInvoicePenjualans[0].Penjualan.ID);
  try
    lCI.AR.NoBuktiTransaksi := lPenjualan.NoBukti;
  finally
    lPenjualan.Free;
  end;

  if ServerAR.SaveNoCommit(lCI.AR) then
    Result := True;

end;

function TServerCustomerInvoice.GetServerAR: TServerAR;
begin
  if FServerAR = nil then
    FServerAR := TServerAR.Create;

  Result := FServerAR;
end;

function TServerCustomerInvoice.GetServerPenjualan: TServerPenjualan;
begin
  if FServerPenjualan = nil then
    FServerPenjualan := TServerPenjualan.Create;

  Result := FServerPenjualan;
end;

function TServerCustomerInvoice.Retrieve(AID : String): TCustomerInvoice;
var
  I: Integer;
  lBSItem: TBarangSatuanItem;
begin
  Result := TCustomerInvoice.Create;
  TDBUtils.LoadFromDB(Result, AID);

  with TServerBarangSatuanItem.Create do
  begin
    try
      for I := 0 to Result.CustomerInvoicePenjualans[0].CustomerInvoicePenjualanItems.Count - 1 do
      begin
        lBSItem := RetirveBySKUUOM(Result.CustomerInvoicePenjualans[0].CustomerInvoicePenjualanItems[i].Barang,
                                   Result.CustomerInvoicePenjualans[0].CustomerInvoicePenjualanItems[i].UOM);

        Result.CustomerInvoicePenjualans[0].CustomerInvoicePenjualanItems[i].BarangSatuangItemID := lBSItem.ID;
      end;

    finally
      Free
    end;
  end;

  
end;

function TServerCustomerInvoice.RetrieveCDSlip(AID : String): TDataset;
var
  sSQL: string;
begin
  sSQL   := 'select * from TServerCustomerInvoice a ' +
            ' where a.id = ' + QuotedStr(AID);

  Result := TDBUtils.OpenDataset(sSQL);
end;

function TServerCustomerInvoice.RetrieveNoBukti(ANoBukti : String):
    TCustomerInvoice;
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

function TServerAR.Retrieve(AID : String): TAR;
begin
  Result := TAR.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;

function TServerAR.RetrieveCDSlip(AID : String): TDataset;
var
  sSQL: string;
begin
  sSQL   := 'select * from TAR a ' +
            ' where a.id = ' + QuotedStr(AID);

  Result := TDBUtils.OpenDataset(sSQL);
end;

function TServerAR.RetrieveNoBukti(ANoBukti : String): TAR;
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

function TServerBarangSatuanItem.RetirveBySKUUOM(ASKU : TBarang; AUOM : TUOM):
    TBarangSatuanItem;
var
  sSQL: string;
begin
  Result := TBarangSatuanItem.Create;

  sSQL := 'select ID from TBarangSatuanItem' +
          ' where barang = ' + QuotedStr(ASKU.ID) +
          ' and uom = ' + QuotedStr(AUOM.ID);

  with TDBUtils.OpenQuery(sSQL) do
  begin
    if not IsEmpty then
    begin
      TDBUtils.LoadFromDB(Result, FieldByName('ID').AsString);
    end;
  end;

end;

destructor TServerPenerimaanKas.Destroy;
begin
  inherited;
  ServerAR.Free;
end;

function TServerPenerimaanKas.AfterSave(AAppObject : TAppObject): Boolean;
var
  lPK: TPenerimaanKas;
  I: Integer;
  sIDAR: string;
begin
  Result := False;

  lPK    := TPenerimaanKas(AAppObject);
  for I := 0 to lPK.PenerimaanKasARItems.Count - 1 do
  begin
    sIDAR := lPK.PenerimaanKasARItems[i].AR.ID;
    lPK.PenerimaanKasARItems[i].AR.Free;
    lPK.PenerimaanKasARItems[i].AR := ServerAR.Retrieve(sIDAR);
    lPK.PenerimaanKasARItems[i].AR.TerBayar := lPK.PenerimaanKasARItems[i].AR.TerBayar + lPK.PenerimaanKasARItems[i].Nominal;

    if not ServerAR.SaveNoCommit(lPK.PenerimaanKasARItems[i].AR) then
      Exit;
  end;



  Result := True;
end;

function TServerPenerimaanKas.AfterDelete(AAppObject : TAppObject): Boolean;
var
  lPK: TPenerimaanKas;
  I: Integer;
  sIDAR: string;
begin
  Result := False;

  lPK    := TPenerimaanKas(AAppObject);
  for I := 0 to lPK.PenerimaanKasARItems.Count - 1 do
  begin
    sIDAR := lPK.PenerimaanKasARItems[i].AR.ID;
    lPK.PenerimaanKasARItems[i].AR.Free;
    lPK.PenerimaanKasARItems[i].AR := ServerAR.Retrieve(sIDAR);
    lPK.PenerimaanKasARItems[i].AR.TerBayar := lPK.PenerimaanKasARItems[i].AR.TerBayar - lPK.PenerimaanKasARItems[i].Nominal;

    if not ServerAR.SaveNoCommit(lPK.PenerimaanKasARItems[i].AR) then
      Exit;
  end;



  Result := True;
end;

function TServerPenerimaanKas.BeforeSave(AAppObject : TAppObject): Boolean;
var
  lPK: TPenerimaanKas;
  I: Integer;
  sIDAR: string;
begin
  Result := False;

  lPK    := Retrieve(AAppObject.ID);
  try
    for I := 0 to lPK.PenerimaanKasARItems.Count - 1 do
    begin
      sIDAR := lPK.PenerimaanKasARItems[i].AR.ID;
      lPK.PenerimaanKasARItems[i].AR.Free;
      lPK.PenerimaanKasARItems[i].AR := ServerAR.Retrieve(sIDAR);
      lPK.PenerimaanKasARItems[i].AR.TerBayar := lPK.PenerimaanKasARItems[i].AR.TerBayar - lPK.PenerimaanKasARItems[i].Nominal;

      if not ServerAR.SaveNoCommit(lPK.PenerimaanKasARItems[i].AR) then
        Exit;
    end;
  finally
    lPK.Free;
  end;



  Result := True;
end;

function TServerPenerimaanKas.GetServerAR: TServerAR;
begin
  if FServerAR = nil then
    FServerAR := TServerAR.Create;

  Result := FServerAR;
end;

function TServerPenerimaanKas.Retrieve(AID : String): TPenerimaanKas;
begin
  Result := TPenerimaanKas.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;

function TServerPenerimaanKas.RetrievePenerimaanARs(AID : String): TDataSet;
var
  sSQL: string;
begin
  sSQL   := 'select a.*, b.nobukti, b.nominal as nominalar, b.terbayar' +
            ' from tpenerimaankasar a ' +
            ' INNER JOIN tar b on a.ar = b.id ' +
            ' where a.penerimaankas = ' + QuotedStr(AID);

  Result := TDBUtils.OpenDataset(sSQL);
end;

function TServerPenerimaanKas.RetrieveCDSlip(ATglAwal , ATglAtglAkhir :
    TDateTime; ACabang : TCabang; ANoBukti : String): TDataset;
var
  sSQL: string;
begin
  sSQL   := 'select * from vpenerimaan_kas_slip a ' +
            ' where tglbukti between ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal)) +
            ' and ' + TAppUtils.QuotDt(EndOfTheDay(ATglAtglAkhir)) +
            ' and nobukti like ' + QuotedStr('%' + Trim(ANoBukti) + '%');

  if ACabang <> nil then
    sSQL := ' and cabangid = ' + QuotedStr(ACabang.ID);


  Result := TDBUtils.OpenDataset(sSQL);
end;

function TServerPenerimaanKas.RetrieveNoBukti(ANoBukti : String):
    TPenerimaanKas;
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

function TServerAccount.Retrieve(AID : String): TAccount;
begin
  Result      := TAccount.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;

function TServerRekBank.Retrieve(AID : String): TRekBank;
begin
  Result      := TRekBank.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;

function TServerTransferAntarGudang.AfterDelete(AOBject : TAppObject): Boolean;
begin
  Result := False;

  if SimpanStockSekarang(AOBject, True) then
  begin
    if HapusMutasi(TTransferAntarGudang(AOBject).NoBukti) then
      Result := True;
  end;
end;

function TServerTransferAntarGudang.AfterSave(AOBject : TAppObject): Boolean;
begin
  Result := False;

  if SimpanStockSekarang(AOBject) then
    if SimpanMutasiStock(AOBject) then
      Result := True;

end;

function TServerTransferAntarGudang.BeforeSave(AOBject : TAppObject): Boolean;
var
  lTAGLama: TTransferAntarGudang;
begin
  Result := False;

  lTAGLama := Retrieve(AOBject.ID);
  try
    if AOBject.ObjectState <> 1 then
    begin
       if NOT SimpanStockSekarang(lTAGLama, True) then
        Exit;
    end;
  finally
    lTAGLama.Free;
  end;


  Result := True;

end;

function TServerTransferAntarGudang.HapusMutasi(ANoBukti : String): Boolean;
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

function TServerTransferAntarGudang.Retrieve(AID : String):
    TTransferAntarGudang;
begin
  Result := TTransferAntarGudang.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;

function TServerTransferAntarGudang.RetrieveNoBukti(ANoBukti : String):
    TTransferAntarGudang;
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

function TServerTransferAntarGudang.SaveTransferAntarGudang(
    ATransferAntarGudang : TTransferAntarGudang): Boolean;
begin
  Result := False;

  if SaveNoCommit(TTransferAntarGudangOut(ATransferAntarGudang)) then
    if Save(TTransferAntarGudangIn(ATransferAntarGudang)) then
      Result := True;
end;

function TServerTransferAntarGudang.SimpanMutasiStock(AAppObject : TAppObject):
    Boolean;
var
  i: Integer;
  lMutasiStock: TMutasiStock;
  lTAG: TTransferAntarGudang;
begin
  Result := False;

  lTAG := TTransferAntarGudang(AAppObject);
  if not HapusMutasi(lTAG.NoBukti) then
    Exit;

  with TServerStockSekarang.Create do
  begin
    try
      for i := 0 to lTAG.TransferAntarGudangItems.Count - 1 do
      begin
        lMutasiStock            := TMutasiStock.Create;
        lMutasiStock.Barang     := TBarang.CreateID(lTAG.TransferAntarGudangItems[i].Barang.ID);
        lMutasiStock.Cabang     := TCabang.CreateID(lTAG.Cabang.ID);
        lMutasiStock.Gudang     := TGudang.CreateID(lTAG.Gudang.ID);
        lMutasiStock.UOM        := TUOM.CreateID(lTAG.ReturSupplierItems[i].UOM.ID);
        lMutasiStock.Harga      := lTAG.ReturSupplierItems[i].HargaBeli;
        lMutasiStock.QtyIn      := 0;
        lMutasiStock.QtyOut     := lTAG.ReturSupplierItems[i].Qty;
        lMutasiStock.Keterangan := lTAG.NoBukti;
        lMutasiStock.NoBukti    := lTAG.NoBukti;
        lMutasiStock.Transaksi  := 'Retur Supplier';
        lMutasiStock.TglBukti   := lTAG.TglBukti;
        lMutasiStock.Konversi   := lTAG.ReturSupplierItems[i].Konversi;

        if not SaveNoCommit(lMutasiStock) then
          Exit;
      end;
    finally
      Free;
    end;
  end;

  Result := True;
end;

function TServerTransferAntarGudang.SimpanStockSekarang(AAppObject : TAppObject;
    AIsMenghapus : Boolean = False): Boolean;
begin
  Result := False;

  if SimpanStockSekarangOut(AAppObject, AIsMenghapus) then
    if SimpanStockSekarangIn(AAppObject, AIsMenghapus) then
end;

function TServerTransferAntarGudang.SimpanStockSekarangOut(AAppObject :
    TAppObject; AIsMenghapus : Boolean = False): Boolean;
var
  dKonversi: Double;
  i: Integer;
  lTAGOut: TTransferAntarGudangOut;
  lStockSekarang: TStockSekarang;
begin
  Result := False;

  lTAGOut := TTransferAntarGudangIn(AAppObject);
  if AIsMenghapus then
  begin
    for i := 0 to lTAGOut.TransferAntarGudangItems.Count - 1 do
    begin
      lTAGOut.TransferAntarGudangItems[i].Qty := -1 * lTAGOut.TransferAntarGudangItems[i].Qty;
    end;
  end;

  with TServerStockSekarang.Create do
  begin
    try
      for i := 0 to lTAGOut.TransferAntarGudangItems.Count - 1 do
      begin
        lStockSekarang           := Retrieve(lTAGOut.TransferAntarGudangItems[i].Barang, lTAGOut.GudangAsal);
        lStockSekarang.Cabang    := TCabang.CreateID(lTAGOut.Cabang.ID);
        lStockSekarang.Gudang    := TGudang.CreateID(lTAGOut.GudangAsal.ID);

        with TServerBarang.Create do
        begin
          try
            lStockSekarang.Barang    := Retrieve(lTAGOut.TransferAntarGudangItems[i].Barang.ID);
            dKonversi                := lStockSekarang.Barang.KonversiPC(lTAGOut.TransferAntarGudangItems[i].UOM);

          finally
            Free;
          end;
        end;

        lStockSekarang.Qty       := lStockSekarang.Qty - (lTAGOut.TransferAntarGudangItems[i].Qty * dKonversi);
        lStockSekarang.Rp        := lStockSekarang.Rp  - (lTAGOut.TransferAntarGudangItems[i].Qty *lTAGOut.TransferAntarGudangItems[i].Harga);
        lStockSekarang.UOM       := TUOM.CreateID(lStockSekarang.Barang.SatuanStock.ID);

        Result := SaveNoCommit(lStockSekarang);
      end;
    finally
      Free;
    end;
  end;
end;

function TServerTransferAntarGudang.SimpanStockSekarangIn(AAppObject :
    TAppObject; AIsMenghapus : Boolean = False): Boolean;
var
  dKonversi: Double;
  i: Integer;
  lTAGIn: TTransferAntarGudangIn;
  lStockSekarang: TStockSekarang;
begin
  Result := False;

  lTAGIn := TTransferAntarGudangIn(AAppObject);
  if AIsMenghapus then
  begin
    for i := 0 to lTAGIn.TransferAntarGudangItems.Count - 1 do
    begin
      lTAGIn.TransferAntarGudangItems[i].Qty := -1 * lTAGIn.TransferAntarGudangItems[i].Qty;
    end;
  end;

  with TServerStockSekarang.Create do
  begin
    try
      for i := 0 to lTAGIn.TransferAntarGudangItems.Count - 1 do
      begin
        lStockSekarang           := Retrieve(lTAGIn.TransferAntarGudangItems[i].Barang, lTAGIn.GudangTujuan);
        lStockSekarang.Cabang    := TCabang.CreateID(lTAGIn.Cabang.ID);
        lStockSekarang.Gudang    := TGudang.CreateID(lTAGIn.GudangTujuan.ID);

        with TServerBarang.Create do
        begin
          try
            lStockSekarang.Barang    := Retrieve(lTAGIn.TransferAntarGudangItems[i].Barang.ID);
            dKonversi                := lStockSekarang.Barang.KonversiPC(lTAGIn.TransferAntarGudangItems[i].UOM);

          finally
            Free;
          end;
        end;

        lStockSekarang.Qty       := lStockSekarang.Qty + (lTAGIn.TransferAntarGudangItems[i].Qty * dKonversi);
        lStockSekarang.Rp        := lStockSekarang.Rp  + (lTAGIn.TransferAntarGudangItems[i].Qty *lTAGIn.TransferAntarGudangItems[i].Harga);
        lStockSekarang.UOM       := TUOM.CreateID(lStockSekarang.Barang.SatuanStock.ID);

        Result := SaveNoCommit(lStockSekarang);
      end;
    finally
      Free;
    end;
  end;
end;

function TServerSettingApp.Retrieve(AID : String): TSettingApp;
begin
  Result      := TSettingApp.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;

function TServerSettingApp.RetrieveByCabang(ACabangID : String): TSettingApp;
var
  sSQL: string;
begin
  Result      := TSettingApp.Create;


  sSQL := 'select * from tsettingapp' +
          ' where cabang = ' + QuotedStr(ACabangID);

  TDBUtils.LoadFromDBSQL(Result, sSQL);
end;


end.


