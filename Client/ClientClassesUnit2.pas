//
// Created by the DataSnap proxy generator.
// 5/17/2017 5:48:43 AM
//

unit ClientClassesUnit2;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, uModel, uCustomerInvoice, uPenjualan, uAR, uAccount, uRekBank, uPenerimaanKas, uSettingApp, uTransferAntarGudang, uTAGRequests, uTransferAntarCabang, Data.DBXJSONReflect;

type

  IDSRestCachedTCustomerInvoice = interface;
  IDSRestCachedTCabang = interface;
  IDSRestCachedTGudang = interface;
  IDSRestCachedTAR = interface;
  IDSRestCachedTGroupBarang = interface;
  IDSRestCachedTPenerimaanBarang = interface;
  IDSRestCachedTRekBank = interface;
  IDSRestCachedTLogAppObject = interface;
  IDSRestCachedTSettingApp = interface;
  IDSRestCachedTPembayaranSupplier = interface;
  IDSRestCachedTStockSekarang = interface;
  IDSRestCachedTBarang = interface;
  IDSRestCachedTPenjualan = interface;
  IDSRestCachedTTransferAntarGudang = interface;
  IDSRestCachedTUOM = interface;
  IDSRestCachedTAccount = interface;
  IDSRestCachedTTAGRequest = interface;
  IDSRestCachedTSupplier = interface;
  IDSRestCachedTTransferAntarCabangKirim = interface;
  IDSRestCachedTTransferAntarCabangTerima = interface;
  IDSRestCachedTReturSupplier = interface;
  IDSRestCachedTPenerimaanKas = interface;

  TServerLaporanClient = class(TDSAdminRestClient)
  private
    FDS_OverviewAccountCommand: TDSRestCommand;
    FDS_OverviewAccountCommand_Cache: TDSRestCommand;
    FLaporanKartokCommand: TDSRestCommand;
    FLaporanKartokCommand_Cache: TDSRestCommand;
    FLaporanStockSekarangCommand: TDSRestCommand;
    FLaporanStockSekarangCommand_Cache: TDSRestCommand;
    FLookUpPenerimaanCommand: TDSRestCommand;
    FLookUpPenerimaanCommand_Cache: TDSRestCommand;
    FRetrieveCDSTAGRequestKepadaCommand: TDSRestCommand;
    FRetrieveCDSTAGRequestKepadaCommand_Cache: TDSRestCommand;
    FRetrieveCDSTAGRequestDariCommand: TDSRestCommand;
    FRetrieveCDSTAGRequestDariCommand_Cache: TDSRestCommand;
    FRetrieveTACKirimCommand: TDSRestCommand;
    FRetrieveTACKirimCommand_Cache: TDSRestCommand;
    FRetrieveGajiCommand: TDSRestCommand;
    FRetrieveGajiCommand_Cache: TDSRestCommand;
    FRetrieveTACTerimaCommand: TDSRestCommand;
    FRetrieveTACTerimaCommand_Cache: TDSRestCommand;
    FRetrieveTransferAntarGudangCommand: TDSRestCommand;
    FRetrieveTransferAntarGudangCommand_Cache: TDSRestCommand;
    FRetriveMutasiBarangCommand: TDSRestCommand;
    FRetriveMutasiBarangCommand_Cache: TDSRestCommand;
    FRetrivePenjualanCommand: TDSRestCommand;
    FRetrivePenjualanCommand_Cache: TDSRestCommand;
    FRetriveCICommand: TDSRestCommand;
    FRetriveCICommand_Cache: TDSRestCommand;
    FRetrivePenerimaanKasCommand: TDSRestCommand;
    FRetrivePenerimaanKasCommand_Cache: TDSRestCommand;
    FRetriveARCommand: TDSRestCommand;
    FRetriveARCommand_Cache: TDSRestCommand;
    FRetriveSettingAppCommand: TDSRestCommand;
    FRetriveSettingAppCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function DS_OverviewAccount(const ARequestFilter: string = ''): TDataSet;
    function DS_OverviewAccount_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function LaporanKartok(ATglAwal: TDateTime; ATglAkhir: TDateTime; ABarang: TBarang; AGudang: TGudang; ACabang: TCabang; const ARequestFilter: string = ''): TDataSet;
    function LaporanKartok_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; ABarang: TBarang; AGudang: TGudang; ACabang: TCabang; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function LaporanStockSekarang(ACabang: TCabang; const ARequestFilter: string = ''): TDataSet;
    function LaporanStockSekarang_Cache(ACabang: TCabang; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function LookUpPenerimaan(ABulan: Integer; ATahun: Integer; const ARequestFilter: string = ''): TDataSet;
    function LookUpPenerimaan_Cache(ABulan: Integer; ATahun: Integer; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveCDSTAGRequestKepada(ATglAwal: TDateTime; ATglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDSTAGRequestKepada_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveCDSTAGRequestDari(ATglAwal: TDateTime; ATglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDSTAGRequestDari_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveTACKirim(ATglAwal: TDateTime; ATglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string = ''): TDataSet;
    function RetrieveTACKirim_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveGaji(ATahun: Integer; ABulan: Integer; const ARequestFilter: string = ''): TDataSet;
    function RetrieveGaji_Cache(ATahun: Integer; ABulan: Integer; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveTACTerima(ATglAwal: TDateTime; ATglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string = ''): TDataSet;
    function RetrieveTACTerima_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveTransferAntarGudang(ATglAwal: TDateTime; ATglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string = ''): TDataSet;
    function RetrieveTransferAntarGudang_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetriveMutasiBarang(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; const ARequestFilter: string = ''): TDataSet;
    function RetriveMutasiBarang_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrivePenjualan(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string = ''): TDataSet;
    function RetrivePenjualan_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetriveCI(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string = ''): TDataSet;
    function RetriveCI_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrivePenerimaanKas(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string = ''): TDataSet;
    function RetrivePenerimaanKas_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetriveAR(ASupplier: TSupplier; const ARequestFilter: string = ''): TDataSet;
    function RetriveAR_Cache(ASupplier: TSupplier; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetriveSettingApp(ACabang: TCabang; const ARequestFilter: string = ''): TDataSet;
    function RetriveSettingApp_Cache(ACabang: TCabang; const ARequestFilter: string = ''): IDSRestCachedDataSet;
  end;

  TServerBarangClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FRetrieveKodeCommand: TDSRestCommand;
    FRetrieveKodeCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TBarang;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTBarang;
    function RetrieveKode(AKode: string; const ARequestFilter: string = ''): TBarang;
    function RetrieveKode_Cache(AKode: string; const ARequestFilter: string = ''): IDSRestCachedTBarang;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerCustomerInvoiceClient = class(TDSAdminRestClient)
  private
    FAfterSaveCommand: TDSRestCommand;
    FBeforeSaveCommand: TDSRestCommand;
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FRetrieveCDSlipCommand: TDSRestCommand;
    FRetrieveCDSlipCommand_Cache: TDSRestCommand;
    FRetrieveNoBuktiCommand: TDSRestCommand;
    FRetrieveNoBuktiCommand_Cache: TDSRestCommand;
    FGenerateNoBuktiCommand: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function AfterSave(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function BeforeSave(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TCustomerInvoice;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTCustomerInvoice;
    function RetrieveCDSlip(AID: string; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDSlip_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveNoBukti(ANoBukti: string; const ARequestFilter: string = ''): TCustomerInvoice;
    function RetrieveNoBukti_Cache(ANoBukti: string; const ARequestFilter: string = ''): IDSRestCachedTCustomerInvoice;
    function GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string = ''): string;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerUOMClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FRetrieveKodeCommand: TDSRestCommand;
    FRetrieveKodeCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TUOM;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTUOM;
    function RetrieveKode(AKode: string; const ARequestFilter: string = ''): TUOM;
    function RetrieveKode_Cache(AKode: string; const ARequestFilter: string = ''): IDSRestCachedTUOM;
  end;

  TServerSupplierClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TSupplier;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTSupplier;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerGroupBarangClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TGroupBarang;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTGroupBarang;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerPenerimaanBarangClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FRetrieveCDSlipCommand: TDSRestCommand;
    FRetrieveCDSlipCommand_Cache: TDSRestCommand;
    FRetrieveNoBuktiCommand: TDSRestCommand;
    FRetrieveNoBuktiCommand_Cache: TDSRestCommand;
    FGenerateNoBuktiCommand: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TPenerimaanBarang;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTPenerimaanBarang;
    function RetrieveCDSlip(AID: string; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDSlip_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveNoBukti(ANoBukti: string; const ARequestFilter: string = ''): TPenerimaanBarang;
    function RetrieveNoBukti_Cache(ANoBukti: string; const ARequestFilter: string = ''): IDSRestCachedTPenerimaanBarang;
    function GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string = ''): string;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerCabangClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TCabang;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTCabang;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerLogAppObjectClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TLogAppObject;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTLogAppObject;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerUtilsClient = class(TDSAdminRestClient)
  private
    FCheckKoneksiCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function CheckKoneksi(const ARequestFilter: string = ''): Boolean;
  end;

  TServerStockSekarangClient = class(TDSAdminRestClient)
  private
    FHapusMutasiCommand: TDSRestCommand;
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function HapusMutasi(ANoBukti: string; const ARequestFilter: string = ''): Boolean;
    function Retrieve(ABarang: TBarang; AGudang: TGudang; const ARequestFilter: string = ''): TStockSekarang;
    function Retrieve_Cache(ABarang: TBarang; AGudang: TGudang; const ARequestFilter: string = ''): IDSRestCachedTStockSekarang;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerReturSupplierClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FRetrieveNoBuktiCommand: TDSRestCommand;
    FRetrieveNoBuktiCommand_Cache: TDSRestCommand;
    FGenerateNoBuktiCommand: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TReturSupplier;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTReturSupplier;
    function RetrieveNoBukti(ANoBukti: string; const ARequestFilter: string = ''): TReturSupplier;
    function RetrieveNoBukti_Cache(ANoBukti: string; const ARequestFilter: string = ''): IDSRestCachedTReturSupplier;
    function GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string = ''): string;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerClosingInventoryClient = class(TDSAdminRestClient)
  private
    FCloseCommand: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Close(APeriode: Integer; ACabang: TCabang; const ARequestFilter: string = ''): Boolean;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerPembayaranSupplierClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FRetrieveCDS2Command: TDSRestCommand;
    FRetrieveCDS2Command_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TPembayaranSupplier;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTPembayaranSupplier;
    function RetrieveCDS2(const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS2_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerGudangClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FRetrieveKodeCommand: TDSRestCommand;
    FRetrieveKodeCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TGudang;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTGudang;
    function RetrieveKode(AKode: string; const ARequestFilter: string = ''): TGudang;
    function RetrieveKode_Cache(AKode: string; const ARequestFilter: string = ''): IDSRestCachedTGudang;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerPenjualanClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FRetrieveNoBuktiCommand: TDSRestCommand;
    FRetrieveNoBuktiCommand_Cache: TDSRestCommand;
    FRetrieveCDSlipCommand: TDSRestCommand;
    FRetrieveCDSlipCommand_Cache: TDSRestCommand;
    FGenerateNoBuktiCommand: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TPenjualan;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTPenjualan;
    function RetrieveNoBukti(ANoBukti: string; const ARequestFilter: string = ''): TPenjualan;
    function RetrieveNoBukti_Cache(ANoBukti: string; const ARequestFilter: string = ''): IDSRestCachedTPenjualan;
    function RetrieveCDSlip(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; ANoBukti: string; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDSlip_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; ANoBukti: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string = ''): string;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerARClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FRetrieveCDSlipCommand: TDSRestCommand;
    FRetrieveCDSlipCommand_Cache: TDSRestCommand;
    FRetrieveNoBuktiCommand: TDSRestCommand;
    FRetrieveNoBuktiCommand_Cache: TDSRestCommand;
    FGenerateNoBuktiCommand: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TAR;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTAR;
    function RetrieveCDSlip(AID: string; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDSlip_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveNoBukti(ANoBukti: string; const ARequestFilter: string = ''): TAR;
    function RetrieveNoBukti_Cache(ANoBukti: string; const ARequestFilter: string = ''): IDSRestCachedTAR;
    function GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string = ''): string;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerAccountClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TAccount;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTAccount;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerRekBankClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TRekBank;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTRekBank;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerPenerimaanKasClient = class(TDSAdminRestClient)
  private
    FAfterSaveCommand: TDSRestCommand;
    FAfterDeleteCommand: TDSRestCommand;
    FBeforeSaveCommand: TDSRestCommand;
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FRetrievePenerimaanARsCommand: TDSRestCommand;
    FRetrievePenerimaanARsCommand_Cache: TDSRestCommand;
    FRetrieveCDSlipCommand: TDSRestCommand;
    FRetrieveCDSlipCommand_Cache: TDSRestCommand;
    FRetrieveNoBuktiCommand: TDSRestCommand;
    FRetrieveNoBuktiCommand_Cache: TDSRestCommand;
    FGenerateNoBuktiCommand: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function AfterSave(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function AfterDelete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function BeforeSave(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TPenerimaanKas;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTPenerimaanKas;
    function RetrievePenerimaanARs(AID: string; const ARequestFilter: string = ''): TDataSet;
    function RetrievePenerimaanARs_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveCDSlip(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; ANoBukti: string; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDSlip_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; ANoBukti: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveNoBukti(ANoBukti: string; const ARequestFilter: string = ''): TPenerimaanKas;
    function RetrieveNoBukti_Cache(ANoBukti: string; const ARequestFilter: string = ''): IDSRestCachedTPenerimaanKas;
    function GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string = ''): string;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerSettingAppClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FRetrieveByCabangCommand: TDSRestCommand;
    FRetrieveByCabangCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TSettingApp;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTSettingApp;
    function RetrieveByCabang(ACabangID: string; const ARequestFilter: string = ''): TSettingApp;
    function RetrieveByCabang_Cache(ACabangID: string; const ARequestFilter: string = ''): IDSRestCachedTSettingApp;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerTransferAntarGudangClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FRetrieveCDSlipCommand: TDSRestCommand;
    FRetrieveCDSlipCommand_Cache: TDSRestCommand;
    FRetrieveNoBuktiCommand: TDSRestCommand;
    FRetrieveNoBuktiCommand_Cache: TDSRestCommand;
    FSaveTransferAntarGudangCommand: TDSRestCommand;
    FGenerateNoBuktiCommand: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TTransferAntarGudang;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTTransferAntarGudang;
    function RetrieveCDSlip(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; ANoBukti: string; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDSlip_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; ANoBukti: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveNoBukti(ANoBukti: string; const ARequestFilter: string = ''): TTransferAntarGudang;
    function RetrieveNoBukti_Cache(ANoBukti: string; const ARequestFilter: string = ''): IDSRestCachedTTransferAntarGudang;
    function SaveTransferAntarGudang(ATransferAntarGudang: TTransferAntarGudang; const ARequestFilter: string = ''): Boolean;
    function GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string = ''): string;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerTAGRequestClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FRetrieveCDSSlipCommand: TDSRestCommand;
    FRetrieveCDSSlipCommand_Cache: TDSRestCommand;
    FRetrieveNoBuktiCommand: TDSRestCommand;
    FRetrieveNoBuktiCommand_Cache: TDSRestCommand;
    FGenerateNoBuktiCommand: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TTAGRequest;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTTAGRequest;
    function RetrieveCDSSlip(ACabangID: string; AID: string; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDSSlip_Cache(ACabangID: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveNoBukti(ANoBukti: string; const ARequestFilter: string = ''): TTAGRequest;
    function RetrieveNoBukti_Cache(ANoBukti: string; const ARequestFilter: string = ''): IDSRestCachedTTAGRequest;
    function GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string = ''): string;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerTransferAntarCabangKirimClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FRetrieveNoBuktiCommand: TDSRestCommand;
    FRetrieveNoBuktiCommand_Cache: TDSRestCommand;
    FGenerateNoBuktiCommand: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TTransferAntarCabangKirim;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTTransferAntarCabangKirim;
    function RetrieveNoBukti(ANoBukti: string; const ARequestFilter: string = ''): TTransferAntarCabangKirim;
    function RetrieveNoBukti_Cache(ANoBukti: string; const ARequestFilter: string = ''): IDSRestCachedTTransferAntarCabangKirim;
    function GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string = ''): string;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerTransferAntarCabangTerimaClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FRetrieveNoBuktiCommand: TDSRestCommand;
    FRetrieveNoBuktiCommand_Cache: TDSRestCommand;
    FGenerateNoBuktiCommand: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TTransferAntarCabangTerima;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTTransferAntarCabangTerima;
    function RetrieveNoBukti(ANoBukti: string; const ARequestFilter: string = ''): TTransferAntarCabangTerima;
    function RetrieveNoBukti_Cache(ANoBukti: string; const ARequestFilter: string = ''): IDSRestCachedTTransferAntarCabangTerima;
    function GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string = ''): string;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  IDSRestCachedTCustomerInvoice = interface(IDSRestCachedObject<TCustomerInvoice>)
  end;

  TDSRestCachedTCustomerInvoice = class(TDSRestCachedObject<TCustomerInvoice>, IDSRestCachedTCustomerInvoice, IDSRestCachedCommand)
  end;
  IDSRestCachedTCabang = interface(IDSRestCachedObject<TCabang>)
  end;

  TDSRestCachedTCabang = class(TDSRestCachedObject<TCabang>, IDSRestCachedTCabang, IDSRestCachedCommand)
  end;
  IDSRestCachedTGudang = interface(IDSRestCachedObject<TGudang>)
  end;

  TDSRestCachedTGudang = class(TDSRestCachedObject<TGudang>, IDSRestCachedTGudang, IDSRestCachedCommand)
  end;
  IDSRestCachedTAR = interface(IDSRestCachedObject<TAR>)
  end;

  TDSRestCachedTAR = class(TDSRestCachedObject<TAR>, IDSRestCachedTAR, IDSRestCachedCommand)
  end;
  IDSRestCachedTGroupBarang = interface(IDSRestCachedObject<TGroupBarang>)
  end;

  TDSRestCachedTGroupBarang = class(TDSRestCachedObject<TGroupBarang>, IDSRestCachedTGroupBarang, IDSRestCachedCommand)
  end;
  IDSRestCachedTPenerimaanBarang = interface(IDSRestCachedObject<TPenerimaanBarang>)
  end;

  TDSRestCachedTPenerimaanBarang = class(TDSRestCachedObject<TPenerimaanBarang>, IDSRestCachedTPenerimaanBarang, IDSRestCachedCommand)
  end;
  IDSRestCachedTRekBank = interface(IDSRestCachedObject<TRekBank>)
  end;

  TDSRestCachedTRekBank = class(TDSRestCachedObject<TRekBank>, IDSRestCachedTRekBank, IDSRestCachedCommand)
  end;
  IDSRestCachedTLogAppObject = interface(IDSRestCachedObject<TLogAppObject>)
  end;

  TDSRestCachedTLogAppObject = class(TDSRestCachedObject<TLogAppObject>, IDSRestCachedTLogAppObject, IDSRestCachedCommand)
  end;
  IDSRestCachedTSettingApp = interface(IDSRestCachedObject<TSettingApp>)
  end;

  TDSRestCachedTSettingApp = class(TDSRestCachedObject<TSettingApp>, IDSRestCachedTSettingApp, IDSRestCachedCommand)
  end;
  IDSRestCachedTPembayaranSupplier = interface(IDSRestCachedObject<TPembayaranSupplier>)
  end;

  TDSRestCachedTPembayaranSupplier = class(TDSRestCachedObject<TPembayaranSupplier>, IDSRestCachedTPembayaranSupplier, IDSRestCachedCommand)
  end;
  IDSRestCachedTStockSekarang = interface(IDSRestCachedObject<TStockSekarang>)
  end;

  TDSRestCachedTStockSekarang = class(TDSRestCachedObject<TStockSekarang>, IDSRestCachedTStockSekarang, IDSRestCachedCommand)
  end;
  IDSRestCachedTBarang = interface(IDSRestCachedObject<TBarang>)
  end;

  TDSRestCachedTBarang = class(TDSRestCachedObject<TBarang>, IDSRestCachedTBarang, IDSRestCachedCommand)
  end;
  IDSRestCachedTPenjualan = interface(IDSRestCachedObject<TPenjualan>)
  end;

  TDSRestCachedTPenjualan = class(TDSRestCachedObject<TPenjualan>, IDSRestCachedTPenjualan, IDSRestCachedCommand)
  end;
  IDSRestCachedTTransferAntarGudang = interface(IDSRestCachedObject<TTransferAntarGudang>)
  end;

  TDSRestCachedTTransferAntarGudang = class(TDSRestCachedObject<TTransferAntarGudang>, IDSRestCachedTTransferAntarGudang, IDSRestCachedCommand)
  end;
  IDSRestCachedTUOM = interface(IDSRestCachedObject<TUOM>)
  end;

  TDSRestCachedTUOM = class(TDSRestCachedObject<TUOM>, IDSRestCachedTUOM, IDSRestCachedCommand)
  end;
  IDSRestCachedTAccount = interface(IDSRestCachedObject<TAccount>)
  end;

  TDSRestCachedTAccount = class(TDSRestCachedObject<TAccount>, IDSRestCachedTAccount, IDSRestCachedCommand)
  end;
  IDSRestCachedTTAGRequest = interface(IDSRestCachedObject<TTAGRequest>)
  end;

  TDSRestCachedTTAGRequest = class(TDSRestCachedObject<TTAGRequest>, IDSRestCachedTTAGRequest, IDSRestCachedCommand)
  end;
  IDSRestCachedTSupplier = interface(IDSRestCachedObject<TSupplier>)
  end;

  TDSRestCachedTSupplier = class(TDSRestCachedObject<TSupplier>, IDSRestCachedTSupplier, IDSRestCachedCommand)
  end;
  IDSRestCachedTTransferAntarCabangKirim = interface(IDSRestCachedObject<TTransferAntarCabangKirim>)
  end;

  TDSRestCachedTTransferAntarCabangKirim = class(TDSRestCachedObject<TTransferAntarCabangKirim>, IDSRestCachedTTransferAntarCabangKirim, IDSRestCachedCommand)
  end;
  IDSRestCachedTTransferAntarCabangTerima = interface(IDSRestCachedObject<TTransferAntarCabangTerima>)
  end;

  TDSRestCachedTTransferAntarCabangTerima = class(TDSRestCachedObject<TTransferAntarCabangTerima>, IDSRestCachedTTransferAntarCabangTerima, IDSRestCachedCommand)
  end;
  IDSRestCachedTReturSupplier = interface(IDSRestCachedObject<TReturSupplier>)
  end;

  TDSRestCachedTReturSupplier = class(TDSRestCachedObject<TReturSupplier>, IDSRestCachedTReturSupplier, IDSRestCachedCommand)
  end;
  IDSRestCachedTPenerimaanKas = interface(IDSRestCachedObject<TPenerimaanKas>)
  end;

  TDSRestCachedTPenerimaanKas = class(TDSRestCachedObject<TPenerimaanKas>, IDSRestCachedTPenerimaanKas, IDSRestCachedCommand)
  end;

const
  TServerLaporan_DS_OverviewAccount: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerLaporan_DS_OverviewAccount_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerLaporan_LaporanKartok: array [0..5] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ABarang'; Direction: 1; DBXType: 37; TypeName: 'TBarang'),
    (Name: 'AGudang'; Direction: 1; DBXType: 37; TypeName: 'TGudang'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerLaporan_LaporanKartok_Cache: array [0..5] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ABarang'; Direction: 1; DBXType: 37; TypeName: 'TBarang'),
    (Name: 'AGudang'; Direction: 1; DBXType: 37; TypeName: 'TGudang'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerLaporan_LaporanStockSekarang: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerLaporan_LaporanStockSekarang_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerLaporan_LookUpPenerimaan: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ABulan'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ATahun'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerLaporan_LookUpPenerimaan_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ABulan'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ATahun'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerLaporan_RetrieveCDSTAGRequestKepada: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerLaporan_RetrieveCDSTAGRequestKepada_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerLaporan_RetrieveCDSTAGRequestDari: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerLaporan_RetrieveCDSTAGRequestDari_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerLaporan_RetrieveTACKirim: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerLaporan_RetrieveTACKirim_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerLaporan_RetrieveGaji: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATahun'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ABulan'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerLaporan_RetrieveGaji_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATahun'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ABulan'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerLaporan_RetrieveTACTerima: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerLaporan_RetrieveTACTerima_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerLaporan_RetrieveTransferAntarGudang: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerLaporan_RetrieveTransferAntarGudang_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerLaporan_RetriveMutasiBarang: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerLaporan_RetriveMutasiBarang_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerLaporan_RetrivePenjualan: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerLaporan_RetrivePenjualan_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerLaporan_RetriveCI: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerLaporan_RetriveCI_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerLaporan_RetrivePenerimaanKas: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerLaporan_RetrivePenerimaanKas_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerLaporan_RetriveAR: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ASupplier'; Direction: 1; DBXType: 37; TypeName: 'TSupplier'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerLaporan_RetriveAR_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ASupplier'; Direction: 1; DBXType: 37; TypeName: 'TSupplier'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerLaporan_RetriveSettingApp: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerLaporan_RetriveSettingApp_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerBarang_Retrieve: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TBarang')
  );

  TServerBarang_Retrieve_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerBarang_RetrieveKode: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AKode'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TBarang')
  );

  TServerBarang_RetrieveKode_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AKode'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerBarang_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerBarang_RetrieveCDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerBarang_RetrieveCDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerBarang_Save: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AOBject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerCustomerInvoice_AfterSave: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerCustomerInvoice_BeforeSave: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerCustomerInvoice_Retrieve: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TCustomerInvoice')
  );

  TServerCustomerInvoice_Retrieve_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerCustomerInvoice_RetrieveCDSlip: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerCustomerInvoice_RetrieveCDSlip_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerCustomerInvoice_RetrieveNoBukti: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TCustomerInvoice')
  );

  TServerCustomerInvoice_RetrieveNoBukti_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerCustomerInvoice_GenerateNoBukti: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATglBukti'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APrefix'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerCustomerInvoice_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerCustomerInvoice_RetrieveCDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerCustomerInvoice_RetrieveCDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerCustomerInvoice_Save: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AOBject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerUOM_Retrieve: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TUOM')
  );

  TServerUOM_Retrieve_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerUOM_RetrieveKode: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AKode'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TUOM')
  );

  TServerUOM_RetrieveKode_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AKode'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerSupplier_Retrieve: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TSupplier')
  );

  TServerSupplier_Retrieve_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerSupplier_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerSupplier_RetrieveCDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerSupplier_RetrieveCDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerSupplier_Save: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AOBject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerGroupBarang_Retrieve: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TGroupBarang')
  );

  TServerGroupBarang_Retrieve_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerGroupBarang_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerGroupBarang_RetrieveCDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerGroupBarang_RetrieveCDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerGroupBarang_Save: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AOBject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerPenerimaanBarang_Retrieve: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TPenerimaanBarang')
  );

  TServerPenerimaanBarang_Retrieve_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenerimaanBarang_RetrieveCDSlip: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerPenerimaanBarang_RetrieveCDSlip_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenerimaanBarang_RetrieveNoBukti: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TPenerimaanBarang')
  );

  TServerPenerimaanBarang_RetrieveNoBukti_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenerimaanBarang_GenerateNoBukti: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATglBukti'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APrefix'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerPenerimaanBarang_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerPenerimaanBarang_RetrieveCDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerPenerimaanBarang_RetrieveCDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenerimaanBarang_Save: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AOBject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerCabang_Retrieve: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TCabang')
  );

  TServerCabang_Retrieve_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerCabang_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerCabang_RetrieveCDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerCabang_RetrieveCDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerCabang_Save: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AOBject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerLogAppObject_Retrieve: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TLogAppObject')
  );

  TServerLogAppObject_Retrieve_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerLogAppObject_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerLogAppObject_RetrieveCDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerLogAppObject_RetrieveCDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerLogAppObject_Save: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AOBject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerUtils_CheckKoneksi: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerStockSekarang_HapusMutasi: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerStockSekarang_Retrieve: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ABarang'; Direction: 1; DBXType: 37; TypeName: 'TBarang'),
    (Name: 'AGudang'; Direction: 1; DBXType: 37; TypeName: 'TGudang'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TStockSekarang')
  );

  TServerStockSekarang_Retrieve_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ABarang'; Direction: 1; DBXType: 37; TypeName: 'TBarang'),
    (Name: 'AGudang'; Direction: 1; DBXType: 37; TypeName: 'TGudang'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerStockSekarang_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerStockSekarang_RetrieveCDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerStockSekarang_RetrieveCDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerStockSekarang_Save: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AOBject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerReturSupplier_Retrieve: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TReturSupplier')
  );

  TServerReturSupplier_Retrieve_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerReturSupplier_RetrieveNoBukti: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TReturSupplier')
  );

  TServerReturSupplier_RetrieveNoBukti_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerReturSupplier_GenerateNoBukti: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATglBukti'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APrefix'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerReturSupplier_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerReturSupplier_RetrieveCDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerReturSupplier_RetrieveCDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerReturSupplier_Save: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AOBject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerClosingInventory_Close: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'APeriode'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerClosingInventory_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerClosingInventory_RetrieveCDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerClosingInventory_RetrieveCDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerClosingInventory_Save: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AOBject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerPembayaranSupplier_Retrieve: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TPembayaranSupplier')
  );

  TServerPembayaranSupplier_Retrieve_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPembayaranSupplier_RetrieveCDS2: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerPembayaranSupplier_RetrieveCDS2_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPembayaranSupplier_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerPembayaranSupplier_RetrieveCDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerPembayaranSupplier_RetrieveCDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPembayaranSupplier_Save: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AOBject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerGudang_Retrieve: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TGudang')
  );

  TServerGudang_Retrieve_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerGudang_RetrieveKode: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AKode'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TGudang')
  );

  TServerGudang_RetrieveKode_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AKode'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerGudang_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerGudang_RetrieveCDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerGudang_RetrieveCDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerGudang_Save: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AOBject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerPenjualan_Retrieve: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TPenjualan')
  );

  TServerPenjualan_Retrieve_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenjualan_RetrieveNoBukti: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TPenjualan')
  );

  TServerPenjualan_RetrieveNoBukti_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenjualan_RetrieveCDSlip: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerPenjualan_RetrieveCDSlip_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenjualan_GenerateNoBukti: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATglBukti'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APrefix'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerPenjualan_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerPenjualan_RetrieveCDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerPenjualan_RetrieveCDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenjualan_Save: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AOBject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerAR_Retrieve: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TAR')
  );

  TServerAR_Retrieve_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerAR_RetrieveCDSlip: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerAR_RetrieveCDSlip_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerAR_RetrieveNoBukti: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TAR')
  );

  TServerAR_RetrieveNoBukti_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerAR_GenerateNoBukti: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATglBukti'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APrefix'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerAR_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerAR_RetrieveCDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerAR_RetrieveCDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerAR_Save: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AOBject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerAccount_Retrieve: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TAccount')
  );

  TServerAccount_Retrieve_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerAccount_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerAccount_RetrieveCDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerAccount_RetrieveCDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerAccount_Save: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AOBject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerRekBank_Retrieve: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TRekBank')
  );

  TServerRekBank_Retrieve_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerRekBank_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerRekBank_RetrieveCDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerRekBank_RetrieveCDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerRekBank_Save: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AOBject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerPenerimaanKas_AfterSave: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerPenerimaanKas_AfterDelete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerPenerimaanKas_BeforeSave: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerPenerimaanKas_Retrieve: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TPenerimaanKas')
  );

  TServerPenerimaanKas_Retrieve_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenerimaanKas_RetrievePenerimaanARs: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerPenerimaanKas_RetrievePenerimaanARs_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenerimaanKas_RetrieveCDSlip: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerPenerimaanKas_RetrieveCDSlip_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenerimaanKas_RetrieveNoBukti: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TPenerimaanKas')
  );

  TServerPenerimaanKas_RetrieveNoBukti_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenerimaanKas_GenerateNoBukti: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATglBukti'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APrefix'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerPenerimaanKas_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerPenerimaanKas_RetrieveCDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerPenerimaanKas_RetrieveCDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenerimaanKas_Save: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AOBject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerSettingApp_Retrieve: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TSettingApp')
  );

  TServerSettingApp_Retrieve_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerSettingApp_RetrieveByCabang: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ACabangID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TSettingApp')
  );

  TServerSettingApp_RetrieveByCabang_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ACabangID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerSettingApp_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerSettingApp_RetrieveCDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerSettingApp_RetrieveCDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerSettingApp_Save: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AOBject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerTransferAntarGudang_Retrieve: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TTransferAntarGudang')
  );

  TServerTransferAntarGudang_Retrieve_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerTransferAntarGudang_RetrieveCDSlip: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerTransferAntarGudang_RetrieveCDSlip_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerTransferAntarGudang_RetrieveNoBukti: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TTransferAntarGudang')
  );

  TServerTransferAntarGudang_RetrieveNoBukti_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerTransferAntarGudang_SaveTransferAntarGudang: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ATransferAntarGudang'; Direction: 1; DBXType: 37; TypeName: 'TTransferAntarGudang'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerTransferAntarGudang_GenerateNoBukti: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATglBukti'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APrefix'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerTransferAntarGudang_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerTransferAntarGudang_RetrieveCDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerTransferAntarGudang_RetrieveCDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerTransferAntarGudang_Save: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AOBject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerTAGRequest_Retrieve: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TTAGRequest')
  );

  TServerTAGRequest_Retrieve_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerTAGRequest_RetrieveCDSSlip: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ACabangID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerTAGRequest_RetrieveCDSSlip_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ACabangID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerTAGRequest_RetrieveNoBukti: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TTAGRequest')
  );

  TServerTAGRequest_RetrieveNoBukti_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerTAGRequest_GenerateNoBukti: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATglBukti'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APrefix'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerTAGRequest_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerTAGRequest_RetrieveCDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerTAGRequest_RetrieveCDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerTAGRequest_Save: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AOBject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerTransferAntarCabangKirim_Retrieve: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TTransferAntarCabangKirim')
  );

  TServerTransferAntarCabangKirim_Retrieve_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerTransferAntarCabangKirim_RetrieveNoBukti: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TTransferAntarCabangKirim')
  );

  TServerTransferAntarCabangKirim_RetrieveNoBukti_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerTransferAntarCabangKirim_GenerateNoBukti: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATglBukti'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APrefix'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerTransferAntarCabangKirim_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerTransferAntarCabangKirim_RetrieveCDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerTransferAntarCabangKirim_RetrieveCDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerTransferAntarCabangKirim_Save: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AOBject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerTransferAntarCabangTerima_Retrieve: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TTransferAntarCabangTerima')
  );

  TServerTransferAntarCabangTerima_Retrieve_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerTransferAntarCabangTerima_RetrieveNoBukti: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TTransferAntarCabangTerima')
  );

  TServerTransferAntarCabangTerima_RetrieveNoBukti_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerTransferAntarCabangTerima_GenerateNoBukti: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATglBukti'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APrefix'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerTransferAntarCabangTerima_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerTransferAntarCabangTerima_RetrieveCDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerTransferAntarCabangTerima_RetrieveCDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerTransferAntarCabangTerima_Save: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AOBject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

