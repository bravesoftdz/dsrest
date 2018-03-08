unit ServerMethodsUnit;

interface

uses
  SysUtils, Classes, DSServer, uModel, Windows, uDBUtils, Generics.Collections,
  DBXJSON, DBClient, DB, rtti, uInterface, uPenjualan,Data.FireDACJSONReflect,
  uCustomerInvoice, uAR, uPenerimaanKas, uAccount, uRekBank,
  uTransferAntarGudang, uSettingApp, uTAGRequests, uTransferAntarCabang,
  uPengeluaranKas, FireDAC.Comp.Client, uSettingAppServer, uJurnal, uSupplier,
  uPenerimaanBarang,uReturSupplier, uSettlementARAP, uUser, uPenarikanDeposit,
  uSetoranModal;

type
  {$METHODINFO ON}

  TServerAR = class;
  TServerAP = class;
  TServerPenerimaanKas = class;
  TDSData = class(TInterfacedPersistent)

  public
    function DS_CabangLookUp: TDataset;
    function DS_BarangLookUp: TDataset;
    function DS_BarangLookUp1: TDataset;
    function DS_MenuLookUp: TDataset;
    function DS_UserLookUp: TDataset;
    function DS_GudangLookUp: TDataset;
    function GetNamaku: string;
    function LoadAccountPengeluaranKasLain: TDataset;
    function LoadAccountAPNew: TDataset;
    function LoadAccountPenerimaanLain: TDataset;
    function LoadAccountARNew: TDataset;
    function LoadAP(ASupplier : TSupplier): TDataSet;
    function LoadAR(ACustomer : TSupplier): TDataSet;
  end;

  TServerLaporan = class(TInterfacedPersistent)
  public
    function DS_OverviewAccount: TDataset;
    function LaporanKartok(ATglAwal , ATglAkhir : TDateTime; ABarang : TBarang;
        AGudang : TGudang): TFDJSONDataSets;
    function LaporanKarAP(ATglAwal , ATglAkhir : TDateTime; ASupplier : TSupplier;
        ACabang : TCabang; ANoAP : String): TFDJSONDataSets;
    function LaporanStockSekarang(ACabang : TCabang): TDataset;
    function LookUpPenerimaan(ABulan, ATahun : Integer): TDataset;
    function RetrieveCDSTAGRequestKepada(ATglAwal , ATglAkhir : TDateTime;ACabang :
        TCabang): TDataSet;
    function RetrieveCDSTAGRequestDari(ATglAwal , ATglAkhir : TDateTime;ACabang :
        TCabang): TDataSet;
    function RetrieveTACKirim(ATglAwal , ATglAkhir : TDateTime;ACabang : TCabang):
        TDataSet;
    function RetrieveGaji(ATahun, ABulan : Integer): TDataSet;
    function RetrieveTACTerima(ATglAwal , ATglAkhir : TDateTime;ACabang : TCabang):
        TDataSet;
    function RetrieveTransferAntarGudang(ATglAwal , ATglAkhir : TDateTime;ACabang :
        TCabang): TDataSet;
    function RetriveMutasiBarang(ATglAwal , ATglAkhir : TDateTime; ACabang :
        TCabang; AGudang : TGudang): TDataset;
    function RetrivePenjualan(ATglAwal , ATglAtglAkhir : TDateTime; ACabang :
        TCabang): TDataset;
    function RetriveCI(ATglAwal , ATglAtglAkhir : TDateTime; ACabang : TCabang):
        TDataset;
    function RetrivePenerimaanKas(ATglAwal , ATglAtglAkhir : TDateTime; ACabang :
        TCabang): TDataset;
    function RetriveAR(ASupplier : TSupplier): TDataset;
    function RetrivePengeluaranKas(ATglAwal , ATglAtglAkhir : TDateTime; ACabang :
        TCabang): TDataset;
    function RetriveJurnal(ATglAwal , ATglAtglAkhir : TDateTime; ACabang : TCabang;
        AJenisJurnal : String): TDataset;
    function LaporanPenerimaanBarang(ATglAwal , AtglAkhir : TDateTime; ACabang :
        TCabang; AGudang : TGudang): TDataset;
    function LaporanAP(ATglAwal , AtglAkhir : TDateTime; ACabang : TCabang;
        AIsTglJatuhTempo : Boolean): TFDJSONDataSets;
    function LaporanAR(ATglAwal , AtglAkhir : TDateTime; ACabang : TCabang;
        AIsTglJatuhTempo : Boolean): TFDJSONDataSets;
    function LaporanReturSupplier(ATglAwal , AtglAkhir : TDateTime; ACabang :
        TCabang): TFDJSONDataSets; overload;
    function LaporanKarAR(ATglAwal , ATglAkhir : TDateTime; ACustomer : TSupplier;
        ACabang : TCabang; ANoAR : String): TFDJSONDataSets;
    function LaporanNeracaSaldo(ATglAwal , AtglAkhir : TDateTime; AIsKonsolidasi :
        Integer; ACabang : TCabang): TFDJSONDataSets; overload;
    function LaporanLabaRugi(ATglAwal , AtglAkhir : TDateTime): TFDJSONDataSets;
        overload;
    function LaporanLabaRugiDS(ATglAwal , AtglAkhir : TDateTime): TDataset;
        overload;
    function LaporanPenjualanByPembeli(ATglAwal , AtglAkhir : TDateTime;
        AIsKonsolidasi : Integer; ACabang : TCabang): TFDJSONDataSets; overload;
    function RetrivePenarikanDeposit(ATglAwal , ATglAtglAkhir : TDateTime; ACabang
        : TCabang): TDataset;
    function RetriveSetoranModal(ATglAwal , ATglAtglAkhir : TDateTime; ACabang :
        TCabang): TDataset;
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
    function IsBisaHapus(AOBject : TAppObject): Boolean; virtual;
    function SaveNoCommit(AOBject : TAppObject): Boolean; virtual;
  public
    function Delete(AAppObject : TAppObject): Boolean; virtual;
    function DeleteNoCommit(AAppObject : TAppObject): Boolean; virtual;
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
  protected
  public
    function DoJournal(ANoBukti : String; AModTransClass : String; AIsHapusJurnal :
        Integer): Boolean;
    function GenerateNoBukti(ATglBukti : TdateTime; APrefix : String): string;
    function RetrieveData(aPeriodeAwal, APeriodeAkhir : TDateTime; AIDCabang :
        String): TDataSet; virtual;
    function RetrieveDataSiapJurnal(aPeriodeAwal, APeriodeAkhir : TDateTime):
        TDataSet; virtual;
    function RetrieveDataSlip(aPeriodeAwal, APeriodeAkhir : TDateTime; AIDCabang :
        String; AID : String): TFDJSONDataSets; virtual;
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
    function GetHargaBeliTerakhir(ABarangID : String): Double;
    function Retrieve(AID : String): TBarang;
    function RetrieveKode(AKode : String): TBarang;
  end;

  TServerGroupBarang = class(TCRUD)
  protected
  public
    function Retrieve(AID : String): TGroupBarang;
  end;

  TServerPenerimaanBarang = class(TServerTransaction, IBisaSimpanStock)
  strict private
    function HapusMutasi(ANoBukti : String): Boolean; stdcall;
  private
    function HapusAP(AOBject: TAppObject): Boolean;
    function SimpanMutasiStock(AAppObject : TAppObject): Boolean; stdcall;
    function SimpanStockSekarang(AAppObject : TAppObject; AIsMenghapus : Boolean =
        False): Boolean; stdcall;
  protected
    function AfterSave(AOBject : TAppObject): Boolean; override;
    function AfterDelete(AOBject : TAppObject): Boolean; override;
    function BeforeDelete(AOBject : TAppObject): Boolean; override;
    function BeforeSave(AOBject : TAppObject): Boolean; override;
    function SimpanAP(AOBject: TAppObject): Boolean;
  public
    function Retrieve(AID : String): TPenerimaanBarang;
    function RetrievePenerimaan(APeriodeAwal, APeriodeAkhir : TDateTime; AIDCabang
        : String): TDataSet;
    function RetrieveCDSlip(AID : String): TFDJSONDataSets;
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
    FServerAR: TServerAR;
    function GetServerAR: TServerAR;
    function HapusAR(AOBject: TAppObject): Boolean;
    function SimpanStockSekarang(AAppObject : TAppObject; AIsMenghapus : Boolean =
        False): Boolean; stdcall;
    property ServerAR: TServerAR read GetServerAR write FServerAR;
  protected
    function AfterDelete(AOBject : TAppObject): Boolean; override;
    function AfterSave(AOBject : TAppObject): Boolean; override;
    function BeforeSave(AOBject : TAppObject): Boolean; override;
    function SimpanAR(AOBject: TAppObject): Boolean;
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

  TServerPenjualan = class(TServerTransaction)
  strict private

  private
    FServerAR: TServerAR;
    FServerAp: TServerAP;
    FServerPenerimaanKas: TServerPenerimaanKas;
    function GetServerAR: TServerAR;
    function GetServerAp: TServerAP;
    function GetServerPenerimaanKas: TServerPenerimaanKas;
    function HapusARAP(AOBject: TAppObject): Boolean;
    function SimpanARAP(AOBject: TAppObject): Boolean;
    function SimpanBayar(APenjualan : TPenjualan; ADibayar : Double): Boolean;
    property ServerAR: TServerAR read GetServerAR write FServerAR;
    property ServerAp: TServerAP read GetServerAp write FServerAp;
    property ServerPenerimaanKas: TServerPenerimaanKas read GetServerPenerimaanKas
        write FServerPenerimaanKas;
  protected
    function SimpanStockSekarang(AAppObject : TAppObject; AIsMenghapus : Boolean =
        False): Boolean; stdcall;
    function HapusMutasi(ANoBukti : String): Boolean; stdcall;
    function SimpanMutasiStock(AAppObject : TAppObject): Boolean; stdcall;

    function BeforeDelete(AOBject : TAppObject): Boolean; override;
    function AfterSave(AOBject : TAppObject): Boolean; override;
    function BeforeSave(AOBject : TAppObject): Boolean; override;
//    function SimpanAR1(AOBject: TAppObject): Boolean;

  public
    destructor Destroy; override;
    function GetSaldoDeposit(ASupplier : TSupplier; AExcludeNo : String): Double;
    function GetPenjualanPeriode(ASupplier : TSupplier; ATglAwal, ATglAkhir :
        TDateTime; AExcludeNo : String): Double;
    function Retrieve(AID : String): TPenjualan;
    function RetrieveNoBukti(ANoBukti : String): TPenjualan;
    function RetrieveCDSlip(ATglAwal , ATglAtglAkhir : TDateTime; ACabang :
        TCabang; ANoBukti : String): TFDJSONDataSets;
    function SaveToDBDibayar(APenjualan : TPenjualan; ADibayar : Double): Boolean;

  end;

  TServerAR = class(TServerTransaction)
  public
    function Retrieve(AID : String): TAR;
    function RetrieveCDSlip(AID : String): TDataset;
    function RetrieveNoBukti(ANoBukti : String): TAR;
    function RetrieveTransaksi(ATransaksi : String; AIDTransaksi : String): TAR;
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
    FServerAP: TServerAP;
    function GetServerAR: TServerAR;
    function GetServerAP: TServerAP;
    function HapusAP(AOBject: TAppObject): Boolean;
    function UpdateARTerbayar(APenerimaanKas : TPenerimaanKas; AIsBayar : Boolean):
        Boolean;
    property ServerAR: TServerAR read GetServerAR write FServerAR;
    property ServerAP: TServerAP read GetServerAP write FServerAP;
  protected
    function SimpanAPNew(AOBject: TAppObject): Boolean;
  public
    destructor Destroy; override;
    function AfterSave(AAppObject : TAppObject): Boolean; override;
    function BeforeDelete(AAppObject : TAppObject): Boolean; override;
    function BeforeSave(AAppObject : TAppObject): Boolean; override;
    function Retrieve(AID : String): TPenerimaanKas;
    function RetrievePenerimaanARs(AID : String): TDataSet;
    function RetrieveCDSlip(ATglAwal , ATglAtglAkhir : TDateTime; ACabang :
        TCabang; ANoBukti : String): TFDJSONDataSets;
    function RetrieveNoBukti(ANoBukti : String): TPenerimaanKas;
  end;

  TServerAccount = class(TServerMaster)
  protected
  public
    function Retrieve(AID : String): TAccount;
  end;

  TServerRekBank = class(TServerMaster)
  protected
  public
    function Retrieve(AID : String): TRekBank;
    function RetrieveRek(ANorek : String): TRekBank;
  end;

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
    function RetrieveCDSlip(ATglAwal , ATglAtglAkhir : TDateTime; ACabang :
        TCabang; ANoBukti : String): TDataset;
    function RetrieveNoBukti(ANoBukti : String): TTransferAntarGudang;
    function SaveTransferAntarGudang(ATransferAntarGudang : TTransferAntarGudang):
        Boolean;
  end;

  TServerSettingApp = class(TCRUD)
  public
    function Retrieve(AID : String): TSettingApp;
    function RetrieveByCabang(ACabangID : String): TSettingApp;
  end;

  TServerTAGRequest = class(TServerTransaction)
  protected
  public
    function Retrieve(AID : String): TTAGRequest;
    function RetrieveCDSSlip(ACabangID : String; AID : String): TDataSet;
    function RetrieveNoBukti(ANoBukti : String): TTAGRequest;
  end;

  TServerTransferAntarCabangKirim = class(TServerTransaction)
  strict private
  private
    function UpdateStatusTAGRequest(AOBject : TAppObject): Boolean;
  protected
    function AfterDelete(AAppObject : TAppObject): Boolean; override;
    function AfterSave(AOBject : TAppObject): Boolean; override;
    function BeforeDelete(AAppObject : TAppObject): Boolean; override;
    function BeforeSave(AOBject : TAppObject): Boolean; override;
    function IsBisaHapus(AOBject : TAppObject): Boolean; override;
  public
    function Retrieve(AID : String): TTransferAntarCabangKirim;
    function RetrieveNoBukti(ANoBukti : String): TTransferAntarCabangKirim;
  end;

  TServerTransferAntarCabangTerima = class(TServerTransaction)
  strict private
  private
    function UpdateStatusTACKirim(AOBject : TAppObject): Boolean;
  protected
    function AfterDelete(AAppObject : TAppObject): Boolean; override;
    function AfterSave(AOBject : TAppObject): Boolean; override;
    function BeforeDelete(AAppObject : TAppObject): Boolean; override;
    function BeforeSave(AOBject : TAppObject): Boolean; override;
  public
    function Retrieve(AID : String): TTransferAntarCabangTerima;
    function RetrieveNoBukti(ANoBukti : String): TTransferAntarCabangTerima;
  end;

  TServerAP = class(TServerTransaction)
  public
    function Retrieve(AID : String): TAP;
    function RetrieveTransaksi(ATransaksi : String; AIDTransaksi : String): TAP;
