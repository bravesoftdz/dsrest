object frmCetakBarcode: TfrmCetakBarcode
  Left = 0
  Top = 0
  Caption = 'Cetak Barcode'
  ClientHeight = 122
  ClientWidth = 386
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblBarcode: TLabel
    Left = 51
    Top = 17
    Width = 34
    Height = 13
    Caption = 'Barang'
  end
  object lblSatuanStock: TLabel
    Left = 236
    Top = 18
    Width = 34
    Height = 13
    Caption = 'Satuan'
    Visible = False
  end
  object lblGroup: TLabel
    Left = 33
    Top = 68
    Width = 52
    Height = 13
    Caption = 'Jenis Label'
  end
  object lblJumlahLabel: TLabel
    Left = 24
    Top = 93
    Width = 61
    Height = 13
    Caption = 'Jumlah Label'
  end
  object cbbBarang: TcxExtLookupComboBox
    Left = 104
    Top = 14
    Properties.OnChange = cbbBarangPropertiesChange
    Properties.OnValidate = cbbBarangPropertiesValidate
    TabOrder = 0
    Width = 121
  end
  object cbbSatuanStock: TcxExtLookupComboBox
    Left = 276
    Top = 14
    TabStop = False
    TabOrder = 1
    Visible = False
    Width = 101
  end
  object cbbBarangNama: TcxExtLookupComboBox
    Left = 104
    Top = 39
    Enabled = False
    TabOrder = 2
    Width = 273
  end
  object cxSpinQty: TcxSpinEdit
    Left = 104
    Top = 89
    TabOrder = 4
    Width = 121
  end
  object cbbJenisLabel: TcxComboBox
    Left = 104
    Top = 64
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      'Standar'
      'Besar'
      'Kecil')
    TabOrder = 3
    Text = 'Standar'
    Width = 273
  end
  object bCetak: TcxButton
    Left = 236
    Top = 87
    Width = 75
    Height = 25
    Caption = 'Cetak'
    TabOrder = 5
    OnClick = bCetakClick
  end
end
