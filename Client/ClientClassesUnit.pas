//
// Created by the DataSnap proxy generator.
// 2/4/2018 1:17:20 PM
//

unit ClientClassesUnit;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, uModel, Data.FireDACJSONReflect, uSupplier, uCustomerInvoice, uPenerimaanBarang, uReturSupplier, uPenjualan, uAR, uAccount, uRekBank, uPenerimaanKas, uPengeluaranKas, uSettingApp, uTransferAntarGudang, uTAGRequests, uTransferAntarCabang, uJurnal, uSettlementARAP, uUser, uPenarikanDeposit, Data.DBXJSONReflect;

type

  IDSRestCachedTMenu = interface;
  IDSRestCachedTGudang = interface;
  IDSRestCachedTSettlementARAP = interface;
  IDSRestCachedTGroupBarang = interface;
  IDSRestCachedTPenerimaanBarang = interface;
  IDSRestCachedTRekBank = interface;
  IDSRestCachedTLogAppObject = interface;
  IDSRestCachedTSettingApp = interface;
  IDSRestCachedTPembayaranSupplier = interface;
  IDSRestCachedTBarang = interface;
  IDSRestCachedTPenjualan = interface;
  IDSRestCachedTTransferAntarCabangKirim = interface;
  IDSRestCachedTTransferAntarCabangTerima = interface;
  IDSRestCachedTReturSupplier = interface;
  IDSRestCachedTPenerimaanKas = interface;
  IDSRestCachedTCustomerInvoice = interface;
  IDSRestCachedTCabang = interface;
  IDSRestCachedTAR = interface;
  IDSRestCachedTJurnal = interface;
  IDSRestCachedTPenarikanDeposit = interface;
  IDSRestCachedTTransferAntarGudang = interface;
  IDSRestCachedTStockSekarang = interface;
  IDSRestCachedTAP = interface;
  IDSRestCachedTUOM = interface;
  IDSRestCachedTAccount = interface;
  IDSRestCachedTTAGRequest = interface;
  IDSRestCachedTSupplier = interface;
  IDSRestCachedTFDJSONDataSets = interface;
  IDSRestCachedTPengeluaranKas = interface;
  IDSRestCachedTUser = interface;

  TServerLaporanClient = class(TDSAdminRestClient)
  private
    FDS_OverviewAccountCommand: TDSRestCommand;
    FDS_OverviewAccountCommand_Cache: TDSRestCommand;
    FLaporanKartokCommand: TDSRestCommand;
    FLaporanKartokCommand_Cache: TDSRestCommand;
    FLaporanKarAPCommand: TDSRestCommand;
    FLaporanKarAPCommand_Cache: TDSRestCommand;
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
    FRetrivePengeluaranKasCommand: TDSRestCommand;
    FRetrivePengeluaranKasCommand_Cache: TDSRestCommand;
    FRetriveJurnalCommand: TDSRestCommand;
    FRetriveJurnalCommand_Cache: TDSRestCommand;
    FLaporanPenerimaanBarangCommand: TDSRestCommand;
    FLaporanPenerimaanBarangCommand_Cache: TDSRestCommand;
    FLaporanAPCommand: TDSRestCommand;
    FLaporanAPCommand_Cache: TDSRestCommand;
    FLaporanARCommand: TDSRestCommand;
    FLaporanARCommand_Cache: TDSRestCommand;
    FLaporanReturSupplierCommand: TDSRestCommand;
    FLaporanReturSupplierCommand_Cache: TDSRestCommand;
    FLaporanKarARCommand: TDSRestCommand;
    FLaporanKarARCommand_Cache: TDSRestCommand;
    FLaporanNeracaSaldoCommand: TDSRestCommand;
    FLaporanNeracaSaldoCommand_Cache: TDSRestCommand;
    FLaporanPenjualanByPembeliCommand: TDSRestCommand;
    FLaporanPenjualanByPembeliCommand_Cache: TDSRestCommand;
    FRetrivePenarikanDepositCommand: TDSRestCommand;
    FRetrivePenarikanDepositCommand_Cache: TDSRestCommand;
    FRetriveSettingAppCommand: TDSRestCommand;
    FRetriveSettingAppCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function DS_OverviewAccount(const ARequestFilter: string = ''): TDataSet;
    function DS_OverviewAccount_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function LaporanKartok(ATglAwal: TDateTime; ATglAkhir: TDateTime; ABarang: TBarang; AGudang: TGudang; const ARequestFilter: string = ''): TFDJSONDataSets;
    function LaporanKartok_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; ABarang: TBarang; AGudang: TGudang; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function LaporanKarAP(ATglAwal: TDateTime; ATglAkhir: TDateTime; ASupplier: TSupplier; ACabang: TCabang; ANoAP: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function LaporanKarAP_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; ASupplier: TSupplier; ACabang: TCabang; ANoAP: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
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
    function RetriveMutasiBarang(ATglAwal: TDateTime; ATglAkhir: TDateTime; ACabang: TCabang; AGudang: TGudang; const ARequestFilter: string = ''): TDataSet;
    function RetriveMutasiBarang_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; ACabang: TCabang; AGudang: TGudang; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrivePenjualan(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string = ''): TDataSet;
    function RetrivePenjualan_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetriveCI(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string = ''): TDataSet;
    function RetriveCI_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrivePenerimaanKas(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string = ''): TDataSet;
    function RetrivePenerimaanKas_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetriveAR(ASupplier: TSupplier; const ARequestFilter: string = ''): TDataSet;
    function RetriveAR_Cache(ASupplier: TSupplier; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrivePengeluaranKas(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string = ''): TDataSet;
    function RetrivePengeluaranKas_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetriveJurnal(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; AJenisJurnal: string; const ARequestFilter: string = ''): TDataSet;
    function RetriveJurnal_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; AJenisJurnal: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function LaporanPenerimaanBarang(ATglAwal: TDateTime; AtglAkhir: TDateTime; ACabang: TCabang; AGudang: TGudang; const ARequestFilter: string = ''): TDataSet;
    function LaporanPenerimaanBarang_Cache(ATglAwal: TDateTime; AtglAkhir: TDateTime; ACabang: TCabang; AGudang: TGudang; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function LaporanAP(ATglAwal: TDateTime; AtglAkhir: TDateTime; ACabang: TCabang; AIsTglJatuhTempo: Boolean; const ARequestFilter: string = ''): TFDJSONDataSets;
    function LaporanAP_Cache(ATglAwal: TDateTime; AtglAkhir: TDateTime; ACabang: TCabang; AIsTglJatuhTempo: Boolean; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function LaporanAR(ATglAwal: TDateTime; AtglAkhir: TDateTime; ACabang: TCabang; AIsTglJatuhTempo: Boolean; const ARequestFilter: string = ''): TFDJSONDataSets;
    function LaporanAR_Cache(ATglAwal: TDateTime; AtglAkhir: TDateTime; ACabang: TCabang; AIsTglJatuhTempo: Boolean; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function LaporanReturSupplier(ATglAwal: TDateTime; AtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string = ''): TFDJSONDataSets;
    function LaporanReturSupplier_Cache(ATglAwal: TDateTime; AtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function LaporanKarAR(ATglAwal: TDateTime; ATglAkhir: TDateTime; ACustomer: TSupplier; ACabang: TCabang; ANoAR: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function LaporanKarAR_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; ACustomer: TSupplier; ACabang: TCabang; ANoAR: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function LaporanNeracaSaldo(ATglAwal: TDateTime; AtglAkhir: TDateTime; AIsKonsolidasi: Integer; ACabang: TCabang; const ARequestFilter: string = ''): TFDJSONDataSets;
    function LaporanNeracaSaldo_Cache(ATglAwal: TDateTime; AtglAkhir: TDateTime; AIsKonsolidasi: Integer; ACabang: TCabang; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function LaporanPenjualanByPembeli(ATglAwal: TDateTime; AtglAkhir: TDateTime; AIsKonsolidasi: Integer; ACabang: TCabang; const ARequestFilter: string = ''): TFDJSONDataSets;
    function LaporanPenjualanByPembeli_Cache(ATglAwal: TDateTime; AtglAkhir: TDateTime; AIsKonsolidasi: Integer; ACabang: TCabang; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function RetrivePenarikanDeposit(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string = ''): TDataSet;
    function RetrivePenarikanDeposit_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string = ''): IDSRestCachedDataSet;
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
    FDeleteNoCommitCommand: TDSRestCommand;
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
    function DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
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
    FDoJournalCommand: TDSRestCommand;
    FGenerateNoBuktiCommand: TDSRestCommand;
    FRetrieveDataCommand: TDSRestCommand;
    FRetrieveDataCommand_Cache: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand_Cache: TDSRestCommand;
    FRetrieveDataSlipCommand: TDSRestCommand;
    FRetrieveDataSlipCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FDeleteNoCommitCommand: TDSRestCommand;
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
    function DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string = ''): Boolean;
    function GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string = ''): string;
    function RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): TDataSet;
    function RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): TDataSet;
    function RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
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
    FDeleteNoCommitCommand: TDSRestCommand;
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
    function DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerGroupBarangClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FDeleteNoCommitCommand: TDSRestCommand;
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
    function DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerPenerimaanBarangClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FRetrievePenerimaanCommand: TDSRestCommand;
    FRetrievePenerimaanCommand_Cache: TDSRestCommand;
    FRetrieveCDSlipCommand: TDSRestCommand;
    FRetrieveCDSlipCommand_Cache: TDSRestCommand;
    FRetrieveNoBuktiCommand: TDSRestCommand;
    FRetrieveNoBuktiCommand_Cache: TDSRestCommand;
    FDoJournalCommand: TDSRestCommand;
    FGenerateNoBuktiCommand: TDSRestCommand;
    FRetrieveDataCommand: TDSRestCommand;
    FRetrieveDataCommand_Cache: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand_Cache: TDSRestCommand;
    FRetrieveDataSlipCommand: TDSRestCommand;
    FRetrieveDataSlipCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FDeleteNoCommitCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TPenerimaanBarang;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTPenerimaanBarang;
    function RetrievePenerimaan(APeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): TDataSet;
    function RetrievePenerimaan_Cache(APeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveCDSlip(AID: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function RetrieveCDSlip_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function RetrieveNoBukti(ANoBukti: string; const ARequestFilter: string = ''): TPenerimaanBarang;
    function RetrieveNoBukti_Cache(ANoBukti: string; const ARequestFilter: string = ''): IDSRestCachedTPenerimaanBarang;
    function DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string = ''): Boolean;
    function GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string = ''): string;
    function RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): TDataSet;
    function RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): TDataSet;
    function RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerCabangClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FDeleteNoCommitCommand: TDSRestCommand;
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
    function DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerLogAppObjectClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FDeleteNoCommitCommand: TDSRestCommand;
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
    function DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
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
    FDeleteNoCommitCommand: TDSRestCommand;
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
    function DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
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
    FDoJournalCommand: TDSRestCommand;
    FGenerateNoBuktiCommand: TDSRestCommand;
    FRetrieveDataCommand: TDSRestCommand;
    FRetrieveDataCommand_Cache: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand_Cache: TDSRestCommand;
    FRetrieveDataSlipCommand: TDSRestCommand;
    FRetrieveDataSlipCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FDeleteNoCommitCommand: TDSRestCommand;
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
    function DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string = ''): Boolean;
    function GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string = ''): string;
    function RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): TDataSet;
    function RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): TDataSet;
    function RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerClosingInventoryClient = class(TDSAdminRestClient)
  private
    FCloseCommand: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FDeleteNoCommitCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Close(APeriode: Integer; ACabang: TCabang; const ARequestFilter: string = ''): Boolean;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
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
    FDeleteNoCommitCommand: TDSRestCommand;
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
    function DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
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
    FDeleteNoCommitCommand: TDSRestCommand;
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
    function DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerPenjualanClient = class(TDSAdminRestClient)
  private
    FGetSaldoDepositCommand: TDSRestCommand;
    FGetPenjualanPeriodeCommand: TDSRestCommand;
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FRetrieveNoBuktiCommand: TDSRestCommand;
    FRetrieveNoBuktiCommand_Cache: TDSRestCommand;
    FRetrieveCDSlipCommand: TDSRestCommand;
    FRetrieveCDSlipCommand_Cache: TDSRestCommand;
    FSaveToDBDibayarCommand: TDSRestCommand;
    FDoJournalCommand: TDSRestCommand;
    FGenerateNoBuktiCommand: TDSRestCommand;
    FRetrieveDataCommand: TDSRestCommand;
    FRetrieveDataCommand_Cache: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand_Cache: TDSRestCommand;
    FRetrieveDataSlipCommand: TDSRestCommand;
    FRetrieveDataSlipCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FDeleteNoCommitCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetSaldoDeposit(ASupplier: TSupplier; AExcludeNo: string; const ARequestFilter: string = ''): Double;
    function GetPenjualanPeriode(ASupplier: TSupplier; ATglAwal: TDateTime; ATglAkhir: TDateTime; AExcludeNo: string; const ARequestFilter: string = ''): Double;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TPenjualan;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTPenjualan;
    function RetrieveNoBukti(ANoBukti: string; const ARequestFilter: string = ''): TPenjualan;
    function RetrieveNoBukti_Cache(ANoBukti: string; const ARequestFilter: string = ''): IDSRestCachedTPenjualan;
    function RetrieveCDSlip(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; ANoBukti: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function RetrieveCDSlip_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; ANoBukti: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function SaveToDBDibayar(APenjualan: TPenjualan; ADibayar: Double; const ARequestFilter: string = ''): Boolean;
    function DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string = ''): Boolean;
    function GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string = ''): string;
    function RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): TDataSet;
    function RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): TDataSet;
    function RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
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
    FRetrieveTransaksiCommand: TDSRestCommand;
    FRetrieveTransaksiCommand_Cache: TDSRestCommand;
    FDoJournalCommand: TDSRestCommand;
    FGenerateNoBuktiCommand: TDSRestCommand;
    FRetrieveDataCommand: TDSRestCommand;
    FRetrieveDataCommand_Cache: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand_Cache: TDSRestCommand;
    FRetrieveDataSlipCommand: TDSRestCommand;
    FRetrieveDataSlipCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FDeleteNoCommitCommand: TDSRestCommand;
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
    function RetrieveTransaksi(ATransaksi: string; AIDTransaksi: string; const ARequestFilter: string = ''): TAR;
    function RetrieveTransaksi_Cache(ATransaksi: string; AIDTransaksi: string; const ARequestFilter: string = ''): IDSRestCachedTAR;
    function DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string = ''): Boolean;
    function GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string = ''): string;
    function RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): TDataSet;
    function RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): TDataSet;
    function RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerAPClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FRetrieveTransaksiCommand: TDSRestCommand;
    FRetrieveTransaksiCommand_Cache: TDSRestCommand;
    FDoJournalCommand: TDSRestCommand;
    FGenerateNoBuktiCommand: TDSRestCommand;
    FRetrieveDataCommand: TDSRestCommand;
    FRetrieveDataCommand_Cache: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand_Cache: TDSRestCommand;
    FRetrieveDataSlipCommand: TDSRestCommand;
    FRetrieveDataSlipCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FDeleteNoCommitCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TAP;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTAP;
    function RetrieveTransaksi(ATransaksi: string; AIDTransaksi: string; const ARequestFilter: string = ''): TAP;
    function RetrieveTransaksi_Cache(ATransaksi: string; AIDTransaksi: string; const ARequestFilter: string = ''): IDSRestCachedTAP;
    function DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string = ''): Boolean;
    function GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string = ''): string;
    function RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): TDataSet;
    function RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): TDataSet;
    function RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerAccountClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FDeleteNoCommitCommand: TDSRestCommand;
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
    function DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerRekBankClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FRetrieveRekCommand: TDSRestCommand;
    FRetrieveRekCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FDeleteNoCommitCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TRekBank;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTRekBank;
    function RetrieveRek(ANorek: string; const ARequestFilter: string = ''): TRekBank;
    function RetrieveRek_Cache(ANorek: string; const ARequestFilter: string = ''): IDSRestCachedTRekBank;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerPenerimaanKasClient = class(TDSAdminRestClient)
  private
    FAfterSaveCommand: TDSRestCommand;
    FBeforeDeleteCommand: TDSRestCommand;
    FBeforeSaveCommand: TDSRestCommand;
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FRetrievePenerimaanARsCommand: TDSRestCommand;
    FRetrievePenerimaanARsCommand_Cache: TDSRestCommand;
    FRetrieveCDSlipCommand: TDSRestCommand;
    FRetrieveCDSlipCommand_Cache: TDSRestCommand;
    FRetrieveNoBuktiCommand: TDSRestCommand;
    FRetrieveNoBuktiCommand_Cache: TDSRestCommand;
    FDoJournalCommand: TDSRestCommand;
    FGenerateNoBuktiCommand: TDSRestCommand;
    FRetrieveDataCommand: TDSRestCommand;
    FRetrieveDataCommand_Cache: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand_Cache: TDSRestCommand;
    FRetrieveDataSlipCommand: TDSRestCommand;
    FRetrieveDataSlipCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FDeleteNoCommitCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function AfterSave(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function BeforeDelete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function BeforeSave(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TPenerimaanKas;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTPenerimaanKas;
    function RetrievePenerimaanARs(AID: string; const ARequestFilter: string = ''): TDataSet;
    function RetrievePenerimaanARs_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveCDSlip(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; ANoBukti: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function RetrieveCDSlip_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; ANoBukti: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function RetrieveNoBukti(ANoBukti: string; const ARequestFilter: string = ''): TPenerimaanKas;
    function RetrieveNoBukti_Cache(ANoBukti: string; const ARequestFilter: string = ''): IDSRestCachedTPenerimaanKas;
    function DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string = ''): Boolean;
    function GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string = ''): string;
    function RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): TDataSet;
    function RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): TDataSet;
    function RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerPengeluaranKasClient = class(TDSAdminRestClient)
  private
    FAfterSaveCommand: TDSRestCommand;
    FBeforeDeleteCommand: TDSRestCommand;
    FBeforeSaveCommand: TDSRestCommand;
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FRetrievePenerimaanAPsCommand: TDSRestCommand;
    FRetrievePenerimaanAPsCommand_Cache: TDSRestCommand;
    FRetrieveCDSlipCommand: TDSRestCommand;
    FRetrieveCDSlipCommand_Cache: TDSRestCommand;
    FRetrieveNoBuktiCommand: TDSRestCommand;
    FRetrieveNoBuktiCommand_Cache: TDSRestCommand;
    FDoJournalCommand: TDSRestCommand;
    FGenerateNoBuktiCommand: TDSRestCommand;
    FRetrieveDataCommand: TDSRestCommand;
    FRetrieveDataCommand_Cache: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand_Cache: TDSRestCommand;
    FRetrieveDataSlipCommand: TDSRestCommand;
    FRetrieveDataSlipCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FDeleteNoCommitCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function AfterSave(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function BeforeDelete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function BeforeSave(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TPengeluaranKas;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTPengeluaranKas;
    function RetrievePenerimaanAPs(AID: string; const ARequestFilter: string = ''): TDataSet;
    function RetrievePenerimaanAPs_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveCDSlip(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; ANoBukti: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function RetrieveCDSlip_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; ANoBukti: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function RetrieveNoBukti(ANoBukti: string; const ARequestFilter: string = ''): TPengeluaranKas;
    function RetrieveNoBukti_Cache(ANoBukti: string; const ARequestFilter: string = ''): IDSRestCachedTPengeluaranKas;
    function DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string = ''): Boolean;
    function GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string = ''): string;
    function RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): TDataSet;
    function RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): TDataSet;
    function RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
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
    FDeleteNoCommitCommand: TDSRestCommand;
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
    function DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
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
    FDoJournalCommand: TDSRestCommand;
    FGenerateNoBuktiCommand: TDSRestCommand;
    FRetrieveDataCommand: TDSRestCommand;
    FRetrieveDataCommand_Cache: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand_Cache: TDSRestCommand;
    FRetrieveDataSlipCommand: TDSRestCommand;
    FRetrieveDataSlipCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FDeleteNoCommitCommand: TDSRestCommand;
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
    function DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string = ''): Boolean;
    function GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string = ''): string;
    function RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): TDataSet;
    function RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): TDataSet;
    function RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
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
    FDoJournalCommand: TDSRestCommand;
    FGenerateNoBuktiCommand: TDSRestCommand;
    FRetrieveDataCommand: TDSRestCommand;
    FRetrieveDataCommand_Cache: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand_Cache: TDSRestCommand;
    FRetrieveDataSlipCommand: TDSRestCommand;
    FRetrieveDataSlipCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FDeleteNoCommitCommand: TDSRestCommand;
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
    function DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string = ''): Boolean;
    function GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string = ''): string;
    function RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): TDataSet;
    function RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): TDataSet;
    function RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
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
    FDoJournalCommand: TDSRestCommand;
    FGenerateNoBuktiCommand: TDSRestCommand;
    FRetrieveDataCommand: TDSRestCommand;
    FRetrieveDataCommand_Cache: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand_Cache: TDSRestCommand;
    FRetrieveDataSlipCommand: TDSRestCommand;
    FRetrieveDataSlipCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FDeleteNoCommitCommand: TDSRestCommand;
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
    function DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string = ''): Boolean;
    function GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string = ''): string;
    function RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): TDataSet;
    function RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): TDataSet;
    function RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
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
    FDoJournalCommand: TDSRestCommand;
    FGenerateNoBuktiCommand: TDSRestCommand;
    FRetrieveDataCommand: TDSRestCommand;
    FRetrieveDataCommand_Cache: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand_Cache: TDSRestCommand;
    FRetrieveDataSlipCommand: TDSRestCommand;
    FRetrieveDataSlipCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FDeleteNoCommitCommand: TDSRestCommand;
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
    function DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string = ''): Boolean;
    function GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string = ''): string;
    function RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): TDataSet;
    function RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): TDataSet;
    function RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TDSDataClient = class(TDSAdminRestClient)
  private
    FDS_CabangLookUpCommand: TDSRestCommand;
    FDS_CabangLookUpCommand_Cache: TDSRestCommand;
    FDS_GudangLookUpCommand: TDSRestCommand;
    FDS_GudangLookUpCommand_Cache: TDSRestCommand;
    FGetNamakuCommand: TDSRestCommand;
    FLoadAccountPengeluaranKasLainCommand: TDSRestCommand;
    FLoadAccountPengeluaranKasLainCommand_Cache: TDSRestCommand;
    FLoadAccountAPNewCommand: TDSRestCommand;
    FLoadAccountAPNewCommand_Cache: TDSRestCommand;
    FLoadAccountPenerimaanLainCommand: TDSRestCommand;
    FLoadAccountPenerimaanLainCommand_Cache: TDSRestCommand;
    FLoadAccountARNewCommand: TDSRestCommand;
    FLoadAccountARNewCommand_Cache: TDSRestCommand;
    FLoadAPCommand: TDSRestCommand;
    FLoadAPCommand_Cache: TDSRestCommand;
    FLoadARCommand: TDSRestCommand;
    FLoadARCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function DS_CabangLookUp(const ARequestFilter: string = ''): TDataSet;
    function DS_CabangLookUp_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function DS_GudangLookUp(const ARequestFilter: string = ''): TDataSet;
    function DS_GudangLookUp_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function GetNamaku(const ARequestFilter: string = ''): string;
    function LoadAccountPengeluaranKasLain(const ARequestFilter: string = ''): TDataSet;
    function LoadAccountPengeluaranKasLain_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function LoadAccountAPNew(const ARequestFilter: string = ''): TDataSet;
    function LoadAccountAPNew_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function LoadAccountPenerimaanLain(const ARequestFilter: string = ''): TDataSet;
    function LoadAccountPenerimaanLain_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function LoadAccountARNew(const ARequestFilter: string = ''): TDataSet;
    function LoadAccountARNew_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function LoadAP(ASupplier: TSupplier; const ARequestFilter: string = ''): TDataSet;
    function LoadAP_Cache(ASupplier: TSupplier; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function LoadAR(ACustomer: TSupplier; const ARequestFilter: string = ''): TDataSet;
    function LoadAR_Cache(ACustomer: TSupplier; const ARequestFilter: string = ''): IDSRestCachedDataSet;
  end;

  TServerJurnalClient = class(TDSAdminRestClient)
  private
    FBeforeSaveCommand: TDSRestCommand;
    FBeforeDeleteCommand: TDSRestCommand;
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FDoJournalCommand: TDSRestCommand;
    FGenerateNoBuktiCommand: TDSRestCommand;
    FRetrieveDataCommand: TDSRestCommand;
    FRetrieveDataCommand_Cache: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand_Cache: TDSRestCommand;
    FRetrieveDataSlipCommand: TDSRestCommand;
    FRetrieveDataSlipCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FDeleteNoCommitCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function BeforeSave(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function BeforeDelete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TJurnal;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTJurnal;
    function DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string = ''): Boolean;
    function GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string = ''): string;
    function RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): TDataSet;
    function RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): TDataSet;
    function RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerSettlementARAPClient = class(TDSAdminRestClient)
  private
    FAfterSaveCommand: TDSRestCommand;
    FBeforeDeleteCommand: TDSRestCommand;
    FBeforeSaveCommand: TDSRestCommand;
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FDoJournalCommand: TDSRestCommand;
    FGenerateNoBuktiCommand: TDSRestCommand;
    FRetrieveDataCommand: TDSRestCommand;
    FRetrieveDataCommand_Cache: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand_Cache: TDSRestCommand;
    FRetrieveDataSlipCommand: TDSRestCommand;
    FRetrieveDataSlipCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FDeleteNoCommitCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function AfterSave(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function BeforeDelete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function BeforeSave(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TSettlementARAP;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTSettlementARAP;
    function DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string = ''): Boolean;
    function GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string = ''): string;
    function RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): TDataSet;
    function RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): TDataSet;
    function RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerMenuClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FDeleteNoCommitCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TMenu;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTMenu;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerUserClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FDeleteNoCommitCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TUser;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTUser;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerPenarikanDepositClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FRetrieveCDSlipCommand: TDSRestCommand;
    FRetrieveCDSlipCommand_Cache: TDSRestCommand;
    FDoJournalCommand: TDSRestCommand;
    FGenerateNoBuktiCommand: TDSRestCommand;
    FRetrieveDataCommand: TDSRestCommand;
    FRetrieveDataCommand_Cache: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand: TDSRestCommand;
    FRetrieveDataSiapJurnalCommand_Cache: TDSRestCommand;
    FRetrieveDataSlipCommand: TDSRestCommand;
    FRetrieveDataSlipCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FDeleteNoCommitCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Retrieve(AID: string; const ARequestFilter: string = ''): TPenarikanDeposit;
    function Retrieve_Cache(AID: string; const ARequestFilter: string = ''): IDSRestCachedTPenarikanDeposit;
    function RetrieveCDSlip(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; ANoBukti: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function RetrieveCDSlip_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; ANoBukti: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string = ''): Boolean;
    function GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string = ''): string;
    function RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): TDataSet;
    function RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): TDataSet;
    function RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  IDSRestCachedTMenu = interface(IDSRestCachedObject<TMenu>)
  end;

  TDSRestCachedTMenu = class(TDSRestCachedObject<TMenu>, IDSRestCachedTMenu, IDSRestCachedCommand)
  end;
  IDSRestCachedTGudang = interface(IDSRestCachedObject<TGudang>)
  end;

  TDSRestCachedTGudang = class(TDSRestCachedObject<TGudang>, IDSRestCachedTGudang, IDSRestCachedCommand)
  end;
  IDSRestCachedTSettlementARAP = interface(IDSRestCachedObject<TSettlementARAP>)
  end;

  TDSRestCachedTSettlementARAP = class(TDSRestCachedObject<TSettlementARAP>, IDSRestCachedTSettlementARAP, IDSRestCachedCommand)
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
  IDSRestCachedTBarang = interface(IDSRestCachedObject<TBarang>)
  end;

  TDSRestCachedTBarang = class(TDSRestCachedObject<TBarang>, IDSRestCachedTBarang, IDSRestCachedCommand)
  end;
  IDSRestCachedTPenjualan = interface(IDSRestCachedObject<TPenjualan>)
  end;

  TDSRestCachedTPenjualan = class(TDSRestCachedObject<TPenjualan>, IDSRestCachedTPenjualan, IDSRestCachedCommand)
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
  IDSRestCachedTCustomerInvoice = interface(IDSRestCachedObject<TCustomerInvoice>)
  end;

  TDSRestCachedTCustomerInvoice = class(TDSRestCachedObject<TCustomerInvoice>, IDSRestCachedTCustomerInvoice, IDSRestCachedCommand)
  end;
  IDSRestCachedTCabang = interface(IDSRestCachedObject<TCabang>)
  end;

  TDSRestCachedTCabang = class(TDSRestCachedObject<TCabang>, IDSRestCachedTCabang, IDSRestCachedCommand)
  end;
  IDSRestCachedTAR = interface(IDSRestCachedObject<TAR>)
  end;

  TDSRestCachedTAR = class(TDSRestCachedObject<TAR>, IDSRestCachedTAR, IDSRestCachedCommand)
  end;
  IDSRestCachedTJurnal = interface(IDSRestCachedObject<TJurnal>)
  end;

  TDSRestCachedTJurnal = class(TDSRestCachedObject<TJurnal>, IDSRestCachedTJurnal, IDSRestCachedCommand)
  end;
  IDSRestCachedTPenarikanDeposit = interface(IDSRestCachedObject<TPenarikanDeposit>)
  end;

  TDSRestCachedTPenarikanDeposit = class(TDSRestCachedObject<TPenarikanDeposit>, IDSRestCachedTPenarikanDeposit, IDSRestCachedCommand)
  end;
  IDSRestCachedTTransferAntarGudang = interface(IDSRestCachedObject<TTransferAntarGudang>)
  end;

  TDSRestCachedTTransferAntarGudang = class(TDSRestCachedObject<TTransferAntarGudang>, IDSRestCachedTTransferAntarGudang, IDSRestCachedCommand)
  end;
  IDSRestCachedTStockSekarang = interface(IDSRestCachedObject<TStockSekarang>)
  end;

  TDSRestCachedTStockSekarang = class(TDSRestCachedObject<TStockSekarang>, IDSRestCachedTStockSekarang, IDSRestCachedCommand)
  end;
  IDSRestCachedTAP = interface(IDSRestCachedObject<TAP>)
  end;

  TDSRestCachedTAP = class(TDSRestCachedObject<TAP>, IDSRestCachedTAP, IDSRestCachedCommand)
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
  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;
  IDSRestCachedTPengeluaranKas = interface(IDSRestCachedObject<TPengeluaranKas>)
  end;

  TDSRestCachedTPengeluaranKas = class(TDSRestCachedObject<TPengeluaranKas>, IDSRestCachedTPengeluaranKas, IDSRestCachedCommand)
  end;
  IDSRestCachedTUser = interface(IDSRestCachedObject<TUser>)
  end;

  TDSRestCachedTUser = class(TDSRestCachedObject<TUser>, IDSRestCachedTUser, IDSRestCachedCommand)
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

  TServerLaporan_LaporanKartok: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ABarang'; Direction: 1; DBXType: 37; TypeName: 'TBarang'),
    (Name: 'AGudang'; Direction: 1; DBXType: 37; TypeName: 'TGudang'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerLaporan_LaporanKartok_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ABarang'; Direction: 1; DBXType: 37; TypeName: 'TBarang'),
    (Name: 'AGudang'; Direction: 1; DBXType: 37; TypeName: 'TGudang'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerLaporan_LaporanKarAP: array [0..5] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ASupplier'; Direction: 1; DBXType: 37; TypeName: 'TSupplier'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: 'ANoAP'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerLaporan_LaporanKarAP_Cache: array [0..5] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ASupplier'; Direction: 1; DBXType: 37; TypeName: 'TSupplier'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: 'ANoAP'; Direction: 1; DBXType: 26; TypeName: 'string'),
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

  TServerLaporan_RetriveMutasiBarang: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: 'AGudang'; Direction: 1; DBXType: 37; TypeName: 'TGudang'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerLaporan_RetriveMutasiBarang_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: 'AGudang'; Direction: 1; DBXType: 37; TypeName: 'TGudang'),
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

  TServerLaporan_RetrivePengeluaranKas: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerLaporan_RetrivePengeluaranKas_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerLaporan_RetriveJurnal: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: 'AJenisJurnal'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerLaporan_RetriveJurnal_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: 'AJenisJurnal'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerLaporan_LaporanPenerimaanBarang: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: 'AGudang'; Direction: 1; DBXType: 37; TypeName: 'TGudang'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerLaporan_LaporanPenerimaanBarang_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: 'AGudang'; Direction: 1; DBXType: 37; TypeName: 'TGudang'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerLaporan_LaporanAP: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: 'AIsTglJatuhTempo'; Direction: 1; DBXType: 4; TypeName: 'Boolean'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerLaporan_LaporanAP_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: 'AIsTglJatuhTempo'; Direction: 1; DBXType: 4; TypeName: 'Boolean'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerLaporan_LaporanAR: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: 'AIsTglJatuhTempo'; Direction: 1; DBXType: 4; TypeName: 'Boolean'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerLaporan_LaporanAR_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: 'AIsTglJatuhTempo'; Direction: 1; DBXType: 4; TypeName: 'Boolean'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerLaporan_LaporanReturSupplier: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerLaporan_LaporanReturSupplier_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerLaporan_LaporanKarAR: array [0..5] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACustomer'; Direction: 1; DBXType: 37; TypeName: 'TSupplier'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: 'ANoAR'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerLaporan_LaporanKarAR_Cache: array [0..5] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACustomer'; Direction: 1; DBXType: 37; TypeName: 'TSupplier'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: 'ANoAR'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerLaporan_LaporanNeracaSaldo: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIsKonsolidasi'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerLaporan_LaporanNeracaSaldo_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIsKonsolidasi'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerLaporan_LaporanPenjualanByPembeli: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIsKonsolidasi'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerLaporan_LaporanPenjualanByPembeli_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIsKonsolidasi'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerLaporan_RetrivePenarikanDeposit: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerLaporan_RetrivePenarikanDeposit_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
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

  TServerBarang_DeleteNoCommit: array [0..1] of TDSRestParameterMetaData =
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

  TServerCustomerInvoice_DoJournal: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AModTransClass'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIsHapusJurnal'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerCustomerInvoice_GenerateNoBukti: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATglBukti'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APrefix'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerCustomerInvoice_RetrieveData: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerCustomerInvoice_RetrieveData_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerCustomerInvoice_RetrieveDataSiapJurnal: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerCustomerInvoice_RetrieveDataSiapJurnal_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerCustomerInvoice_RetrieveDataSlip: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerCustomerInvoice_RetrieveDataSlip_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerCustomerInvoice_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerCustomerInvoice_DeleteNoCommit: array [0..1] of TDSRestParameterMetaData =
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

  TServerSupplier_DeleteNoCommit: array [0..1] of TDSRestParameterMetaData =
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

  TServerGroupBarang_DeleteNoCommit: array [0..1] of TDSRestParameterMetaData =
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

  TServerPenerimaanBarang_RetrievePenerimaan: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'APeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerPenerimaanBarang_RetrievePenerimaan_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'APeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenerimaanBarang_RetrieveCDSlip: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
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

  TServerPenerimaanBarang_DoJournal: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AModTransClass'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIsHapusJurnal'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerPenerimaanBarang_GenerateNoBukti: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATglBukti'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APrefix'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerPenerimaanBarang_RetrieveData: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerPenerimaanBarang_RetrieveData_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenerimaanBarang_RetrieveDataSiapJurnal: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerPenerimaanBarang_RetrieveDataSiapJurnal_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenerimaanBarang_RetrieveDataSlip: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerPenerimaanBarang_RetrieveDataSlip_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenerimaanBarang_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerPenerimaanBarang_DeleteNoCommit: array [0..1] of TDSRestParameterMetaData =
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

  TServerCabang_DeleteNoCommit: array [0..1] of TDSRestParameterMetaData =
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

  TServerLogAppObject_DeleteNoCommit: array [0..1] of TDSRestParameterMetaData =
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

  TServerStockSekarang_DeleteNoCommit: array [0..1] of TDSRestParameterMetaData =
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

  TServerReturSupplier_DoJournal: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AModTransClass'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIsHapusJurnal'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerReturSupplier_GenerateNoBukti: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATglBukti'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APrefix'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerReturSupplier_RetrieveData: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerReturSupplier_RetrieveData_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerReturSupplier_RetrieveDataSiapJurnal: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerReturSupplier_RetrieveDataSiapJurnal_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerReturSupplier_RetrieveDataSlip: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerReturSupplier_RetrieveDataSlip_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerReturSupplier_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerReturSupplier_DeleteNoCommit: array [0..1] of TDSRestParameterMetaData =
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

  TServerClosingInventory_DeleteNoCommit: array [0..1] of TDSRestParameterMetaData =
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

  TServerPembayaranSupplier_DeleteNoCommit: array [0..1] of TDSRestParameterMetaData =
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

  TServerGudang_DeleteNoCommit: array [0..1] of TDSRestParameterMetaData =
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

  TServerPenjualan_GetSaldoDeposit: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ASupplier'; Direction: 1; DBXType: 37; TypeName: 'TSupplier'),
    (Name: 'AExcludeNo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 7; TypeName: 'Double')
  );

  TServerPenjualan_GetPenjualanPeriode: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ASupplier'; Direction: 1; DBXType: 37; TypeName: 'TSupplier'),
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AExcludeNo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 7; TypeName: 'Double')
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
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerPenjualan_RetrieveCDSlip_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenjualan_SaveToDBDibayar: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'APenjualan'; Direction: 1; DBXType: 37; TypeName: 'TPenjualan'),
    (Name: 'ADibayar'; Direction: 1; DBXType: 7; TypeName: 'Double'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerPenjualan_DoJournal: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AModTransClass'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIsHapusJurnal'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerPenjualan_GenerateNoBukti: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATglBukti'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APrefix'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerPenjualan_RetrieveData: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerPenjualan_RetrieveData_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenjualan_RetrieveDataSiapJurnal: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerPenjualan_RetrieveDataSiapJurnal_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenjualan_RetrieveDataSlip: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerPenjualan_RetrieveDataSlip_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenjualan_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerPenjualan_DeleteNoCommit: array [0..1] of TDSRestParameterMetaData =
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

  TServerAR_RetrieveTransaksi: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATransaksi'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIDTransaksi'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TAR')
  );

  TServerAR_RetrieveTransaksi_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATransaksi'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIDTransaksi'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerAR_DoJournal: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AModTransClass'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIsHapusJurnal'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerAR_GenerateNoBukti: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATglBukti'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APrefix'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerAR_RetrieveData: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerAR_RetrieveData_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerAR_RetrieveDataSiapJurnal: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerAR_RetrieveDataSiapJurnal_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerAR_RetrieveDataSlip: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerAR_RetrieveDataSlip_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerAR_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerAR_DeleteNoCommit: array [0..1] of TDSRestParameterMetaData =
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

  TServerAP_Retrieve: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TAP')
  );

  TServerAP_Retrieve_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerAP_RetrieveTransaksi: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATransaksi'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIDTransaksi'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TAP')
  );

  TServerAP_RetrieveTransaksi_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATransaksi'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIDTransaksi'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerAP_DoJournal: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AModTransClass'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIsHapusJurnal'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerAP_GenerateNoBukti: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATglBukti'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APrefix'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerAP_RetrieveData: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerAP_RetrieveData_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerAP_RetrieveDataSiapJurnal: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerAP_RetrieveDataSiapJurnal_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerAP_RetrieveDataSlip: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerAP_RetrieveDataSlip_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerAP_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerAP_DeleteNoCommit: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerAP_RetrieveCDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerAP_RetrieveCDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerAP_Save: array [0..1] of TDSRestParameterMetaData =
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

  TServerAccount_DeleteNoCommit: array [0..1] of TDSRestParameterMetaData =
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

  TServerRekBank_RetrieveRek: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANorek'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TRekBank')
  );

  TServerRekBank_RetrieveRek_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANorek'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerRekBank_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerRekBank_DeleteNoCommit: array [0..1] of TDSRestParameterMetaData =
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

  TServerPenerimaanKas_BeforeDelete: array [0..1] of TDSRestParameterMetaData =
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
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
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

  TServerPenerimaanKas_DoJournal: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AModTransClass'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIsHapusJurnal'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerPenerimaanKas_GenerateNoBukti: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATglBukti'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APrefix'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerPenerimaanKas_RetrieveData: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerPenerimaanKas_RetrieveData_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenerimaanKas_RetrieveDataSiapJurnal: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerPenerimaanKas_RetrieveDataSiapJurnal_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenerimaanKas_RetrieveDataSlip: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerPenerimaanKas_RetrieveDataSlip_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenerimaanKas_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerPenerimaanKas_DeleteNoCommit: array [0..1] of TDSRestParameterMetaData =
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

  TServerPengeluaranKas_AfterSave: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerPengeluaranKas_BeforeDelete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerPengeluaranKas_BeforeSave: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerPengeluaranKas_Retrieve: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TPengeluaranKas')
  );

  TServerPengeluaranKas_Retrieve_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPengeluaranKas_RetrievePenerimaanAPs: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerPengeluaranKas_RetrievePenerimaanAPs_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPengeluaranKas_RetrieveCDSlip: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerPengeluaranKas_RetrieveCDSlip_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPengeluaranKas_RetrieveNoBukti: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TPengeluaranKas')
  );

  TServerPengeluaranKas_RetrieveNoBukti_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPengeluaranKas_DoJournal: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AModTransClass'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIsHapusJurnal'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerPengeluaranKas_GenerateNoBukti: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATglBukti'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APrefix'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerPengeluaranKas_RetrieveData: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerPengeluaranKas_RetrieveData_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPengeluaranKas_RetrieveDataSiapJurnal: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerPengeluaranKas_RetrieveDataSiapJurnal_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPengeluaranKas_RetrieveDataSlip: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerPengeluaranKas_RetrieveDataSlip_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPengeluaranKas_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerPengeluaranKas_DeleteNoCommit: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerPengeluaranKas_RetrieveCDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerPengeluaranKas_RetrieveCDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPengeluaranKas_Save: array [0..1] of TDSRestParameterMetaData =
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

  TServerSettingApp_DeleteNoCommit: array [0..1] of TDSRestParameterMetaData =
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

  TServerTransferAntarGudang_DoJournal: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AModTransClass'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIsHapusJurnal'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerTransferAntarGudang_GenerateNoBukti: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATglBukti'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APrefix'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerTransferAntarGudang_RetrieveData: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerTransferAntarGudang_RetrieveData_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerTransferAntarGudang_RetrieveDataSiapJurnal: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerTransferAntarGudang_RetrieveDataSiapJurnal_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerTransferAntarGudang_RetrieveDataSlip: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerTransferAntarGudang_RetrieveDataSlip_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerTransferAntarGudang_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerTransferAntarGudang_DeleteNoCommit: array [0..1] of TDSRestParameterMetaData =
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

  TServerTAGRequest_DoJournal: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AModTransClass'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIsHapusJurnal'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerTAGRequest_GenerateNoBukti: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATglBukti'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APrefix'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerTAGRequest_RetrieveData: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerTAGRequest_RetrieveData_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerTAGRequest_RetrieveDataSiapJurnal: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerTAGRequest_RetrieveDataSiapJurnal_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerTAGRequest_RetrieveDataSlip: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerTAGRequest_RetrieveDataSlip_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerTAGRequest_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerTAGRequest_DeleteNoCommit: array [0..1] of TDSRestParameterMetaData =
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

  TServerTransferAntarCabangKirim_DoJournal: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AModTransClass'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIsHapusJurnal'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerTransferAntarCabangKirim_GenerateNoBukti: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATglBukti'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APrefix'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerTransferAntarCabangKirim_RetrieveData: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerTransferAntarCabangKirim_RetrieveData_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerTransferAntarCabangKirim_RetrieveDataSiapJurnal: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerTransferAntarCabangKirim_RetrieveDataSiapJurnal_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerTransferAntarCabangKirim_RetrieveDataSlip: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerTransferAntarCabangKirim_RetrieveDataSlip_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerTransferAntarCabangKirim_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerTransferAntarCabangKirim_DeleteNoCommit: array [0..1] of TDSRestParameterMetaData =
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

  TServerTransferAntarCabangTerima_DoJournal: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AModTransClass'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIsHapusJurnal'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerTransferAntarCabangTerima_GenerateNoBukti: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATglBukti'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APrefix'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerTransferAntarCabangTerima_RetrieveData: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerTransferAntarCabangTerima_RetrieveData_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerTransferAntarCabangTerima_RetrieveDataSiapJurnal: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerTransferAntarCabangTerima_RetrieveDataSiapJurnal_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerTransferAntarCabangTerima_RetrieveDataSlip: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerTransferAntarCabangTerima_RetrieveDataSlip_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerTransferAntarCabangTerima_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerTransferAntarCabangTerima_DeleteNoCommit: array [0..1] of TDSRestParameterMetaData =
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

  TDSData_DS_CabangLookUp: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSData_DS_CabangLookUp_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSData_DS_GudangLookUp: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSData_DS_GudangLookUp_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSData_GetNamaku: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TDSData_LoadAccountPengeluaranKasLain: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSData_LoadAccountPengeluaranKasLain_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSData_LoadAccountAPNew: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSData_LoadAccountAPNew_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSData_LoadAccountPenerimaanLain: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSData_LoadAccountPenerimaanLain_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSData_LoadAccountARNew: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSData_LoadAccountARNew_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSData_LoadAP: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ASupplier'; Direction: 1; DBXType: 37; TypeName: 'TSupplier'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSData_LoadAP_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ASupplier'; Direction: 1; DBXType: 37; TypeName: 'TSupplier'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSData_LoadAR: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ACustomer'; Direction: 1; DBXType: 37; TypeName: 'TSupplier'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSData_LoadAR_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ACustomer'; Direction: 1; DBXType: 37; TypeName: 'TSupplier'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerJurnal_BeforeSave: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerJurnal_BeforeDelete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerJurnal_Retrieve: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TJurnal')
  );

  TServerJurnal_Retrieve_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerJurnal_DoJournal: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AModTransClass'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIsHapusJurnal'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerJurnal_GenerateNoBukti: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATglBukti'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APrefix'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerJurnal_RetrieveData: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerJurnal_RetrieveData_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerJurnal_RetrieveDataSiapJurnal: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerJurnal_RetrieveDataSiapJurnal_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerJurnal_RetrieveDataSlip: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerJurnal_RetrieveDataSlip_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerJurnal_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerJurnal_DeleteNoCommit: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerJurnal_RetrieveCDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerJurnal_RetrieveCDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerJurnal_Save: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AOBject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerSettlementARAP_AfterSave: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerSettlementARAP_BeforeDelete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerSettlementARAP_BeforeSave: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerSettlementARAP_Retrieve: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TSettlementARAP')
  );

  TServerSettlementARAP_Retrieve_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerSettlementARAP_DoJournal: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AModTransClass'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIsHapusJurnal'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerSettlementARAP_GenerateNoBukti: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATglBukti'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APrefix'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerSettlementARAP_RetrieveData: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerSettlementARAP_RetrieveData_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerSettlementARAP_RetrieveDataSiapJurnal: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerSettlementARAP_RetrieveDataSiapJurnal_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerSettlementARAP_RetrieveDataSlip: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerSettlementARAP_RetrieveDataSlip_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerSettlementARAP_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerSettlementARAP_DeleteNoCommit: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerSettlementARAP_RetrieveCDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerSettlementARAP_RetrieveCDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerSettlementARAP_Save: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AOBject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerMenu_Retrieve: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TMenu')
  );

  TServerMenu_Retrieve_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMenu_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerMenu_DeleteNoCommit: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerMenu_RetrieveCDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerMenu_RetrieveCDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMenu_Save: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AOBject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerUser_Retrieve: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TUser')
  );

  TServerUser_Retrieve_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerUser_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerUser_DeleteNoCommit: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerUser_RetrieveCDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerUser_RetrieveCDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerUser_Save: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AOBject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerPenarikanDeposit_Retrieve: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TPenarikanDeposit')
  );

  TServerPenarikanDeposit_Retrieve_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenarikanDeposit_RetrieveCDSlip: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerPenarikanDeposit_RetrieveCDSlip_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ATglAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ATglAtglAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ACabang'; Direction: 1; DBXType: 37; TypeName: 'TCabang'),
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenarikanDeposit_DoJournal: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ANoBukti'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AModTransClass'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIsHapusJurnal'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerPenarikanDeposit_GenerateNoBukti: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATglBukti'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APrefix'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerPenarikanDeposit_RetrieveData: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerPenarikanDeposit_RetrieveData_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenarikanDeposit_RetrieveDataSiapJurnal: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerPenarikanDeposit_RetrieveDataSiapJurnal_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenarikanDeposit_RetrieveDataSlip: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerPenarikanDeposit_RetrieveDataSlip_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'aPeriodeAwal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'APeriodeAkhir'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'AIDCabang'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenarikanDeposit_Delete: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerPenarikanDeposit_DeleteNoCommit: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerPenarikanDeposit_RetrieveCDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerPenarikanDeposit_RetrieveCDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAppObject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPenarikanDeposit_Save: array [0..1] of TDSRestParameterMetaData =
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

