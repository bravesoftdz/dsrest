﻿// 
// Created by the DataSnap proxy generator.
// 10/9/2017 5:12:30 AM
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
   * @return result - Type on server: TFDJSONDataSets
   */
  this.LaporanKartok = function(ATglAwal, ATglAkhir, ABarang, AGudang) {
    var returnObject = this.executor.executeMethod('"LaporanKartok"', "POST", [ATglAwal, ATglAkhir, ABarang, AGudang], arguments[4], true, arguments[5], arguments[6]);
    if (arguments[4] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglAwal = ATglAwal;
        resultObject.ATglAkhir = ATglAkhir;
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
   * @param ATglAwal [in] - Type on server: TDateTime
   * @param ATglAkhir [in] - Type on server: TDateTime
   * @param ASupplier [in] - Type on server: TSupplier
   * @param ACabang [in] - Type on server: TCabang
   * @param ANoAP [in] - Type on server: string
   * @return result - Type on server: TFDJSONDataSets
   */
  this.LaporanKarAP = function(ATglAwal, ATglAkhir, ASupplier, ACabang, ANoAP) {
    var returnObject = this.executor.executeMethod('"LaporanKarAP"', "POST", [ATglAwal, ATglAkhir, ASupplier, ACabang, ANoAP], arguments[5], true, arguments[6], arguments[7]);
    if (arguments[5] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglAwal = ATglAwal;
        resultObject.ATglAkhir = ATglAkhir;
        resultObject.ASupplier = ASupplier;
        resultObject.ACabang = ACabang;
        resultObject.ANoAP = ANoAP;
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
   * @param ATglAkhir [in] - Type on server: TDateTime
   * @param ACabang [in] - Type on server: TCabang
   * @return result - Type on server: TDataSet
   */
  this.RetrieveCDSTAGRequestKepada = function(ATglAwal, ATglAkhir, ACabang) {
    var returnObject = this.executor.executeMethod('"RetrieveCDSTAGRequestKepada"', "POST", [ATglAwal, ATglAkhir, ACabang], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglAwal = ATglAwal;
        resultObject.ATglAkhir = ATglAkhir;
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
   * @param ATglAkhir [in] - Type on server: TDateTime
   * @param ACabang [in] - Type on server: TCabang
   * @return result - Type on server: TDataSet
   */
  this.RetrieveCDSTAGRequestDari = function(ATglAwal, ATglAkhir, ACabang) {
    var returnObject = this.executor.executeMethod('"RetrieveCDSTAGRequestDari"', "POST", [ATglAwal, ATglAkhir, ACabang], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglAwal = ATglAwal;
        resultObject.ATglAkhir = ATglAkhir;
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
   * @param ATglAkhir [in] - Type on server: TDateTime
   * @param ACabang [in] - Type on server: TCabang
   * @return result - Type on server: TDataSet
   */
  this.RetrieveTACKirim = function(ATglAwal, ATglAkhir, ACabang) {
    var returnObject = this.executor.executeMethod('"RetrieveTACKirim"', "POST", [ATglAwal, ATglAkhir, ACabang], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglAwal = ATglAwal;
        resultObject.ATglAkhir = ATglAkhir;
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
   * @param ATahun [in] - Type on server: Integer
   * @param ABulan [in] - Type on server: Integer
   * @return result - Type on server: TDataSet
   */
  this.RetrieveGaji = function(ATahun, ABulan) {
    var returnObject = this.executor.executeMethod('RetrieveGaji', "GET", [ATahun, ABulan], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATahun = ATahun;
        resultObject.ABulan = ABulan;
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

  this.RetrieveGaji_URL = function(ATahun, ABulan) {
    return this.executor.getMethodURL("RetrieveGaji", "GET", [ATahun, ABulan], arguments[2])[0];
  };

  /*
   * @param ATglAwal [in] - Type on server: TDateTime
   * @param ATglAkhir [in] - Type on server: TDateTime
   * @param ACabang [in] - Type on server: TCabang
   * @return result - Type on server: TDataSet
   */
  this.RetrieveTACTerima = function(ATglAwal, ATglAkhir, ACabang) {
    var returnObject = this.executor.executeMethod('"RetrieveTACTerima"', "POST", [ATglAwal, ATglAkhir, ACabang], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglAwal = ATglAwal;
        resultObject.ATglAkhir = ATglAkhir;
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
   * @param ATglAkhir [in] - Type on server: TDateTime
   * @param ACabang [in] - Type on server: TCabang
   * @return result - Type on server: TDataSet
   */
  this.RetrieveTransferAntarGudang = function(ATglAwal, ATglAkhir, ACabang) {
    var returnObject = this.executor.executeMethod('"RetrieveTransferAntarGudang"', "POST", [ATglAwal, ATglAkhir, ACabang], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglAwal = ATglAwal;
        resultObject.ATglAkhir = ATglAkhir;
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
   * @param ATglAkhir [in] - Type on server: TDateTime
   * @param ACabang [in] - Type on server: TCabang
   * @param AGudang [in] - Type on server: TGudang
   * @return result - Type on server: TDataSet
   */
  this.RetriveMutasiBarang = function(ATglAwal, ATglAkhir, ACabang, AGudang) {
    var returnObject = this.executor.executeMethod('"RetriveMutasiBarang"', "POST", [ATglAwal, ATglAkhir, ACabang, AGudang], arguments[4], true, arguments[5], arguments[6]);
    if (arguments[4] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglAwal = ATglAwal;
        resultObject.ATglAkhir = ATglAkhir;
        resultObject.ACabang = ACabang;
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

  /*
   * @param ATglAwal [in] - Type on server: TDateTime
   * @param ATglAtglAkhir [in] - Type on server: TDateTime
   * @param ACabang [in] - Type on server: TCabang
   * @return result - Type on server: TDataSet
   */
  this.RetrivePengeluaranKas = function(ATglAwal, ATglAtglAkhir, ACabang) {
    var returnObject = this.executor.executeMethod('"RetrivePengeluaranKas"', "POST", [ATglAwal, ATglAtglAkhir, ACabang], arguments[3], true, arguments[4], arguments[5]);
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
   * @param AJenisJurnal [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.RetriveJurnal = function(ATglAwal, ATglAtglAkhir, ACabang, AJenisJurnal) {
    var returnObject = this.executor.executeMethod('"RetriveJurnal"', "POST", [ATglAwal, ATglAtglAkhir, ACabang, AJenisJurnal], arguments[4], true, arguments[5], arguments[6]);
    if (arguments[4] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglAwal = ATglAwal;
        resultObject.ATglAtglAkhir = ATglAtglAkhir;
        resultObject.ACabang = ACabang;
        resultObject.AJenisJurnal = AJenisJurnal;
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
   * @param AtglAkhir [in] - Type on server: TDateTime
   * @param ACabang [in] - Type on server: TCabang
   * @param AGudang [in] - Type on server: TGudang
   * @return result - Type on server: TDataSet
   */
  this.LaporanPenerimaanBarang = function(ATglAwal, AtglAkhir, ACabang, AGudang) {
    var returnObject = this.executor.executeMethod('"LaporanPenerimaanBarang"', "POST", [ATglAwal, AtglAkhir, ACabang, AGudang], arguments[4], true, arguments[5], arguments[6]);
    if (arguments[4] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglAwal = ATglAwal;
        resultObject.AtglAkhir = AtglAkhir;
        resultObject.ACabang = ACabang;
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
   * @param ATglAwal [in] - Type on server: TDateTime
   * @param AtglAkhir [in] - Type on server: TDateTime
   * @param ACabang [in] - Type on server: TCabang
   * @param AIsTglJatuhTempo [in] - Type on server: Boolean
   * @return result - Type on server: TFDJSONDataSets
   */
  this.LaporanAP = function(ATglAwal, AtglAkhir, ACabang, AIsTglJatuhTempo) {
    var returnObject = this.executor.executeMethod('"LaporanAP"', "POST", [ATglAwal, AtglAkhir, ACabang, AIsTglJatuhTempo], arguments[4], true, arguments[5], arguments[6]);
    if (arguments[4] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglAwal = ATglAwal;
        resultObject.AtglAkhir = AtglAkhir;
        resultObject.ACabang = ACabang;
        resultObject.AIsTglJatuhTempo = AIsTglJatuhTempo;
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
   * @param AtglAkhir [in] - Type on server: TDateTime
   * @param ACabang [in] - Type on server: TCabang
   * @param AIsTglJatuhTempo [in] - Type on server: Boolean
   * @return result - Type on server: TFDJSONDataSets
   */
  this.LaporanAR = function(ATglAwal, AtglAkhir, ACabang, AIsTglJatuhTempo) {
    var returnObject = this.executor.executeMethod('"LaporanAR"', "POST", [ATglAwal, AtglAkhir, ACabang, AIsTglJatuhTempo], arguments[4], true, arguments[5], arguments[6]);
    if (arguments[4] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglAwal = ATglAwal;
        resultObject.AtglAkhir = AtglAkhir;
        resultObject.ACabang = ACabang;
        resultObject.AIsTglJatuhTempo = AIsTglJatuhTempo;
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
   * @param AtglAkhir [in] - Type on server: TDateTime
   * @param ACabang [in] - Type on server: TCabang
   * @return result - Type on server: TFDJSONDataSets
   */
  this.LaporanReturSupplier = function(ATglAwal, AtglAkhir, ACabang) {
    var returnObject = this.executor.executeMethod('"LaporanReturSupplier"', "POST", [ATglAwal, AtglAkhir, ACabang], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglAwal = ATglAwal;
        resultObject.AtglAkhir = AtglAkhir;
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
   * @param ATglAkhir [in] - Type on server: TDateTime
   * @param ACustomer [in] - Type on server: TSupplier
   * @param ACabang [in] - Type on server: TCabang
   * @param ANoAR [in] - Type on server: string
   * @return result - Type on server: TFDJSONDataSets
   */
  this.LaporanKarAR = function(ATglAwal, ATglAkhir, ACustomer, ACabang, ANoAR) {
    var returnObject = this.executor.executeMethod('"LaporanKarAR"', "POST", [ATglAwal, ATglAkhir, ACustomer, ACabang, ANoAR], arguments[5], true, arguments[6], arguments[7]);
    if (arguments[5] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglAwal = ATglAwal;
        resultObject.ATglAkhir = ATglAkhir;
        resultObject.ACustomer = ACustomer;
        resultObject.ACabang = ACabang;
        resultObject.ANoAR = ANoAR;
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
  this.RetriveSettingApp = function(ACabang) {
    var returnObject = this.executor.executeMethod('"RetriveSettingApp"', "POST", [ACabang], arguments[1], true, arguments[2], arguments[3]);
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
   * @return result - Type on server: Boolean
   */
  this.DeleteNoCommit = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"DeleteNoCommit"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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
   * @param aPeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param AIDCabang [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.RetrieveData = function(aPeriodeAwal, APeriodeAkhir, AIDCabang) {
    var returnObject = this.executor.executeMethod('RetrieveData', "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aPeriodeAwal = aPeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.AIDCabang = AIDCabang;
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

  this.RetrieveData_URL = function(aPeriodeAwal, APeriodeAkhir, AIDCabang) {
    return this.executor.getMethodURL("RetrieveData", "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3])[0];
  };

  /*
   * @param aPeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param AIDCabang [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TFDJSONDataSets
   */
  this.RetrieveDataSlip = function(aPeriodeAwal, APeriodeAkhir, AIDCabang, AID) {
    var returnObject = this.executor.executeMethod('RetrieveDataSlip', "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang, AID], arguments[4], true, arguments[5], arguments[6]);
    if (arguments[4] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aPeriodeAwal = aPeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.AIDCabang = AIDCabang;
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

  this.RetrieveDataSlip_URL = function(aPeriodeAwal, APeriodeAkhir, AIDCabang, AID) {
    return this.executor.getMethodURL("RetrieveDataSlip", "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang, AID], arguments[4])[0];
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
   * @return result - Type on server: Boolean
   */
  this.DeleteNoCommit = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"DeleteNoCommit"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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
   * @return result - Type on server: Boolean
   */
  this.DeleteNoCommit = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"DeleteNoCommit"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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
   * @return result - Type on server: Boolean
   */
  this.DeleteNoCommit = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"DeleteNoCommit"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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
   * @param APeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param AIDCabang [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.RetrievePenerimaan = function(APeriodeAwal, APeriodeAkhir, AIDCabang) {
    var returnObject = this.executor.executeMethod('RetrievePenerimaan', "GET", [APeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.APeriodeAwal = APeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.AIDCabang = AIDCabang;
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

  this.RetrievePenerimaan_URL = function(APeriodeAwal, APeriodeAkhir, AIDCabang) {
    return this.executor.getMethodURL("RetrievePenerimaan", "GET", [APeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3])[0];
  };

  /*
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TFDJSONDataSets
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
   * @param aPeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param AIDCabang [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.RetrieveData = function(aPeriodeAwal, APeriodeAkhir, AIDCabang) {
    var returnObject = this.executor.executeMethod('RetrieveData', "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aPeriodeAwal = aPeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.AIDCabang = AIDCabang;
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

  this.RetrieveData_URL = function(aPeriodeAwal, APeriodeAkhir, AIDCabang) {
    return this.executor.getMethodURL("RetrieveData", "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3])[0];
  };

  /*
   * @param aPeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param AIDCabang [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TFDJSONDataSets
   */
  this.RetrieveDataSlip = function(aPeriodeAwal, APeriodeAkhir, AIDCabang, AID) {
    var returnObject = this.executor.executeMethod('RetrieveDataSlip', "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang, AID], arguments[4], true, arguments[5], arguments[6]);
    if (arguments[4] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aPeriodeAwal = aPeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.AIDCabang = AIDCabang;
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

  this.RetrieveDataSlip_URL = function(aPeriodeAwal, APeriodeAkhir, AIDCabang, AID) {
    return this.executor.getMethodURL("RetrieveDataSlip", "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang, AID], arguments[4])[0];
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
   * @return result - Type on server: Boolean
   */
  this.DeleteNoCommit = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"DeleteNoCommit"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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
   * @return result - Type on server: Boolean
   */
  this.DeleteNoCommit = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"DeleteNoCommit"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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
   * @return result - Type on server: Boolean
   */
  this.DeleteNoCommit = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"DeleteNoCommit"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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
   * @return result - Type on server: Boolean
   */
  this.DeleteNoCommit = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"DeleteNoCommit"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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
   * @param aPeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param AIDCabang [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.RetrieveData = function(aPeriodeAwal, APeriodeAkhir, AIDCabang) {
    var returnObject = this.executor.executeMethod('RetrieveData', "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aPeriodeAwal = aPeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.AIDCabang = AIDCabang;
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

  this.RetrieveData_URL = function(aPeriodeAwal, APeriodeAkhir, AIDCabang) {
    return this.executor.getMethodURL("RetrieveData", "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3])[0];
  };

  /*
   * @param aPeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param AIDCabang [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TFDJSONDataSets
   */
  this.RetrieveDataSlip = function(aPeriodeAwal, APeriodeAkhir, AIDCabang, AID) {
    var returnObject = this.executor.executeMethod('RetrieveDataSlip', "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang, AID], arguments[4], true, arguments[5], arguments[6]);
    if (arguments[4] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aPeriodeAwal = aPeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.AIDCabang = AIDCabang;
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

  this.RetrieveDataSlip_URL = function(aPeriodeAwal, APeriodeAkhir, AIDCabang, AID) {
    return this.executor.getMethodURL("RetrieveDataSlip", "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang, AID], arguments[4])[0];
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
   * @return result - Type on server: Boolean
   */
  this.DeleteNoCommit = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"DeleteNoCommit"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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
   * @return result - Type on server: Boolean
   */
  this.DeleteNoCommit = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"DeleteNoCommit"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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
   * @return result - Type on server: Boolean
   */
  this.DeleteNoCommit = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"DeleteNoCommit"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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
   * @return result - Type on server: Boolean
   */
  this.DeleteNoCommit = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"DeleteNoCommit"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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
   * @return result - Type on server: TFDJSONDataSets
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
   * @param APenjualan [in] - Type on server: TPenjualan
   * @param ADibayar [in] - Type on server: Double
   * @return result - Type on server: Boolean
   */
  this.SaveToDBDibayar = function(APenjualan, ADibayar) {
    var returnObject = this.executor.executeMethod('"SaveToDBDibayar"', "POST", [APenjualan, ADibayar], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.APenjualan = APenjualan;
        resultObject.ADibayar = ADibayar;
        resultObject.result = resultArray[0];
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
   * @param aPeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param AIDCabang [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.RetrieveData = function(aPeriodeAwal, APeriodeAkhir, AIDCabang) {
    var returnObject = this.executor.executeMethod('RetrieveData', "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aPeriodeAwal = aPeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.AIDCabang = AIDCabang;
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

  this.RetrieveData_URL = function(aPeriodeAwal, APeriodeAkhir, AIDCabang) {
    return this.executor.getMethodURL("RetrieveData", "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3])[0];
  };

  /*
   * @param aPeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param AIDCabang [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TFDJSONDataSets
   */
  this.RetrieveDataSlip = function(aPeriodeAwal, APeriodeAkhir, AIDCabang, AID) {
    var returnObject = this.executor.executeMethod('RetrieveDataSlip', "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang, AID], arguments[4], true, arguments[5], arguments[6]);
    if (arguments[4] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aPeriodeAwal = aPeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.AIDCabang = AIDCabang;
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

  this.RetrieveDataSlip_URL = function(aPeriodeAwal, APeriodeAkhir, AIDCabang, AID) {
    return this.executor.getMethodURL("RetrieveDataSlip", "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang, AID], arguments[4])[0];
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
   * @return result - Type on server: Boolean
   */
  this.DeleteNoCommit = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"DeleteNoCommit"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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
   * @param ATransaksi [in] - Type on server: string
   * @param AIDTransaksi [in] - Type on server: string
   * @return result - Type on server: TAR
   */
  this.RetrieveTransaksi = function(ATransaksi, AIDTransaksi) {
    var returnObject = this.executor.executeMethod('RetrieveTransaksi', "GET", [ATransaksi, AIDTransaksi], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATransaksi = ATransaksi;
        resultObject.AIDTransaksi = AIDTransaksi;
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

  this.RetrieveTransaksi_URL = function(ATransaksi, AIDTransaksi) {
    return this.executor.getMethodURL("RetrieveTransaksi", "GET", [ATransaksi, AIDTransaksi], arguments[2])[0];
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
   * @param aPeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param AIDCabang [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.RetrieveData = function(aPeriodeAwal, APeriodeAkhir, AIDCabang) {
    var returnObject = this.executor.executeMethod('RetrieveData', "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aPeriodeAwal = aPeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.AIDCabang = AIDCabang;
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

  this.RetrieveData_URL = function(aPeriodeAwal, APeriodeAkhir, AIDCabang) {
    return this.executor.getMethodURL("RetrieveData", "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3])[0];
  };

  /*
   * @param aPeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param AIDCabang [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TFDJSONDataSets
   */
  this.RetrieveDataSlip = function(aPeriodeAwal, APeriodeAkhir, AIDCabang, AID) {
    var returnObject = this.executor.executeMethod('RetrieveDataSlip', "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang, AID], arguments[4], true, arguments[5], arguments[6]);
    if (arguments[4] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aPeriodeAwal = aPeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.AIDCabang = AIDCabang;
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

  this.RetrieveDataSlip_URL = function(aPeriodeAwal, APeriodeAkhir, AIDCabang, AID) {
    return this.executor.getMethodURL("RetrieveDataSlip", "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang, AID], arguments[4])[0];
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
   * @return result - Type on server: Boolean
   */
  this.DeleteNoCommit = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"DeleteNoCommit"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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

function TServerAP(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerAP",connectionInfo);

  /*
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TAP
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
   * @param ATransaksi [in] - Type on server: string
   * @param AIDTransaksi [in] - Type on server: string
   * @return result - Type on server: TAP
   */
  this.RetrieveTransaksi = function(ATransaksi, AIDTransaksi) {
    var returnObject = this.executor.executeMethod('RetrieveTransaksi', "GET", [ATransaksi, AIDTransaksi], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATransaksi = ATransaksi;
        resultObject.AIDTransaksi = AIDTransaksi;
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

  this.RetrieveTransaksi_URL = function(ATransaksi, AIDTransaksi) {
    return this.executor.getMethodURL("RetrieveTransaksi", "GET", [ATransaksi, AIDTransaksi], arguments[2])[0];
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
   * @param aPeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param AIDCabang [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.RetrieveData = function(aPeriodeAwal, APeriodeAkhir, AIDCabang) {
    var returnObject = this.executor.executeMethod('RetrieveData', "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aPeriodeAwal = aPeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.AIDCabang = AIDCabang;
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

  this.RetrieveData_URL = function(aPeriodeAwal, APeriodeAkhir, AIDCabang) {
    return this.executor.getMethodURL("RetrieveData", "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3])[0];
  };

  /*
   * @param aPeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param AIDCabang [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TFDJSONDataSets
   */
  this.RetrieveDataSlip = function(aPeriodeAwal, APeriodeAkhir, AIDCabang, AID) {
    var returnObject = this.executor.executeMethod('RetrieveDataSlip', "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang, AID], arguments[4], true, arguments[5], arguments[6]);
    if (arguments[4] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aPeriodeAwal = aPeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.AIDCabang = AIDCabang;
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

  this.RetrieveDataSlip_URL = function(aPeriodeAwal, APeriodeAkhir, AIDCabang, AID) {
    return this.executor.getMethodURL("RetrieveDataSlip", "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang, AID], arguments[4])[0];
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
   * @return result - Type on server: Boolean
   */
  this.DeleteNoCommit = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"DeleteNoCommit"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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
   * @return result - Type on server: Boolean
   */
  this.DeleteNoCommit = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"DeleteNoCommit"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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
   * @param ANorek [in] - Type on server: string
   * @return result - Type on server: TRekBank
   */
  this.RetrieveRek = function(ANorek) {
    var returnObject = this.executor.executeMethod('RetrieveRek', "GET", [ANorek], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ANorek = ANorek;
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

  this.RetrieveRek_URL = function(ANorek) {
    return this.executor.getMethodURL("RetrieveRek", "GET", [ANorek], arguments[1])[0];
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
   * @return result - Type on server: Boolean
   */
  this.DeleteNoCommit = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"DeleteNoCommit"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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

function TServerPenerimaanKas(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerPenerimaanKas",connectionInfo);

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
  this.BeforeDelete = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"BeforeDelete"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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
   * @return result - Type on server: TPenerimaanKas
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
  this.RetrievePenerimaanARs = function(AID) {
    var returnObject = this.executor.executeMethod('RetrievePenerimaanARs', "GET", [AID], arguments[1], true, arguments[2], arguments[3]);
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

  this.RetrievePenerimaanARs_URL = function(AID) {
    return this.executor.getMethodURL("RetrievePenerimaanARs", "GET", [AID], arguments[1])[0];
  };

  /*
   * @param ATglAwal [in] - Type on server: TDateTime
   * @param ATglAtglAkhir [in] - Type on server: TDateTime
   * @param ACabang [in] - Type on server: TCabang
   * @param ANoBukti [in] - Type on server: string
   * @return result - Type on server: TFDJSONDataSets
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
   * @param ANoBukti [in] - Type on server: string
   * @return result - Type on server: TPenerimaanKas
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
   * @param aPeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param AIDCabang [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.RetrieveData = function(aPeriodeAwal, APeriodeAkhir, AIDCabang) {
    var returnObject = this.executor.executeMethod('RetrieveData', "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aPeriodeAwal = aPeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.AIDCabang = AIDCabang;
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

  this.RetrieveData_URL = function(aPeriodeAwal, APeriodeAkhir, AIDCabang) {
    return this.executor.getMethodURL("RetrieveData", "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3])[0];
  };

  /*
   * @param aPeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param AIDCabang [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TFDJSONDataSets
   */
  this.RetrieveDataSlip = function(aPeriodeAwal, APeriodeAkhir, AIDCabang, AID) {
    var returnObject = this.executor.executeMethod('RetrieveDataSlip', "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang, AID], arguments[4], true, arguments[5], arguments[6]);
    if (arguments[4] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aPeriodeAwal = aPeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.AIDCabang = AIDCabang;
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

  this.RetrieveDataSlip_URL = function(aPeriodeAwal, APeriodeAkhir, AIDCabang, AID) {
    return this.executor.getMethodURL("RetrieveDataSlip", "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang, AID], arguments[4])[0];
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
   * @return result - Type on server: Boolean
   */
  this.DeleteNoCommit = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"DeleteNoCommit"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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

function TServerPengeluaranKas(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerPengeluaranKas",connectionInfo);

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
  this.BeforeDelete = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"BeforeDelete"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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
   * @return result - Type on server: TPengeluaranKas
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
  this.RetrievePenerimaanAPs = function(AID) {
    var returnObject = this.executor.executeMethod('RetrievePenerimaanAPs', "GET", [AID], arguments[1], true, arguments[2], arguments[3]);
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

  this.RetrievePenerimaanAPs_URL = function(AID) {
    return this.executor.getMethodURL("RetrievePenerimaanAPs", "GET", [AID], arguments[1])[0];
  };

  /*
   * @param ATglAwal [in] - Type on server: TDateTime
   * @param ATglAtglAkhir [in] - Type on server: TDateTime
   * @param ACabang [in] - Type on server: TCabang
   * @param ANoBukti [in] - Type on server: string
   * @return result - Type on server: TFDJSONDataSets
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
   * @param ANoBukti [in] - Type on server: string
   * @return result - Type on server: TPengeluaranKas
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
   * @param aPeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param AIDCabang [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.RetrieveData = function(aPeriodeAwal, APeriodeAkhir, AIDCabang) {
    var returnObject = this.executor.executeMethod('RetrieveData', "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aPeriodeAwal = aPeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.AIDCabang = AIDCabang;
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

  this.RetrieveData_URL = function(aPeriodeAwal, APeriodeAkhir, AIDCabang) {
    return this.executor.getMethodURL("RetrieveData", "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3])[0];
  };

  /*
   * @param aPeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param AIDCabang [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TFDJSONDataSets
   */
  this.RetrieveDataSlip = function(aPeriodeAwal, APeriodeAkhir, AIDCabang, AID) {
    var returnObject = this.executor.executeMethod('RetrieveDataSlip', "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang, AID], arguments[4], true, arguments[5], arguments[6]);
    if (arguments[4] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aPeriodeAwal = aPeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.AIDCabang = AIDCabang;
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

  this.RetrieveDataSlip_URL = function(aPeriodeAwal, APeriodeAkhir, AIDCabang, AID) {
    return this.executor.getMethodURL("RetrieveDataSlip", "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang, AID], arguments[4])[0];
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
   * @return result - Type on server: Boolean
   */
  this.DeleteNoCommit = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"DeleteNoCommit"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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

function TServerSettingApp(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerSettingApp",connectionInfo);

  /*
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TSettingApp
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
   * @param ACabangID [in] - Type on server: string
   * @return result - Type on server: TSettingApp
   */
  this.RetrieveByCabang = function(ACabangID) {
    var returnObject = this.executor.executeMethod('RetrieveByCabang', "GET", [ACabangID], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ACabangID = ACabangID;
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

  this.RetrieveByCabang_URL = function(ACabangID) {
    return this.executor.getMethodURL("RetrieveByCabang", "GET", [ACabangID], arguments[1])[0];
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
   * @return result - Type on server: Boolean
   */
  this.DeleteNoCommit = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"DeleteNoCommit"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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

function TServerTransferAntarGudang(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerTransferAntarGudang",connectionInfo);

  /*
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TTransferAntarGudang
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
   * @param ANoBukti [in] - Type on server: string
   * @return result - Type on server: TTransferAntarGudang
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
   * @param ATransferAntarGudang [in] - Type on server: TTransferAntarGudang
   * @return result - Type on server: Boolean
   */
  this.SaveTransferAntarGudang = function(ATransferAntarGudang) {
    var returnObject = this.executor.executeMethod('"SaveTransferAntarGudang"', "POST", [ATransferAntarGudang], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATransferAntarGudang = ATransferAntarGudang;
        resultObject.result = resultArray[0];
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
   * @param aPeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param AIDCabang [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.RetrieveData = function(aPeriodeAwal, APeriodeAkhir, AIDCabang) {
    var returnObject = this.executor.executeMethod('RetrieveData', "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aPeriodeAwal = aPeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.AIDCabang = AIDCabang;
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

  this.RetrieveData_URL = function(aPeriodeAwal, APeriodeAkhir, AIDCabang) {
    return this.executor.getMethodURL("RetrieveData", "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3])[0];
  };

  /*
   * @param aPeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param AIDCabang [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TFDJSONDataSets
   */
  this.RetrieveDataSlip = function(aPeriodeAwal, APeriodeAkhir, AIDCabang, AID) {
    var returnObject = this.executor.executeMethod('RetrieveDataSlip', "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang, AID], arguments[4], true, arguments[5], arguments[6]);
    if (arguments[4] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aPeriodeAwal = aPeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.AIDCabang = AIDCabang;
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

  this.RetrieveDataSlip_URL = function(aPeriodeAwal, APeriodeAkhir, AIDCabang, AID) {
    return this.executor.getMethodURL("RetrieveDataSlip", "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang, AID], arguments[4])[0];
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
   * @return result - Type on server: Boolean
   */
  this.DeleteNoCommit = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"DeleteNoCommit"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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

function TServerTAGRequest(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerTAGRequest",connectionInfo);

  /*
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TTAGRequest
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
   * @param ACabangID [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.RetrieveCDSSlip = function(ACabangID, AID) {
    var returnObject = this.executor.executeMethod('RetrieveCDSSlip', "GET", [ACabangID, AID], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ACabangID = ACabangID;
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

  this.RetrieveCDSSlip_URL = function(ACabangID, AID) {
    return this.executor.getMethodURL("RetrieveCDSSlip", "GET", [ACabangID, AID], arguments[2])[0];
  };

  /*
   * @param ANoBukti [in] - Type on server: string
   * @return result - Type on server: TTAGRequest
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
   * @param aPeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param AIDCabang [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.RetrieveData = function(aPeriodeAwal, APeriodeAkhir, AIDCabang) {
    var returnObject = this.executor.executeMethod('RetrieveData', "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aPeriodeAwal = aPeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.AIDCabang = AIDCabang;
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

  this.RetrieveData_URL = function(aPeriodeAwal, APeriodeAkhir, AIDCabang) {
    return this.executor.getMethodURL("RetrieveData", "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3])[0];
  };

  /*
   * @param aPeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param AIDCabang [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TFDJSONDataSets
   */
  this.RetrieveDataSlip = function(aPeriodeAwal, APeriodeAkhir, AIDCabang, AID) {
    var returnObject = this.executor.executeMethod('RetrieveDataSlip', "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang, AID], arguments[4], true, arguments[5], arguments[6]);
    if (arguments[4] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aPeriodeAwal = aPeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.AIDCabang = AIDCabang;
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

  this.RetrieveDataSlip_URL = function(aPeriodeAwal, APeriodeAkhir, AIDCabang, AID) {
    return this.executor.getMethodURL("RetrieveDataSlip", "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang, AID], arguments[4])[0];
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
   * @return result - Type on server: Boolean
   */
  this.DeleteNoCommit = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"DeleteNoCommit"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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

function TServerTransferAntarCabangKirim(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerTransferAntarCabangKirim",connectionInfo);

  /*
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TTransferAntarCabangKirim
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
   * @return result - Type on server: TTransferAntarCabangKirim
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
   * @param aPeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param AIDCabang [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.RetrieveData = function(aPeriodeAwal, APeriodeAkhir, AIDCabang) {
    var returnObject = this.executor.executeMethod('RetrieveData', "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aPeriodeAwal = aPeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.AIDCabang = AIDCabang;
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

  this.RetrieveData_URL = function(aPeriodeAwal, APeriodeAkhir, AIDCabang) {
    return this.executor.getMethodURL("RetrieveData", "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3])[0];
  };

  /*
   * @param aPeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param AIDCabang [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TFDJSONDataSets
   */
  this.RetrieveDataSlip = function(aPeriodeAwal, APeriodeAkhir, AIDCabang, AID) {
    var returnObject = this.executor.executeMethod('RetrieveDataSlip', "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang, AID], arguments[4], true, arguments[5], arguments[6]);
    if (arguments[4] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aPeriodeAwal = aPeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.AIDCabang = AIDCabang;
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

  this.RetrieveDataSlip_URL = function(aPeriodeAwal, APeriodeAkhir, AIDCabang, AID) {
    return this.executor.getMethodURL("RetrieveDataSlip", "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang, AID], arguments[4])[0];
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
   * @return result - Type on server: Boolean
   */
  this.DeleteNoCommit = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"DeleteNoCommit"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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

function TServerTransferAntarCabangTerima(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerTransferAntarCabangTerima",connectionInfo);

  /*
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TTransferAntarCabangTerima
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
   * @return result - Type on server: TTransferAntarCabangTerima
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
   * @param aPeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param AIDCabang [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.RetrieveData = function(aPeriodeAwal, APeriodeAkhir, AIDCabang) {
    var returnObject = this.executor.executeMethod('RetrieveData', "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aPeriodeAwal = aPeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.AIDCabang = AIDCabang;
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

  this.RetrieveData_URL = function(aPeriodeAwal, APeriodeAkhir, AIDCabang) {
    return this.executor.getMethodURL("RetrieveData", "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3])[0];
  };

  /*
   * @param aPeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param AIDCabang [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TFDJSONDataSets
   */
  this.RetrieveDataSlip = function(aPeriodeAwal, APeriodeAkhir, AIDCabang, AID) {
    var returnObject = this.executor.executeMethod('RetrieveDataSlip', "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang, AID], arguments[4], true, arguments[5], arguments[6]);
    if (arguments[4] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aPeriodeAwal = aPeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.AIDCabang = AIDCabang;
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

  this.RetrieveDataSlip_URL = function(aPeriodeAwal, APeriodeAkhir, AIDCabang, AID) {
    return this.executor.getMethodURL("RetrieveDataSlip", "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang, AID], arguments[4])[0];
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
   * @return result - Type on server: Boolean
   */
  this.DeleteNoCommit = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"DeleteNoCommit"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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

function TDSData(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TDSData",connectionInfo);

  /*
   * @return result - Type on server: TDataSet
   */
  this.DS_CabangLookUp = function() {
    var returnObject = this.executor.executeMethod('DS_CabangLookUp', "GET", [], arguments[0], true, arguments[1], arguments[2]);
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

  this.DS_CabangLookUp_URL = function() {
    return this.executor.getMethodURL("DS_CabangLookUp", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.DS_GudangLookUp = function() {
    var returnObject = this.executor.executeMethod('DS_GudangLookUp', "GET", [], arguments[0], true, arguments[1], arguments[2]);
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

  this.DS_GudangLookUp_URL = function() {
    return this.executor.getMethodURL("DS_GudangLookUp", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: string
   */
  this.GetNamaku = function() {
    var returnObject = this.executor.executeMethod('GetNamaku', "GET", [], arguments[0], true, arguments[1], arguments[2]);
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

  this.GetNamaku_URL = function() {
    return this.executor.getMethodURL("GetNamaku", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.LoadAccountPengeluaranKasLain = function() {
    var returnObject = this.executor.executeMethod('LoadAccountPengeluaranKasLain', "GET", [], arguments[0], true, arguments[1], arguments[2]);
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

  this.LoadAccountPengeluaranKasLain_URL = function() {
    return this.executor.getMethodURL("LoadAccountPengeluaranKasLain", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.LoadAccountAPNew = function() {
    var returnObject = this.executor.executeMethod('LoadAccountAPNew', "GET", [], arguments[0], true, arguments[1], arguments[2]);
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

  this.LoadAccountAPNew_URL = function() {
    return this.executor.getMethodURL("LoadAccountAPNew", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.LoadAccountPenerimaanLain = function() {
    var returnObject = this.executor.executeMethod('LoadAccountPenerimaanLain', "GET", [], arguments[0], true, arguments[1], arguments[2]);
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

  this.LoadAccountPenerimaanLain_URL = function() {
    return this.executor.getMethodURL("LoadAccountPenerimaanLain", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.LoadAccountARNew = function() {
    var returnObject = this.executor.executeMethod('LoadAccountARNew', "GET", [], arguments[0], true, arguments[1], arguments[2]);
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

  this.LoadAccountARNew_URL = function() {
    return this.executor.getMethodURL("LoadAccountARNew", "GET", [], arguments[0])[0];
  };

  /*
   * @param ASupplier [in] - Type on server: TSupplier
   * @return result - Type on server: TDataSet
   */
  this.LoadAP = function(ASupplier) {
    var returnObject = this.executor.executeMethod('"LoadAP"', "POST", [ASupplier], arguments[1], true, arguments[2], arguments[3]);
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

  /*
   * @param ACustomer [in] - Type on server: TSupplier
   * @return result - Type on server: TDataSet
   */
  this.LoadAR = function(ACustomer) {
    var returnObject = this.executor.executeMethod('"LoadAR"', "POST", [ACustomer], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ACustomer = ACustomer;
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

function TServerJurnal(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerJurnal",connectionInfo);

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
   * @param AAppObject [in] - Type on server: TAppObject
   * @return result - Type on server: Boolean
   */
  this.BeforeDelete = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"BeforeDelete"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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
   * @return result - Type on server: TJurnal
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
   * @param aPeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param AIDCabang [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.RetrieveData = function(aPeriodeAwal, APeriodeAkhir, AIDCabang) {
    var returnObject = this.executor.executeMethod('RetrieveData', "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aPeriodeAwal = aPeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.AIDCabang = AIDCabang;
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

  this.RetrieveData_URL = function(aPeriodeAwal, APeriodeAkhir, AIDCabang) {
    return this.executor.getMethodURL("RetrieveData", "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3])[0];
  };

  /*
   * @param aPeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param AIDCabang [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TFDJSONDataSets
   */
  this.RetrieveDataSlip = function(aPeriodeAwal, APeriodeAkhir, AIDCabang, AID) {
    var returnObject = this.executor.executeMethod('RetrieveDataSlip', "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang, AID], arguments[4], true, arguments[5], arguments[6]);
    if (arguments[4] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aPeriodeAwal = aPeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.AIDCabang = AIDCabang;
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

  this.RetrieveDataSlip_URL = function(aPeriodeAwal, APeriodeAkhir, AIDCabang, AID) {
    return this.executor.getMethodURL("RetrieveDataSlip", "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang, AID], arguments[4])[0];
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
   * @return result - Type on server: Boolean
   */
  this.DeleteNoCommit = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"DeleteNoCommit"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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

function TServerSettlementARAP(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerSettlementARAP",connectionInfo);

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
  this.BeforeDelete = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"BeforeDelete"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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
   * @return result - Type on server: TSettlementARAP
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
   * @param aPeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param AIDCabang [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.RetrieveData = function(aPeriodeAwal, APeriodeAkhir, AIDCabang) {
    var returnObject = this.executor.executeMethod('RetrieveData', "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aPeriodeAwal = aPeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.AIDCabang = AIDCabang;
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

  this.RetrieveData_URL = function(aPeriodeAwal, APeriodeAkhir, AIDCabang) {
    return this.executor.getMethodURL("RetrieveData", "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang], arguments[3])[0];
  };

  /*
   * @param aPeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param AIDCabang [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TFDJSONDataSets
   */
  this.RetrieveDataSlip = function(aPeriodeAwal, APeriodeAkhir, AIDCabang, AID) {
    var returnObject = this.executor.executeMethod('RetrieveDataSlip', "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang, AID], arguments[4], true, arguments[5], arguments[6]);
    if (arguments[4] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aPeriodeAwal = aPeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.AIDCabang = AIDCabang;
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

  this.RetrieveDataSlip_URL = function(aPeriodeAwal, APeriodeAkhir, AIDCabang, AID) {
    return this.executor.getMethodURL("RetrieveDataSlip", "GET", [aPeriodeAwal, APeriodeAkhir, AIDCabang, AID], arguments[4])[0];
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
   * @return result - Type on server: Boolean
   */
  this.DeleteNoCommit = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"DeleteNoCommit"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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

function TServerMenu(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerMenu",connectionInfo);

  /*
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TMenu
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
   * @return result - Type on server: Boolean
   */
  this.DeleteNoCommit = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"DeleteNoCommit"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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

function TServerUser(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerUser",connectionInfo);

  /*
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TUser
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
   * @return result - Type on server: Boolean
   */
  this.DeleteNoCommit = function(AAppObject) {
    var returnObject = this.executor.executeMethod('"DeleteNoCommit"', "POST", [AAppObject], arguments[1], true, arguments[2], arguments[3]);
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
  "TServerLaporan": ["DS_OverviewAccount","LaporanKartok","LaporanKarAP","LaporanStockSekarang","LookUpPenerimaan","RetrieveCDSTAGRequestKepada","RetrieveCDSTAGRequestDari","RetrieveTACKirim","RetrieveGaji","RetrieveTACTerima","RetrieveTransferAntarGudang","RetriveMutasiBarang","RetrivePenjualan","RetriveCI","RetrivePenerimaanKas","RetriveAR","RetrivePengeluaranKas","RetriveJurnal","LaporanPenerimaanBarang","LaporanAP","LaporanAR","LaporanReturSupplier","LaporanKarAR","RetriveSettingApp"],
  "TServerBarang": ["Retrieve","RetrieveKode","Delete","DeleteNoCommit","RetrieveCDS","Save"],
  "TServerCustomerInvoice": ["AfterSave","BeforeSave","Retrieve","RetrieveCDSlip","RetrieveNoBukti","GenerateNoBukti","RetrieveData","RetrieveDataSlip","Delete","DeleteNoCommit","RetrieveCDS","Save"],
  "TServerUOM": ["Retrieve","RetrieveKode"],
  "TServerSupplier": ["Retrieve","Delete","DeleteNoCommit","RetrieveCDS","Save"],
  "TServerGroupBarang": ["Retrieve","Delete","DeleteNoCommit","RetrieveCDS","Save"],
  "TServerPenerimaanBarang": ["Retrieve","RetrievePenerimaan","RetrieveCDSlip","RetrieveNoBukti","GenerateNoBukti","RetrieveData","RetrieveDataSlip","Delete","DeleteNoCommit","RetrieveCDS","Save"],
  "TServerCabang": ["Retrieve","Delete","DeleteNoCommit","RetrieveCDS","Save"],
  "TServerLogAppObject": ["Retrieve","Delete","DeleteNoCommit","RetrieveCDS","Save"],
  "TServerUtils": ["CheckKoneksi"],
  "TServerStockSekarang": ["HapusMutasi","Retrieve","Delete","DeleteNoCommit","RetrieveCDS","Save"],
  "TServerReturSupplier": ["Retrieve","RetrieveNoBukti","GenerateNoBukti","RetrieveData","RetrieveDataSlip","Delete","DeleteNoCommit","RetrieveCDS","Save"],
  "TServerClosingInventory": ["Close","Delete","DeleteNoCommit","RetrieveCDS","Save"],
  "TServerPembayaranSupplier": ["Retrieve","RetrieveCDS2","Delete","DeleteNoCommit","RetrieveCDS","Save"],
  "TServerGudang": ["Retrieve","RetrieveKode","Delete","DeleteNoCommit","RetrieveCDS","Save"],
  "TServerPenjualan": ["Retrieve","RetrieveNoBukti","RetrieveCDSlip","SaveToDBDibayar","GenerateNoBukti","RetrieveData","RetrieveDataSlip","Delete","DeleteNoCommit","RetrieveCDS","Save"],
  "TServerAR": ["Retrieve","RetrieveCDSlip","RetrieveNoBukti","RetrieveTransaksi","GenerateNoBukti","RetrieveData","RetrieveDataSlip","Delete","DeleteNoCommit","RetrieveCDS","Save"],
  "TServerAP": ["Retrieve","RetrieveTransaksi","GenerateNoBukti","RetrieveData","RetrieveDataSlip","Delete","DeleteNoCommit","RetrieveCDS","Save"],
  "TServerAccount": ["Retrieve","Delete","DeleteNoCommit","RetrieveCDS","Save"],
  "TServerRekBank": ["Retrieve","RetrieveRek","Delete","DeleteNoCommit","RetrieveCDS","Save"],
  "TServerPenerimaanKas": ["AfterSave","BeforeDelete","BeforeSave","Retrieve","RetrievePenerimaanARs","RetrieveCDSlip","RetrieveNoBukti","GenerateNoBukti","RetrieveData","RetrieveDataSlip","Delete","DeleteNoCommit","RetrieveCDS","Save"],
  "TServerPengeluaranKas": ["AfterSave","BeforeDelete","BeforeSave","Retrieve","RetrievePenerimaanAPs","RetrieveCDSlip","RetrieveNoBukti","GenerateNoBukti","RetrieveData","RetrieveDataSlip","Delete","DeleteNoCommit","RetrieveCDS","Save"],
  "TServerSettingApp": ["Retrieve","RetrieveByCabang","Delete","DeleteNoCommit","RetrieveCDS","Save"],
  "TServerTransferAntarGudang": ["Retrieve","RetrieveCDSlip","RetrieveNoBukti","SaveTransferAntarGudang","GenerateNoBukti","RetrieveData","RetrieveDataSlip","Delete","DeleteNoCommit","RetrieveCDS","Save"],
  "TServerTAGRequest": ["Retrieve","RetrieveCDSSlip","RetrieveNoBukti","GenerateNoBukti","RetrieveData","RetrieveDataSlip","Delete","DeleteNoCommit","RetrieveCDS","Save"],
  "TServerTransferAntarCabangKirim": ["Retrieve","RetrieveNoBukti","GenerateNoBukti","RetrieveData","RetrieveDataSlip","Delete","DeleteNoCommit","RetrieveCDS","Save"],
  "TServerTransferAntarCabangTerima": ["Retrieve","RetrieveNoBukti","GenerateNoBukti","RetrieveData","RetrieveDataSlip","Delete","DeleteNoCommit","RetrieveCDS","Save"],
  "TDSData": ["DS_CabangLookUp","DS_GudangLookUp","GetNamaku","LoadAccountPengeluaranKasLain","LoadAccountAPNew","LoadAccountPenerimaanLain","LoadAccountARNew","LoadAP","LoadAR"],
  "TServerJurnal": ["BeforeSave","BeforeDelete","Retrieve","GenerateNoBukti","RetrieveData","RetrieveDataSlip","Delete","DeleteNoCommit","RetrieveCDS","Save"],
  "TServerSettlementARAP": ["AfterSave","BeforeDelete","BeforeSave","Retrieve","GenerateNoBukti","RetrieveData","RetrieveDataSlip","Delete","DeleteNoCommit","RetrieveCDS","Save"],
  "TServerMenu": ["Retrieve","Delete","DeleteNoCommit","RetrieveCDS","Save"],
  "TServerUser": ["Retrieve","Delete","DeleteNoCommit","RetrieveCDS","Save"]
};