//    function RetrieveDeposit(ASupplierID : String): TAP;
  end;

  TServerPengeluaranKas = class(TServerTransaction)
  private
    FServerAP: TServerAP;
    function GetServerAP: TServerAP;
    function RetrieveCDSlipPengeluaranKas(ATglAwal , ATglAtglAkhir : TDateTime;
        ACabang : TCabang; ANoBukti : String): TFDQuery;
    function RetrieveCDSlipPengeluaranKasNonAP(ATglAwal , ATglAtglAkhir :
        TDateTime; ACabang : TCabang; ANoBukti : String): TFDQuery;
    function RetrieveCDSlipPengeluaranKasAP(ATglAwal , ATglAtglAkhir : TDateTime;
        ACabang : TCabang; ANoBukti : String): TFDQuery;
    function UpdateAPTerbayar(APengeluaranKas : TPengeluaranKas; AIsBayar :
        Boolean): Boolean;
    property ServerAP: TServerAP read GetServerAP write FServerAP;
  protected
  public
    destructor Destroy; override;
    function AfterSave(AAppObject : TAppObject): Boolean; override;
    function BeforeDelete(AAppObject : TAppObject): Boolean; override;
    function BeforeSave(AAppObject : TAppObject): Boolean; override;
    function Retrieve(AID : String): TPengeluaranKas;
    function RetrievePenerimaanAPs(AID : String): TDataSet;
    function RetrieveCDSlip(ATglAwal , ATglAtglAkhir : TDateTime; ACabang :
        TCabang; ANoBukti : String): TFDJSONDataSets;
    function RetrieveNoBukti(ANoBukti : String): TPengeluaranKas;
  end;

  TCRUDServer = class(TCRUD)
  public
    destructor Destroy; override;
    procedure FinalisasiSettingAppServer;
    procedure InisialisasiSettingAppServer;
  end;

  TServerJurnal = class(TServerTransaction)
  public
    function BeforeSave(AAppObject : TAppObject): Boolean; override;
    function BeforeDelete(AAppObject : TAppObject): Boolean; override;
    function Retrieve(AID : String): TJurnal;
  end;

  TServerSettlementARAP = class(TServerTransaction)
  private
    function UpdateAPTerbayar(ASettlementARAP : TSettlementARAP; AIsBayar :
        Boolean): Boolean;
    function UpdateARTerbayar(ASettlementARAP : TSettlementARAP; AIsBayar :
        Boolean): Boolean;
  public
    function AfterSave(AAppObject : TAppObject): Boolean; override;
    function BeforeDelete(AAppObject : TAppObject): Boolean; override;
    function BeforeSave(AAppObject : TAppObject): Boolean; override;
    function Retrieve(AID : String): TSettlementARAP;
  end;

  TServerUser = class(TServerMaster)
  public
    function DoLogin(AUserName, APassword : String): TUser;
    function Retrieve(AID : String): TUser;
  end;

  TServerMenu = class(TServerMaster)
  public
    function Retrieve(AID : String): TMenu;
  end;

  TServerSetoranModal = class(TServerTransaction)
  public
    function Retrieve(AID : String): TSetoranModal;
//    function Retrieve(AID : String): TMenu;
  end;

  TServerPenarikanDeposit = class(TServerTransaction)
  private
    FServerAP: TServerAP;
    function GetServerAP: TServerAP;
    property ServerAP: TServerAP read GetServerAP write FServerAP;
  protected
    function BeforeSave(AOBject : TAppObject): Boolean; override;
    function AfterSave(AOBject : TAppObject): Boolean; override;
    function AfterDelete(AOBject : TAppObject): Boolean; override;
    function BeforeDelete(AOBject : TAppObject): Boolean; override;
  public
    function Retrieve(AID : String): TPenarikanDeposit;
    function RetrieveCDSlip(ATglAwal , ATglAtglAkhir : TDateTime; ACabang :
        TCabang; ANoBukti : String): TFDJSONDataSets;
  end;

  






{$METHODINFO OFF}

const
  _CounterNoBukti : Integer = 4;

implementation
uses StrUtils, Provider,uAppUtils, System.DateUtils;

var
  SettingAppServer : TSettingAppServer;

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
  if IsBisaHapus(AAppObject) then
    Result := True
  else
    Result := False;
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

    if not TDBUtils.ExecuteSQL(sSQL) then
      Exit;

    if AfterDelete(AAppObject) then
    begin
      ADConnection.Commit;
      Result := True;
    end;
  except
    ADConnection.Rollback;
    raise;
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
    begin
      ADConnection.Rollback;
      Exit;
    end;

    if not TDBUtils.ExecuteSQL(TDBUtils.GenerateSQL(AOBject)) then
    begin
      ADConnection.Rollback;
      Exit;
    end;

    if AfterSave(AOBject) then
    begin
      ADConnection.Commit;
      Result := True;
    end;
  except
    ADConnection.Rollback;
    raise
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

function TCRUD.DeleteNoCommit(AAppObject : TAppObject): Boolean;
var
  sSQL: string;
begin
  Result := False;

  try
    if not BeforeDelete(AAppObject) then
      Exit;

    sSQL := TDBUtils.GenerateSQLDelete(AAppObject, AAppObject.ID);

    if not TDBUtils.ExecuteSQL(sSQL) then
      Exit;

    if AfterDelete(AAppObject) then
    begin
//      ADConnection.Commit;
      Result := True;
    end;
  except
    ADConnection.Rollback;
    raise
  end;


end;

function TCRUD.GetTableName: string;
begin
  Result := StringReplace(Self.ClassName,'Server','', [rfIgnoreCase]);
end;

function TCRUD.IsBisaHapus(AOBject : TAppObject): Boolean;
begin
  Result := True;
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

  if not TDBUtils.ExecuteSQL(TDBUtils.GenerateSQL(AOBject)) then
    Exit;

  if AfterSave(AOBject) then
  begin
    Result := True;
  end;

end;

function TServerBarang.GetHargaBeliTerakhir(ABarangID : String): Double;
var
  sSQL: string;
begin
  Result := 0;

  if ABarangID = '' then
    Exit;

  sSQL := 'select top 1 b.hargabeli from tpenerimaanbarang a ' +
          ' INNER JOIN tpenerimaanbarangitem b on a.id = b.penerimaanbarang ' +
          ' WHERE b.barang = ' + QuotedStr(ABarangID) +
          ' ORDER BY a.tglbukti DESC ';

  with TDBUtils.OpenQuery(sSQL) do
  begin
    try
      while not Eof do
      begin
        Result := FieldByName('hargabeli').AsFloat;
        Next;
      end;
    finally
      Free;
    end;
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
      if SimpanAP(AOBject) then
        Result := True;
end;

function TServerPenerimaanBarang.AfterDelete(AOBject : TAppObject): Boolean;
begin
  Result := False;

  if HapusAP(AOBject) then
    if SimpanStockSekarang(AOBject, True) then
      if HapusMutasi(TPenerimaanBarang(AOBject).NoBukti) then
        Result := True;
end;

function TServerPenerimaanBarang.BeforeDelete(AOBject : TAppObject): Boolean;
begin
//  Result := False;

  if TPenerimaanBarang(AOBject).IsJurnalized = 1 then
    raise Exception.Create('Transaksi Sudah Dijurnal, Tidak Bisa Dihapus');

  Result := True;
end;

function TServerPenerimaanBarang.BeforeSave(AOBject : TAppObject): Boolean;
var
  lPBLama: TPenerimaanBarang;
begin
  Result := False;

  lPBLama := Retrieve(AOBject.ID);
  try
    if lPBLama.IsJurnalized = 1 then
      raise Exception.Create('Transaksi Sudah Dijurnal, tidak bisa diedit');

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

function TServerPenerimaanBarang.HapusAP(AOBject: TAppObject): Boolean;
var
  lAP: TAP;
  lPB: TPenerimaanBarang;
  lServerAP: TServerAP;
begin
  Result := False;

  lPB       := TPenerimaanBarang(AOBject);
  lServerAP := TServerAP.Create;
  try
    lAP := lServerAP.RetrieveTransaksi(lPB.ClassName, AOBject.ID);

    if lAP.TerBayar > 0 then
      raise Exception.Create('AP atas penerimaan Barang ' + lPB.NoBukti + ' Sudah Terbayar' + #13
                               + 'Data Tidak Bisa Diubah');

    if lServerAP.DeleteNoCommit(lAP) then
      Result := True;
  finally
    lServerAP.Free;
  end;
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

function TServerPenerimaanBarang.RetrievePenerimaan(APeriodeAwal, APeriodeAkhir
    : TDateTime; AIDCabang : String): TDataSet;
var
  lcds: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select * from vpenerimaanbarang' +
          ' where tglbukti between ' + TAppUtils.QuotDt(StartOfTheDay(APeriodeAwal)) +
          ' and ' + TAppUtils.QuotDt(EndOfTheDay(APeriodeAkhir));

  if AIDCabang <> '' then
    sSQL := sSQL + ' and cabangid = ' + QuotedStr(AIDCabang);

  lcds   := TDBUtils.OpenDataset(sSQL);
  Result := lcds;
end;

function TServerPenerimaanBarang.RetrieveCDSlip(AID : String): TFDJSONDataSets;
var
  sSQL: string;
begin
  Result := TFDJSONDataSets.Create;

  sSQL   := ' select * from vpenerimaanbarang_slip ' +
            ' where 1 = 1 ';

  if AID <> '' then
    sSQL := sSQL + ' and id = ' + QuotedStr(AID)
  else
    sSQL := sSQL + ' and id = newid()';


  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(sSQL));
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

function TServerPenerimaanBarang.SimpanAP(AOBject: TAppObject): Boolean;
var
  lAP: TAP;
  lPB: TPenerimaanBarang;
  lServerAP: TServerAP;
