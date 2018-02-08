object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Login'
  ClientHeight = 160
  ClientWidth = 284
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblUser: TLabel
    Left = 40
    Top = 36
    Width = 22
    Height = 13
    Caption = 'User'
  end
  object lblPassword: TLabel
    Left = 40
    Top = 63
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object edUser: TcxTextEdit
    Left = 112
    Top = 32
    TabOrder = 0
    Text = 'edUser'
    Width = 121
  end
  object edPassword: TcxTextEdit
    Left = 112
    Top = 59
    Properties.EchoMode = eemPassword
    TabOrder = 1
    Text = 'edPassword'
    Width = 121
  end
  object bLogin: TcxButton
    Left = 158
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Login'
    TabOrder = 2
    OnClick = bLoginClick
  end
end