function TServerLaporanClient.LaporanKartok(ATglAwal: TDateTime; ATglAkhir: TDateTime; ABarang: TBarang; AGudang: TGudang; const ARequestFilter: string): TFDJSONDataSets;
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
  FLaporanKartokCommand.Execute(ARequestFilter);
  if not FLaporanKartokCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FLaporanKartokCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FLaporanKartokCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FLaporanKartokCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerLaporanClient.LaporanKartok_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; ABarang: TBarang; AGudang: TGudang; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
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
  FLaporanKartokCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FLaporanKartokCommand_Cache.Parameters[4].Value.GetString);
end;

function TServerLaporanClient.LaporanKarAP(ATglAwal: TDateTime; ATglAkhir: TDateTime; ASupplier: TSupplier; ACabang: TCabang; ANoAP: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FLaporanKarAPCommand = nil then
  begin
    FLaporanKarAPCommand := FConnection.CreateCommand;
    FLaporanKarAPCommand.RequestType := 'POST';
    FLaporanKarAPCommand.Text := 'TServerLaporan."LaporanKarAP"';
    FLaporanKarAPCommand.Prepare(TServerLaporan_LaporanKarAP);
  end;
  FLaporanKarAPCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FLaporanKarAPCommand.Parameters[1].Value.AsDateTime := ATglAkhir;
  if not Assigned(ASupplier) then
    FLaporanKarAPCommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanKarAPCommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanKarAPCommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ASupplier), True);
      if FInstanceOwner then
        ASupplier.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  if not Assigned(ACabang) then
    FLaporanKarAPCommand.Parameters[3].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanKarAPCommand.Parameters[3].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanKarAPCommand.Parameters[3].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FLaporanKarAPCommand.Parameters[4].Value.SetWideString(ANoAP);
  FLaporanKarAPCommand.Execute(ARequestFilter);
  if not FLaporanKarAPCommand.Parameters[5].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FLaporanKarAPCommand.Parameters[5].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FLaporanKarAPCommand.Parameters[5].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FLaporanKarAPCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerLaporanClient.LaporanKarAP_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; ASupplier: TSupplier; ACabang: TCabang; ANoAP: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FLaporanKarAPCommand_Cache = nil then
  begin
    FLaporanKarAPCommand_Cache := FConnection.CreateCommand;
    FLaporanKarAPCommand_Cache.RequestType := 'POST';
    FLaporanKarAPCommand_Cache.Text := 'TServerLaporan."LaporanKarAP"';
    FLaporanKarAPCommand_Cache.Prepare(TServerLaporan_LaporanKarAP_Cache);
  end;
  FLaporanKarAPCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FLaporanKarAPCommand_Cache.Parameters[1].Value.AsDateTime := ATglAkhir;
  if not Assigned(ASupplier) then
    FLaporanKarAPCommand_Cache.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanKarAPCommand_Cache.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanKarAPCommand_Cache.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ASupplier), True);
      if FInstanceOwner then
        ASupplier.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  if not Assigned(ACabang) then
    FLaporanKarAPCommand_Cache.Parameters[3].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanKarAPCommand_Cache.Parameters[3].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanKarAPCommand_Cache.Parameters[3].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FLaporanKarAPCommand_Cache.Parameters[4].Value.SetWideString(ANoAP);
  FLaporanKarAPCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FLaporanKarAPCommand_Cache.Parameters[5].Value.GetString);
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

function TServerLaporanClient.RetriveMutasiBarang(ATglAwal: TDateTime; ATglAkhir: TDateTime; ACabang: TCabang; AGudang: TGudang; const ARequestFilter: string): TDataSet;
begin
  if FRetriveMutasiBarangCommand = nil then
  begin
    FRetriveMutasiBarangCommand := FConnection.CreateCommand;
    FRetriveMutasiBarangCommand.RequestType := 'POST';
    FRetriveMutasiBarangCommand.Text := 'TServerLaporan."RetriveMutasiBarang"';
    FRetriveMutasiBarangCommand.Prepare(TServerLaporan_RetriveMutasiBarang);
  end;
  FRetriveMutasiBarangCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetriveMutasiBarangCommand.Parameters[1].Value.AsDateTime := ATglAkhir;
  if not Assigned(ACabang) then
    FRetriveMutasiBarangCommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetriveMutasiBarangCommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetriveMutasiBarangCommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  if not Assigned(AGudang) then
    FRetriveMutasiBarangCommand.Parameters[3].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetriveMutasiBarangCommand.Parameters[3].ConnectionHandler).GetJSONMarshaler;
    try
      FRetriveMutasiBarangCommand.Parameters[3].Value.SetJSONValue(FMarshal.Marshal(AGudang), True);
      if FInstanceOwner then
        AGudang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetriveMutasiBarangCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetriveMutasiBarangCommand.Parameters[4].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetriveMutasiBarangCommand.FreeOnExecute(Result);
end;

function TServerLaporanClient.RetriveMutasiBarang_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; ACabang: TCabang; AGudang: TGudang; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetriveMutasiBarangCommand_Cache = nil then
  begin
    FRetriveMutasiBarangCommand_Cache := FConnection.CreateCommand;
    FRetriveMutasiBarangCommand_Cache.RequestType := 'POST';
    FRetriveMutasiBarangCommand_Cache.Text := 'TServerLaporan."RetriveMutasiBarang"';
    FRetriveMutasiBarangCommand_Cache.Prepare(TServerLaporan_RetriveMutasiBarang_Cache);
  end;
  FRetriveMutasiBarangCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetriveMutasiBarangCommand_Cache.Parameters[1].Value.AsDateTime := ATglAkhir;
  if not Assigned(ACabang) then
    FRetriveMutasiBarangCommand_Cache.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetriveMutasiBarangCommand_Cache.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetriveMutasiBarangCommand_Cache.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  if not Assigned(AGudang) then
    FRetriveMutasiBarangCommand_Cache.Parameters[3].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetriveMutasiBarangCommand_Cache.Parameters[3].ConnectionHandler).GetJSONMarshaler;
    try
      FRetriveMutasiBarangCommand_Cache.Parameters[3].Value.SetJSONValue(FMarshal.Marshal(AGudang), True);
      if FInstanceOwner then
        AGudang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetriveMutasiBarangCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetriveMutasiBarangCommand_Cache.Parameters[4].Value.GetString);
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