begin
  Result := False;

  lPB       := TPenerimaanBarang(AOBject);
  if lPB.JenisPembayaran = 'CASH' then
  begin
    Result := True;
    Exit;
  end;

  lServerAP := TServerAP.Create;
  try
    lAP := lServerAP.RetrieveTransaksi(lPB.ClassName, AOBject.ID);

    if lAP.TerBayar > 0 then
    raise Exception.Create('AP atas penerimaan Barang ' + lPB.NoBukti + ' Sudah Terbayar' + #13
                               + 'Data Tidak Bisa Diubah');

    lAP.Cabang := TCabang.CreateID(lPB.Cabang.ID);
    lAP.Supplier := TSupplier.CreateID(lPB.Supplier.ID);
    lAP.IDTransaksi := lPB.ID;
    lAP.NoBukti := lPB.NoBukti;
    lAP.Nominal := lPB.Total;
    lAP.Transaksi := lPB.ClassName;
    lAP.JatuhTempo:= lPB.TglBukti + lPB.Tempo;
    lAP.NoBuktiTransaksi := lPB.NoBukti;
    lAP.TglBukti := lPB.TglBukti;

    if lServerAP.SaveNoCommit(lAP) then
      Result := True;
  finally
    lServerAP.Free;
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

function TServerTransaction.DoJournal(ANoBukti : String; AModTransClass :
    String; AIsHapusJurnal : Integer): Boolean;
var
  sSQL: string;
begin
  Result := False;

  sSQL := 'update tgudang set kode = kode where id = NEWID()';
  if UpperCase(AModTransClass) = UpperCase(TPenerimaanBarang.ClassName) then
    sSQL := 'EXEC SP_PENERIMAAN_BARANG ' + QuotedStr(ANoBukti) + ',' + IntToStr(AIsHapusJurnal)
  else if UpperCase(AModTransClass) = UpperCase(TReturSupplier.ClassName) then
    sSQL := 'EXEC SP_RETUR_SUPPLIER ' + QuotedStr(ANoBukti) + ',' + IntToStr(AIsHapusJurnal)
  else if UpperCase(AModTransClass) = UpperCase(TPenjualan.ClassName) then
    sSQL := 'EXEC SP_PENJUALAN ' + QuotedStr(ANoBukti) + ',' + IntToStr(AIsHapusJurnal);;

  try
    if TDBUtils.ExecuteSQL(sSQL) then
      Result := True;
  except
    raise
  end;
end;

function TServerTransaction.GenerateNoBukti(ATglBukti : TdateTime; APrefix :
    String): string;
var
  iCounter: Integer;
  sSQL: string;
begin
  Result := APrefix + '/' + FormatDateTime('YYMM', ATglBukti) + '/' ;

  iCounter := 0;

  sSQL := 'select max(nobukti) as NoBukti from ' + GetTableName
          + ' where nobukti like ' + QuotedStr(Result + '%');

  with TDBUtils.OpenDataset(sSQL) do
  begin
    try
      if not IsEmpty then
      begin
        iCounter := StrToIntDef(RightStr(FieldByName('nobukti').AsString,_CounterNoBukti), 0);
      end;

      iCounter := iCounter + 1;

      Result := Result + TAppUtils.TambahkanKarakterNol(iCounter,_CounterNoBukti);
    finally
      Free;
    end;
  end;
end;

function TServerTransaction.RetrieveData(aPeriodeAwal, APeriodeAkhir :
    TDateTime; AIDCabang : String): TDataSet;
var
  lcds: TClientDataSet;
  sNamaView: string;
  sSQL: string;
begin
  sNamaView := StringReplace(Self.ClassName,'TServer', 'v', [rfReplaceAll]);

  sSQL := 'select * from ' + sNamaView +
          ' where tglbukti between ' + TAppUtils.QuotDt(StartOfTheDay(APeriodeAwal)) +
          ' and ' + TAppUtils.QuotDt(EndOfTheDay(APeriodeAkhir));

  if (AIDCabang <> '') and (AIDCabang <> 'XXX') then
    sSQL := sSQL + ' and cabangid = ' + QuotedStr(AIDCabang);

  lcds   := TDBUtils.OpenDataset(sSQL);
  Result := lcds;
end;

function TServerTransaction.RetrieveDataSiapJurnal(aPeriodeAwal, APeriodeAkhir
    : TDateTime): TDataSet;
var
  lcds: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select * from vtransaksisiapjurnal' +
          ' where tglbukti between ' + TAppUtils.QuotDt(StartOfTheDay(APeriodeAwal)) +
          ' and ' + TAppUtils.QuotDt(EndOfTheDay(APeriodeAkhir));

  lcds   := TDBUtils.OpenDataset(sSQL);
  Result := lcds;
end;

function TServerTransaction.RetrieveDataSlip(aPeriodeAwal, APeriodeAkhir :
    TDateTime; AIDCabang : String; AID : String): TFDJSONDataSets;
var
  sNamaView: string;
  sSQL: string;
begin
  Result := TFDJSONDataSets.Create;

  sNamaView := StringReplace(Self.ClassName,'TServer', 'v', [rfReplaceAll]);
  sNamaView := sNamaView + '_slip';

  sSQL := 'select * from ' + sNamaView +
          ' where tglbukti between ' + TAppUtils.QuotDt(StartOfTheDay(APeriodeAwal)) +
          ' and ' + TAppUtils.QuotDt(EndOfTheDay(APeriodeAkhir));

  if AIDCabang <> 'XXX' then
    sSQL := sSQL + ' and cabangid = ' + QuotedStr(AIDCabang);

  if AID <> 'XXX' then
    sSQL := sSQL + ' and id = ' + QuotedStr(AID);

  sSQL := sSQL + ' order by nobukti,urutan';

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(sSQL));
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
  sSQL := 'select * from vaccountall' +
          ' order by kode ';

  Result := TDBUtils.OpenQuery(sSQL);

end;

function TServerLaporan.LaporanKartok(ATglAwal , ATglAkhir : TDateTime; ABarang
    : TBarang; AGudang : TGudang): TFDJSONDataSets;
var
  sSQL: string;
begin
  Result := TFDJSONDataSets.Create;
  sSQL := 'select a.*' +
          ' from vcabang a ' +
          ' INNER JOIN tgudang b on a.id = b.cabang ' +
          ' where b.id = ' + QuotedStr(AGudang.ID);

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(sSQL));

  sSQL := 'select * from SP_KARTOK(' +
          TAppUtils.QuotDt(StartOfTheDay(ATglAwal)) + ',' +
          TAppUtils.QuotDt(EndOfTheDay(ATglAkhir)) + ',' +
          QuotedStr(ABarang.ID) + ',' +
          QuotedStr(AGudang.ID) + ')';

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(sSQL));
end;

function TServerLaporan.LaporanKarAP(ATglAwal , ATglAkhir : TDateTime;
    ASupplier : TSupplier; ACabang : TCabang; ANoAP : String): TFDJSONDataSets;
var
  sSQL: string;
begin
  Result := TFDJSONDataSets.Create;
  sSQL := 'select a.*' +
          ' from vcabang a ' +
          ' where a.id = ' + QuotedStr(ACabang.ID);

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(sSQL));

  sSQL := 'select * from SP_KARAP(' +
          TAppUtils.QuotDt(StartOfTheDay(ATglAwal)) + ',' +
          TAppUtils.QuotDt(EndOfTheDay(ATglAkhir)) + ',' +
          QuotedStr(ASupplier.ID) + ',' +
          QuotedStr(ACabang.ID) + ')';

  if ANoAP <> 'XXX' then
    sSQL := sSQL + ' where NO_AP = ' + QuotedStr(ANoAP);


  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(sSQL));
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
            ' WHERE TGLBUKTI BETWEEN ' + TAppUtils.QuotDt(StartOfAMonth(ATahun,ABulan)) +
            ' AND ' + TAppUtils.QuotDt(EndOfAMonth(ATahun,ABulan));

  Result := TDBUtils.OpenDataset(sSQL);
end;

function TServerLaporan.RetrieveCDSTAGRequestKepada(ATglAwal , ATglAkhir :
    TDateTime;ACabang : TCabang): TDataSet;
var
  sSQL: string;
begin
  sSQL := 'select * from vtagrequest a' +
          ' where a.tglbukti between ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal))+
          ' and ' + TAppUtils.QuotDt(EndOfTheDay(ATglAkhir));

  if ACabang <> nil then
    sSQL := sSQL + ' and a.cabangid = ' + QuotedStr(ACabang.ID);

  Result := TDBUtils.OpenDataset(sSQL);

end;

function TServerLaporan.RetrieveCDSTAGRequestDari(ATglAwal , ATglAkhir :
    TDateTime;ACabang : TCabang): TDataSet;
var
  sSQL: string;
begin
  sSQL := 'select * from vtagrequest a' +
          ' where a.tglbukti between ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal))+
          ' and ' + TAppUtils.QuotDt(EndOfTheDay(ATglAkhir));

  if ACabang <> nil then
    sSQL := sSQL + ' and a.tocabangid = ' + QuotedStr(ACabang.ID);

  Result := TDBUtils.OpenDataset(sSQL);
end;

function TServerLaporan.RetrieveTACKirim(ATglAwal , ATglAkhir : TDateTime;
    ACabang : TCabang): TDataSet;
var
  sSQL: string;
begin
  sSQL := 'select * from vtackirim a' +
          ' where a.tglbukti between ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal))+
          ' and ' + TAppUtils.QuotDt(EndOfTheDay(ATglAkhir));

  if ACabang <> nil then
    sSQL := sSQL + ' and a.cabangid = ' + QuotedStr(ACabang.ID);

  Result := TDBUtils.OpenDataset(sSQL);
end;

function TServerLaporan.RetrieveGaji(ATahun, ABulan : Integer): TDataSet;
var
  sSQL: string;
begin
  sSQL   := ' select * from vmukafaah' +
            ' where bulan = ' + IntToStr(ABulan) +
            ' and tahun = ' + IntToStr(ATahun);

  Result := TDBUtils.OpenDataset(sSQL);
end;

function TServerLaporan.RetrieveTACTerima(ATglAwal , ATglAkhir : TDateTime;
    ACabang : TCabang): TDataSet;
var
  sSQL: string;
begin
  sSQL := 'select * from vtacterima a' +
          ' where a.tglbukti between ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal))+
          ' and ' + TAppUtils.QuotDt(EndOfTheDay(ATglAkhir));

  if ACabang <> nil then
    sSQL := sSQL + ' and a.cabangid = ' + QuotedStr(ACabang.ID);

  Result := TDBUtils.OpenDataset(sSQL);
end;

function TServerLaporan.RetrieveTransferAntarGudang(ATglAwal , ATglAkhir :
    TDateTime;ACabang : TCabang): TDataSet;
var
  sSQL: string;
begin
  sSQL := 'select * from vtransferantargudang a' +
          ' where a.tglbukti between ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal))+
          ' and ' + TAppUtils.QuotDt(EndOfTheDay(ATglAkhir));

  if ACabang <> nil then
    sSQL := sSQL + ' and a.cabangid = ' + QuotedStr(ACabang.ID);

  Result   := TDBUtils.OpenDataset(sSQL);
end;

{ TLaporan }

function TServerLaporan.RetriveMutasiBarang(ATglAwal , ATglAkhir : TDateTime;
    ACabang : TCabang; AGudang : TGudang): TDataset;
var
  sSQL : String;
begin
  sSQL := 'select * ' +
          ' from SP_INVENTORY_MOVEMENT(' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal)) + ',' + TAppUtils.QuotDt(EndOfTheDay(ATglAkhir)) + ')' +
          ' where 1 = 1 ';

  if (ACabang <> nil) and (ACabang.ID <> '') then
    sSQL := sSQL + ' and cabang = ' + QuotedStr(ACabang.ID);

  if (AGudang <> nil) and (AGudang.ID <> '') then
    sSQL := sSQL + ' and gudang = ' + QuotedStr(AGudang.ID);

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

function TServerLaporan.RetrivePengeluaranKas(ATglAwal , ATglAtglAkhir :
    TDateTime; ACabang : TCabang): TDataset;
var
  sSQL : String;
begin
  sSQL := 'SELECT * FROM vpengeluaran_kas A' +
          ' where a.tglbukti between ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal))+
          ' and ' + TAppUtils.QuotDt(EndOfTheDay(ATglAtglAkhir));

  if ACabang <> nil then
    sSQL := sSQL + ' and a.cabangID = ' + QuotedStr(ACabang.ID);

  Result   := TDBUtils.OpenDataset(sSQL);
end;

{ TLaporan }

function TServerLaporan.RetriveJurnal(ATglAwal , ATglAtglAkhir : TDateTime;
    ACabang : TCabang; AJenisJurnal : String): TDataset;
var
  sSQL : String;
begin
  sSQL := 'SELECT * FROM vjurnal A' +
          ' where a.tglbukti between ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal))+
          ' and ' + TAppUtils.QuotDt(EndOfTheDay(ATglAtglAkhir));

  if ACabang <> nil then
    sSQL := sSQL + ' and a.cabangID = ' + QuotedStr(ACabang.ID);

  if AJenisJurnal <> '' then
    sSQL := sSQL + ' and a.transaksi = ' + QuotedStr(AJenisJurnal);


  Result   := TDBUtils.OpenDataset(sSQL);
