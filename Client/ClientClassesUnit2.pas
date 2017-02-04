//
// Created by the DataSnap proxy generator.
// 2/4/2017 10:41:14 AM
//

unit ClientClassesUnit2;

interface

uses Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, uModel, Data.DBXJSONReflect;

type

  IDSRestCachedTStockSekarang = interface;
  IDSRestCachedTPembayaranSupplier = interface;
  IDSRestCachedTReturSupplier = interface;
  IDSRestCachedTLogAppObject = interface;
  IDSRestCachedTGroupBarang = interface;
  IDSRestCachedTPenerimaanBarang = interface;
  IDSRestCachedTCabang = interface;
  IDSRestCachedTBarang = interface;
  IDSRestCachedTSupplier = interface;
  IDSRestCachedTUOM = interface;

  TServerMethods1Client = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FGetUOMCommand: TDSRestCommand;
    FGetUOMCommand_Cache: TDSRestCommand;
    FHitungCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FSaveUOMCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function GetUOM(const ARequestFilter: string = ''): TUOM;
    function GetUOM_Cache(const ARequestFilter: string = ''): IDSRestCachedTUOM;
    function Hitung(const ARequestFilter: string = ''): Integer;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function SaveUOM(AUOM: TUOM; const ARequestFilter: string = ''): Boolean;
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
    FRetrieveCDSJSONCommand: TDSRestCommand;
    FRetrieveCDSJSONCommand_Cache: TDSRestCommand;
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
    function RetrieveCDSJSON(const ARequestFilter: string = ''): TJSONArray;
    function RetrieveCDSJSON_Cache(const ARequestFilter: string = ''): IDSRestCachedJSONArray;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
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
    FRetrieveCDSJSONCommand: TDSRestCommand;
    FRetrieveCDSJSONCommand_Cache: TDSRestCommand;
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
    function RetrieveCDSJSON(const ARequestFilter: string = ''): TJSONArray;
    function RetrieveCDSJSON_Cache(const ARequestFilter: string = ''): IDSRestCachedJSONArray;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerGroupBarangClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FRetrieveCDSJSONCommand: TDSRestCommand;
    FRetrieveCDSJSONCommand_Cache: TDSRestCommand;
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
    function RetrieveCDSJSON(const ARequestFilter: string = ''): TJSONArray;
    function RetrieveCDSJSON_Cache(const ARequestFilter: string = ''): IDSRestCachedJSONArray;
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
    FRetrieveCDSJSONCommand: TDSRestCommand;
    FRetrieveCDSJSONCommand_Cache: TDSRestCommand;
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
    function RetrieveCDSJSON(const ARequestFilter: string = ''): TJSONArray;
    function RetrieveCDSJSON_Cache(const ARequestFilter: string = ''): IDSRestCachedJSONArray;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerCabangClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FRetrieveCDSJSONCommand: TDSRestCommand;
    FRetrieveCDSJSONCommand_Cache: TDSRestCommand;
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
    function RetrieveCDSJSON(const ARequestFilter: string = ''): TJSONArray;
    function RetrieveCDSJSON_Cache(const ARequestFilter: string = ''): IDSRestCachedJSONArray;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerLogAppObjectClient = class(TDSAdminRestClient)
  private
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FRetrieveCDSJSONCommand: TDSRestCommand;
    FRetrieveCDSJSONCommand_Cache: TDSRestCommand;
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
    function RetrieveCDSJSON(const ARequestFilter: string = ''): TJSONArray;
    function RetrieveCDSJSON_Cache(const ARequestFilter: string = ''): IDSRestCachedJSONArray;
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
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FRetrieveCDSJSONCommand: TDSRestCommand;
    FRetrieveCDSJSONCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Retrieve(ABarang: TBarang; const ARequestFilter: string = ''): TStockSekarang;
    function Retrieve_Cache(ABarang: TBarang; const ARequestFilter: string = ''): IDSRestCachedTStockSekarang;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveCDSJSON(const ARequestFilter: string = ''): TJSONArray;
    function RetrieveCDSJSON_Cache(const ARequestFilter: string = ''): IDSRestCachedJSONArray;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerLaporanClient = class(TDSAdminRestClient)
  private
    FLaporanStockSekarangCommand: TDSRestCommand;
    FLaporanStockSekarangCommand_Cache: TDSRestCommand;
    FRetriveMutasiBarangCommand: TDSRestCommand;
    FRetriveMutasiBarangCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function LaporanStockSekarang(ACabang: TCabang; const ARequestFilter: string = ''): TDataSet;
    function LaporanStockSekarang_Cache(ACabang: TCabang; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetriveMutasiBarang(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; const ARequestFilter: string = ''): TDataSet;
    function RetriveMutasiBarang_Cache(ATglAwal: TDateTime; ATglAtglAkhir: TDateTime; const ARequestFilter: string = ''): IDSRestCachedDataSet;
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
    FRetrieveCDSJSONCommand: TDSRestCommand;
    FRetrieveCDSJSONCommand_Cache: TDSRestCommand;
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
    function RetrieveCDSJSON(const ARequestFilter: string = ''): TJSONArray;
    function RetrieveCDSJSON_Cache(const ARequestFilter: string = ''): IDSRestCachedJSONArray;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  TServerClosingInventoryClient = class(TDSAdminRestClient)
  private
    FCloseCommand: TDSRestCommand;
    FDeleteCommand: TDSRestCommand;
    FRetrieveCDSCommand: TDSRestCommand;
    FRetrieveCDSCommand_Cache: TDSRestCommand;
    FRetrieveCDSJSONCommand: TDSRestCommand;
    FRetrieveCDSJSONCommand_Cache: TDSRestCommand;
    FSaveCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Close(APeriode: Integer; ACabang: TCabang; const ARequestFilter: string = ''): Boolean;
    function Delete(AAppObject: TAppObject; const ARequestFilter: string = ''): Boolean;
    function RetrieveCDS(AAppObject: TAppObject; const ARequestFilter: string = ''): TDataSet;
    function RetrieveCDS_Cache(AAppObject: TAppObject; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RetrieveCDSJSON(const ARequestFilter: string = ''): TJSONArray;
    function RetrieveCDSJSON_Cache(const ARequestFilter: string = ''): IDSRestCachedJSONArray;
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
    FRetrieveCDSJSONCommand: TDSRestCommand;
    FRetrieveCDSJSONCommand_Cache: TDSRestCommand;
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
    function RetrieveCDSJSON(const ARequestFilter: string = ''): TJSONArray;
    function RetrieveCDSJSON_Cache(const ARequestFilter: string = ''): IDSRestCachedJSONArray;
    function Save(AOBject: TAppObject; const ARequestFilter: string = ''): Boolean;
  end;

  IDSRestCachedTStockSekarang = interface(IDSRestCachedObject<TStockSekarang>)
  end;

  TDSRestCachedTStockSekarang = class(TDSRestCachedObject<TStockSekarang>, IDSRestCachedTStockSekarang, IDSRestCachedCommand)
  end;
  IDSRestCachedTPembayaranSupplier = interface(IDSRestCachedObject<TPembayaranSupplier>)
  end;

  TDSRestCachedTPembayaranSupplier = class(TDSRestCachedObject<TPembayaranSupplier>, IDSRestCachedTPembayaranSupplier, IDSRestCachedCommand)
  end;
  IDSRestCachedTReturSupplier = interface(IDSRestCachedObject<TReturSupplier>)
  end;

  TDSRestCachedTReturSupplier = class(TDSRestCachedObject<TReturSupplier>, IDSRestCachedTReturSupplier, IDSRestCachedCommand)
  end;
  IDSRestCachedTLogAppObject = interface(IDSRestCachedObject<TLogAppObject>)
  end;

  TDSRestCachedTLogAppObject = class(TDSRestCachedObject<TLogAppObject>, IDSRestCachedTLogAppObject, IDSRestCachedCommand)
  end;
  IDSRestCachedTGroupBarang = interface(IDSRestCachedObject<TGroupBarang>)
  end;

  TDSRestCachedTGroupBarang = class(TDSRestCachedObject<TGroupBarang>, IDSRestCachedTGroupBarang, IDSRestCachedCommand)
  end;
  IDSRestCachedTPenerimaanBarang = interface(IDSRestCachedObject<TPenerimaanBarang>)
  end;

  TDSRestCachedTPenerimaanBarang = class(TDSRestCachedObject<TPenerimaanBarang>, IDSRestCachedTPenerimaanBarang, IDSRestCachedCommand)
  end;
  IDSRestCachedTCabang = interface(IDSRestCachedObject<TCabang>)
  end;

  TDSRestCachedTCabang = class(TDSRestCachedObject<TCabang>, IDSRestCachedTCabang, IDSRestCachedCommand)
  end;
  IDSRestCachedTBarang = interface(IDSRestCachedObject<TBarang>)
  end;

  TDSRestCachedTBarang = class(TDSRestCachedObject<TBarang>, IDSRestCachedTBarang, IDSRestCachedCommand)
  end;
  IDSRestCachedTSupplier = interface(IDSRestCachedObject<TSupplier>)
  end;

  TDSRestCachedTSupplier = class(TDSRestCachedObject<TSupplier>, IDSRestCachedTSupplier, IDSRestCachedCommand)
  end;
  IDSRestCachedTUOM = interface(IDSRestCachedObject<TUOM>)
  end;

  TDSRestCachedTUOM = class(TDSRestCachedObject<TUOM>, IDSRestCachedTUOM, IDSRestCachedCommand)
  end;

const
  TServerMethods1_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods1_GetUOM: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TUOM')
  );

  TServerMethods1_GetUOM_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_Hitung: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

  TServerMethods1_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods1_SaveUOM: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AUOM'; Direction: 1; DBXType: 37; TypeName: 'TUOM'),
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

  TServerSupplier_RetrieveCDSJSON: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TJSONArray')
  );

  TServerSupplier_RetrieveCDSJSON_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerSupplier_Save: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AOBject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
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

  TServerBarang_RetrieveCDSJSON: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TJSONArray')
  );

  TServerBarang_RetrieveCDSJSON_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerBarang_Save: array [0..1] of TDSRestParameterMetaData =
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

  TServerGroupBarang_RetrieveCDSJSON: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TJSONArray')
  );

  TServerGroupBarang_RetrieveCDSJSON_Cache: array [0..0] of TDSRestParameterMetaData =
  (
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

  TServerPenerimaanBarang_RetrieveCDSJSON: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TJSONArray')
  );

  TServerPenerimaanBarang_RetrieveCDSJSON_Cache: array [0..0] of TDSRestParameterMetaData =
  (
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

  TServerCabang_RetrieveCDSJSON: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TJSONArray')
  );

  TServerCabang_RetrieveCDSJSON_Cache: array [0..0] of TDSRestParameterMetaData =
  (
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

  TServerLogAppObject_RetrieveCDSJSON: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TJSONArray')
  );

  TServerLogAppObject_RetrieveCDSJSON_Cache: array [0..0] of TDSRestParameterMetaData =
  (
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

  TServerStockSekarang_Retrieve: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ABarang'; Direction: 1; DBXType: 37; TypeName: 'TBarang'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TStockSekarang')
  );

  TServerStockSekarang_Retrieve_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ABarang'; Direction: 1; DBXType: 37; TypeName: 'TBarang'),
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

  TServerStockSekarang_RetrieveCDSJSON: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TJSONArray')
  );

  TServerStockSekarang_RetrieveCDSJSON_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerStockSekarang_Save: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AOBject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
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

  TServerReturSupplier_RetrieveCDSJSON: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TJSONArray')
  );

  TServerReturSupplier_RetrieveCDSJSON_Cache: array [0..0] of TDSRestParameterMetaData =
  (
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

  TServerClosingInventory_RetrieveCDSJSON: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TJSONArray')
  );

  TServerClosingInventory_RetrieveCDSJSON_Cache: array [0..0] of TDSRestParameterMetaData =
  (
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

  TServerPembayaranSupplier_RetrieveCDSJSON: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TJSONArray')
  );

  TServerPembayaranSupplier_RetrieveCDSJSON_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerPembayaranSupplier_Save: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AOBject'; Direction: 1; DBXType: 37; TypeName: 'TAppObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

