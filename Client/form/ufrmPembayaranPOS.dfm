object frmPembayaran: TfrmPembayaran
  Left = 0
  Top = 0
  Caption = 'Pembayaran'
  ClientHeight = 148
  ClientWidth = 293
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblTotal: TLabel
    Left = 27
    Top = 12
    Width = 29
    Height = 13
    Caption = 'Total'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblDibayar: TLabel
    Left = 12
    Top = 39
    Width = 44
    Height = 13
    Caption = 'Dibayar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblSisa: TLabel
    Left = 33
    Top = 66
    Width = 23
    Height = 13
    Caption = 'Sisa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edTotal: TcxCurrencyEdit
    Left = 86
    Top = 9
    TabOrder = 0
    Width = 199
  end
  object edDibayar: TcxCurrencyEdit
    Left = 86
    Top = 36
    TabOrder = 1
    Width = 199
  end
  object edSisa: TcxCurrencyEdit
    Left = 86
    Top = 63
    TabOrder = 2
    Width = 199
  end
  object btnSave: TcxButton
    Left = 85
    Top = 90
    Width = 93
    Height = 31
    Action = actBayar
    TabOrder = 3
  end
  object btnHapus: TcxButton
    Left = 184
    Top = 90
    Width = 101
    Height = 31
    Action = actBatal
    Caption = 'Hapus [Ctrl+X]'
    TabOrder = 4
  end
  object actlstBayar: TActionList
    Left = 144
    Top = 80
    object actBayar: TAction
      Caption = 'Simpan [Ctrl+S]'
      ShortCut = 16467
    end
    object actBatal: TAction
      Caption = 'actBatal'
      ShortCut = 49240
    end
  end
end