end;

{ TLaporan }

function TServerLaporan.LaporanPenerimaanBarang(ATglAwal , AtglAkhir :
    TDateTime; ACabang : TCabang; AGudang : TGudang): TDataset;
var
  sSQL : String;
begin
  sSQL := 'select * ' +
          ' from vlaporanpenerimaanbarang' +
          ' where tglbukti between ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal)) +
          ' and ' + TAppUtils.QuotDt(EndOfTheDay(AtglAkhir)) ;

  if (ACabang <> nil) and (ACabang.ID <> '') then
    sSQL := sSQL + ' and cabang = ' + QuotedStr(ACabang.ID);

  if (AGudang <> nil) and (AGudang.ID <> '') then
    sSQL := sSQL + ' and gudang = ' + QuotedStr(AGudang.ID);

  sSQL := sSQL + ' ORDER BY NOBUKTI';

  Result   := TDBUtils.OpenDataset(sSQL);
end;

{ TLaporan }

function TServerLaporan.LaporanAP(ATglAwal , AtglAkhir : TDateTime; ACabang :
    TCabang; AIsTglJatuhTempo : Boolean): TFDJSONDataSets;
var
  sSQL : String;
begin
  Result := TFDJSONDataSets.Create;

  sSQL := 'select a.*' +
          ' from vcabang a ' +
          ' where a.id = ' + QuotedStr(ACabang.ID);

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(sSQL));

  sSQL := 'select * ' +
          ' from vdaftarap ' +
          ' where 1 = 1 ';

  if AIsTglJatuhTempo then
    sSQL := sSQL + ' and jatuh_tempo between ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal)) +
          ' and ' + TAppUtils.QuotDt(EndOfTheDay(AtglAkhir))
  else
    sSQL := sSQL + ' and tglbukti between ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal)) +
          ' and ' + TAppUtils.QuotDt(EndOfTheDay(AtglAkhir));


  if (ACabang <> nil) and (ACabang.ID <> '') then
    sSQL := sSQL + ' and cabang = ' + QuotedStr(ACabang.ID);

  sSQL := sSQL + ' ORDER BY NOBUKTI';

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(sSQL));
end;

{ TLaporan }

function TServerLaporan.LaporanAR(ATglAwal , AtglAkhir : TDateTime; ACabang :
    TCabang; AIsTglJatuhTempo : Boolean): TFDJSONDataSets;
var
  sSQL : String;
begin
  Result := TFDJSONDataSets.Create;

  sSQL := 'select a.*' +
          ' from vcabang a ' +
          ' where a.id = ' + QuotedStr(ACabang.ID);

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(sSQL));

  sSQL := 'select * ' +
          ' from vdaftarar ' +
          ' where 1 = 1 ';

  if AIsTglJatuhTempo then
    sSQL := sSQL + ' and jatuh_tempo between ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal)) +
          ' and ' + TAppUtils.QuotDt(EndOfTheDay(AtglAkhir))
  else
    sSQL := sSQL + ' and tglbukti between ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal)) +
          ' and ' + TAppUtils.QuotDt(EndOfTheDay(AtglAkhir));


  if (ACabang <> nil) and (ACabang.ID <> '') then
    sSQL := sSQL + ' and cabang = ' + QuotedStr(ACabang.ID);

  sSQL := sSQL + ' ORDER BY NOBUKTI';

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(sSQL));
end;

{ TLaporan }

function TServerLaporan.LaporanReturSupplier(ATglAwal , AtglAkhir : TDateTime;
    ACabang : TCabang): TFDJSONDataSets;
var
  sSQL : String;
begin
  Result := TFDJSONDataSets.Create;

  sSQL := 'select a.*' +
          ' from vcabang a ' +
          ' where a.id = ' + QuotedStr(ACabang.ID);

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(sSQL));

  sSQL := 'select * ' +
          ' from vlaporanretursupplier ' +
          ' where 1 = 1 ' +
          ' and tglbukti between ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal)) +
          ' and ' + TAppUtils.QuotDt(EndOfTheDay(AtglAkhir));


  if (ACabang <> nil) and (ACabang.ID <> '') then
    sSQL := sSQL + ' and cabang = ' + QuotedStr(ACabang.ID);

  sSQL := sSQL + ' ORDER BY NOBUKTI';

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(sSQL));
end;

function TServerLaporan.LaporanKarAR(ATglAwal , ATglAkhir : TDateTime;
    ACustomer : TSupplier; ACabang : TCabang; ANoAR : String): TFDJSONDataSets;
var
  sSQL: string;
begin
  Result := TFDJSONDataSets.Create;
  sSQL := 'select a.*' +
          ' from vcabang a ' +
          ' where a.id = ' + QuotedStr(ACabang.ID);

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(sSQL));

  sSQL := 'select * from SP_KARAR(' +
          TAppUtils.QuotDt(StartOfTheDay(ATglAwal)) + ',' +
          TAppUtils.QuotDt(EndOfTheDay(ATglAkhir)) + ',' +
          QuotedStr(ACustomer.ID) + ',' +
          QuotedStr(ACabang.ID) + ')';

  if ANoAR <> 'XXX' then
    sSQL := sSQL + ' where NO_AR = ' + QuotedStr(ANoAR);

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(sSQL));
end;

{ TLaporan }

function TServerLaporan.LaporanNeracaSaldo(ATglAwal , AtglAkhir : TDateTime;
    AIsKonsolidasi : Integer; ACabang : TCabang): TFDJSONDataSets;
var
  sSQL : String;
begin
  Result := TFDJSONDataSets.Create;

  sSQL := 'select a.*' +
          ' from vcabang a ' +
          ' where 1 = 1';

  if AIsKonsolidasi = 1 then
    sSQL := sSQL + ' and is_ho = 1'
  else
    sSQL := sSQL + ' and a.id = ' + QuotedStr(ACabang.ID);

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(sSQL));

  sSQL := 'select * from SP_NERACA_SALDO('  + TAppUtils.QuotDt(StartOfTheDay(ATglAwal)) + ','
                                            + TAppUtils.QuotDt(EndOfTheDay(AtglAkhir)) + ','
                                            + IntToStr(AIsKonsolidasi) + ','
                                            + QuotedStr(ACabang.ID) + ')'
                                            + ' ORDER BY kode';

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(sSQL));
end;

{ TLaporan }

function TServerLaporan.LaporanLabaRugi(ATglAwal , AtglAkhir : TDateTime):
    TFDJSONDataSets;
var
  sSQL : String;
begin
  Result := TFDJSONDataSets.Create;

  sSQL := 'select a.*' +
          ' from vcabang a ' +
          ' where 1 = 1';

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(sSQL));

  sSQL := 'select a.*' +
          ' from VLABARUGI a ' +
          ' where a.tglbukti between ' + TAppUtils.QuotDt(ATglAwal) + ' and ' + TAppUtils.QuotDt(AtglAkhir) +
          ' order by a.urutan, a.tglbukti';


  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(sSQL));
end;

{ TLaporan }

function TServerLaporan.LaporanLabaRugiDS(ATglAwal , AtglAkhir : TDateTime):
    TDataset;
var
  sSQL : String;
begin
  sSQL := 'select a.*' +
          ' from VLABARUGI a ' +
          ' where a.tglbukti between ' + TAppUtils.QuotDt(ATglAwal) + ' and ' + TAppUtils.QuotDt(AtglAkhir) +
          ' order by a.urutan, a.tglbukti';

  Result := TDBUtils.OpenDataset(sSQL);
end;

{ TLaporan }

function TServerLaporan.LaporanPenjualanByPembeli(ATglAwal , AtglAkhir :
    TDateTime; AIsKonsolidasi : Integer; ACabang : TCabang): TFDJSONDataSets;
var
  sSQL : String;
begin
  Result := TFDJSONDataSets.Create;

  sSQL := 'select a.*' +
          ' from vcabang a ' +
          ' where 1 = 1';

  if AIsKonsolidasi = 1 then
    sSQL := sSQL + ' and is_ho = 1'
  else
    sSQL := sSQL + ' and a.id = ' + QuotedStr(ACabang.ID);

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(sSQL));

  sSQL := 'select * from vpenjualan_detail' +
          ' where tglbukti >= ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal)) +
          ' and tglbukti <= ' +  TAppUtils.QuotDt(EndOfTheDay(AtglAkhir));

  if AIsKonsolidasi = 1 then
    sSQL := sSQL + ' and is_ho = 1'
  else
    sSQL := sSQL + ' and cabangid = ' + QuotedStr(ACabang.ID);

  sSQL := sSQL + ' ORDER BY pembeli,tglbukti,nobukti';


  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(sSQL));

end;

{ TLaporan }

function TServerLaporan.RetrivePenarikanDeposit(ATglAwal , ATglAtglAkhir :
    TDateTime; ACabang : TCabang): TDataset;
var
  sSQL : String;
begin
  sSQL := 'select * from vpenarikandeposit ' +
          ' where tanggal between ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal))+
          ' and ' + TAppUtils.QuotDt(EndOfTheDay(ATglAtglAkhir));

//  if ACabang <> nil then
//    sSQL := sSQL + ' and a.cabangID = ' + QuotedStr(ACabang.ID);

  Result   := TDBUtils.OpenDataset(sSQL);
end;

{ TLaporan }

function TServerLaporan.RetriveSetoranModal(ATglAwal , ATglAtglAkhir :
    TDateTime; ACabang : TCabang): TDataset;
var
  sSQL : String;
begin
  sSQL := 'select * from vsetoranmodal a' +
          ' where a.tanggal between ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal))+
          ' and ' + TAppUtils.QuotDt(EndOfTheDay(ATglAtglAkhir));

//  if ACabang <> nil then
//    sSQL := sSQL + ' and a.cabangid = ' + QuotedStr(ACabang.ID);

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

  if HapusAR(AOBject) then
    if SimpanStockSekarang(AOBject, True) then
      if HapusMutasi(TReturSupplier(AOBject).NoBukti) then
        Result := True;
end;

function TServerReturSupplier.AfterSave(AOBject : TAppObject): Boolean;
begin
  Result := False;

  if SimpanAR(AOBject) then
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

function TServerReturSupplier.GetServerAR: TServerAR;
begin
  if FServerAR = nil then
    FServerAR := TServerAR.Create;

  Result := FServerAR;
end;

function TServerReturSupplier.HapusAR(AOBject: TAppObject): Boolean;
var
  lAR: TAR;
  lRS: TReturSupplier;
begin
  Result := False;

  lRS       := TReturSupplier(AOBject);
  lAR := ServerAR.RetrieveTransaksi(lRS.ClassName, AOBject.ID);

  if ServerAR.DeleteNoCommit(lAR) then
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

function TServerReturSupplier.SimpanAR(AOBject: TAppObject): Boolean;
var
  lAR: TAR;
  lPB: TPenerimaanBarang;
  lRS: TReturSupplier;
begin
  Result := False;

  lRS       := TReturSupplier(AOBject);
  with TServerPenerimaanBarang.Create do
  begin
    try
      lPB := Retrieve(lRS.PenerimaanBarang.ID);
      if lPB.JenisPembayaran = 'CASH' then
      begin
        Result := True;
        Exit;
      end;
    finally
      Free;
    end;
  end;

  lAR := ServerAR.RetrieveTransaksi(lRS.ClassName, AOBject.ID);
  lAR.Cabang := TCabang.CreateID(lRS.Cabang.ID);
  lAR.Customer := TSupplier.CreateID(lRS.Supplier.ID);
  lAR.IDTransaksi := lRS.ID;
  lAR.NoBukti := lRS.NoBukti;
  lAR.Nominal := lRS.Total;
  lAR.Transaksi := lRS.ClassName;
  lAR.JatuhTempo:= lRS.TglBukti;
  lAR.NoBuktiTransaksi := lRS.NoBukti;
  lAR.TglBukti := lRS.TglBukti;

  if ServerAR.SaveNoCommit(lAR) then
    Result := True;

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
    lCDS.Free;
    lServerClosingInventory.Free;
  except
    ADConnection.Rollback;
    raise
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

destructor TServerPenjualan.Destroy;
begin
  inherited;
  ServerAR.Free;
  ServerPenerimaanKas.Free;
end;

function TServerPenjualan.BeforeDelete(AOBject : TAppObject): Boolean;
begin
  Result := False;

  if HapusARAP(AOBject) then
  begin
    Result := True;
  end;
end;

function TServerPenjualan.AfterSave(AOBject : TAppObject): Boolean;
begin
  Result := False;


  if SimpanARAP(AOBject) then
    Result := True;