function TServerLaporanClient.RetrivePengeluaranKas(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string): TDataSet;
begin
  if FRetrivePengeluaranKasCommand = nil then
  begin
    FRetrivePengeluaranKasCommand := FConnection.CreateCommand;
    FRetrivePengeluaranKasCommand.RequestType := 'POST';
    FRetrivePengeluaranKasCommand.Text := 'TServerLaporan."RetrivePengeluaranKas"';
    FRetrivePengeluaranKasCommand.Prepare(TServerLaporan_RetrivePengeluaranKas);
  end;
  FRetrivePengeluaranKasCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetrivePengeluaranKasCommand.Parameters[1].Value.AsDateTime := ATglAtglAkhir;
  if not Assigned(ACabang) then
    FRetrivePengeluaranKasCommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrivePengeluaranKasCommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrivePengeluaranKasCommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrivePengeluaranKasCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrivePengeluaranKasCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrivePengeluaranKasCommand.FreeOnExecute(Result);
end;

function TServerLaporanClient.RetrivePengeluaranKas_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrivePengeluaranKasCommand_Cache = nil then
  begin
    FRetrivePengeluaranKasCommand_Cache := FConnection.CreateCommand;
    FRetrivePengeluaranKasCommand_Cache.RequestType := 'POST';
    FRetrivePengeluaranKasCommand_Cache.Text := 'TServerLaporan."RetrivePengeluaranKas"';
    FRetrivePengeluaranKasCommand_Cache.Prepare(TServerLaporan_RetrivePengeluaranKas_Cache);
  end;
  FRetrivePengeluaranKasCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetrivePengeluaranKasCommand_Cache.Parameters[1].Value.AsDateTime := ATglAtglAkhir;
  if not Assigned(ACabang) then
    FRetrivePengeluaranKasCommand_Cache.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrivePengeluaranKasCommand_Cache.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrivePengeluaranKasCommand_Cache.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrivePengeluaranKasCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrivePengeluaranKasCommand_Cache.Parameters[3].Value.GetString);
end;

function TServerLaporanClient.RetriveJurnal(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; AJenisJurnal: string; const ARequestFilter: string): TDataSet;
begin
  if FRetriveJurnalCommand = nil then
  begin
    FRetriveJurnalCommand := FConnection.CreateCommand;
    FRetriveJurnalCommand.RequestType := 'POST';
    FRetriveJurnalCommand.Text := 'TServerLaporan."RetriveJurnal"';
    FRetriveJurnalCommand.Prepare(TServerLaporan_RetriveJurnal);
  end;
  FRetriveJurnalCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetriveJurnalCommand.Parameters[1].Value.AsDateTime := ATglAtglAkhir;
  if not Assigned(ACabang) then
    FRetriveJurnalCommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetriveJurnalCommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetriveJurnalCommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetriveJurnalCommand.Parameters[3].Value.SetWideString(AJenisJurnal);
  FRetriveJurnalCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetriveJurnalCommand.Parameters[4].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetriveJurnalCommand.FreeOnExecute(Result);
end;

function TServerLaporanClient.RetriveJurnal_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; AJenisJurnal: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetriveJurnalCommand_Cache = nil then
  begin
    FRetriveJurnalCommand_Cache := FConnection.CreateCommand;
    FRetriveJurnalCommand_Cache.RequestType := 'POST';
    FRetriveJurnalCommand_Cache.Text := 'TServerLaporan."RetriveJurnal"';
    FRetriveJurnalCommand_Cache.Prepare(TServerLaporan_RetriveJurnal_Cache);
  end;
  FRetriveJurnalCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetriveJurnalCommand_Cache.Parameters[1].Value.AsDateTime := ATglAtglAkhir;
  if not Assigned(ACabang) then
    FRetriveJurnalCommand_Cache.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetriveJurnalCommand_Cache.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetriveJurnalCommand_Cache.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetriveJurnalCommand_Cache.Parameters[3].Value.SetWideString(AJenisJurnal);
  FRetriveJurnalCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetriveJurnalCommand_Cache.Parameters[4].Value.GetString);
end;

function TServerLaporanClient.LaporanPenerimaanBarang(ATglAwal: TDateTime; AtglAkhir: TDateTime; ACabang: TCabang; AGudang: TGudang; const ARequestFilter: string): TDataSet;
begin
  if FLaporanPenerimaanBarangCommand = nil then
  begin
    FLaporanPenerimaanBarangCommand := FConnection.CreateCommand;
    FLaporanPenerimaanBarangCommand.RequestType := 'POST';
    FLaporanPenerimaanBarangCommand.Text := 'TServerLaporan."LaporanPenerimaanBarang"';
    FLaporanPenerimaanBarangCommand.Prepare(TServerLaporan_LaporanPenerimaanBarang);
  end;
  FLaporanPenerimaanBarangCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FLaporanPenerimaanBarangCommand.Parameters[1].Value.AsDateTime := AtglAkhir;
  if not Assigned(ACabang) then
    FLaporanPenerimaanBarangCommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanPenerimaanBarangCommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanPenerimaanBarangCommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  if not Assigned(AGudang) then
    FLaporanPenerimaanBarangCommand.Parameters[3].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanPenerimaanBarangCommand.Parameters[3].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanPenerimaanBarangCommand.Parameters[3].Value.SetJSONValue(FMarshal.Marshal(AGudang), True);
      if FInstanceOwner then
        AGudang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FLaporanPenerimaanBarangCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FLaporanPenerimaanBarangCommand.Parameters[4].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FLaporanPenerimaanBarangCommand.FreeOnExecute(Result);
end;

function TServerLaporanClient.LaporanPenerimaanBarang_Cache(ATglAwal: TDateTime; AtglAkhir: TDateTime; ACabang: TCabang; AGudang: TGudang; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FLaporanPenerimaanBarangCommand_Cache = nil then
  begin
    FLaporanPenerimaanBarangCommand_Cache := FConnection.CreateCommand;
    FLaporanPenerimaanBarangCommand_Cache.RequestType := 'POST';
    FLaporanPenerimaanBarangCommand_Cache.Text := 'TServerLaporan."LaporanPenerimaanBarang"';
    FLaporanPenerimaanBarangCommand_Cache.Prepare(TServerLaporan_LaporanPenerimaanBarang_Cache);
  end;
  FLaporanPenerimaanBarangCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FLaporanPenerimaanBarangCommand_Cache.Parameters[1].Value.AsDateTime := AtglAkhir;
  if not Assigned(ACabang) then
    FLaporanPenerimaanBarangCommand_Cache.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanPenerimaanBarangCommand_Cache.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanPenerimaanBarangCommand_Cache.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  if not Assigned(AGudang) then
    FLaporanPenerimaanBarangCommand_Cache.Parameters[3].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanPenerimaanBarangCommand_Cache.Parameters[3].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanPenerimaanBarangCommand_Cache.Parameters[3].Value.SetJSONValue(FMarshal.Marshal(AGudang), True);
      if FInstanceOwner then
        AGudang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FLaporanPenerimaanBarangCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FLaporanPenerimaanBarangCommand_Cache.Parameters[4].Value.GetString);
end;

function TServerLaporanClient.LaporanAP(ATglAwal: TDateTime; AtglAkhir: TDateTime; ACabang: TCabang; AIsTglJatuhTempo: Boolean; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FLaporanAPCommand = nil then
  begin
    FLaporanAPCommand := FConnection.CreateCommand;
    FLaporanAPCommand.RequestType := 'POST';
    FLaporanAPCommand.Text := 'TServerLaporan."LaporanAP"';
    FLaporanAPCommand.Prepare(TServerLaporan_LaporanAP);
  end;
  FLaporanAPCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FLaporanAPCommand.Parameters[1].Value.AsDateTime := AtglAkhir;
  if not Assigned(ACabang) then
    FLaporanAPCommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanAPCommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanAPCommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FLaporanAPCommand.Parameters[3].Value.SetBoolean(AIsTglJatuhTempo);
  FLaporanAPCommand.Execute(ARequestFilter);
  if not FLaporanAPCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FLaporanAPCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FLaporanAPCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FLaporanAPCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerLaporanClient.LaporanAP_Cache(ATglAwal: TDateTime; AtglAkhir: TDateTime; ACabang: TCabang; AIsTglJatuhTempo: Boolean; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FLaporanAPCommand_Cache = nil then
  begin
    FLaporanAPCommand_Cache := FConnection.CreateCommand;
    FLaporanAPCommand_Cache.RequestType := 'POST';
    FLaporanAPCommand_Cache.Text := 'TServerLaporan."LaporanAP"';
    FLaporanAPCommand_Cache.Prepare(TServerLaporan_LaporanAP_Cache);
  end;
  FLaporanAPCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FLaporanAPCommand_Cache.Parameters[1].Value.AsDateTime := AtglAkhir;
  if not Assigned(ACabang) then
    FLaporanAPCommand_Cache.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanAPCommand_Cache.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanAPCommand_Cache.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FLaporanAPCommand_Cache.Parameters[3].Value.SetBoolean(AIsTglJatuhTempo);
  FLaporanAPCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FLaporanAPCommand_Cache.Parameters[4].Value.GetString);
end;

function TServerLaporanClient.LaporanAR(ATglAwal: TDateTime; AtglAkhir: TDateTime; ACabang: TCabang; AIsTglJatuhTempo: Boolean; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FLaporanARCommand = nil then
  begin
    FLaporanARCommand := FConnection.CreateCommand;
    FLaporanARCommand.RequestType := 'POST';
    FLaporanARCommand.Text := 'TServerLaporan."LaporanAR"';
    FLaporanARCommand.Prepare(TServerLaporan_LaporanAR);
  end;
  FLaporanARCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FLaporanARCommand.Parameters[1].Value.AsDateTime := AtglAkhir;
  if not Assigned(ACabang) then
    FLaporanARCommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanARCommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanARCommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FLaporanARCommand.Parameters[3].Value.SetBoolean(AIsTglJatuhTempo);
  FLaporanARCommand.Execute(ARequestFilter);
  if not FLaporanARCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FLaporanARCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FLaporanARCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FLaporanARCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerLaporanClient.LaporanAR_Cache(ATglAwal: TDateTime; AtglAkhir: TDateTime; ACabang: TCabang; AIsTglJatuhTempo: Boolean; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FLaporanARCommand_Cache = nil then
  begin
    FLaporanARCommand_Cache := FConnection.CreateCommand;
    FLaporanARCommand_Cache.RequestType := 'POST';
    FLaporanARCommand_Cache.Text := 'TServerLaporan."LaporanAR"';
    FLaporanARCommand_Cache.Prepare(TServerLaporan_LaporanAR_Cache);
  end;
  FLaporanARCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FLaporanARCommand_Cache.Parameters[1].Value.AsDateTime := AtglAkhir;
  if not Assigned(ACabang) then
    FLaporanARCommand_Cache.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanARCommand_Cache.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanARCommand_Cache.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FLaporanARCommand_Cache.Parameters[3].Value.SetBoolean(AIsTglJatuhTempo);
  FLaporanARCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FLaporanARCommand_Cache.Parameters[4].Value.GetString);
end;

function TServerLaporanClient.LaporanReturSupplier(ATglAwal: TDateTime; AtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FLaporanReturSupplierCommand = nil then
  begin
    FLaporanReturSupplierCommand := FConnection.CreateCommand;
    FLaporanReturSupplierCommand.RequestType := 'POST';
    FLaporanReturSupplierCommand.Text := 'TServerLaporan."LaporanReturSupplier"';
    FLaporanReturSupplierCommand.Prepare(TServerLaporan_LaporanReturSupplier);
  end;
  FLaporanReturSupplierCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FLaporanReturSupplierCommand.Parameters[1].Value.AsDateTime := AtglAkhir;
  if not Assigned(ACabang) then
    FLaporanReturSupplierCommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanReturSupplierCommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanReturSupplierCommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FLaporanReturSupplierCommand.Execute(ARequestFilter);
  if not FLaporanReturSupplierCommand.Parameters[3].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FLaporanReturSupplierCommand.Parameters[3].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FLaporanReturSupplierCommand.Parameters[3].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FLaporanReturSupplierCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerLaporanClient.LaporanReturSupplier_Cache(ATglAwal: TDateTime; AtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FLaporanReturSupplierCommand_Cache = nil then
  begin
    FLaporanReturSupplierCommand_Cache := FConnection.CreateCommand;
    FLaporanReturSupplierCommand_Cache.RequestType := 'POST';
    FLaporanReturSupplierCommand_Cache.Text := 'TServerLaporan."LaporanReturSupplier"';
    FLaporanReturSupplierCommand_Cache.Prepare(TServerLaporan_LaporanReturSupplier_Cache);
  end;
  FLaporanReturSupplierCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FLaporanReturSupplierCommand_Cache.Parameters[1].Value.AsDateTime := AtglAkhir;
  if not Assigned(ACabang) then
    FLaporanReturSupplierCommand_Cache.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanReturSupplierCommand_Cache.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanReturSupplierCommand_Cache.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FLaporanReturSupplierCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FLaporanReturSupplierCommand_Cache.Parameters[3].Value.GetString);
end;

function TServerLaporanClient.LaporanKarAR(ATglAwal: TDateTime; ATglAkhir: TDateTime; ACustomer: TSupplier; ACabang: TCabang; ANoAR: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FLaporanKarARCommand = nil then
  begin
    FLaporanKarARCommand := FConnection.CreateCommand;
    FLaporanKarARCommand.RequestType := 'POST';
    FLaporanKarARCommand.Text := 'TServerLaporan."LaporanKarAR"';
    FLaporanKarARCommand.Prepare(TServerLaporan_LaporanKarAR);
  end;
  FLaporanKarARCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FLaporanKarARCommand.Parameters[1].Value.AsDateTime := ATglAkhir;
  if not Assigned(ACustomer) then
    FLaporanKarARCommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanKarARCommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanKarARCommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACustomer), True);
      if FInstanceOwner then
        ACustomer.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  if not Assigned(ACabang) then
    FLaporanKarARCommand.Parameters[3].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanKarARCommand.Parameters[3].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanKarARCommand.Parameters[3].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FLaporanKarARCommand.Parameters[4].Value.SetWideString(ANoAR);
  FLaporanKarARCommand.Execute(ARequestFilter);
  if not FLaporanKarARCommand.Parameters[5].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FLaporanKarARCommand.Parameters[5].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FLaporanKarARCommand.Parameters[5].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FLaporanKarARCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerLaporanClient.LaporanKarAR_Cache(ATglAwal: TDateTime; ATglAkhir: TDateTime; ACustomer: TSupplier; ACabang: TCabang; ANoAR: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FLaporanKarARCommand_Cache = nil then
  begin
    FLaporanKarARCommand_Cache := FConnection.CreateCommand;
    FLaporanKarARCommand_Cache.RequestType := 'POST';
    FLaporanKarARCommand_Cache.Text := 'TServerLaporan."LaporanKarAR"';
    FLaporanKarARCommand_Cache.Prepare(TServerLaporan_LaporanKarAR_Cache);
  end;
  FLaporanKarARCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FLaporanKarARCommand_Cache.Parameters[1].Value.AsDateTime := ATglAkhir;
  if not Assigned(ACustomer) then
    FLaporanKarARCommand_Cache.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanKarARCommand_Cache.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanKarARCommand_Cache.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACustomer), True);
      if FInstanceOwner then
        ACustomer.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  if not Assigned(ACabang) then
    FLaporanKarARCommand_Cache.Parameters[3].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanKarARCommand_Cache.Parameters[3].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanKarARCommand_Cache.Parameters[3].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FLaporanKarARCommand_Cache.Parameters[4].Value.SetWideString(ANoAR);
  FLaporanKarARCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FLaporanKarARCommand_Cache.Parameters[5].Value.GetString);
end;

function TServerLaporanClient.LaporanNeracaSaldo(ATglAwal: TDateTime; AtglAkhir: TDateTime; AIsKonsolidasi: Integer; ACabang: TCabang; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FLaporanNeracaSaldoCommand = nil then
  begin
    FLaporanNeracaSaldoCommand := FConnection.CreateCommand;
    FLaporanNeracaSaldoCommand.RequestType := 'POST';
    FLaporanNeracaSaldoCommand.Text := 'TServerLaporan."LaporanNeracaSaldo"';
    FLaporanNeracaSaldoCommand.Prepare(TServerLaporan_LaporanNeracaSaldo);
  end;
  FLaporanNeracaSaldoCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FLaporanNeracaSaldoCommand.Parameters[1].Value.AsDateTime := AtglAkhir;
  FLaporanNeracaSaldoCommand.Parameters[2].Value.SetInt32(AIsKonsolidasi);
  if not Assigned(ACabang) then
    FLaporanNeracaSaldoCommand.Parameters[3].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanNeracaSaldoCommand.Parameters[3].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanNeracaSaldoCommand.Parameters[3].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FLaporanNeracaSaldoCommand.Execute(ARequestFilter);
  if not FLaporanNeracaSaldoCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FLaporanNeracaSaldoCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FLaporanNeracaSaldoCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FLaporanNeracaSaldoCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerLaporanClient.LaporanNeracaSaldo_Cache(ATglAwal: TDateTime; AtglAkhir: TDateTime; AIsKonsolidasi: Integer; ACabang: TCabang; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FLaporanNeracaSaldoCommand_Cache = nil then
  begin
    FLaporanNeracaSaldoCommand_Cache := FConnection.CreateCommand;
    FLaporanNeracaSaldoCommand_Cache.RequestType := 'POST';
    FLaporanNeracaSaldoCommand_Cache.Text := 'TServerLaporan."LaporanNeracaSaldo"';
    FLaporanNeracaSaldoCommand_Cache.Prepare(TServerLaporan_LaporanNeracaSaldo_Cache);
  end;
  FLaporanNeracaSaldoCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FLaporanNeracaSaldoCommand_Cache.Parameters[1].Value.AsDateTime := AtglAkhir;
  FLaporanNeracaSaldoCommand_Cache.Parameters[2].Value.SetInt32(AIsKonsolidasi);
  if not Assigned(ACabang) then
    FLaporanNeracaSaldoCommand_Cache.Parameters[3].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanNeracaSaldoCommand_Cache.Parameters[3].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanNeracaSaldoCommand_Cache.Parameters[3].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FLaporanNeracaSaldoCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FLaporanNeracaSaldoCommand_Cache.Parameters[4].Value.GetString);
end;

function TServerLaporanClient.LaporanPenjualanByPembeli(ATglAwal: TDateTime; AtglAkhir: TDateTime; AIsKonsolidasi: Integer; ACabang: TCabang; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FLaporanPenjualanByPembeliCommand = nil then
  begin
    FLaporanPenjualanByPembeliCommand := FConnection.CreateCommand;
    FLaporanPenjualanByPembeliCommand.RequestType := 'POST';
    FLaporanPenjualanByPembeliCommand.Text := 'TServerLaporan."LaporanPenjualanByPembeli"';
    FLaporanPenjualanByPembeliCommand.Prepare(TServerLaporan_LaporanPenjualanByPembeli);
  end;
  FLaporanPenjualanByPembeliCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FLaporanPenjualanByPembeliCommand.Parameters[1].Value.AsDateTime := AtglAkhir;
  FLaporanPenjualanByPembeliCommand.Parameters[2].Value.SetInt32(AIsKonsolidasi);
  if not Assigned(ACabang) then
    FLaporanPenjualanByPembeliCommand.Parameters[3].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanPenjualanByPembeliCommand.Parameters[3].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanPenjualanByPembeliCommand.Parameters[3].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FLaporanPenjualanByPembeliCommand.Execute(ARequestFilter);
  if not FLaporanPenjualanByPembeliCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FLaporanPenjualanByPembeliCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FLaporanPenjualanByPembeliCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FLaporanPenjualanByPembeliCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerLaporanClient.LaporanPenjualanByPembeli_Cache(ATglAwal: TDateTime; AtglAkhir: TDateTime; AIsKonsolidasi: Integer; ACabang: TCabang; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FLaporanPenjualanByPembeliCommand_Cache = nil then
  begin
    FLaporanPenjualanByPembeliCommand_Cache := FConnection.CreateCommand;
    FLaporanPenjualanByPembeliCommand_Cache.RequestType := 'POST';
    FLaporanPenjualanByPembeliCommand_Cache.Text := 'TServerLaporan."LaporanPenjualanByPembeli"';
    FLaporanPenjualanByPembeliCommand_Cache.Prepare(TServerLaporan_LaporanPenjualanByPembeli_Cache);
  end;
  FLaporanPenjualanByPembeliCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FLaporanPenjualanByPembeliCommand_Cache.Parameters[1].Value.AsDateTime := AtglAkhir;
  FLaporanPenjualanByPembeliCommand_Cache.Parameters[2].Value.SetInt32(AIsKonsolidasi);
  if not Assigned(ACabang) then
    FLaporanPenjualanByPembeliCommand_Cache.Parameters[3].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLaporanPenjualanByPembeliCommand_Cache.Parameters[3].ConnectionHandler).GetJSONMarshaler;
    try
      FLaporanPenjualanByPembeliCommand_Cache.Parameters[3].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FLaporanPenjualanByPembeliCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FLaporanPenjualanByPembeliCommand_Cache.Parameters[4].Value.GetString);
end;

function TServerLaporanClient.RetrivePenarikanDeposit(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string): TDataSet;
begin
  if FRetrivePenarikanDepositCommand = nil then
  begin
    FRetrivePenarikanDepositCommand := FConnection.CreateCommand;
    FRetrivePenarikanDepositCommand.RequestType := 'POST';
    FRetrivePenarikanDepositCommand.Text := 'TServerLaporan."RetrivePenarikanDeposit"';
    FRetrivePenarikanDepositCommand.Prepare(TServerLaporan_RetrivePenarikanDeposit);
  end;
  FRetrivePenarikanDepositCommand.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetrivePenarikanDepositCommand.Parameters[1].Value.AsDateTime := ATglAtglAkhir;
  if not Assigned(ACabang) then
    FRetrivePenarikanDepositCommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrivePenarikanDepositCommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrivePenarikanDepositCommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrivePenarikanDepositCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrivePenarikanDepositCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrivePenarikanDepositCommand.FreeOnExecute(Result);
end;

function TServerLaporanClient.RetrivePenarikanDeposit_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrivePenarikanDepositCommand_Cache = nil then
  begin
    FRetrivePenarikanDepositCommand_Cache := FConnection.CreateCommand;
    FRetrivePenarikanDepositCommand_Cache.RequestType := 'POST';
    FRetrivePenarikanDepositCommand_Cache.Text := 'TServerLaporan."RetrivePenarikanDeposit"';
    FRetrivePenarikanDepositCommand_Cache.Prepare(TServerLaporan_RetrivePenarikanDeposit_Cache);
  end;
  FRetrivePenarikanDepositCommand_Cache.Parameters[0].Value.AsDateTime := ATglAwal;
  FRetrivePenarikanDepositCommand_Cache.Parameters[1].Value.AsDateTime := ATglAtglAkhir;
  if not Assigned(ACabang) then
    FRetrivePenarikanDepositCommand_Cache.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRetrivePenarikanDepositCommand_Cache.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FRetrivePenarikanDepositCommand_Cache.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ACabang), True);
      if FInstanceOwner then
        ACabang.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRetrivePenarikanDepositCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrivePenarikanDepositCommand_Cache.Parameters[3].Value.GetString);
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
  FLaporanKarAPCommand.DisposeOf;
  FLaporanKarAPCommand_Cache.DisposeOf;
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
  FRetrivePengeluaranKasCommand.DisposeOf;
  FRetrivePengeluaranKasCommand_Cache.DisposeOf;
  FRetriveJurnalCommand.DisposeOf;
  FRetriveJurnalCommand_Cache.DisposeOf;
  FLaporanPenerimaanBarangCommand.DisposeOf;
  FLaporanPenerimaanBarangCommand_Cache.DisposeOf;
  FLaporanAPCommand.DisposeOf;
  FLaporanAPCommand_Cache.DisposeOf;
  FLaporanARCommand.DisposeOf;
  FLaporanARCommand_Cache.DisposeOf;
  FLaporanReturSupplierCommand.DisposeOf;
  FLaporanReturSupplierCommand_Cache.DisposeOf;
  FLaporanKarARCommand.DisposeOf;
  FLaporanKarARCommand_Cache.DisposeOf;
  FLaporanNeracaSaldoCommand.DisposeOf;
  FLaporanNeracaSaldoCommand_Cache.DisposeOf;
  FLaporanPenjualanByPembeliCommand.DisposeOf;
  FLaporanPenjualanByPembeliCommand_Cache.DisposeOf;
  FRetrivePenarikanDepositCommand.DisposeOf;
  FRetrivePenarikanDepositCommand_Cache.DisposeOf;
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

function TServerBarangClient.DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteNoCommitCommand = nil then
  begin
    FDeleteNoCommitCommand := FConnection.CreateCommand;
    FDeleteNoCommitCommand.RequestType := 'POST';
    FDeleteNoCommitCommand.Text := 'TServerBarang."DeleteNoCommit"';
    FDeleteNoCommitCommand.Prepare(TServerBarang_DeleteNoCommit);
  end;
  if not Assigned(AAppObject) then
    FDeleteNoCommitCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteNoCommitCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteNoCommitCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteNoCommitCommand.Execute(ARequestFilter);
  Result := FDeleteNoCommitCommand.Parameters[1].Value.GetBoolean;
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
  FDeleteNoCommitCommand.DisposeOf;
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

function TServerCustomerInvoiceClient.DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string): Boolean;
begin
  if FDoJournalCommand = nil then
  begin
    FDoJournalCommand := FConnection.CreateCommand;
    FDoJournalCommand.RequestType := 'GET';
    FDoJournalCommand.Text := 'TServerCustomerInvoice.DoJournal';
    FDoJournalCommand.Prepare(TServerCustomerInvoice_DoJournal);
  end;
  FDoJournalCommand.Parameters[0].Value.SetWideString(ANoBukti);
  FDoJournalCommand.Parameters[1].Value.SetWideString(AModTransClass);
  FDoJournalCommand.Parameters[2].Value.SetInt32(AIsHapusJurnal);
  FDoJournalCommand.Execute(ARequestFilter);
  Result := FDoJournalCommand.Parameters[3].Value.GetBoolean;
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

function TServerCustomerInvoiceClient.RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataCommand = nil then
  begin
    FRetrieveDataCommand := FConnection.CreateCommand;
    FRetrieveDataCommand.RequestType := 'GET';
    FRetrieveDataCommand.Text := 'TServerCustomerInvoice.RetrieveData';
    FRetrieveDataCommand.Prepare(TServerCustomerInvoice_RetrieveData);
  end;
  FRetrieveDataCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataCommand.FreeOnExecute(Result);
end;

function TServerCustomerInvoiceClient.RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataCommand_Cache = nil then
  begin
    FRetrieveDataCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataCommand_Cache.RequestType := 'GET';
    FRetrieveDataCommand_Cache.Text := 'TServerCustomerInvoice.RetrieveData';
    FRetrieveDataCommand_Cache.Prepare(TServerCustomerInvoice_RetrieveData_Cache);
  end;
  FRetrieveDataCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataCommand_Cache.Parameters[3].Value.GetString);
