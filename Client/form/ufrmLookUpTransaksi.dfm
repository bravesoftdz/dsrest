object frmLookUpTransaksi: TfrmLookUpTransaksi
  Left = 0
  Top = 0
  Caption = 'Cari Transaksi'
  ClientHeight = 319
  ClientWidth = 447
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
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 447
    Height = 45
    Align = alTop
    TabOrder = 0
    object lblBulan: TLabel
      Left = 16
      Top = 13
      Width = 26
      Height = 13
      Caption = 'Bulan'
    end
    object lblTahun: TLabel
      Left = 160
      Top = 13
      Width = 30
      Height = 13
      Caption = 'Tahun'
    end
    object cbbBulan: TComboBox
      Left = 48
      Top = 10
      Width = 89
      Height = 21
      Style = csDropDownList
      ItemIndex = 11
      TabOrder = 0
      Text = 'DESEMBER'
      Items.Strings = (
        'JANUARI'
        'FEBRUARI'
        'MARET'
        'APRIL'
        'MEI'
        'JUNI'
        'JULI'
        'AGUSTUS'
        'SEPTEMBER'
        'OKTOBER'
        'NOVEMBER'
        'DESEMBER')
    end
    object cbbTahun: TComboBox
      Left = 196
      Top = 10
      Width = 89
      Height = 21
      Style = csDropDownList
      TabOrder = 1
    end
    object btnCari: TButton
      Left = 291
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cari'
      TabOrder = 2
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 278
    Width = 447
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 136
    ExplicitTop = 152
    ExplicitWidth = 185
    object btnOK: TButton
      Left = 291
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 372
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object cxGrid: TcxGrid
    Left = 0
    Top = 45
    Width = 447
    Height = 233
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    ExplicitLeft = -154
    ExplicitTop = -29
    ExplicitWidth = 601
    ExplicitHeight = 348
    object cxGridDBTableGrdBrowse: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
        end>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      OptionsCustomize.ColumnHiding = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
    end
    object cxGridDBTableGrdDetail: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
    end
    object cxgrdlvlMaster: TcxGridLevel
      Caption = 'Master Data'
      GridView = cxGridDBTableGrdBrowse
    end
  end
end
