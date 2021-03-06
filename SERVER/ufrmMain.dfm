object frmServer: TfrmServer
  Left = 271
  Top = 114
  Caption = 'DataSnap Rest Server'
  ClientHeight = 373
  ClientWidth = 555
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlKoneksi: TPanel
    Left = 0
    Top = 0
    Width = 555
    Height = 177
    Align = alTop
    TabOrder = 0
    object grpDB: TGroupBox
      Left = 1
      Top = 1
      Width = 272
      Height = 175
      Align = alLeft
      Caption = 'Koneksi Database'
      TabOrder = 0
      object lblServer: TLabel
        Left = 29
        Top = 51
        Width = 32
        Height = 13
        Caption = 'Server'
      end
      object lblUser: TLabel
        Left = 39
        Top = 99
        Width = 22
        Height = 13
        Caption = 'User'
      end
      object lblPassword: TLabel
        Left = 15
        Top = 123
        Width = 46
        Height = 13
        Caption = 'Password'
      end
      object lblEngine: TLabel
        Left = 29
        Top = 27
        Width = 32
        Height = 13
        Caption = 'Engine'
      end
      object lblDatabase: TLabel
        Left = 15
        Top = 75
        Width = 46
        Height = 13
        Caption = 'Database'
      end
      object lblPort: TLabel
        Left = 181
        Top = 51
        Width = 20
        Height = 13
        Caption = 'Port'
      end
      object edServer: TcxTextEdit
        Left = 78
        Top = 47
        TabOrder = 1
        Text = '127.0.0.1'
        Width = 96
      end
      object edUser: TcxTextEdit
        Left = 78
        Top = 95
        TabOrder = 4
        Text = 'sa'
        Width = 178
      end
      object edPassword: TcxTextEdit
        Left = 78
        Top = 119
        Properties.EchoMode = eemPassword
        Properties.PasswordChar = '*'
        TabOrder = 5
        Text = 'masterkey'
        Width = 178
      end
      object cbbEngine: TComboBox
        Left = 78
        Top = 23
        Width = 178
        Height = 21
        Style = csDropDownList
        ItemIndex = 1
        TabOrder = 0
        Text = 'MSSQL'
        OnExit = cbbEngineExit
        Items.Strings = (
          'PG'
          'MSSQL'
          'MYSQL'
          'ORA'
          'IB')
      end
      object edDatabase: TcxTextEdit
        Left = 78
        Top = 71
        TabOrder = 3
        Text = 'assalamHO'
        Width = 178
      end
      object edPort: TcxTextEdit
        Left = 209
        Top = 47
        TabOrder = 2
        Text = '1433'
        Width = 47
      end
      object btnKonekDB: TButton
        Left = 168
        Top = 146
        Width = 87
        Height = 25
        Caption = 'Connect'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = btnKonekDBClick
      end
    end
    object grpRestServer: TGroupBox
      Left = 273
      Top = 1
      Width = 281
      Height = 175
      Align = alClient
      Caption = 'Rest Server'
      Enabled = False
      TabOrder = 1
      object Label1: TLabel
        Left = 18
        Top = 56
        Width = 20
        Height = 13
        Caption = 'Port'
      end
      object ButtonStart: TButton
        Left = 18
        Top = 24
        Width = 75
        Height = 25
        Caption = 'Start'
        TabOrder = 0
        OnClick = ButtonStartClick
      end
      object ButtonStop: TButton
        Left = 99
        Top = 24
        Width = 75
        Height = 25
        Caption = 'Stop'
        TabOrder = 1
        OnClick = ButtonStopClick
      end
      object EditPort: TEdit
        Left = 53
        Top = 52
        Width = 121
        Height = 21
        TabOrder = 2
        Text = '8080'
      end
      object ButtonOpenBrowser: TButton
        Left = 18
        Top = 76
        Width = 75
        Height = 25
        Caption = 'Open Browser'
        TabOrder = 3
        OnClick = ButtonOpenBrowserClick
      end
      object btn1: TButton
        Left = 99
        Top = 76
        Width = 75
        Height = 25
        Caption = 'Clear Logs'
        TabOrder = 4
        OnClick = btn1Click
      end
      object btnBackUPDB: TButton
        Left = 18
        Top = 107
        Width = 156
        Height = 25
        Caption = 'Backup Database'
        TabOrder = 5
        OnClick = btnBackUPDBClick
      end
    end
  end
  object mmoLogs: TMemo
    Left = 0
    Top = 177
    Width = 555
    Height = 196
    Align = alClient
    Color = clNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = mmoLogsChange
  end
  object ApplicationEvents1: TApplicationEvents
    OnIdle = ApplicationEvents1Idle
    Left = 120
    Top = 296
  end
  object ds1: TDataSource
    Left = 80
    Top = 296
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 272
    Top = 296
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    Left = 48
    Top = 296
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 480
    Top = 16
  end
  object FDConnection1: TFDConnection
    Left = 160
    Top = 296
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnection1
    Left = 392
    Top = 296
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 312
    Top = 296
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 352
    Top = 296
  end
  object fdstnstrgbnlnkMotoroli: TFDStanStorageBinLink
    Left = 193
    Top = 297
  end
  object tmrDB: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = tmrDBTimer
    Left = 232
    Top = 296
  end
end