end;

function TServerCustomerInvoiceClient.RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataSiapJurnalCommand = nil then
  begin
    FRetrieveDataSiapJurnalCommand := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand.Text := 'TServerCustomerInvoice.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand.Prepare(TServerCustomerInvoice_RetrieveDataSiapJurnal);
  end;
  FRetrieveDataSiapJurnalCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataSiapJurnalCommand.Parameters[2].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataSiapJurnalCommand.FreeOnExecute(Result);
end;

function TServerCustomerInvoiceClient.RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataSiapJurnalCommand_Cache = nil then
  begin
    FRetrieveDataSiapJurnalCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand_Cache.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand_Cache.Text := 'TServerCustomerInvoice.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand_Cache.Prepare(TServerCustomerInvoice_RetrieveDataSiapJurnal_Cache);
  end;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataSiapJurnalCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerCustomerInvoiceClient.RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand = nil then
  begin
    FRetrieveDataSlipCommand := FConnection.CreateCommand;
    FRetrieveDataSlipCommand.RequestType := 'GET';
    FRetrieveDataSlipCommand.Text := 'TServerCustomerInvoice.RetrieveDataSlip';
    FRetrieveDataSlipCommand.Prepare(TServerCustomerInvoice_RetrieveDataSlip);
  end;
  FRetrieveDataSlipCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand.Execute(ARequestFilter);
  if not FRetrieveDataSlipCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveDataSlipCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FRetrieveDataSlipCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveDataSlipCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerCustomerInvoiceClient.RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand_Cache = nil then
  begin
    FRetrieveDataSlipCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSlipCommand_Cache.RequestType := 'GET';
    FRetrieveDataSlipCommand_Cache.Text := 'TServerCustomerInvoice.RetrieveDataSlip';
    FRetrieveDataSlipCommand_Cache.Prepare(TServerCustomerInvoice_RetrieveDataSlip_Cache);
  end;
  FRetrieveDataSlipCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand_Cache.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FRetrieveDataSlipCommand_Cache.Parameters[4].Value.GetString);
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

function TServerCustomerInvoiceClient.DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteNoCommitCommand = nil then
  begin
    FDeleteNoCommitCommand := FConnection.CreateCommand;
    FDeleteNoCommitCommand.RequestType := 'POST';
    FDeleteNoCommitCommand.Text := 'TServerCustomerInvoice."DeleteNoCommit"';
    FDeleteNoCommitCommand.Prepare(TServerCustomerInvoice_DeleteNoCommit);
  end;
  if not Assigned(AAppObject) then
    FDeleteNoCommitCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteNoCommitCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteNoCommitCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteNoCommitCommand.Execute(ARequestFilter);
  Result := FDeleteNoCommitCommand.Parameters[1].Value.GetBoolean;
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
  FDoJournalCommand.DisposeOf;
  FGenerateNoBuktiCommand.DisposeOf;
  FRetrieveDataCommand.DisposeOf;
  FRetrieveDataCommand_Cache.DisposeOf;
  FRetrieveDataSiapJurnalCommand.DisposeOf;
  FRetrieveDataSiapJurnalCommand_Cache.DisposeOf;
  FRetrieveDataSlipCommand.DisposeOf;
  FRetrieveDataSlipCommand_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FDeleteNoCommitCommand.DisposeOf;
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

function TServerSupplierClient.DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteNoCommitCommand = nil then
  begin
    FDeleteNoCommitCommand := FConnection.CreateCommand;
    FDeleteNoCommitCommand.RequestType := 'POST';
    FDeleteNoCommitCommand.Text := 'TServerSupplier."DeleteNoCommit"';
    FDeleteNoCommitCommand.Prepare(TServerSupplier_DeleteNoCommit);
  end;
  if not Assigned(AAppObject) then
    FDeleteNoCommitCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteNoCommitCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteNoCommitCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteNoCommitCommand.Execute(ARequestFilter);
  Result := FDeleteNoCommitCommand.Parameters[1].Value.GetBoolean;
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
  FDeleteNoCommitCommand.DisposeOf;
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

function TServerGroupBarangClient.DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteNoCommitCommand = nil then
  begin
    FDeleteNoCommitCommand := FConnection.CreateCommand;
    FDeleteNoCommitCommand.RequestType := 'POST';
    FDeleteNoCommitCommand.Text := 'TServerGroupBarang."DeleteNoCommit"';
    FDeleteNoCommitCommand.Prepare(TServerGroupBarang_DeleteNoCommit);
  end;
  if not Assigned(AAppObject) then
    FDeleteNoCommitCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteNoCommitCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteNoCommitCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteNoCommitCommand.Execute(ARequestFilter);
  Result := FDeleteNoCommitCommand.Parameters[1].Value.GetBoolean;
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
  FDeleteNoCommitCommand.DisposeOf;
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

function TServerPenerimaanBarangClient.RetrievePenerimaan(APeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): TDataSet;
begin
  if FRetrievePenerimaanCommand = nil then
  begin
    FRetrievePenerimaanCommand := FConnection.CreateCommand;
    FRetrievePenerimaanCommand.RequestType := 'GET';
    FRetrievePenerimaanCommand.Text := 'TServerPenerimaanBarang.RetrievePenerimaan';
    FRetrievePenerimaanCommand.Prepare(TServerPenerimaanBarang_RetrievePenerimaan);
  end;
  FRetrievePenerimaanCommand.Parameters[0].Value.AsDateTime := APeriodeAwal;
  FRetrievePenerimaanCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrievePenerimaanCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrievePenerimaanCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrievePenerimaanCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrievePenerimaanCommand.FreeOnExecute(Result);
end;

function TServerPenerimaanBarangClient.RetrievePenerimaan_Cache(APeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrievePenerimaanCommand_Cache = nil then
  begin
    FRetrievePenerimaanCommand_Cache := FConnection.CreateCommand;
    FRetrievePenerimaanCommand_Cache.RequestType := 'GET';
    FRetrievePenerimaanCommand_Cache.Text := 'TServerPenerimaanBarang.RetrievePenerimaan';
    FRetrievePenerimaanCommand_Cache.Prepare(TServerPenerimaanBarang_RetrievePenerimaan_Cache);
  end;
  FRetrievePenerimaanCommand_Cache.Parameters[0].Value.AsDateTime := APeriodeAwal;
  FRetrievePenerimaanCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrievePenerimaanCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrievePenerimaanCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrievePenerimaanCommand_Cache.Parameters[3].Value.GetString);
end;

function TServerPenerimaanBarangClient.RetrieveCDSlip(AID: string; const ARequestFilter: string): TFDJSONDataSets;
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
  if not FRetrieveCDSlipCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCDSlipCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FRetrieveCDSlipCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCDSlipCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerPenerimaanBarangClient.RetrieveCDSlip_Cache(AID: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
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
  Result := TDSRestCachedTFDJSONDataSets.Create(FRetrieveCDSlipCommand_Cache.Parameters[1].Value.GetString);
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

function TServerPenerimaanBarangClient.DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string): Boolean;
begin
  if FDoJournalCommand = nil then
  begin
    FDoJournalCommand := FConnection.CreateCommand;
    FDoJournalCommand.RequestType := 'GET';
    FDoJournalCommand.Text := 'TServerPenerimaanBarang.DoJournal';
    FDoJournalCommand.Prepare(TServerPenerimaanBarang_DoJournal);
  end;
  FDoJournalCommand.Parameters[0].Value.SetWideString(ANoBukti);
  FDoJournalCommand.Parameters[1].Value.SetWideString(AModTransClass);
  FDoJournalCommand.Parameters[2].Value.SetInt32(AIsHapusJurnal);
  FDoJournalCommand.Execute(ARequestFilter);
  Result := FDoJournalCommand.Parameters[3].Value.GetBoolean;
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

function TServerPenerimaanBarangClient.RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataCommand = nil then
  begin
    FRetrieveDataCommand := FConnection.CreateCommand;
    FRetrieveDataCommand.RequestType := 'GET';
    FRetrieveDataCommand.Text := 'TServerPenerimaanBarang.RetrieveData';
    FRetrieveDataCommand.Prepare(TServerPenerimaanBarang_RetrieveData);
  end;
  FRetrieveDataCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataCommand.FreeOnExecute(Result);
end;

function TServerPenerimaanBarangClient.RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataCommand_Cache = nil then
  begin
    FRetrieveDataCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataCommand_Cache.RequestType := 'GET';
    FRetrieveDataCommand_Cache.Text := 'TServerPenerimaanBarang.RetrieveData';
    FRetrieveDataCommand_Cache.Prepare(TServerPenerimaanBarang_RetrieveData_Cache);
  end;
  FRetrieveDataCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataCommand_Cache.Parameters[3].Value.GetString);
end;

function TServerPenerimaanBarangClient.RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataSiapJurnalCommand = nil then
  begin
    FRetrieveDataSiapJurnalCommand := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand.Text := 'TServerPenerimaanBarang.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand.Prepare(TServerPenerimaanBarang_RetrieveDataSiapJurnal);
  end;
  FRetrieveDataSiapJurnalCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataSiapJurnalCommand.Parameters[2].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataSiapJurnalCommand.FreeOnExecute(Result);
end;

function TServerPenerimaanBarangClient.RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataSiapJurnalCommand_Cache = nil then
  begin
    FRetrieveDataSiapJurnalCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand_Cache.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand_Cache.Text := 'TServerPenerimaanBarang.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand_Cache.Prepare(TServerPenerimaanBarang_RetrieveDataSiapJurnal_Cache);
  end;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataSiapJurnalCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerPenerimaanBarangClient.RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand = nil then
  begin
    FRetrieveDataSlipCommand := FConnection.CreateCommand;
    FRetrieveDataSlipCommand.RequestType := 'GET';
    FRetrieveDataSlipCommand.Text := 'TServerPenerimaanBarang.RetrieveDataSlip';
    FRetrieveDataSlipCommand.Prepare(TServerPenerimaanBarang_RetrieveDataSlip);
  end;
  FRetrieveDataSlipCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand.Execute(ARequestFilter);
  if not FRetrieveDataSlipCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveDataSlipCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FRetrieveDataSlipCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveDataSlipCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerPenerimaanBarangClient.RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand_Cache = nil then
  begin
    FRetrieveDataSlipCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSlipCommand_Cache.RequestType := 'GET';
    FRetrieveDataSlipCommand_Cache.Text := 'TServerPenerimaanBarang.RetrieveDataSlip';
    FRetrieveDataSlipCommand_Cache.Prepare(TServerPenerimaanBarang_RetrieveDataSlip_Cache);
  end;
  FRetrieveDataSlipCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand_Cache.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FRetrieveDataSlipCommand_Cache.Parameters[4].Value.GetString);
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

function TServerPenerimaanBarangClient.DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteNoCommitCommand = nil then
  begin
    FDeleteNoCommitCommand := FConnection.CreateCommand;
    FDeleteNoCommitCommand.RequestType := 'POST';
    FDeleteNoCommitCommand.Text := 'TServerPenerimaanBarang."DeleteNoCommit"';
    FDeleteNoCommitCommand.Prepare(TServerPenerimaanBarang_DeleteNoCommit);
  end;
  if not Assigned(AAppObject) then
    FDeleteNoCommitCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteNoCommitCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteNoCommitCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteNoCommitCommand.Execute(ARequestFilter);
  Result := FDeleteNoCommitCommand.Parameters[1].Value.GetBoolean;
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
  FRetrievePenerimaanCommand.DisposeOf;
  FRetrievePenerimaanCommand_Cache.DisposeOf;
  FRetrieveCDSlipCommand.DisposeOf;
  FRetrieveCDSlipCommand_Cache.DisposeOf;
  FRetrieveNoBuktiCommand.DisposeOf;
  FRetrieveNoBuktiCommand_Cache.DisposeOf;
  FDoJournalCommand.DisposeOf;
  FGenerateNoBuktiCommand.DisposeOf;
  FRetrieveDataCommand.DisposeOf;
  FRetrieveDataCommand_Cache.DisposeOf;
  FRetrieveDataSiapJurnalCommand.DisposeOf;
  FRetrieveDataSiapJurnalCommand_Cache.DisposeOf;
  FRetrieveDataSlipCommand.DisposeOf;
  FRetrieveDataSlipCommand_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FDeleteNoCommitCommand.DisposeOf;
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

function TServerCabangClient.DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteNoCommitCommand = nil then
  begin
    FDeleteNoCommitCommand := FConnection.CreateCommand;
    FDeleteNoCommitCommand.RequestType := 'POST';
    FDeleteNoCommitCommand.Text := 'TServerCabang."DeleteNoCommit"';
    FDeleteNoCommitCommand.Prepare(TServerCabang_DeleteNoCommit);
  end;
  if not Assigned(AAppObject) then
    FDeleteNoCommitCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteNoCommitCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteNoCommitCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteNoCommitCommand.Execute(ARequestFilter);
  Result := FDeleteNoCommitCommand.Parameters[1].Value.GetBoolean;
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
  FDeleteNoCommitCommand.DisposeOf;
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

function TServerLogAppObjectClient.DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteNoCommitCommand = nil then
  begin
    FDeleteNoCommitCommand := FConnection.CreateCommand;
    FDeleteNoCommitCommand.RequestType := 'POST';
    FDeleteNoCommitCommand.Text := 'TServerLogAppObject."DeleteNoCommit"';
    FDeleteNoCommitCommand.Prepare(TServerLogAppObject_DeleteNoCommit);
  end;
  if not Assigned(AAppObject) then
    FDeleteNoCommitCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteNoCommitCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteNoCommitCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteNoCommitCommand.Execute(ARequestFilter);
  Result := FDeleteNoCommitCommand.Parameters[1].Value.GetBoolean;
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
  FDeleteNoCommitCommand.DisposeOf;
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

function TServerStockSekarangClient.DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteNoCommitCommand = nil then
  begin
    FDeleteNoCommitCommand := FConnection.CreateCommand;
    FDeleteNoCommitCommand.RequestType := 'POST';
    FDeleteNoCommitCommand.Text := 'TServerStockSekarang."DeleteNoCommit"';
    FDeleteNoCommitCommand.Prepare(TServerStockSekarang_DeleteNoCommit);
  end;
  if not Assigned(AAppObject) then
    FDeleteNoCommitCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteNoCommitCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteNoCommitCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteNoCommitCommand.Execute(ARequestFilter);
  Result := FDeleteNoCommitCommand.Parameters[1].Value.GetBoolean;
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
  FDeleteNoCommitCommand.DisposeOf;
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

function TServerReturSupplierClient.DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string): Boolean;
begin
  if FDoJournalCommand = nil then
  begin
    FDoJournalCommand := FConnection.CreateCommand;
    FDoJournalCommand.RequestType := 'GET';
    FDoJournalCommand.Text := 'TServerReturSupplier.DoJournal';
    FDoJournalCommand.Prepare(TServerReturSupplier_DoJournal);
  end;
  FDoJournalCommand.Parameters[0].Value.SetWideString(ANoBukti);
  FDoJournalCommand.Parameters[1].Value.SetWideString(AModTransClass);
  FDoJournalCommand.Parameters[2].Value.SetInt32(AIsHapusJurnal);
  FDoJournalCommand.Execute(ARequestFilter);
  Result := FDoJournalCommand.Parameters[3].Value.GetBoolean;
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

function TServerReturSupplierClient.RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataCommand = nil then
  begin
    FRetrieveDataCommand := FConnection.CreateCommand;
    FRetrieveDataCommand.RequestType := 'GET';
    FRetrieveDataCommand.Text := 'TServerReturSupplier.RetrieveData';
    FRetrieveDataCommand.Prepare(TServerReturSupplier_RetrieveData);
  end;
  FRetrieveDataCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataCommand.FreeOnExecute(Result);
end;

function TServerReturSupplierClient.RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataCommand_Cache = nil then
  begin
    FRetrieveDataCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataCommand_Cache.RequestType := 'GET';
    FRetrieveDataCommand_Cache.Text := 'TServerReturSupplier.RetrieveData';
    FRetrieveDataCommand_Cache.Prepare(TServerReturSupplier_RetrieveData_Cache);
  end;
  FRetrieveDataCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataCommand_Cache.Parameters[3].Value.GetString);
end;

function TServerReturSupplierClient.RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataSiapJurnalCommand = nil then
  begin
    FRetrieveDataSiapJurnalCommand := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand.Text := 'TServerReturSupplier.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand.Prepare(TServerReturSupplier_RetrieveDataSiapJurnal);
  end;
  FRetrieveDataSiapJurnalCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataSiapJurnalCommand.Parameters[2].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataSiapJurnalCommand.FreeOnExecute(Result);
end;

function TServerReturSupplierClient.RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataSiapJurnalCommand_Cache = nil then
  begin
    FRetrieveDataSiapJurnalCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand_Cache.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand_Cache.Text := 'TServerReturSupplier.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand_Cache.Prepare(TServerReturSupplier_RetrieveDataSiapJurnal_Cache);
  end;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataSiapJurnalCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerReturSupplierClient.RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand = nil then
  begin
    FRetrieveDataSlipCommand := FConnection.CreateCommand;
    FRetrieveDataSlipCommand.RequestType := 'GET';
    FRetrieveDataSlipCommand.Text := 'TServerReturSupplier.RetrieveDataSlip';
    FRetrieveDataSlipCommand.Prepare(TServerReturSupplier_RetrieveDataSlip);
  end;
  FRetrieveDataSlipCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand.Execute(ARequestFilter);
  if not FRetrieveDataSlipCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveDataSlipCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FRetrieveDataSlipCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveDataSlipCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerReturSupplierClient.RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand_Cache = nil then
  begin
    FRetrieveDataSlipCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSlipCommand_Cache.RequestType := 'GET';
    FRetrieveDataSlipCommand_Cache.Text := 'TServerReturSupplier.RetrieveDataSlip';
    FRetrieveDataSlipCommand_Cache.Prepare(TServerReturSupplier_RetrieveDataSlip_Cache);
  end;
  FRetrieveDataSlipCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand_Cache.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FRetrieveDataSlipCommand_Cache.Parameters[4].Value.GetString);
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

function TServerReturSupplierClient.DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteNoCommitCommand = nil then
  begin
    FDeleteNoCommitCommand := FConnection.CreateCommand;
    FDeleteNoCommitCommand.RequestType := 'POST';
    FDeleteNoCommitCommand.Text := 'TServerReturSupplier."DeleteNoCommit"';
    FDeleteNoCommitCommand.Prepare(TServerReturSupplier_DeleteNoCommit);
  end;
  if not Assigned(AAppObject) then
    FDeleteNoCommitCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteNoCommitCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteNoCommitCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteNoCommitCommand.Execute(ARequestFilter);
  Result := FDeleteNoCommitCommand.Parameters[1].Value.GetBoolean;
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
  FDoJournalCommand.DisposeOf;
  FGenerateNoBuktiCommand.DisposeOf;
  FRetrieveDataCommand.DisposeOf;
  FRetrieveDataCommand_Cache.DisposeOf;
  FRetrieveDataSiapJurnalCommand.DisposeOf;
  FRetrieveDataSiapJurnalCommand_Cache.DisposeOf;
  FRetrieveDataSlipCommand.DisposeOf;
  FRetrieveDataSlipCommand_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FDeleteNoCommitCommand.DisposeOf;
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

function TServerClosingInventoryClient.DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteNoCommitCommand = nil then
  begin
    FDeleteNoCommitCommand := FConnection.CreateCommand;
    FDeleteNoCommitCommand.RequestType := 'POST';
    FDeleteNoCommitCommand.Text := 'TServerClosingInventory."DeleteNoCommit"';
    FDeleteNoCommitCommand.Prepare(TServerClosingInventory_DeleteNoCommit);
  end;
  if not Assigned(AAppObject) then
    FDeleteNoCommitCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteNoCommitCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteNoCommitCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteNoCommitCommand.Execute(ARequestFilter);
  Result := FDeleteNoCommitCommand.Parameters[1].Value.GetBoolean;
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
  FDeleteNoCommitCommand.DisposeOf;
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

function TServerPembayaranSupplierClient.DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteNoCommitCommand = nil then
  begin
    FDeleteNoCommitCommand := FConnection.CreateCommand;
    FDeleteNoCommitCommand.RequestType := 'POST';
    FDeleteNoCommitCommand.Text := 'TServerPembayaranSupplier."DeleteNoCommit"';
    FDeleteNoCommitCommand.Prepare(TServerPembayaranSupplier_DeleteNoCommit);
  end;
  if not Assigned(AAppObject) then
    FDeleteNoCommitCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteNoCommitCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteNoCommitCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteNoCommitCommand.Execute(ARequestFilter);
  Result := FDeleteNoCommitCommand.Parameters[1].Value.GetBoolean;
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
  FDeleteNoCommitCommand.DisposeOf;
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

function TServerGudangClient.DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteNoCommitCommand = nil then
  begin
    FDeleteNoCommitCommand := FConnection.CreateCommand;
    FDeleteNoCommitCommand.RequestType := 'POST';
    FDeleteNoCommitCommand.Text := 'TServerGudang."DeleteNoCommit"';
    FDeleteNoCommitCommand.Prepare(TServerGudang_DeleteNoCommit);
  end;
  if not Assigned(AAppObject) then
    FDeleteNoCommitCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteNoCommitCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteNoCommitCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteNoCommitCommand.Execute(ARequestFilter);
  Result := FDeleteNoCommitCommand.Parameters[1].Value.GetBoolean;
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
  FDeleteNoCommitCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

function TServerPenjualanClient.GetSaldoDeposit(ASupplier: TSupplier; AExcludeNo: string; const ARequestFilter: string): Double;
begin
  if FGetSaldoDepositCommand = nil then
  begin
    FGetSaldoDepositCommand := FConnection.CreateCommand;
    FGetSaldoDepositCommand.RequestType := 'POST';
    FGetSaldoDepositCommand.Text := 'TServerPenjualan."GetSaldoDeposit"';
    FGetSaldoDepositCommand.Prepare(TServerPenjualan_GetSaldoDeposit);
  end;
  if not Assigned(ASupplier) then
    FGetSaldoDepositCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FGetSaldoDepositCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FGetSaldoDepositCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ASupplier), True);
      if FInstanceOwner then
        ASupplier.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FGetSaldoDepositCommand.Parameters[1].Value.SetWideString(AExcludeNo);
  FGetSaldoDepositCommand.Execute(ARequestFilter);
  Result := FGetSaldoDepositCommand.Parameters[2].Value.GetDouble;
end;

function TServerPenjualanClient.GetPenjualanPeriode(ASupplier: TSupplier; ATglAwal: TDateTime; ATglAkhir: TDateTime; AExcludeNo: string; const ARequestFilter: string): Double;
begin
  if FGetPenjualanPeriodeCommand = nil then
  begin
    FGetPenjualanPeriodeCommand := FConnection.CreateCommand;
    FGetPenjualanPeriodeCommand.RequestType := 'POST';
    FGetPenjualanPeriodeCommand.Text := 'TServerPenjualan."GetPenjualanPeriode"';
    FGetPenjualanPeriodeCommand.Prepare(TServerPenjualan_GetPenjualanPeriode);
  end;
  if not Assigned(ASupplier) then
    FGetPenjualanPeriodeCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FGetPenjualanPeriodeCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FGetPenjualanPeriodeCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ASupplier), True);
      if FInstanceOwner then
        ASupplier.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FGetPenjualanPeriodeCommand.Parameters[1].Value.AsDateTime := ATglAwal;
  FGetPenjualanPeriodeCommand.Parameters[2].Value.AsDateTime := ATglAkhir;
  FGetPenjualanPeriodeCommand.Parameters[3].Value.SetWideString(AExcludeNo);
  FGetPenjualanPeriodeCommand.Execute(ARequestFilter);
  Result := FGetPenjualanPeriodeCommand.Parameters[4].Value.GetDouble;
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

function TServerPenjualanClient.RetrieveCDSlip(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; ANoBukti: string; const ARequestFilter: string): TFDJSONDataSets;
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
  if not FRetrieveCDSlipCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCDSlipCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FRetrieveCDSlipCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCDSlipCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerPenjualanClient.RetrieveCDSlip_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; ANoBukti: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
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
  Result := TDSRestCachedTFDJSONDataSets.Create(FRetrieveCDSlipCommand_Cache.Parameters[4].Value.GetString);
end;

function TServerPenjualanClient.SaveToDBDibayar(APenjualan: TPenjualan; ADibayar: Double; const ARequestFilter: string): Boolean;
begin
  if FSaveToDBDibayarCommand = nil then
  begin
    FSaveToDBDibayarCommand := FConnection.CreateCommand;
    FSaveToDBDibayarCommand.RequestType := 'POST';
    FSaveToDBDibayarCommand.Text := 'TServerPenjualan."SaveToDBDibayar"';
    FSaveToDBDibayarCommand.Prepare(TServerPenjualan_SaveToDBDibayar);
  end;
  if not Assigned(APenjualan) then
    FSaveToDBDibayarCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveToDBDibayarCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveToDBDibayarCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(APenjualan), True);
      if FInstanceOwner then
        APenjualan.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveToDBDibayarCommand.Parameters[1].Value.SetDouble(ADibayar);
  FSaveToDBDibayarCommand.Execute(ARequestFilter);
  Result := FSaveToDBDibayarCommand.Parameters[2].Value.GetBoolean;
end;

function TServerPenjualanClient.DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string): Boolean;
begin
  if FDoJournalCommand = nil then
  begin
    FDoJournalCommand := FConnection.CreateCommand;
    FDoJournalCommand.RequestType := 'GET';
    FDoJournalCommand.Text := 'TServerPenjualan.DoJournal';
    FDoJournalCommand.Prepare(TServerPenjualan_DoJournal);
  end;
  FDoJournalCommand.Parameters[0].Value.SetWideString(ANoBukti);
  FDoJournalCommand.Parameters[1].Value.SetWideString(AModTransClass);
  FDoJournalCommand.Parameters[2].Value.SetInt32(AIsHapusJurnal);
  FDoJournalCommand.Execute(ARequestFilter);
  Result := FDoJournalCommand.Parameters[3].Value.GetBoolean;
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

function TServerPenjualanClient.RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataCommand = nil then
  begin
    FRetrieveDataCommand := FConnection.CreateCommand;
    FRetrieveDataCommand.RequestType := 'GET';
    FRetrieveDataCommand.Text := 'TServerPenjualan.RetrieveData';
    FRetrieveDataCommand.Prepare(TServerPenjualan_RetrieveData);
  end;
  FRetrieveDataCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataCommand.FreeOnExecute(Result);
end;

function TServerPenjualanClient.RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataCommand_Cache = nil then
  begin
    FRetrieveDataCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataCommand_Cache.RequestType := 'GET';
    FRetrieveDataCommand_Cache.Text := 'TServerPenjualan.RetrieveData';
    FRetrieveDataCommand_Cache.Prepare(TServerPenjualan_RetrieveData_Cache);
  end;
  FRetrieveDataCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataCommand_Cache.Parameters[3].Value.GetString);
end;

function TServerPenjualanClient.RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataSiapJurnalCommand = nil then
  begin
    FRetrieveDataSiapJurnalCommand := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand.Text := 'TServerPenjualan.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand.Prepare(TServerPenjualan_RetrieveDataSiapJurnal);
  end;
  FRetrieveDataSiapJurnalCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataSiapJurnalCommand.Parameters[2].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataSiapJurnalCommand.FreeOnExecute(Result);