implementation

function TServerLaporanClient.DS_OverviewAccount(const ARequestFilter: string): TDataSet;
begin
  if FDS_OverviewAccountCommand = nil then
  begin
    FDS_OverviewAccountCommand := FConnection.CreateCommand;
    FDS_OverviewAccountCommand.RequestType := 'GET';
    FDS_OverviewAccountCommand.Text := 'TServerLaporan.DS_OverviewAccount';
    FDS_OverviewAccountCommand.Prepare(TServerLaporan_DS_OverviewAccount);
  end;
  FDS_OverviewAccountCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FDS_OverviewAccountCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FDS_OverviewAccountCommand.FreeOnExecute(Result);
end;

function TServerLaporanClient.DS_OverviewAccount_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FDS_OverviewAccountCommand_Cache = nil then
  begin
    FDS_OverviewAccountCommand_Cache := FConnection.CreateCommand;
    FDS_OverviewAccountCommand_Cache.RequestType := 'GET';
    FDS_OverviewAccountCommand_Cache.Text := 'TServerLaporan.DS_OverviewAccount';
    FDS_OverviewAccountCommand_Cache.Prepare(TServerLaporan_DS_OverviewAccount_Cache);
  end;
  FDS_OverviewAccountCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FDS_OverviewAccountCommand_Cache.Parameters[0].Value.GetString);
end;

function TServerLaporanClient.LaporanKartok(ATglAwal: TDateTime; ATglAkhir: TDateTime; ABarang: TBarang; AGudang: TGudang; ACabang: TCabang; const ARequestFilter: string): TDataSet;
begin
  if FLaporanKartokCommand = nil then
  begin
    FLaporanKartokCommand := FConnection.CreateCommand;
    FLaporanKartokCommand.RequestType := 'POST';
    FLaporanKartokCommand.Text := 'TServerLaporan."LaporanKartok"';
    FLaporanKartokCommand.Prepare(TServerLaporan_LaporanKartok);
  end;
  FLaporanKartokCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FLaporanKartokCommand.Parameters[1].Value.AsDateTime := ATglAkhir;
  if not Assigned(ABarang) then
    FLaporanKartokCommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanKartokCommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanKartokCommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ABarang), True);
      if FInstanceOwner then
        ABarang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  if not Assigned(AGudang) then
    FLaporanKartokCommand.Parameters[3].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanKartokCommand.Parameters[3].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanKartokCommand.Parameters[3].Value.SetJSONValue(FMarshal.Marshal(AGudang), True);
      if FInstanceOwner then
        AGudang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  if not Assigned(ACabang) then
    FLaporanKartokCommand.Parameters[4].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanKartokCommand.Parameters[4].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanKartokCommand.Parameters[4].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FLaporanKartokCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FLaporanKartokCommand.Parameters[5].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FLaporanKartokCommand.FreeOnExecute(Result);
end;

function TServerLaporanClient.LaporanKartok_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; ABarang: TBarang; AGudang: TGudang; ACabang: TCabang; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FLaporanKartokCommand_Cache = nil then
  begin
    FLaporanKartokCommand_Cache := FConnection.CreateCommand;
    FLaporanKartokCommand_Cache.RequestType := 'POST';
    FLaporanKartokCommand_Cache.Text := 'TServerLaporan."LaporanKartok"';
    FLaporanKartokCommand_Cache.Prepare(TServerLaporan_LaporanKartok_Cache);
  end;
  FLaporanKartokCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FLaporanKartokCommand_Cache.Parameters[1].Value.AsDateTime := ATglAkhir;
  if not Assigned(ABarang) then
    FLaporanKartokCommand_Cache.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanKartokCommand_Cache.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanKartokCommand_Cache.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ABarang), True);
      if FInstanceOwner then
        ABarang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  if not Assigned(AGudang) then
    FLaporanKartokCommand_Cache.Parameters[3].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanKartokCommand_Cache.Parameters[3].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanKartokCommand_Cache.Parameters[3].Value.SetJSONValue(FMarshal.Marshal(AGudang), True);
      if FInstanceOwner then
        AGudang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  if not Assigned(ACabang) then
    FLaporanKartokCommand_Cache.Parameters[4].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanKartokCommand_Cache.Parameters[4].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanKartokCommand_Cache.Parameters[4].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FLaporanKartokCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FLaporanKartokCommand_Cache.Parameters[5].Value.GetString);
end;

function TServerLaporanClient.LaporanStockSekarang(ACabang: TCabang; const ARequestFilter: string): TDataSet;
begin
  if FLaporanStockSekarangCommand = nil then
  begin
    FLaporanStockSekarangCommand := FConnection.CreateCommand;
    FLaporanStockSekarangCommand.RequestType := 'POST';
    FLaporanStockSekarangCommand.Text := 'TServerLaporan."LaporanStockSekarang"';
    FLaporanStockSekarangCommand.Prepare(TServerLaporan_LaporanStockSekarang);
  end;
  if not Assigned(ACabang) then
    FLaporanStockSekarangCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanStockSekarangCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanStockSekarangCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FLaporanStockSekarangCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FLaporanStockSekarangCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FLaporanStockSekarangCommand.FreeOnExecute(Result);
end;

