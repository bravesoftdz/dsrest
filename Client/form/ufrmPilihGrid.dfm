object frmPilihGrid: TfrmPilihGrid
  Left = 0
  Top = 0
  Caption = 'Pilih Grid Yang Akan Diexport'
  ClientHeight = 202
  ClientWidth = 306
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object chklstGrid: TCheckListBox
    Left = 0
    Top = 0
    Width = 306
    Height = 161
    Align = alClient
    ItemHeight = 13
    TabOrder = 0
    ExplicitHeight = 105
  end
  object pnlButton: TPanel
    Left = 0
    Top = 161
    Width = 306
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 167
    object btnOK: TButton
      Left = 143
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TButton
      Left = 224
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