end;

function TServerPenjualanClient.RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataSiapJurnalCommand_Cache = nil then
  begin
    FRetrieveDataSiapJurnalCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand_Cache.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand_Cache.Text := 'TServerPenjualan.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand_Cache.Prepare(TServerPenjualan_RetrieveDataSiapJurnal_Cache);
  end;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataSiapJurnalCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerPenjualanClient.RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand = nil then
  begin
    FRetrieveDataSlipCommand := FConnection.CreateCommand;
    FRetrieveDataSlipCommand.RequestType := 'GET';
    FRetrieveDataSlipCommand.Text := 'TServerPenjualan.RetrieveDataSlip';
    FRetrieveDataSlipCommand.Prepare(TServerPenjualan_RetrieveDataSlip);
  end;
  FRetrieveDataSlipCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand.Execute(ARequestFilter);
  if not FRetrieveDataSlipCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveDataSlipCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FRetrieveDataSlipCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveDataSlipCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerPenjualanClient.RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand_Cache = nil then
  begin
    FRetrieveDataSlipCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSlipCommand_Cache.RequestType := 'GET';
    FRetrieveDataSlipCommand_Cache.Text := 'TServerPenjualan.RetrieveDataSlip';
    FRetrieveDataSlipCommand_Cache.Prepare(TServerPenjualan_RetrieveDataSlip_Cache);
  end;
  FRetrieveDataSlipCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand_Cache.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FRetrieveDataSlipCommand_Cache.Parameters[4].Value.GetString);
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

function TServerPenjualanClient.DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteNoCommitCommand = nil then
  begin
    FDeleteNoCommitCommand := FConnection.CreateCommand;
    FDeleteNoCommitCommand.RequestType := 'POST';
    FDeleteNoCommitCommand.Text := 'TServerPenjualan."DeleteNoCommit"';
    FDeleteNoCommitCommand.Prepare(TServerPenjualan_DeleteNoCommit);
  end;
  if not Assigned(AAppObject) then
    FDeleteNoCommitCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteNoCommitCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteNoCommitCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteNoCommitCommand.Execute(ARequestFilter);
  Result := FDeleteNoCommitCommand.Parameters[1].Value.GetBoolean;
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
  FGetSaldoDepositCommand.DisposeOf;
  FGetPenjualanPeriodeCommand.DisposeOf;
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FRetrieveNoBuktiCommand.DisposeOf;
  FRetrieveNoBuktiCommand_Cache.DisposeOf;
  FRetrieveCDSlipCommand.DisposeOf;
  FRetrieveCDSlipCommand_Cache.DisposeOf;
  FSaveToDBDibayarCommand.DisposeOf;
  FDoJournalCommand.DisposeOf;
  FGenerateNoBuktiCommand.DisposeOf;
  FRetrieveDataCommand.DisposeOf;
  FRetrieveDataCommand_Cache.DisposeOf;
  FRetrieveDataSiapJurnalCommand.DisposeOf;
  FRetrieveDataSiapJurnalCommand_Cache.DisposeOf;
  FRetrieveDataSlipCommand.DisposeOf;
  FRetrieveDataSlipCommand_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FDeleteNoCommitCommand.DisposeOf;
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

function TServerARClient.RetrieveTransaksi(ATransaksi: string; AIDTransaksi: string; const ARequestFilter: string): TAR;
begin
  if FRetrieveTransaksiCommand = nil then
  begin
    FRetrieveTransaksiCommand := FConnection.CreateCommand;
    FRetrieveTransaksiCommand.RequestType := 'GET';
    FRetrieveTransaksiCommand.Text := 'TServerAR.RetrieveTransaksi';
    FRetrieveTransaksiCommand.Prepare(TServerAR_RetrieveTransaksi);
  end;
  FRetrieveTransaksiCommand.Parameters[0].Value.SetWideString(ATransaksi);
  FRetrieveTransaksiCommand.Parameters[1].Value.SetWideString(AIDTransaksi);
  FRetrieveTransaksiCommand.Execute(ARequestFilter);
  if not FRetrieveTransaksiCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveTransaksiCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TAR(FUnMarshal.UnMarshal(FRetrieveTransaksiCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveTransaksiCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerARClient.RetrieveTransaksi_Cache(ATransaksi: string; AIDTransaksi: string; const ARequestFilter: string): IDSRestCachedTAR;
begin
  if FRetrieveTransaksiCommand_Cache = nil then
  begin
    FRetrieveTransaksiCommand_Cache := FConnection.CreateCommand;
    FRetrieveTransaksiCommand_Cache.RequestType := 'GET';
    FRetrieveTransaksiCommand_Cache.Text := 'TServerAR.RetrieveTransaksi';
    FRetrieveTransaksiCommand_Cache.Prepare(TServerAR_RetrieveTransaksi_Cache);
  end;
  FRetrieveTransaksiCommand_Cache.Parameters[0].Value.SetWideString(ATransaksi);
  FRetrieveTransaksiCommand_Cache.Parameters[1].Value.SetWideString(AIDTransaksi);
  FRetrieveTransaksiCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTAR.Create(FRetrieveTransaksiCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerARClient.DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string): Boolean;
begin
  if FDoJournalCommand = nil then
  begin
    FDoJournalCommand := FConnection.CreateCommand;
    FDoJournalCommand.RequestType := 'GET';
    FDoJournalCommand.Text := 'TServerAR.DoJournal';
    FDoJournalCommand.Prepare(TServerAR_DoJournal);
  end;
  FDoJournalCommand.Parameters[0].Value.SetWideString(ANoBukti);
  FDoJournalCommand.Parameters[1].Value.SetWideString(AModTransClass);
  FDoJournalCommand.Parameters[2].Value.SetInt32(AIsHapusJurnal);
  FDoJournalCommand.Execute(ARequestFilter);
  Result := FDoJournalCommand.Parameters[3].Value.GetBoolean;
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

function TServerARClient.RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataCommand = nil then
  begin
    FRetrieveDataCommand := FConnection.CreateCommand;
    FRetrieveDataCommand.RequestType := 'GET';
    FRetrieveDataCommand.Text := 'TServerAR.RetrieveData';
    FRetrieveDataCommand.Prepare(TServerAR_RetrieveData);
  end;
  FRetrieveDataCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataCommand.FreeOnExecute(Result);
end;

function TServerARClient.RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataCommand_Cache = nil then
  begin
    FRetrieveDataCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataCommand_Cache.RequestType := 'GET';
    FRetrieveDataCommand_Cache.Text := 'TServerAR.RetrieveData';
    FRetrieveDataCommand_Cache.Prepare(TServerAR_RetrieveData_Cache);
  end;
  FRetrieveDataCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataCommand_Cache.Parameters[3].Value.GetString);
end;

function TServerARClient.RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataSiapJurnalCommand = nil then
  begin
    FRetrieveDataSiapJurnalCommand := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand.Text := 'TServerAR.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand.Prepare(TServerAR_RetrieveDataSiapJurnal);
  end;
  FRetrieveDataSiapJurnalCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataSiapJurnalCommand.Parameters[2].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataSiapJurnalCommand.FreeOnExecute(Result);
end;

function TServerARClient.RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataSiapJurnalCommand_Cache = nil then
  begin
    FRetrieveDataSiapJurnalCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand_Cache.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand_Cache.Text := 'TServerAR.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand_Cache.Prepare(TServerAR_RetrieveDataSiapJurnal_Cache);
  end;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataSiapJurnalCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerARClient.RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand = nil then
  begin
    FRetrieveDataSlipCommand := FConnection.CreateCommand;
    FRetrieveDataSlipCommand.RequestType := 'GET';
    FRetrieveDataSlipCommand.Text := 'TServerAR.RetrieveDataSlip';
    FRetrieveDataSlipCommand.Prepare(TServerAR_RetrieveDataSlip);
  end;
  FRetrieveDataSlipCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand.Execute(ARequestFilter);
  if not FRetrieveDataSlipCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveDataSlipCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FRetrieveDataSlipCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveDataSlipCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerARClient.RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand_Cache = nil then
  begin
    FRetrieveDataSlipCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSlipCommand_Cache.RequestType := 'GET';
    FRetrieveDataSlipCommand_Cache.Text := 'TServerAR.RetrieveDataSlip';
    FRetrieveDataSlipCommand_Cache.Prepare(TServerAR_RetrieveDataSlip_Cache);
  end;
  FRetrieveDataSlipCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand_Cache.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FRetrieveDataSlipCommand_Cache.Parameters[4].Value.GetString);
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

function TServerARClient.DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteNoCommitCommand = nil then
  begin
    FDeleteNoCommitCommand := FConnection.CreateCommand;
    FDeleteNoCommitCommand.RequestType := 'POST';
    FDeleteNoCommitCommand.Text := 'TServerAR."DeleteNoCommit"';
    FDeleteNoCommitCommand.Prepare(TServerAR_DeleteNoCommit);
  end;
  if not Assigned(AAppObject) then
    FDeleteNoCommitCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteNoCommitCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteNoCommitCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteNoCommitCommand.Execute(ARequestFilter);
  Result := FDeleteNoCommitCommand.Parameters[1].Value.GetBoolean;
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
  FRetrieveTransaksiCommand.DisposeOf;
  FRetrieveTransaksiCommand_Cache.DisposeOf;
  FDoJournalCommand.DisposeOf;
  FGenerateNoBuktiCommand.DisposeOf;
  FRetrieveDataCommand.DisposeOf;
  FRetrieveDataCommand_Cache.DisposeOf;
  FRetrieveDataSiapJurnalCommand.DisposeOf;
  FRetrieveDataSiapJurnalCommand_Cache.DisposeOf;
  FRetrieveDataSlipCommand.DisposeOf;
  FRetrieveDataSlipCommand_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FDeleteNoCommitCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