end;

function TServerPenjualan.BeforeSave(AOBject : TAppObject): Boolean;
//var
//  lPenjualanLama: TPenjualan;
begin
//  Result := False;
//
//  lPenjualanLama := Retrieve(AOBject.ID);
//  try
//    if AOBject.ObjectState <> 1 then
//    begin
//       if NOT SimpanStockSekarang(lPenjualanLama, True) then
//        Exit;
//    end;
//  finally
//    lPenjualanLama.Free;
//  end;

  with TPenjualan(AOBject) do
  begin
    JatuhTempo := TglBukti + TermOfPayment;
  end;

  Result := True;

end;

function TServerPenjualan.GetSaldoDeposit(ASupplier : TSupplier; AExcludeNo :
    String): Double;
var
  sSQL: string;
begin
//  Result := 0;

  sSQL := 'select SUM(A.nominal-A.terbayar) as deposit' +
          ' FROM tap a ' +
          ' INNER JOIN tsupplier b on a.supplier = b.id ' +
          ' where b.id = ' + QuotedStr(ASupplier.ID) +
          ' and a.nobukti <> ' + QuotedStr(AExcludeNo);

  with TDBUtils.OpenDataset(sSQL) do
  begin
    try
      Result := FieldByName('deposit').AsFloat;
    finally
      Free;
    end;
  end;


end;

function TServerPenjualan.GetPenjualanPeriode(ASupplier : TSupplier; ATglAwal,
    ATglAkhir : TDateTime; AExcludeNo : String): Double;
var
  sSQL: string;
begin
//  Result := 0;

  sSQL := 'select sum(TOTAL) as Total from tpenjualan a' +
          ' INNER JOIN tsupplier b on a.pembeli = b.id ' +
          ' where a.tglbukti BETWEEN ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal)) +
          ' and ' + TAppUtils.QuotDt(EndOfTheDay(ATglAkhir)) +
          ' and a.nobukti <> ' + QuotedStr(AExcludeNo) +
          ' and b.id = ' + QuotedStr(ASupplier.ID);

  with TDBUtils.OpenDataset(sSQL) do
  begin
    try
      Result := FieldByName('Total').AsFloat;
    finally
      Free;
    end;
  end;


end;

function TServerPenjualan.GetServerAR: TServerAR;
begin
  if FServerAR = nil then
    FServerAR := TServerAR.Create;

  Result := FServerAR;
end;

function TServerPenjualan.GetServerAp: TServerAP;
begin
  if FServerAp = nil then
    FServerAp := TServerAP.Create;

  Result := FServerAp;
end;

function TServerPenjualan.GetServerPenerimaanKas: TServerPenerimaanKas;
begin
  if FServerPenerimaanKas = nil then
    FServerPenerimaanKas := TServerPenerimaanKas.Create;

  Result := FServerPenerimaanKas;
end;

function TServerPenjualan.HapusARAP(AOBject: TAppObject): Boolean;
var
  lAP: TAP;
  lAR: TAR;
  lPJ: TPenjualan;
begin
  Result := False;

  lPJ       := TPenjualan(AOBject);
  if lPJ.JenisPembayaran = 'DEPOSIT' then
  begin
    lAP := ServerAP.RetrieveTransaksi(lPJ.ClassName, AOBject.ID);
    if ServerAP.DeleteNoCommit(lAP) then
      Result := True;
  end else begin
    lAR := ServerAR.RetrieveTransaksi(lPJ.ClassName, AOBject.ID);
    if ServerAR.DeleteNoCommit(lAR) then
      Result := True;
  end;
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

  if AID = '' then
    Exit;

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
    ACabang : TCabang; ANoBukti : String): TFDJSONDataSets;
var
  sSQL: string;
begin
  Result := TFDJSONDataSets.Create;

  sSQL := 'select * from VPenjualanSlip' +
          ' where tglbukti between ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal)) +
          ' and ' + TAppUtils.QuotDt(EndOfTheDay(ATglAtglAkhir)) +
          ' and nobukti like ' + QuotedStr('%' + Trim(ANoBukti) + '%');

  if ACabang <> nil then
    sSQL := sSQL + ' and cabangid = ' + QuotedStr(ACabang.ID);

  TFDJSONDataSetsWriter.ListAdd(Result,TDBUtils.OpenQuery(sSQL))
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

function TServerPenjualan.SaveToDBDibayar(APenjualan : TPenjualan; ADibayar :
    Double): Boolean;
begin
  Result := False;

  ADConnection.StartTransaction;
  try
    if SaveNoCommit(APenjualan) then
    begin
      if SimpanBayar(APenjualan,ADibayar) then
      begin
        ADConnection.Commit;
        Result := True;
      end else
        ADConnection.Rollback;
    end else
      ADConnection.Rollback;
  except
    ADConnection.Rollback;
    raise
  end;
end;

function TServerPenjualan.SimpanARAP(AOBject: TAppObject): Boolean;
var
  lAP: TAP;
//  lAR: TAR;
  lPJ: TPenjualan;
begin
  Result := False;

  lPJ       := TPenjualan(AOBject);

  if lPJ.JenisPembayaran = 'DEPOSIT' then
  begin
    lAP                   := ServerAP.RetrieveTransaksi(lPJ.ClassName, AOBject.ID);
    lAP.Cabang            := TCabang.CreateID(lPJ.Cabang.ID);
    lAP.Supplier          := TSupplier.CreateID(lPJ.Pembeli.ID);
    lAP.IDTransaksi       := lPJ.ID;
    lAP.NoBukti           := lPJ.NoBukti;
    lAP.Nominal           := -1 * lPJ.Total;
    lAP.Transaksi         := lPJ.ClassName;
    lAP.JatuhTempo        := lPJ.JatuhTempo;
    lAP.NoBuktiTransaksi  := lPJ.NoBukti;
    lAP.TglBukti          := lPJ.TglBukti;

    if ServerAp.SaveNoCommit(lAP) then
      Result := True;
  end else begin
//    lAR                   := ServerAR.RetrieveTransaksi(lPJ.ClassName, AOBject.ID);
//    lAR.Cabang            := TCabang.CreateID(lPJ.Cabang.ID);
//    lAR.Customer          := TSupplier.CreateID(lPJ.Pembeli.ID);
//    lAR.IDTransaksi       := lPJ.ID;
//    lAR.NoBukti           := lPJ.NoBukti;
//    lAR.Nominal           := lPJ.Total;
//    lAR.Transaksi         := lPJ.ClassName;
//    lAR.JatuhTempo        := lPJ.JatuhTempo;
//    lAR.NoBuktiTransaksi  := lPJ.NoBukti;
//    lAR.TglBukti          := lPJ.TglBukti;
//
//    if ServerAR.SaveNoCommit(lAR) then
      Result := True;
  end;

end;

function TServerPenjualan.SimpanBayar(APenjualan : TPenjualan; ADibayar :
    Double): Boolean;
var
  lAR: TAR;
  lPenerimaanKas: TPenerimaanKas;
  lPenerimaanKasAR: TPenerimaanKasAR;
begin
  Result := True;
  Exit;

  lPenerimaanKas := TPenerimaanKas.Create();
  try
    lPenerimaanKas.Cabang         := TCabang.CreateID(APenjualan.Cabang.ID);
    lPenerimaanKas.JenisTransaksi := 'CASH';
    lPenerimaanKas.Keterangan     := 'TUNAI';
    lPenerimaanKas.NoBukti        := APenjualan.NoBukti;
    lPenerimaanKas.Nominal        := APenjualan.Total;
    lPenerimaanKas.Pembeli        := TSupplier.CreateID(APenjualan.Pembeli.ID);
    lPenerimaanKas.Petugas        := APenjualan.Kasir;

    lPenerimaanKas.RekBank        := TRekBank.CreateID(SettingAppServer.RekBankCash.ID);
    lPenerimaanKas.TglBukti       := APenjualan.TglBukti;

    lPenerimaanKasAR              := TPenerimaanKasAR.Create();
    lPenerimaanKasAR.Keterangan   := 'TUNAI';
    lPenerimaanKasAR.Nominal      := APenjualan.Total;
    lPenerimaanKasAR.UangBayar    := ADibayar;

    lAR                           := ServerAR.RetrieveTransaksi(APenjualan.ClassName, APenjualan.ID);
    try
      lPenerimaanKasAR.AR         := TAR.CreateID(lAR.ID);
      lPenerimaanKas.PenerimaanKasARItems.Add(lPenerimaanKasAR);

      if ServerPenerimaanKas.SaveNoCommit(lPenerimaanKas) then
        Result := True;
    finally
      lAR.Free;
    end;
  finally
    lPenerimaanKas.Free;
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

function TServerAR.RetrieveTransaksi(ATransaksi : String; AIDTransaksi :
    String): TAR;
var
  sID: string;
  sSQL: string;
begin
  sSQL   := 'select ID from tar' +
            ' where transaksi = ' + QuotedStr(ATransaksi) +
            ' and idtransaksi = ' + QuotedStr(AIDTransaksi);

  sID := '';
  with TDBUtils.OpenDataset(sSQL) do
  begin
    try
      while not Eof do
      begin
        sID := FieldByName('id').AsString;
        Next;
      end;
    finally
      Free;
    end;
  end;

  with TServerAR.Create do
  begin
    try
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
begin
  Result := False;

  if AAppObject= nil then
    Exit;

  if UpdateARTerbayar(TPenerimaanKas(AAppObject), True) then
  begin
    if SimpanAPNew(AAppObject) then
      Result := True;
  end;
end;

function TServerPenerimaanKas.BeforeDelete(AAppObject : TAppObject): Boolean;
begin
  Result := False;

  if AAppObject= nil then
    Exit;

  if UpdateARTerbayar(TPenerimaanKas(AAppObject), False) then
  begin
    if HapusAP(AAppObject) then
      Result := True;
  end;
end;

function TServerPenerimaanKas.BeforeSave(AAppObject : TAppObject): Boolean;
var
  I: Integer;
  lPK: TPenerimaanKas;
begin
  Result := False;

  if AAppObject= nil then
    Exit;

  lPK := TPenerimaanKas(AAppObject);


  for I := 0 to lPK.PenerimaanKasAPNewItems.Count - 1 do
  begin
    lPK.PenerimaanKasAPNewItems[i].AP             := TAP.CreateID(TDBUtils.GetNextIDGUIDToString);
    lPK.PenerimaanKasAPNewItems[i].AP.ObjectState := 1;
  end;

  if UpdateARTerbayar(TPenerimaanKas(AAppObject), False) then
    if HapusAP(AAppObject) then
      Result := True;
end;

function TServerPenerimaanKas.GetServerAR: TServerAR;
begin
  if FServerAR = nil then
    FServerAR := TServerAR.Create;

  Result := FServerAR;
end;

function TServerPenerimaanKas.GetServerAP: TServerAP;
begin
  if FServerAP = nil then
    FServerAP := TServerAP.Create;

  Result := FServerAP;
end;

function TServerPenerimaanKas.HapusAP(AOBject: TAppObject): Boolean;
var
  lAP: TAP;
  lPK: TPenerimaanKas;
  I: Integer;
begin
//  Result := False;

  lPK       := Retrieve(AOBject.ID);
  try
    for I := 0 to lPK.PenerimaanKasAPNewItems.Count - 1 do
    begin
      lAP := ServerAP.RetrieveTransaksi(lPK.PenerimaanKasAPNewItems[i].ClassName, lPK.PenerimaanKasAPNewItems[i].ID);
      if lAP.TerBayar > 0 then
        raise Exception.Create('AP atas penerimaan Kas' + lPK.NoBukti + ' Sudah Terbayar' + #13
                               + 'Data Tidak Bisa Diubah');

      if ServerAP.DeleteNoCommit(lAP) then
    end;

    lPK.Free;
    Result := True;
  except
    raise
  end;
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
    TDateTime; ACabang : TCabang; ANoBukti : String): TFDJSONDataSets;
var
  sSQL: string;
begin
  Result := TFDJSONDataSets.Create;

  sSQL   := 'select * from vpenerimaan_kas_slip a ' +
            ' where tglbukti between ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal)) +
            ' and ' + TAppUtils.QuotDt(EndOfTheDay(ATglAtglAkhir)) +
            ' and nobukti like ' + QuotedStr('%' + Trim(ANoBukti) + '%');

  if ACabang <> nil then
    sSQL := sSQL + ' and cabangid = ' + QuotedStr(ACabang.ID);

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(sSQL))

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

function TServerPenerimaanKas.SimpanAPNew(AOBject: TAppObject): Boolean;
var
//  lAP: TAP;
  lPK: TPenerimaanKas;
  I: Integer;
