object frmKoneksi: TfrmKoneksi
  Left = 0
  Top = 0
  Caption = 'Koneksi Database'
  ClientHeight = 297
  ClientWidth = 261
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
  object grpKoneksiLokasi: TGroupBox
    Left = 0
    Top = 0
    Width = 261
    Height = 177
    Align = alTop
    Caption = 'Koneksi Database Lokal'
    TabOrder = 0
    ExplicitWidth = 267
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
      TabOrder = 0
      Text = '127.0.0.1'
      Width = 96
    end
    object edUser: TcxTextEdit
      Left = 78
      Top = 95
      TabOrder = 1
      Text = 'postgres'
      Width = 178
    end
    object edPassword: TcxTextEdit
      Left = 78
      Top = 119
      Properties.EchoMode = eemPassword
      Properties.PasswordChar = '*'
      TabOrder = 2
      Text = '1234'
      Width = 178
    end
    object cbbEngine: TComboBox
      Left = 78
      Top = 23
      Width = 178
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 3
      Text = 'PG'
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
      TabOrder = 4
      Text = 'motoroli'
      Width = 178
    end
    object edPort: TcxTextEdit
      Left = 209
      Top = 47
      TabOrder = 5
      Text = '5432'
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
  object grpKoneksiRestServer: TGroupBox
    Left = 0
    Top = 177
    Width = 261
    Height = 120
    Align = alClient
    Caption = 'Rest Server'
    TabOrder = 1
    ExplicitLeft = 48
    ExplicitTop = 152
    ExplicitWidth = 185
    ExplicitHeight = 105
    object Label1: TLabel
      Left = 29
      Top = 20
      Width = 32
      Height = 13
      Caption = 'Server'
    end
    object Label2: TLabel
      Left = 39
      Top = 44
      Width = 22
      Height = 13
      Caption = 'User'
    end
    object Label3: TLabel
      Left = 15
      Top = 68
      Width = 46
      Height = 13
      Caption = 'Password'
    end
    object Label5: TLabel
      Left = 181
      Top = 20
      Width = 20
      Height = 13
      Caption = 'Port'
    end
    object edRestServer: TcxTextEdit
      Left = 78
      Top = 16
      TabOrder = 0
      Text = '127.0.0.1'
      Width = 96
    end
    object edRestUser: TcxTextEdit
      Left = 78
      Top = 40
      Enabled = False
      TabOrder = 1
      Width = 178
    end
    object edRestPassword: TcxTextEdit
      Left = 78
      Top = 64
      Enabled = False
      Properties.EchoMode = eemPassword
      Properties.PasswordChar = '*'
      TabOrder = 2
      Width = 178
    end
    object edRestPort: TcxTextEdit
      Left = 209
      Top = 16
      Enabled = False
      TabOrder = 3
      Text = '8080'
      Width = 47
    end
    object btnTestRestServer: TButton
      Left = 168
      Top = 91
      Width = 87
      Height = 25
      Caption = 'Test'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnKonekDBClick
    end
  end
end