function TServerAPClient.Retrieve(AID: string; const ARequestFilter: string): TAP;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TServerAP.Retrieve';
    FRetrieveCommand.Prepare(TServerAP_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TAP(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerAPClient.Retrieve_Cache(AID: string; const ARequestFilter: string): IDSRestCachedTAP;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TServerAP.Retrieve';
    FRetrieveCommand_Cache.Prepare(TServerAP_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTAP.Create(FRetrieveCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerAPClient.RetrieveTransaksi(ATransaksi: string; AIDTransaksi: string; const ARequestFilter: string): TAP;
begin
  if FRetrieveTransaksiCommand = nil then
  begin
    FRetrieveTransaksiCommand := FConnection.CreateCommand;
    FRetrieveTransaksiCommand.RequestType := 'GET';
    FRetrieveTransaksiCommand.Text := 'TServerAP.RetrieveTransaksi';
    FRetrieveTransaksiCommand.Prepare(TServerAP_RetrieveTransaksi);
  end;
  FRetrieveTransaksiCommand.Parameters[0].Value.SetWideString(ATransaksi);
  FRetrieveTransaksiCommand.Parameters[1].Value.SetWideString(AIDTransaksi);
  FRetrieveTransaksiCommand.Execute(ARequestFilter);
  if not FRetrieveTransaksiCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveTransaksiCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TAP(FUnMarshal.UnMarshal(FRetrieveTransaksiCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveTransaksiCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerAPClient.RetrieveTransaksi_Cache(ATransaksi: string; AIDTransaksi: string; const ARequestFilter: string): IDSRestCachedTAP;
begin
  if FRetrieveTransaksiCommand_Cache = nil then
  begin
    FRetrieveTransaksiCommand_Cache := FConnection.CreateCommand;
    FRetrieveTransaksiCommand_Cache.RequestType := 'GET';
    FRetrieveTransaksiCommand_Cache.Text := 'TServerAP.RetrieveTransaksi';
    FRetrieveTransaksiCommand_Cache.Prepare(TServerAP_RetrieveTransaksi_Cache);
  end;
  FRetrieveTransaksiCommand_Cache.Parameters[0].Value.SetWideString(ATransaksi);
  FRetrieveTransaksiCommand_Cache.Parameters[1].Value.SetWideString(AIDTransaksi);
  FRetrieveTransaksiCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTAP.Create(FRetrieveTransaksiCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerAPClient.DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string): Boolean;
begin
  if FDoJournalCommand = nil then
  begin
    FDoJournalCommand := FConnection.CreateCommand;
    FDoJournalCommand.RequestType := 'GET';
    FDoJournalCommand.Text := 'TServerAP.DoJournal';
    FDoJournalCommand.Prepare(TServerAP_DoJournal);
  end;
  FDoJournalCommand.Parameters[0].Value.SetWideString(ANoBukti);
  FDoJournalCommand.Parameters[1].Value.SetWideString(AModTransClass);
  FDoJournalCommand.Parameters[2].Value.SetInt32(AIsHapusJurnal);
  FDoJournalCommand.Execute(ARequestFilter);
  Result := FDoJournalCommand.Parameters[3].Value.GetBoolean;
end;

function TServerAPClient.GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string): string;
begin
  if FGenerateNoBuktiCommand = nil then
  begin
    FGenerateNoBuktiCommand := FConnection.CreateCommand;
    FGenerateNoBuktiCommand.RequestType := 'GET';
    FGenerateNoBuktiCommand.Text := 'TServerAP.GenerateNoBukti';
    FGenerateNoBuktiCommand.Prepare(TServerAP_GenerateNoBukti);
  end;
  FGenerateNoBuktiCommand.Parameters[0].Value.AsDateTime := ATglBukti;
  FGenerateNoBuktiCommand.Parameters[1].Value.SetWideString(APrefix);
  FGenerateNoBuktiCommand.Execute(ARequestFilter);
  Result := FGenerateNoBuktiCommand.Parameters[2].Value.GetWideString;
end;

function TServerAPClient.RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataCommand = nil then
  begin
    FRetrieveDataCommand := FConnection.CreateCommand;
    FRetrieveDataCommand.RequestType := 'GET';
    FRetrieveDataCommand.Text := 'TServerAP.RetrieveData';
    FRetrieveDataCommand.Prepare(TServerAP_RetrieveData);
  end;
  FRetrieveDataCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataCommand.FreeOnExecute(Result);
end;

function TServerAPClient.RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataCommand_Cache = nil then
  begin
    FRetrieveDataCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataCommand_Cache.RequestType := 'GET';
    FRetrieveDataCommand_Cache.Text := 'TServerAP.RetrieveData';
    FRetrieveDataCommand_Cache.Prepare(TServerAP_RetrieveData_Cache);
  end;
  FRetrieveDataCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataCommand_Cache.Parameters[3].Value.GetString);
end;

function TServerAPClient.RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataSiapJurnalCommand = nil then
  begin
    FRetrieveDataSiapJurnalCommand := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand.Text := 'TServerAP.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand.Prepare(TServerAP_RetrieveDataSiapJurnal);
  end;
  FRetrieveDataSiapJurnalCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataSiapJurnalCommand.Parameters[2].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataSiapJurnalCommand.FreeOnExecute(Result);
end;

function TServerAPClient.RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataSiapJurnalCommand_Cache = nil then
  begin
    FRetrieveDataSiapJurnalCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand_Cache.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand_Cache.Text := 'TServerAP.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand_Cache.Prepare(TServerAP_RetrieveDataSiapJurnal_Cache);
  end;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataSiapJurnalCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerAPClient.RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand = nil then
  begin
    FRetrieveDataSlipCommand := FConnection.CreateCommand;
    FRetrieveDataSlipCommand.RequestType := 'GET';
    FRetrieveDataSlipCommand.Text := 'TServerAP.RetrieveDataSlip';
    FRetrieveDataSlipCommand.Prepare(TServerAP_RetrieveDataSlip);
  end;
  FRetrieveDataSlipCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand.Execute(ARequestFilter);
  if not FRetrieveDataSlipCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveDataSlipCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FRetrieveDataSlipCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveDataSlipCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerAPClient.RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand_Cache = nil then
  begin
    FRetrieveDataSlipCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSlipCommand_Cache.RequestType := 'GET';
    FRetrieveDataSlipCommand_Cache.Text := 'TServerAP.RetrieveDataSlip';
    FRetrieveDataSlipCommand_Cache.Prepare(TServerAP_RetrieveDataSlip_Cache);
  end;
  FRetrieveDataSlipCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand_Cache.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FRetrieveDataSlipCommand_Cache.Parameters[4].Value.GetString);
end;

function TServerAPClient.Delete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FConnection.CreateCommand;
    FDeleteCommand.RequestType := 'POST';
    FDeleteCommand.Text := 'TServerAP."Delete"';
    FDeleteCommand.Prepare(TServerAP_Delete);
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

function TServerAPClient.DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteNoCommitCommand = nil then
  begin
    FDeleteNoCommitCommand := FConnection.CreateCommand;
    FDeleteNoCommitCommand.RequestType := 'POST';
    FDeleteNoCommitCommand.Text := 'TServerAP."DeleteNoCommit"';
    FDeleteNoCommitCommand.Prepare(TServerAP_DeleteNoCommit);
  end;
  if not Assigned(AAppObject) then
    FDeleteNoCommitCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteNoCommitCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteNoCommitCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteNoCommitCommand.Execute(ARequestFilter);
  Result := FDeleteNoCommitCommand.Parameters[1].Value.GetBoolean;
end;

function TServerAPClient.RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSCommand = nil then
  begin
    FRetrieveCDSCommand := FConnection.CreateCommand;
    FRetrieveCDSCommand.RequestType := 'POST';
    FRetrieveCDSCommand.Text := 'TServerAP."RetrieveCDS"';
    FRetrieveCDSCommand.Prepare(TServerAP_RetrieveCDS);
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

function TServerAPClient.RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSCommand_Cache = nil then
  begin
    FRetrieveCDSCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSCommand_Cache.RequestType := 'POST';
    FRetrieveCDSCommand_Cache.Text := 'TServerAP."RetrieveCDS"';
    FRetrieveCDSCommand_Cache.Prepare(TServerAP_RetrieveCDS_Cache);
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

function TServerAPClient.Save(AOBject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FSaveCommand = nil then
  begin
    FSaveCommand := FConnection.CreateCommand;
    FSaveCommand.RequestType := 'POST';
    FSaveCommand.Text := 'TServerAP."Save"';
    FSaveCommand.Prepare(TServerAP_Save);
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

constructor TServerAPClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerAPClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerAPClient.Destroy;
begin
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FRetrieveTransaksiCommand.DisposeOf;
  FRetrieveTransaksiCommand_Cache.DisposeOf;
  FDoJournalCommand.DisposeOf;
  FGenerateNoBuktiCommand.DisposeOf;
  FRetrieveDataCommand.DisposeOf;
  FRetrieveDataCommand_Cache.DisposeOf;
  FRetrieveDataSiapJurnalCommand.DisposeOf;
  FRetrieveDataSiapJurnalCommand_Cache.DisposeOf;
  FRetrieveDataSlipCommand.DisposeOf;
  FRetrieveDataSlipCommand_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FDeleteNoCommitCommand.DisposeOf;
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

function TServerAccountClient.DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteNoCommitCommand = nil then
  begin
    FDeleteNoCommitCommand := FConnection.CreateCommand;
    FDeleteNoCommitCommand.RequestType := 'POST';
    FDeleteNoCommitCommand.Text := 'TServerAccount."DeleteNoCommit"';
    FDeleteNoCommitCommand.Prepare(TServerAccount_DeleteNoCommit);
  end;
  if not Assigned(AAppObject) then
    FDeleteNoCommitCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteNoCommitCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteNoCommitCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteNoCommitCommand.Execute(ARequestFilter);
  Result := FDeleteNoCommitCommand.Parameters[1].Value.GetBoolean;
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
  FDeleteNoCommitCommand.DisposeOf;
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

function TServerRekBankClient.RetrieveRek(ANorek: string; const ARequestFilter: string): TRekBank;
begin
  if FRetrieveRekCommand = nil then
  begin
    FRetrieveRekCommand := FConnection.CreateCommand;
    FRetrieveRekCommand.RequestType := 'GET';
    FRetrieveRekCommand.Text := 'TServerRekBank.RetrieveRek';
    FRetrieveRekCommand.Prepare(TServerRekBank_RetrieveRek);
  end;
  FRetrieveRekCommand.Parameters[0].Value.SetWideString(ANorek);
  FRetrieveRekCommand.Execute(ARequestFilter);
  if not FRetrieveRekCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveRekCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TRekBank(FUnMarshal.UnMarshal(FRetrieveRekCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveRekCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerRekBankClient.RetrieveRek_Cache(ANorek: string; const ARequestFilter: string): IDSRestCachedTRekBank;
begin
  if FRetrieveRekCommand_Cache = nil then
  begin
    FRetrieveRekCommand_Cache := FConnection.CreateCommand;
    FRetrieveRekCommand_Cache.RequestType := 'GET';
    FRetrieveRekCommand_Cache.Text := 'TServerRekBank.RetrieveRek';
    FRetrieveRekCommand_Cache.Prepare(TServerRekBank_RetrieveRek_Cache);
  end;
  FRetrieveRekCommand_Cache.Parameters[0].Value.SetWideString(ANorek);
  FRetrieveRekCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTRekBank.Create(FRetrieveRekCommand_Cache.Parameters[1].Value.GetString);
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

function TServerRekBankClient.DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteNoCommitCommand = nil then
  begin
    FDeleteNoCommitCommand := FConnection.CreateCommand;
    FDeleteNoCommitCommand.RequestType := 'POST';
    FDeleteNoCommitCommand.Text := 'TServerRekBank."DeleteNoCommit"';
    FDeleteNoCommitCommand.Prepare(TServerRekBank_DeleteNoCommit);
  end;
  if not Assigned(AAppObject) then
    FDeleteNoCommitCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteNoCommitCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteNoCommitCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteNoCommitCommand.Execute(ARequestFilter);
  Result := FDeleteNoCommitCommand.Parameters[1].Value.GetBoolean;
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
  FRetrieveRekCommand.DisposeOf;
  FRetrieveRekCommand_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FDeleteNoCommitCommand.DisposeOf;
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

function TServerPenerimaanKasClient.BeforeDelete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FBeforeDeleteCommand = nil then
  begin
    FBeforeDeleteCommand := FConnection.CreateCommand;
    FBeforeDeleteCommand.RequestType := 'POST';
    FBeforeDeleteCommand.Text := 'TServerPenerimaanKas."BeforeDelete"';
    FBeforeDeleteCommand.Prepare(TServerPenerimaanKas_BeforeDelete);
  end;
  if not Assigned(AAppObject) then
    FBeforeDeleteCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FBeforeDeleteCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FBeforeDeleteCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FBeforeDeleteCommand.Execute(ARequestFilter);
  Result := FBeforeDeleteCommand.Parameters[1].Value.GetBoolean;
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

function TServerPenerimaanKasClient.RetrieveCDSlip(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; ANoBukti: string; const ARequestFilter: string): TFDJSONDataSets;
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
  if not FRetrieveCDSlipCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCDSlipCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FRetrieveCDSlipCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCDSlipCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerPenerimaanKasClient.RetrieveCDSlip_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; ANoBukti: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
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
  Result := TDSRestCachedTFDJSONDataSets.Create(FRetrieveCDSlipCommand_Cache.Parameters[4].Value.GetString);
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

function TServerPenerimaanKasClient.DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string): Boolean;
begin
  if FDoJournalCommand = nil then
  begin
    FDoJournalCommand := FConnection.CreateCommand;
    FDoJournalCommand.RequestType := 'GET';
    FDoJournalCommand.Text := 'TServerPenerimaanKas.DoJournal';
    FDoJournalCommand.Prepare(TServerPenerimaanKas_DoJournal);
  end;
  FDoJournalCommand.Parameters[0].Value.SetWideString(ANoBukti);
  FDoJournalCommand.Parameters[1].Value.SetWideString(AModTransClass);
  FDoJournalCommand.Parameters[2].Value.SetInt32(AIsHapusJurnal);
  FDoJournalCommand.Execute(ARequestFilter);
  Result := FDoJournalCommand.Parameters[3].Value.GetBoolean;
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

function TServerPenerimaanKasClient.RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataCommand = nil then
  begin
    FRetrieveDataCommand := FConnection.CreateCommand;
    FRetrieveDataCommand.RequestType := 'GET';
    FRetrieveDataCommand.Text := 'TServerPenerimaanKas.RetrieveData';
    FRetrieveDataCommand.Prepare(TServerPenerimaanKas_RetrieveData);
  end;
  FRetrieveDataCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataCommand.FreeOnExecute(Result);
end;

function TServerPenerimaanKasClient.RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataCommand_Cache = nil then
  begin
    FRetrieveDataCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataCommand_Cache.RequestType := 'GET';
    FRetrieveDataCommand_Cache.Text := 'TServerPenerimaanKas.RetrieveData';
    FRetrieveDataCommand_Cache.Prepare(TServerPenerimaanKas_RetrieveData_Cache);
  end;
  FRetrieveDataCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataCommand_Cache.Parameters[3].Value.GetString);
end;

function TServerPenerimaanKasClient.RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataSiapJurnalCommand = nil then
  begin
    FRetrieveDataSiapJurnalCommand := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand.Text := 'TServerPenerimaanKas.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand.Prepare(TServerPenerimaanKas_RetrieveDataSiapJurnal);
  end;
  FRetrieveDataSiapJurnalCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataSiapJurnalCommand.Parameters[2].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataSiapJurnalCommand.FreeOnExecute(Result);
end;

function TServerPenerimaanKasClient.RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataSiapJurnalCommand_Cache = nil then
  begin
    FRetrieveDataSiapJurnalCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand_Cache.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand_Cache.Text := 'TServerPenerimaanKas.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand_Cache.Prepare(TServerPenerimaanKas_RetrieveDataSiapJurnal_Cache);
  end;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataSiapJurnalCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerPenerimaanKasClient.RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand = nil then
  begin
    FRetrieveDataSlipCommand := FConnection.CreateCommand;
    FRetrieveDataSlipCommand.RequestType := 'GET';
    FRetrieveDataSlipCommand.Text := 'TServerPenerimaanKas.RetrieveDataSlip';
    FRetrieveDataSlipCommand.Prepare(TServerPenerimaanKas_RetrieveDataSlip);
  end;
  FRetrieveDataSlipCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand.Execute(ARequestFilter);
  if not FRetrieveDataSlipCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveDataSlipCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FRetrieveDataSlipCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveDataSlipCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerPenerimaanKasClient.RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand_Cache = nil then
  begin
    FRetrieveDataSlipCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSlipCommand_Cache.RequestType := 'GET';
    FRetrieveDataSlipCommand_Cache.Text := 'TServerPenerimaanKas.RetrieveDataSlip';
    FRetrieveDataSlipCommand_Cache.Prepare(TServerPenerimaanKas_RetrieveDataSlip_Cache);
  end;
  FRetrieveDataSlipCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand_Cache.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FRetrieveDataSlipCommand_Cache.Parameters[4].Value.GetString);
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

function TServerPenerimaanKasClient.DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteNoCommitCommand = nil then
  begin
    FDeleteNoCommitCommand := FConnection.CreateCommand;
    FDeleteNoCommitCommand.RequestType := 'POST';
    FDeleteNoCommitCommand.Text := 'TServerPenerimaanKas."DeleteNoCommit"';
    FDeleteNoCommitCommand.Prepare(TServerPenerimaanKas_DeleteNoCommit);
  end;
  if not Assigned(AAppObject) then
    FDeleteNoCommitCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteNoCommitCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteNoCommitCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteNoCommitCommand.Execute(ARequestFilter);
  Result := FDeleteNoCommitCommand.Parameters[1].Value.GetBoolean;
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
  FBeforeDeleteCommand.DisposeOf;
  FBeforeSaveCommand.DisposeOf;
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FRetrievePenerimaanARsCommand.DisposeOf;
  FRetrievePenerimaanARsCommand_Cache.DisposeOf;
  FRetrieveCDSlipCommand.DisposeOf;
  FRetrieveCDSlipCommand_Cache.DisposeOf;
  FRetrieveNoBuktiCommand.DisposeOf;
  FRetrieveNoBuktiCommand_Cache.DisposeOf;
  FDoJournalCommand.DisposeOf;
  FGenerateNoBuktiCommand.DisposeOf;
  FRetrieveDataCommand.DisposeOf;
  FRetrieveDataCommand_Cache.DisposeOf;
  FRetrieveDataSiapJurnalCommand.DisposeOf;
  FRetrieveDataSiapJurnalCommand_Cache.DisposeOf;
  FRetrieveDataSlipCommand.DisposeOf;
  FRetrieveDataSlipCommand_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FDeleteNoCommitCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

function TServerPengeluaranKasClient.AfterSave(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FAfterSaveCommand = nil then
  begin
    FAfterSaveCommand := FConnection.CreateCommand;
    FAfterSaveCommand.RequestType := 'POST';
    FAfterSaveCommand.Text := 'TServerPengeluaranKas."AfterSave"';
    FAfterSaveCommand.Prepare(TServerPengeluaranKas_AfterSave);
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

function TServerPengeluaranKasClient.BeforeDelete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FBeforeDeleteCommand = nil then
  begin
    FBeforeDeleteCommand := FConnection.CreateCommand;
    FBeforeDeleteCommand.RequestType := 'POST';
    FBeforeDeleteCommand.Text := 'TServerPengeluaranKas."BeforeDelete"';
    FBeforeDeleteCommand.Prepare(TServerPengeluaranKas_BeforeDelete);
  end;
  if not Assigned(AAppObject) then
    FBeforeDeleteCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FBeforeDeleteCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FBeforeDeleteCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FBeforeDeleteCommand.Execute(ARequestFilter);
  Result := FBeforeDeleteCommand.Parameters[1].Value.GetBoolean;
end;

function TServerPengeluaranKasClient.BeforeSave(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FBeforeSaveCommand = nil then
  begin
    FBeforeSaveCommand := FConnection.CreateCommand;
    FBeforeSaveCommand.RequestType := 'POST';
    FBeforeSaveCommand.Text := 'TServerPengeluaranKas."BeforeSave"';
    FBeforeSaveCommand.Prepare(TServerPengeluaranKas_BeforeSave);
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

function TServerPengeluaranKasClient.Retrieve(AID: string; const ARequestFilter: string): TPengeluaranKas;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TServerPengeluaranKas.Retrieve';
    FRetrieveCommand.Prepare(TServerPengeluaranKas_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TPengeluaranKas(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerPengeluaranKasClient.Retrieve_Cache(AID: string; const ARequestFilter: string): IDSRestCachedTPengeluaranKas;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TServerPengeluaranKas.Retrieve';
    FRetrieveCommand_Cache.Prepare(TServerPengeluaranKas_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTPengeluaranKas.Create(FRetrieveCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerPengeluaranKasClient.RetrievePenerimaanAPs(AID: string; const ARequestFilter: string): TDataSet;
begin
  if FRetrievePenerimaanAPsCommand = nil then
  begin
    FRetrievePenerimaanAPsCommand := FConnection.CreateCommand;
    FRetrievePenerimaanAPsCommand.RequestType := 'GET';
    FRetrievePenerimaanAPsCommand.Text := 'TServerPengeluaranKas.RetrievePenerimaanAPs';
    FRetrievePenerimaanAPsCommand.Prepare(TServerPengeluaranKas_RetrievePenerimaanAPs);
  end;
  FRetrievePenerimaanAPsCommand.Parameters[0].Value.SetWideString(AID);
  FRetrievePenerimaanAPsCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrievePenerimaanAPsCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrievePenerimaanAPsCommand.FreeOnExecute(Result);
end;

function TServerPengeluaranKasClient.RetrievePenerimaanAPs_Cache(AID: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrievePenerimaanAPsCommand_Cache = nil then
  begin
    FRetrievePenerimaanAPsCommand_Cache := FConnection.CreateCommand;
    FRetrievePenerimaanAPsCommand_Cache.RequestType := 'GET';
    FRetrievePenerimaanAPsCommand_Cache.Text := 'TServerPengeluaranKas.RetrievePenerimaanAPs';
    FRetrievePenerimaanAPsCommand_Cache.Prepare(TServerPengeluaranKas_RetrievePenerimaanAPs_Cache);
  end;
  FRetrievePenerimaanAPsCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrievePenerimaanAPsCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrievePenerimaanAPsCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerPengeluaranKasClient.RetrieveCDSlip(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; ANoBukti: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FRetrieveCDSlipCommand = nil then
  begin
    FRetrieveCDSlipCommand := FConnection.CreateCommand;
    FRetrieveCDSlipCommand.RequestType := 'POST';
    FRetrieveCDSlipCommand.Text := 'TServerPengeluaranKas."RetrieveCDSlip"';
    FRetrieveCDSlipCommand.Prepare(TServerPengeluaranKas_RetrieveCDSlip);
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
  if not FRetrieveCDSlipCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCDSlipCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FRetrieveCDSlipCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCDSlipCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerPengeluaranKasClient.RetrieveCDSlip_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; ANoBukti: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FRetrieveCDSlipCommand_Cache = nil then
  begin
    FRetrieveCDSlipCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSlipCommand_Cache.RequestType := 'POST';
    FRetrieveCDSlipCommand_Cache.Text := 'TServerPengeluaranKas."RetrieveCDSlip"';
    FRetrieveCDSlipCommand_Cache.Prepare(TServerPengeluaranKas_RetrieveCDSlip_Cache);
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
  Result := TDSRestCachedTFDJSONDataSets.Create(FRetrieveCDSlipCommand_Cache.Parameters[4].Value.GetString);
end;

function TServerPengeluaranKasClient.RetrieveNoBukti(ANoBukti: string; const ARequestFilter: string): TPengeluaranKas;
begin
  if FRetrieveNoBuktiCommand = nil then
  begin
    FRetrieveNoBuktiCommand := FConnection.CreateCommand;
    FRetrieveNoBuktiCommand.RequestType := 'GET';
    FRetrieveNoBuktiCommand.Text := 'TServerPengeluaranKas.RetrieveNoBukti';
    FRetrieveNoBuktiCommand.Prepare(TServerPengeluaranKas_RetrieveNoBukti);
  end;
  FRetrieveNoBuktiCommand.Parameters[0].Value.SetWideString(ANoBukti);
  FRetrieveNoBuktiCommand.Execute(ARequestFilter);
  if not FRetrieveNoBuktiCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveNoBuktiCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TPengeluaranKas(FUnMarshal.UnMarshal(FRetrieveNoBuktiCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveNoBuktiCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerPengeluaranKasClient.RetrieveNoBukti_Cache(ANoBukti: string; const ARequestFilter: string): IDSRestCachedTPengeluaranKas;
begin
  if FRetrieveNoBuktiCommand_Cache = nil then
  begin
    FRetrieveNoBuktiCommand_Cache := FConnection.CreateCommand;
    FRetrieveNoBuktiCommand_Cache.RequestType := 'GET';
    FRetrieveNoBuktiCommand_Cache.Text := 'TServerPengeluaranKas.RetrieveNoBukti';
    FRetrieveNoBuktiCommand_Cache.Prepare(TServerPengeluaranKas_RetrieveNoBukti_Cache);
  end;
  FRetrieveNoBuktiCommand_Cache.Parameters[0].Value.SetWideString(ANoBukti);
  FRetrieveNoBuktiCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTPengeluaranKas.Create(FRetrieveNoBuktiCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerPengeluaranKasClient.DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string): Boolean;
begin
  if FDoJournalCommand = nil then
  begin
    FDoJournalCommand := FConnection.CreateCommand;
    FDoJournalCommand.RequestType := 'GET';
    FDoJournalCommand.Text := 'TServerPengeluaranKas.DoJournal';
    FDoJournalCommand.Prepare(TServerPengeluaranKas_DoJournal);
  end;
  FDoJournalCommand.Parameters[0].Value.SetWideString(ANoBukti);
  FDoJournalCommand.Parameters[1].Value.SetWideString(AModTransClass);
  FDoJournalCommand.Parameters[2].Value.SetInt32(AIsHapusJurnal);
  FDoJournalCommand.Execute(ARequestFilter);
  Result := FDoJournalCommand.Parameters[3].Value.GetBoolean;
end;

function TServerPengeluaranKasClient.GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string): string;
begin
  if FGenerateNoBuktiCommand = nil then
  begin
    FGenerateNoBuktiCommand := FConnection.CreateCommand;
    FGenerateNoBuktiCommand.RequestType := 'GET';
    FGenerateNoBuktiCommand.Text := 'TServerPengeluaranKas.GenerateNoBukti';
    FGenerateNoBuktiCommand.Prepare(TServerPengeluaranKas_GenerateNoBukti);
  end;
  FGenerateNoBuktiCommand.Parameters[0].Value.AsDateTime := ATglBukti;
  FGenerateNoBuktiCommand.Parameters[1].Value.SetWideString(APrefix);
  FGenerateNoBuktiCommand.Execute(ARequestFilter);
  Result := FGenerateNoBuktiCommand.Parameters[2].Value.GetWideString;
end;

function TServerPengeluaranKasClient.RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataCommand = nil then
  begin
    FRetrieveDataCommand := FConnection.CreateCommand;
    FRetrieveDataCommand.RequestType := 'GET';
    FRetrieveDataCommand.Text := 'TServerPengeluaranKas.RetrieveData';
    FRetrieveDataCommand.Prepare(TServerPengeluaranKas_RetrieveData);
  end;
  FRetrieveDataCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataCommand.FreeOnExecute(Result);
end;

function TServerPengeluaranKasClient.RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataCommand_Cache = nil then
  begin
    FRetrieveDataCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataCommand_Cache.RequestType := 'GET';
    FRetrieveDataCommand_Cache.Text := 'TServerPengeluaranKas.RetrieveData';
    FRetrieveDataCommand_Cache.Prepare(TServerPengeluaranKas_RetrieveData_Cache);
  end;
  FRetrieveDataCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataCommand_Cache.Parameters[3].Value.GetString);
end;

function TServerPengeluaranKasClient.RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataSiapJurnalCommand = nil then
  begin
    FRetrieveDataSiapJurnalCommand := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand.Text := 'TServerPengeluaranKas.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand.Prepare(TServerPengeluaranKas_RetrieveDataSiapJurnal);
  end;
  FRetrieveDataSiapJurnalCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataSiapJurnalCommand.Parameters[2].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataSiapJurnalCommand.FreeOnExecute(Result);
end;

function TServerPengeluaranKasClient.RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataSiapJurnalCommand_Cache = nil then
  begin
    FRetrieveDataSiapJurnalCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand_Cache.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand_Cache.Text := 'TServerPengeluaranKas.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand_Cache.Prepare(TServerPengeluaranKas_RetrieveDataSiapJurnal_Cache);
  end;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataSiapJurnalCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerPengeluaranKasClient.RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand = nil then
  begin
    FRetrieveDataSlipCommand := FConnection.CreateCommand;
    FRetrieveDataSlipCommand.RequestType := 'GET';
    FRetrieveDataSlipCommand.Text := 'TServerPengeluaranKas.RetrieveDataSlip';
    FRetrieveDataSlipCommand.Prepare(TServerPengeluaranKas_RetrieveDataSlip);
  end;
  FRetrieveDataSlipCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand.Execute(ARequestFilter);
  if not FRetrieveDataSlipCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveDataSlipCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FRetrieveDataSlipCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveDataSlipCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerPengeluaranKasClient.RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand_Cache = nil then
  begin
    FRetrieveDataSlipCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSlipCommand_Cache.RequestType := 'GET';
    FRetrieveDataSlipCommand_Cache.Text := 'TServerPengeluaranKas.RetrieveDataSlip';
    FRetrieveDataSlipCommand_Cache.Prepare(TServerPengeluaranKas_RetrieveDataSlip_Cache);
  end;
  FRetrieveDataSlipCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand_Cache.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FRetrieveDataSlipCommand_Cache.Parameters[4].Value.GetString);
end;

function TServerPengeluaranKasClient.Delete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FConnection.CreateCommand;
    FDeleteCommand.RequestType := 'POST';
    FDeleteCommand.Text := 'TServerPengeluaranKas."Delete"';
    FDeleteCommand.Prepare(TServerPengeluaranKas_Delete);
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

function TServerPengeluaranKasClient.DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteNoCommitCommand = nil then
  begin
    FDeleteNoCommitCommand := FConnection.CreateCommand;
    FDeleteNoCommitCommand.RequestType := 'POST';
    FDeleteNoCommitCommand.Text := 'TServerPengeluaranKas."DeleteNoCommit"';
    FDeleteNoCommitCommand.Prepare(TServerPengeluaranKas_DeleteNoCommit);
  end;
  if not Assigned(AAppObject) then
    FDeleteNoCommitCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteNoCommitCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteNoCommitCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteNoCommitCommand.Execute(ARequestFilter);
  Result := FDeleteNoCommitCommand.Parameters[1].Value.GetBoolean;
end;

function TServerPengeluaranKasClient.RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSCommand = nil then
  begin
    FRetrieveCDSCommand := FConnection.CreateCommand;
    FRetrieveCDSCommand.RequestType := 'POST';
    FRetrieveCDSCommand.Text := 'TServerPengeluaranKas."RetrieveCDS"';
    FRetrieveCDSCommand.Prepare(TServerPengeluaranKas_RetrieveCDS);
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

function TServerPengeluaranKasClient.RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSCommand_Cache = nil then
  begin
    FRetrieveCDSCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSCommand_Cache.RequestType := 'POST';
    FRetrieveCDSCommand_Cache.Text := 'TServerPengeluaranKas."RetrieveCDS"';
    FRetrieveCDSCommand_Cache.Prepare(TServerPengeluaranKas_RetrieveCDS_Cache);
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

function TServerPengeluaranKasClient.Save(AOBject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FSaveCommand = nil then
  begin
    FSaveCommand := FConnection.CreateCommand;
    FSaveCommand.RequestType := 'POST';
    FSaveCommand.Text := 'TServerPengeluaranKas."Save"';
    FSaveCommand.Prepare(TServerPengeluaranKas_Save);
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

constructor TServerPengeluaranKasClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerPengeluaranKasClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerPengeluaranKasClient.Destroy;
begin
  FAfterSaveCommand.DisposeOf;
  FBeforeDeleteCommand.DisposeOf;
  FBeforeSaveCommand.DisposeOf;
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FRetrievePenerimaanAPsCommand.DisposeOf;
  FRetrievePenerimaanAPsCommand_Cache.DisposeOf;
  FRetrieveCDSlipCommand.DisposeOf;
  FRetrieveCDSlipCommand_Cache.DisposeOf;
  FRetrieveNoBuktiCommand.DisposeOf;
  FRetrieveNoBuktiCommand_Cache.DisposeOf;
  FDoJournalCommand.DisposeOf;
  FGenerateNoBuktiCommand.DisposeOf;
  FRetrieveDataCommand.DisposeOf;
  FRetrieveDataCommand_Cache.DisposeOf;
  FRetrieveDataSiapJurnalCommand.DisposeOf;
  FRetrieveDataSiapJurnalCommand_Cache.DisposeOf;
  FRetrieveDataSlipCommand.DisposeOf;
  FRetrieveDataSlipCommand_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FDeleteNoCommitCommand.DisposeOf;
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

function TServerSettingAppClient.DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteNoCommitCommand = nil then
  begin
    FDeleteNoCommitCommand := FConnection.CreateCommand;
    FDeleteNoCommitCommand.RequestType := 'POST';
    FDeleteNoCommitCommand.Text := 'TServerSettingApp."DeleteNoCommit"';
    FDeleteNoCommitCommand.Prepare(TServerSettingApp_DeleteNoCommit);
  end;
  if not Assigned(AAppObject) then
    FDeleteNoCommitCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteNoCommitCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteNoCommitCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteNoCommitCommand.Execute(ARequestFilter);
  Result := FDeleteNoCommitCommand.Parameters[1].Value.GetBoolean;
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
  FDeleteNoCommitCommand.DisposeOf;
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

function TServerTransferAntarGudangClient.DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string): Boolean;
begin
  if FDoJournalCommand = nil then
  begin
    FDoJournalCommand := FConnection.CreateCommand;
    FDoJournalCommand.RequestType := 'GET';
    FDoJournalCommand.Text := 'TServerTransferAntarGudang.DoJournal';
    FDoJournalCommand.Prepare(TServerTransferAntarGudang_DoJournal);
  end;
  FDoJournalCommand.Parameters[0].Value.SetWideString(ANoBukti);
  FDoJournalCommand.Parameters[1].Value.SetWideString(AModTransClass);
  FDoJournalCommand.Parameters[2].Value.SetInt32(AIsHapusJurnal);
  FDoJournalCommand.Execute(ARequestFilter);
  Result := FDoJournalCommand.Parameters[3].Value.GetBoolean;
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

function TServerTransferAntarGudangClient.RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataCommand = nil then
  begin
    FRetrieveDataCommand := FConnection.CreateCommand;
    FRetrieveDataCommand.RequestType := 'GET';
    FRetrieveDataCommand.Text := 'TServerTransferAntarGudang.RetrieveData';
    FRetrieveDataCommand.Prepare(TServerTransferAntarGudang_RetrieveData);
  end;
  FRetrieveDataCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataCommand.FreeOnExecute(Result);
end;

function TServerTransferAntarGudangClient.RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataCommand_Cache = nil then
  begin
    FRetrieveDataCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataCommand_Cache.RequestType := 'GET';
    FRetrieveDataCommand_Cache.Text := 'TServerTransferAntarGudang.RetrieveData';
    FRetrieveDataCommand_Cache.Prepare(TServerTransferAntarGudang_RetrieveData_Cache);
  end;
  FRetrieveDataCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataCommand_Cache.Parameters[3].Value.GetString);
end;

function TServerTransferAntarGudangClient.RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataSiapJurnalCommand = nil then
  begin
    FRetrieveDataSiapJurnalCommand := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand.Text := 'TServerTransferAntarGudang.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand.Prepare(TServerTransferAntarGudang_RetrieveDataSiapJurnal);
  end;
  FRetrieveDataSiapJurnalCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataSiapJurnalCommand.Parameters[2].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataSiapJurnalCommand.FreeOnExecute(Result);
end;

function TServerTransferAntarGudangClient.RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataSiapJurnalCommand_Cache = nil then
  begin
    FRetrieveDataSiapJurnalCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand_Cache.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand_Cache.Text := 'TServerTransferAntarGudang.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand_Cache.Prepare(TServerTransferAntarGudang_RetrieveDataSiapJurnal_Cache);
  end;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataSiapJurnalCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerTransferAntarGudangClient.RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand = nil then
  begin
    FRetrieveDataSlipCommand := FConnection.CreateCommand;
    FRetrieveDataSlipCommand.RequestType := 'GET';
    FRetrieveDataSlipCommand.Text := 'TServerTransferAntarGudang.RetrieveDataSlip';
    FRetrieveDataSlipCommand.Prepare(TServerTransferAntarGudang_RetrieveDataSlip);
  end;
  FRetrieveDataSlipCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand.Execute(ARequestFilter);
  if not FRetrieveDataSlipCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveDataSlipCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FRetrieveDataSlipCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveDataSlipCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerTransferAntarGudangClient.RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand_Cache = nil then
  begin
    FRetrieveDataSlipCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSlipCommand_Cache.RequestType := 'GET';
    FRetrieveDataSlipCommand_Cache.Text := 'TServerTransferAntarGudang.RetrieveDataSlip';
    FRetrieveDataSlipCommand_Cache.Prepare(TServerTransferAntarGudang_RetrieveDataSlip_Cache);
  end;
  FRetrieveDataSlipCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand_Cache.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FRetrieveDataSlipCommand_Cache.Parameters[4].Value.GetString);
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

function TServerTransferAntarGudangClient.DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteNoCommitCommand = nil then
  begin
    FDeleteNoCommitCommand := FConnection.CreateCommand;
    FDeleteNoCommitCommand.RequestType := 'POST';
    FDeleteNoCommitCommand.Text := 'TServerTransferAntarGudang."DeleteNoCommit"';
    FDeleteNoCommitCommand.Prepare(TServerTransferAntarGudang_DeleteNoCommit);
  end;
  if not Assigned(AAppObject) then
    FDeleteNoCommitCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteNoCommitCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteNoCommitCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteNoCommitCommand.Execute(ARequestFilter);
  Result := FDeleteNoCommitCommand.Parameters[1].Value.GetBoolean;
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
  FDoJournalCommand.DisposeOf;
  FGenerateNoBuktiCommand.DisposeOf;
  FRetrieveDataCommand.DisposeOf;
  FRetrieveDataCommand_Cache.DisposeOf;
  FRetrieveDataSiapJurnalCommand.DisposeOf;
  FRetrieveDataSiapJurnalCommand_Cache.DisposeOf;
  FRetrieveDataSlipCommand.DisposeOf;
  FRetrieveDataSlipCommand_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FDeleteNoCommitCommand.DisposeOf;
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

function TServerTAGRequestClient.DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string): Boolean;
begin
  if FDoJournalCommand = nil then
  begin
    FDoJournalCommand := FConnection.CreateCommand;
    FDoJournalCommand.RequestType := 'GET';
    FDoJournalCommand.Text := 'TServerTAGRequest.DoJournal';
    FDoJournalCommand.Prepare(TServerTAGRequest_DoJournal);
  end;
  FDoJournalCommand.Parameters[0].Value.SetWideString(ANoBukti);
  FDoJournalCommand.Parameters[1].Value.SetWideString(AModTransClass);
  FDoJournalCommand.Parameters[2].Value.SetInt32(AIsHapusJurnal);
  FDoJournalCommand.Execute(ARequestFilter);
  Result := FDoJournalCommand.Parameters[3].Value.GetBoolean;
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

function TServerTAGRequestClient.RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataCommand = nil then
  begin
    FRetrieveDataCommand := FConnection.CreateCommand;
    FRetrieveDataCommand.RequestType := 'GET';
    FRetrieveDataCommand.Text := 'TServerTAGRequest.RetrieveData';
    FRetrieveDataCommand.Prepare(TServerTAGRequest_RetrieveData);
  end;
  FRetrieveDataCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataCommand.FreeOnExecute(Result);
end;

function TServerTAGRequestClient.RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataCommand_Cache = nil then
  begin
    FRetrieveDataCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataCommand_Cache.RequestType := 'GET';
    FRetrieveDataCommand_Cache.Text := 'TServerTAGRequest.RetrieveData';
    FRetrieveDataCommand_Cache.Prepare(TServerTAGRequest_RetrieveData_Cache);
  end;
  FRetrieveDataCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataCommand_Cache.Parameters[3].Value.GetString);
end;

function TServerTAGRequestClient.RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataSiapJurnalCommand = nil then
  begin
    FRetrieveDataSiapJurnalCommand := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand.Text := 'TServerTAGRequest.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand.Prepare(TServerTAGRequest_RetrieveDataSiapJurnal);
  end;
  FRetrieveDataSiapJurnalCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataSiapJurnalCommand.Parameters[2].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataSiapJurnalCommand.FreeOnExecute(Result);
end;

function TServerTAGRequestClient.RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataSiapJurnalCommand_Cache = nil then
  begin
    FRetrieveDataSiapJurnalCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand_Cache.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand_Cache.Text := 'TServerTAGRequest.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand_Cache.Prepare(TServerTAGRequest_RetrieveDataSiapJurnal_Cache);
  end;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataSiapJurnalCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerTAGRequestClient.RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand = nil then
  begin
    FRetrieveDataSlipCommand := FConnection.CreateCommand;
    FRetrieveDataSlipCommand.RequestType := 'GET';
    FRetrieveDataSlipCommand.Text := 'TServerTAGRequest.RetrieveDataSlip';
    FRetrieveDataSlipCommand.Prepare(TServerTAGRequest_RetrieveDataSlip);
  end;
  FRetrieveDataSlipCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand.Execute(ARequestFilter);
  if not FRetrieveDataSlipCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveDataSlipCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FRetrieveDataSlipCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveDataSlipCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerTAGRequestClient.RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand_Cache = nil then
  begin
    FRetrieveDataSlipCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSlipCommand_Cache.RequestType := 'GET';
    FRetrieveDataSlipCommand_Cache.Text := 'TServerTAGRequest.RetrieveDataSlip';
    FRetrieveDataSlipCommand_Cache.Prepare(TServerTAGRequest_RetrieveDataSlip_Cache);
  end;
  FRetrieveDataSlipCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand_Cache.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FRetrieveDataSlipCommand_Cache.Parameters[4].Value.GetString);
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

function TServerTAGRequestClient.DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteNoCommitCommand = nil then
  begin
    FDeleteNoCommitCommand := FConnection.CreateCommand;
    FDeleteNoCommitCommand.RequestType := 'POST';
    FDeleteNoCommitCommand.Text := 'TServerTAGRequest."DeleteNoCommit"';
    FDeleteNoCommitCommand.Prepare(TServerTAGRequest_DeleteNoCommit);
  end;
  if not Assigned(AAppObject) then
    FDeleteNoCommitCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteNoCommitCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteNoCommitCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteNoCommitCommand.Execute(ARequestFilter);
  Result := FDeleteNoCommitCommand.Parameters[1].Value.GetBoolean;
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
  FDoJournalCommand.DisposeOf;
  FGenerateNoBuktiCommand.DisposeOf;
  FRetrieveDataCommand.DisposeOf;
  FRetrieveDataCommand_Cache.DisposeOf;
  FRetrieveDataSiapJurnalCommand.DisposeOf;
  FRetrieveDataSiapJurnalCommand_Cache.DisposeOf;
  FRetrieveDataSlipCommand.DisposeOf;
  FRetrieveDataSlipCommand_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FDeleteNoCommitCommand.DisposeOf;
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

function TServerTransferAntarCabangKirimClient.DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string): Boolean;
begin
  if FDoJournalCommand = nil then
  begin
    FDoJournalCommand := FConnection.CreateCommand;
    FDoJournalCommand.RequestType := 'GET';
    FDoJournalCommand.Text := 'TServerTransferAntarCabangKirim.DoJournal';
    FDoJournalCommand.Prepare(TServerTransferAntarCabangKirim_DoJournal);
  end;
  FDoJournalCommand.Parameters[0].Value.SetWideString(ANoBukti);
  FDoJournalCommand.Parameters[1].Value.SetWideString(AModTransClass);
  FDoJournalCommand.Parameters[2].Value.SetInt32(AIsHapusJurnal);
  FDoJournalCommand.Execute(ARequestFilter);
  Result := FDoJournalCommand.Parameters[3].Value.GetBoolean;
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

function TServerTransferAntarCabangKirimClient.RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataCommand = nil then
  begin
    FRetrieveDataCommand := FConnection.CreateCommand;
    FRetrieveDataCommand.RequestType := 'GET';
    FRetrieveDataCommand.Text := 'TServerTransferAntarCabangKirim.RetrieveData';
    FRetrieveDataCommand.Prepare(TServerTransferAntarCabangKirim_RetrieveData);
  end;
  FRetrieveDataCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataCommand.FreeOnExecute(Result);
end;

function TServerTransferAntarCabangKirimClient.RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataCommand_Cache = nil then
  begin
    FRetrieveDataCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataCommand_Cache.RequestType := 'GET';
    FRetrieveDataCommand_Cache.Text := 'TServerTransferAntarCabangKirim.RetrieveData';
    FRetrieveDataCommand_Cache.Prepare(TServerTransferAntarCabangKirim_RetrieveData_Cache);
  end;
  FRetrieveDataCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataCommand_Cache.Parameters[3].Value.GetString);
end;

function TServerTransferAntarCabangKirimClient.RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataSiapJurnalCommand = nil then
  begin
    FRetrieveDataSiapJurnalCommand := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand.Text := 'TServerTransferAntarCabangKirim.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand.Prepare(TServerTransferAntarCabangKirim_RetrieveDataSiapJurnal);
  end;
  FRetrieveDataSiapJurnalCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataSiapJurnalCommand.Parameters[2].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataSiapJurnalCommand.FreeOnExecute(Result);
end;

function TServerTransferAntarCabangKirimClient.RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataSiapJurnalCommand_Cache = nil then
  begin
    FRetrieveDataSiapJurnalCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand_Cache.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand_Cache.Text := 'TServerTransferAntarCabangKirim.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand_Cache.Prepare(TServerTransferAntarCabangKirim_RetrieveDataSiapJurnal_Cache);
  end;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataSiapJurnalCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerTransferAntarCabangKirimClient.RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand = nil then
  begin
    FRetrieveDataSlipCommand := FConnection.CreateCommand;
    FRetrieveDataSlipCommand.RequestType := 'GET';
    FRetrieveDataSlipCommand.Text := 'TServerTransferAntarCabangKirim.RetrieveDataSlip';
    FRetrieveDataSlipCommand.Prepare(TServerTransferAntarCabangKirim_RetrieveDataSlip);
  end;
  FRetrieveDataSlipCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand.Execute(ARequestFilter);
  if not FRetrieveDataSlipCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveDataSlipCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FRetrieveDataSlipCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveDataSlipCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerTransferAntarCabangKirimClient.RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand_Cache = nil then
  begin
    FRetrieveDataSlipCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSlipCommand_Cache.RequestType := 'GET';
    FRetrieveDataSlipCommand_Cache.Text := 'TServerTransferAntarCabangKirim.RetrieveDataSlip';
    FRetrieveDataSlipCommand_Cache.Prepare(TServerTransferAntarCabangKirim_RetrieveDataSlip_Cache);
  end;
  FRetrieveDataSlipCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand_Cache.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FRetrieveDataSlipCommand_Cache.Parameters[4].Value.GetString);
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

function TServerTransferAntarCabangKirimClient.DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteNoCommitCommand = nil then
  begin
    FDeleteNoCommitCommand := FConnection.CreateCommand;
    FDeleteNoCommitCommand.RequestType := 'POST';
    FDeleteNoCommitCommand.Text := 'TServerTransferAntarCabangKirim."DeleteNoCommit"';
    FDeleteNoCommitCommand.Prepare(TServerTransferAntarCabangKirim_DeleteNoCommit);
  end;
  if not Assigned(AAppObject) then
    FDeleteNoCommitCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteNoCommitCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteNoCommitCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteNoCommitCommand.Execute(ARequestFilter);
  Result := FDeleteNoCommitCommand.Parameters[1].Value.GetBoolean;
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
  FDoJournalCommand.DisposeOf;
  FGenerateNoBuktiCommand.DisposeOf;
  FRetrieveDataCommand.DisposeOf;
  FRetrieveDataCommand_Cache.DisposeOf;
  FRetrieveDataSiapJurnalCommand.DisposeOf;
  FRetrieveDataSiapJurnalCommand_Cache.DisposeOf;
  FRetrieveDataSlipCommand.DisposeOf;
  FRetrieveDataSlipCommand_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FDeleteNoCommitCommand.DisposeOf;
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

function TServerTransferAntarCabangTerimaClient.DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string): Boolean;
begin
  if FDoJournalCommand = nil then
  begin
    FDoJournalCommand := FConnection.CreateCommand;
    FDoJournalCommand.RequestType := 'GET';
    FDoJournalCommand.Text := 'TServerTransferAntarCabangTerima.DoJournal';
    FDoJournalCommand.Prepare(TServerTransferAntarCabangTerima_DoJournal);
  end;
  FDoJournalCommand.Parameters[0].Value.SetWideString(ANoBukti);
  FDoJournalCommand.Parameters[1].Value.SetWideString(AModTransClass);
  FDoJournalCommand.Parameters[2].Value.SetInt32(AIsHapusJurnal);
  FDoJournalCommand.Execute(ARequestFilter);
  Result := FDoJournalCommand.Parameters[3].Value.GetBoolean;
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

function TServerTransferAntarCabangTerimaClient.RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataCommand = nil then
  begin
    FRetrieveDataCommand := FConnection.CreateCommand;
    FRetrieveDataCommand.RequestType := 'GET';
    FRetrieveDataCommand.Text := 'TServerTransferAntarCabangTerima.RetrieveData';
    FRetrieveDataCommand.Prepare(TServerTransferAntarCabangTerima_RetrieveData);
  end;
  FRetrieveDataCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataCommand.FreeOnExecute(Result);
end;

function TServerTransferAntarCabangTerimaClient.RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataCommand_Cache = nil then
  begin
    FRetrieveDataCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataCommand_Cache.RequestType := 'GET';
    FRetrieveDataCommand_Cache.Text := 'TServerTransferAntarCabangTerima.RetrieveData';
    FRetrieveDataCommand_Cache.Prepare(TServerTransferAntarCabangTerima_RetrieveData_Cache);
  end;
  FRetrieveDataCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataCommand_Cache.Parameters[3].Value.GetString);