begin
  Result := False;

  lPK       := TPenerimaanKas(AOBject);
  if lPK.PenerimaanKasAPNewItems.Count = 0 then
  begin
    Result := True;
    Exit;
  end;

  for I := 0 to lPK.PenerimaanKasAPNewItems.Count - 1 do
  begin
    try
      with lPK.PenerimaanKasAPNewItems[i].AP do
      begin
        Cabang            := TCabang.CreateID(lPK.Cabang.ID);
        Supplier          := TSupplier.CreateID(lPK.Pembeli.ID);
        IDTransaksi       := lPK.PenerimaanKasAPNewItems[i].ID;

        NoBukti           := lPK.NoBukti + '-' + IntToStr(i+1);
        NoBuktiTransaksi  := NoBukti;

        Nominal           := lPK.PenerimaanKasAPNewItems[i].Nominal;
        Transaksi         := lPK.PenerimaanKasAPNewItems[i].ClassName;
        JatuhTempo        := lPK.TglBukti + 7;

        TglBukti          := lPK.TglBukti;

        if ServerAP.SaveNoCommit(lPK.PenerimaanKasAPNewItems[i].AP) then
          Result := True;
      end;
    finally
    end;
  end;

end;

function TServerPenerimaanKas.UpdateARTerbayar(APenerimaanKas : TPenerimaanKas;
    AIsBayar : Boolean): Boolean;
var
  sFilterID: string;
  sOperator: string;
  sSQL: string;
begin
  Result := False;

  sOperator := '-';
  if AIsBayar then
    sOperator := '+';

  if APenerimaanKas.ID = '' then
    sFilterID := 'newid()'
  else
    sFilterID := QuotedStr(APenerimaanKas.ID);

  sSQL := 'update a set a.terbayar = isnull(a.terbayar,0) ' + sOperator + ' b.nominal' +
          ' from tar a ' +
          ' INNER JOIN tpenerimaankasar b on a.id = b.ar ' +
          ' where b.penerimaankas = ' + sFilterID;

  if TDBUtils.ExecuteSQL(sSQL) then
    Result := True;
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

function TServerRekBank.RetrieveRek(ANorek : String): TRekBank;
var
  sID: string;
  sSQL: string;
begin
  Result := TRekBank.Create;

  sSQL   := 'select id from trekbank ' +
            ' where norek = ' + QuotedStr(ANorek);

  sID    := '-';
  with TDBUtils.OpenQuery(sSQL) do
  begin
    try
      if not IsEmpty then
        sID := FieldByName('id').AsString;

    Finally
      Free;
    End;
  end;

  TDBUtils.LoadFromDB(Result, sID);
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
  I: Integer;
  lQ: TClientDataSet;
  lTAGLama: TTransferAntarGudang;
  sSQL: string;
begin
  Result := False;


  if AOBject.ObjectState = 1 then
  begin
    with TTransferAntarGudang(AOBject) do
    begin
      sSQL := 'select * from tstocksekarang' +
            ' where gudang = ' + QuotedStr(GudangAsal.ID);

      lQ := TDBUtils.OpenDataset(sSQL);
      try
        for I := 0 to TransferAntarGudangItems.Count - 1 do
        begin
          lQ.Filter := 'barang = ' + QuotedStr(TransferAntarGudangItems[i].ID);
          TransferAntarGudangItems[i].Harga := lQ.FieldByName('rp').AsFloat / lQ.FieldByName('qty').AsFloat * TransferAntarGudangItems[i].Konversi;

        end;
      finally
        lQ.Free;
      end;
    end;
  end;


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
var
  I: Integer;
  sSQL: string;
begin
  Result := TTransferAntarGudang.Create;
  TDBUtils.LoadFromDB(Result, AID);

  sSQL := 'select c.* from TTransferAntarGudang a' +
          ' inner join TTransferAntarGudangitem b on a.id = b.TransferAntarGudang' +
          ' inner join tbarangsatuanitem c on b.barang = c.barang and b.uom=c.uom' +
          ' where 1 = 1' ;

  if (AID = '') or (UpperCase(AID) = 'xxx') then
    sSQL := sSQL + ' and a.id = newid()'
  else
    sSQL := sSQL + ' and a.id = ' + QuotedStr(AID);

  with TDBUtils.OpenDataset(sSQL) do
  begin
    try
      for I := 0 to Result.TransferAntarGudangItems.Count - 1 do
      begin
        First;
        while not Eof do
        begin
          if FieldByName('barang').AsString = Result.TransferAntarGudangItems[i].Barang.ID then
            if FieldByName('uom').AsString = Result.TransferAntarGudangItems[i].UOM.ID then
            begin
              Result.TransferAntarGudangItems[i].BarangSatuangItemID := FieldByName('ID').AsString;
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

function TServerTransferAntarGudang.RetrieveCDSlip(ATglAwal , ATglAtglAkhir :
    TDateTime; ACabang : TCabang; ANoBukti : String): TDataset;
var
  sSQL: string;
begin
  sSQL   := 'select * from vtransferantargudang_slip a ' +
            ' where tglbukti between ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal)) +
            ' and ' + TAppUtils.QuotDt(EndOfTheDay(ATglAtglAkhir)) +
            ' and nobukti like ' + QuotedStr('%' + Trim(ANoBukti) + '%');

  if ACabang <> nil then
    sSQL := ' and cabangid = ' + QuotedStr(ACabang.ID);


  Result := TDBUtils.OpenDataset(sSQL);
end;

function TServerTransferAntarGudang.RetrieveNoBukti(ANoBukti : String):
    TTransferAntarGudang;
var
  sID: string;
  sSQL: string;
begin
  Result := nil;

  sSQL := 'select * from ' + GetTableName
          + ' where nobukti = ' + QuotedStr(ANoBukti);

  with TDBUtils.OpenDataset(sSQL) do
  begin
    try
      sID := FieldByName('ID').AsString;
      if sID <> '' then
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

    if Save(ATransferAntarGudang) then
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
        lMutasiStock.Harga      := lTAG.TransferAntarGudangItems[i].Harga;
        lMutasiStock.Keterangan := lTAG.Keterangan;
        lMutasiStock.NoBukti    := lTAG.NoBukti;
        lMutasiStock.TglBukti   := lTAG.TglBukti;
        lMutasiStock.Konversi   := lTAG.TransferAntarGudangItems[i].Konversi;

        lMutasiStock.Gudang     := TGudang.CreateID(lTAG.GudangAsal.ID);
        lMutasiStock.UOM        := TUOM.CreateID(lTAG.TransferAntarGudangItems[i].UOM.ID);
        lMutasiStock.QtyIn      := 0;
        lMutasiStock.QtyOut     := lTAG.TransferAntarGudangItems[i].Qty;
        lMutasiStock.Transaksi  := 'Transfer Antar Gudang Out';

        if not SaveNoCommit(lMutasiStock) then
          Exit;

        lMutasiStock            := TMutasiStock.Create;
        lMutasiStock.Barang     := TBarang.CreateID(lTAG.TransferAntarGudangItems[i].Barang.ID);
        lMutasiStock.Cabang     := TCabang.CreateID(lTAG.Cabang.ID);
        lMutasiStock.Harga      := lTAG.TransferAntarGudangItems[i].Harga;
        lMutasiStock.Keterangan := lTAG.Keterangan;
        lMutasiStock.NoBukti    := lTAG.NoBukti;
        lMutasiStock.TglBukti   := lTAG.TglBukti;
        lMutasiStock.Konversi   := lTAG.TransferAntarGudangItems[i].Konversi;

        lMutasiStock.Gudang     := TGudang.CreateID(lTAG.GudangTujuan.ID);
        lMutasiStock.UOM        := TUOM.CreateID(lTAG.TransferAntarGudangItems[i].UOM.ID);
        lMutasiStock.QtyIn      := lTAG.TransferAntarGudangItems[i].Qty;
        lMutasiStock.QtyOut     := 0;
        lMutasiStock.Transaksi  := 'Transfer Antar Gudang In';

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
var
  i: Integer;
begin
  Result := False;

  if AIsMenghapus then
  begin
    with TTransferAntarGudang(AAppObject) do
    begin
      for i := 0 to TransferAntarGudangItems.Count - 1 do
      begin
        TransferAntarGudangItems[i].Qty := -1 * TransferAntarGudangItems[i].Qty;
      end;
    end;
  end;

  if SimpanStockSekarangOut(AAppObject, AIsMenghapus) then
    if SimpanStockSekarangIn(AAppObject, AIsMenghapus) then
      Result := True;
end;

function TServerTransferAntarGudang.SimpanStockSekarangOut(AAppObject :
    TAppObject; AIsMenghapus : Boolean = False): Boolean;
var
  dKonversi: Double;
  i: Integer;
  lTAGOut: TTransferAntarGudang;
  lStockSekarang: TStockSekarang;
begin
  Result := False;

  lTAGOut := TTransferAntarGudang(AAppObject);
//  if AIsMenghapus then
//  begin
//    for i := 0 to lTAGOut.TransferAntarGudangItems.Count - 1 do
//    begin
//      lTAGOut.TransferAntarGudangItems[i].Qty := -1 * lTAGOut.TransferAntarGudangItems[i].Qty;
//    end;
//  end;

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

        if not SaveNoCommit(lStockSekarang) then
          Exit;
      end;
    finally
      Free;
    end;
  end;

  Result := True;
end;

function TServerTransferAntarGudang.SimpanStockSekarangIn(AAppObject :
    TAppObject; AIsMenghapus : Boolean = False): Boolean;
var
  dKonversi: Double;
  i: Integer;
  lTAGIn: TTransferAntarGudang;
  lStockSekarang: TStockSekarang;
begin
  Result := False;

  lTAGIn := TTransferAntarGudang(AAppObject);
//  if AIsMenghapus then
//  begin
//    for i := 0 to lTAGIn.TransferAntarGudangItems.Count - 1 do
//    begin
//      lTAGIn.TransferAntarGudangItems[i].Qty := -1 * lTAGIn.TransferAntarGudangItems[i].Qty;
//    end;
//  end;

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

        if not SaveNoCommit(lStockSekarang) then
          Exit;
      end;
    finally
      Free;
    end;
  end;

  Result := True;
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

function TServerTAGRequest.Retrieve(AID : String): TTAGRequest;
var
  I: Integer;
  sSQL: string;
begin
  Result      := TTAGRequest.Create;
  TDBUtils.LoadFromDB(Result, AID);

  sSQL := 'select c.* from  TTAGRequest a' +
          ' inner join TTAGRequestItem b on a.id = b.TAGRequest' +
          ' inner join tbarangsatuanitem c on b.barang = c.barang and b.uom=c.uom' +
          ' where a.id = ' + QuotedStr(AID);

  with TDBUtils.OpenDataset(sSQL) do
  begin
    try
      for I := 0 to Result.TAGRequestItems.Count - 1 do
      begin
        First;
        while not Eof do
        begin
          if FieldByName('barang').AsString = Result.TAGRequestItems[i].Barang.ID then
            if FieldByName('uom').AsString = Result.TAGRequestItems[i].UOM.ID then
            begin
              Result.TAGRequestItems[i].BarangSatuangItemID := FieldByName('ID').AsString;
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

function TServerTAGRequest.RetrieveCDSSlip(ACabangID : String; AID : String):
    TDataSet;
var
  sSQL: string;
begin
  sSQL := 'select * from vtagrequest_slip' +
          ' where cabangid = ' + QuotedStr(ACabangID);

  if AID <> '' then
    sSQL := sSQL + ' and ID = ' + QuotedStr(AID);

  sSQL := sSQL + ' order by nobukti';

  Result := TDBUtils.OpenDataset(sSQL);
end;

function TServerTAGRequest.RetrieveNoBukti(ANoBukti : String): TTAGRequest;
var
  sID: string;
  sSQL: string;
begin
  sID := '';

  sSQL := 'select id from ' + TTAGRequest.ClassName
          + ' where nobukti = ' + QuotedStr(ANoBukti);

  with TDBUtils.OpenDataset(sSQL) do
  begin
    try
      while not Eof do
      begin
        sID := FieldByName('id').AsString;
        Next;
      end;
    finally
      Free;
    end;
  end;

  Result := Retrieve(sID);
end;

function TServerTransferAntarCabangKirim.AfterDelete(AAppObject : TAppObject):
    Boolean;
begin
  inherited;

  Result := False;

  if UpdateStatusTAGRequest(AAppObject) then
    Result := True;
end;

function TServerTransferAntarCabangKirim.AfterSave(AOBject : TAppObject):
    Boolean;
