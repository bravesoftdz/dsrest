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
    AutoStart = False
    ChannelResponseTimeout = 0
    Left = 264
    Top = 8
  end
  object DSHTTPWebDispatcher1: TDSHTTPWebDispatcher
    Server = DSServer1
    Filters = <>
    SessionTimeout = 120000
    WebDispatch.PathInfo = 'datasnap*'
    Left = 224
    Top = 8
  end
  object ServerFunctionInvoker: TPageProducer
    HTMLFile = 'Templates\ServerFunctionInvoker.html'
    OnHTMLTag = ServerFunctionInvokerHTMLTag
    Left = 344
    Top = 8
  end
  object ReverseString: TPageProducer
    HTMLFile = 'templates\ReverseString.html'
    OnHTMLTag = ServerFunctionInvokerHTMLTag
    Left = 424
    Top = 8
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
    Left = 304
    Top = 8
  end
  object DSProxyGenerator1: TDSProxyGenerator
    ExcludeClasses = 'DSMetadata'
    MetaDataProvider = DSServerMetaDataProvider1
    Writer = 'Java Script REST'
    Left = 464
    Top = 8
  end
  object DSServerMetaDataProvider1: TDSServerMetaDataProvider
    Server = DSServer1
    Left = 384
    Top = 8
  end
  object DSServerClass1: TDSServerClass
    Left = 144
    Top = 8
  end
end
