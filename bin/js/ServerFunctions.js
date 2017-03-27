// 
// Created by the DataSnap proxy generator.
// 3/27/2017 5:14:38 AM
// 

function DSAdmin(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("DSAdmin",connectionInfo);

  /*
   * @return result - Type on server: string
   */
  this.GetPlatformName = function() {
    var returnObject = this.executor.executeMethod('GetPlatformName', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GetPlatformName_URL = function() {
    return this.executor.getMethodURL("GetPlatformName", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: Boolean
   */
  this.ClearResources = function() {
    var returnObject = this.executor.executeMethod('ClearResources', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.ClearResources_URL = function() {
    return this.executor.getMethodURL("ClearResources", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDBXReader
   */
  this.FindPackages = function() {
    var returnObject = this.executor.executeMethod('FindPackages', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.FindPackages_URL = function() {
    return this.executor.getMethodURL("FindPackages", "GET", [], arguments[0])[0];
  };

  /*
   * @param PackageName [in] - Type on server: string
   * @param ClassPattern [in] - Type on server: string
   * @return result - Type on server: TDBXReader
   */
  this.FindClasses = function(PackageName, ClassPattern) {
    var returnObject = this.executor.executeMethod('FindClasses', "GET", [PackageName, ClassPattern], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.PackageName = PackageName;
        resultObject.ClassPattern = ClassPattern;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.FindClasses_URL = function(PackageName, ClassPattern) {
    return this.executor.getMethodURL("FindClasses", "GET", [PackageName, ClassPattern], arguments[2])[0];
  };

  /*
   * @param PackageName [in] - Type on server: string
   * @param ClassPattern [in] - Type on server: string
   * @param MethodPattern [in] - Type on server: string
   * @return result - Type on server: TDBXReader
   */
  this.FindMethods = function(PackageName, ClassPattern, MethodPattern) {
    var returnObject = this.executor.executeMethod('FindMethods', "GET", [PackageName, ClassPattern, MethodPattern], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.PackageName = PackageName;
        resultObject.ClassPattern = ClassPattern;
        resultObject.MethodPattern = MethodPattern;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.FindMethods_URL = function(PackageName, ClassPattern, MethodPattern) {
    return this.executor.getMethodURL("FindMethods", "GET", [PackageName, ClassPattern, MethodPattern], arguments[3])[0];
  };

  /*
   * @param ClassReader [in] - Type on server: TDBXReader
   */
  this.CreateServerClasses = function(ClassReader) {
    this.executor.executeMethod('"CreateServerClasses"', "POST", [ClassReader], arguments[1], false, arguments[2], arguments[3]);
  };

  /*
   * @param ClassReader [in] - Type on server: TDBXReader
   */
  this.DropServerClasses = function(ClassReader) {
    this.executor.executeMethod('"DropServerClasses"', "POST", [ClassReader], arguments[1], false, arguments[2], arguments[3]);
  };

  /*
   * @param MethodReader [in] - Type on server: TDBXReader
   */
  this.CreateServerMethods = function(MethodReader) {
    this.executor.executeMethod('"CreateServerMethods"', "POST", [MethodReader], arguments[1], false, arguments[2], arguments[3]);
  };

  /*
   * @param MethodReader [in] - Type on server: TDBXReader
   */
  this.DropServerMethods = function(MethodReader) {
    this.executor.executeMethod('"DropServerMethods"', "POST", [MethodReader], arguments[1], false, arguments[2], arguments[3]);
  };

  /*
   * @return result - Type on server: TDBXReader
   */
  this.GetServerClasses = function() {
    var returnObject = this.executor.executeMethod('GetServerClasses', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GetServerClasses_URL = function() {
    return this.executor.getMethodURL("GetServerClasses", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TJSONArray
   */
  this.ListClasses = function() {
    var returnObject = this.executor.executeMethod('ListClasses', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.ListClasses_URL = function() {
    return this.executor.getMethodURL("ListClasses", "GET", [], arguments[0])[0];
  };

  /*
   * @param ClassName [in] - Type on server: string
   * @return result - Type on server: TJSONObject
   */
  this.DescribeClass = function(ClassName) {
    var returnObject = this.executor.executeMethod('DescribeClass', "GET", [ClassName], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ClassName = ClassName;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.DescribeClass_URL = function(ClassName) {
    return this.executor.getMethodURL("DescribeClass", "GET", [ClassName], arguments[1])[0];
  };

  /*
   * @param ClassName [in] - Type on server: string
   * @return result - Type on server: TJSONArray
   */
  this.ListMethods = function(ClassName) {
    var returnObject = this.executor.executeMethod('ListMethods', "GET", [ClassName], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ClassName = ClassName;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.ListMethods_URL = function(ClassName) {
    return this.executor.getMethodURL("ListMethods", "GET", [ClassName], arguments[1])[0];
  };

  /*
   * @param ServerMethodName [in] - Type on server: string
   * @return result - Type on server: TJSONObject
   */
  this.DescribeMethod = function(ServerMethodName) {
    var returnObject = this.executor.executeMethod('DescribeMethod', "GET", [ServerMethodName], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ServerMethodName = ServerMethodName;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.DescribeMethod_URL = function(ServerMethodName) {
    return this.executor.getMethodURL("DescribeMethod", "GET", [ServerMethodName], arguments[1])[0];
  };

  /*
   * @return result - Type on server: TDBXReader
   */
  this.GetServerMethods = function() {
    var returnObject = this.executor.executeMethod('GetServerMethods', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GetServerMethods_URL = function() {
    return this.executor.getMethodURL("GetServerMethods", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDBXReader
   */
  this.GetServerMethodParameters = function() {
    var returnObject = this.executor.executeMethod('GetServerMethodParameters', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GetServerMethodParameters_URL = function() {
    return this.executor.getMethodURL("GetServerMethodParameters", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDBXReader
   */
  this.GetDatabaseConnectionProperties = function() {
    var returnObject = this.executor.executeMethod('GetDatabaseConnectionProperties', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GetDatabaseConnectionProperties_URL = function() {
    return this.executor.getMethodURL("GetDatabaseConnectionProperties", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: string
   */
  this.GetDSServerName = function() {
    var returnObject = this.executor.executeMethod('GetDSServerName', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GetDSServerName_URL = function() {
    return this.executor.getMethodURL("GetDSServerName", "GET", [], arguments[0])[0];
  };

  /*
   * @param ChannelName [in] - Type on server: string
   * @param ClientManagerId [in] - Type on server: string
   * @param CallbackId [in] - Type on server: string
   * @param ChannelNames [in] - Type on server: string
   * @param SecurityToken [in] - Type on server: string
   * @param ResponseData [in] - Type on server: TJSONValue
   * @return result - Type on server: TJSONValue
   */
  this.ConsumeClientChannel = function(ChannelName, ClientManagerId, CallbackId, ChannelNames, SecurityToken, ResponseData) {
    var returnObject = this.executor.executeMethod('"ConsumeClientChannel"', "POST", [ChannelName, ClientManagerId, CallbackId, ChannelNames, SecurityToken, ResponseData], arguments[6], true, arguments[7], arguments[8]);
    if (arguments[6] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ChannelName = ChannelName;
        resultObject.ClientManagerId = ClientManagerId;
        resultObject.CallbackId = CallbackId;
        resultObject.ChannelNames = ChannelNames;
        resultObject.SecurityToken = SecurityToken;
        resultObject.ResponseData = ResponseData;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param ChannelName [in] - Type on server: string
   * @param ClientManagerId [in] - Type on server: string
   * @param CallbackId [in] - Type on server: string
   * @param ChannelNames [in] - Type on server: string
   * @param SecurityToken [in] - Type on server: string
   * @param Timeout [in] - Type on server: Integer
   * @param ResponseData [in] - Type on server: TJSONValue
   * @return result - Type on server: TJSONValue
   */
  this.ConsumeClientChannelTimeout = function(ChannelName, ClientManagerId, CallbackId, ChannelNames, SecurityToken, Timeout, ResponseData) {
    var returnObject = this.executor.executeMethod('"ConsumeClientChannelTimeout"', "POST", [ChannelName, ClientManagerId, CallbackId, ChannelNames, SecurityToken, Timeout, ResponseData], arguments[7], true, arguments[8], arguments[9]);
    if (arguments[7] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ChannelName = ChannelName;
        resultObject.ClientManagerId = ClientManagerId;
        resultObject.CallbackId = CallbackId;
        resultObject.ChannelNames = ChannelNames;
        resultObject.SecurityToken = SecurityToken;
        resultObject.Timeout = Timeout;
        resultObject.ResponseData = ResponseData;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param ChannelId [in] - Type on server: string
   * @param SecurityToken [in] - Type on server: string
   * @return result - Type on server: Boolean
   */
  this.CloseClientChannel = function(ChannelId, SecurityToken) {
    var returnObject = this.executor.executeMethod('CloseClientChannel', "GET", [ChannelId, SecurityToken], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ChannelId = ChannelId;
        resultObject.SecurityToken = SecurityToken;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.CloseClientChannel_URL = function(ChannelId, SecurityToken) {
    return this.executor.getMethodURL("CloseClientChannel", "GET", [ChannelId, SecurityToken], arguments[2])[0];
  };

  /*
   * @param ChannelId [in] - Type on server: string
   * @param CallbackId [in] - Type on server: string
   * @param ChannelNames [in] - Type on server: string
   * @param SecurityToken [in] - Type on server: string
   * @return result - Type on server: Boolean
   */
  this.RegisterClientCallbackServer = function(ChannelId, CallbackId, ChannelNames, SecurityToken) {
    var returnObject = this.executor.executeMethod('RegisterClientCallbackServer', "GET", [ChannelId, CallbackId, ChannelNames, SecurityToken], arguments[4], true, arguments[5], arguments[6]);
    if (arguments[4] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ChannelId = ChannelId;
        resultObject.CallbackId = CallbackId;
        resultObject.ChannelNames = ChannelNames;
        resultObject.SecurityToken = SecurityToken;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RegisterClientCallbackServer_URL = function(ChannelId, CallbackId, ChannelNames, SecurityToken) {
    return this.executor.getMethodURL("RegisterClientCallbackServer", "GET", [ChannelId, CallbackId, ChannelNames, SecurityToken], arguments[4])[0];
  };

  /*
   * @param ChannelId [in] - Type on server: string
   * @param CallbackId [in] - Type on server: string
   * @param SecurityToken [in] - Type on server: string
   * @return result - Type on server: Boolean
   */
  this.UnregisterClientCallback = function(ChannelId, CallbackId, SecurityToken) {
    var returnObject = this.executor.executeMethod('UnregisterClientCallback', "GET", [ChannelId, CallbackId, SecurityToken], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ChannelId = ChannelId;
        resultObject.CallbackId = CallbackId;
        resultObject.SecurityToken = SecurityToken;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.UnregisterClientCallback_URL = function(ChannelId, CallbackId, SecurityToken) {
    return this.executor.getMethodURL("UnregisterClientCallback", "GET", [ChannelId, CallbackId, SecurityToken], arguments[3])[0];
  };

  /*
   * @param ChannelName [in] - Type on server: string
   * @param Msg [in] - Type on server: TJSONValue
   * @return result - Type on server: Boolean
   */
  this.BroadcastToChannel = function(ChannelName, Msg) {
    var returnObject = this.executor.executeMethod('"BroadcastToChannel"', "POST", [ChannelName, Msg], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ChannelName = ChannelName;
        resultObject.Msg = Msg;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param ChannelName [in] - Type on server: string
   * @param Msg [in] - Type on server: TObject
   * @return result - Type on server: Boolean
   */
  this.BroadcastObjectToChannel = function(ChannelName, Msg) {
    var returnObject = this.executor.executeMethod('"BroadcastObjectToChannel"', "POST", [ChannelName, Msg], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ChannelName = ChannelName;
        resultObject.Msg = Msg;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param ClientId [in] - Type on server: string
   * @param CallbackId [in] - Type on server: string
   * @param Msg [in] - Type on server: TJSONValue
   * @param Response [out] - Type on server: TJSONValue
   * @return result - Type on server: Boolean
   */
  this.NotifyCallback = function(ClientId, CallbackId, Msg) {
    var returnObject = this.executor.executeMethod('"NotifyCallback"', "POST", [ClientId, CallbackId, Msg], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ClientId = ClientId;
        resultObject.CallbackId = CallbackId;
        resultObject.Msg = Msg;
        resultObject.Response = resultArray[0];
        resultObject.result = resultArray[1];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param ClientId [in] - Type on server: string
   * @param CallbackId [in] - Type on server: string
   * @param Msg [in] - Type on server: TObject
   * @param Response [out] - Type on server: TObject
   * @return result - Type on server: Boolean
   */
  this.NotifyObject = function(ClientId, CallbackId, Msg) {
    var returnObject = this.executor.executeMethod('"NotifyObject"', "POST", [ClientId, CallbackId, Msg], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ClientId = ClientId;
        resultObject.CallbackId = CallbackId;
        resultObject.Msg = Msg;
        resultObject.Response = resultArray[0];
        resultObject.result = resultArray[1];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };
}

function TServerLaporan(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerLaporan",connectionInfo);

  /*
   * @return result - Type on server: TDataSet
   */
  this.DS_OverviewAccount = function() {
    var returnObject = this.executor.executeMethod('DS_OverviewAccount', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.DS_OverviewAccount_URL = function() {
    return this.executor.getMethodURL("DS_OverviewAccount", "GET", [], arguments[0])[0];
  };

  /*
   * @param ATglAwal [in] - Type on server: TDateTime
   * @param ATglAkhir [in] - Type on server: TDateTime
   * @param ABarang [in] - Type on server: TBarang
   * @param AGudang [in] - Type on server: TGudang
   * @param ACabang [in] - Type on server: TCabang
   * @return result - Type on server: TDataSet
   */
  this.LaporanKartok = function(ATglAwal, ATglAkhir, ABarang, AGudang, ACabang) {
    var returnObject = this.executor.executeMethod('"LaporanKartok"', "POST", [ATglAwal, ATglAkhir, ABarang, AGudang, ACabang], arguments[5], true, arguments[6], arguments[7]);
    if (arguments[5] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglAwal = ATglAwal;
        resultObject.ATglAkhir = ATglAkhir;
        resultObject.ABarang = ABarang;
        resultObject.AGudang = AGudang;
        resultObject.ACabang = ACabang;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param ACabang [in] - Type on server: TCabang
   * @return result - Type on server: TDataSet
   */
  this.LaporanStockSekarang = function(ACabang) {
    var returnObject = this.executor.executeMethod('"LaporanStockSekarang"', "POST", [ACabang], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ACabang = ACabang;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param ABulan [in] - Type on server: Integer
   * @param ATahun [in] - Type on server: Integer
   * @return result - Type on server: TDataSet
   */
  this.LookUpPenerimaan = function(ABulan, ATahun) {
    var returnObject = this.executor.executeMethod('LookUpPenerimaan', "GET", [ABulan, ATahun], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ABulan = ABulan;
        resultObject.ATahun = ATahun;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.LookUpPenerimaan_URL = function(ABulan, ATahun) {
    return this.executor.getMethodURL("LookUpPenerimaan", "GET", [ABulan, ATahun], arguments[2])[0];
  };

  /*
   * @param ATglAwal [in] - Type on server: TDateTime
   * @param ATglAtglAkhir [in] - Type on server: TDateTime
   * @return result - Type on server: TDataSet
   */
  this.RetriveMutasiBarang = function(ATglAwal, ATglAtglAkhir) {
    var returnObject = this.executor.executeMethod('RetriveMutasiBarang', "GET", [ATglAwal, ATglAtglAkhir], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglAwal = ATglAwal;
        resultObject.ATglAtglAkhir = ATglAtglAkhir;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetriveMutasiBarang_URL = function(ATglAwal, ATglAtglAkhir) {
    return this.executor.getMethodURL("RetriveMutasiBarang", "GET", [ATglAwal, ATglAtglAkhir], arguments[2])[0];
  };

  /*
   * @param ATglAwal [in] - Type on server: TDateTime
   * @param ATglAtglAkhir [in] - Type on server: TDateTime
   * @param ACabang [in] - Type on server: TCabang
   * @return result - Type on server: TDataSet
   */
  this.RetrivePenjualan = function(ATglAwal, ATglAtglAkhir, ACabang) {
    var returnObject = this.executor.executeMethod('"RetrivePenjualan"', "POST", [ATglAwal, ATglAtglAkhir, ACabang], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglAwal = ATglAwal;
        resultObject.ATglAtglAkhir = ATglAtglAkhir;
        resultObject.ACabang = ACabang;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param ATglAwal [in] - Type on server: TDateTime
   * @param ATglAtglAkhir [in] - Type on server: TDateTime
   * @param ACabang [in] - Type on server: TCabang
   * @return result - Type on server: TDataSet
   */
  this.RetriveCI = function(ATglAwal, ATglAtglAkhir, ACabang) {
    var returnObject = this.executor.executeMethod('"RetriveCI"', "POST", [ATglAwal, ATglAtglAkhir, ACabang], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglAwal = ATglAwal;
        resultObject.ATglAtglAkhir = ATglAtglAkhir;
        resultObject.ACabang = ACabang;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param ATglAwal [in] - Type on server: TDateTime
   * @param ATglAtglAkhir [in] - Type on server: TDateTime
   * @param ACabang [in] - Type on server: TCabang
   * @return result - Type on server: TDataSet
   */
  this.RetrivePenerimaanKas = function(ATglAwal, ATglAtglAkhir, ACabang) {
    var returnObject = this.executor.executeMethod('"RetrivePenerimaanKas"', "POST", [ATglAwal, ATglAtglAkhir, ACabang], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglAwal = ATglAwal;
        resultObject.ATglAtglAkhir = ATglAtglAkhir;
        resultObject.ACabang = ACabang;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param ASupplier [in] - Type on server: TSupplier
   * @return result - Type on server: TDataSet
   */
  this.RetriveAR = function(ASupplier) {
    var returnObject = this.executor.executeMethod('"RetriveAR"', "POST", [ASupplier], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ASupplier = ASupplier;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };
}

function TServerBarang(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerBarang",connectionInfo);

  /*
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TBarang
   */
  this.Retrieve = function(AID) {
    var returnObject = this.executor.executeMethod('Retrieve', "GET", [AID], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Retrieve_URL = function(AID) {
    return this.executor.getMethodURL("Retrieve", "GET", [AID], arguments[1])[0];
  };

  /*
   * @param AKode [in] - Type on server: string
   * @return result - Type on server: TBarang
   */
  this.RetrieveKode = function(AKode) {
    var returnObject = this.executor.executeMethod('RetrieveKode', "GET", [AKode], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AKode = AKode;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveKode_URL = function(AKode) {
    return this.executor.getMethodURL("RetrieveKode", "GET", [AKode], arguments[1])[0];
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Delete = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"Delete"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: TDataSet
   */
  this.RetrieveCDS = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"RetrieveCDS"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AOBject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Save = function(AOBject) {
    var returnObject = this.executor.executeMethod('"Save"', "POST", [AOBject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AOBject = AOBject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };
}

function TServerCustomerInvoice(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerCustomerInvoice",connectionInfo);

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.AfterSave = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"AfterSave"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.BeforeSave = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"BeforeSave"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TCustomerInvoice
   */
  this.Retrieve = function(AID) {
    var returnObject = this.executor.executeMethod('Retrieve', "GET", [AID], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Retrieve_URL = function(AID) {
    return this.executor.getMethodURL("Retrieve", "GET", [AID], arguments[1])[0];
  };

  /*
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.RetrieveCDSlip = function(AID) {
    var returnObject = this.executor.executeMethod('RetrieveCDSlip', "GET", [AID], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveCDSlip_URL = function(AID) {
    return this.executor.getMethodURL("RetrieveCDSlip", "GET", [AID], arguments[1])[0];
  };

  /*
   * @param ANoBukti [in] - Type on server: string
   * @return result - Type on server: TCustomerInvoice
   */
  this.RetrieveNoBukti = function(ANoBukti) {
    var returnObject = this.executor.executeMethod('RetrieveNoBukti', "GET", [ANoBukti], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ANoBukti = ANoBukti;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveNoBukti_URL = function(ANoBukti) {
    return this.executor.getMethodURL("RetrieveNoBukti", "GET", [ANoBukti], arguments[1])[0];
  };

  /*
   * @param ATglBukti [in] - Type on server: TDateTime
   * @param APrefix [in] - Type on server: string
   * @return result - Type on server: string
   */
  this.GenerateNoBukti = function(ATglBukti, APrefix) {
    var returnObject = this.executor.executeMethod('GenerateNoBukti', "GET", [ATglBukti, APrefix], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglBukti = ATglBukti;
        resultObject.APrefix = APrefix;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GenerateNoBukti_URL = function(ATglBukti, APrefix) {
    return this.executor.getMethodURL("GenerateNoBukti", "GET", [ATglBukti, APrefix], arguments[2])[0];
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Delete = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"Delete"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: TDataSet
   */
  this.RetrieveCDS = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"RetrieveCDS"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AOBject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Save = function(AOBject) {
    var returnObject = this.executor.executeMethod('"Save"', "POST", [AOBject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AOBject = AOBject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };
}

function TServerUOM(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerUOM",connectionInfo);

  /*
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TUOM
   */
  this.Retrieve = function(AID) {
    var returnObject = this.executor.executeMethod('Retrieve', "GET", [AID], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Retrieve_URL = function(AID) {
    return this.executor.getMethodURL("Retrieve", "GET", [AID], arguments[1])[0];
  };

  /*
   * @param AKode [in] - Type on server: string
   * @return result - Type on server: TUOM
   */
  this.RetrieveKode = function(AKode) {
    var returnObject = this.executor.executeMethod('RetrieveKode', "GET", [AKode], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AKode = AKode;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveKode_URL = function(AKode) {
    return this.executor.getMethodURL("RetrieveKode", "GET", [AKode], arguments[1])[0];
  };
}

function TServerSupplier(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerSupplier",connectionInfo);

  /*
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TSupplier
   */
  this.Retrieve = function(AID) {
    var returnObject = this.executor.executeMethod('Retrieve', "GET", [AID], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Retrieve_URL = function(AID) {
    return this.executor.getMethodURL("Retrieve", "GET", [AID], arguments[1])[0];
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Delete = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"Delete"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: TDataSet
   */
  this.RetrieveCDS = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"RetrieveCDS"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AOBject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Save = function(AOBject) {
    var returnObject = this.executor.executeMethod('"Save"', "POST", [AOBject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AOBject = AOBject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };
}

function TServerGroupBarang(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerGroupBarang",connectionInfo);

  /*
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TGroupBarang
   */
  this.Retrieve = function(AID) {
    var returnObject = this.executor.executeMethod('Retrieve', "GET", [AID], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Retrieve_URL = function(AID) {
    return this.executor.getMethodURL("Retrieve", "GET", [AID], arguments[1])[0];
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Delete = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"Delete"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: TDataSet
   */
  this.RetrieveCDS = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"RetrieveCDS"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AOBject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Save = function(AOBject) {
    var returnObject = this.executor.executeMethod('"Save"', "POST", [AOBject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AOBject = AOBject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };
}

function TServerPenerimaanBarang(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerPenerimaanBarang",connectionInfo);

  /*
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TPenerimaanBarang
   */
  this.Retrieve = function(AID) {
    var returnObject = this.executor.executeMethod('Retrieve', "GET", [AID], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Retrieve_URL = function(AID) {
    return this.executor.getMethodURL("Retrieve", "GET", [AID], arguments[1])[0];
  };

  /*
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.RetrieveCDSlip = function(AID) {
    var returnObject = this.executor.executeMethod('RetrieveCDSlip', "GET", [AID], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveCDSlip_URL = function(AID) {
    return this.executor.getMethodURL("RetrieveCDSlip", "GET", [AID], arguments[1])[0];
  };

  /*
   * @param ANoBukti [in] - Type on server: string
   * @return result - Type on server: TPenerimaanBarang
   */
  this.RetrieveNoBukti = function(ANoBukti) {
    var returnObject = this.executor.executeMethod('RetrieveNoBukti', "GET", [ANoBukti], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ANoBukti = ANoBukti;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveNoBukti_URL = function(ANoBukti) {
    return this.executor.getMethodURL("RetrieveNoBukti", "GET", [ANoBukti], arguments[1])[0];
  };

  /*
   * @param ATglBukti [in] - Type on server: TDateTime
   * @param APrefix [in] - Type on server: string
   * @return result - Type on server: string
   */
  this.GenerateNoBukti = function(ATglBukti, APrefix) {
    var returnObject = this.executor.executeMethod('GenerateNoBukti', "GET", [ATglBukti, APrefix], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglBukti = ATglBukti;
        resultObject.APrefix = APrefix;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GenerateNoBukti_URL = function(ATglBukti, APrefix) {
    return this.executor.getMethodURL("GenerateNoBukti", "GET", [ATglBukti, APrefix], arguments[2])[0];
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Delete = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"Delete"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: TDataSet
   */
  this.RetrieveCDS = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"RetrieveCDS"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AOBject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Save = function(AOBject) {
    var returnObject = this.executor.executeMethod('"Save"', "POST", [AOBject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AOBject = AOBject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };
}

function TServerCabang(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerCabang",connectionInfo);

  /*
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TCabang
   */
  this.Retrieve = function(AID) {
    var returnObject = this.executor.executeMethod('Retrieve', "GET", [AID], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Retrieve_URL = function(AID) {
    return this.executor.getMethodURL("Retrieve", "GET", [AID], arguments[1])[0];
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Delete = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"Delete"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: TDataSet
   */
  this.RetrieveCDS = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"RetrieveCDS"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AOBject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Save = function(AOBject) {
    var returnObject = this.executor.executeMethod('"Save"', "POST", [AOBject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AOBject = AOBject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };
}

function TServerLogAppObject(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerLogAppObject",connectionInfo);

  /*
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TLogAppObject
   */
  this.Retrieve = function(AID) {
    var returnObject = this.executor.executeMethod('Retrieve', "GET", [AID], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Retrieve_URL = function(AID) {
    return this.executor.getMethodURL("Retrieve", "GET", [AID], arguments[1])[0];
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Delete = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"Delete"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: TDataSet
   */
  this.RetrieveCDS = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"RetrieveCDS"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AOBject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Save = function(AOBject) {
    var returnObject = this.executor.executeMethod('"Save"', "POST", [AOBject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AOBject = AOBject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };
}

function TServerUtils(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerUtils",connectionInfo);

  /*
   * @return result - Type on server: Boolean
   */
  this.CheckKoneksi = function() {
    var returnObject = this.executor.executeMethod('CheckKoneksi', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.CheckKoneksi_URL = function() {
    return this.executor.getMethodURL("CheckKoneksi", "GET", [], arguments[0])[0];
  };
}

function TServerStockSekarang(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerStockSekarang",connectionInfo);

  /*
   * @param ANoBukti [in] - Type on server: string
   * @return result - Type on server: Boolean
   */
  this.HapusMutasi = function(ANoBukti) {
    var returnObject = this.executor.executeMethod('HapusMutasi', "GET", [ANoBukti], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ANoBukti = ANoBukti;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.HapusMutasi_URL = function(ANoBukti) {
    return this.executor.getMethodURL("HapusMutasi", "GET", [ANoBukti], arguments[1])[0];
  };

  /*
   * @param ABarang [in] - Type on server: TBarang
   * @param AGudang [in] - Type on server: TGudang
   * @return result - Type on server: TStockSekarang
   */
  this.Retrieve = function(ABarang, AGudang) {
    var returnObject = this.executor.executeMethod('"Retrieve"', "POST", [ABarang, AGudang], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ABarang = ABarang;
        resultObject.AGudang = AGudang;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Delete = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"Delete"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: TDataSet
   */
  this.RetrieveCDS = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"RetrieveCDS"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AOBject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Save = function(AOBject) {
    var returnObject = this.executor.executeMethod('"Save"', "POST", [AOBject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AOBject = AOBject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };
}

function TServerReturSupplier(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerReturSupplier",connectionInfo);

  /*
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TReturSupplier
   */
  this.Retrieve = function(AID) {
    var returnObject = this.executor.executeMethod('Retrieve', "GET", [AID], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Retrieve_URL = function(AID) {
    return this.executor.getMethodURL("Retrieve", "GET", [AID], arguments[1])[0];
  };

  /*
   * @param ANoBukti [in] - Type on server: string
   * @return result - Type on server: TReturSupplier
   */
  this.RetrieveNoBukti = function(ANoBukti) {
    var returnObject = this.executor.executeMethod('RetrieveNoBukti', "GET", [ANoBukti], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ANoBukti = ANoBukti;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveNoBukti_URL = function(ANoBukti) {
    return this.executor.getMethodURL("RetrieveNoBukti", "GET", [ANoBukti], arguments[1])[0];
  };

  /*
   * @param ATglBukti [in] - Type on server: TDateTime
   * @param APrefix [in] - Type on server: string
   * @return result - Type on server: string
   */
  this.GenerateNoBukti = function(ATglBukti, APrefix) {
    var returnObject = this.executor.executeMethod('GenerateNoBukti', "GET", [ATglBukti, APrefix], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglBukti = ATglBukti;
        resultObject.APrefix = APrefix;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GenerateNoBukti_URL = function(ATglBukti, APrefix) {
    return this.executor.getMethodURL("GenerateNoBukti", "GET", [ATglBukti, APrefix], arguments[2])[0];
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Delete = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"Delete"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: TDataSet
   */
  this.RetrieveCDS = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"RetrieveCDS"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AOBject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Save = function(AOBject) {
    var returnObject = this.executor.executeMethod('"Save"', "POST", [AOBject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AOBject = AOBject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };
}

function TServerClosingInventory(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerClosingInventory",connectionInfo);

  /*
   * @param APeriode [in] - Type on server: Integer
   * @param ACabang [in] - Type on server: TCabang
   * @return result - Type on server: Boolean
   */
  this.Close = function(APeriode, ACabang) {
    var returnObject = this.executor.executeMethod('"Close"', "POST", [APeriode, ACabang], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.APeriode = APeriode;
        resultObject.ACabang = ACabang;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Delete = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"Delete"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: TDataSet
   */
  this.RetrieveCDS = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"RetrieveCDS"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AOBject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Save = function(AOBject) {
    var returnObject = this.executor.executeMethod('"Save"', "POST", [AOBject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AOBject = AOBject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };
}

function TServerPembayaranSupplier(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerPembayaranSupplier",connectionInfo);

  /*
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TPembayaranSupplier
   */
  this.Retrieve = function(AID) {
    var returnObject = this.executor.executeMethod('Retrieve', "GET", [AID], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Retrieve_URL = function(AID) {
    return this.executor.getMethodURL("Retrieve", "GET", [AID], arguments[1])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.RetrieveCDS2 = function() {
    var returnObject = this.executor.executeMethod('RetrieveCDS2', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveCDS2_URL = function() {
    return this.executor.getMethodURL("RetrieveCDS2", "GET", [], arguments[0])[0];
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Delete = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"Delete"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: TDataSet
   */
  this.RetrieveCDS = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"RetrieveCDS"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AOBject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Save = function(AOBject) {
    var returnObject = this.executor.executeMethod('"Save"', "POST", [AOBject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AOBject = AOBject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };
}

function TServerGudang(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerGudang",connectionInfo);

  /*
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TGudang
   */
  this.Retrieve = function(AID) {
    var returnObject = this.executor.executeMethod('Retrieve', "GET", [AID], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Retrieve_URL = function(AID) {
    return this.executor.getMethodURL("Retrieve", "GET", [AID], arguments[1])[0];
  };

  /*
   * @param AKode [in] - Type on server: string
   * @return result - Type on server: TGudang
   */
  this.RetrieveKode = function(AKode) {
    var returnObject = this.executor.executeMethod('RetrieveKode', "GET", [AKode], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AKode = AKode;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveKode_URL = function(AKode) {
    return this.executor.getMethodURL("RetrieveKode", "GET", [AKode], arguments[1])[0];
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Delete = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"Delete"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: TDataSet
   */
  this.RetrieveCDS = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"RetrieveCDS"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AOBject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Save = function(AOBject) {
    var returnObject = this.executor.executeMethod('"Save"', "POST", [AOBject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AOBject = AOBject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };
}

function TServerPenjualan(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerPenjualan",connectionInfo);

  /*
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TPenjualan
   */
  this.Retrieve = function(AID) {
    var returnObject = this.executor.executeMethod('Retrieve', "GET", [AID], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Retrieve_URL = function(AID) {
    return this.executor.getMethodURL("Retrieve", "GET", [AID], arguments[1])[0];
  };

  /*
   * @param ANoBukti [in] - Type on server: string
   * @return result - Type on server: TPenjualan
   */
  this.RetrieveNoBukti = function(ANoBukti) {
    var returnObject = this.executor.executeMethod('RetrieveNoBukti', "GET", [ANoBukti], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ANoBukti = ANoBukti;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveNoBukti_URL = function(ANoBukti) {
    return this.executor.getMethodURL("RetrieveNoBukti", "GET", [ANoBukti], arguments[1])[0];
  };

  /*
   * @param ATglAwal [in] - Type on server: TDateTime
   * @param ATglAtglAkhir [in] - Type on server: TDateTime
   * @param ACabang [in] - Type on server: TCabang
   * @param ANoBukti [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.RetrieveCDSlip = function(ATglAwal, ATglAtglAkhir, ACabang, ANoBukti) {
    var returnObject = this.executor.executeMethod('"RetrieveCDSlip"', "POST", [ATglAwal, ATglAtglAkhir, ACabang, ANoBukti], arguments[4], true, arguments[5], arguments[6]);
    if (arguments[4] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglAwal = ATglAwal;
        resultObject.ATglAtglAkhir = ATglAtglAkhir;
        resultObject.ACabang = ACabang;
        resultObject.ANoBukti = ANoBukti;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param ATglBukti [in] - Type on server: TDateTime
   * @param APrefix [in] - Type on server: string
   * @return result - Type on server: string
   */
  this.GenerateNoBukti = function(ATglBukti, APrefix) {
    var returnObject = this.executor.executeMethod('GenerateNoBukti', "GET", [ATglBukti, APrefix], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglBukti = ATglBukti;
        resultObject.APrefix = APrefix;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GenerateNoBukti_URL = function(ATglBukti, APrefix) {
    return this.executor.getMethodURL("GenerateNoBukti", "GET", [ATglBukti, APrefix], arguments[2])[0];
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Delete = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"Delete"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: TDataSet
   */
  this.RetrieveCDS = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"RetrieveCDS"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AOBject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Save = function(AOBject) {
    var returnObject = this.executor.executeMethod('"Save"', "POST", [AOBject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AOBject = AOBject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };
}

function TServerAR(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerAR",connectionInfo);

  /*
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TAR
   */
  this.Retrieve = function(AID) {
    var returnObject = this.executor.executeMethod('Retrieve', "GET", [AID], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Retrieve_URL = function(AID) {
    return this.executor.getMethodURL("Retrieve", "GET", [AID], arguments[1])[0];
  };

  /*
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.RetrieveCDSlip = function(AID) {
    var returnObject = this.executor.executeMethod('RetrieveCDSlip', "GET", [AID], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveCDSlip_URL = function(AID) {
    return this.executor.getMethodURL("RetrieveCDSlip", "GET", [AID], arguments[1])[0];
  };

  /*
   * @param ANoBukti [in] - Type on server: string
   * @return result - Type on server: TAR
   */
  this.RetrieveNoBukti = function(ANoBukti) {
    var returnObject = this.executor.executeMethod('RetrieveNoBukti', "GET", [ANoBukti], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ANoBukti = ANoBukti;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveNoBukti_URL = function(ANoBukti) {
    return this.executor.getMethodURL("RetrieveNoBukti", "GET", [ANoBukti], arguments[1])[0];
  };

  /*
   * @param ATglBukti [in] - Type on server: TDateTime
   * @param APrefix [in] - Type on server: string
   * @return result - Type on server: string
   */
  this.GenerateNoBukti = function(ATglBukti, APrefix) {
    var returnObject = this.executor.executeMethod('GenerateNoBukti', "GET", [ATglBukti, APrefix], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglBukti = ATglBukti;
        resultObject.APrefix = APrefix;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GenerateNoBukti_URL = function(ATglBukti, APrefix) {
    return this.executor.getMethodURL("GenerateNoBukti", "GET", [ATglBukti, APrefix], arguments[2])[0];
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Delete = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"Delete"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: TDataSet
   */
  this.RetrieveCDS = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"RetrieveCDS"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AOBject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Save = function(AOBject) {
    var returnObject = this.executor.executeMethod('"Save"', "POST", [AOBject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AOBject = AOBject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };
}

function TServerAccount(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerAccount",connectionInfo);

  /*
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TAccount
   */
  this.Retrieve = function(AID) {
    var returnObject = this.executor.executeMethod('Retrieve', "GET", [AID], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Retrieve_URL = function(AID) {
    return this.executor.getMethodURL("Retrieve", "GET", [AID], arguments[1])[0];
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Delete = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"Delete"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: TDataSet
   */
  this.RetrieveCDS = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"RetrieveCDS"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AOBject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Save = function(AOBject) {
    var returnObject = this.executor.executeMethod('"Save"', "POST", [AOBject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AOBject = AOBject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };
}

function TServerRekBank(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerRekBank",connectionInfo);

  /*
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TRekBank
   */
  this.Retrieve = function(AID) {
    var returnObject = this.executor.executeMethod('Retrieve', "GET", [AID], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Retrieve_URL = function(AID) {
    return this.executor.getMethodURL("Retrieve", "GET", [AID], arguments[1])[0];
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Delete = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"Delete"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: TDataSet
   */
  this.RetrieveCDS = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"RetrieveCDS"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AAppObject = AAppObject;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AOBject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.Save = function(AOBject) {
    var returnObject = this.executor.executeMethod('"Save"', "POST", [AOBject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AOBject = AOBject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };
}

var JSProxyClassList = {
  "DSAdmin": ["GetPlatformName","ClearResources","FindPackages","FindClasses","FindMethods","CreateServerClasses","DropServerClasses","CreateServerMethods","DropServerMethods","GetServerClasses","ListClasses","DescribeClass","ListMethods","DescribeMethod","GetServerMethods","GetServerMethodParameters","GetDatabaseConnectionProperties","GetDSServerName","ConsumeClientChannel","ConsumeClientChannelTimeout","CloseClientChannel","RegisterClientCallbackServer","UnregisterClientCallback","BroadcastToChannel","BroadcastObjectToChannel","NotifyCallback","NotifyObject"],
  "TServerLaporan": ["DS_OverviewAccount","LaporanKartok","LaporanStockSekarang","LookUpPenerimaan","RetriveMutasiBarang","RetrivePenjualan","RetriveCI","RetrivePenerimaanKas","RetriveAR"],
  "TServerBarang": ["Retrieve","RetrieveKode","Delete","RetrieveCDS","Save"],
  "TServerCustomerInvoice": ["AfterSave","BeforeSave","Retrieve","RetrieveCDSlip","RetrieveNoBukti","GenerateNoBukti","Delete","RetrieveCDS","Save"],
  "TServerUOM": ["Retrieve","RetrieveKode"],
  "TServerSupplier": ["Retrieve","Delete","RetrieveCDS","Save"],
  "TServerGroupBarang": ["Retrieve","Delete","RetrieveCDS","Save"],
  "TServerPenerimaanBarang": ["Retrieve","RetrieveCDSlip","RetrieveNoBukti","GenerateNoBukti","Delete","RetrieveCDS","Save"],
  "TServerCabang": ["Retrieve","Delete","RetrieveCDS","Save"],
  "TServerLogAppObject": ["Retrieve","Delete","RetrieveCDS","Save"],
  "TServerUtils": ["CheckKoneksi"],
  "TServerStockSekarang": ["HapusMutasi","Retrieve","Delete","RetrieveCDS","Save"],
  "TServerReturSupplier": ["Retrieve","RetrieveNoBukti","GenerateNoBukti","Delete","RetrieveCDS","Save"],
  "TServerClosingInventory": ["Close","Delete","RetrieveCDS","Save"],
  "TServerPembayaranSupplier": ["Retrieve","RetrieveCDS2","Delete","RetrieveCDS","Save"],
  "TServerGudang": ["Retrieve","RetrieveKode","Delete","RetrieveCDS","Save"],
  "TServerPenjualan": ["Retrieve","RetrieveNoBukti","RetrieveCDSlip","GenerateNoBukti","Delete","RetrieveCDS","Save"],
  "TServerAR": ["Retrieve","RetrieveCDSlip","RetrieveNoBukti","GenerateNoBukti","Delete","RetrieveCDS","Save"],
  "TServerAccount": ["Retrieve","Delete","RetrieveCDS","Save"],
  "TServerRekBank": ["Retrieve","Delete","RetrieveCDS","Save"]
};