begin
  inherited;

  Result := False;

  if UpdateStatusTAGRequest(AOBject) then
    Result := True;
end;

function TServerTransferAntarCabangKirim.UpdateStatusTAGRequest(AOBject :
    TAppObject): Boolean;
var
  sSQL: string;
begin
  try
    sSQL   := 'update a set a.status = ''REQUEST'' from ttagrequest a' +
            ' LEFT JOIN ttransferantarcabangkirim b on a.id = b.tagrequest' +
            ' where b.id is NULL';


    TDBUtils.ExecuteSQL(sSQL);

    sSQL   := 'update a set a.status = ''KIRIM'' from ttagrequest a' +
              ' Inner JOIN ttransferantarcabangkirim b on a.id = b.tagrequest' +
              ' where b.id = ' + QuotedStr(TTransferAntarCabangKirim(AOBject).ID);

    TDBUtils.ExecuteSQL(sSQL);
    Result := True;
  except
   Result := False;
  end;

end;

function TServerTransferAntarCabangKirim.BeforeDelete(AAppObject : TAppObject):
    Boolean;
begin
  Result := inherited BeforeDelete(AAppObject);
end;

function TServerTransferAntarCabangKirim.BeforeSave(AOBject : TAppObject):
    Boolean;
begin
  Result := inherited BeforeSave(AOBject);
end;

function TServerTransferAntarCabangKirim.IsBisaHapus(AOBject : TAppObject):
    Boolean;
begin
  Result := False;

  if inherited IsBisaHapus(AOBject) = False then
    Exit;

  with AOBject as TTransferAntarCabangKirim do
  begin
    Result := STATUS <> 'TERIMA'
  end;
end;

function TServerTransferAntarCabangKirim.Retrieve(AID : String):
    TTransferAntarCabangKirim;
var
  I: Integer;
  sSQL: string;
begin
  Result      := TTransferAntarCabangKirim.Create;
  TDBUtils.LoadFromDB(Result, AID);

  sSQL := 'select c.* from  TTransferAntarCabangKirim a' +
          ' inner join TTransferAntarCabangKirimItem b on a.id = b.TransferAntarCabangKirim' +
          ' inner join tbarangsatuanitem c on b.barang = c.barang and b.uom=c.uom' +
          ' where a.id = ' + QuotedStr(AID);

  with TDBUtils.OpenDataset(sSQL) do
  begin
    try
      for I := 0 to Result.TransferAntarCabangKirimItems.Count - 1 do
      begin
        First;
        while not Eof do
        begin
          if FieldByName('barang').AsString = Result.TransferAntarCabangKirimItems[i].Barang.ID then
            if FieldByName('uom').AsString = Result.TransferAntarCabangKirimItems[i].UOM.ID then
            begin
              Result.TransferAntarCabangKirimItems[i].BarangSatuangItemID := FieldByName('ID').AsString;
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

function TServerTransferAntarCabangKirim.RetrieveNoBukti(ANoBukti : String):
    TTransferAntarCabangKirim;
var
  sID: string;
  sSQL: string;
begin
  Result := nil;

  sSQL := 'select id from ' + TTransferAntarCabangKirim.ClassName
          + ' where nobukti = ' + QuotedStr(ANoBukti);

  with TDBUtils.OpenDataset(sSQL) do
  begin
    try
      while not Eof do
      begin
        sID := FieldByName('id').AsString;
        if sID <> '' then
          Result := Retrieve(sID);

        Next;
      end;
    finally
      Free;
    end;
  end;


end;

function TServerTransferAntarCabangTerima.AfterDelete(AAppObject : TAppObject):
    Boolean;
begin
  inherited;

  Result := False;

  if UpdateStatusTACKirim(AAppObject) then
    Result := True;
end;

function TServerTransferAntarCabangTerima.AfterSave(AOBject : TAppObject):
    Boolean;
begin
  inherited;

  Result := False;

  if UpdateStatusTACKirim(AOBject) then
    Result := True;
end;

function TServerTransferAntarCabangTerima.UpdateStatusTACKirim(AOBject :
    TAppObject): Boolean;
var
  sSQL: string;
begin
  try
    sSQL   := 'update a set a.status = ''KIRIM'' from ttransferantarcabangkirim a' +
            ' LEFT JOIN ttransferantarcabangterima b on a.id = b.transferantarcabangkirim' +
            ' where b.id is NULL';


    TDBUtils.ExecuteSQL(sSQL);

    sSQL   := 'update a set a.status = ''TERIMA'' from ttransferantarcabangkirim a' +
              ' Inner JOIN ttransferantarcabangterima b on a.id = b.transferantarcabangkirim' +
              ' where b.id = ' + QuotedStr(TTransferAntarCabangTerima(AOBject).ID);

    TDBUtils.ExecuteSQL(sSQL);
    Result := True;

  except
    raise;
    Result := False;
  end;

end;

function TServerTransferAntarCabangTerima.BeforeDelete(AAppObject : TAppObject):
    Boolean;
begin
  Result := inherited BeforeDelete(AAppObject);
end;

function TServerTransferAntarCabangTerima.BeforeSave(AOBject : TAppObject):
    Boolean;
begin
  Result := inherited BeforeSave(AOBject);
end;

function TServerTransferAntarCabangTerima.Retrieve(AID : String):
    TTransferAntarCabangTerima;
var
  I: Integer;
  sSQL: string;
begin
  Result      := TTransferAntarCabangTerima.Create;

  TDBUtils.LoadFromDB(Result, AID);

  sSQL := 'select c.* from  TTransferAntarCabangTerima a' +
          ' inner join TTransferAntarCabangTerimaItem b on a.id = b.TransferAntarCabangTerima' +
          ' inner join tbarangsatuanitem c on b.barang = c.barang and b.uom=c.uom' +
          ' where a.id = ' + QuotedStr(AID);

  with TDBUtils.OpenDataset(sSQL) do
  begin
    try
      for I := 0 to Result.TransferAntarCabangTerimaItems.Count - 1 do
      begin
        First;
        while not Eof do
        begin
          if FieldByName('barang').AsString = Result.TransferAntarCabangTerimaItems[i].Barang.ID then
            if FieldByName('uom').AsString = Result.TransferAntarCabangTerimaItems[i].UOM.ID then
            begin
              Result.TransferAntarCabangTerimaItems[i].BarangSatuangItemID := FieldByName('ID').AsString;
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

function TServerTransferAntarCabangTerima.RetrieveNoBukti(ANoBukti : String):
    TTransferAntarCabangTerima;
var
  sID: string;
  sSQL: string;
begin
  Result := nil;

  sSQL := 'select id from ' + TTAGRequest.ClassName
          + ' where nobukti = ' + QuotedStr(ANoBukti);

  with TDBUtils.OpenDataset(sSQL) do
  begin
    try
      while not Eof do
      begin
        sID := FieldByName('id').AsString;
        if sID <> '' then
          Result := Retrieve(sID);

        Next;
      end;
    finally
      Free;
    end;
  end;
end;

function TDSData.DS_CabangLookUp: TDataset;
var
  sSQL: string;
begin
  sSQL   := 'select * from vcabang';
  Result := TDBUtils.OpenDataset(sSQL);
end;

function TDSData.DS_BarangLookUp: TDataset;
var
  sSQL: string;
begin
  sSQL   := 'select * from vbarang order by sku';
  Result := TDBUtils.OpenDataset(sSQL);
end;

function TDSData.DS_BarangLookUp1: TDataset;
var
  sSQL: string;
begin
  sSQL   := 'select * from vbarang order by sku';
  Result := TDBUtils.OpenDataset(sSQL);
end;

function TDSData.DS_MenuLookUp: TDataset;
var
  sSQL: string;
begin
  sSQL   := 'select * from vmenu ORDER BY menuname';
  Result := TDBUtils.OpenDataset(sSQL);
end;

function TDSData.DS_UserLookUp: TDataset;
var
  sSQL: string;
begin
  sSQL   := 'select id,username from tuser';
  Result := TDBUtils.OpenDataset(sSQL);
end;

function TDSData.DS_GudangLookUp: TDataset;
var
  sSQL: string;
begin
  sSQL   := 'select * from vgudang';
  Result := TDBUtils.OpenDataset(sSQL);
end;

function TDSData.GetNamaku: string;
begin
  Result := 'BP';
end;

function TDSData.LoadAccountPengeluaranKasLain: TDataset;
var
  sSQL: string;
begin
  sSQL := 'select * from VAccountTransaksiPengeluaranLain order by kode';
  Result := TDBUtils.OpenDataset(sSQL);
end;

function TDSData.LoadAccountAPNew: TDataset;
var
  sSQL: string;
begin
  sSQL := 'select * from vaccountapnew';
  Result := TDBUtils.OpenDataset(sSQL);
end;

function TDSData.LoadAccountPenerimaanLain: TDataset;
var
  sSQL: string;
begin
  sSQL := 'select * from vaccountpenerimaanlain';
  Result := TDBUtils.OpenDataset(sSQL);
end;

function TDSData.LoadAccountARNew: TDataset;
var
  sSQL: string;
begin
  sSQL := 'select * from vaccountapnew';
  Result := TDBUtils.OpenDataset(sSQL);
end;

function TDSData.LoadAP(ASupplier : TSupplier): TDataSet;
var
  sSQL: string;
begin
  Result := nil;

  if ASupplier = nil then
    Exit;

  if ASupplier.ID = '' then
    Exit;

  sSQL := 'select * from vlookup_ap' +
          ' where supplierid = ' + QuotedStr(ASupplier.ID);

  Result := TDBUtils.OpenDataset(sSQL);
end;

function TDSData.LoadAR(ACustomer : TSupplier): TDataSet;
var
  sSQL: string;
begin
  Result := nil;

  if ACustomer = nil then
    Exit;

  if ACustomer.ID = '' then
    Exit;

  sSQL := 'select * from vlookup_ar' +
          ' where customerid = ' + QuotedStr(ACustomer.ID);

  Result := TDBUtils.OpenDataset(sSQL);
end;

function TServerAP.Retrieve(AID : String): TAP;
begin
  Result := TAP.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;

function TServerAP.RetrieveTransaksi(ATransaksi : String; AIDTransaksi :
    String): TAP;
var
  sID: string;
  sSQL: string;
begin
  sSQL   := 'select ID from tap' +
            ' where transaksi = ' + QuotedStr(ATransaksi) +
            ' and idtransaksi = ' + QuotedStr(AIDTransaksi);

  sID := '';
  with TDBUtils.OpenDataset(sSQL) do
  begin
    try
      while not Eof do
      begin
        sID := FieldByName('id').AsString;
        Next;
      end;
    finally
      Free;
    end;
  end;

  with TServerAP.Create do
  begin
    try
      Result := Retrieve(sID);
    finally
      Free;
    end;
  end;
end;

{
function TServerAP.RetrieveDeposit(ASupplierID : String): TAP;
var
  sID: string;
  sSQL: string;
begin
  sSQL   := 'select ID from tap' +
            ' where nobukti = ' + QuotedStr('DEPOSIT') +
            ' and supplier = ' + QuotedStr(ASupplierID);

  sID := '';
  with TDBUtils.OpenDataset(sSQL) do
  begin
    try
      while not Eof do
      begin
        sID := FieldByName('id').AsString;
        Next;
      end;
    finally
      Free;
    end;
  end;

  with TServerAP.Create do
  begin
    try
      Result := Retrieve(sID);
      Result.NoBukti := 'DEPOSIT';
    finally
      Free;
    end;
  end;
end;
}

destructor TServerPengeluaranKas.Destroy;
begin
  inherited;
  ServerAP.Free;
end;

function TServerPengeluaranKas.AfterSave(AAppObject : TAppObject): Boolean;
begin
  Result := False;

  if AAppObject= nil then
    Exit;

  if UpdateAPTerbayar(TPengeluaranKas(AAppObject), True) then
    Result := True;
end;

function TServerPengeluaranKas.BeforeDelete(AAppObject : TAppObject): Boolean;
begin
  Result := False;

  if AAppObject= nil then
    Exit;

  if UpdateAPTerbayar(TPengeluaranKas(AAppObject), False) then
    Result := True;
end;

function TServerPengeluaranKas.BeforeSave(AAppObject : TAppObject): Boolean;
begin
  Result := False;

  if AAppObject= nil then
    Exit;

  if UpdateAPTerbayar(TPengeluaranKas(AAppObject), False) then
    Result := True;
end;

function TServerPengeluaranKas.GetServerAP: TServerAP;
begin
  if FServerAP = nil then
    FServerAP := TServerAP.Create;

  Result := FServerAP;
end;

function TServerPengeluaranKas.Retrieve(AID : String): TPengeluaranKas;
begin
  Result := TPengeluaranKas.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;

