object frmCetakBarcode: TfrmCetakBarcode
  Left = 0
  Top = 0
  Caption = 'Cetak Barcode'
  ClientHeight = 365
  ClientWidth = 796
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lblBarcode: TLabel
    Left = 24
    Top = 17
    Width = 34
    Height = 13
    Caption = 'Barang'
  end
  object lblHarga: TLabel
    Left = 411
    Top = 41
    Width = 29
    Height = 13
    Caption = 'Harga'
  end
  object lblSatuanStock: TLabel
    Left = 377
    Top = 17
    Width = 63
    Height = 13
    Caption = 'Satuan Stock'
  end
  object lblGroup: TLabel
    Left = 44
    Top = 64
    Width = 82
    Height = 13
    Caption = 'Kelompok Barang'
  end
  object cbbBaranf: TcxExtLookupComboBox
    Left = 80
    Top = 13
    TabOrder = 0
    Width = 273
  end
  object edHarga: TcxCurrencyEdit
    Left = 449
    Top = 37
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0.00;(,0.00)'
    TabOrder = 1
    Width = 121
  end
  object cbbSatuanStock: TcxExtLookupComboBox
    Left = 449
    Top = 13
    TabOrder = 2
    Width = 121
  end
  object cbbGroup: TcxExtLookupComboBox
    Left = 130
    Top = 61
    Properties.DropDownAutoSize = True
    Properties.FocusPopup = True
    TabOrder = 3
    Width = 121
  end
end