function TServerLaporanClient.LaporanStockSekarang_Cache(ACabang: TCabang; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FLaporanStockSekarangCommand_Cache = nil then
  begin
    FLaporanStockSekarangCommand_Cache := FConnection.CreateCommand;
    FLaporanStockSekarangCommand_Cache.RequestType := 'POST';
    FLaporanStockSekarangCommand_Cache.Text := 'TServerLaporan."LaporanStockSekarang"';
    FLaporanStockSekarangCommand_Cache.Prepare(TServerLaporan_LaporanStockSekarang_Cache);
  end;
  if not Assigned(ACabang) then
    FLaporanStockSekarangCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanStockSekarangCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanStockSekarangCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FLaporanStockSekarangCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FLaporanStockSekarangCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerLaporanClient.LookUpPenerimaan(ABulan: Integer; ATahun: Integer; const ARequestFilter: string): TDataSet;
begin
  if FLookUpPenerimaanCommand = nil then
  begin
    FLookUpPenerimaanCommand := FConnection.CreateCommand;
    FLookUpPenerimaanCommand.RequestType := 'GET';
    FLookUpPenerimaanCommand.Text := 'TServerLaporan.LookUpPenerimaan';
    FLookUpPenerimaanCommand.Prepare(TServerLaporan_LookUpPenerimaan);
  end;
  FLookUpPenerimaanCommand.Parameters[0].Value.SetInt32(ABulan);
  FLookUpPenerimaanCommand.Parameters[1].Value.SetInt32(ATahun);
  FLookUpPenerimaanCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FLookUpPenerimaanCommand.Parameters[2].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FLookUpPenerimaanCommand.FreeOnExecute(Result);
end;

function TServerLaporanClient.LookUpPenerimaan_Cache(ABulan: Integer; ATahun: Integer; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FLookUpPenerimaanCommand_Cache = nil then
  begin
    FLookUpPenerimaanCommand_Cache := FConnection.CreateCommand;
    FLookUpPenerimaanCommand_Cache.RequestType := 'GET';
    FLookUpPenerimaanCommand_Cache.Text := 'TServerLaporan.LookUpPenerimaan';
    FLookUpPenerimaanCommand_Cache.Prepare(TServerLaporan_LookUpPenerimaan_Cache);
  end;
  FLookUpPenerimaanCommand_Cache.Parameters[0].Value.SetInt32(ABulan);
  FLookUpPenerimaanCommand_Cache.Parameters[1].Value.SetInt32(ATahun);
  FLookUpPenerimaanCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FLookUpPenerimaanCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerLaporanClient.RetrieveCDSTAGRequestKepada(ATglAwal: TDateTime; ATglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSTAGRequestKepadaCommand = nil then
  begin
    FRetrieveCDSTAGRequestKepadaCommand := FConnection.CreateCommand;
    FRetrieveCDSTAGRequestKepadaCommand.RequestType := 'POST';
    FRetrieveCDSTAGRequestKepadaCommand.Text := 'TServerLaporan."RetrieveCDSTAGRequestKepada"';
    FRetrieveCDSTAGRequestKepadaCommand.Prepare(TServerLaporan_RetrieveCDSTAGRequestKepada);
  end;
  FRetrieveCDSTAGRequestKepadaCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetrieveCDSTAGRequestKepadaCommand.Parameters[1].Value.AsDateTime := ATglAkhir;
  if not Assigned(ACabang) then
    FRetrieveCDSTAGRequestKepadaCommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSTAGRequestKepadaCommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSTAGRequestKepadaCommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSTAGRequestKepadaCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSTAGRequestKepadaCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSTAGRequestKepadaCommand.FreeOnExecute(Result);
end;

function TServerLaporanClient.RetrieveCDSTAGRequestKepada_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSTAGRequestKepadaCommand_Cache = nil then
  begin
    FRetrieveCDSTAGRequestKepadaCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSTAGRequestKepadaCommand_Cache.RequestType := 'POST';
    FRetrieveCDSTAGRequestKepadaCommand_Cache.Text := 'TServerLaporan."RetrieveCDSTAGRequestKepada"';
    FRetrieveCDSTAGRequestKepadaCommand_Cache.Prepare(TServerLaporan_RetrieveCDSTAGRequestKepada_Cache);
  end;
  FRetrieveCDSTAGRequestKepadaCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetrieveCDSTAGRequestKepadaCommand_Cache.Parameters[1].Value.AsDateTime := ATglAkhir;
  if not Assigned(ACabang) then
    FRetrieveCDSTAGRequestKepadaCommand_Cache.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSTAGRequestKepadaCommand_Cache.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSTAGRequestKepadaCommand_Cache.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSTAGRequestKepadaCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSTAGRequestKepadaCommand_Cache.Parameters[3].Value.GetString);
end;

function TServerLaporanClient.RetrieveCDSTAGRequestDari(ATglAwal: TDateTime; ATglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSTAGRequestDariCommand = nil then
  begin
    FRetrieveCDSTAGRequestDariCommand := FConnection.CreateCommand;
    FRetrieveCDSTAGRequestDariCommand.RequestType := 'POST';
    FRetrieveCDSTAGRequestDariCommand.Text := 'TServerLaporan."RetrieveCDSTAGRequestDari"';
    FRetrieveCDSTAGRequestDariCommand.Prepare(TServerLaporan_RetrieveCDSTAGRequestDari);
  end;
  FRetrieveCDSTAGRequestDariCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetrieveCDSTAGRequestDariCommand.Parameters[1].Value.AsDateTime := ATglAkhir;
  if not Assigned(ACabang) then
    FRetrieveCDSTAGRequestDariCommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSTAGRequestDariCommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSTAGRequestDariCommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSTAGRequestDariCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSTAGRequestDariCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSTAGRequestDariCommand.FreeOnExecute(Result);
end;

function TServerLaporanClient.RetrieveCDSTAGRequestDari_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSTAGRequestDariCommand_Cache = nil then
  begin
    FRetrieveCDSTAGRequestDariCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSTAGRequestDariCommand_Cache.RequestType := 'POST';
    FRetrieveCDSTAGRequestDariCommand_Cache.Text := 'TServerLaporan."RetrieveCDSTAGRequestDari"';
    FRetrieveCDSTAGRequestDariCommand_Cache.Prepare(TServerLaporan_RetrieveCDSTAGRequestDari_Cache);
  end;
  FRetrieveCDSTAGRequestDariCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetrieveCDSTAGRequestDariCommand_Cache.Parameters[1].Value.AsDateTime := ATglAkhir;
  if not Assigned(ACabang) then
    FRetrieveCDSTAGRequestDariCommand_Cache.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSTAGRequestDariCommand_Cache.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSTAGRequestDariCommand_Cache.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSTAGRequestDariCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSTAGRequestDariCommand_Cache.Parameters[3].Value.GetString);
end;

function TServerLaporanClient.RetrieveTACKirim(ATglAwal: TDateTime; ATglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveTACKirimCommand = nil then
  begin
    FRetrieveTACKirimCommand := FConnection.CreateCommand;
    FRetrieveTACKirimCommand.RequestType := 'POST';
    FRetrieveTACKirimCommand.Text := 'TServerLaporan."RetrieveTACKirim"';
    FRetrieveTACKirimCommand.Prepare(TServerLaporan_RetrieveTACKirim);
  end;
  FRetrieveTACKirimCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetrieveTACKirimCommand.Parameters[1].Value.AsDateTime := ATglAkhir;
  if not Assigned(ACabang) then
    FRetrieveTACKirimCommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveTACKirimCommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveTACKirimCommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveTACKirimCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveTACKirimCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveTACKirimCommand.FreeOnExecute(Result);
end;

function TServerLaporanClient.RetrieveTACKirim_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveTACKirimCommand_Cache = nil then
  begin
    FRetrieveTACKirimCommand_Cache := FConnection.CreateCommand;
    FRetrieveTACKirimCommand_Cache.RequestType := 'POST';
    FRetrieveTACKirimCommand_Cache.Text := 'TServerLaporan."RetrieveTACKirim"';
    FRetrieveTACKirimCommand_Cache.Prepare(TServerLaporan_RetrieveTACKirim_Cache);
  end;
  FRetrieveTACKirimCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetrieveTACKirimCommand_Cache.Parameters[1].Value.AsDateTime := ATglAkhir;
  if not Assigned(ACabang) then
    FRetrieveTACKirimCommand_Cache.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveTACKirimCommand_Cache.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveTACKirimCommand_Cache.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveTACKirimCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveTACKirimCommand_Cache.Parameters[3].Value.GetString);
end;

function TServerLaporanClient.RetrieveGaji(ATahun: Integer; ABulan: Integer; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveGajiCommand = nil then
  begin
    FRetrieveGajiCommand := FConnection.CreateCommand;
    FRetrieveGajiCommand.RequestType := 'GET';
    FRetrieveGajiCommand.Text := 'TServerLaporan.RetrieveGaji';
    FRetrieveGajiCommand.Prepare(TServerLaporan_RetrieveGaji);
  end;
  FRetrieveGajiCommand.Parameters[0].Value.SetInt32(ATahun);
  FRetrieveGajiCommand.Parameters[1].Value.SetInt32(ABulan);
  FRetrieveGajiCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveGajiCommand.Parameters[2].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveGajiCommand.FreeOnExecute(Result);
end;

function TServerLaporanClient.RetrieveGaji_Cache(ATahun: Integer; ABulan: Integer; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveGajiCommand_Cache = nil then
  begin
    FRetrieveGajiCommand_Cache := FConnection.CreateCommand;
    FRetrieveGajiCommand_Cache.RequestType := 'GET';
    FRetrieveGajiCommand_Cache.Text := 'TServerLaporan.RetrieveGaji';
    FRetrieveGajiCommand_Cache.Prepare(TServerLaporan_RetrieveGaji_Cache);
  end;
  FRetrieveGajiCommand_Cache.Parameters[0].Value.SetInt32(ATahun);
  FRetrieveGajiCommand_Cache.Parameters[1].Value.SetInt32(ABulan);
  FRetrieveGajiCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveGajiCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerLaporanClient.RetrieveTACTerima(ATglAwal: TDateTime; ATglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveTACTerimaCommand = nil then
  begin
    FRetrieveTACTerimaCommand := FConnection.CreateCommand;
    FRetrieveTACTerimaCommand.RequestType := 'POST';
    FRetrieveTACTerimaCommand.Text := 'TServerLaporan."RetrieveTACTerima"';
    FRetrieveTACTerimaCommand.Prepare(TServerLaporan_RetrieveTACTerima);
  end;
  FRetrieveTACTerimaCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetrieveTACTerimaCommand.Parameters[1].Value.AsDateTime := ATglAkhir;
  if not Assigned(ACabang) then
    FRetrieveTACTerimaCommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveTACTerimaCommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveTACTerimaCommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveTACTerimaCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveTACTerimaCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveTACTerimaCommand.FreeOnExecute(Result);
end;

function TServerLaporanClient.RetrieveTACTerima_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveTACTerimaCommand_Cache = nil then
  begin
    FRetrieveTACTerimaCommand_Cache := FConnection.CreateCommand;
    FRetrieveTACTerimaCommand_Cache.RequestType := 'POST';
    FRetrieveTACTerimaCommand_Cache.Text := 'TServerLaporan."RetrieveTACTerima"';
    FRetrieveTACTerimaCommand_Cache.Prepare(TServerLaporan_RetrieveTACTerima_Cache);
  end;
  FRetrieveTACTerimaCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetrieveTACTerimaCommand_Cache.Parameters[1].Value.AsDateTime := ATglAkhir;
  if not Assigned(ACabang) then
    FRetrieveTACTerimaCommand_Cache.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveTACTerimaCommand_Cache.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveTACTerimaCommand_Cache.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveTACTerimaCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveTACTerimaCommand_Cache.Parameters[3].Value.GetString);
end;

function TServerLaporanClient.RetrieveTransferAntarGudang(ATglAwal: TDateTime; ATglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveTransferAntarGudangCommand = nil then
  begin
    FRetrieveTransferAntarGudangCommand := FConnection.CreateCommand;
    FRetrieveTransferAntarGudangCommand.RequestType := 'POST';
    FRetrieveTransferAntarGudangCommand.Text := 'TServerLaporan."RetrieveTransferAntarGudang"';
    FRetrieveTransferAntarGudangCommand.Prepare(TServerLaporan_RetrieveTransferAntarGudang);
  end;
  FRetrieveTransferAntarGudangCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetrieveTransferAntarGudangCommand.Parameters[1].Value.AsDateTime := ATglAkhir;
  if not Assigned(ACabang) then
    FRetrieveTransferAntarGudangCommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveTransferAntarGudangCommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveTransferAntarGudangCommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveTransferAntarGudangCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveTransferAntarGudangCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveTransferAntarGudangCommand.FreeOnExecute(Result);
end;

function TServerLaporanClient.RetrieveTransferAntarGudang_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveTransferAntarGudangCommand_Cache = nil then
  begin
    FRetrieveTransferAntarGudangCommand_Cache := FConnection.CreateCommand;
    FRetrieveTransferAntarGudangCommand_Cache.RequestType := 'POST';
    FRetrieveTransferAntarGudangCommand_Cache.Text := 'TServerLaporan."RetrieveTransferAntarGudang"';
    FRetrieveTransferAntarGudangCommand_Cache.Prepare(TServerLaporan_RetrieveTransferAntarGudang_Cache);
  end;
  FRetrieveTransferAntarGudangCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetrieveTransferAntarGudangCommand_Cache.Parameters[1].Value.AsDateTime := ATglAkhir;
  if not Assigned(ACabang) then
    FRetrieveTransferAntarGudangCommand_Cache.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveTransferAntarGudangCommand_Cache.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveTransferAntarGudangCommand_Cache.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveTransferAntarGudangCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveTransferAntarGudangCommand_Cache.Parameters[3].Value.GetString);
end;

function TServerLaporanClient.RetriveMutasiBarang(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; const ARequestFilter: string): TDataSet;
begin
  if FRetriveMutasiBarangCommand = nil then
  begin
    FRetriveMutasiBarangCommand := FConnection.CreateCommand;
    FRetriveMutasiBarangCommand.RequestType := 'GET';
    FRetriveMutasiBarangCommand.Text := 'TServerLaporan.RetriveMutasiBarang';
    FRetriveMutasiBarangCommand.Prepare(TServerLaporan_RetriveMutasiBarang);
  end;
  FRetriveMutasiBarangCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetriveMutasiBarangCommand.Parameters[1].Value.AsDateTime := ATglAtglAkhir;
  FRetriveMutasiBarangCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetriveMutasiBarangCommand.Parameters[2].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetriveMutasiBarangCommand.FreeOnExecute(Result);
end;

function TServerLaporanClient.RetriveMutasiBarang_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetriveMutasiBarangCommand_Cache = nil then
  begin
    FRetriveMutasiBarangCommand_Cache := FConnection.CreateCommand;
    FRetriveMutasiBarangCommand_Cache.RequestType := 'GET';
    FRetriveMutasiBarangCommand_Cache.Text := 'TServerLaporan.RetriveMutasiBarang';
    FRetriveMutasiBarangCommand_Cache.Prepare(TServerLaporan_RetriveMutasiBarang_Cache);
  end;
  FRetriveMutasiBarangCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetriveMutasiBarangCommand_Cache.Parameters[1].Value.AsDateTime := ATglAtglAkhir;
  FRetriveMutasiBarangCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetriveMutasiBarangCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerLaporanClient.RetrivePenjualan(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string): TDataSet;
begin
  if FRetrivePenjualanCommand = nil then
  begin
    FRetrivePenjualanCommand := FConnection.CreateCommand;
    FRetrivePenjualanCommand.RequestType := 'POST';
    FRetrivePenjualanCommand.Text := 'TServerLaporan."RetrivePenjualan"';
    FRetrivePenjualanCommand.Prepare(TServerLaporan_RetrivePenjualan);
  end;
  FRetrivePenjualanCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetrivePenjualanCommand.Parameters[1].Value.AsDateTime := ATglAtglAkhir;
  if not Assigned(ACabang) then
    FRetrivePenjualanCommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrivePenjualanCommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrivePenjualanCommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrivePenjualanCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrivePenjualanCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrivePenjualanCommand.FreeOnExecute(Result);
end;

function TServerLaporanClient.RetrivePenjualan_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrivePenjualanCommand_Cache = nil then
  begin
    FRetrivePenjualanCommand_Cache := FConnection.CreateCommand;
    FRetrivePenjualanCommand_Cache.RequestType := 'POST';
    FRetrivePenjualanCommand_Cache.Text := 'TServerLaporan."RetrivePenjualan"';
    FRetrivePenjualanCommand_Cache.Prepare(TServerLaporan_RetrivePenjualan_Cache);
  end;
  FRetrivePenjualanCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetrivePenjualanCommand_Cache.Parameters[1].Value.AsDateTime := ATglAtglAkhir;
  if not Assigned(ACabang) then
    FRetrivePenjualanCommand_Cache.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrivePenjualanCommand_Cache.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrivePenjualanCommand_Cache.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrivePenjualanCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrivePenjualanCommand_Cache.Parameters[3].Value.GetString);
end;

function TServerLaporanClient.RetriveCI(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string): TDataSet;
begin
  if FRetriveCICommand = nil then
  begin
    FRetriveCICommand := FConnection.CreateCommand;
    FRetriveCICommand.RequestType := 'POST';
    FRetriveCICommand.Text := 'TServerLaporan."RetriveCI"';
    FRetriveCICommand.Prepare(TServerLaporan_RetriveCI);
  end;
  FRetriveCICommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetriveCICommand.Parameters[1].Value.AsDateTime := ATglAtglAkhir;
  if not Assigned(ACabang) then
    FRetriveCICommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetriveCICommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetriveCICommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetriveCICommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetriveCICommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetriveCICommand.FreeOnExecute(Result);
end;

function TServerLaporanClient.RetriveCI_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetriveCICommand_Cache = nil then
  begin
    FRetriveCICommand_Cache := FConnection.CreateCommand;
    FRetriveCICommand_Cache.RequestType := 'POST';
    FRetriveCICommand_Cache.Text := 'TServerLaporan."RetriveCI"';
    FRetriveCICommand_Cache.Prepare(TServerLaporan_RetriveCI_Cache);
  end;
  FRetriveCICommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetriveCICommand_Cache.Parameters[1].Value.AsDateTime := ATglAtglAkhir;
  if not Assigned(ACabang) then
    FRetriveCICommand_Cache.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetriveCICommand_Cache.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetriveCICommand_Cache.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetriveCICommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetriveCICommand_Cache.Parameters[3].Value.GetString);
end;

function TServerLaporanClient.RetrivePenerimaanKas(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string): TDataSet;
begin
  if FRetrivePenerimaanKasCommand = nil then
  begin
    FRetrivePenerimaanKasCommand := FConnection.CreateCommand;
    FRetrivePenerimaanKasCommand.RequestType := 'POST';
    FRetrivePenerimaanKasCommand.Text := 'TServerLaporan."RetrivePenerimaanKas"';
    FRetrivePenerimaanKasCommand.Prepare(TServerLaporan_RetrivePenerimaanKas);
  end;
  FRetrivePenerimaanKasCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetrivePenerimaanKasCommand.Parameters[1].Value.AsDateTime := ATglAtglAkhir;
  if not Assigned(ACabang) then
    FRetrivePenerimaanKasCommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrivePenerimaanKasCommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrivePenerimaanKasCommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrivePenerimaanKasCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrivePenerimaanKasCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrivePenerimaanKasCommand.FreeOnExecute(Result);
end;

function TServerLaporanClient.RetrivePenerimaanKas_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrivePenerimaanKasCommand_Cache = nil then
  begin
    FRetrivePenerimaanKasCommand_Cache := FConnection.CreateCommand;
    FRetrivePenerimaanKasCommand_Cache.RequestType := 'POST';
    FRetrivePenerimaanKasCommand_Cache.Text := 'TServerLaporan."RetrivePenerimaanKas"';
    FRetrivePenerimaanKasCommand_Cache.Prepare(TServerLaporan_RetrivePenerimaanKas_Cache);
  end;
  FRetrivePenerimaanKasCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetrivePenerimaanKasCommand_Cache.Parameters[1].Value.AsDateTime := ATglAtglAkhir;
  if not Assigned(ACabang) then
    FRetrivePenerimaanKasCommand_Cache.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrivePenerimaanKasCommand_Cache.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrivePenerimaanKasCommand_Cache.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrivePenerimaanKasCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrivePenerimaanKasCommand_Cache.Parameters[3].Value.GetString);
end;

function TServerLaporanClient.RetriveAR(ASupplier: TSupplier; const ARequestFilter: string): TDataSet;
begin
  if FRetriveARCommand = nil then
  begin
    FRetriveARCommand := FConnection.CreateCommand;
    FRetriveARCommand.RequestType := 'POST';
    FRetriveARCommand.Text := 'TServerLaporan."RetriveAR"';
    FRetriveARCommand.Prepare(TServerLaporan_RetriveAR);
  end;
  if not Assigned(ASupplier) then
    FRetriveARCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetriveARCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetriveARCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ASupplier), True);
      if FInstanceOwner then
        ASupplier.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetriveARCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetriveARCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetriveARCommand.FreeOnExecute(Result);
end;

function TServerLaporanClient.RetriveAR_Cache(ASupplier: TSupplier; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetriveARCommand_Cache = nil then
  begin
    FRetriveARCommand_Cache := FConnection.CreateCommand;
    FRetriveARCommand_Cache.RequestType := 'POST';
    FRetriveARCommand_Cache.Text := 'TServerLaporan."RetriveAR"';
    FRetriveARCommand_Cache.Prepare(TServerLaporan_RetriveAR_Cache);
  end;
  if not Assigned(ASupplier) then
    FRetriveARCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetriveARCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetriveARCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ASupplier), True);
      if FInstanceOwner then
        ASupplier.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetriveARCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetriveARCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerLaporanClient.RetriveSettingApp(ACabang: TCabang; const ARequestFilter: string): TDataSet;
begin
  if FRetriveSettingAppCommand = nil then
  begin
    FRetriveSettingAppCommand := FConnection.CreateCommand;
    FRetriveSettingAppCommand.RequestType := 'POST';
    FRetriveSettingAppCommand.Text := 'TServerLaporan."RetriveSettingApp"';
    FRetriveSettingAppCommand.Prepare(TServerLaporan_RetriveSettingApp);
  end;
  if not Assigned(ACabang) then
    FRetriveSettingAppCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetriveSettingAppCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetriveSettingAppCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetriveSettingAppCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetriveSettingAppCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetriveSettingAppCommand.FreeOnExecute(Result);
end;

function TServerLaporanClient.RetriveSettingApp_Cache(ACabang: TCabang; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetriveSettingAppCommand_Cache = nil then
  begin
    FRetriveSettingAppCommand_Cache := FConnection.CreateCommand;
    FRetriveSettingAppCommand_Cache.RequestType := 'POST';
    FRetriveSettingAppCommand_Cache.Text := 'TServerLaporan."RetriveSettingApp"';
    FRetriveSettingAppCommand_Cache.Prepare(TServerLaporan_RetriveSettingApp_Cache);
  end;
  if not Assigned(ACabang) then
    FRetriveSettingAppCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetriveSettingAppCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetriveSettingAppCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetriveSettingAppCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetriveSettingAppCommand_Cache.Parameters[1].Value.GetString);
end;

constructor TServerLaporanClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerLaporanClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerLaporanClient.Destroy;
begin
  FDS_OverviewAccountCommand.DisposeOf;
  FDS_OverviewAccountCommand_Cache.DisposeOf;
  FLaporanKartokCommand.DisposeOf;
  FLaporanKartokCommand_Cache.DisposeOf;
  FLaporanStockSekarangCommand.DisposeOf;
  FLaporanStockSekarangCommand_Cache.DisposeOf;
  FLookUpPenerimaanCommand.DisposeOf;
  FLookUpPenerimaanCommand_Cache.DisposeOf;
  FRetrieveCDSTAGRequestKepadaCommand.DisposeOf;
  FRetrieveCDSTAGRequestKepadaCommand_Cache.DisposeOf;
  FRetrieveCDSTAGRequestDariCommand.DisposeOf;
  FRetrieveCDSTAGRequestDariCommand_Cache.DisposeOf;
  FRetrieveTACKirimCommand.DisposeOf;
  FRetrieveTACKirimCommand_Cache.DisposeOf;
  FRetrieveGajiCommand.DisposeOf;
  FRetrieveGajiCommand_Cache.DisposeOf;
  FRetrieveTACTerimaCommand.DisposeOf;
  FRetrieveTACTerimaCommand_Cache.DisposeOf;
  FRetrieveTransferAntarGudangCommand.DisposeOf;
  FRetrieveTransferAntarGudangCommand_Cache.DisposeOf;
  FRetriveMutasiBarangCommand.DisposeOf;
  FRetriveMutasiBarangCommand_Cache.DisposeOf;
  FRetrivePenjualanCommand.DisposeOf;
  FRetrivePenjualanCommand_Cache.DisposeOf;
  FRetriveCICommand.DisposeOf;
  FRetriveCICommand_Cache.DisposeOf;
  FRetrivePenerimaanKasCommand.DisposeOf;
  FRetrivePenerimaanKasCommand_Cache.DisposeOf;
  FRetriveARCommand.DisposeOf;
  FRetriveARCommand_Cache.DisposeOf;
  FRetriveSettingAppCommand.DisposeOf;
  FRetriveSettingAppCommand_Cache.DisposeOf;
  inherited;
end;