end;

function TServerTransferAntarCabangTerimaClient.RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataSiapJurnalCommand = nil then
  begin
    FRetrieveDataSiapJurnalCommand := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand.Text := 'TServerTransferAntarCabangTerima.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand.Prepare(TServerTransferAntarCabangTerima_RetrieveDataSiapJurnal);
  end;
  FRetrieveDataSiapJurnalCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataSiapJurnalCommand.Parameters[2].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataSiapJurnalCommand.FreeOnExecute(Result);
end;

function TServerTransferAntarCabangTerimaClient.RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataSiapJurnalCommand_Cache = nil then
  begin
    FRetrieveDataSiapJurnalCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand_Cache.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand_Cache.Text := 'TServerTransferAntarCabangTerima.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand_Cache.Prepare(TServerTransferAntarCabangTerima_RetrieveDataSiapJurnal_Cache);
  end;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataSiapJurnalCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerTransferAntarCabangTerimaClient.RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand = nil then
  begin
    FRetrieveDataSlipCommand := FConnection.CreateCommand;
    FRetrieveDataSlipCommand.RequestType := 'GET';
    FRetrieveDataSlipCommand.Text := 'TServerTransferAntarCabangTerima.RetrieveDataSlip';
    FRetrieveDataSlipCommand.Prepare(TServerTransferAntarCabangTerima_RetrieveDataSlip);
  end;
  FRetrieveDataSlipCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand.Execute(ARequestFilter);
  if not FRetrieveDataSlipCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveDataSlipCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FRetrieveDataSlipCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveDataSlipCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerTransferAntarCabangTerimaClient.RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand_Cache = nil then
  begin
    FRetrieveDataSlipCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSlipCommand_Cache.RequestType := 'GET';
    FRetrieveDataSlipCommand_Cache.Text := 'TServerTransferAntarCabangTerima.RetrieveDataSlip';
    FRetrieveDataSlipCommand_Cache.Prepare(TServerTransferAntarCabangTerima_RetrieveDataSlip_Cache);
  end;
  FRetrieveDataSlipCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand_Cache.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FRetrieveDataSlipCommand_Cache.Parameters[4].Value.GetString);
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

function TServerTransferAntarCabangTerimaClient.DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteNoCommitCommand = nil then
  begin
    FDeleteNoCommitCommand := FConnection.CreateCommand;
    FDeleteNoCommitCommand.RequestType := 'POST';
    FDeleteNoCommitCommand.Text := 'TServerTransferAntarCabangTerima."DeleteNoCommit"';
    FDeleteNoCommitCommand.Prepare(TServerTransferAntarCabangTerima_DeleteNoCommit);
  end;
  if not Assigned(AAppObject) then
    FDeleteNoCommitCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteNoCommitCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteNoCommitCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteNoCommitCommand.Execute(ARequestFilter);
  Result := FDeleteNoCommitCommand.Parameters[1].Value.GetBoolean;
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
  FDoJournalCommand.DisposeOf;
  FGenerateNoBuktiCommand.DisposeOf;
  FRetrieveDataCommand.DisposeOf;
  FRetrieveDataCommand_Cache.DisposeOf;
  FRetrieveDataSiapJurnalCommand.DisposeOf;
  FRetrieveDataSiapJurnalCommand_Cache.DisposeOf;
  FRetrieveDataSlipCommand.DisposeOf;
  FRetrieveDataSlipCommand_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FDeleteNoCommitCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

function TDSDataClient.DS_CabangLookUp(const ARequestFilter: string): TDataSet;
begin
  if FDS_CabangLookUpCommand = nil then
  begin
    FDS_CabangLookUpCommand := FConnection.CreateCommand;
    FDS_CabangLookUpCommand.RequestType := 'GET';
    FDS_CabangLookUpCommand.Text := 'TDSData.DS_CabangLookUp';
    FDS_CabangLookUpCommand.Prepare(TDSData_DS_CabangLookUp);
  end;
  FDS_CabangLookUpCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FDS_CabangLookUpCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FDS_CabangLookUpCommand.FreeOnExecute(Result);
end;

function TDSDataClient.DS_CabangLookUp_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FDS_CabangLookUpCommand_Cache = nil then
  begin
    FDS_CabangLookUpCommand_Cache := FConnection.CreateCommand;
    FDS_CabangLookUpCommand_Cache.RequestType := 'GET';
    FDS_CabangLookUpCommand_Cache.Text := 'TDSData.DS_CabangLookUp';
    FDS_CabangLookUpCommand_Cache.Prepare(TDSData_DS_CabangLookUp_Cache);
  end;
  FDS_CabangLookUpCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FDS_CabangLookUpCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSDataClient.DS_GudangLookUp(const ARequestFilter: string): TDataSet;
begin
  if FDS_GudangLookUpCommand = nil then
  begin
    FDS_GudangLookUpCommand := FConnection.CreateCommand;
    FDS_GudangLookUpCommand.RequestType := 'GET';
    FDS_GudangLookUpCommand.Text := 'TDSData.DS_GudangLookUp';
    FDS_GudangLookUpCommand.Prepare(TDSData_DS_GudangLookUp);
  end;
  FDS_GudangLookUpCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FDS_GudangLookUpCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FDS_GudangLookUpCommand.FreeOnExecute(Result);
end;

function TDSDataClient.DS_GudangLookUp_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FDS_GudangLookUpCommand_Cache = nil then
  begin
    FDS_GudangLookUpCommand_Cache := FConnection.CreateCommand;
    FDS_GudangLookUpCommand_Cache.RequestType := 'GET';
    FDS_GudangLookUpCommand_Cache.Text := 'TDSData.DS_GudangLookUp';
    FDS_GudangLookUpCommand_Cache.Prepare(TDSData_DS_GudangLookUp_Cache);
  end;
  FDS_GudangLookUpCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FDS_GudangLookUpCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSDataClient.GetNamaku(const ARequestFilter: string): string;
begin
  if FGetNamakuCommand = nil then
  begin
    FGetNamakuCommand := FConnection.CreateCommand;
    FGetNamakuCommand.RequestType := 'GET';
    FGetNamakuCommand.Text := 'TDSData.GetNamaku';
    FGetNamakuCommand.Prepare(TDSData_GetNamaku);
  end;
  FGetNamakuCommand.Execute(ARequestFilter);
  Result := FGetNamakuCommand.Parameters[0].Value.GetWideString;
end;

function TDSDataClient.LoadAccountPengeluaranKasLain(const ARequestFilter: string): TDataSet;
begin
  if FLoadAccountPengeluaranKasLainCommand = nil then
  begin
    FLoadAccountPengeluaranKasLainCommand := FConnection.CreateCommand;
    FLoadAccountPengeluaranKasLainCommand.RequestType := 'GET';
    FLoadAccountPengeluaranKasLainCommand.Text := 'TDSData.LoadAccountPengeluaranKasLain';
    FLoadAccountPengeluaranKasLainCommand.Prepare(TDSData_LoadAccountPengeluaranKasLain);
  end;
  FLoadAccountPengeluaranKasLainCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FLoadAccountPengeluaranKasLainCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FLoadAccountPengeluaranKasLainCommand.FreeOnExecute(Result);
end;

function TDSDataClient.LoadAccountPengeluaranKasLain_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FLoadAccountPengeluaranKasLainCommand_Cache = nil then
  begin
    FLoadAccountPengeluaranKasLainCommand_Cache := FConnection.CreateCommand;
    FLoadAccountPengeluaranKasLainCommand_Cache.RequestType := 'GET';
    FLoadAccountPengeluaranKasLainCommand_Cache.Text := 'TDSData.LoadAccountPengeluaranKasLain';
    FLoadAccountPengeluaranKasLainCommand_Cache.Prepare(TDSData_LoadAccountPengeluaranKasLain_Cache);
  end;
  FLoadAccountPengeluaranKasLainCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FLoadAccountPengeluaranKasLainCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSDataClient.LoadAccountAPNew(const ARequestFilter: string): TDataSet;
begin
  if FLoadAccountAPNewCommand = nil then
  begin
    FLoadAccountAPNewCommand := FConnection.CreateCommand;
    FLoadAccountAPNewCommand.RequestType := 'GET';
    FLoadAccountAPNewCommand.Text := 'TDSData.LoadAccountAPNew';
    FLoadAccountAPNewCommand.Prepare(TDSData_LoadAccountAPNew);
  end;
  FLoadAccountAPNewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FLoadAccountAPNewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FLoadAccountAPNewCommand.FreeOnExecute(Result);
end;

function TDSDataClient.LoadAccountAPNew_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FLoadAccountAPNewCommand_Cache = nil then
  begin
    FLoadAccountAPNewCommand_Cache := FConnection.CreateCommand;
    FLoadAccountAPNewCommand_Cache.RequestType := 'GET';
    FLoadAccountAPNewCommand_Cache.Text := 'TDSData.LoadAccountAPNew';
    FLoadAccountAPNewCommand_Cache.Prepare(TDSData_LoadAccountAPNew_Cache);
  end;
  FLoadAccountAPNewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FLoadAccountAPNewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSDataClient.LoadAccountPenerimaanLain(const ARequestFilter: string): TDataSet;
begin
  if FLoadAccountPenerimaanLainCommand = nil then
  begin
    FLoadAccountPenerimaanLainCommand := FConnection.CreateCommand;
    FLoadAccountPenerimaanLainCommand.RequestType := 'GET';
    FLoadAccountPenerimaanLainCommand.Text := 'TDSData.LoadAccountPenerimaanLain';
    FLoadAccountPenerimaanLainCommand.Prepare(TDSData_LoadAccountPenerimaanLain);
  end;
  FLoadAccountPenerimaanLainCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FLoadAccountPenerimaanLainCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FLoadAccountPenerimaanLainCommand.FreeOnExecute(Result);
end;

function TDSDataClient.LoadAccountPenerimaanLain_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FLoadAccountPenerimaanLainCommand_Cache = nil then
  begin
    FLoadAccountPenerimaanLainCommand_Cache := FConnection.CreateCommand;
    FLoadAccountPenerimaanLainCommand_Cache.RequestType := 'GET';
    FLoadAccountPenerimaanLainCommand_Cache.Text := 'TDSData.LoadAccountPenerimaanLain';
    FLoadAccountPenerimaanLainCommand_Cache.Prepare(TDSData_LoadAccountPenerimaanLain_Cache);
  end;
  FLoadAccountPenerimaanLainCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FLoadAccountPenerimaanLainCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSDataClient.LoadAccountARNew(const ARequestFilter: string): TDataSet;
begin
  if FLoadAccountARNewCommand = nil then
  begin
    FLoadAccountARNewCommand := FConnection.CreateCommand;
    FLoadAccountARNewCommand.RequestType := 'GET';
    FLoadAccountARNewCommand.Text := 'TDSData.LoadAccountARNew';
    FLoadAccountARNewCommand.Prepare(TDSData_LoadAccountARNew);
  end;
  FLoadAccountARNewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FLoadAccountARNewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FLoadAccountARNewCommand.FreeOnExecute(Result);
end;

function TDSDataClient.LoadAccountARNew_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FLoadAccountARNewCommand_Cache = nil then
  begin
    FLoadAccountARNewCommand_Cache := FConnection.CreateCommand;
    FLoadAccountARNewCommand_Cache.RequestType := 'GET';
    FLoadAccountARNewCommand_Cache.Text := 'TDSData.LoadAccountARNew';
    FLoadAccountARNewCommand_Cache.Prepare(TDSData_LoadAccountARNew_Cache);
  end;
  FLoadAccountARNewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FLoadAccountARNewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSDataClient.LoadAP(ASupplier: TSupplier; const ARequestFilter: string): TDataSet;
begin
  if FLoadAPCommand = nil then
  begin
    FLoadAPCommand := FConnection.CreateCommand;
    FLoadAPCommand.RequestType := 'POST';
    FLoadAPCommand.Text := 'TDSData."LoadAP"';
    FLoadAPCommand.Prepare(TDSData_LoadAP);
  end;
  if not Assigned(ASupplier) then
    FLoadAPCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLoadAPCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FLoadAPCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ASupplier), True);
      if FInstanceOwner then
        ASupplier.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FLoadAPCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FLoadAPCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FLoadAPCommand.FreeOnExecute(Result);
end;

function TDSDataClient.LoadAP_Cache(ASupplier: TSupplier; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FLoadAPCommand_Cache = nil then
  begin
    FLoadAPCommand_Cache := FConnection.CreateCommand;
    FLoadAPCommand_Cache.RequestType := 'POST';
    FLoadAPCommand_Cache.Text := 'TDSData."LoadAP"';
    FLoadAPCommand_Cache.Prepare(TDSData_LoadAP_Cache);
  end;
  if not Assigned(ASupplier) then
    FLoadAPCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLoadAPCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FLoadAPCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ASupplier), True);
      if FInstanceOwner then
        ASupplier.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FLoadAPCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FLoadAPCommand_Cache.Parameters[1].Value.GetString);
end;

function TDSDataClient.LoadAR(ACustomer: TSupplier; const ARequestFilter: string): TDataSet;
begin
  if FLoadARCommand = nil then
  begin
    FLoadARCommand := FConnection.CreateCommand;
    FLoadARCommand.RequestType := 'POST';
    FLoadARCommand.Text := 'TDSData."LoadAR"';
    FLoadARCommand.Prepare(TDSData_LoadAR);
  end;
  if not Assigned(ACustomer) then
    FLoadARCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLoadARCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FLoadARCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ACustomer), True);
      if FInstanceOwner then
        ACustomer.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FLoadARCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FLoadARCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FLoadARCommand.FreeOnExecute(Result);
end;

function TDSDataClient.LoadAR_Cache(ACustomer: TSupplier; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FLoadARCommand_Cache = nil then
  begin
    FLoadARCommand_Cache := FConnection.CreateCommand;
    FLoadARCommand_Cache.RequestType := 'POST';
    FLoadARCommand_Cache.Text := 'TDSData."LoadAR"';
    FLoadARCommand_Cache.Prepare(TDSData_LoadAR_Cache);
  end;
  if not Assigned(ACustomer) then
    FLoadARCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FLoadARCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FLoadARCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ACustomer), True);
      if FInstanceOwner then
        ACustomer.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FLoadARCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FLoadARCommand_Cache.Parameters[1].Value.GetString);
end;

constructor TDSDataClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TDSDataClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TDSDataClient.Destroy;
begin
  FDS_CabangLookUpCommand.DisposeOf;
  FDS_CabangLookUpCommand_Cache.DisposeOf;
  FDS_GudangLookUpCommand.DisposeOf;
  FDS_GudangLookUpCommand_Cache.DisposeOf;
  FGetNamakuCommand.DisposeOf;
  FLoadAccountPengeluaranKasLainCommand.DisposeOf;
  FLoadAccountPengeluaranKasLainCommand_Cache.DisposeOf;
  FLoadAccountAPNewCommand.DisposeOf;
  FLoadAccountAPNewCommand_Cache.DisposeOf;
  FLoadAccountPenerimaanLainCommand.DisposeOf;
  FLoadAccountPenerimaanLainCommand_Cache.DisposeOf;
  FLoadAccountARNewCommand.DisposeOf;
  FLoadAccountARNewCommand_Cache.DisposeOf;
  FLoadAPCommand.DisposeOf;
  FLoadAPCommand_Cache.DisposeOf;
  FLoadARCommand.DisposeOf;
  FLoadARCommand_Cache.DisposeOf;
  inherited;
end;

