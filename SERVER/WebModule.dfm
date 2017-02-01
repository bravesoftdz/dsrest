object WebModule2: TWebModule2
  OldCreateOrder = False
  OnCreate = WebModuleCreate
  Actions = <
    item
      Name = 'ReverseStringAction'
      PathInfo = '/ReverseString'
      Producer = ReverseString
    end
    item
      Name = 'ServerFunctionInvokerAction'
      PathInfo = '/ServerFunctionInvoker'
      Producer = ServerFunctionInvoker
    end
    item
      Default = True
      Name = 'DefaultAction'
      PathInfo = '/'
      OnAction = WebModuleDefaultAction
    end>
  BeforeDispatch = WebModuleBeforeDispatch
  Height = 481
  Width = 777
  object DSServer1: TDSServer
    OnConnect = DSServer1Connect
    OnDisconnect = DSServer1Disconnect
    OnError = DSServer1Error
    Left = 96
    Top = 11
  end
  object DSHTTPWebDispatcher1: TDSHTTPWebDispatcher
    Server = DSServer1
    Filters = <>
    WebDispatch.PathInfo = 'datasnap*'
    Left = 96
    Top = 75
  end
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServer1
    Left = 200
    Top = 11
  end
  object ServerFunctionInvoker: TPageProducer
    HTMLFile = 'Templates\ServerFunctionInvoker.html'
    OnHTMLTag = ServerFunctionInvokerHTMLTag
    Left = 56
    Top = 184
  end
  object ReverseString: TPageProducer
    HTMLFile = 'templates\ReverseString.html'
    OnHTMLTag = ServerFunctionInvokerHTMLTag
    Left = 168
    Top = 184
  end
  object WebFileDispatcher1: TWebFileDispatcher
    WebFileExtensions = <
      item
        MimeType = 'text/css'
        Extensions = 'css'
      end
      item
        MimeType = 'text/javascript'
        Extensions = 'js'
      end
      item
        MimeType = 'image/x-png'
        Extensions = 'png'
      end>
    BeforeDispatch = WebFileDispatcher1BeforeDispatch
    WebDirectories = <
      item
        DirectoryAction = dirInclude
        DirectoryMask = '*'
      end
      item
        DirectoryAction = dirExclude
        DirectoryMask = '\templates\*'
      end>
    RootDirectory = '.'
    Left = 56
    Top = 136
  end
  object DSProxyGenerator1: TDSProxyGenerator
    ExcludeClasses = 'DSMetadata'
    MetaDataProvider = DSServerMetaDataProvider1
    Writer = 'Java Script REST'
    Left = 48
    Top = 248
  end
  object DSServerMetaDataProvider1: TDSServerMetaDataProvider
    Server = DSServer1
    Left = 208
    Top = 248
  end
  object dsrvrclsUOM: TDSServerClass
    OnGetClass = dsrvrclsUOMGetClass
    Server = DSServer1
    Left = 200
    Top = 72
  end
  object dsrvrclsSupplier: TDSServerClass
    OnGetClass = dsrvrclsSupplierGetClass
    Server = DSServer1
    Left = 200
    Top = 11
  end
  object dsrvrclsBarang: TDSServerClass
    OnGetClass = dsrvrclsBarangGetClass
    Server = DSServer1
    Left = 320
    Top = 8
  end
  object dsrvrclsGroupBarang: TDSServerClass
    OnGetClass = dsrvrclsGroupBarangGetClass
    Server = DSServer1
    Left = 424
    Top = 8
  end
  object dsrvrclsPenerimaanBarang: TDSServerClass
    OnGetClass = dsrvrclsPenerimaanBarangGetClass
    Server = DSServer1
    Left = 192
    Top = 144
  end
  object dsrvrclsCabang: TDSServerClass
    OnGetClass = dsrvrclsCabangGetClass
    Server = DSServer1
    Left = 328
    Top = 72
  end
  object dsrvrclsLogAppObject: TDSServerClass
    OnGetClass = dsrvrclsLogAppObjectGetClass
    Server = DSServer1
    Left = 424
    Top = 80
  end
  object dsrvrclsServerUtils: TDSServerClass
    OnGetClass = dsrvrclsServerUtilsGetClass
    Server = DSServer1
    Left = 616
    Top = 24
  end
  object dsrvrclsStockSekarang: TDSServerClass
    Left = 520
    Top = 16
  end
  object dsrvrclsLaporan: TDSServerClass
    OnGetClass = dsrvrclsLaporanGetClass
    Server = DSServer1
    Left = 376
    Top = 224
  end
  object dsrvrclsReturSupplier: TDSServerClass
    OnGetClass = dsrvrclsReturSupplierGetClass
    Server = DSServer1
    Left = 544
    Top = 88
  end
  object dsrvrclsClosingInventory: TDSServerClass
    OnGetClass = dsrvrclsClosingInventoryGetClass
    Server = DSServer1
    Left = 384
    Top = 232
  end
end