function TServerBarangClient.Retrieve(AID: string; const ARequestFilter: string): TBarang;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TServerBarang.Retrieve';
    FRetrieveCommand.Prepare(TServerBarang_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TBarang(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerBarangClient.Retrieve_Cache(AID: string; const ARequestFilter: string): IDSRestCachedTBarang;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TServerBarang.Retrieve';
    FRetrieveCommand_Cache.Prepare(TServerBarang_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTBarang.Create(FRetrieveCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerBarangClient.RetrieveKode(AKode: string; const ARequestFilter: string): TBarang;
begin
  if FRetrieveKodeCommand = nil then
  begin
    FRetrieveKodeCommand := FConnection.CreateCommand;
    FRetrieveKodeCommand.RequestType := 'GET';
    FRetrieveKodeCommand.Text := 'TServerBarang.RetrieveKode';
    FRetrieveKodeCommand.Prepare(TServerBarang_RetrieveKode);
  end;
  FRetrieveKodeCommand.Parameters[0].Value.SetWideString(AKode);
  FRetrieveKodeCommand.Execute(ARequestFilter);
  if not FRetrieveKodeCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveKodeCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TBarang(FUnMarshal.UnMarshal(FRetrieveKodeCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveKodeCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerBarangClient.RetrieveKode_Cache(AKode: string; const ARequestFilter: string): IDSRestCachedTBarang;
begin
  if FRetrieveKodeCommand_Cache = nil then
  begin
    FRetrieveKodeCommand_Cache := FConnection.CreateCommand;
    FRetrieveKodeCommand_Cache.RequestType := 'GET';
    FRetrieveKodeCommand_Cache.Text := 'TServerBarang.RetrieveKode';
    FRetrieveKodeCommand_Cache.Prepare(TServerBarang_RetrieveKode_Cache);
  end;
  FRetrieveKodeCommand_Cache.Parameters[0].Value.SetWideString(AKode);
  FRetrieveKodeCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTBarang.Create(FRetrieveKodeCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerBarangClient.Delete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FConnection.CreateCommand;
    FDeleteCommand.RequestType := 'POST';
    FDeleteCommand.Text := 'TServerBarang."Delete"';
    FDeleteCommand.Prepare(TServerBarang_Delete);
  end;
  if not Assigned(AAppObject) then
    FDeleteCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteCommand.Execute(ARequestFilter);
  Result := FDeleteCommand.Parameters[1].Value.GetBoolean;
end;

function TServerBarangClient.RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSCommand = nil then
  begin
    FRetrieveCDSCommand := FConnection.CreateCommand;
    FRetrieveCDSCommand.RequestType := 'POST';
    FRetrieveCDSCommand.Text := 'TServerBarang."RetrieveCDS"';
    FRetrieveCDSCommand.Prepare(TServerBarang_RetrieveCDS);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSCommand.FreeOnExecute(Result);
end;

function TServerBarangClient.RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSCommand_Cache = nil then
  begin
    FRetrieveCDSCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSCommand_Cache.RequestType := 'POST';
    FRetrieveCDSCommand_Cache.Text := 'TServerBarang."RetrieveCDS"';
    FRetrieveCDSCommand_Cache.Prepare(TServerBarang_RetrieveCDS_Cache);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerBarangClient.Save(AOBject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FSaveCommand = nil then
  begin
    FSaveCommand := FConnection.CreateCommand;
    FSaveCommand.RequestType := 'POST';
    FSaveCommand.Text := 'TServerBarang."Save"';
    FSaveCommand.Prepare(TServerBarang_Save);
  end;
  if not Assigned(AOBject) then
    FSaveCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AOBject), True);
      if FInstanceOwner then
        AOBject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveCommand.Execute(ARequestFilter);
  Result := FSaveCommand.Parameters[1].Value.GetBoolean;
end;

constructor TServerBarangClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerBarangClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerBarangClient.Destroy;
begin
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FRetrieveKodeCommand.DisposeOf;
  FRetrieveKodeCommand_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

function TServerCustomerInvoiceClient.AfterSave(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FAfterSaveCommand = nil then
  begin
    FAfterSaveCommand := FConnection.CreateCommand;
    FAfterSaveCommand.RequestType := 'POST';
    FAfterSaveCommand.Text := 'TServerCustomerInvoice."AfterSave"';
    FAfterSaveCommand.Prepare(TServerCustomerInvoice_AfterSave);
  end;
  if not Assigned(AAppObject) then
    FAfterSaveCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FAfterSaveCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FAfterSaveCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FAfterSaveCommand.Execute(ARequestFilter);
  Result := FAfterSaveCommand.Parameters[1].Value.GetBoolean;
end;

function TServerCustomerInvoiceClient.BeforeSave(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FBeforeSaveCommand = nil then
  begin
    FBeforeSaveCommand := FConnection.CreateCommand;
    FBeforeSaveCommand.RequestType := 'POST';
    FBeforeSaveCommand.Text := 'TServerCustomerInvoice."BeforeSave"';
    FBeforeSaveCommand.Prepare(TServerCustomerInvoice_BeforeSave);
  end;
  if not Assigned(AAppObject) then
    FBeforeSaveCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FBeforeSaveCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FBeforeSaveCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FBeforeSaveCommand.Execute(ARequestFilter);
  Result := FBeforeSaveCommand.Parameters[1].Value.GetBoolean;
end;

function TServerCustomerInvoiceClient.Retrieve(AID: string; const ARequestFilter: string): TCustomerInvoice;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TServerCustomerInvoice.Retrieve';
    FRetrieveCommand.Prepare(TServerCustomerInvoice_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TCustomerInvoice(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerCustomerInvoiceClient.Retrieve_Cache(AID: string; const ARequestFilter: string): IDSRestCachedTCustomerInvoice;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TServerCustomerInvoice.Retrieve';
    FRetrieveCommand_Cache.Prepare(TServerCustomerInvoice_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTCustomerInvoice.Create(FRetrieveCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerCustomerInvoiceClient.RetrieveCDSlip(AID: string; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSlipCommand = nil then
  begin
    FRetrieveCDSlipCommand := FConnection.CreateCommand;
    FRetrieveCDSlipCommand.RequestType := 'GET';
    FRetrieveCDSlipCommand.Text := 'TServerCustomerInvoice.RetrieveCDSlip';
    FRetrieveCDSlipCommand.Prepare(TServerCustomerInvoice_RetrieveCDSlip);
  end;
  FRetrieveCDSlipCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCDSlipCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSlipCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSlipCommand.FreeOnExecute(Result);
end;

function TServerCustomerInvoiceClient.RetrieveCDSlip_Cache(AID: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSlipCommand_Cache = nil then
  begin
    FRetrieveCDSlipCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSlipCommand_Cache.RequestType := 'GET';
    FRetrieveCDSlipCommand_Cache.Text := 'TServerCustomerInvoice.RetrieveCDSlip';
    FRetrieveCDSlipCommand_Cache.Prepare(TServerCustomerInvoice_RetrieveCDSlip_Cache);
  end;
  FRetrieveCDSlipCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCDSlipCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSlipCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerCustomerInvoiceClient.RetrieveNoBukti(ANoBukti: string; const ARequestFilter: string): TCustomerInvoice;
begin
  if FRetrieveNoBuktiCommand = nil then
  begin
    FRetrieveNoBuktiCommand := FConnection.CreateCommand;
    FRetrieveNoBuktiCommand.RequestType := 'GET';
    FRetrieveNoBuktiCommand.Text := 'TServerCustomerInvoice.RetrieveNoBukti';
    FRetrieveNoBuktiCommand.Prepare(TServerCustomerInvoice_RetrieveNoBukti);
  end;
  FRetrieveNoBuktiCommand.Parameters[0].Value.SetWideString(ANoBukti);
  FRetrieveNoBuktiCommand.Execute(ARequestFilter);
  if not FRetrieveNoBuktiCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveNoBuktiCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TCustomerInvoice(FUnMarshal.UnMarshal(FRetrieveNoBuktiCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveNoBuktiCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerCustomerInvoiceClient.RetrieveNoBukti_Cache(ANoBukti: string; const ARequestFilter: string): IDSRestCachedTCustomerInvoice;
begin
  if FRetrieveNoBuktiCommand_Cache = nil then
  begin
    FRetrieveNoBuktiCommand_Cache := FConnection.CreateCommand;
    FRetrieveNoBuktiCommand_Cache.RequestType := 'GET';
    FRetrieveNoBuktiCommand_Cache.Text := 'TServerCustomerInvoice.RetrieveNoBukti';
    FRetrieveNoBuktiCommand_Cache.Prepare(TServerCustomerInvoice_RetrieveNoBukti_Cache);
  end;
  FRetrieveNoBuktiCommand_Cache.Parameters[0].Value.SetWideString(ANoBukti);
  FRetrieveNoBuktiCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTCustomerInvoice.Create(FRetrieveNoBuktiCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerCustomerInvoiceClient.GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string): string;
begin
  if FGenerateNoBuktiCommand = nil then
  begin
    FGenerateNoBuktiCommand := FConnection.CreateCommand;
    FGenerateNoBuktiCommand.RequestType := 'GET';
    FGenerateNoBuktiCommand.Text := 'TServerCustomerInvoice.GenerateNoBukti';
    FGenerateNoBuktiCommand.Prepare(TServerCustomerInvoice_GenerateNoBukti);
  end;
  FGenerateNoBuktiCommand.Parameters[0].Value.AsDateTime := ATglBukti;
  FGenerateNoBuktiCommand.Parameters[1].Value.SetWideString(APrefix);
  FGenerateNoBuktiCommand.Execute(ARequestFilter);
  Result := FGenerateNoBuktiCommand.Parameters[2].Value.GetWideString;
end;

function TServerCustomerInvoiceClient.Delete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FConnection.CreateCommand;
    FDeleteCommand.RequestType := 'POST';
    FDeleteCommand.Text := 'TServerCustomerInvoice."Delete"';
    FDeleteCommand.Prepare(TServerCustomerInvoice_Delete);
  end;
  if not Assigned(AAppObject) then
    FDeleteCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteCommand.Execute(ARequestFilter);
  Result := FDeleteCommand.Parameters[1].Value.GetBoolean;
end;

function TServerCustomerInvoiceClient.RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSCommand = nil then
  begin
    FRetrieveCDSCommand := FConnection.CreateCommand;
    FRetrieveCDSCommand.RequestType := 'POST';
    FRetrieveCDSCommand.Text := 'TServerCustomerInvoice."RetrieveCDS"';
    FRetrieveCDSCommand.Prepare(TServerCustomerInvoice_RetrieveCDS);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSCommand.FreeOnExecute(Result);
end;

function TServerCustomerInvoiceClient.RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSCommand_Cache = nil then
  begin
    FRetrieveCDSCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSCommand_Cache.RequestType := 'POST';
    FRetrieveCDSCommand_Cache.Text := 'TServerCustomerInvoice."RetrieveCDS"';
    FRetrieveCDSCommand_Cache.Prepare(TServerCustomerInvoice_RetrieveCDS_Cache);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerCustomerInvoiceClient.Save(AOBject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FSaveCommand = nil then
  begin
    FSaveCommand := FConnection.CreateCommand;
    FSaveCommand.RequestType := 'POST';
    FSaveCommand.Text := 'TServerCustomerInvoice."Save"';
    FSaveCommand.Prepare(TServerCustomerInvoice_Save);
  end;
  if not Assigned(AOBject) then
    FSaveCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AOBject), True);
      if FInstanceOwner then
        AOBject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveCommand.Execute(ARequestFilter);
  Result := FSaveCommand.Parameters[1].Value.GetBoolean;
end;

constructor TServerCustomerInvoiceClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerCustomerInvoiceClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerCustomerInvoiceClient.Destroy;
begin
  FAfterSaveCommand.DisposeOf;
  FBeforeSaveCommand.DisposeOf;
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FRetrieveCDSlipCommand.DisposeOf;
  FRetrieveCDSlipCommand_Cache.DisposeOf;
  FRetrieveNoBuktiCommand.DisposeOf;
  FRetrieveNoBuktiCommand_Cache.DisposeOf;
  FGenerateNoBuktiCommand.DisposeOf;
  FDeleteCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

function TServerUOMClient.Retrieve(AID: string; const ARequestFilter: string): TUOM;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TServerUOM.Retrieve';
    FRetrieveCommand.Prepare(TServerUOM_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TUOM(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerUOMClient.Retrieve_Cache(AID: string; const ARequestFilter: string): IDSRestCachedTUOM;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TServerUOM.Retrieve';
    FRetrieveCommand_Cache.Prepare(TServerUOM_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTUOM.Create(FRetrieveCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerUOMClient.RetrieveKode(AKode: string; const ARequestFilter: string): TUOM;
begin
  if FRetrieveKodeCommand = nil then
  begin
    FRetrieveKodeCommand := FConnection.CreateCommand;
    FRetrieveKodeCommand.RequestType := 'GET';
    FRetrieveKodeCommand.Text := 'TServerUOM.RetrieveKode';
    FRetrieveKodeCommand.Prepare(TServerUOM_RetrieveKode);
  end;
  FRetrieveKodeCommand.Parameters[0].Value.SetWideString(AKode);
  FRetrieveKodeCommand.Execute(ARequestFilter);
  if not FRetrieveKodeCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveKodeCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TUOM(FUnMarshal.UnMarshal(FRetrieveKodeCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveKodeCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerUOMClient.RetrieveKode_Cache(AKode: string; const ARequestFilter: string): IDSRestCachedTUOM;
begin
  if FRetrieveKodeCommand_Cache = nil then
  begin
    FRetrieveKodeCommand_Cache := FConnection.CreateCommand;
    FRetrieveKodeCommand_Cache.RequestType := 'GET';
    FRetrieveKodeCommand_Cache.Text := 'TServerUOM.RetrieveKode';
    FRetrieveKodeCommand_Cache.Prepare(TServerUOM_RetrieveKode_Cache);
  end;
  FRetrieveKodeCommand_Cache.Parameters[0].Value.SetWideString(AKode);
  FRetrieveKodeCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTUOM.Create(FRetrieveKodeCommand_Cache.Parameters[1].Value.GetString);
end;

constructor TServerUOMClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerUOMClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerUOMClient.Destroy;
begin
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FRetrieveKodeCommand.DisposeOf;
  FRetrieveKodeCommand_Cache.DisposeOf;
  inherited;
end;

function TServerSupplierClient.Retrieve(AID: string; const ARequestFilter: string): TSupplier;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TServerSupplier.Retrieve';
    FRetrieveCommand.Prepare(TServerSupplier_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TSupplier(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerSupplierClient.Retrieve_Cache(AID: string; const ARequestFilter: string): IDSRestCachedTSupplier;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TServerSupplier.Retrieve';
    FRetrieveCommand_Cache.Prepare(TServerSupplier_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTSupplier.Create(FRetrieveCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerSupplierClient.Delete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FConnection.CreateCommand;
    FDeleteCommand.RequestType := 'POST';
    FDeleteCommand.Text := 'TServerSupplier."Delete"';
    FDeleteCommand.Prepare(TServerSupplier_Delete);
  end;
  if not Assigned(AAppObject) then
    FDeleteCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteCommand.Execute(ARequestFilter);
  Result := FDeleteCommand.Parameters[1].Value.GetBoolean;
end;

function TServerSupplierClient.RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSCommand = nil then
  begin
    FRetrieveCDSCommand := FConnection.CreateCommand;
    FRetrieveCDSCommand.RequestType := 'POST';
    FRetrieveCDSCommand.Text := 'TServerSupplier."RetrieveCDS"';
    FRetrieveCDSCommand.Prepare(TServerSupplier_RetrieveCDS);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSCommand.FreeOnExecute(Result);
end;

function TServerSupplierClient.RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSCommand_Cache = nil then
  begin
    FRetrieveCDSCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSCommand_Cache.RequestType := 'POST';
    FRetrieveCDSCommand_Cache.Text := 'TServerSupplier."RetrieveCDS"';
    FRetrieveCDSCommand_Cache.Prepare(TServerSupplier_RetrieveCDS_Cache);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerSupplierClient.Save(AOBject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FSaveCommand = nil then
  begin
    FSaveCommand := FConnection.CreateCommand;
    FSaveCommand.RequestType := 'POST';
    FSaveCommand.Text := 'TServerSupplier."Save"';
    FSaveCommand.Prepare(TServerSupplier_Save);
  end;
  if not Assigned(AOBject) then
    FSaveCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AOBject), True);
      if FInstanceOwner then
        AOBject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveCommand.Execute(ARequestFilter);
  Result := FSaveCommand.Parameters[1].Value.GetBoolean;
end;

constructor TServerSupplierClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerSupplierClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerSupplierClient.Destroy;
begin
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

function TServerGroupBarangClient.Retrieve(AID: string; const ARequestFilter: string): TGroupBarang;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TServerGroupBarang.Retrieve';
    FRetrieveCommand.Prepare(TServerGroupBarang_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TGroupBarang(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerGroupBarangClient.Retrieve_Cache(AID: string; const ARequestFilter: string): IDSRestCachedTGroupBarang;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TServerGroupBarang.Retrieve';
    FRetrieveCommand_Cache.Prepare(TServerGroupBarang_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTGroupBarang.Create(FRetrieveCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerGroupBarangClient.Delete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FConnection.CreateCommand;
    FDeleteCommand.RequestType := 'POST';
    FDeleteCommand.Text := 'TServerGroupBarang."Delete"';
    FDeleteCommand.Prepare(TServerGroupBarang_Delete);
  end;
  if not Assigned(AAppObject) then
    FDeleteCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteCommand.Execute(ARequestFilter);
  Result := FDeleteCommand.Parameters[1].Value.GetBoolean;
end;

function TServerGroupBarangClient.RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSCommand = nil then
  begin
    FRetrieveCDSCommand := FConnection.CreateCommand;
    FRetrieveCDSCommand.RequestType := 'POST';
    FRetrieveCDSCommand.Text := 'TServerGroupBarang."RetrieveCDS"';
    FRetrieveCDSCommand.Prepare(TServerGroupBarang_RetrieveCDS);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSCommand.FreeOnExecute(Result);
end;

function TServerGroupBarangClient.RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSCommand_Cache = nil then
  begin
    FRetrieveCDSCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSCommand_Cache.RequestType := 'POST';
    FRetrieveCDSCommand_Cache.Text := 'TServerGroupBarang."RetrieveCDS"';
    FRetrieveCDSCommand_Cache.Prepare(TServerGroupBarang_RetrieveCDS_Cache);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerGroupBarangClient.Save(AOBject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FSaveCommand = nil then
  begin
    FSaveCommand := FConnection.CreateCommand;
    FSaveCommand.RequestType := 'POST';
    FSaveCommand.Text := 'TServerGroupBarang."Save"';
    FSaveCommand.Prepare(TServerGroupBarang_Save);
  end;
  if not Assigned(AOBject) then
    FSaveCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AOBject), True);
      if FInstanceOwner then
        AOBject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveCommand.Execute(ARequestFilter);
  Result := FSaveCommand.Parameters[1].Value.GetBoolean;
end;

constructor TServerGroupBarangClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerGroupBarangClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerGroupBarangClient.Destroy;
begin
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

function TServerPenerimaanBarangClient.Retrieve(AID: string; const ARequestFilter: string): TPenerimaanBarang;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TServerPenerimaanBarang.Retrieve';
    FRetrieveCommand.Prepare(TServerPenerimaanBarang_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TPenerimaanBarang(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerPenerimaanBarangClient.Retrieve_Cache(AID: string; const ARequestFilter: string): IDSRestCachedTPenerimaanBarang;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TServerPenerimaanBarang.Retrieve';
    FRetrieveCommand_Cache.Prepare(TServerPenerimaanBarang_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTPenerimaanBarang.Create(FRetrieveCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerPenerimaanBarangClient.RetrieveCDSlip(AID: string; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSlipCommand = nil then
  begin
    FRetrieveCDSlipCommand := FConnection.CreateCommand;
    FRetrieveCDSlipCommand.RequestType := 'GET';
    FRetrieveCDSlipCommand.Text := 'TServerPenerimaanBarang.RetrieveCDSlip';
    FRetrieveCDSlipCommand.Prepare(TServerPenerimaanBarang_RetrieveCDSlip);
  end;
  FRetrieveCDSlipCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCDSlipCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSlipCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSlipCommand.FreeOnExecute(Result);
end;

function TServerPenerimaanBarangClient.RetrieveCDSlip_Cache(AID: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSlipCommand_Cache = nil then
  begin
    FRetrieveCDSlipCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSlipCommand_Cache.RequestType := 'GET';
    FRetrieveCDSlipCommand_Cache.Text := 'TServerPenerimaanBarang.RetrieveCDSlip';
    FRetrieveCDSlipCommand_Cache.Prepare(TServerPenerimaanBarang_RetrieveCDSlip_Cache);
  end;
  FRetrieveCDSlipCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCDSlipCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSlipCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerPenerimaanBarangClient.RetrieveNoBukti(ANoBukti: string; const ARequestFilter: string): TPenerimaanBarang;
begin
  if FRetrieveNoBuktiCommand = nil then
  begin
    FRetrieveNoBuktiCommand := FConnection.CreateCommand;
    FRetrieveNoBuktiCommand.RequestType := 'GET';
    FRetrieveNoBuktiCommand.Text := 'TServerPenerimaanBarang.RetrieveNoBukti';
    FRetrieveNoBuktiCommand.Prepare(TServerPenerimaanBarang_RetrieveNoBukti);
  end;
  FRetrieveNoBuktiCommand.Parameters[0].Value.SetWideString(ANoBukti);
  FRetrieveNoBuktiCommand.Execute(ARequestFilter);
  if not FRetrieveNoBuktiCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveNoBuktiCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TPenerimaanBarang(FUnMarshal.UnMarshal(FRetrieveNoBuktiCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveNoBuktiCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerPenerimaanBarangClient.RetrieveNoBukti_Cache(ANoBukti: string; const ARequestFilter: string): IDSRestCachedTPenerimaanBarang;
begin
  if FRetrieveNoBuktiCommand_Cache = nil then
  begin
    FRetrieveNoBuktiCommand_Cache := FConnection.CreateCommand;
    FRetrieveNoBuktiCommand_Cache.RequestType := 'GET';
    FRetrieveNoBuktiCommand_Cache.Text := 'TServerPenerimaanBarang.RetrieveNoBukti';
    FRetrieveNoBuktiCommand_Cache.Prepare(TServerPenerimaanBarang_RetrieveNoBukti_Cache);
  end;
  FRetrieveNoBuktiCommand_Cache.Parameters[0].Value.SetWideString(ANoBukti);
  FRetrieveNoBuktiCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTPenerimaanBarang.Create(FRetrieveNoBuktiCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerPenerimaanBarangClient.GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string): string;
begin
  if FGenerateNoBuktiCommand = nil then
  begin
    FGenerateNoBuktiCommand := FConnection.CreateCommand;
    FGenerateNoBuktiCommand.RequestType := 'GET';
    FGenerateNoBuktiCommand.Text := 'TServerPenerimaanBarang.GenerateNoBukti';
    FGenerateNoBuktiCommand.Prepare(TServerPenerimaanBarang_GenerateNoBukti);
  end;
  FGenerateNoBuktiCommand.Parameters[0].Value.AsDateTime := ATglBukti;
  FGenerateNoBuktiCommand.Parameters[1].Value.SetWideString(APrefix);
  FGenerateNoBuktiCommand.Execute(ARequestFilter);
  Result := FGenerateNoBuktiCommand.Parameters[2].Value.GetWideString;
end;

function TServerPenerimaanBarangClient.Delete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FConnection.CreateCommand;
    FDeleteCommand.RequestType := 'POST';
    FDeleteCommand.Text := 'TServerPenerimaanBarang."Delete"';
    FDeleteCommand.Prepare(TServerPenerimaanBarang_Delete);
  end;
  if not Assigned(AAppObject) then
    FDeleteCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteCommand.Execute(ARequestFilter);
  Result := FDeleteCommand.Parameters[1].Value.GetBoolean;
end;

function TServerPenerimaanBarangClient.RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSCommand = nil then
  begin
    FRetrieveCDSCommand := FConnection.CreateCommand;
    FRetrieveCDSCommand.RequestType := 'POST';
    FRetrieveCDSCommand.Text := 'TServerPenerimaanBarang."RetrieveCDS"';
    FRetrieveCDSCommand.Prepare(TServerPenerimaanBarang_RetrieveCDS);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSCommand.FreeOnExecute(Result);
end;

function TServerPenerimaanBarangClient.RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSCommand_Cache = nil then
  begin
    FRetrieveCDSCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSCommand_Cache.RequestType := 'POST';
    FRetrieveCDSCommand_Cache.Text := 'TServerPenerimaanBarang."RetrieveCDS"';
    FRetrieveCDSCommand_Cache.Prepare(TServerPenerimaanBarang_RetrieveCDS_Cache);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerPenerimaanBarangClient.Save(AOBject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FSaveCommand = nil then
  begin
    FSaveCommand := FConnection.CreateCommand;
    FSaveCommand.RequestType := 'POST';
    FSaveCommand.Text := 'TServerPenerimaanBarang."Save"';
    FSaveCommand.Prepare(TServerPenerimaanBarang_Save);
  end;
  if not Assigned(AOBject) then
    FSaveCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AOBject), True);
      if FInstanceOwner then
        AOBject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveCommand.Execute(ARequestFilter);
  Result := FSaveCommand.Parameters[1].Value.GetBoolean;
end;

constructor TServerPenerimaanBarangClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerPenerimaanBarangClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerPenerimaanBarangClient.Destroy;
begin
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FRetrieveCDSlipCommand.DisposeOf;
  FRetrieveCDSlipCommand_Cache.DisposeOf;
  FRetrieveNoBuktiCommand.DisposeOf;
  FRetrieveNoBuktiCommand_Cache.DisposeOf;
  FGenerateNoBuktiCommand.DisposeOf;
  FDeleteCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

function TServerCabangClient.Retrieve(AID: string; const ARequestFilter: string): TCabang;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TServerCabang.Retrieve';
    FRetrieveCommand.Prepare(TServerCabang_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TCabang(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerCabangClient.Retrieve_Cache(AID: string; const ARequestFilter: string): IDSRestCachedTCabang;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TServerCabang.Retrieve';
    FRetrieveCommand_Cache.Prepare(TServerCabang_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTCabang.Create(FRetrieveCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerCabangClient.Delete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FConnection.CreateCommand;
    FDeleteCommand.RequestType := 'POST';
    FDeleteCommand.Text := 'TServerCabang."Delete"';
    FDeleteCommand.Prepare(TServerCabang_Delete);
  end;
  if not Assigned(AAppObject) then
    FDeleteCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteCommand.Execute(ARequestFilter);
  Result := FDeleteCommand.Parameters[1].Value.GetBoolean;
end;

function TServerCabangClient.RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSCommand = nil then
  begin
    FRetrieveCDSCommand := FConnection.CreateCommand;
    FRetrieveCDSCommand.RequestType := 'POST';
    FRetrieveCDSCommand.Text := 'TServerCabang."RetrieveCDS"';
    FRetrieveCDSCommand.Prepare(TServerCabang_RetrieveCDS);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSCommand.FreeOnExecute(Result);
end;

function TServerCabangClient.RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSCommand_Cache = nil then
  begin
    FRetrieveCDSCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSCommand_Cache.RequestType := 'POST';
    FRetrieveCDSCommand_Cache.Text := 'TServerCabang."RetrieveCDS"';
    FRetrieveCDSCommand_Cache.Prepare(TServerCabang_RetrieveCDS_Cache);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerCabangClient.Save(AOBject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FSaveCommand = nil then
  begin
    FSaveCommand := FConnection.CreateCommand;
    FSaveCommand.RequestType := 'POST';
    FSaveCommand.Text := 'TServerCabang."Save"';
    FSaveCommand.Prepare(TServerCabang_Save);
  end;
  if not Assigned(AOBject) then
    FSaveCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AOBject), True);
      if FInstanceOwner then
        AOBject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveCommand.Execute(ARequestFilter);
  Result := FSaveCommand.Parameters[1].Value.GetBoolean;
end;

constructor TServerCabangClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerCabangClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerCabangClient.Destroy;
begin
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

function TServerLogAppObjectClient.Retrieve(AID: string; const ARequestFilter: string): TLogAppObject;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TServerLogAppObject.Retrieve';
    FRetrieveCommand.Prepare(TServerLogAppObject_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TLogAppObject(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerLogAppObjectClient.Retrieve_Cache(AID: string; const ARequestFilter: string): IDSRestCachedTLogAppObject;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TServerLogAppObject.Retrieve';
    FRetrieveCommand_Cache.Prepare(TServerLogAppObject_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTLogAppObject.Create(FRetrieveCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerLogAppObjectClient.Delete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FConnection.CreateCommand;
    FDeleteCommand.RequestType := 'POST';
    FDeleteCommand.Text := 'TServerLogAppObject."Delete"';
    FDeleteCommand.Prepare(TServerLogAppObject_Delete);
  end;
  if not Assigned(AAppObject) then
    FDeleteCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteCommand.Execute(ARequestFilter);
  Result := FDeleteCommand.Parameters[1].Value.GetBoolean;
end;

function TServerLogAppObjectClient.RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSCommand = nil then
  begin
    FRetrieveCDSCommand := FConnection.CreateCommand;
    FRetrieveCDSCommand.RequestType := 'POST';
    FRetrieveCDSCommand.Text := 'TServerLogAppObject."RetrieveCDS"';
    FRetrieveCDSCommand.Prepare(TServerLogAppObject_RetrieveCDS);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSCommand.FreeOnExecute(Result);
end;

function TServerLogAppObjectClient.RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSCommand_Cache = nil then
  begin
    FRetrieveCDSCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSCommand_Cache.RequestType := 'POST';
    FRetrieveCDSCommand_Cache.Text := 'TServerLogAppObject."RetrieveCDS"';
    FRetrieveCDSCommand_Cache.Prepare(TServerLogAppObject_RetrieveCDS_Cache);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerLogAppObjectClient.Save(AOBject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FSaveCommand = nil then
  begin
    FSaveCommand := FConnection.CreateCommand;
    FSaveCommand.RequestType := 'POST';
    FSaveCommand.Text := 'TServerLogAppObject."Save"';
    FSaveCommand.Prepare(TServerLogAppObject_Save);
  end;
  if not Assigned(AOBject) then
    FSaveCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AOBject), True);
      if FInstanceOwner then
        AOBject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveCommand.Execute(ARequestFilter);
  Result := FSaveCommand.Parameters[1].Value.GetBoolean;
end;

constructor TServerLogAppObjectClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerLogAppObjectClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerLogAppObjectClient.Destroy;
begin
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

function TServerUtilsClient.CheckKoneksi(const ARequestFilter: string): Boolean;
begin
  if FCheckKoneksiCommand = nil then
  begin
    FCheckKoneksiCommand := FConnection.CreateCommand;
    FCheckKoneksiCommand.RequestType := 'GET';
    FCheckKoneksiCommand.Text := 'TServerUtils.CheckKoneksi';
    FCheckKoneksiCommand.Prepare(TServerUtils_CheckKoneksi);
  end;
  FCheckKoneksiCommand.Execute(ARequestFilter);
  Result := FCheckKoneksiCommand.Parameters[0].Value.GetBoolean;
end;

constructor TServerUtilsClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerUtilsClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerUtilsClient.Destroy;
begin
  FCheckKoneksiCommand.DisposeOf;
  inherited;
end;

function TServerStockSekarangClient.HapusMutasi(ANoBukti: string; const ARequestFilter: string): Boolean;
begin
  if FHapusMutasiCommand = nil then
  begin
    FHapusMutasiCommand := FConnection.CreateCommand;
    FHapusMutasiCommand.RequestType := 'GET';
    FHapusMutasiCommand.Text := 'TServerStockSekarang.HapusMutasi';
    FHapusMutasiCommand.Prepare(TServerStockSekarang_HapusMutasi);
  end;
  FHapusMutasiCommand.Parameters[0].Value.SetWideString(ANoBukti);
  FHapusMutasiCommand.Execute(ARequestFilter);
  Result := FHapusMutasiCommand.Parameters[1].Value.GetBoolean;
end;

function TServerStockSekarangClient.Retrieve(ABarang: TBarang; AGudang: TGudang; const ARequestFilter: string): TStockSekarang;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'POST';
    FRetrieveCommand.Text := 'TServerStockSekarang."Retrieve"';
    FRetrieveCommand.Prepare(TServerStockSekarang_Retrieve);
  end;
  if not Assigned(ABarang) then
    FRetrieveCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ABarang), True);
      if FInstanceOwner then
        ABarang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  if not Assigned(AGudang) then
    FRetrieveCommand.Parameters[1].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCommand.Parameters[1].Value.SetJSONValue(FMarshal.Marshal(AGudang), True);
      if FInstanceOwner then
        AGudang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TStockSekarang(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerStockSekarangClient.Retrieve_Cache(ABarang: TBarang; AGudang: TGudang; const ARequestFilter: string): IDSRestCachedTStockSekarang;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'POST';
    FRetrieveCommand_Cache.Text := 'TServerStockSekarang."Retrieve"';
    FRetrieveCommand_Cache.Prepare(TServerStockSekarang_Retrieve_Cache);
  end;
  if not Assigned(ABarang) then
    FRetrieveCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ABarang), True);
      if FInstanceOwner then
        ABarang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  if not Assigned(AGudang) then
    FRetrieveCommand_Cache.Parameters[1].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCommand_Cache.Parameters[1].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCommand_Cache.Parameters[1].Value.SetJSONValue(FMarshal.Marshal(AGudang), True);
      if FInstanceOwner then
        AGudang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTStockSekarang.Create(FRetrieveCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerStockSekarangClient.Delete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FConnection.CreateCommand;
    FDeleteCommand.RequestType := 'POST';
    FDeleteCommand.Text := 'TServerStockSekarang."Delete"';
    FDeleteCommand.Prepare(TServerStockSekarang_Delete);
  end;
  if not Assigned(AAppObject) then
    FDeleteCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteCommand.Execute(ARequestFilter);
  Result := FDeleteCommand.Parameters[1].Value.GetBoolean;
end;

function TServerStockSekarangClient.RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSCommand = nil then
  begin
    FRetrieveCDSCommand := FConnection.CreateCommand;
    FRetrieveCDSCommand.RequestType := 'POST';
    FRetrieveCDSCommand.Text := 'TServerStockSekarang."RetrieveCDS"';
    FRetrieveCDSCommand.Prepare(TServerStockSekarang_RetrieveCDS);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSCommand.FreeOnExecute(Result);
end;

function TServerStockSekarangClient.RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSCommand_Cache = nil then
  begin
    FRetrieveCDSCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSCommand_Cache.RequestType := 'POST';
    FRetrieveCDSCommand_Cache.Text := 'TServerStockSekarang."RetrieveCDS"';
    FRetrieveCDSCommand_Cache.Prepare(TServerStockSekarang_RetrieveCDS_Cache);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerStockSekarangClient.Save(AOBject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FSaveCommand = nil then
  begin
    FSaveCommand := FConnection.CreateCommand;
    FSaveCommand.RequestType := 'POST';
    FSaveCommand.Text := 'TServerStockSekarang."Save"';
    FSaveCommand.Prepare(TServerStockSekarang_Save);
  end;
  if not Assigned(AOBject) then
    FSaveCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AOBject), True);
      if FInstanceOwner then
        AOBject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveCommand.Execute(ARequestFilter);
  Result := FSaveCommand.Parameters[1].Value.GetBoolean;
end;

constructor TServerStockSekarangClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerStockSekarangClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerStockSekarangClient.Destroy;
begin
  FHapusMutasiCommand.DisposeOf;
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

function TServerReturSupplierClient.Retrieve(AID: string; const ARequestFilter: string): TReturSupplier;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TServerReturSupplier.Retrieve';
    FRetrieveCommand.Prepare(TServerReturSupplier_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TReturSupplier(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerReturSupplierClient.Retrieve_Cache(AID: string; const ARequestFilter: string): IDSRestCachedTReturSupplier;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TServerReturSupplier.Retrieve';
    FRetrieveCommand_Cache.Prepare(TServerReturSupplier_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTReturSupplier.Create(FRetrieveCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerReturSupplierClient.RetrieveNoBukti(ANoBukti: string; const ARequestFilter: string): TReturSupplier;
begin
  if FRetrieveNoBuktiCommand = nil then
  begin
    FRetrieveNoBuktiCommand := FConnection.CreateCommand;
    FRetrieveNoBuktiCommand.RequestType := 'GET';
    FRetrieveNoBuktiCommand.Text := 'TServerReturSupplier.RetrieveNoBukti';
    FRetrieveNoBuktiCommand.Prepare(TServerReturSupplier_RetrieveNoBukti);
  end;
  FRetrieveNoBuktiCommand.Parameters[0].Value.SetWideString(ANoBukti);
  FRetrieveNoBuktiCommand.Execute(ARequestFilter);
  if not FRetrieveNoBuktiCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveNoBuktiCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TReturSupplier(FUnMarshal.UnMarshal(FRetrieveNoBuktiCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveNoBuktiCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerReturSupplierClient.RetrieveNoBukti_Cache(ANoBukti: string; const ARequestFilter: string): IDSRestCachedTReturSupplier;
begin
  if FRetrieveNoBuktiCommand_Cache = nil then
  begin
    FRetrieveNoBuktiCommand_Cache := FConnection.CreateCommand;
    FRetrieveNoBuktiCommand_Cache.RequestType := 'GET';
    FRetrieveNoBuktiCommand_Cache.Text := 'TServerReturSupplier.RetrieveNoBukti';
    FRetrieveNoBuktiCommand_Cache.Prepare(TServerReturSupplier_RetrieveNoBukti_Cache);
  end;
  FRetrieveNoBuktiCommand_Cache.Parameters[0].Value.SetWideString(ANoBukti);
  FRetrieveNoBuktiCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTReturSupplier.Create(FRetrieveNoBuktiCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerReturSupplierClient.GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string): string;
begin
  if FGenerateNoBuktiCommand = nil then
  begin
    FGenerateNoBuktiCommand := FConnection.CreateCommand;
    FGenerateNoBuktiCommand.RequestType := 'GET';
    FGenerateNoBuktiCommand.Text := 'TServerReturSupplier.GenerateNoBukti';
    FGenerateNoBuktiCommand.Prepare(TServerReturSupplier_GenerateNoBukti);
  end;
  FGenerateNoBuktiCommand.Parameters[0].Value.AsDateTime := ATglBukti;
  FGenerateNoBuktiCommand.Parameters[1].Value.SetWideString(APrefix);
  FGenerateNoBuktiCommand.Execute(ARequestFilter);
  Result := FGenerateNoBuktiCommand.Parameters[2].Value.GetWideString;
end;

function TServerReturSupplierClient.Delete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FConnection.CreateCommand;
    FDeleteCommand.RequestType := 'POST';
    FDeleteCommand.Text := 'TServerReturSupplier."Delete"';
    FDeleteCommand.Prepare(TServerReturSupplier_Delete);
  end;
  if not Assigned(AAppObject) then
    FDeleteCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteCommand.Execute(ARequestFilter);
  Result := FDeleteCommand.Parameters[1].Value.GetBoolean;
end;

function TServerReturSupplierClient.RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSCommand = nil then
  begin
    FRetrieveCDSCommand := FConnection.CreateCommand;
    FRetrieveCDSCommand.RequestType := 'POST';
    FRetrieveCDSCommand.Text := 'TServerReturSupplier."RetrieveCDS"';
    FRetrieveCDSCommand.Prepare(TServerReturSupplier_RetrieveCDS);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSCommand.FreeOnExecute(Result);
end;

function TServerReturSupplierClient.RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSCommand_Cache = nil then
  begin
    FRetrieveCDSCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSCommand_Cache.RequestType := 'POST';
    FRetrieveCDSCommand_Cache.Text := 'TServerReturSupplier."RetrieveCDS"';
    FRetrieveCDSCommand_Cache.Prepare(TServerReturSupplier_RetrieveCDS_Cache);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerReturSupplierClient.Save(AOBject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FSaveCommand = nil then
  begin
    FSaveCommand := FConnection.CreateCommand;
    FSaveCommand.RequestType := 'POST';
    FSaveCommand.Text := 'TServerReturSupplier."Save"';
    FSaveCommand.Prepare(TServerReturSupplier_Save);
  end;
  if not Assigned(AOBject) then
    FSaveCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AOBject), True);
      if FInstanceOwner then
        AOBject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveCommand.Execute(ARequestFilter);
  Result := FSaveCommand.Parameters[1].Value.GetBoolean;
end;

constructor TServerReturSupplierClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerReturSupplierClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerReturSupplierClient.Destroy;
begin
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FRetrieveNoBuktiCommand.DisposeOf;
  FRetrieveNoBuktiCommand_Cache.DisposeOf;
  FGenerateNoBuktiCommand.DisposeOf;
  FDeleteCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

function TServerClosingInventoryClient.Close(APeriode: Integer; ACabang: TCabang; const ARequestFilter: string): Boolean;
begin
  if FCloseCommand = nil then
  begin
    FCloseCommand := FConnection.CreateCommand;
    FCloseCommand.RequestType := 'POST';
    FCloseCommand.Text := 'TServerClosingInventory."Close"';
    FCloseCommand.Prepare(TServerClosingInventory_Close);
  end;
  FCloseCommand.Parameters[0].Value.SetInt32(APeriode);
  if not Assigned(ACabang) then
    FCloseCommand.Parameters[1].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FCloseCommand.Parameters[1].ConnectionHandler).GetJSONMarshaler;
    try
      FCloseCommand.Parameters[1].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FCloseCommand.Execute(ARequestFilter);
  Result := FCloseCommand.Parameters[2].Value.GetBoolean;
end;

function TServerClosingInventoryClient.Delete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FConnection.CreateCommand;
    FDeleteCommand.RequestType := 'POST';
    FDeleteCommand.Text := 'TServerClosingInventory."Delete"';
    FDeleteCommand.Prepare(TServerClosingInventory_Delete);
  end;
  if not Assigned(AAppObject) then
    FDeleteCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteCommand.Execute(ARequestFilter);
  Result := FDeleteCommand.Parameters[1].Value.GetBoolean;
end;

function TServerClosingInventoryClient.RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSCommand = nil then
  begin
    FRetrieveCDSCommand := FConnection.CreateCommand;
    FRetrieveCDSCommand.RequestType := 'POST';
    FRetrieveCDSCommand.Text := 'TServerClosingInventory."RetrieveCDS"';
    FRetrieveCDSCommand.Prepare(TServerClosingInventory_RetrieveCDS);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSCommand.FreeOnExecute(Result);
end;

function TServerClosingInventoryClient.RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSCommand_Cache = nil then
  begin
    FRetrieveCDSCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSCommand_Cache.RequestType := 'POST';
    FRetrieveCDSCommand_Cache.Text := 'TServerClosingInventory."RetrieveCDS"';
    FRetrieveCDSCommand_Cache.Prepare(TServerClosingInventory_RetrieveCDS_Cache);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerClosingInventoryClient.Save(AOBject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FSaveCommand = nil then
  begin
    FSaveCommand := FConnection.CreateCommand;
    FSaveCommand.RequestType := 'POST';
    FSaveCommand.Text := 'TServerClosingInventory."Save"';
    FSaveCommand.Prepare(TServerClosingInventory_Save);
  end;
  if not Assigned(AOBject) then
    FSaveCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AOBject), True);
      if FInstanceOwner then
        AOBject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveCommand.Execute(ARequestFilter);
  Result := FSaveCommand.Parameters[1].Value.GetBoolean;
end;

constructor TServerClosingInventoryClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerClosingInventoryClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerClosingInventoryClient.Destroy;
begin
  FCloseCommand.DisposeOf;
  FDeleteCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

function TServerPembayaranSupplierClient.Retrieve(AID: string; const ARequestFilter: string): TPembayaranSupplier;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TServerPembayaranSupplier.Retrieve';
    FRetrieveCommand.Prepare(TServerPembayaranSupplier_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TPembayaranSupplier(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerPembayaranSupplierClient.Retrieve_Cache(AID: string; const ARequestFilter: string): IDSRestCachedTPembayaranSupplier;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TServerPembayaranSupplier.Retrieve';
    FRetrieveCommand_Cache.Prepare(TServerPembayaranSupplier_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTPembayaranSupplier.Create(FRetrieveCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerPembayaranSupplierClient.RetrieveCDS2(const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDS2Command = nil then
  begin
    FRetrieveCDS2Command := FConnection.CreateCommand;
    FRetrieveCDS2Command.RequestType := 'GET';
    FRetrieveCDS2Command.Text := 'TServerPembayaranSupplier.RetrieveCDS2';
    FRetrieveCDS2Command.Prepare(TServerPembayaranSupplier_RetrieveCDS2);
  end;
  FRetrieveCDS2Command.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDS2Command.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDS2Command.FreeOnExecute(Result);
end;

function TServerPembayaranSupplierClient.RetrieveCDS2_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDS2Command_Cache = nil then
  begin
    FRetrieveCDS2Command_Cache := FConnection.CreateCommand;
    FRetrieveCDS2Command_Cache.RequestType := 'GET';
    FRetrieveCDS2Command_Cache.Text := 'TServerPembayaranSupplier.RetrieveCDS2';
    FRetrieveCDS2Command_Cache.Prepare(TServerPembayaranSupplier_RetrieveCDS2_Cache);
  end;
  FRetrieveCDS2Command_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDS2Command_Cache.Parameters[0].Value.GetString);
end;

function TServerPembayaranSupplierClient.Delete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FConnection.CreateCommand;
    FDeleteCommand.RequestType := 'POST';
    FDeleteCommand.Text := 'TServerPembayaranSupplier."Delete"';
    FDeleteCommand.Prepare(TServerPembayaranSupplier_Delete);
  end;
  if not Assigned(AAppObject) then
    FDeleteCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteCommand.Execute(ARequestFilter);
  Result := FDeleteCommand.Parameters[1].Value.GetBoolean;
end;

function TServerPembayaranSupplierClient.RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSCommand = nil then
  begin
    FRetrieveCDSCommand := FConnection.CreateCommand;
    FRetrieveCDSCommand.RequestType := 'POST';
    FRetrieveCDSCommand.Text := 'TServerPembayaranSupplier."RetrieveCDS"';
    FRetrieveCDSCommand.Prepare(TServerPembayaranSupplier_RetrieveCDS);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSCommand.FreeOnExecute(Result);
end;

function TServerPembayaranSupplierClient.RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSCommand_Cache = nil then
  begin
    FRetrieveCDSCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSCommand_Cache.RequestType := 'POST';
    FRetrieveCDSCommand_Cache.Text := 'TServerPembayaranSupplier."RetrieveCDS"';
    FRetrieveCDSCommand_Cache.Prepare(TServerPembayaranSupplier_RetrieveCDS_Cache);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerPembayaranSupplierClient.Save(AOBject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FSaveCommand = nil then
  begin
    FSaveCommand := FConnection.CreateCommand;
    FSaveCommand.RequestType := 'POST';
    FSaveCommand.Text := 'TServerPembayaranSupplier."Save"';
    FSaveCommand.Prepare(TServerPembayaranSupplier_Save);
  end;
  if not Assigned(AOBject) then
    FSaveCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AOBject), True);
      if FInstanceOwner then
        AOBject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveCommand.Execute(ARequestFilter);
  Result := FSaveCommand.Parameters[1].Value.GetBoolean;
end;

constructor TServerPembayaranSupplierClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerPembayaranSupplierClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerPembayaranSupplierClient.Destroy;
begin
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FRetrieveCDS2Command.DisposeOf;
  FRetrieveCDS2Command_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

function TServerGudangClient.Retrieve(AID: string; const ARequestFilter: string): TGudang;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TServerGudang.Retrieve';
    FRetrieveCommand.Prepare(TServerGudang_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TGudang(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerGudangClient.Retrieve_Cache(AID: string; const ARequestFilter: string): IDSRestCachedTGudang;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TServerGudang.Retrieve';
    FRetrieveCommand_Cache.Prepare(TServerGudang_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTGudang.Create(FRetrieveCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerGudangClient.RetrieveKode(AKode: string; const ARequestFilter: string): TGudang;
begin
  if FRetrieveKodeCommand = nil then
  begin
    FRetrieveKodeCommand := FConnection.CreateCommand;
    FRetrieveKodeCommand.RequestType := 'GET';
    FRetrieveKodeCommand.Text := 'TServerGudang.RetrieveKode';
    FRetrieveKodeCommand.Prepare(TServerGudang_RetrieveKode);
  end;
  FRetrieveKodeCommand.Parameters[0].Value.SetWideString(AKode);
  FRetrieveKodeCommand.Execute(ARequestFilter);
  if not FRetrieveKodeCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveKodeCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TGudang(FUnMarshal.UnMarshal(FRetrieveKodeCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveKodeCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerGudangClient.RetrieveKode_Cache(AKode: string; const ARequestFilter: string): IDSRestCachedTGudang;
begin
  if FRetrieveKodeCommand_Cache = nil then
  begin
    FRetrieveKodeCommand_Cache := FConnection.CreateCommand;
    FRetrieveKodeCommand_Cache.RequestType := 'GET';
    FRetrieveKodeCommand_Cache.Text := 'TServerGudang.RetrieveKode';
    FRetrieveKodeCommand_Cache.Prepare(TServerGudang_RetrieveKode_Cache);
  end;
  FRetrieveKodeCommand_Cache.Parameters[0].Value.SetWideString(AKode);
  FRetrieveKodeCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTGudang.Create(FRetrieveKodeCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerGudangClient.Delete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FConnection.CreateCommand;
    FDeleteCommand.RequestType := 'POST';
    FDeleteCommand.Text := 'TServerGudang."Delete"';
    FDeleteCommand.Prepare(TServerGudang_Delete);
  end;
  if not Assigned(AAppObject) then
    FDeleteCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteCommand.Execute(ARequestFilter);
  Result := FDeleteCommand.Parameters[1].Value.GetBoolean;
end;

function TServerGudangClient.RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSCommand = nil then
  begin
    FRetrieveCDSCommand := FConnection.CreateCommand;
    FRetrieveCDSCommand.RequestType := 'POST';
    FRetrieveCDSCommand.Text := 'TServerGudang."RetrieveCDS"';
    FRetrieveCDSCommand.Prepare(TServerGudang_RetrieveCDS);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSCommand.FreeOnExecute(Result);
end;

function TServerGudangClient.RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSCommand_Cache = nil then
  begin
    FRetrieveCDSCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSCommand_Cache.RequestType := 'POST';
    FRetrieveCDSCommand_Cache.Text := 'TServerGudang."RetrieveCDS"';
    FRetrieveCDSCommand_Cache.Prepare(TServerGudang_RetrieveCDS_Cache);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerGudangClient.Save(AOBject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FSaveCommand = nil then
  begin
    FSaveCommand := FConnection.CreateCommand;
    FSaveCommand.RequestType := 'POST';
    FSaveCommand.Text := 'TServerGudang."Save"';
    FSaveCommand.Prepare(TServerGudang_Save);
  end;
  if not Assigned(AOBject) then
    FSaveCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AOBject), True);
      if FInstanceOwner then
        AOBject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveCommand.Execute(ARequestFilter);
  Result := FSaveCommand.Parameters[1].Value.GetBoolean;
end;

constructor TServerGudangClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerGudangClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerGudangClient.Destroy;
begin
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FRetrieveKodeCommand.DisposeOf;
  FRetrieveKodeCommand_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

function TServerPenjualanClient.Retrieve(AID: string; const ARequestFilter: string): TPenjualan;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TServerPenjualan.Retrieve';
    FRetrieveCommand.Prepare(TServerPenjualan_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TPenjualan(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerPenjualanClient.Retrieve_Cache(AID: string; const ARequestFilter: string): IDSRestCachedTPenjualan;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TServerPenjualan.Retrieve';
    FRetrieveCommand_Cache.Prepare(TServerPenjualan_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTPenjualan.Create(FRetrieveCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerPenjualanClient.RetrieveNoBukti(ANoBukti: string; const ARequestFilter: string): TPenjualan;
begin
  if FRetrieveNoBuktiCommand = nil then
  begin
    FRetrieveNoBuktiCommand := FConnection.CreateCommand;
    FRetrieveNoBuktiCommand.RequestType := 'GET';
    FRetrieveNoBuktiCommand.Text := 'TServerPenjualan.RetrieveNoBukti';
    FRetrieveNoBuktiCommand.Prepare(TServerPenjualan_RetrieveNoBukti);
  end;
  FRetrieveNoBuktiCommand.Parameters[0].Value.SetWideString(ANoBukti);
  FRetrieveNoBuktiCommand.Execute(ARequestFilter);
  if not FRetrieveNoBuktiCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveNoBuktiCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TPenjualan(FUnMarshal.UnMarshal(FRetrieveNoBuktiCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveNoBuktiCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerPenjualanClient.RetrieveNoBukti_Cache(ANoBukti: string; const ARequestFilter: string): IDSRestCachedTPenjualan;
begin
  if FRetrieveNoBuktiCommand_Cache = nil then
  begin
    FRetrieveNoBuktiCommand_Cache := FConnection.CreateCommand;
    FRetrieveNoBuktiCommand_Cache.RequestType := 'GET';
    FRetrieveNoBuktiCommand_Cache.Text := 'TServerPenjualan.RetrieveNoBukti';
    FRetrieveNoBuktiCommand_Cache.Prepare(TServerPenjualan_RetrieveNoBukti_Cache);
  end;
  FRetrieveNoBuktiCommand_Cache.Parameters[0].Value.SetWideString(ANoBukti);
  FRetrieveNoBuktiCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTPenjualan.Create(FRetrieveNoBuktiCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerPenjualanClient.RetrieveCDSlip(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; ANoBukti: string; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSlipCommand = nil then
  begin
    FRetrieveCDSlipCommand := FConnection.CreateCommand;
    FRetrieveCDSlipCommand.RequestType := 'POST';
    FRetrieveCDSlipCommand.Text := 'TServerPenjualan."RetrieveCDSlip"';
    FRetrieveCDSlipCommand.Prepare(TServerPenjualan_RetrieveCDSlip);
  end;
  FRetrieveCDSlipCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetrieveCDSlipCommand.Parameters[1].Value.AsDateTime := ATglAtglAkhir;
  if not Assigned(ACabang) then
    FRetrieveCDSlipCommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSlipCommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSlipCommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSlipCommand.Parameters[3].Value.SetWideString(ANoBukti);
  FRetrieveCDSlipCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSlipCommand.Parameters[4].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSlipCommand.FreeOnExecute(Result);
end;

function TServerPenjualanClient.RetrieveCDSlip_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; ANoBukti: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSlipCommand_Cache = nil then
  begin
    FRetrieveCDSlipCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSlipCommand_Cache.RequestType := 'POST';
    FRetrieveCDSlipCommand_Cache.Text := 'TServerPenjualan."RetrieveCDSlip"';
    FRetrieveCDSlipCommand_Cache.Prepare(TServerPenjualan_RetrieveCDSlip_Cache);
  end;
  FRetrieveCDSlipCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetrieveCDSlipCommand_Cache.Parameters[1].Value.AsDateTime := ATglAtglAkhir;
  if not Assigned(ACabang) then
    FRetrieveCDSlipCommand_Cache.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSlipCommand_Cache.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSlipCommand_Cache.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSlipCommand_Cache.Parameters[3].Value.SetWideString(ANoBukti);
  FRetrieveCDSlipCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSlipCommand_Cache.Parameters[4].Value.GetString);
end;

function TServerPenjualanClient.GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string): string;
begin
  if FGenerateNoBuktiCommand = nil then
  begin
    FGenerateNoBuktiCommand := FConnection.CreateCommand;
    FGenerateNoBuktiCommand.RequestType := 'GET';
    FGenerateNoBuktiCommand.Text := 'TServerPenjualan.GenerateNoBukti';
    FGenerateNoBuktiCommand.Prepare(TServerPenjualan_GenerateNoBukti);
  end;
  FGenerateNoBuktiCommand.Parameters[0].Value.AsDateTime := ATglBukti;
  FGenerateNoBuktiCommand.Parameters[1].Value.SetWideString(APrefix);
  FGenerateNoBuktiCommand.Execute(ARequestFilter);
  Result := FGenerateNoBuktiCommand.Parameters[2].Value.GetWideString;
end;

function TServerPenjualanClient.Delete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FConnection.CreateCommand;
    FDeleteCommand.RequestType := 'POST';
    FDeleteCommand.Text := 'TServerPenjualan."Delete"';
    FDeleteCommand.Prepare(TServerPenjualan_Delete);
  end;
  if not Assigned(AAppObject) then
    FDeleteCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteCommand.Execute(ARequestFilter);
  Result := FDeleteCommand.Parameters[1].Value.GetBoolean;
end;

function TServerPenjualanClient.RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSCommand = nil then
  begin
    FRetrieveCDSCommand := FConnection.CreateCommand;
    FRetrieveCDSCommand.RequestType := 'POST';
    FRetrieveCDSCommand.Text := 'TServerPenjualan."RetrieveCDS"';
    FRetrieveCDSCommand.Prepare(TServerPenjualan_RetrieveCDS);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSCommand.FreeOnExecute(Result);
end;

function TServerPenjualanClient.RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSCommand_Cache = nil then
  begin
    FRetrieveCDSCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSCommand_Cache.RequestType := 'POST';
    FRetrieveCDSCommand_Cache.Text := 'TServerPenjualan."RetrieveCDS"';
    FRetrieveCDSCommand_Cache.Prepare(TServerPenjualan_RetrieveCDS_Cache);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerPenjualanClient.Save(AOBject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FSaveCommand = nil then
  begin
    FSaveCommand := FConnection.CreateCommand;
    FSaveCommand.RequestType := 'POST';
    FSaveCommand.Text := 'TServerPenjualan."Save"';
    FSaveCommand.Prepare(TServerPenjualan_Save);
  end;
  if not Assigned(AOBject) then
    FSaveCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AOBject), True);
      if FInstanceOwner then
        AOBject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveCommand.Execute(ARequestFilter);
  Result := FSaveCommand.Parameters[1].Value.GetBoolean;
end;

constructor TServerPenjualanClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerPenjualanClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerPenjualanClient.Destroy;
begin
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FRetrieveNoBuktiCommand.DisposeOf;
  FRetrieveNoBuktiCommand_Cache.DisposeOf;
  FRetrieveCDSlipCommand.DisposeOf;
  FRetrieveCDSlipCommand_Cache.DisposeOf;
  FGenerateNoBuktiCommand.DisposeOf;
  FDeleteCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

function TServerARClient.Retrieve(AID: string; const ARequestFilter: string): TAR;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TServerAR.Retrieve';
    FRetrieveCommand.Prepare(TServerAR_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TAR(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerARClient.Retrieve_Cache(AID: string; const ARequestFilter: string): IDSRestCachedTAR;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TServerAR.Retrieve';
    FRetrieveCommand_Cache.Prepare(TServerAR_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTAR.Create(FRetrieveCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerARClient.RetrieveCDSlip(AID: string; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSlipCommand = nil then
  begin
    FRetrieveCDSlipCommand := FConnection.CreateCommand;
    FRetrieveCDSlipCommand.RequestType := 'GET';
    FRetrieveCDSlipCommand.Text := 'TServerAR.RetrieveCDSlip';
    FRetrieveCDSlipCommand.Prepare(TServerAR_RetrieveCDSlip);
  end;
  FRetrieveCDSlipCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCDSlipCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSlipCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSlipCommand.FreeOnExecute(Result);
end;

function TServerARClient.RetrieveCDSlip_Cache(AID: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSlipCommand_Cache = nil then
  begin
    FRetrieveCDSlipCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSlipCommand_Cache.RequestType := 'GET';
    FRetrieveCDSlipCommand_Cache.Text := 'TServerAR.RetrieveCDSlip';
    FRetrieveCDSlipCommand_Cache.Prepare(TServerAR_RetrieveCDSlip_Cache);
  end;
  FRetrieveCDSlipCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCDSlipCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSlipCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerARClient.RetrieveNoBukti(ANoBukti: string; const ARequestFilter: string): TAR;
begin
  if FRetrieveNoBuktiCommand = nil then
  begin
    FRetrieveNoBuktiCommand := FConnection.CreateCommand;
    FRetrieveNoBuktiCommand.RequestType := 'GET';
    FRetrieveNoBuktiCommand.Text := 'TServerAR.RetrieveNoBukti';
    FRetrieveNoBuktiCommand.Prepare(TServerAR_RetrieveNoBukti);
  end;
  FRetrieveNoBuktiCommand.Parameters[0].Value.SetWideString(ANoBukti);
  FRetrieveNoBuktiCommand.Execute(ARequestFilter);
  if not FRetrieveNoBuktiCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveNoBuktiCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TAR(FUnMarshal.UnMarshal(FRetrieveNoBuktiCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveNoBuktiCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerARClient.RetrieveNoBukti_Cache(ANoBukti: string; const ARequestFilter: string): IDSRestCachedTAR;
begin
  if FRetrieveNoBuktiCommand_Cache = nil then
  begin
    FRetrieveNoBuktiCommand_Cache := FConnection.CreateCommand;
    FRetrieveNoBuktiCommand_Cache.RequestType := 'GET';
    FRetrieveNoBuktiCommand_Cache.Text := 'TServerAR.RetrieveNoBukti';
    FRetrieveNoBuktiCommand_Cache.Prepare(TServerAR_RetrieveNoBukti_Cache);
  end;
  FRetrieveNoBuktiCommand_Cache.Parameters[0].Value.SetWideString(ANoBukti);
  FRetrieveNoBuktiCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTAR.Create(FRetrieveNoBuktiCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerARClient.GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string): string;
begin
  if FGenerateNoBuktiCommand = nil then
  begin
    FGenerateNoBuktiCommand := FConnection.CreateCommand;
    FGenerateNoBuktiCommand.RequestType := 'GET';
    FGenerateNoBuktiCommand.Text := 'TServerAR.GenerateNoBukti';
    FGenerateNoBuktiCommand.Prepare(TServerAR_GenerateNoBukti);
  end;
  FGenerateNoBuktiCommand.Parameters[0].Value.AsDateTime := ATglBukti;
  FGenerateNoBuktiCommand.Parameters[1].Value.SetWideString(APrefix);
  FGenerateNoBuktiCommand.Execute(ARequestFilter);
  Result := FGenerateNoBuktiCommand.Parameters[2].Value.GetWideString;
end;

function TServerARClient.Delete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FConnection.CreateCommand;
    FDeleteCommand.RequestType := 'POST';
    FDeleteCommand.Text := 'TServerAR."Delete"';
    FDeleteCommand.Prepare(TServerAR_Delete);
  end;
  if not Assigned(AAppObject) then
    FDeleteCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteCommand.Execute(ARequestFilter);
  Result := FDeleteCommand.Parameters[1].Value.GetBoolean;
end;

function TServerARClient.RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSCommand = nil then
  begin
    FRetrieveCDSCommand := FConnection.CreateCommand;
    FRetrieveCDSCommand.RequestType := 'POST';
    FRetrieveCDSCommand.Text := 'TServerAR."RetrieveCDS"';
    FRetrieveCDSCommand.Prepare(TServerAR_RetrieveCDS);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSCommand.FreeOnExecute(Result);
end;

function TServerARClient.RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSCommand_Cache = nil then
  begin
    FRetrieveCDSCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSCommand_Cache.RequestType := 'POST';
    FRetrieveCDSCommand_Cache.Text := 'TServerAR."RetrieveCDS"';
    FRetrieveCDSCommand_Cache.Prepare(TServerAR_RetrieveCDS_Cache);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerARClient.Save(AOBject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FSaveCommand = nil then
  begin
    FSaveCommand := FConnection.CreateCommand;
    FSaveCommand.RequestType := 'POST';
    FSaveCommand.Text := 'TServerAR."Save"';
    FSaveCommand.Prepare(TServerAR_Save);
  end;
  if not Assigned(AOBject) then
    FSaveCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AOBject), True);
      if FInstanceOwner then
        AOBject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveCommand.Execute(ARequestFilter);
  Result := FSaveCommand.Parameters[1].Value.GetBoolean;
end;

constructor TServerARClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerARClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerARClient.Destroy;
begin
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FRetrieveCDSlipCommand.DisposeOf;
  FRetrieveCDSlipCommand_Cache.DisposeOf;
  FRetrieveNoBuktiCommand.DisposeOf;
  FRetrieveNoBuktiCommand_Cache.DisposeOf;
  FGenerateNoBuktiCommand.DisposeOf;
  FDeleteCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

function TServerAccountClient.Retrieve(AID: string; const ARequestFilter: string): TAccount;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TServerAccount.Retrieve';
    FRetrieveCommand.Prepare(TServerAccount_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TAccount(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerAccountClient.Retrieve_Cache(AID: string; const ARequestFilter: string): IDSRestCachedTAccount;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TServerAccount.Retrieve';
    FRetrieveCommand_Cache.Prepare(TServerAccount_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTAccount.Create(FRetrieveCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerAccountClient.Delete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FConnection.CreateCommand;
    FDeleteCommand.RequestType := 'POST';
    FDeleteCommand.Text := 'TServerAccount."Delete"';
    FDeleteCommand.Prepare(TServerAccount_Delete);
  end;
  if not Assigned(AAppObject) then
    FDeleteCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteCommand.Execute(ARequestFilter);
  Result := FDeleteCommand.Parameters[1].Value.GetBoolean;
end;

function TServerAccountClient.RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSCommand = nil then
  begin
    FRetrieveCDSCommand := FConnection.CreateCommand;
    FRetrieveCDSCommand.RequestType := 'POST';
    FRetrieveCDSCommand.Text := 'TServerAccount."RetrieveCDS"';
    FRetrieveCDSCommand.Prepare(TServerAccount_RetrieveCDS);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSCommand.FreeOnExecute(Result);
end;

function TServerAccountClient.RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSCommand_Cache = nil then
  begin
    FRetrieveCDSCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSCommand_Cache.RequestType := 'POST';
    FRetrieveCDSCommand_Cache.Text := 'TServerAccount."RetrieveCDS"';
    FRetrieveCDSCommand_Cache.Prepare(TServerAccount_RetrieveCDS_Cache);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerAccountClient.Save(AOBject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FSaveCommand = nil then
  begin
    FSaveCommand := FConnection.CreateCommand;
    FSaveCommand.RequestType := 'POST';
    FSaveCommand.Text := 'TServerAccount."Save"';
    FSaveCommand.Prepare(TServerAccount_Save);
  end;
  if not Assigned(AOBject) then
    FSaveCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AOBject), True);
      if FInstanceOwner then
        AOBject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveCommand.Execute(ARequestFilter);
  Result := FSaveCommand.Parameters[1].Value.GetBoolean;
end;

constructor TServerAccountClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerAccountClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerAccountClient.Destroy;
begin
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

function TServerRekBankClient.Retrieve(AID: string; const ARequestFilter: string): TRekBank;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TServerRekBank.Retrieve';
    FRetrieveCommand.Prepare(TServerRekBank_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TRekBank(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerRekBankClient.Retrieve_Cache(AID: string; const ARequestFilter: string): IDSRestCachedTRekBank;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TServerRekBank.Retrieve';
    FRetrieveCommand_Cache.Prepare(TServerRekBank_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTRekBank.Create(FRetrieveCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerRekBankClient.Delete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FConnection.CreateCommand;
    FDeleteCommand.RequestType := 'POST';
    FDeleteCommand.Text := 'TServerRekBank."Delete"';
    FDeleteCommand.Prepare(TServerRekBank_Delete);
  end;
  if not Assigned(AAppObject) then
    FDeleteCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteCommand.Execute(ARequestFilter);
  Result := FDeleteCommand.Parameters[1].Value.GetBoolean;
end;

function TServerRekBankClient.RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSCommand = nil then
  begin
    FRetrieveCDSCommand := FConnection.CreateCommand;
    FRetrieveCDSCommand.RequestType := 'POST';
    FRetrieveCDSCommand.Text := 'TServerRekBank."RetrieveCDS"';
    FRetrieveCDSCommand.Prepare(TServerRekBank_RetrieveCDS);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSCommand.FreeOnExecute(Result);
end;

function TServerRekBankClient.RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSCommand_Cache = nil then
  begin
    FRetrieveCDSCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSCommand_Cache.RequestType := 'POST';
    FRetrieveCDSCommand_Cache.Text := 'TServerRekBank."RetrieveCDS"';
    FRetrieveCDSCommand_Cache.Prepare(TServerRekBank_RetrieveCDS_Cache);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerRekBankClient.Save(AOBject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FSaveCommand = nil then
  begin
    FSaveCommand := FConnection.CreateCommand;
    FSaveCommand.RequestType := 'POST';
    FSaveCommand.Text := 'TServerRekBank."Save"';
    FSaveCommand.Prepare(TServerRekBank_Save);
  end;
  if not Assigned(AOBject) then
    FSaveCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AOBject), True);
      if FInstanceOwner then
        AOBject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveCommand.Execute(ARequestFilter);
  Result := FSaveCommand.Parameters[1].Value.GetBoolean;
end;

constructor TServerRekBankClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerRekBankClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerRekBankClient.Destroy;
begin
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

function TServerPenerimaanKasClient.AfterSave(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FAfterSaveCommand = nil then
  begin
    FAfterSaveCommand := FConnection.CreateCommand;
    FAfterSaveCommand.RequestType := 'POST';
    FAfterSaveCommand.Text := 'TServerPenerimaanKas."AfterSave"';
    FAfterSaveCommand.Prepare(TServerPenerimaanKas_AfterSave);
  end;
  if not Assigned(AAppObject) then
    FAfterSaveCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FAfterSaveCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FAfterSaveCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FAfterSaveCommand.Execute(ARequestFilter);
  Result := FAfterSaveCommand.Parameters[1].Value.GetBoolean;
end;

function TServerPenerimaanKasClient.AfterDelete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FAfterDeleteCommand = nil then
  begin
    FAfterDeleteCommand := FConnection.CreateCommand;
    FAfterDeleteCommand.RequestType := 'POST';
    FAfterDeleteCommand.Text := 'TServerPenerimaanKas."AfterDelete"';
    FAfterDeleteCommand.Prepare(TServerPenerimaanKas_AfterDelete);
  end;
  if not Assigned(AAppObject) then
    FAfterDeleteCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FAfterDeleteCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FAfterDeleteCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FAfterDeleteCommand.Execute(ARequestFilter);
  Result := FAfterDeleteCommand.Parameters[1].Value.GetBoolean;
end;

function TServerPenerimaanKasClient.BeforeSave(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FBeforeSaveCommand = nil then
  begin
    FBeforeSaveCommand := FConnection.CreateCommand;
    FBeforeSaveCommand.RequestType := 'POST';
    FBeforeSaveCommand.Text := 'TServerPenerimaanKas."BeforeSave"';
    FBeforeSaveCommand.Prepare(TServerPenerimaanKas_BeforeSave);
  end;
  if not Assigned(AAppObject) then
    FBeforeSaveCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FBeforeSaveCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FBeforeSaveCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FBeforeSaveCommand.Execute(ARequestFilter);
  Result := FBeforeSaveCommand.Parameters[1].Value.GetBoolean;
end;

function TServerPenerimaanKasClient.Retrieve(AID: string; const ARequestFilter: string): TPenerimaanKas;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TServerPenerimaanKas.Retrieve';
    FRetrieveCommand.Prepare(TServerPenerimaanKas_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TPenerimaanKas(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerPenerimaanKasClient.Retrieve_Cache(AID: string; const ARequestFilter: string): IDSRestCachedTPenerimaanKas;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TServerPenerimaanKas.Retrieve';
    FRetrieveCommand_Cache.Prepare(TServerPenerimaanKas_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTPenerimaanKas.Create(FRetrieveCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerPenerimaanKasClient.RetrievePenerimaanARs(AID: string; const ARequestFilter: string): TDataSet;
begin
  if FRetrievePenerimaanARsCommand = nil then
  begin
    FRetrievePenerimaanARsCommand := FConnection.CreateCommand;
    FRetrievePenerimaanARsCommand.RequestType := 'GET';
    FRetrievePenerimaanARsCommand.Text := 'TServerPenerimaanKas.RetrievePenerimaanARs';
    FRetrievePenerimaanARsCommand.Prepare(TServerPenerimaanKas_RetrievePenerimaanARs);
  end;
  FRetrievePenerimaanARsCommand.Parameters[0].Value.SetWideString(AID);
  FRetrievePenerimaanARsCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrievePenerimaanARsCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrievePenerimaanARsCommand.FreeOnExecute(Result);
end;

function TServerPenerimaanKasClient.RetrievePenerimaanARs_Cache(AID: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrievePenerimaanARsCommand_Cache = nil then
  begin
    FRetrievePenerimaanARsCommand_Cache := FConnection.CreateCommand;
    FRetrievePenerimaanARsCommand_Cache.RequestType := 'GET';
    FRetrievePenerimaanARsCommand_Cache.Text := 'TServerPenerimaanKas.RetrievePenerimaanARs';
    FRetrievePenerimaanARsCommand_Cache.Prepare(TServerPenerimaanKas_RetrievePenerimaanARs_Cache);
  end;
  FRetrievePenerimaanARsCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrievePenerimaanARsCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrievePenerimaanARsCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerPenerimaanKasClient.RetrieveCDSlip(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; ANoBukti: string; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSlipCommand = nil then
  begin
    FRetrieveCDSlipCommand := FConnection.CreateCommand;
    FRetrieveCDSlipCommand.RequestType := 'POST';
    FRetrieveCDSlipCommand.Text := 'TServerPenerimaanKas."RetrieveCDSlip"';
    FRetrieveCDSlipCommand.Prepare(TServerPenerimaanKas_RetrieveCDSlip);
  end;
  FRetrieveCDSlipCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetrieveCDSlipCommand.Parameters[1].Value.AsDateTime := ATglAtglAkhir;
  if not Assigned(ACabang) then
    FRetrieveCDSlipCommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSlipCommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSlipCommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSlipCommand.Parameters[3].Value.SetWideString(ANoBukti);
  FRetrieveCDSlipCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSlipCommand.Parameters[4].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSlipCommand.FreeOnExecute(Result);
end;

function TServerPenerimaanKasClient.RetrieveCDSlip_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; ANoBukti: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSlipCommand_Cache = nil then
  begin
    FRetrieveCDSlipCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSlipCommand_Cache.RequestType := 'POST';
    FRetrieveCDSlipCommand_Cache.Text := 'TServerPenerimaanKas."RetrieveCDSlip"';
    FRetrieveCDSlipCommand_Cache.Prepare(TServerPenerimaanKas_RetrieveCDSlip_Cache);
  end;
  FRetrieveCDSlipCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetrieveCDSlipCommand_Cache.Parameters[1].Value.AsDateTime := ATglAtglAkhir;
  if not Assigned(ACabang) then
    FRetrieveCDSlipCommand_Cache.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSlipCommand_Cache.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSlipCommand_Cache.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSlipCommand_Cache.Parameters[3].Value.SetWideString(ANoBukti);
  FRetrieveCDSlipCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSlipCommand_Cache.Parameters[4].Value.GetString);
end;

function TServerPenerimaanKasClient.RetrieveNoBukti(ANoBukti: string; const ARequestFilter: string): TPenerimaanKas;
begin
  if FRetrieveNoBuktiCommand = nil then
  begin
    FRetrieveNoBuktiCommand := FConnection.CreateCommand;
    FRetrieveNoBuktiCommand.RequestType := 'GET';
    FRetrieveNoBuktiCommand.Text := 'TServerPenerimaanKas.RetrieveNoBukti';
    FRetrieveNoBuktiCommand.Prepare(TServerPenerimaanKas_RetrieveNoBukti);
  end;
  FRetrieveNoBuktiCommand.Parameters[0].Value.SetWideString(ANoBukti);
  FRetrieveNoBuktiCommand.Execute(ARequestFilter);
  if not FRetrieveNoBuktiCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveNoBuktiCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TPenerimaanKas(FUnMarshal.UnMarshal(FRetrieveNoBuktiCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveNoBuktiCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerPenerimaanKasClient.RetrieveNoBukti_Cache(ANoBukti: string; const ARequestFilter: string): IDSRestCachedTPenerimaanKas;
begin
  if FRetrieveNoBuktiCommand_Cache = nil then
  begin
    FRetrieveNoBuktiCommand_Cache := FConnection.CreateCommand;
    FRetrieveNoBuktiCommand_Cache.RequestType := 'GET';
    FRetrieveNoBuktiCommand_Cache.Text := 'TServerPenerimaanKas.RetrieveNoBukti';
    FRetrieveNoBuktiCommand_Cache.Prepare(TServerPenerimaanKas_RetrieveNoBukti_Cache);
  end;
  FRetrieveNoBuktiCommand_Cache.Parameters[0].Value.SetWideString(ANoBukti);
  FRetrieveNoBuktiCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTPenerimaanKas.Create(FRetrieveNoBuktiCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerPenerimaanKasClient.GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string): string;
begin
  if FGenerateNoBuktiCommand = nil then
  begin
    FGenerateNoBuktiCommand := FConnection.CreateCommand;
    FGenerateNoBuktiCommand.RequestType := 'GET';
    FGenerateNoBuktiCommand.Text := 'TServerPenerimaanKas.GenerateNoBukti';
    FGenerateNoBuktiCommand.Prepare(TServerPenerimaanKas_GenerateNoBukti);
  end;
  FGenerateNoBuktiCommand.Parameters[0].Value.AsDateTime := ATglBukti;
  FGenerateNoBuktiCommand.Parameters[1].Value.SetWideString(APrefix);
  FGenerateNoBuktiCommand.Execute(ARequestFilter);
  Result := FGenerateNoBuktiCommand.Parameters[2].Value.GetWideString;
end;

function TServerPenerimaanKasClient.Delete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FConnection.CreateCommand;
    FDeleteCommand.RequestType := 'POST';
    FDeleteCommand.Text := 'TServerPenerimaanKas."Delete"';
    FDeleteCommand.Prepare(TServerPenerimaanKas_Delete);
  end;
  if not Assigned(AAppObject) then
    FDeleteCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteCommand.Execute(ARequestFilter);
  Result := FDeleteCommand.Parameters[1].Value.GetBoolean;
end;

function TServerPenerimaanKasClient.RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSCommand = nil then
  begin
    FRetrieveCDSCommand := FConnection.CreateCommand;
    FRetrieveCDSCommand.RequestType := 'POST';
    FRetrieveCDSCommand.Text := 'TServerPenerimaanKas."RetrieveCDS"';
    FRetrieveCDSCommand.Prepare(TServerPenerimaanKas_RetrieveCDS);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSCommand.FreeOnExecute(Result);
end;

function TServerPenerimaanKasClient.RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSCommand_Cache = nil then
  begin
    FRetrieveCDSCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSCommand_Cache.RequestType := 'POST';
    FRetrieveCDSCommand_Cache.Text := 'TServerPenerimaanKas."RetrieveCDS"';
    FRetrieveCDSCommand_Cache.Prepare(TServerPenerimaanKas_RetrieveCDS_Cache);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerPenerimaanKasClient.Save(AOBject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FSaveCommand = nil then
  begin
    FSaveCommand := FConnection.CreateCommand;
    FSaveCommand.RequestType := 'POST';
    FSaveCommand.Text := 'TServerPenerimaanKas."Save"';
    FSaveCommand.Prepare(TServerPenerimaanKas_Save);
  end;
  if not Assigned(AOBject) then
    FSaveCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AOBject), True);
      if FInstanceOwner then
        AOBject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveCommand.Execute(ARequestFilter);
  Result := FSaveCommand.Parameters[1].Value.GetBoolean;
end;

constructor TServerPenerimaanKasClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerPenerimaanKasClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerPenerimaanKasClient.Destroy;
begin
  FAfterSaveCommand.DisposeOf;
  FAfterDeleteCommand.DisposeOf;
  FBeforeSaveCommand.DisposeOf;
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FRetrievePenerimaanARsCommand.DisposeOf;
  FRetrievePenerimaanARsCommand_Cache.DisposeOf;
  FRetrieveCDSlipCommand.DisposeOf;
  FRetrieveCDSlipCommand_Cache.DisposeOf;
  FRetrieveNoBuktiCommand.DisposeOf;
  FRetrieveNoBuktiCommand_Cache.DisposeOf;
  FGenerateNoBuktiCommand.DisposeOf;
  FDeleteCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

function TServerSettingAppClient.Retrieve(AID: string; const ARequestFilter: string): TSettingApp;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TServerSettingApp.Retrieve';
    FRetrieveCommand.Prepare(TServerSettingApp_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TSettingApp(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerSettingAppClient.Retrieve_Cache(AID: string; const ARequestFilter: string): IDSRestCachedTSettingApp;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TServerSettingApp.Retrieve';
    FRetrieveCommand_Cache.Prepare(TServerSettingApp_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTSettingApp.Create(FRetrieveCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerSettingAppClient.RetrieveByCabang(ACabangID: string; const ARequestFilter: string): TSettingApp;
begin
  if FRetrieveByCabangCommand = nil then
  begin
    FRetrieveByCabangCommand := FConnection.CreateCommand;
    FRetrieveByCabangCommand.RequestType := 'GET';
    FRetrieveByCabangCommand.Text := 'TServerSettingApp.RetrieveByCabang';
    FRetrieveByCabangCommand.Prepare(TServerSettingApp_RetrieveByCabang);
  end;
  FRetrieveByCabangCommand.Parameters[0].Value.SetWideString(ACabangID);
  FRetrieveByCabangCommand.Execute(ARequestFilter);
  if not FRetrieveByCabangCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveByCabangCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TSettingApp(FUnMarshal.UnMarshal(FRetrieveByCabangCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveByCabangCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerSettingAppClient.RetrieveByCabang_Cache(ACabangID: string; const ARequestFilter: string): IDSRestCachedTSettingApp;
begin
  if FRetrieveByCabangCommand_Cache = nil then
  begin
    FRetrieveByCabangCommand_Cache := FConnection.CreateCommand;
    FRetrieveByCabangCommand_Cache.RequestType := 'GET';
    FRetrieveByCabangCommand_Cache.Text := 'TServerSettingApp.RetrieveByCabang';
    FRetrieveByCabangCommand_Cache.Prepare(TServerSettingApp_RetrieveByCabang_Cache);
  end;
  FRetrieveByCabangCommand_Cache.Parameters[0].Value.SetWideString(ACabangID);
  FRetrieveByCabangCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTSettingApp.Create(FRetrieveByCabangCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerSettingAppClient.Delete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FConnection.CreateCommand;
    FDeleteCommand.RequestType := 'POST';
    FDeleteCommand.Text := 'TServerSettingApp."Delete"';
    FDeleteCommand.Prepare(TServerSettingApp_Delete);
  end;
  if not Assigned(AAppObject) then
    FDeleteCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteCommand.Execute(ARequestFilter);
  Result := FDeleteCommand.Parameters[1].Value.GetBoolean;
end;

function TServerSettingAppClient.RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSCommand = nil then
  begin
    FRetrieveCDSCommand := FConnection.CreateCommand;
    FRetrieveCDSCommand.RequestType := 'POST';
    FRetrieveCDSCommand.Text := 'TServerSettingApp."RetrieveCDS"';
    FRetrieveCDSCommand.Prepare(TServerSettingApp_RetrieveCDS);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSCommand.FreeOnExecute(Result);
end;

function TServerSettingAppClient.RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSCommand_Cache = nil then
  begin
    FRetrieveCDSCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSCommand_Cache.RequestType := 'POST';
    FRetrieveCDSCommand_Cache.Text := 'TServerSettingApp."RetrieveCDS"';
    FRetrieveCDSCommand_Cache.Prepare(TServerSettingApp_RetrieveCDS_Cache);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerSettingAppClient.Save(AOBject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FSaveCommand = nil then
  begin
    FSaveCommand := FConnection.CreateCommand;
    FSaveCommand.RequestType := 'POST';
    FSaveCommand.Text := 'TServerSettingApp."Save"';
    FSaveCommand.Prepare(TServerSettingApp_Save);
  end;
  if not Assigned(AOBject) then
    FSaveCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AOBject), True);
      if FInstanceOwner then
        AOBject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveCommand.Execute(ARequestFilter);
  Result := FSaveCommand.Parameters[1].Value.GetBoolean;
end;

constructor TServerSettingAppClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerSettingAppClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerSettingAppClient.Destroy;
begin
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FRetrieveByCabangCommand.DisposeOf;
  FRetrieveByCabangCommand_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

function TServerTransferAntarGudangClient.Retrieve(AID: string; const ARequestFilter: string): TTransferAntarGudang;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TServerTransferAntarGudang.Retrieve';
    FRetrieveCommand.Prepare(TServerTransferAntarGudang_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TTransferAntarGudang(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerTransferAntarGudangClient.Retrieve_Cache(AID: string; const ARequestFilter: string): IDSRestCachedTTransferAntarGudang;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TServerTransferAntarGudang.Retrieve';
    FRetrieveCommand_Cache.Prepare(TServerTransferAntarGudang_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTTransferAntarGudang.Create(FRetrieveCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerTransferAntarGudangClient.RetrieveCDSlip(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; ANoBukti: string; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSlipCommand = nil then
  begin
    FRetrieveCDSlipCommand := FConnection.CreateCommand;
    FRetrieveCDSlipCommand.RequestType := 'POST';
    FRetrieveCDSlipCommand.Text := 'TServerTransferAntarGudang."RetrieveCDSlip"';
    FRetrieveCDSlipCommand.Prepare(TServerTransferAntarGudang_RetrieveCDSlip);
  end;
  FRetrieveCDSlipCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetrieveCDSlipCommand.Parameters[1].Value.AsDateTime := ATglAtglAkhir;
  if not Assigned(ACabang) then
    FRetrieveCDSlipCommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSlipCommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSlipCommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSlipCommand.Parameters[3].Value.SetWideString(ANoBukti);
  FRetrieveCDSlipCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSlipCommand.Parameters[4].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSlipCommand.FreeOnExecute(Result);
end;

function TServerTransferAntarGudangClient.RetrieveCDSlip_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; ANoBukti: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSlipCommand_Cache = nil then
  begin
    FRetrieveCDSlipCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSlipCommand_Cache.RequestType := 'POST';
    FRetrieveCDSlipCommand_Cache.Text := 'TServerTransferAntarGudang."RetrieveCDSlip"';
    FRetrieveCDSlipCommand_Cache.Prepare(TServerTransferAntarGudang_RetrieveCDSlip_Cache);
  end;
  FRetrieveCDSlipCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetrieveCDSlipCommand_Cache.Parameters[1].Value.AsDateTime := ATglAtglAkhir;
  if not Assigned(ACabang) then
    FRetrieveCDSlipCommand_Cache.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSlipCommand_Cache.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSlipCommand_Cache.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSlipCommand_Cache.Parameters[3].Value.SetWideString(ANoBukti);
  FRetrieveCDSlipCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSlipCommand_Cache.Parameters[4].Value.GetString);
end;

function TServerTransferAntarGudangClient.RetrieveNoBukti(ANoBukti: string; const ARequestFilter: string): TTransferAntarGudang;
begin
  if FRetrieveNoBuktiCommand = nil then
  begin
    FRetrieveNoBuktiCommand := FConnection.CreateCommand;
    FRetrieveNoBuktiCommand.RequestType := 'GET';
    FRetrieveNoBuktiCommand.Text := 'TServerTransferAntarGudang.RetrieveNoBukti';
    FRetrieveNoBuktiCommand.Prepare(TServerTransferAntarGudang_RetrieveNoBukti);
  end;
  FRetrieveNoBuktiCommand.Parameters[0].Value.SetWideString(ANoBukti);
  FRetrieveNoBuktiCommand.Execute(ARequestFilter);
  if not FRetrieveNoBuktiCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveNoBuktiCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TTransferAntarGudang(FUnMarshal.UnMarshal(FRetrieveNoBuktiCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveNoBuktiCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerTransferAntarGudangClient.RetrieveNoBukti_Cache(ANoBukti: string; const ARequestFilter: string): IDSRestCachedTTransferAntarGudang;
begin
  if FRetrieveNoBuktiCommand_Cache = nil then
  begin
    FRetrieveNoBuktiCommand_Cache := FConnection.CreateCommand;
    FRetrieveNoBuktiCommand_Cache.RequestType := 'GET';
    FRetrieveNoBuktiCommand_Cache.Text := 'TServerTransferAntarGudang.RetrieveNoBukti';
    FRetrieveNoBuktiCommand_Cache.Prepare(TServerTransferAntarGudang_RetrieveNoBukti_Cache);
  end;
  FRetrieveNoBuktiCommand_Cache.Parameters[0].Value.SetWideString(ANoBukti);
  FRetrieveNoBuktiCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTTransferAntarGudang.Create(FRetrieveNoBuktiCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerTransferAntarGudangClient.SaveTransferAntarGudang(ATransferAntarGudang: TTransferAntarGudang; const ARequestFilter: string): Boolean;
begin
  if FSaveTransferAntarGudangCommand = nil then
  begin
    FSaveTransferAntarGudangCommand := FConnection.CreateCommand;
    FSaveTransferAntarGudangCommand.RequestType := 'POST';
    FSaveTransferAntarGudangCommand.Text := 'TServerTransferAntarGudang."SaveTransferAntarGudang"';
    FSaveTransferAntarGudangCommand.Prepare(TServerTransferAntarGudang_SaveTransferAntarGudang);
  end;
  if not Assigned(ATransferAntarGudang) then
    FSaveTransferAntarGudangCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveTransferAntarGudangCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveTransferAntarGudangCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ATransferAntarGudang), True);
      if FInstanceOwner then
        ATransferAntarGudang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveTransferAntarGudangCommand.Execute(ARequestFilter);
  Result := FSaveTransferAntarGudangCommand.Parameters[1].Value.GetBoolean;
end;

function TServerTransferAntarGudangClient.GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string): string;
begin
  if FGenerateNoBuktiCommand = nil then
  begin
    FGenerateNoBuktiCommand := FConnection.CreateCommand;
    FGenerateNoBuktiCommand.RequestType := 'GET';
    FGenerateNoBuktiCommand.Text := 'TServerTransferAntarGudang.GenerateNoBukti';
    FGenerateNoBuktiCommand.Prepare(TServerTransferAntarGudang_GenerateNoBukti);
  end;
  FGenerateNoBuktiCommand.Parameters[0].Value.AsDateTime := ATglBukti;
  FGenerateNoBuktiCommand.Parameters[1].Value.SetWideString(APrefix);
  FGenerateNoBuktiCommand.Execute(ARequestFilter);
  Result := FGenerateNoBuktiCommand.Parameters[2].Value.GetWideString;
end;

function TServerTransferAntarGudangClient.Delete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FConnection.CreateCommand;
    FDeleteCommand.RequestType := 'POST';
    FDeleteCommand.Text := 'TServerTransferAntarGudang."Delete"';
    FDeleteCommand.Prepare(TServerTransferAntarGudang_Delete);
  end;
  if not Assigned(AAppObject) then
    FDeleteCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteCommand.Execute(ARequestFilter);
  Result := FDeleteCommand.Parameters[1].Value.GetBoolean;
end;

function TServerTransferAntarGudangClient.RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSCommand = nil then
  begin
    FRetrieveCDSCommand := FConnection.CreateCommand;
    FRetrieveCDSCommand.RequestType := 'POST';
    FRetrieveCDSCommand.Text := 'TServerTransferAntarGudang."RetrieveCDS"';
    FRetrieveCDSCommand.Prepare(TServerTransferAntarGudang_RetrieveCDS);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSCommand.FreeOnExecute(Result);
end;

function TServerTransferAntarGudangClient.RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSCommand_Cache = nil then
  begin
    FRetrieveCDSCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSCommand_Cache.RequestType := 'POST';
    FRetrieveCDSCommand_Cache.Text := 'TServerTransferAntarGudang."RetrieveCDS"';
    FRetrieveCDSCommand_Cache.Prepare(TServerTransferAntarGudang_RetrieveCDS_Cache);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerTransferAntarGudangClient.Save(AOBject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FSaveCommand = nil then
  begin
    FSaveCommand := FConnection.CreateCommand;
    FSaveCommand.RequestType := 'POST';
    FSaveCommand.Text := 'TServerTransferAntarGudang."Save"';
    FSaveCommand.Prepare(TServerTransferAntarGudang_Save);
  end;
  if not Assigned(AOBject) then
    FSaveCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AOBject), True);
      if FInstanceOwner then
        AOBject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveCommand.Execute(ARequestFilter);
  Result := FSaveCommand.Parameters[1].Value.GetBoolean;
end;

constructor TServerTransferAntarGudangClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerTransferAntarGudangClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerTransferAntarGudangClient.Destroy;
begin
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FRetrieveCDSlipCommand.DisposeOf;
  FRetrieveCDSlipCommand_Cache.DisposeOf;
  FRetrieveNoBuktiCommand.DisposeOf;
  FRetrieveNoBuktiCommand_Cache.DisposeOf;
  FSaveTransferAntarGudangCommand.DisposeOf;
  FGenerateNoBuktiCommand.DisposeOf;
  FDeleteCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

function TServerTAGRequestClient.Retrieve(AID: string; const ARequestFilter: string): TTAGRequest;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TServerTAGRequest.Retrieve';
    FRetrieveCommand.Prepare(TServerTAGRequest_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TTAGRequest(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerTAGRequestClient.Retrieve_Cache(AID: string; const ARequestFilter: string): IDSRestCachedTTAGRequest;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TServerTAGRequest.Retrieve';
    FRetrieveCommand_Cache.Prepare(TServerTAGRequest_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTTAGRequest.Create(FRetrieveCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerTAGRequestClient.RetrieveCDSSlip(ACabangID: string; AID: string; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSSlipCommand = nil then
  begin
    FRetrieveCDSSlipCommand := FConnection.CreateCommand;
    FRetrieveCDSSlipCommand.RequestType := 'GET';
    FRetrieveCDSSlipCommand.Text := 'TServerTAGRequest.RetrieveCDSSlip';
    FRetrieveCDSSlipCommand.Prepare(TServerTAGRequest_RetrieveCDSSlip);
  end;
  FRetrieveCDSSlipCommand.Parameters[0].Value.SetWideString(ACabangID);
  FRetrieveCDSSlipCommand.Parameters[1].Value.SetWideString(AID);
  FRetrieveCDSSlipCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSSlipCommand.Parameters[2].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSSlipCommand.FreeOnExecute(Result);
end;

function TServerTAGRequestClient.RetrieveCDSSlip_Cache(ACabangID: string; AID: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSSlipCommand_Cache = nil then
  begin
    FRetrieveCDSSlipCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSSlipCommand_Cache.RequestType := 'GET';
    FRetrieveCDSSlipCommand_Cache.Text := 'TServerTAGRequest.RetrieveCDSSlip';
    FRetrieveCDSSlipCommand_Cache.Prepare(TServerTAGRequest_RetrieveCDSSlip_Cache);
  end;
  FRetrieveCDSSlipCommand_Cache.Parameters[0].Value.SetWideString(ACabangID);
  FRetrieveCDSSlipCommand_Cache.Parameters[1].Value.SetWideString(AID);
  FRetrieveCDSSlipCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSSlipCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerTAGRequestClient.RetrieveNoBukti(ANoBukti: string; const ARequestFilter: string): TTAGRequest;
begin
  if FRetrieveNoBuktiCommand = nil then
  begin
    FRetrieveNoBuktiCommand := FConnection.CreateCommand;
    FRetrieveNoBuktiCommand.RequestType := 'GET';
    FRetrieveNoBuktiCommand.Text := 'TServerTAGRequest.RetrieveNoBukti';
    FRetrieveNoBuktiCommand.Prepare(TServerTAGRequest_RetrieveNoBukti);
  end;
  FRetrieveNoBuktiCommand.Parameters[0].Value.SetWideString(ANoBukti);
  FRetrieveNoBuktiCommand.Execute(ARequestFilter);
  if not FRetrieveNoBuktiCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveNoBuktiCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TTAGRequest(FUnMarshal.UnMarshal(FRetrieveNoBuktiCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveNoBuktiCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerTAGRequestClient.RetrieveNoBukti_Cache(ANoBukti: string; const ARequestFilter: string): IDSRestCachedTTAGRequest;
begin
  if FRetrieveNoBuktiCommand_Cache = nil then
  begin
    FRetrieveNoBuktiCommand_Cache := FConnection.CreateCommand;
    FRetrieveNoBuktiCommand_Cache.RequestType := 'GET';
    FRetrieveNoBuktiCommand_Cache.Text := 'TServerTAGRequest.RetrieveNoBukti';
    FRetrieveNoBuktiCommand_Cache.Prepare(TServerTAGRequest_RetrieveNoBukti_Cache);
  end;
  FRetrieveNoBuktiCommand_Cache.Parameters[0].Value.SetWideString(ANoBukti);
  FRetrieveNoBuktiCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTTAGRequest.Create(FRetrieveNoBuktiCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerTAGRequestClient.GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string): string;
begin
  if FGenerateNoBuktiCommand = nil then
  begin
    FGenerateNoBuktiCommand := FConnection.CreateCommand;
    FGenerateNoBuktiCommand.RequestType := 'GET';
    FGenerateNoBuktiCommand.Text := 'TServerTAGRequest.GenerateNoBukti';
    FGenerateNoBuktiCommand.Prepare(TServerTAGRequest_GenerateNoBukti);
  end;
  FGenerateNoBuktiCommand.Parameters[0].Value.AsDateTime := ATglBukti;
  FGenerateNoBuktiCommand.Parameters[1].Value.SetWideString(APrefix);
  FGenerateNoBuktiCommand.Execute(ARequestFilter);
  Result := FGenerateNoBuktiCommand.Parameters[2].Value.GetWideString;
end;

function TServerTAGRequestClient.Delete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FConnection.CreateCommand;
    FDeleteCommand.RequestType := 'POST';
    FDeleteCommand.Text := 'TServerTAGRequest."Delete"';
    FDeleteCommand.Prepare(TServerTAGRequest_Delete);
  end;
  if not Assigned(AAppObject) then
    FDeleteCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteCommand.Execute(ARequestFilter);
  Result := FDeleteCommand.Parameters[1].Value.GetBoolean;
end;

function TServerTAGRequestClient.RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSCommand = nil then
  begin
    FRetrieveCDSCommand := FConnection.CreateCommand;
    FRetrieveCDSCommand.RequestType := 'POST';
    FRetrieveCDSCommand.Text := 'TServerTAGRequest."RetrieveCDS"';
    FRetrieveCDSCommand.Prepare(TServerTAGRequest_RetrieveCDS);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSCommand.FreeOnExecute(Result);
end;

function TServerTAGRequestClient.RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSCommand_Cache = nil then
  begin
    FRetrieveCDSCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSCommand_Cache.RequestType := 'POST';
    FRetrieveCDSCommand_Cache.Text := 'TServerTAGRequest."RetrieveCDS"';
    FRetrieveCDSCommand_Cache.Prepare(TServerTAGRequest_RetrieveCDS_Cache);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerTAGRequestClient.Save(AOBject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FSaveCommand = nil then
  begin
    FSaveCommand := FConnection.CreateCommand;
    FSaveCommand.RequestType := 'POST';
    FSaveCommand.Text := 'TServerTAGRequest."Save"';
    FSaveCommand.Prepare(TServerTAGRequest_Save);
  end;
  if not Assigned(AOBject) then
    FSaveCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AOBject), True);
      if FInstanceOwner then
        AOBject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveCommand.Execute(ARequestFilter);
  Result := FSaveCommand.Parameters[1].Value.GetBoolean;
end;

constructor TServerTAGRequestClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerTAGRequestClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerTAGRequestClient.Destroy;
begin
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FRetrieveCDSSlipCommand.DisposeOf;
  FRetrieveCDSSlipCommand_Cache.DisposeOf;
  FRetrieveNoBuktiCommand.DisposeOf;
  FRetrieveNoBuktiCommand_Cache.DisposeOf;
  FGenerateNoBuktiCommand.DisposeOf;
  FDeleteCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

function TServerTransferAntarCabangKirimClient.Retrieve(AID: string; const ARequestFilter: string): TTransferAntarCabangKirim;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TServerTransferAntarCabangKirim.Retrieve';
    FRetrieveCommand.Prepare(TServerTransferAntarCabangKirim_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TTransferAntarCabangKirim(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerTransferAntarCabangKirimClient.Retrieve_Cache(AID: string; const ARequestFilter: string): IDSRestCachedTTransferAntarCabangKirim;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TServerTransferAntarCabangKirim.Retrieve';
    FRetrieveCommand_Cache.Prepare(TServerTransferAntarCabangKirim_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTTransferAntarCabangKirim.Create(FRetrieveCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerTransferAntarCabangKirimClient.RetrieveNoBukti(ANoBukti: string; const ARequestFilter: string): TTransferAntarCabangKirim;
begin
  if FRetrieveNoBuktiCommand = nil then
  begin
    FRetrieveNoBuktiCommand := FConnection.CreateCommand;
    FRetrieveNoBuktiCommand.RequestType := 'GET';
    FRetrieveNoBuktiCommand.Text := 'TServerTransferAntarCabangKirim.RetrieveNoBukti';
    FRetrieveNoBuktiCommand.Prepare(TServerTransferAntarCabangKirim_RetrieveNoBukti);
  end;
  FRetrieveNoBuktiCommand.Parameters[0].Value.SetWideString(ANoBukti);
  FRetrieveNoBuktiCommand.Execute(ARequestFilter);
  if not FRetrieveNoBuktiCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveNoBuktiCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TTransferAntarCabangKirim(FUnMarshal.UnMarshal(FRetrieveNoBuktiCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveNoBuktiCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerTransferAntarCabangKirimClient.RetrieveNoBukti_Cache(ANoBukti: string; const ARequestFilter: string): IDSRestCachedTTransferAntarCabangKirim;
begin
  if FRetrieveNoBuktiCommand_Cache = nil then
  begin
    FRetrieveNoBuktiCommand_Cache := FConnection.CreateCommand;
    FRetrieveNoBuktiCommand_Cache.RequestType := 'GET';
    FRetrieveNoBuktiCommand_Cache.Text := 'TServerTransferAntarCabangKirim.RetrieveNoBukti';
    FRetrieveNoBuktiCommand_Cache.Prepare(TServerTransferAntarCabangKirim_RetrieveNoBukti_Cache);
  end;
  FRetrieveNoBuktiCommand_Cache.Parameters[0].Value.SetWideString(ANoBukti);
  FRetrieveNoBuktiCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTTransferAntarCabangKirim.Create(FRetrieveNoBuktiCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerTransferAntarCabangKirimClient.GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string): string;
begin
  if FGenerateNoBuktiCommand = nil then
  begin
    FGenerateNoBuktiCommand := FConnection.CreateCommand;
    FGenerateNoBuktiCommand.RequestType := 'GET';
    FGenerateNoBuktiCommand.Text := 'TServerTransferAntarCabangKirim.GenerateNoBukti';
    FGenerateNoBuktiCommand.Prepare(TServerTransferAntarCabangKirim_GenerateNoBukti);
  end;
  FGenerateNoBuktiCommand.Parameters[0].Value.AsDateTime := ATglBukti;
  FGenerateNoBuktiCommand.Parameters[1].Value.SetWideString(APrefix);
  FGenerateNoBuktiCommand.Execute(ARequestFilter);
  Result := FGenerateNoBuktiCommand.Parameters[2].Value.GetWideString;
end;

function TServerTransferAntarCabangKirimClient.Delete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FConnection.CreateCommand;
    FDeleteCommand.RequestType := 'POST';
    FDeleteCommand.Text := 'TServerTransferAntarCabangKirim."Delete"';
    FDeleteCommand.Prepare(TServerTransferAntarCabangKirim_Delete);
  end;
  if not Assigned(AAppObject) then
    FDeleteCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteCommand.Execute(ARequestFilter);
  Result := FDeleteCommand.Parameters[1].Value.GetBoolean;
end;

function TServerTransferAntarCabangKirimClient.RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSCommand = nil then
  begin
    FRetrieveCDSCommand := FConnection.CreateCommand;
    FRetrieveCDSCommand.RequestType := 'POST';
    FRetrieveCDSCommand.Text := 'TServerTransferAntarCabangKirim."RetrieveCDS"';
    FRetrieveCDSCommand.Prepare(TServerTransferAntarCabangKirim_RetrieveCDS);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSCommand.FreeOnExecute(Result);
end;

function TServerTransferAntarCabangKirimClient.RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSCommand_Cache = nil then
  begin
    FRetrieveCDSCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSCommand_Cache.RequestType := 'POST';
    FRetrieveCDSCommand_Cache.Text := 'TServerTransferAntarCabangKirim."RetrieveCDS"';
    FRetrieveCDSCommand_Cache.Prepare(TServerTransferAntarCabangKirim_RetrieveCDS_Cache);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerTransferAntarCabangKirimClient.Save(AOBject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FSaveCommand = nil then
  begin
    FSaveCommand := FConnection.CreateCommand;
    FSaveCommand.RequestType := 'POST';
    FSaveCommand.Text := 'TServerTransferAntarCabangKirim."Save"';
    FSaveCommand.Prepare(TServerTransferAntarCabangKirim_Save);
  end;
  if not Assigned(AOBject) then
    FSaveCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AOBject), True);
      if FInstanceOwner then
        AOBject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveCommand.Execute(ARequestFilter);
  Result := FSaveCommand.Parameters[1].Value.GetBoolean;
end;

constructor TServerTransferAntarCabangKirimClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerTransferAntarCabangKirimClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerTransferAntarCabangKirimClient.Destroy;
begin
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FRetrieveNoBuktiCommand.DisposeOf;
  FRetrieveNoBuktiCommand_Cache.DisposeOf;
  FGenerateNoBuktiCommand.DisposeOf;
  FDeleteCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

function TServerTransferAntarCabangTerimaClient.Retrieve(AID: string; const ARequestFilter: string): TTransferAntarCabangTerima;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TServerTransferAntarCabangTerima.Retrieve';
    FRetrieveCommand.Prepare(TServerTransferAntarCabangTerima_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TTransferAntarCabangTerima(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerTransferAntarCabangTerimaClient.Retrieve_Cache(AID: string; const ARequestFilter: string): IDSRestCachedTTransferAntarCabangTerima;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TServerTransferAntarCabangTerima.Retrieve';
    FRetrieveCommand_Cache.Prepare(TServerTransferAntarCabangTerima_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTTransferAntarCabangTerima.Create(FRetrieveCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerTransferAntarCabangTerimaClient.RetrieveNoBukti(ANoBukti: string; const ARequestFilter: string): TTransferAntarCabangTerima;
begin
  if FRetrieveNoBuktiCommand = nil then
  begin
    FRetrieveNoBuktiCommand := FConnection.CreateCommand;
    FRetrieveNoBuktiCommand.RequestType := 'GET';
    FRetrieveNoBuktiCommand.Text := 'TServerTransferAntarCabangTerima.RetrieveNoBukti';
    FRetrieveNoBuktiCommand.Prepare(TServerTransferAntarCabangTerima_RetrieveNoBukti);
  end;
  FRetrieveNoBuktiCommand.Parameters[0].Value.SetWideString(ANoBukti);
  FRetrieveNoBuktiCommand.Execute(ARequestFilter);
  if not FRetrieveNoBuktiCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveNoBuktiCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TTransferAntarCabangTerima(FUnMarshal.UnMarshal(FRetrieveNoBuktiCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveNoBuktiCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerTransferAntarCabangTerimaClient.RetrieveNoBukti_Cache(ANoBukti: string; const ARequestFilter: string): IDSRestCachedTTransferAntarCabangTerima;
begin
  if FRetrieveNoBuktiCommand_Cache = nil then
  begin
    FRetrieveNoBuktiCommand_Cache := FConnection.CreateCommand;
    FRetrieveNoBuktiCommand_Cache.RequestType := 'GET';
    FRetrieveNoBuktiCommand_Cache.Text := 'TServerTransferAntarCabangTerima.RetrieveNoBukti';
    FRetrieveNoBuktiCommand_Cache.Prepare(TServerTransferAntarCabangTerima_RetrieveNoBukti_Cache);
  end;
  FRetrieveNoBuktiCommand_Cache.Parameters[0].Value.SetWideString(ANoBukti);
  FRetrieveNoBuktiCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTTransferAntarCabangTerima.Create(FRetrieveNoBuktiCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerTransferAntarCabangTerimaClient.GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string): string;
begin
  if FGenerateNoBuktiCommand = nil then
  begin
    FGenerateNoBuktiCommand := FConnection.CreateCommand;
    FGenerateNoBuktiCommand.RequestType := 'GET';
    FGenerateNoBuktiCommand.Text := 'TServerTransferAntarCabangTerima.GenerateNoBukti';
    FGenerateNoBuktiCommand.Prepare(TServerTransferAntarCabangTerima_GenerateNoBukti);
  end;
  FGenerateNoBuktiCommand.Parameters[0].Value.AsDateTime := ATglBukti;
  FGenerateNoBuktiCommand.Parameters[1].Value.SetWideString(APrefix);
  FGenerateNoBuktiCommand.Execute(ARequestFilter);
  Result := FGenerateNoBuktiCommand.Parameters[2].Value.GetWideString;
end;

function TServerTransferAntarCabangTerimaClient.Delete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FConnection.CreateCommand;
    FDeleteCommand.RequestType := 'POST';
    FDeleteCommand.Text := 'TServerTransferAntarCabangTerima."Delete"';
    FDeleteCommand.Prepare(TServerTransferAntarCabangTerima_Delete);
  end;
  if not Assigned(AAppObject) then
    FDeleteCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteCommand.Execute(ARequestFilter);
  Result := FDeleteCommand.Parameters[1].Value.GetBoolean;
end;

function TServerTransferAntarCabangTerimaClient.RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSCommand = nil then
  begin
    FRetrieveCDSCommand := FConnection.CreateCommand;
    FRetrieveCDSCommand.RequestType := 'POST';
    FRetrieveCDSCommand.Text := 'TServerTransferAntarCabangTerima."RetrieveCDS"';
    FRetrieveCDSCommand.Prepare(TServerTransferAntarCabangTerima_RetrieveCDS);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveCDSCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveCDSCommand.FreeOnExecute(Result);
end;

function TServerTransferAntarCabangTerimaClient.RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSCommand_Cache = nil then
  begin
    FRetrieveCDSCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSCommand_Cache.RequestType := 'POST';
    FRetrieveCDSCommand_Cache.Text := 'TServerTransferAntarCabangTerima."RetrieveCDS"';
    FRetrieveCDSCommand_Cache.Prepare(TServerTransferAntarCabangTerima_RetrieveCDS_Cache);
  end;
  if not Assigned(AAppObject) then
    FRetrieveCDSCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrieveCDSCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrieveCDSCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrieveCDSCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveCDSCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerTransferAntarCabangTerimaClient.Save(AOBject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FSaveCommand = nil then
  begin
    FSaveCommand := FConnection.CreateCommand;
    FSaveCommand.RequestType := 'POST';
    FSaveCommand.Text := 'TServerTransferAntarCabangTerima."Save"';
    FSaveCommand.Prepare(TServerTransferAntarCabangTerima_Save);
  end;
  if not Assigned(AOBject) then
    FSaveCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AOBject), True);
      if FInstanceOwner then
        AOBject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveCommand.Execute(ARequestFilter);
  Result := FSaveCommand.Parameters[1].Value.GetBoolean;
end;

constructor TServerTransferAntarCabangTerimaClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerTransferAntarCabangTerimaClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerTransferAntarCabangTerimaClient.Destroy;
begin
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FRetrieveNoBuktiCommand.DisposeOf;
  FRetrieveNoBuktiCommand_Cache.DisposeOf;
  FGenerateNoBuktiCommand.DisposeOf;
  FDeleteCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

end.