function TServerJurnalClient.BeforeSave(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FBeforeSaveCommand = nil then
  begin
    FBeforeSaveCommand := FConnection.CreateCommand;
    FBeforeSaveCommand.RequestType := 'POST';
    FBeforeSaveCommand.Text := 'TServerJurnal."BeforeSave"';
    FBeforeSaveCommand.Prepare(TServerJurnal_BeforeSave);
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

function TServerJurnalClient.BeforeDelete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FBeforeDeleteCommand = nil then
  begin
    FBeforeDeleteCommand := FConnection.CreateCommand;
    FBeforeDeleteCommand.RequestType := 'POST';
    FBeforeDeleteCommand.Text := 'TServerJurnal."BeforeDelete"';
    FBeforeDeleteCommand.Prepare(TServerJurnal_BeforeDelete);
  end;
  if not Assigned(AAppObject) then
    FBeforeDeleteCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FBeforeDeleteCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FBeforeDeleteCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FBeforeDeleteCommand.Execute(ARequestFilter);
  Result := FBeforeDeleteCommand.Parameters[1].Value.GetBoolean;
end;

function TServerJurnalClient.Retrieve(AID: string; const ARequestFilter: string): TJurnal;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TServerJurnal.Retrieve';
    FRetrieveCommand.Prepare(TServerJurnal_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TJurnal(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerJurnalClient.Retrieve_Cache(AID: string; const ARequestFilter: string): IDSRestCachedTJurnal;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TServerJurnal.Retrieve';
    FRetrieveCommand_Cache.Prepare(TServerJurnal_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTJurnal.Create(FRetrieveCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerJurnalClient.DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string): Boolean;
begin
  if FDoJournalCommand = nil then
  begin
    FDoJournalCommand := FConnection.CreateCommand;
    FDoJournalCommand.RequestType := 'GET';
    FDoJournalCommand.Text := 'TServerJurnal.DoJournal';
    FDoJournalCommand.Prepare(TServerJurnal_DoJournal);
  end;
  FDoJournalCommand.Parameters[0].Value.SetWideString(ANoBukti);
  FDoJournalCommand.Parameters[1].Value.SetWideString(AModTransClass);
  FDoJournalCommand.Parameters[2].Value.SetInt32(AIsHapusJurnal);
  FDoJournalCommand.Execute(ARequestFilter);
  Result := FDoJournalCommand.Parameters[3].Value.GetBoolean;
end;

function TServerJurnalClient.GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string): string;
begin
  if FGenerateNoBuktiCommand = nil then
  begin
    FGenerateNoBuktiCommand := FConnection.CreateCommand;
    FGenerateNoBuktiCommand.RequestType := 'GET';
    FGenerateNoBuktiCommand.Text := 'TServerJurnal.GenerateNoBukti';
    FGenerateNoBuktiCommand.Prepare(TServerJurnal_GenerateNoBukti);
  end;
  FGenerateNoBuktiCommand.Parameters[0].Value.AsDateTime := ATglBukti;
  FGenerateNoBuktiCommand.Parameters[1].Value.SetWideString(APrefix);
  FGenerateNoBuktiCommand.Execute(ARequestFilter);
  Result := FGenerateNoBuktiCommand.Parameters[2].Value.GetWideString;
end;

function TServerJurnalClient.RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataCommand = nil then
  begin
    FRetrieveDataCommand := FConnection.CreateCommand;
    FRetrieveDataCommand.RequestType := 'GET';
    FRetrieveDataCommand.Text := 'TServerJurnal.RetrieveData';
    FRetrieveDataCommand.Prepare(TServerJurnal_RetrieveData);
  end;
  FRetrieveDataCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataCommand.FreeOnExecute(Result);
end;

function TServerJurnalClient.RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataCommand_Cache = nil then
  begin
    FRetrieveDataCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataCommand_Cache.RequestType := 'GET';
    FRetrieveDataCommand_Cache.Text := 'TServerJurnal.RetrieveData';
    FRetrieveDataCommand_Cache.Prepare(TServerJurnal_RetrieveData_Cache);
  end;
  FRetrieveDataCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataCommand_Cache.Parameters[3].Value.GetString);
end;

function TServerJurnalClient.RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataSiapJurnalCommand = nil then
  begin
    FRetrieveDataSiapJurnalCommand := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand.Text := 'TServerJurnal.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand.Prepare(TServerJurnal_RetrieveDataSiapJurnal);
  end;
  FRetrieveDataSiapJurnalCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataSiapJurnalCommand.Parameters[2].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataSiapJurnalCommand.FreeOnExecute(Result);
end;

function TServerJurnalClient.RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataSiapJurnalCommand_Cache = nil then
  begin
    FRetrieveDataSiapJurnalCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand_Cache.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand_Cache.Text := 'TServerJurnal.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand_Cache.Prepare(TServerJurnal_RetrieveDataSiapJurnal_Cache);
  end;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataSiapJurnalCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerJurnalClient.RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand = nil then
  begin
    FRetrieveDataSlipCommand := FConnection.CreateCommand;
    FRetrieveDataSlipCommand.RequestType := 'GET';
    FRetrieveDataSlipCommand.Text := 'TServerJurnal.RetrieveDataSlip';
    FRetrieveDataSlipCommand.Prepare(TServerJurnal_RetrieveDataSlip);
  end;
  FRetrieveDataSlipCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand.Execute(ARequestFilter);
  if not FRetrieveDataSlipCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveDataSlipCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FRetrieveDataSlipCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveDataSlipCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerJurnalClient.RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand_Cache = nil then
  begin
    FRetrieveDataSlipCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSlipCommand_Cache.RequestType := 'GET';
    FRetrieveDataSlipCommand_Cache.Text := 'TServerJurnal.RetrieveDataSlip';
    FRetrieveDataSlipCommand_Cache.Prepare(TServerJurnal_RetrieveDataSlip_Cache);
  end;
  FRetrieveDataSlipCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand_Cache.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FRetrieveDataSlipCommand_Cache.Parameters[4].Value.GetString);
end;

function TServerJurnalClient.Delete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FConnection.CreateCommand;
    FDeleteCommand.RequestType := 'POST';
    FDeleteCommand.Text := 'TServerJurnal."Delete"';
    FDeleteCommand.Prepare(TServerJurnal_Delete);
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

function TServerJurnalClient.DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteNoCommitCommand = nil then
  begin
    FDeleteNoCommitCommand := FConnection.CreateCommand;
    FDeleteNoCommitCommand.RequestType := 'POST';
    FDeleteNoCommitCommand.Text := 'TServerJurnal."DeleteNoCommit"';
    FDeleteNoCommitCommand.Prepare(TServerJurnal_DeleteNoCommit);
  end;
  if not Assigned(AAppObject) then
    FDeleteNoCommitCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteNoCommitCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteNoCommitCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteNoCommitCommand.Execute(ARequestFilter);
  Result := FDeleteNoCommitCommand.Parameters[1].Value.GetBoolean;
end;

function TServerJurnalClient.RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSCommand = nil then
  begin
    FRetrieveCDSCommand := FConnection.CreateCommand;
    FRetrieveCDSCommand.RequestType := 'POST';
    FRetrieveCDSCommand.Text := 'TServerJurnal."RetrieveCDS"';
    FRetrieveCDSCommand.Prepare(TServerJurnal_RetrieveCDS);
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

function TServerJurnalClient.RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSCommand_Cache = nil then
  begin
    FRetrieveCDSCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSCommand_Cache.RequestType := 'POST';
    FRetrieveCDSCommand_Cache.Text := 'TServerJurnal."RetrieveCDS"';
    FRetrieveCDSCommand_Cache.Prepare(TServerJurnal_RetrieveCDS_Cache);
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

function TServerJurnalClient.Save(AOBject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FSaveCommand = nil then
  begin
    FSaveCommand := FConnection.CreateCommand;
    FSaveCommand.RequestType := 'POST';
    FSaveCommand.Text := 'TServerJurnal."Save"';
    FSaveCommand.Prepare(TServerJurnal_Save);
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

constructor TServerJurnalClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerJurnalClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerJurnalClient.Destroy;
begin
  FBeforeSaveCommand.DisposeOf;
  FBeforeDeleteCommand.DisposeOf;
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FDoJournalCommand.DisposeOf;
  FGenerateNoBuktiCommand.DisposeOf;
  FRetrieveDataCommand.DisposeOf;
  FRetrieveDataCommand_Cache.DisposeOf;
  FRetrieveDataSiapJurnalCommand.DisposeOf;
  FRetrieveDataSiapJurnalCommand_Cache.DisposeOf;
  FRetrieveDataSlipCommand.DisposeOf;
  FRetrieveDataSlipCommand_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FDeleteNoCommitCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

function TServerSettlementARAPClient.AfterSave(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FAfterSaveCommand = nil then
  begin
    FAfterSaveCommand := FConnection.CreateCommand;
    FAfterSaveCommand.RequestType := 'POST';
    FAfterSaveCommand.Text := 'TServerSettlementARAP."AfterSave"';
    FAfterSaveCommand.Prepare(TServerSettlementARAP_AfterSave);
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

function TServerSettlementARAPClient.BeforeDelete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FBeforeDeleteCommand = nil then
  begin
    FBeforeDeleteCommand := FConnection.CreateCommand;
    FBeforeDeleteCommand.RequestType := 'POST';
    FBeforeDeleteCommand.Text := 'TServerSettlementARAP."BeforeDelete"';
    FBeforeDeleteCommand.Prepare(TServerSettlementARAP_BeforeDelete);
  end;
  if not Assigned(AAppObject) then
    FBeforeDeleteCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FBeforeDeleteCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FBeforeDeleteCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FBeforeDeleteCommand.Execute(ARequestFilter);
  Result := FBeforeDeleteCommand.Parameters[1].Value.GetBoolean;
end;

function TServerSettlementARAPClient.BeforeSave(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FBeforeSaveCommand = nil then
  begin
    FBeforeSaveCommand := FConnection.CreateCommand;
    FBeforeSaveCommand.RequestType := 'POST';
    FBeforeSaveCommand.Text := 'TServerSettlementARAP."BeforeSave"';
    FBeforeSaveCommand.Prepare(TServerSettlementARAP_BeforeSave);
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

function TServerSettlementARAPClient.Retrieve(AID: string; const ARequestFilter: string): TSettlementARAP;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TServerSettlementARAP.Retrieve';
    FRetrieveCommand.Prepare(TServerSettlementARAP_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TSettlementARAP(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerSettlementARAPClient.Retrieve_Cache(AID: string; const ARequestFilter: string): IDSRestCachedTSettlementARAP;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TServerSettlementARAP.Retrieve';
    FRetrieveCommand_Cache.Prepare(TServerSettlementARAP_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTSettlementARAP.Create(FRetrieveCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerSettlementARAPClient.DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string): Boolean;
begin
  if FDoJournalCommand = nil then
  begin
    FDoJournalCommand := FConnection.CreateCommand;
    FDoJournalCommand.RequestType := 'GET';
    FDoJournalCommand.Text := 'TServerSettlementARAP.DoJournal';
    FDoJournalCommand.Prepare(TServerSettlementARAP_DoJournal);
  end;
  FDoJournalCommand.Parameters[0].Value.SetWideString(ANoBukti);
  FDoJournalCommand.Parameters[1].Value.SetWideString(AModTransClass);
  FDoJournalCommand.Parameters[2].Value.SetInt32(AIsHapusJurnal);
  FDoJournalCommand.Execute(ARequestFilter);
  Result := FDoJournalCommand.Parameters[3].Value.GetBoolean;
end;

function TServerSettlementARAPClient.GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string): string;
begin
  if FGenerateNoBuktiCommand = nil then
  begin
    FGenerateNoBuktiCommand := FConnection.CreateCommand;
    FGenerateNoBuktiCommand.RequestType := 'GET';
    FGenerateNoBuktiCommand.Text := 'TServerSettlementARAP.GenerateNoBukti';
    FGenerateNoBuktiCommand.Prepare(TServerSettlementARAP_GenerateNoBukti);
  end;
  FGenerateNoBuktiCommand.Parameters[0].Value.AsDateTime := ATglBukti;
  FGenerateNoBuktiCommand.Parameters[1].Value.SetWideString(APrefix);
  FGenerateNoBuktiCommand.Execute(ARequestFilter);
  Result := FGenerateNoBuktiCommand.Parameters[2].Value.GetWideString;
end;

function TServerSettlementARAPClient.RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataCommand = nil then
  begin
    FRetrieveDataCommand := FConnection.CreateCommand;
    FRetrieveDataCommand.RequestType := 'GET';
    FRetrieveDataCommand.Text := 'TServerSettlementARAP.RetrieveData';
    FRetrieveDataCommand.Prepare(TServerSettlementARAP_RetrieveData);
  end;
  FRetrieveDataCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataCommand.FreeOnExecute(Result);
end;

function TServerSettlementARAPClient.RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataCommand_Cache = nil then
  begin
    FRetrieveDataCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataCommand_Cache.RequestType := 'GET';
    FRetrieveDataCommand_Cache.Text := 'TServerSettlementARAP.RetrieveData';
    FRetrieveDataCommand_Cache.Prepare(TServerSettlementARAP_RetrieveData_Cache);
  end;
  FRetrieveDataCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataCommand_Cache.Parameters[3].Value.GetString);
end;

function TServerSettlementARAPClient.RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataSiapJurnalCommand = nil then
  begin
    FRetrieveDataSiapJurnalCommand := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand.Text := 'TServerSettlementARAP.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand.Prepare(TServerSettlementARAP_RetrieveDataSiapJurnal);
  end;
  FRetrieveDataSiapJurnalCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataSiapJurnalCommand.Parameters[2].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataSiapJurnalCommand.FreeOnExecute(Result);
end;

function TServerSettlementARAPClient.RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataSiapJurnalCommand_Cache = nil then
  begin
    FRetrieveDataSiapJurnalCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand_Cache.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand_Cache.Text := 'TServerSettlementARAP.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand_Cache.Prepare(TServerSettlementARAP_RetrieveDataSiapJurnal_Cache);
  end;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataSiapJurnalCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerSettlementARAPClient.RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand = nil then
  begin
    FRetrieveDataSlipCommand := FConnection.CreateCommand;
    FRetrieveDataSlipCommand.RequestType := 'GET';
    FRetrieveDataSlipCommand.Text := 'TServerSettlementARAP.RetrieveDataSlip';
    FRetrieveDataSlipCommand.Prepare(TServerSettlementARAP_RetrieveDataSlip);
  end;
  FRetrieveDataSlipCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand.Execute(ARequestFilter);
  if not FRetrieveDataSlipCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveDataSlipCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FRetrieveDataSlipCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveDataSlipCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerSettlementARAPClient.RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand_Cache = nil then
  begin
    FRetrieveDataSlipCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSlipCommand_Cache.RequestType := 'GET';
    FRetrieveDataSlipCommand_Cache.Text := 'TServerSettlementARAP.RetrieveDataSlip';
    FRetrieveDataSlipCommand_Cache.Prepare(TServerSettlementARAP_RetrieveDataSlip_Cache);
  end;
  FRetrieveDataSlipCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand_Cache.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FRetrieveDataSlipCommand_Cache.Parameters[4].Value.GetString);
end;

function TServerSettlementARAPClient.Delete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FConnection.CreateCommand;
    FDeleteCommand.RequestType := 'POST';
    FDeleteCommand.Text := 'TServerSettlementARAP."Delete"';
    FDeleteCommand.Prepare(TServerSettlementARAP_Delete);
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

function TServerSettlementARAPClient.DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteNoCommitCommand = nil then
  begin
    FDeleteNoCommitCommand := FConnection.CreateCommand;
    FDeleteNoCommitCommand.RequestType := 'POST';
    FDeleteNoCommitCommand.Text := 'TServerSettlementARAP."DeleteNoCommit"';
    FDeleteNoCommitCommand.Prepare(TServerSettlementARAP_DeleteNoCommit);
  end;
  if not Assigned(AAppObject) then
    FDeleteNoCommitCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteNoCommitCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteNoCommitCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteNoCommitCommand.Execute(ARequestFilter);
  Result := FDeleteNoCommitCommand.Parameters[1].Value.GetBoolean;
end;

function TServerSettlementARAPClient.RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSCommand = nil then
  begin
    FRetrieveCDSCommand := FConnection.CreateCommand;
    FRetrieveCDSCommand.RequestType := 'POST';
    FRetrieveCDSCommand.Text := 'TServerSettlementARAP."RetrieveCDS"';
    FRetrieveCDSCommand.Prepare(TServerSettlementARAP_RetrieveCDS);
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

function TServerSettlementARAPClient.RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSCommand_Cache = nil then
  begin
    FRetrieveCDSCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSCommand_Cache.RequestType := 'POST';
    FRetrieveCDSCommand_Cache.Text := 'TServerSettlementARAP."RetrieveCDS"';
    FRetrieveCDSCommand_Cache.Prepare(TServerSettlementARAP_RetrieveCDS_Cache);
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

function TServerSettlementARAPClient.Save(AOBject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FSaveCommand = nil then
  begin
    FSaveCommand := FConnection.CreateCommand;
    FSaveCommand.RequestType := 'POST';
    FSaveCommand.Text := 'TServerSettlementARAP."Save"';
    FSaveCommand.Prepare(TServerSettlementARAP_Save);
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

constructor TServerSettlementARAPClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerSettlementARAPClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerSettlementARAPClient.Destroy;
begin
  FAfterSaveCommand.DisposeOf;
  FBeforeDeleteCommand.DisposeOf;
  FBeforeSaveCommand.DisposeOf;
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FDoJournalCommand.DisposeOf;
  FGenerateNoBuktiCommand.DisposeOf;
  FRetrieveDataCommand.DisposeOf;
  FRetrieveDataCommand_Cache.DisposeOf;
  FRetrieveDataSiapJurnalCommand.DisposeOf;
  FRetrieveDataSiapJurnalCommand_Cache.DisposeOf;
  FRetrieveDataSlipCommand.DisposeOf;
  FRetrieveDataSlipCommand_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FDeleteNoCommitCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

function TServerMenuClient.Retrieve(AID: string; const ARequestFilter: string): TMenu;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TServerMenu.Retrieve';
    FRetrieveCommand.Prepare(TServerMenu_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TMenu(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMenuClient.Retrieve_Cache(AID: string; const ARequestFilter: string): IDSRestCachedTMenu;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TServerMenu.Retrieve';
    FRetrieveCommand_Cache.Prepare(TServerMenu_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTMenu.Create(FRetrieveCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerMenuClient.Delete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FConnection.CreateCommand;
    FDeleteCommand.RequestType := 'POST';
    FDeleteCommand.Text := 'TServerMenu."Delete"';
    FDeleteCommand.Prepare(TServerMenu_Delete);
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

function TServerMenuClient.DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteNoCommitCommand = nil then
  begin
    FDeleteNoCommitCommand := FConnection.CreateCommand;
    FDeleteNoCommitCommand.RequestType := 'POST';
    FDeleteNoCommitCommand.Text := 'TServerMenu."DeleteNoCommit"';
    FDeleteNoCommitCommand.Prepare(TServerMenu_DeleteNoCommit);
  end;
  if not Assigned(AAppObject) then
    FDeleteNoCommitCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteNoCommitCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteNoCommitCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteNoCommitCommand.Execute(ARequestFilter);
  Result := FDeleteNoCommitCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMenuClient.RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSCommand = nil then
  begin
    FRetrieveCDSCommand := FConnection.CreateCommand;
    FRetrieveCDSCommand.RequestType := 'POST';
    FRetrieveCDSCommand.Text := 'TServerMenu."RetrieveCDS"';
    FRetrieveCDSCommand.Prepare(TServerMenu_RetrieveCDS);
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

function TServerMenuClient.RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSCommand_Cache = nil then
  begin
    FRetrieveCDSCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSCommand_Cache.RequestType := 'POST';
    FRetrieveCDSCommand_Cache.Text := 'TServerMenu."RetrieveCDS"';
    FRetrieveCDSCommand_Cache.Prepare(TServerMenu_RetrieveCDS_Cache);
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

function TServerMenuClient.Save(AOBject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FSaveCommand = nil then
  begin
    FSaveCommand := FConnection.CreateCommand;
    FSaveCommand.RequestType := 'POST';
    FSaveCommand.Text := 'TServerMenu."Save"';
    FSaveCommand.Prepare(TServerMenu_Save);
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

constructor TServerMenuClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerMenuClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerMenuClient.Destroy;
begin
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FDeleteNoCommitCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

function TServerUserClient.Retrieve(AID: string; const ARequestFilter: string): TUser;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TServerUser.Retrieve';
    FRetrieveCommand.Prepare(TServerUser_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TUser(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerUserClient.Retrieve_Cache(AID: string; const ARequestFilter: string): IDSRestCachedTUser;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TServerUser.Retrieve';
    FRetrieveCommand_Cache.Prepare(TServerUser_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTUser.Create(FRetrieveCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerUserClient.Delete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FConnection.CreateCommand;
    FDeleteCommand.RequestType := 'POST';
    FDeleteCommand.Text := 'TServerUser."Delete"';
    FDeleteCommand.Prepare(TServerUser_Delete);
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

function TServerUserClient.DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteNoCommitCommand = nil then
  begin
    FDeleteNoCommitCommand := FConnection.CreateCommand;
    FDeleteNoCommitCommand.RequestType := 'POST';
    FDeleteNoCommitCommand.Text := 'TServerUser."DeleteNoCommit"';
    FDeleteNoCommitCommand.Prepare(TServerUser_DeleteNoCommit);
  end;
  if not Assigned(AAppObject) then
    FDeleteNoCommitCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteNoCommitCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteNoCommitCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteNoCommitCommand.Execute(ARequestFilter);
  Result := FDeleteNoCommitCommand.Parameters[1].Value.GetBoolean;
end;

function TServerUserClient.RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSCommand = nil then
  begin
    FRetrieveCDSCommand := FConnection.CreateCommand;
    FRetrieveCDSCommand.RequestType := 'POST';
    FRetrieveCDSCommand.Text := 'TServerUser."RetrieveCDS"';
    FRetrieveCDSCommand.Prepare(TServerUser_RetrieveCDS);
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

function TServerUserClient.RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSCommand_Cache = nil then
  begin
    FRetrieveCDSCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSCommand_Cache.RequestType := 'POST';
    FRetrieveCDSCommand_Cache.Text := 'TServerUser."RetrieveCDS"';
    FRetrieveCDSCommand_Cache.Prepare(TServerUser_RetrieveCDS_Cache);
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

function TServerUserClient.Save(AOBject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FSaveCommand = nil then
  begin
    FSaveCommand := FConnection.CreateCommand;
    FSaveCommand.RequestType := 'POST';
    FSaveCommand.Text := 'TServerUser."Save"';
    FSaveCommand.Prepare(TServerUser_Save);
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

constructor TServerUserClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerUserClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerUserClient.Destroy;
begin
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FDeleteNoCommitCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

function TServerPenarikanDepositClient.Retrieve(AID: string; const ARequestFilter: string): TPenarikanDeposit;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TServerPenarikanDeposit.Retrieve';
    FRetrieveCommand.Prepare(TServerPenarikanDeposit_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TPenarikanDeposit(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerPenarikanDepositClient.Retrieve_Cache(AID: string; const ARequestFilter: string): IDSRestCachedTPenarikanDeposit;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TServerPenarikanDeposit.Retrieve';
    FRetrieveCommand_Cache.Prepare(TServerPenarikanDeposit_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTPenarikanDeposit.Create(FRetrieveCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerPenarikanDepositClient.RetrieveCDSlip(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; ANoBukti: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FRetrieveCDSlipCommand = nil then
  begin
    FRetrieveCDSlipCommand := FConnection.CreateCommand;
    FRetrieveCDSlipCommand.RequestType := 'POST';
    FRetrieveCDSlipCommand.Text := 'TServerPenarikanDeposit."RetrieveCDSlip"';
    FRetrieveCDSlipCommand.Prepare(TServerPenarikanDeposit_RetrieveCDSlip);
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
  if not FRetrieveCDSlipCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCDSlipCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FRetrieveCDSlipCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCDSlipCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerPenarikanDepositClient.RetrieveCDSlip_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; ACabang: TCabang; ANoBukti: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FRetrieveCDSlipCommand_Cache = nil then
  begin
    FRetrieveCDSlipCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSlipCommand_Cache.RequestType := 'POST';
    FRetrieveCDSlipCommand_Cache.Text := 'TServerPenarikanDeposit."RetrieveCDSlip"';
    FRetrieveCDSlipCommand_Cache.Prepare(TServerPenarikanDeposit_RetrieveCDSlip_Cache);
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
  Result := TDSRestCachedTFDJSONDataSets.Create(FRetrieveCDSlipCommand_Cache.Parameters[4].Value.GetString);
end;

function TServerPenarikanDepositClient.DoJournal(ANoBukti: string; AModTransClass: string; AIsHapusJurnal: Integer; const ARequestFilter: string): Boolean;
begin
  if FDoJournalCommand = nil then
  begin
    FDoJournalCommand := FConnection.CreateCommand;
    FDoJournalCommand.RequestType := 'GET';
    FDoJournalCommand.Text := 'TServerPenarikanDeposit.DoJournal';
    FDoJournalCommand.Prepare(TServerPenarikanDeposit_DoJournal);
  end;
  FDoJournalCommand.Parameters[0].Value.SetWideString(ANoBukti);
  FDoJournalCommand.Parameters[1].Value.SetWideString(AModTransClass);
  FDoJournalCommand.Parameters[2].Value.SetInt32(AIsHapusJurnal);
  FDoJournalCommand.Execute(ARequestFilter);
  Result := FDoJournalCommand.Parameters[3].Value.GetBoolean;
end;

function TServerPenarikanDepositClient.GenerateNoBukti(ATglBukti: TDateTime; APrefix: string; const ARequestFilter: string): string;
begin
  if FGenerateNoBuktiCommand = nil then
  begin
    FGenerateNoBuktiCommand := FConnection.CreateCommand;
    FGenerateNoBuktiCommand.RequestType := 'GET';
    FGenerateNoBuktiCommand.Text := 'TServerPenarikanDeposit.GenerateNoBukti';
    FGenerateNoBuktiCommand.Prepare(TServerPenarikanDeposit_GenerateNoBukti);
  end;
  FGenerateNoBuktiCommand.Parameters[0].Value.AsDateTime := ATglBukti;
  FGenerateNoBuktiCommand.Parameters[1].Value.SetWideString(APrefix);
  FGenerateNoBuktiCommand.Execute(ARequestFilter);
  Result := FGenerateNoBuktiCommand.Parameters[2].Value.GetWideString;
end;

function TServerPenarikanDepositClient.RetrieveData(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataCommand = nil then
  begin
    FRetrieveDataCommand := FConnection.CreateCommand;
    FRetrieveDataCommand.RequestType := 'GET';
    FRetrieveDataCommand.Text := 'TServerPenarikanDeposit.RetrieveData';
    FRetrieveDataCommand.Prepare(TServerPenarikanDeposit_RetrieveData);
  end;
  FRetrieveDataCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataCommand.FreeOnExecute(Result);
end;

function TServerPenarikanDepositClient.RetrieveData_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataCommand_Cache = nil then
  begin
    FRetrieveDataCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataCommand_Cache.RequestType := 'GET';
    FRetrieveDataCommand_Cache.Text := 'TServerPenarikanDeposit.RetrieveData';
    FRetrieveDataCommand_Cache.Prepare(TServerPenarikanDeposit_RetrieveData_Cache);
  end;
  FRetrieveDataCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataCommand_Cache.Parameters[3].Value.GetString);
end;

function TServerPenarikanDepositClient.RetrieveDataSiapJurnal(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveDataSiapJurnalCommand = nil then
  begin
    FRetrieveDataSiapJurnalCommand := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand.Text := 'TServerPenarikanDeposit.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand.Prepare(TServerPenarikanDeposit_RetrieveDataSiapJurnal);
  end;
  FRetrieveDataSiapJurnalCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRetrieveDataSiapJurnalCommand.Parameters[2].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRetrieveDataSiapJurnalCommand.FreeOnExecute(Result);
end;

function TServerPenarikanDepositClient.RetrieveDataSiapJurnal_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveDataSiapJurnalCommand_Cache = nil then
  begin
    FRetrieveDataSiapJurnalCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSiapJurnalCommand_Cache.RequestType := 'GET';
    FRetrieveDataSiapJurnalCommand_Cache.Text := 'TServerPenarikanDeposit.RetrieveDataSiapJurnal';
    FRetrieveDataSiapJurnalCommand_Cache.Prepare(TServerPenarikanDeposit_RetrieveDataSiapJurnal_Cache);
  end;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSiapJurnalCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSiapJurnalCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRetrieveDataSiapJurnalCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerPenarikanDepositClient.RetrieveDataSlip(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand = nil then
  begin
    FRetrieveDataSlipCommand := FConnection.CreateCommand;
    FRetrieveDataSlipCommand.RequestType := 'GET';
    FRetrieveDataSlipCommand.Text := 'TServerPenarikanDeposit.RetrieveDataSlip';
    FRetrieveDataSlipCommand.Prepare(TServerPenarikanDeposit_RetrieveDataSlip);
  end;
  FRetrieveDataSlipCommand.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand.Execute(ARequestFilter);
  if not FRetrieveDataSlipCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveDataSlipCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FRetrieveDataSlipCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveDataSlipCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerPenarikanDepositClient.RetrieveDataSlip_Cache(aPeriodeAwal: TDateTime; APeriodeAkhir: TDateTime; AIDCabang: string; AID: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FRetrieveDataSlipCommand_Cache = nil then
  begin
    FRetrieveDataSlipCommand_Cache := FConnection.CreateCommand;
    FRetrieveDataSlipCommand_Cache.RequestType := 'GET';
    FRetrieveDataSlipCommand_Cache.Text := 'TServerPenarikanDeposit.RetrieveDataSlip';
    FRetrieveDataSlipCommand_Cache.Prepare(TServerPenarikanDeposit_RetrieveDataSlip_Cache);
  end;
  FRetrieveDataSlipCommand_Cache.Parameters[0].Value.AsDateTime := aPeriodeAwal;
  FRetrieveDataSlipCommand_Cache.Parameters[1].Value.AsDateTime := APeriodeAkhir;
  FRetrieveDataSlipCommand_Cache.Parameters[2].Value.SetWideString(AIDCabang);
  FRetrieveDataSlipCommand_Cache.Parameters[3].Value.SetWideString(AID);
  FRetrieveDataSlipCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FRetrieveDataSlipCommand_Cache.Parameters[4].Value.GetString);
end;

function TServerPenarikanDepositClient.Delete(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FConnection.CreateCommand;
    FDeleteCommand.RequestType := 'POST';
    FDeleteCommand.Text := 'TServerPenarikanDeposit."Delete"';
    FDeleteCommand.Prepare(TServerPenarikanDeposit_Delete);
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

function TServerPenarikanDepositClient.DeleteNoCommit(AAppObject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FDeleteNoCommitCommand = nil then
  begin
    FDeleteNoCommitCommand := FConnection.CreateCommand;
    FDeleteNoCommitCommand.RequestType := 'POST';
    FDeleteNoCommitCommand.Text := 'TServerPenarikanDeposit."DeleteNoCommit"';
    FDeleteNoCommitCommand.Prepare(TServerPenarikanDeposit_DeleteNoCommit);
  end;
  if not Assigned(AAppObject) then
    FDeleteNoCommitCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteNoCommitCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteNoCommitCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AAppObject), True);
      if FInstanceOwner then
        AAppObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteNoCommitCommand.Execute(ARequestFilter);
  Result := FDeleteNoCommitCommand.Parameters[1].Value.GetBoolean;
end;

function TServerPenarikanDepositClient.RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string): TDataSet;
begin
  if FRetrieveCDSCommand = nil then
  begin
    FRetrieveCDSCommand := FConnection.CreateCommand;
    FRetrieveCDSCommand.RequestType := 'POST';
    FRetrieveCDSCommand.Text := 'TServerPenarikanDeposit."RetrieveCDS"';
    FRetrieveCDSCommand.Prepare(TServerPenarikanDeposit_RetrieveCDS);
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

function TServerPenarikanDepositClient.RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRetrieveCDSCommand_Cache = nil then
  begin
    FRetrieveCDSCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSCommand_Cache.RequestType := 'POST';
    FRetrieveCDSCommand_Cache.Text := 'TServerPenarikanDeposit."RetrieveCDS"';
    FRetrieveCDSCommand_Cache.Prepare(TServerPenarikanDeposit_RetrieveCDS_Cache);
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

function TServerPenarikanDepositClient.Save(AOBject: TAppObject; const ARequestFilter: string): Boolean;
begin
  if FSaveCommand = nil then
  begin
    FSaveCommand := FConnection.CreateCommand;
    FSaveCommand.RequestType := 'POST';
    FSaveCommand.Text := 'TServerPenarikanDeposit."Save"';
    FSaveCommand.Prepare(TServerPenarikanDeposit_Save);
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

constructor TServerPenarikanDepositClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerPenarikanDepositClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerPenarikanDepositClient.Destroy;
begin
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FRetrieveCDSlipCommand.DisposeOf;
  FRetrieveCDSlipCommand_Cache.DisposeOf;
  FDoJournalCommand.DisposeOf;
  FGenerateNoBuktiCommand.DisposeOf;
  FRetrieveDataCommand.DisposeOf;
  FRetrieveDataCommand_Cache.DisposeOf;
  FRetrieveDataSiapJurnalCommand.DisposeOf;
  FRetrieveDataSiapJurnalCommand_Cache.DisposeOf;
  FRetrieveDataSlipCommand.DisposeOf;
  FRetrieveDataSlipCommand_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FDeleteNoCommitCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

end.