function TServerPengeluaranKas.RetrievePenerimaanAPs(AID : String): TDataSet;
var
  sSQL: string;
begin
  sSQL   := 'select a.*, b.nobukti, b.nominal as nominalaP, b.terbayar' +
            ' from tpengeluarankasap a ' +
            ' INNER JOIN tar b on a.ar = b.id ' +
            ' where a.pengeluarankas = ' + QuotedStr(AID);

  Result := TDBUtils.OpenDataset(sSQL);
end;

function TServerPengeluaranKas.RetrieveCDSlip(ATglAwal , ATglAtglAkhir :
    TDateTime; ACabang : TCabang; ANoBukti : String): TFDJSONDataSets;
begin
  Result := TFDJSONDataSets.Create;

  TFDJSONDataSetsWriter.ListAdd(Result, RetrieveCDSlipPengeluaranKas(ATglAwal, ATglAtglAkhir, ACabang, ANoBukti));
  TFDJSONDataSetsWriter.ListAdd(Result, RetrieveCDSlipPengeluaranKasAP(ATglAwal, ATglAtglAkhir, ACabang, ANoBukti));
  TFDJSONDataSetsWriter.ListAdd(Result, RetrieveCDSlipPengeluaranKasNonAP(ATglAwal, ATglAtglAkhir, ACabang, ANoBukti));

end;

function TServerPengeluaranKas.RetrieveCDSlipPengeluaranKas(ATglAwal ,
    ATglAtglAkhir : TDateTime; ACabang : TCabang; ANoBukti : String): TFDQuery;
var
  sSQL: string;
begin
  sSQL   := 'select * from VPENGELUARAN_KAS_SLIP a ' +
            ' where tglbukti between ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal)) +
            ' and ' + TAppUtils.QuotDt(EndOfTheDay(ATglAtglAkhir)) +
            ' and nobukti like ' + QuotedStr('%' + Trim(ANoBukti) + '%');

  if ACabang <> nil then
    sSQL := sSQL + ' and cabangid = ' + QuotedStr(ACabang.ID);

  Result := TDBUtils.OpenQuery(sSQL);

end;

function TServerPengeluaranKas.RetrieveCDSlipPengeluaranKasNonAP(ATglAwal ,
    ATglAtglAkhir : TDateTime; ACabang : TCabang; ANoBukti : String): TFDQuery;
var
  sSQL: string;
begin
  sSQL   := 'select * from VPENGELUARAN_KAS_NONAP_SLIP a ' +
            ' where tglbukti between ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal)) +
            ' and ' + TAppUtils.QuotDt(EndOfTheDay(ATglAtglAkhir)) +
            ' and nobukti like ' + QuotedStr('%' + Trim(ANoBukti) + '%');

  if ACabang <> nil then
    sSQL := sSQL + ' and cabangid = ' + QuotedStr(ACabang.ID);

  Result := TDBUtils.OpenQuery(sSQL);

end;

function TServerPengeluaranKas.RetrieveCDSlipPengeluaranKasAP(ATglAwal ,
    ATglAtglAkhir : TDateTime; ACabang : TCabang; ANoBukti : String): TFDQuery;
var
  sSQL: string;
begin
  sSQL   := 'select * from VPENGELUARAN_KAS_AP_SLIP a ' +
            ' where tglbukti between ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal)) +
            ' and ' + TAppUtils.QuotDt(EndOfTheDay(ATglAtglAkhir)) +
            ' and nobukti like ' + QuotedStr('%' + Trim(ANoBukti) + '%');

  if ACabang <> nil then
    sSQL := sSQL + ' and cabangid = ' + QuotedStr(ACabang.ID);

  Result := TDBUtils.OpenQuery(sSQL);

end;

function TServerPengeluaranKas.RetrieveNoBukti(ANoBukti : String):
    TPengeluaranKas;
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

function TServerPengeluaranKas.UpdateAPTerbayar(APengeluaranKas :
    TPengeluaranKas; AIsBayar : Boolean): Boolean;
var
  sFilterID: string;
  sOperator: string;
  sSQL: string;
begin
  Result := False;

  sOperator := '-';
  if AIsBayar then
    sOperator := '+';

  if APengeluaranKas.ID = '' then
    sFilterID := 'newid()'
  else
    sFilterID := QuotedStr(APengeluaranKas.ID);

  sSQL := 'update a set a.terbayar = isnull(a.terbayar,0) ' + sOperator + ' b.nominal' +
          ' from tap a ' +
          ' INNER JOIN tpengeluarankasap b on a.id = b.ap ' +
          ' where b.pengeluarankas = ' + sFilterID;

  if TDBUtils.ExecuteSQL(sSQL) then
    Result := True;
end;

destructor TCRUDServer.Destroy;
begin
  inherited;
  FinalisasiSettingAppServer;
end;

procedure TCRUDServer.FinalisasiSettingAppServer;
begin
  FreeAndNil(SettingAppServer);
end;

procedure TCRUDServer.InisialisasiSettingAppServer;
var
  sSQL: string;
begin
  FreeAndNil(SettingAppServer);

  sSQL := 'select * from tsettingappserver';
  with TDBUtils.OpenQuery(sSQL) do
  begin
    try
      SettingAppServer := TSettingAppServer.Create;
      TDBUtils.LoadFromDB(SettingAppServer, FieldByName('ID').AsString);
    finally
      Free;
    end;
  end;
end;

function TServerJurnal.BeforeSave(AAppObject : TAppObject): Boolean;
var
  lJurnal: TJurnal;
begin
//  Result := False;
  lJurnal := TJurnal(AAppObject);

  if lJurnal.Debet <> lJurnal.Kredit then
    raise Exception.Create('Nilai Debet Tidak Sama Dengan Kredit');

  if lJurnal.IDTransaksi = '' then
  begin
    lJurnal.IDTransaksi := TDBUtils.GetNextIDGUIDToString;
    lJurnal.Transaksi   := lJurnal.ClassName;
  end;

  Result := True;
end;

function TServerJurnal.BeforeDelete(AAppObject : TAppObject): Boolean;
var
  lJurnal: TJurnal;
begin
  lJurnal := TJurnal(AAppObject);

  if lJurnal.IsPosted = 1 then
    raise Exception.Create('Jurnal sudah diposting, tidak bisa dihapus');

  Result := True;
end;

function TServerJurnal.Retrieve(AID : String): TJurnal;
begin
  Result      := TJurnal.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;

function TServerSettlementARAP.AfterSave(AAppObject : TAppObject): Boolean;
begin
  Result := False;

  if AAppObject= nil then
    Exit;

  if UpdateARTerbayar(TSettlementARAP(AAppObject), True) then
    if UpdateAPTerbayar(TSettlementARAP(AAppObject), True) then
      Result := True;
end;

function TServerSettlementARAP.BeforeDelete(AAppObject : TAppObject): Boolean;
begin
  Result := False;

  if AAppObject= nil then
    Exit;

  if UpdateARTerbayar(TSettlementARAP(AAppObject), False) then
    if UpdateAPTerbayar(TSettlementARAP(AAppObject), False) then
      Result := True;
end;

function TServerSettlementARAP.BeforeSave(AAppObject : TAppObject): Boolean;
begin
  Result := False;

  if AAppObject= nil then
    Exit;

  if UpdateARTerbayar(TSettlementARAP(AAppObject), False) then
    if UpdateAPTerbayar(TSettlementARAP(AAppObject), False) then
      Result := True;
end;

function TServerSettlementARAP.Retrieve(AID : String): TSettlementARAP;
begin
  Result := TSettlementARAP.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;

function TServerSettlementARAP.UpdateAPTerbayar(ASettlementARAP :
    TSettlementARAP; AIsBayar : Boolean): Boolean;
var
  sFilterID: string;
  sOperator: string;
  sSQL: string;
begin
  Result := False;

  sOperator := '-';
  if AIsBayar then
    sOperator := '+';

  if ASettlementARAP.ID = '' then
    sFilterID := 'newid()'
  else
    sFilterID := QuotedStr(ASettlementARAP.ID);

  sSQL := 'update a set a.terbayar = isnull(a.terbayar,0) ' + sOperator + ' b.nominal' +
          ' from tap a ' +
          ' INNER JOIN TSettlementARAPItemAP b on a.id = b.ap ' +
          ' where b.SettlementARAP = ' + sFilterID;

  if TDBUtils.ExecuteSQL(sSQL) then
    Result := True;
end;

function TServerSettlementARAP.UpdateARTerbayar(ASettlementARAP :
    TSettlementARAP; AIsBayar : Boolean): Boolean;
var
  sFilterID: string;
  sOperator: string;
  sSQL: string;
begin
  Result := False;

  sOperator := '-';
  if AIsBayar then
    sOperator := '+';

  if ASettlementARAP.ID = '' then
    sFilterID := 'newid()'
  else
    sFilterID := QuotedStr(ASettlementARAP.ID);

  sSQL := 'update a set a.terbayar = isnull(a.terbayar,0) ' + sOperator + ' b.nominal' +
          ' from tar a ' +
          ' INNER JOIN TSettlementARAPItemAR b on a.id = b.ar ' +
          ' where b.SettlementARAP = ' + sFilterID;

  if TDBUtils.ExecuteSQL(sSQL) then
    Result := True;
end;

function TServerUser.DoLogin(AUserName, APassword : String): TUser;
var
  sID : string;
  sSQL: string;
begin
  Result := TUser.Create;

  sSQL   := 'select id from tuser ' +
            ' where USERNAME = ' + QuotedStr(AUserName) +
            ' and PASSWORD = ' + QuotedStr(APassword);

  with TDBUtils.OpenDataset(sSQL) do
  begin
    try
      sID := '';
      while not Eof do
      begin
        sID := FieldByName('ID').AsString;
        Next;
      end;

      if sID <> '' then
      begin
        TDBUtils.LoadFromDB(Result, sID);
      end;
    finally
      Free;
    end;
  end;
end;

function TServerUser.Retrieve(AID : String): TUser;
begin
  Result      := TUser.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;

function TServerMenu.Retrieve(AID : String): TMenu;
begin
  Result      := TMenu.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;

function TServerPenarikanDeposit.BeforeSave(AOBject : TAppObject): Boolean;
begin
  Result := False;
  with TPenarikanDeposit(AOBject) do
  begin
    try
      if AP.ID = '' then
      begin
        AP.ID := TDBUtils.GetNextIDGUIDToString;
      end;
      Result := True;
    except

    end;
  end;
end;

function TServerPenarikanDeposit.AfterSave(AOBject : TAppObject): Boolean;
begin
  Result := False;

  if ServerAP.SaveNoCommit(TPenarikanDeposit(AOBject).AP) then
    Result := True;
end;

function TServerPenarikanDeposit.AfterDelete(AOBject : TAppObject): Boolean;
begin
  Result := False;

  if ServerAP.DeleteNoCommit(TPenarikanDeposit(AOBject).AP) then
    Result := True;
end;

function TServerPenarikanDeposit.BeforeDelete(AOBject : TAppObject): Boolean;
begin
//  Result := False;
  with TPenarikanDeposit(AOBject) do
  begin
    if AP.TerBayar > 0 then
    begin
      raise Exception.Create('Data sudah tidak bisa dihapus');
    end else
      Result := True;
  end;
end;

function TServerPenarikanDeposit.GetServerAP: TServerAP;
begin
  if FServerAP = nil then
    FServerAP := TServerAP.Create;

  Result := FServerAP;
end;

function TServerPenarikanDeposit.Retrieve(AID : String): TPenarikanDeposit;
begin
  Result := TPenarikanDeposit.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;

function TServerPenarikanDeposit.RetrieveCDSlip(ATglAwal , ATglAtglAkhir :
    TDateTime; ACabang : TCabang; ANoBukti : String): TFDJSONDataSets;
var
  sSQL: string;
begin
  Result := TFDJSONDataSets.Create;

  sSQL := 'select * from vpenarikandepositslip' +
          ' where tanggal between ' + TAppUtils.QuotDt(StartOfTheDay(ATglAwal)) +
          ' and ' + TAppUtils.QuotDt(EndOfTheDay(ATglAtglAkhir)) +
          ' and nobukti like ' + QuotedStr('%' + Trim(ANoBukti) + '%');

//  if ACabang <> nil then
//    sSQL := sSQL + ' and cabangid = ' + QuotedStr(ACabang.ID);

  TFDJSONDataSetsWriter.ListAdd(Result,TDBUtils.OpenQuery(sSQL))
end;

function TServerSetoranModal.Retrieve(AID : String): TSetoranModal;
begin
  Result := TSetoranModal.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;


end.