implementation

function TServerMethods1Client.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'TServerMethods1.EchoString';
    FEchoStringCommand.Prepare(TServerMethods1_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.GetUOM(const ARequestFilter: string): TUOM;
begin
  if FGetUOMCommand = nil then
  begin
    FGetUOMCommand := FConnection.CreateCommand;
    FGetUOMCommand.RequestType := 'GET';
    FGetUOMCommand.Text := 'TServerMethods1.GetUOM';
    FGetUOMCommand.Prepare(TServerMethods1_GetUOM);
  end;
  FGetUOMCommand.Execute(ARequestFilter);
  if not FGetUOMCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetUOMCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TUOM(FUnMarshal.UnMarshal(FGetUOMCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetUOMCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.GetUOM_Cache(const ARequestFilter: string): IDSRestCachedTUOM;
begin
  if FGetUOMCommand_Cache = nil then
  begin
    FGetUOMCommand_Cache := FConnection.CreateCommand;
    FGetUOMCommand_Cache.RequestType := 'GET';
    FGetUOMCommand_Cache.Text := 'TServerMethods1.GetUOM';
    FGetUOMCommand_Cache.Prepare(TServerMethods1_GetUOM_Cache);
  end;
  FGetUOMCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTUOM.Create(FGetUOMCommand_Cache.Parameters[0].Value.GetString);
end;

function TServerMethods1Client.Hitung(const ARequestFilter: string): Integer;
begin
  if FHitungCommand = nil then
  begin
    FHitungCommand := FConnection.CreateCommand;
    FHitungCommand.RequestType := 'GET';
    FHitungCommand.Text := 'TServerMethods1.Hitung';
    FHitungCommand.Prepare(TServerMethods1_Hitung);
  end;
  FHitungCommand.Execute(ARequestFilter);
  Result := FHitungCommand.Parameters[0].Value.GetInt32;
end;

function TServerMethods1Client.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'TServerMethods1.ReverseString';
    FReverseStringCommand.Prepare(TServerMethods1_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.SaveUOM(AUOM: TUOM; const ARequestFilter: string): Boolean;
begin
  if FSaveUOMCommand = nil then
  begin
    FSaveUOMCommand := FConnection.CreateCommand;
    FSaveUOMCommand.RequestType := 'POST';
    FSaveUOMCommand.Text := 'TServerMethods1."SaveUOM"';
    FSaveUOMCommand.Prepare(TServerMethods1_SaveUOM);
  end;
  if not Assigned(AUOM) then
    FSaveUOMCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveUOMCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveUOMCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AUOM), True);
      if FInstanceOwner then
        AUOM.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveUOMCommand.Execute(ARequestFilter);
  Result := FSaveUOMCommand.Parameters[1].Value.GetBoolean;
end;

constructor TServerMethods1Client.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerMethods1Client.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerMethods1Client.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FGetUOMCommand.DisposeOf;
  FGetUOMCommand_Cache.DisposeOf;
  FHitungCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FSaveUOMCommand.DisposeOf;
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

function TServerSupplierClient.RetrieveCDSJSON(const ARequestFilter: string): TJSONArray;
begin
  if FRetrieveCDSJSONCommand = nil then
  begin
    FRetrieveCDSJSONCommand := FConnection.CreateCommand;
    FRetrieveCDSJSONCommand.RequestType := 'GET';
    FRetrieveCDSJSONCommand.Text := 'TServerSupplier.RetrieveCDSJSON';
    FRetrieveCDSJSONCommand.Prepare(TServerSupplier_RetrieveCDSJSON);
  end;
  FRetrieveCDSJSONCommand.Execute(ARequestFilter);
  Result := TJSONArray(FRetrieveCDSJSONCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TServerSupplierClient.RetrieveCDSJSON_Cache(const ARequestFilter: string): IDSRestCachedJSONArray;
begin
  if FRetrieveCDSJSONCommand_Cache = nil then
  begin
    FRetrieveCDSJSONCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSJSONCommand_Cache.RequestType := 'GET';
    FRetrieveCDSJSONCommand_Cache.Text := 'TServerSupplier.RetrieveCDSJSON';
    FRetrieveCDSJSONCommand_Cache.Prepare(TServerSupplier_RetrieveCDSJSON_Cache);
  end;
  FRetrieveCDSJSONCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedJSONArray.Create(FRetrieveCDSJSONCommand_Cache.Parameters[0].Value.GetString);
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
  FRetrieveCDSJSONCommand.DisposeOf;
  FRetrieveCDSJSONCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
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

function TServerBarangClient.RetrieveCDSJSON(const ARequestFilter: string): TJSONArray;
begin
  if FRetrieveCDSJSONCommand = nil then
  begin
    FRetrieveCDSJSONCommand := FConnection.CreateCommand;
    FRetrieveCDSJSONCommand.RequestType := 'GET';
    FRetrieveCDSJSONCommand.Text := 'TServerBarang.RetrieveCDSJSON';
    FRetrieveCDSJSONCommand.Prepare(TServerBarang_RetrieveCDSJSON);
  end;
  FRetrieveCDSJSONCommand.Execute(ARequestFilter);
  Result := TJSONArray(FRetrieveCDSJSONCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TServerBarangClient.RetrieveCDSJSON_Cache(const ARequestFilter: string): IDSRestCachedJSONArray;
begin
  if FRetrieveCDSJSONCommand_Cache = nil then
  begin
    FRetrieveCDSJSONCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSJSONCommand_Cache.RequestType := 'GET';
    FRetrieveCDSJSONCommand_Cache.Text := 'TServerBarang.RetrieveCDSJSON';
    FRetrieveCDSJSONCommand_Cache.Prepare(TServerBarang_RetrieveCDSJSON_Cache);
  end;
  FRetrieveCDSJSONCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedJSONArray.Create(FRetrieveCDSJSONCommand_Cache.Parameters[0].Value.GetString);
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
  FRetrieveCDSJSONCommand.DisposeOf;
  FRetrieveCDSJSONCommand_Cache.DisposeOf;
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

function TServerGroupBarangClient.RetrieveCDSJSON(const ARequestFilter: string): TJSONArray;
begin
  if FRetrieveCDSJSONCommand = nil then
  begin
    FRetrieveCDSJSONCommand := FConnection.CreateCommand;
    FRetrieveCDSJSONCommand.RequestType := 'GET';
    FRetrieveCDSJSONCommand.Text := 'TServerGroupBarang.RetrieveCDSJSON';
    FRetrieveCDSJSONCommand.Prepare(TServerGroupBarang_RetrieveCDSJSON);
  end;
  FRetrieveCDSJSONCommand.Execute(ARequestFilter);
  Result := TJSONArray(FRetrieveCDSJSONCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TServerGroupBarangClient.RetrieveCDSJSON_Cache(const ARequestFilter: string): IDSRestCachedJSONArray;
begin
  if FRetrieveCDSJSONCommand_Cache = nil then
  begin
    FRetrieveCDSJSONCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSJSONCommand_Cache.RequestType := 'GET';
    FRetrieveCDSJSONCommand_Cache.Text := 'TServerGroupBarang.RetrieveCDSJSON';
    FRetrieveCDSJSONCommand_Cache.Prepare(TServerGroupBarang_RetrieveCDSJSON_Cache);
  end;
  FRetrieveCDSJSONCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedJSONArray.Create(FRetrieveCDSJSONCommand_Cache.Parameters[0].Value.GetString);
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
  FRetrieveCDSJSONCommand.DisposeOf;
  FRetrieveCDSJSONCommand_Cache.DisposeOf;
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

function TServerPenerimaanBarangClient.RetrieveCDSJSON(const ARequestFilter: string): TJSONArray;
begin
  if FRetrieveCDSJSONCommand = nil then
  begin
    FRetrieveCDSJSONCommand := FConnection.CreateCommand;
    FRetrieveCDSJSONCommand.RequestType := 'GET';
    FRetrieveCDSJSONCommand.Text := 'TServerPenerimaanBarang.RetrieveCDSJSON';
    FRetrieveCDSJSONCommand.Prepare(TServerPenerimaanBarang_RetrieveCDSJSON);
  end;
  FRetrieveCDSJSONCommand.Execute(ARequestFilter);
  Result := TJSONArray(FRetrieveCDSJSONCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TServerPenerimaanBarangClient.RetrieveCDSJSON_Cache(const ARequestFilter: string): IDSRestCachedJSONArray;
begin
  if FRetrieveCDSJSONCommand_Cache = nil then
  begin
    FRetrieveCDSJSONCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSJSONCommand_Cache.RequestType := 'GET';
    FRetrieveCDSJSONCommand_Cache.Text := 'TServerPenerimaanBarang.RetrieveCDSJSON';
    FRetrieveCDSJSONCommand_Cache.Prepare(TServerPenerimaanBarang_RetrieveCDSJSON_Cache);
  end;
  FRetrieveCDSJSONCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedJSONArray.Create(FRetrieveCDSJSONCommand_Cache.Parameters[0].Value.GetString);
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
  FRetrieveCDSJSONCommand.DisposeOf;
  FRetrieveCDSJSONCommand_Cache.DisposeOf;
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

function TServerCabangClient.RetrieveCDSJSON(const ARequestFilter: string): TJSONArray;
begin
  if FRetrieveCDSJSONCommand = nil then
  begin
    FRetrieveCDSJSONCommand := FConnection.CreateCommand;
    FRetrieveCDSJSONCommand.RequestType := 'GET';
    FRetrieveCDSJSONCommand.Text := 'TServerCabang.RetrieveCDSJSON';
    FRetrieveCDSJSONCommand.Prepare(TServerCabang_RetrieveCDSJSON);
  end;
  FRetrieveCDSJSONCommand.Execute(ARequestFilter);
  Result := TJSONArray(FRetrieveCDSJSONCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TServerCabangClient.RetrieveCDSJSON_Cache(const ARequestFilter: string): IDSRestCachedJSONArray;
begin
  if FRetrieveCDSJSONCommand_Cache = nil then
  begin
    FRetrieveCDSJSONCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSJSONCommand_Cache.RequestType := 'GET';
    FRetrieveCDSJSONCommand_Cache.Text := 'TServerCabang.RetrieveCDSJSON';
    FRetrieveCDSJSONCommand_Cache.Prepare(TServerCabang_RetrieveCDSJSON_Cache);
  end;
  FRetrieveCDSJSONCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedJSONArray.Create(FRetrieveCDSJSONCommand_Cache.Parameters[0].Value.GetString);
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
  FRetrieveCDSJSONCommand.DisposeOf;
  FRetrieveCDSJSONCommand_Cache.DisposeOf;
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

function TServerLogAppObjectClient.RetrieveCDSJSON(const ARequestFilter: string): TJSONArray;
begin
  if FRetrieveCDSJSONCommand = nil then
  begin
    FRetrieveCDSJSONCommand := FConnection.CreateCommand;
    FRetrieveCDSJSONCommand.RequestType := 'GET';
    FRetrieveCDSJSONCommand.Text := 'TServerLogAppObject.RetrieveCDSJSON';
    FRetrieveCDSJSONCommand.Prepare(TServerLogAppObject_RetrieveCDSJSON);
  end;
  FRetrieveCDSJSONCommand.Execute(ARequestFilter);
  Result := TJSONArray(FRetrieveCDSJSONCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TServerLogAppObjectClient.RetrieveCDSJSON_Cache(const ARequestFilter: string): IDSRestCachedJSONArray;
begin
  if FRetrieveCDSJSONCommand_Cache = nil then
  begin
    FRetrieveCDSJSONCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSJSONCommand_Cache.RequestType := 'GET';
    FRetrieveCDSJSONCommand_Cache.Text := 'TServerLogAppObject.RetrieveCDSJSON';
    FRetrieveCDSJSONCommand_Cache.Prepare(TServerLogAppObject_RetrieveCDSJSON_Cache);
  end;
  FRetrieveCDSJSONCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedJSONArray.Create(FRetrieveCDSJSONCommand_Cache.Parameters[0].Value.GetString);
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
  FRetrieveCDSJSONCommand.DisposeOf;
  FRetrieveCDSJSONCommand_Cache.DisposeOf;
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

function TServerStockSekarangClient.Retrieve(ABarang: TBarang; const ARequestFilter: string): TStockSekarang;
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
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TStockSekarang(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerStockSekarangClient.Retrieve_Cache(ABarang: TBarang; const ARequestFilter: string): IDSRestCachedTStockSekarang;
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
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTStockSekarang.Create(FRetrieveCommand_Cache.Parameters[1].Value.GetString);
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

function TServerStockSekarangClient.RetrieveCDSJSON(const ARequestFilter: string): TJSONArray;
begin
  if FRetrieveCDSJSONCommand = nil then
  begin
    FRetrieveCDSJSONCommand := FConnection.CreateCommand;
    FRetrieveCDSJSONCommand.RequestType := 'GET';
    FRetrieveCDSJSONCommand.Text := 'TServerStockSekarang.RetrieveCDSJSON';
    FRetrieveCDSJSONCommand.Prepare(TServerStockSekarang_RetrieveCDSJSON);
  end;
  FRetrieveCDSJSONCommand.Execute(ARequestFilter);
  Result := TJSONArray(FRetrieveCDSJSONCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TServerStockSekarangClient.RetrieveCDSJSON_Cache(const ARequestFilter: string): IDSRestCachedJSONArray;
begin
  if FRetrieveCDSJSONCommand_Cache = nil then
  begin
    FRetrieveCDSJSONCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSJSONCommand_Cache.RequestType := 'GET';
    FRetrieveCDSJSONCommand_Cache.Text := 'TServerStockSekarang.RetrieveCDSJSON';
    FRetrieveCDSJSONCommand_Cache.Prepare(TServerStockSekarang_RetrieveCDSJSON_Cache);
  end;
  FRetrieveCDSJSONCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedJSONArray.Create(FRetrieveCDSJSONCommand_Cache.Parameters[0].Value.GetString);
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
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FDeleteCommand.DisposeOf;
  FRetrieveCDSCommand.DisposeOf;
  FRetrieveCDSCommand_Cache.DisposeOf;
  FRetrieveCDSJSONCommand.DisposeOf;
  FRetrieveCDSJSONCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
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
  FLaporanStockSekarangCommand.DisposeOf;
  FLaporanStockSekarangCommand_Cache.DisposeOf;
  FRetriveMutasiBarangCommand.DisposeOf;
  FRetriveMutasiBarangCommand_Cache.DisposeOf;
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

function TServerReturSupplierClient.RetrieveCDSJSON(const ARequestFilter: string): TJSONArray;
begin
  if FRetrieveCDSJSONCommand = nil then
  begin
    FRetrieveCDSJSONCommand := FConnection.CreateCommand;
    FRetrieveCDSJSONCommand.RequestType := 'GET';
    FRetrieveCDSJSONCommand.Text := 'TServerReturSupplier.RetrieveCDSJSON';
    FRetrieveCDSJSONCommand.Prepare(TServerReturSupplier_RetrieveCDSJSON);
  end;
  FRetrieveCDSJSONCommand.Execute(ARequestFilter);
  Result := TJSONArray(FRetrieveCDSJSONCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TServerReturSupplierClient.RetrieveCDSJSON_Cache(const ARequestFilter: string): IDSRestCachedJSONArray;
begin
  if FRetrieveCDSJSONCommand_Cache = nil then
  begin
    FRetrieveCDSJSONCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSJSONCommand_Cache.RequestType := 'GET';
    FRetrieveCDSJSONCommand_Cache.Text := 'TServerReturSupplier.RetrieveCDSJSON';
    FRetrieveCDSJSONCommand_Cache.Prepare(TServerReturSupplier_RetrieveCDSJSON_Cache);
  end;
  FRetrieveCDSJSONCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedJSONArray.Create(FRetrieveCDSJSONCommand_Cache.Parameters[0].Value.GetString);
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
  FRetrieveCDSJSONCommand.DisposeOf;
  FRetrieveCDSJSONCommand_Cache.DisposeOf;
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

function TServerClosingInventoryClient.RetrieveCDSJSON(const ARequestFilter: string): TJSONArray;
begin
  if FRetrieveCDSJSONCommand = nil then
  begin
    FRetrieveCDSJSONCommand := FConnection.CreateCommand;
    FRetrieveCDSJSONCommand.RequestType := 'GET';
    FRetrieveCDSJSONCommand.Text := 'TServerClosingInventory.RetrieveCDSJSON';
    FRetrieveCDSJSONCommand.Prepare(TServerClosingInventory_RetrieveCDSJSON);
  end;
  FRetrieveCDSJSONCommand.Execute(ARequestFilter);
  Result := TJSONArray(FRetrieveCDSJSONCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TServerClosingInventoryClient.RetrieveCDSJSON_Cache(const ARequestFilter: string): IDSRestCachedJSONArray;
begin
  if FRetrieveCDSJSONCommand_Cache = nil then
  begin
    FRetrieveCDSJSONCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSJSONCommand_Cache.RequestType := 'GET';
    FRetrieveCDSJSONCommand_Cache.Text := 'TServerClosingInventory.RetrieveCDSJSON';
    FRetrieveCDSJSONCommand_Cache.Prepare(TServerClosingInventory_RetrieveCDSJSON_Cache);
  end;
  FRetrieveCDSJSONCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedJSONArray.Create(FRetrieveCDSJSONCommand_Cache.Parameters[0].Value.GetString);
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
  FRetrieveCDSJSONCommand.DisposeOf;
  FRetrieveCDSJSONCommand_Cache.DisposeOf;
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

function TServerPembayaranSupplierClient.RetrieveCDSJSON(const ARequestFilter: string): TJSONArray;
begin
  if FRetrieveCDSJSONCommand = nil then
  begin
    FRetrieveCDSJSONCommand := FConnection.CreateCommand;
    FRetrieveCDSJSONCommand.RequestType := 'GET';
    FRetrieveCDSJSONCommand.Text := 'TServerPembayaranSupplier.RetrieveCDSJSON';
    FRetrieveCDSJSONCommand.Prepare(TServerPembayaranSupplier_RetrieveCDSJSON);
  end;
  FRetrieveCDSJSONCommand.Execute(ARequestFilter);
  Result := TJSONArray(FRetrieveCDSJSONCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TServerPembayaranSupplierClient.RetrieveCDSJSON_Cache(const ARequestFilter: string): IDSRestCachedJSONArray;
begin
  if FRetrieveCDSJSONCommand_Cache = nil then
  begin
    FRetrieveCDSJSONCommand_Cache := FConnection.CreateCommand;
    FRetrieveCDSJSONCommand_Cache.RequestType := 'GET';
    FRetrieveCDSJSONCommand_Cache.Text := 'TServerPembayaranSupplier.RetrieveCDSJSON';
    FRetrieveCDSJSONCommand_Cache.Prepare(TServerPembayaranSupplier_RetrieveCDSJSON_Cache);
  end;
  FRetrieveCDSJSONCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedJSONArray.Create(FRetrieveCDSJSONCommand_Cache.Parameters[0].Value.GetString);
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
  FRetrieveCDSJSONCommand.DisposeOf;
  FRetrieveCDSJSONCommand_Cache.DisposeOf;
  FSaveCommand.DisposeOf;
  inherited;
end;

end.

