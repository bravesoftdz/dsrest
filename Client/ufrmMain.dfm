object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'MOLIS (Motoroli Information System)  : Client'
  ClientHeight = 473
  ClientWidth = 999
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mm1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDblClick = FormDblClick
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxrbnMain: TdxRibbon
    Left = 0
    Top = 0
    Width = 999
    Height = 127
    BarManager = dxbrmngrAMS
    Style = rs2010
    ColorSchemeName = 'Blue'
    Contexts = <>
    TabOrder = 0
    TabStop = False
    object dxrbnAplikasi: TdxRibbonTab
      Active = True
      Caption = 'Application'
      Groups = <
        item
          Caption = 'Application'
          ToolbarName = 'dxbrApplication'
        end>
      Index = 0
    end
    object dxrbnTabMaster: TdxRibbonTab
      Caption = 'Master'
      Groups = <
        item
          ToolbarName = 'dxbrmngrAMSBar1'
        end
        item
          Caption = 'FA'
          ToolbarName = 'dxbrmngrAMSBarFA'
        end>
      Index = 1
    end
    object dxrbntbPenerimaanBarangTransaksi: TdxRibbonTab
      Caption = 'Inventory'
      Groups = <
        item
          Caption = 'Penerimaan Barang'
          ToolbarName = 'dxbrmngrAMSBarPenerimaanBarang'
        end
        item
          Caption = 'Penjualan'
          ToolbarName = 'dxbrmngrAMSBarPenjualan'
        end
        item
          Caption = 'Transfer Antar Gudang'
          ToolbarName = 'dxbrTAG'
        end>
      Index = 2
    end
    object dxrbntbAkuntansi: TdxRibbonTab
      Caption = 'Keuangan'
      Groups = <
        item
          Caption = 'Master'
          ToolbarName = 'dxbrmngrAMSBarFA'
        end
        item
          Caption = 'Kas Masuk & Keluar'
          ToolbarName = 'dxbrmngrAMSBarKeuangan'
        end
        item
          Caption = 'Jurnal'
          ToolbarName = 'dxbrJurnal'
        end>
      Index = 3
    end
    object dxrbntbLaporan: TdxRibbonTab
      Caption = 'Laporan'
      Groups = <
        item
          Caption = 'Inventory'
          ToolbarName = 'dxbrLaporanInventory'
        end
        item
          ToolbarName = 'dxbrLapKasKeluar'
        end
        item
          Caption = 'Kas Masuk'
          ToolbarName = 'dxbrLapKasMasuk'
        end
        item
          ToolbarName = 'dxbrmngrAMSBar2'
        end>
      Index = 4
    end
    object dxrbntbPenerimaanBarangClosing: TdxRibbonTab
      Caption = 'Alat'
      Groups = <
        item
          Caption = 'Setting'
          ToolbarName = 'dxbrCLosing'
        end>
      Index = 5
    end
  end
  object statDS: TStatusBar
    Left = 0
    Top = 454
    Width = 999
    Height = 19
    Panels = <
      item
        Text = 'Local DB'
        Width = 500
      end
      item
        Text = 'Rest Server :'
        Width = 200
      end
      item
        Text = 'Cabang : '
        Width = 50
      end>
  end
  object pnlGaji: TPanel
    Left = 16
    Top = 143
    Width = 225
    Height = 122
    TabOrder = 6
    Visible = False
    object lblTahun: TLabel
      Left = 24
      Top = 17
      Width = 30
      Height = 13
      Caption = 'Tahun'
    end
    object lblBulan: TLabel
      Left = 28
      Top = 44
      Width = 26
      Height = 13
      Caption = 'Bulan'
    end
    object cbbTahun: TcxComboBox
      Left = 72
      Top = 13
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        '2017'
        '2018'
        '2019'
        '2020')
      TabOrder = 0
      Width = 121
    end
    object cbbBulan: TcxComboBox
      Left = 72
      Top = 40
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '10'
        '11'
        '12')
      TabOrder = 1
      Width = 121
    end
    object btnCetak: TButton
      Left = 118
      Top = 67
      Width = 75
      Height = 25
      Caption = 'Cetak'
      TabOrder = 2
      OnClick = btnCetakClick
    end
  end
  object mm1: TMainMenu
    Left = 448
    Top = 128
    object mniMaster1: TMenuItem
      Caption = 'Master'
      object mniAsset1: TMenuItem
        Action = actMasSupplier
      end
      object mniAssetCategory1: TMenuItem
        Caption = 'Asset Category'
      end
      object mniDepreciationMethod1: TMenuItem
        Caption = 'Depreciation Method'
      end
      object mniAssetConfigRole1: TMenuItem
        Action = actMasterConfigRole
      end
      object mniAssetPropertyMaster1: TMenuItem
        Action = actMasterGudang
      end
    end
    object mniransaksi1: TMenuItem
      Caption = 'Transaksi'
      object mniSplitPemisahan1: TMenuItem
        Caption = 'Split/Pemisahan'
      end
      object mniDisposal1: TMenuItem
        Caption = 'Disposal'
      end
      object mniRelocation1: TMenuItem
        Caption = 'Relocation'
      end
      object mniRevaluasi1: TMenuItem
        Caption = 'Revaluasi'
      end
      object mniDepresiai1: TMenuItem
        Caption = 'Depresiasi'
      end
      object mniExpense1: TMenuItem
        Caption = 'Revenue Expense'
        object mniMaintenance1: TMenuItem
          Caption = 'Maintenance/perbaikan'
        end
        object mniLisensiPajakBiayalainnya1: TMenuItem
          Caption = 'Lisensi/Pajak/Biaya Lainnya'
        end
      end
      object mniCapitalCost1: TMenuItem
        Caption = 'Capital Expense'
        object mniReplacement1: TMenuItem
          Caption = 'Replacement/Upgrading'
        end
        object mniBiayaLegal1: TMenuItem
          Caption = 'Biaya Legal'
        end
      end
    end
  end
  object dxbrmngrAMS: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Button Master'
      'ButtonApplication'
      'LaporanInventory'
      'Akuntansi')
    Categories.ItemsVisibles = (
      2
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True
      True)
    ImageOptions.LargeImages = ImgListMainLarge
    PopupMenuLinks = <>
    ShowShortCutInHint = True
    UseSystemFont = True
    Left = 368
    Top = 136
    DockControlHeights = (
      0
      0
      0
      0)
    object dxbrApplication: TdxBar
      Caption = 'Apllication'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 340
      FloatTop = 244
      FloatClientWidth = 51
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrlrgbtnExit'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnSetting'
        end
        item
          Visible = True
          ItemName = 'btnLogin'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbrmngrAMSBar1: TdxBar
      Caption = 'Master'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 372
      FloatTop = 274
      FloatClientWidth = 51
      FloatClientHeight = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrlrgbtnBarLargeAsset'
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnBarLargeAssetProperty'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnConfigRole'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnAssetCat'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = True
      Visible = True
      WholeRow = False
    end
    object dxbrmngrAMSBarPenerimaanBarang: TdxBar
      Caption = 'Penerimaan Barang'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 406
      FloatTop = 248
      FloatClientWidth = 51
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrlrgbtnPenerimaanBarang'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnReturn'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbrLaporanInventory: TdxBar
      Caption = 'LaporanInv'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 900
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrlrgbtnMutasiBarang'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnLaporanPenerimaanBarang'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnLapStockSekarang'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtn1'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnReturSupplier'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnLapPenjualan'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbrCLosing: TdxBar
      Caption = 'Closing'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 374
      FloatTop = 252
      FloatClientWidth = 51
      FloatClientHeight = 24
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrlrgbtnCLosingInventory'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnSettingKoneksi'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnSettingAplikas'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnGantiCabang'
        end
        item
          Visible = True
          ItemName = 'btnUser'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbrmngrAMSBarPenjualan: TdxBar
      Caption = 'Penjualan'
      CaptionButtons = <>
      DockedLeft = 142
      DockedTop = 0
      FloatLeft = 518
      FloatTop = 260
      FloatClientWidth = 51
      FloatClientHeight = 24
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrlrgbtn2'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnPenjualanPOS'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbrmngrAMSBarKeuangan: TdxBar
      Caption = 'Keuangan'
      CaptionButtons = <>
      DockedLeft = 114
      DockedTop = 0
      FloatLeft = 900
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrlrgbtnPenerimaanKas'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnPengeluaranKas'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnPenarikanDeposit'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbrmngrAMSBarFA: TdxBar
      Caption = 'FA'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 900
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrlrgbtnAccount'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnBank'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbrTAG: TdxBar
      Caption = 'Transfer Inventory'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 270
      DockedTop = 0
      FloatLeft = 900
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrlrgbtnTAG'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnTAGReq'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnKirimBarang'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnTACTerima'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = False
      WholeRow = False
    end
    object dxbrJurnal: TdxBar
      Caption = 'Jurnal'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 433
      DockedTop = 0
      FloatLeft = 799
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrlrgbtnJurnalMemorial'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnGenerateJurnal'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = False
      WholeRow = False
    end
    object dxbrLapKasKeluar: TdxBar
      Caption = 'Kas Keluar'
      CaptionButtons = <>
      DockedLeft = 371
      DockedTop = 0
      FloatLeft = 576
      FloatTop = 247
      FloatClientWidth = 62
      FloatClientHeight = 54
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrlrgbtnKartuAP'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnLapAP'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbrLapKasMasuk: TdxBar
      Caption = 'Kas Masuk'
      CaptionButtons = <>
      DockedLeft = 494
      DockedTop = 0
      FloatLeft = 1033
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrlrgbtnKartuAR'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnDaftarAR'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbrmngrAMSBar2: TdxBar
      Caption = 'Accounting'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 619
      DockedTop = 0
      FloatLeft = 1033
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrbtnBukuBesar'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnNeracaSaldo'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = False
      WholeRow = False
    end
    object dxBarLargeButton: TdxBarLargeButton
      Action = actMasterBarang
      Category = 0
      LargeImageIndex = 2
    end
    object dxbrlrgbtnBarLargeAsset: TdxBarLargeButton
      Action = actMasSupplier
      Category = 0
      LargeImageIndex = 7
    end
    object dxbrlrgbtnBarLargeAssetProperty: TdxBarLargeButton
      Action = actMasterGudang
      Category = 0
      LargeImageIndex = 11
    end
    object dxbrlrgbtnConfigRole: TdxBarLargeButton
      Action = actMasterConfigRole
      Category = 0
      LargeImageIndex = 6
    end
    object dxbrlrgbtnAssetCat: TdxBarLargeButton
      Action = actMasAssetCategory
      Category = 0
      LargeImageIndex = 7
    end
    object dxbrlrgbtnPenerimaanBarang: TdxBarLargeButton
      Action = actPenerimaanBarang
      Category = 0
      LargeImageIndex = 8
    end
    object dxbrlrgbtnReturn: TdxBarLargeButton
      Action = actReturSupplier
      Category = 0
      LargeImageIndex = 9
    end
    object dxbrlrgbtnLaporanPenerimaanBarang: TdxBarLargeButton
      Action = actLapPenerimaanBarang
      Category = 0
      LargeImageIndex = 10
    end
    object dxbrlrgbtnCLosingInventory: TdxBarLargeButton
      Action = actClosingInventory
      Category = 0
      LargeImageIndex = 4
    end
    object dxbrlrgbtnSettingKoneksi: TdxBarLargeButton
      Action = actSettingKoneksi
      Category = 0
      LargeImageIndex = 5
    end
    object dxbrlrgbtnLapStockSekarang: TdxBarLargeButton
      Action = actLapStockSekarang
      Category = 0
      LargeImageIndex = 10
    end
    object dxbrlrgbtnGantiCabang: TdxBarLargeButton
      Action = actAlatGantiCabang
      Category = 0
      LargeImageIndex = 2
    end
    object dxbrsbtm1: TdxBarSubItem
      Action = actLapKartok
      Category = 0
      LargeImageIndex = 10
      ItemLinks = <>
    end
    object dxbrbtn1: TdxBarButton
      Caption = #208#194#189#168#176#180#197#165
      Category = 0
      Hint = #208#194#189#168#176#180#197#165
      Visible = ivAlways
    end
    object dxbrlrgbtn1: TdxBarLargeButton
      Action = actLapKartok
      Category = 0
      LargeImageIndex = 10
    end
    object dxbrsbtm2: TdxBarSubItem
      Caption = #208#194#189#168#215#211#207#238#196#191
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxbrsbtm3: TdxBarSubItem
      Caption = #208#194#189#168#215#211#207#238#196#191
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxbrbtn2: TdxBarButton
      Caption = #208#194#189#168#176#180#197#165
      Category = 0
      Hint = #208#194#189#168#176#180#197#165
      Visible = ivAlways
    end
    object dxbrlrgbtn2: TdxBarLargeButton
      Action = actPenjualanSales
      Category = 0
      LargeImageIndex = 12
    end
    object dxbrlrgbtnPenjualanPOS: TdxBarLargeButton
      Action = actPenjualanPOS
      Category = 0
      LargeImageIndex = 13
    end
    object dxbrbtnCustomerInvoice: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxbrlrgbtn3: TdxBarLargeButton
      Action = actCustomerInvoice
      Category = 0
      LargeImageIndex = 14
    end
    object dxbrlrgbtnPenerimaanKas: TdxBarLargeButton
      Action = actPenerimaanKas
      Category = 0
      LargeImageIndex = 15
    end
    object dxbrlrgbtnAccount: TdxBarLargeButton
      Action = actMasterAccount
      Category = 0
      LargeImageIndex = 17
      AutoGrayScale = False
    end
    object dxbrlrgbtnBank: TdxBarLargeButton
      Action = actMasterBank
      Category = 0
      LargeImageIndex = 11
    end
    object dxbrlrgbtnSettingAplikasi: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxbrlrgbtnSettingAplikas: TdxBarLargeButton
      Action = actSettingAplikasi
      Category = 0
      LargeImageIndex = 5
    end
    object dxbrlrgbtnTAG: TdxBarLargeButton
      Action = actTAG
      Category = 0
      LargeImageIndex = 8
    end
    object dxbrlrgbtnTAGReq: TdxBarLargeButton
      Action = actTAGGRequest
      Category = 0
      LargeImageIndex = 8
    end
    object dxbrlrgbtnKirimBarang: TdxBarLargeButton
      Action = actTAGKirim
      Category = 0
      LargeImageIndex = 8
    end
    object dxbrlrgbtnTACTerima: TdxBarLargeButton
      Action = actTACTerima
      Category = 0
      LargeImageIndex = 8
    end
    object dxbrlrgbtnPengeluaranKas: TdxBarLargeButton
      Action = actPengeluaranKas
      Caption = 'Pengeluaran Kas'
      Category = 0
      LargeImageIndex = 18
    end
    object dxbrlrgbtnKartuAP: TdxBarLargeButton
      Action = actKartuAP
      Category = 0
      LargeImageIndex = 19
    end
    object dxbrlrgbtnLapAP: TdxBarLargeButton
      Action = actDaftarAP
      Category = 0
      LargeImageIndex = 19
    end
    object dxbrlrgbtnKartuAR: TdxBarLargeButton
      Action = actKartuAR
      Category = 0
      LargeImageIndex = 21
    end
    object dxbrlrgbtnDaftarAR: TdxBarLargeButton
      Action = actDaftarAR
      Category = 0
      LargeImageIndex = 21
    end
    object dxbrlrgbtnReturSupplier: TdxBarLargeButton
      Action = actLapReturSupplier
      Category = 0
      LargeImageIndex = 10
    end
    object dxbrlrgbtnsETTLEMENTarap: TdxBarLargeButton
      Action = actSettlementARAP
      Category = 0
      LargeImageIndex = 20
    end
    object dxbrbtnGenerateJurnal: TdxBarButton
      Action = actGenerateJurnal
      Category = 0
    end
    object dxbrlrgbtnGenerateJurnal: TdxBarLargeButton
      Action = actGenerateJurnal
      Category = 0
      LargeImageIndex = 5
    end
    object dxbrbtnBukuBesar: TdxBarButton
      Action = actLapBukuBesar
      Category = 0
    end
    object dxbrbtnNeracaSaldo: TdxBarButton
      Action = actLapNeracaSaldo
      Category = 0
    end
    object dxbrlrgbtnLapPenjualan: TdxBarLargeButton
      Action = actLapPenjualan
      Category = 0
      LargeImageIndex = 12
    end
    object dxbrbtnPengambilanDeposit: TdxBarButton
      Action = actPengambilanDeposit
      Category = 0
      LargeImageIndex = 16
    end
    object dxbrlrgbtnPenarikanDeposit: TdxBarLargeButton
      Action = actPengambilanDeposit
      Category = 0
      LargeImageIndex = 14
    end
    object btnUser: TdxBarLargeButton
      Action = actUser
      Category = 0
      LargeImageIndex = 22
    end
    object btnLogin: TdxBarLargeButton
      Caption = 'Login/Out'
      Category = 0
      Hint = 'Login/Out'
      Visible = ivAlways
      LargeImageIndex = 23
      OnClick = btnLoginClick
    end
    object dxbrlrgbtnExit: TdxBarLargeButton
      Caption = 'Exit'
      Category = 1
      Visible = ivAlways
      LargeImageIndex = 4
      OnClick = dxbrlrgbtnExitClick
    end
    object dxbrlrgbtnSetting: TdxBarLargeButton
      Action = actApplicationSetting
      Category = 1
      LargeImageIndex = 5
    end
    object dxbrlrgbtnMutasiBarang: TdxBarLargeButton
      Action = actLapMutasiBarang
      Category = 2
      LargeImageIndex = 5
    end
    object dxbrlrgbtnJurnalMemorial: TdxBarLargeButton
      Action = actJurnalMemorial
      Category = 3
      LargeImageIndex = 10
    end
  end
  object dxbrplctnmnAMS: TdxBarApplicationMenu
    BarManager = dxbrmngrAMS
    Buttons = <>
    ExtraPane.Items = <>
    ItemLinks = <>
    UseOwnFont = False
    Left = 512
    Top = 128
  end
  object actlstMainMenu: TActionList
    Left = 600
    Top = 128
    object actMasSupplier: TAction
      Category = 'Master'
      Caption = 'Pembeli/Pemasok'
      OnExecute = actMasSupplierExecute
    end
    object actMasAssetCategory: TAction
      Category = 'Master'
      Caption = 'Asset Category'
    end
    object actMasterBarang: TAction
      Category = 'Master'
      Caption = 'Barang'
      OnExecute = actMasterBarangExecute
    end
    object actMasterGudang: TAction
      Category = 'Master'
      Caption = 'Gudang'
      OnExecute = actMasterGudangExecute
    end
    object actApplicationExit: TAction
      Category = 'Application'
      Caption = 'Exit'
    end
    object actApplicationSetting: TAction
      Category = 'Application'
      Caption = 'Setting'
    end
    object actMasterConfigRole: TAction
      Category = 'Master'
      Caption = 'Configuration Role'
    end
    object actMasterAssetCat: TAction
      Category = 'Master'
      Caption = 'Asset Category'
    end
    object actPenerimaanBarang: TAction
      Category = 'Penerimaan Barang'
      Caption = 'Pembelian'
      OnExecute = actPenerimaanBarangExecute
    end
    object actLapMutasiBarang: TAction
      Category = 'Laporan'
      Caption = 'Mutasi Barang'
      OnExecute = actLapMutasiBarangExecute
    end
    object actReturSupplier: TAction
      Category = 'Penerimaan Barang'
      Caption = 'Retur Supplier'
      OnExecute = actReturSupplierExecute
    end
    object actClosingInventory: TAction
      Category = 'Alat'
      Caption = 'Closing'
      OnExecute = actClosingInventoryExecute
    end
    object actSettingKoneksi: TAction
      Category = 'Alat'
      Caption = 'Setting Koneksi'
      OnExecute = actSettingKoneksiExecute
    end
    object actLapStockSekarang: TAction
      Category = 'Laporan'
      Caption = 'Stock Sekarang'
      OnExecute = actLapStockSekarangExecute
    end
    object actAlatGantiCabang: TAction
      Category = 'Alat'
      Caption = 'Ganti Cabang'
      OnExecute = actAlatGantiCabangExecute
    end
    object actLapKartok: TAction
      Category = 'Laporan'
      Caption = 'Kartu Stok'
      OnExecute = actLapKartokExecute
    end
    object actPenjualanSales: TAction
      Category = 'Penjualan'
      Caption = 'Penjualan Santri'
      OnExecute = actPenjualanSalesExecute
    end
    object actPenjualanPOS: TAction
      Category = 'Penjualan'
      Caption = 'POS'
      OnExecute = actPenjualanPOSExecute
    end
    object actCustomerInvoice: TAction
      Category = 'Keuangan'
      Caption = 'Tagihan Penjualan'
      OnExecute = actCustomerInvoiceExecute
    end
    object actPenerimaanKas: TAction
      Category = 'Keuangan'
      Caption = 'Penerimaan Kas / Deposit'
      OnExecute = actPenerimaanKasExecute
    end
    object actMasterAccount: TAction
      Category = 'Master'
      Caption = 'Account'
      OnExecute = actMasterAccountExecute
    end
    object actMasterBank: TAction
      Category = 'Master'
      Caption = 'Bank'
      OnExecute = actMasterBankExecute
    end
    object actSettingAplikasi: TAction
      Category = 'Alat'
      Caption = 'Setting Aplikasi'
      OnExecute = actSettingAplikasiExecute
    end
    object actTAG: TAction
      Category = 'TAG'
      Caption = 'Transfer Antar Gudang'
      OnExecute = actTAGExecute
    end
    object actTAGGRequest: TAction
      Category = 'TAG'
      Caption = 'Permintaan Transfer'
      OnExecute = actTAGGRequestExecute
    end
    object actTAGKirim: TAction
      Category = 'TAG'
      Caption = 'Pengiriman Transfer'
      OnExecute = actTAGKirimExecute
    end
    object actTACTerima: TAction
      Category = 'TAG'
      Caption = 'Penerimaan Transfer'
      OnExecute = actTACTerimaExecute
    end
    object actPengeluaranKas: TAction
      Category = 'Keuangan'
      Caption = 'Pembayaran'
      OnExecute = actPengeluaranKasExecute
    end
    object actJurnalMemorial: TAction
      Category = 'Keuangan'
      Caption = 'Jurnal Memorial'
      OnExecute = actJurnalMemorialExecute
    end
    object actLapPenerimaanBarang: TAction
      Category = 'Laporan'
      Caption = 'Pembelian'
      OnExecute = actLapPenerimaanBarangExecute
    end
    object actKartuAP: TAction
      Category = 'Keuangan'
      Caption = 'Kartu Deposit'
      OnExecute = actKartuAPExecute
    end
    object actDaftarAP: TAction
      Category = 'Keuangan'
      Caption = 'Daftar Deposit'
      OnExecute = actDaftarAPExecute
    end
    object actKartuAR: TAction
      Category = 'Keuangan'
      Caption = 'Kartu Piutang'
      OnExecute = actKartuARExecute
    end
    object actDaftarAR: TAction
      Category = 'Keuangan'
      Caption = 'Daftar Piutang'
      OnExecute = actDaftarARExecute
    end
    object actLapReturSupplier: TAction
      Category = 'Laporan'
      Caption = 'Retur Supplier'
      OnExecute = actLapReturSupplierExecute
    end
    object actSettlementARAP: TAction
      Category = 'Keuangan'
      Caption = 'Settlement AR-AP'
      OnExecute = actSettlementARAPExecute
    end
    object actGenerateJurnal: TAction
      Category = 'Keuangan'
      Caption = 'Generate Jurnal'
      OnExecute = actGenerateJurnalExecute
    end
    object actLapNeracaSaldo: TAction
      Category = 'Laporan'
      Caption = 'Neraca Saldo'
      OnExecute = actLapNeracaSaldoExecute
    end
    object actLapBukuBesar: TAction
      Category = 'Laporan'
      Caption = 'Buku Besar'
      OnExecute = actLapBukuBesarExecute
    end
    object actLapPenjualan: TAction
      Category = 'Laporan'
      Caption = 'Penjualan'
      OnExecute = actLapPenjualanExecute
    end
    object actPengambilanDeposit: TAction
      Caption = 'Penarikan Deposit'
      OnExecute = actPengambilanDepositExecute
    end
    object actUser: TAction
      Category = 'Alat'
      Caption = 'User'
      OnExecute = actUserExecute
    end
  end
  object ImgListMainLarge: TImageList
    ColorDepth = cd32Bit
    Height = 32
    Width = 32
    Left = 688
    Top = 128
    Bitmap = {
      494C01011800C003E80120002000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000080000000E0000000010020000000000000C0
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D0BCA8FFBFAA
      96FFA48E7AFF947D6AFF8F7865FF8F7865FF8F7865FF8F7865FF8F7865FF8F78
      65FF8F7865FF8F7865FF8F7865FF8F7865FF8F7865FF8F7865FF8F7865FF8F78
      65FF8F7865FF8F7865FF8F7865FF8F7865FF8F7865FF8F7865FF8F7865FF8F78
      65FF00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFFCFCFCFFFCFCFCFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFFCFCFCFFFCFC
      FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFC
      FCFFFCFCFCFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFFCFCFCFFFCFCFCFFF6F6FDFFC0C2
      F9FF8F94F4FF6B72F1FF4A51E8FF2E2FD1FF2E2ED2FF3338D2FF4947D5FF6567
      DDFFA0A0ECFFEEEFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFC
      FCFFFCFCFCFFFCFCFCFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D1BDA9FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F78
      65FF00000000000000000000000000000000C2C2C2FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFBEBEBEFFBDBDBDFFBEBEBEFFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFBEBEBEFFBDBD
      BDFFBEBEBEFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFBEBEBEFFBDBDBDFFBEBEBEFFE9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFE0E1F8FF8A8FEFFF484EEAFF444B
      EEFF444BEFFF3E43E7FF2F2FD3FF2E2ED2FF2E2ED2FF2E2ED2FF2E2FCEFF2F2F
      CEFF2E2FCEFF2F2FD3FF6567DEFFD5D6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFF9F9F9FFF9F9F9FFF9F9F9FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D1BDA9FFFFFF
      FFFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
      EAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
      EAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFFFFFFFFF8F78
      65FF000000000000000000000000000000004C4C4CFF424242FF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF424242FF424242FFBABABAFFFFFFFFFFFCFCFCFFFEFEFEFFFFFF
      FFFFFFFFFFFFFFFFFFFFF8F8FDFF9A9DF5FF474EECFF444BE8FF444BE7FF444B
      E8FF3E43E6FF2F2FD3FF2E2ED2FF2E2ED2FF2E2ED2FF2E2ED2FF2E2ED1FF2F2F
      CCFF2F2FCCFF2F2FCCFF2E2ED1FF2E2ED0FF7576E3FFF4F4FCFFFFFFFFFFFFFF
      FFFFFEFEFEFFF7F7F7FFF9F9F9FFFCFCFCFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000202
      02090F0E0E3A0303030E00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D1BDA9FFFFFF
      FFFFECECECFFECECECFFECECECFFECECECFFECECECFFECECECFFECECECFFECEC
      ECFFECECECFFECECECFFECECECFFECECECFFECECECFFECECECFFECECECFFECEC
      ECFFECECECFFECECECFFECECECFFECECECFFECECECFFECECECFFFFFFFFFF8F78
      65FF00000000000000000000000000000000626262FF424242FF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF424242FF424242FFC2C2C2FFFFFFFFFFFCFCFCFFF9F9F9FFFEFE
      FEFFFFFFFFFFE4E5FCFF656BF1FF444BEFFF444BEFFF444BEEFF444BE6FF3E42
      DCFF3030CCFF2E2ED1FF2E2ED2FF2E2ED2FF2E2ED2FF2E2ED2FF2E2ED2FF2E2E
      D1FF2F2FCBFF2F2FC9FF2F2FCBFF2E2ED1FF2E2ED2FF4245D7FFD7D8F8FFFFFF
      FFFFFFFFFFFFFEFEFEFFF9F9F9FFFCFCFCFF0000000000000000000000000000
      00000000000000000000000000000000000004020213171312644E4843B9736D
      64F5615C58FF54514EE9303130A4050505150000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D1BDA9FFFFFF
      FFFFEDEDEDFFEDEDEDFFE0D3C5FFE0D3C5FFE0D3C5FFE0D3C5FFE0D3C5FFE0D3
      C5FFE0D3C5FFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
      EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFFFFFFFFF8F78
      65FF00000000000000000000000000000000828282FF424242FF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF424242FF424242FFD7D7D7FFFFFFFFFFFCFCFCFFF9F9F9FFF7F7
      F7FFDBDCFAFF525AEEFF444BEFFF444BEFFF444BEFFF444BEFFF3E42E5FF3030
      CCFF2F2FC9FF2F2FCBFF2E2ED1FF2E2ED2FF2E2ED2FF2E2ED2FF2E2ED2FF2E2E
      D2FF2E2ED1FF2F2FCBFF2F2FC9FF2F2FCBFF2E2ED1FF2E2ED2FF3637D1FFC7C8
      F5FFFFFFFFFFFFFFFFFFFEFEFEFFFCFCFCFF0000000000000000000000000000
      000000000000040403121B171662352A28B74B3934FA4A3934FF4A433FFF756F
      67FF77726DFF615C59FF474745FF414340E91717164F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D1BDA9FFFFFF
      FFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEF
      EFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEF
      EFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFFFFFFFFF8F78
      65FF00000000000000000000000000000000ACACACFF424242FF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF424242FF424242FFF7F7F7FFFFFFFFFFFFFFFFFFF9F9F9FFDDDE
      F4FF5159E6FF444BEEFF444BEFFF444BEFFF444BEFFF3E42E6FF2F2FD3FF2E2E
      D1FF2F2FCBFF2F2FC9FF2F2FCBFF2E2ED1FF2E2ED2FF2E2ED2FF2E2ED2FF2E2E
      D2FF2E2ED2FF2E2ED1FF2F2FCBFF2F2FC9FF2F2FCBFF2E2ED1FF2E2ED2FF3637
      D1FFD7D8F8FFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000030202111C17
      1661372B2AB74B3A35FA4B3934FF3F312FFF372E2DFF4A4442FF746F6BFF9F9B
      97FF908B85FF6E6A66FF635F5CFF4B4B48FF434542FE31312F9F0303030E0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D1BDA9FFFFFF
      FFFFF1F1F1FFF1F1F1FFE0D3C5FFE0D3C5FFE0D3C5FFE0D3C5FFE0D3C5FFE0D3
      C5FFE0D3C5FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1
      F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFFFFFFFFF8F78
      65FF00000000000000000000000000000000DFDFDFFF424242FF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF424242FF676767FFFFFFFFFFFFFFFFFFFFFFFFFFF7F7FDFF6169
      EBFF444BE5FF444BE6FF444BEEFF444BEFFF3F79F4FF228BECFF187DE9FF187D
      E9FF187DE8FF1A7AE0FF1A7ADFFF1A7AE0FF187DE8FF187DE9FF187DE9FF187D
      E9FF187DE9FF187DE9FF1785EBFF255DD8FF2F2FC9FF2F2FCBFF2E2ED1FF2E2E
      D2FF4245D7FFF4F4FCFFFFFFFFFFFFFFFFFF1F1D1B4839322EB64A3A35F94B3A
      34FF403230FF372D2DFF4A4340FF716D69FF9E9A96FF999695FF858282FF706C
      6CFFA3A09EFF8C8782FF696562FF696461FF585653FF40423FFF424341E01314
      1340000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D1BDA9FFFFFF
      FFFFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2
      F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2
      F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFFFFFFFFF8F78
      65FF00000000000000000000000000000000FFFFFFFF656565FF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF424242FFA1A1A1FFFFFFFFFFFFFFFFFFFFFFFFFF9A9DF5FF444B
      EEFF444BE6FF444BE5FF444BE6FF444BEEFFC0ECFDFF859193FF839193FFC8F2
      FDFF92A7ABFF768182FFBBE1EBFF9DB8BDFF6D7373FFB6DBE3FFB3D6DEFF6E75
      74FFA9C7CEFFBFE6F0FF737C7CFF99AAB1FF2F2FCBFF2F2FC9FF2F2FCBFF2E2E
      D1FF2E2ED2FF7576E3FFFFFFFFFFFFFFFFFF494640A35B544EFF362C2CFF4942
      40FF6F6B66FF9F9B97FF9F9D9BFF898686FF767272FF736E6EFFAEACACFF807B
      7BFF8D8A89FFB0ADAAFF8A8581FF6B6764FF64615EFF65625FFF444542FF4749
      46FD2E2E2C8E0202020800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D1BDA9FFFFFF
      FFFFF3F3F3FFF3F3F3FFD1BDA9FFD1BDA9FFD1BDA9FFD1BDA9FFD1BDA9FFD1BD
      A9FFD1BDA9FFD1BDA9FFD1BDA9FFD1BDA9FFD1BDA9FFD1BDA9FFD1BDA9FFD1BD
      A9FFD1BDA9FFD1BDA9FFD1BDA9FFD1BDA9FFF3F3F3FFF3F3F3FFFFFFFFFF8F78
      65FF00000000000000000000000000000000FFFFFFFFB7B7B7FF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF454545FFEAEAEAFFFFFFFFFFFFFFFFFFE3E4FCFF474EEDFF444B
      EFFF444BEEFF444BE6FF444BE5FF444BE6FF9AA2A4FFEDECECFF635B57FF8B85
      82FFF7F7F7FF7A7370FF6F6864FFEBEAEAFF938E8BFF5A534EFFE5E4E3FFB9B5
      B3FF504742FFD1CFCEFFD3D1D0FF504843FF2E2ED1FF2F2FCBFF2F2FC9FF2F2F
      CBFF2E2ED1FF2E2ED0FFD5D6F6FFFFFFFFFF0F0E0D26716C65F1A39F9BFF9F9D
      9BFF918E8EFF7E7B7BFF8B8887FF9C9999FF868282FF898685FF837E7EFF827E
      7EFF807B7BFF989695FFB7B4B1FF888480FF6B6764FF605D5BFF6D6A67FF4E4E
      4CFF424441FF424340D50F0F0E33000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D1BDA9FFFFFF
      FFFFF4F4F4FFF4F4F4FFD1BDA9FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFE0D3C5FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFE0D3C5FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFD1BDA9FFF4F4F4FFF4F4F4FFFFFFFFFF8F78
      65FF00000000000000000000000000000000FFFFFFFFFDFDFDFF646464FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF959595FFFFFFFFFFFFFFFFFFFFFFFFFF8C91F4FF444BEFFF444B
      EFFF444BEFFF444BEEFF444BE6FF444BE5FF504A46FFAAA6A4FFEDECECFF635B
      57FF8B8582FFF7F7F7FF7A7370FF6F6864FFEBEAEAFF938E8BFF5A534EFFE5E4
      E3FFB9B5B3FF504742FFD1CFCEFFD3D1D0FF2E2ED2FF2E2ED1FF2F2FCBFF2F2F
      C9FF2F2FCBFF2E2ED1FF6567DEFFFFFFFFFF0000000025232350A4A2A0FD908C
      8CFF9A9696FF888484FF8C8989FF827E7EFF848181FF878484FF858181FF9B98
      98FF9D9A9AFF9A9797FFABAAA9FFC0BDBAFF8A8683FF6D6966FF605D5BFF6F6C
      6AFF5F5E5BFF40423FFF4B4B49FA292A297E0101010400000000000000000000
      0000000000000000000000000000000000000000000000000000D1BDA9FFFFFF
      FFFFF6F6F6FFF6F6F6FFD1BDA9FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
      F6FFF6F6F6FFE0D3C5FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFE0D3C5FFF6F6
      F6FFF6F6F6FFF6F6F6FFF6F6F6FFD1BDA9FFF6F6F6FFF6F6F6FFFFFFFFFF8F78
      65FF00000000000000000000000000000000FFFFFFFFFFFFFFFFDFDFDFFF4B4B
      4BFF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF545454FF828282FFA4A4A4FFBCBCBCFFADADADFF888888FF5D5D5DFF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF656565FFF0F0F0FFFEFEFEFFFFFFFFFFF4F4FDFF4B50EFFF444BEFFF444B
      EFFF444BEFFF444BEFFF444BEEFF444BE6FF4DC8F3FF1CCAF5FF02CCFEFF02CD
      FFFF02CDFFFF02CDFFFF02CDFFFF02CDFFFF02CCFEFF05C6F5FF06C5F4FF05C6
      F5FF02CCFEFF02CDFFFF06C8FEFF11B3F9FF2E2ED2FF2E2ED2FF2E2ED1FF2F2F
      CBFF2F2FC9FF2F2FCCFF2E30D3FFF1F2FCFF00000000000000003E3B3879B3B1
      B0FF8C8989FF7B7878FF7B7777FF999696FF848181FFA09D9DFF959393FF9794
      94FF9A9797FF989695FFB7B4B4FFB5B3B3FFCAC8C5FF918D8AFF6F6C69FF615F
      5CFF6F6C69FF706E6BFF454644FF464845FF404240C90B0B0B27000000000000
      0000000000000000000000000000000000000000000000000000D1BDA9FFFFFF
      FFFFF7F7F7FFF7F7F7FFD1BDA9FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7
      F7FFF7F7F7FFE0D3C5FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFE0D3C5FFF7F7
      F7FFF7F7F7FFF7F7F7FFF7F7F7FFD1BDA9FFF7F7F7FFF7F7F7FFFFFFFFFF8F78
      65FF00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFD5D5
      D5FF545454FF424242FF424242FF424242FF424242FF484848FF919191FFDBDB
      DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFF5F5F5FFDEDE
      DEFF9F9F9FFF535353FF424242FF424242FF424242FF424242FF424242FF7373
      73FFE8E8E8FFF6F6F6FFF9F9F9FFFFFFFFFFBDC1F8FF444BEFFF444BEFFF444B
      EFFF444BEFFF444BEFFF444BEFFF444BEEFF4DC9F4FF1CC9F4FF05C6F5FF02CC
      FEFF02CDFFFF02CDFFFF02CDFFFF02CBFEFF02CBFEFF02CCFEFF05C6F5FF06C5
      F4FF05C6F5FF02CCFEFF06C8FEFF11B3F9FF2E2ED2FF2E2ED2FF2E2ED2FF2E2E
      D1FF2F2FCBFF2F2FCCFF3537D7FFAEB0F2FF0000000000000000000000005553
      509CBAB9B8FF979393FF8A8686FF989696FF9A9797FF949191FFB0AEAEFF9794
      94FFBAB7B7FFA19E9EFFB2B0B0FFABA8A8FFBCBBBBFFD6D4D3FF9D9A97FF7572
      6FFF64615FFF7A7774FF787572FF52524FFF414341FF575756F52828266D0000
      0001000000000000000000000000000000000000000000000000D1BDA9FFFFFF
      FFFFF8F8F8FFF8F8F8FFD1BDA9FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8
      F8FFF8F8F8FFE0D3C5FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFE0D3C5FFF8F8
      F8FFF8F8F8FFF8F8F8FFF8F8F8FFD1BDA9FFF8F8F8FFF8F8F8FFFFFFFFFF8F78
      65FF00000000000000000000000000000000FFFFFFFFFCFCFCFFFEFEFEFFFFFF
      FFFFF3F3F3FFA1A1A1FF626262FF424242FF6A6A6AFFE1E1E1FFF3F4F4FFF5F5
      F5FFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFF5F5
      F5FFF3F4F4FFEBEBEBFF818181FF424242FF494949FF767676FFC0C0C0FFFEFE
      FEFFFDFDFDFFF7F7F7FFF9F9F9FFFCFCFCFF8D91F4FF444BEDFF444BEEFF444B
      EFFF444BEFFF444BEFFF444BEFFF444BEFFF4ECFFDFF1CCAF5FF06C5F4FF05C6
      F5FF02CCFEFF02CDFFFF02CDFFFF1F76ADFF1A8FC5FF02CDFFFF02CCFEFF05C6
      F5FF06C5F4FF05C6F5FF06C7FDFF11B3F9FF2E2ED2FF2E2ED2FF2E2ED2FF2E2E
      D2FF2E2ED1FF3537D4FF373AD9FF787BE7FF0000000000000000000000000201
      0104666461B4C4C3C2FF979494FFA09D9DFF999595FFA8A5A5FFA6A4A3FFA8A5
      A5FFA5A3A3FFB9B7B7FFB3B0B0FFBBB9B9FFD5D3D3FFC0BCB7FFDEDDDBFFB0AD
      AAFF817C79FF777472FF6A6866FF7A7774FF666462FF535453FF5B5C5BFF4546
      45BB0808081D0000000000000000000000000000000000000000D1BDA9FFFFFF
      FFFFF9F9F9FFF9F9F9FFD1BDA9FFE0D3C5FFE0D3C5FFE0D3C5FFE0D3C5FFE0D3
      C5FFE0D3C5FFE0D3C5FFE0D3C5FFE0D3C5FFE0D3C5FFE0D3C5FFE0D3C5FFE0D3
      C5FFE0D3C5FFE0D3C5FFE0D3C5FFD1BDA9FFF9F9F9FFF9F9F9FFFFFFFFFF8F78
      65FF00000000000000000000000000000000FFFFFFFFFCFCFCFFF9F9F9FFFEFE
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFCFCFCFFFDFDFDFFF5F5F5FFF3F4
      F4FFF5F5F5FFFDFDFDFFDFDFDFFFB8B8B8FFD0D0D0FFFEFEFEFFFFFFFFFFFDFD
      FDFFF5F5F5FFF3F4F4FFF3F3F3FFF0F0F0FFFEFEFEFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEFFF9F9F9FFFCFCFCFF6A70F0FF444BECFF444BEBFF444B
      EEFF444BEFFF444BEFFF444BEFFF444BEFFF4ED0FEFF1AD0FEFF05C6F5FF06C5
      F4FF05C6F5FF02CCFEFF04CBFCFF285F97FF2673ACFF03CCFEFF02CDFFFF02CC
      FEFF05C6F5FF06C5F4FF09C1F4FF11B2F8FF2E2ED2FF2E2ED2FF2E2ED2FF2E2E
      D2FF3537DAFF373ADDFF373ADAFF5A60E2FF0000000000000000000000000000
      00000503030A73716EC3C4C3C2FFA7A5A5FFA09D9DFFA2A0A0FFB1AFAFFFAEAC
      ACFFCAC8C8FFB9B7B6FFC5B59DFFB39464FFAB8953FFC9A060FFB5B0A2FFD1D8
      DFFFC7C4C2FF8F8B88FF767370FF6B6967FF777472FF7C7A77FF595958FF5A5A
      59FF5B5B5AEF2121215E00000000000000000000000000000000D1BDA9FFFFFF
      FFFFF9F9F9FFF9F9F9FFD1BDA9FFEFE2D4FFEFE2D4FFEFE2D4FFEFE2D4FFEFE2
      D4FFEFE2D4FFE0D3C5FFEFE2D4FFEFE2D4FFEFE2D4FFEFE2D4FFE0D3C5FFEFE2
      D4FFEFE2D4FFEFE2D4FFEFE2D4FFD1BDA9FFF9F9F9FFF9F9F9FFFFFFFFFF8F78
      65FF00000000000000000000000000000000FFFFFFFFFCFCFCFFF9F9F9FFF7F7
      F7FFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFF5F5
      F5FFEFF0F0FF898989FF424242FF424242FF424242FF6F6F6FFFEDEDEDFFFFFF
      FFFFFDFDFDFFF5F5F5FFF3F4F4FFF5F5F5FFFDFDFDFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFEFEFFFCFCFCFF5257EEFF444BEDFF444BEAFF444B
      E8FF444BEEFF444BEFFF444BEFFF444BEFFF4ED0FEFF1AD1FFFF02CCFEFF05C6
      F5FF06C5F4FF05C6F5FF1398CCFF344C88FF354D89FF0CB3E6FF02CDFFFF02CD
      FFFF02CCFEFF05C6F5FF09C0F3FF13ADF0FF2E2ED1FF2E2ED2FF2E2ED2FF3537
      DAFF373ADEFF373ADEFF393DE1FF5159EBFF0000000000000000000000000000
      0000000000000707070E7C7977CAC8C7C7FFC0BEBEFFB1AFAFFFC1B7A7FFB498
      6BFFB0905DFFC8A060FFB19E7CFF9AB1BBFF7EB1D5FF6AA9D7FF8FC7FDFFADB7
      F5FFEDEDEEFFB4B2B0FFA09D9AFF827E7BFF6D6A68FF74716FFF8A8784FF6060
      5EFF5A5A5AFF4E504DFF36363398000000000000000000000000D1BDA9FFFFFF
      FFFFFAFAFAFFFAFAFAFFD1BDA9FFE8D9CAFFE8D9CAFFE8D9CAFFE8D9CAFFE8D9
      CAFFE8D9CAFFE0D3C5FFE8D9CAFFE8D9CAFFE8D9CAFFE8D9CAFFE0D3C5FFE8D9
      CAFFE8D9CAFFE8D9CAFFE8D9CAFFD1BDA9FFFAFAFAFFFAFAFAFFFFFFFFFF8F78
      65FF00000000000000000000000000000000FFFFFFFFFFFFFFFFF9F9F9FFF6F6
      F6FFF5F5F5FFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFC
      FCFF7E7E7EFF424242FF424242FF424242FF424242FF424242FF5F5F5FFFF3F3
      F3FFFFFFFFFFFDFDFDFFF5F5F5FFF3F4F4FFF5F5F5FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF484FEDFF444BEFFF444BEBFF444B
      E7FF444BE6FF444BEEFF444BEFFF444BEFFF4ED0FEFF1AD1FFFF02CDFFFF02CC
      FEFF05C6F5FF06C5F4FF08BEEEFF2574ABFF2477B0FF03C9FCFF02CDFFFF02CD
      FFFF02CDFFFF02CCFEFF09C1F4FF14ACEEFF2F2FCBFF2E2ED1FF3537DBFF373A
      DEFF373ADEFF393DE2FF4349EDFF454CEBFF0000000000000000000000000000
      0000000000000000000009090810807E7CCAD0CABFFFC79E5EFFBAA37BFFA1B2
      B5FF74ACD4FF61A6D7FF7BC8F3FFB6DAEDFFC7D7E0FFC1C2C3FFACABBCFF9D9A
      B0FFACA69CFFD0CABDFFE5E1DCFFB9B6B2FF8B8885FF797674FF8C8986FF8682
      80FF71706DFF3F413FFF40413FDF000000000000000000000000D1BDA9FFFFFF
      FFFFFBFBFBFFFBFBFBFFD1BDA9FFD1BDA9FFD1BDA9FFD1BDA9FFD1BDA9FFD1BD
      A9FFD1BDA9FFD1BDA9FFD1BDA9FFD1BDA9FFD1BDA9FFD1BDA9FFD1BDA9FFD1BD
      A9FFD1BDA9FFD1BDA9FFD1BDA9FFD1BDA9FFFBFBFBFFFBFBFBFFFFFFFFFF8F78
      65FF00000000000000000000000000000000FFFFFFFFFFFFFFFFFEFEFEFFF7F7
      F7FFF3F4F4FFF5F5F5FFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAF
      AFFF424242FF424242FF424242FF424242FF424242FF424242FF424242FF8484
      84FFFFFFFFFFFFFFFFFFFDFDFDFFF5F5F5FFF3F4F4FFF5F5F5FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF484FEDFF444BEFFF444BEEFF444B
      E8FF444BE5FF444BE6FF444BEEFF444BEFFF4ED0FEFF1AD1FFFF02CDFFFF02CD
      FFFF02CCFEFF05C6F5FF06C5F4FF05C6F5FF02CCFEFF02CDFFFF02CDFFFF02CD
      FFFF02CDFFFF02CDFFFF06C7FDFF13ADF0FF2F2FC9FF3638D3FF373ADDFF373A
      DEFF393DE2FF4349EDFF444BEFFF454CEBFF0000000000000000000000000000
      00000000000000000000000000000808080F7F7C7CC3BFCDD8FF6BC0F5FF80D3
      C6FFD1F0EFFFBED5C2FFB4BEAFFFB2B5AEFFB2B0ACFFD4D1CBFFD0C8BAFFB3C1
      ADFF81B295FF4D9D79FF3A976FFF9CCCB6FFCECCC6FF989592FF908D8AFF817D
      7AFF85827EFF84817DFF747270FC181817330000000000000000D1BDA9FFFFFF
      FFFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFFFFFFFF8F78
      65FF00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFF5F5F5FFF3F4F4FFF5F5F5FFFDFDFDFFFFFFFFFFFFFFFFFFF0F0F0FF4B4B
      4BFF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FFCECECEFFFFFFFFFFFFFFFFFFFDFDFDFFF5F5F5FFF3F4F4FFF5F5F5FFFDFD
      FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F58EEFF444BEFFF444BEFFF444B
      EEFF444BE6FF444BE5FF444BE6FF444BEEFF4CCFFEFF1AD1FFFF02CDFFFF02CD
      FFFF02CDFFFF02CCFEFF05C6F5FF06C5F4FF05C6F5FF02CCFEFF02CDFFFF02CD
      FFFF02CDFFFF02CDFFFF06C8FEFF12B0F8FF3638D3FF373BD5FF373AD6FF393D
      E1FF4349EDFF444BEFFF444BEFFF515AEDFF0000000000000000000000000000
      000000000000000000000000000000000000050505097A7876B2B7BEB4FFA3C9
      97FFAEB3A8FFCCC9C5FFDFDDD8FFCFD9CFFF98C5B1FF5DA68AFF22835EFF0974
      50FF116C50FF297861FF409E84FF45C29FFF70CFB1FFCBCEC5FFA4A19EFF8885
      82FF85817EFF989491FF9A9794FF575554900000000000000000D1BDA9FFFFFF
      FFFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFFFFFFFF8F78
      65FF00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFDFDFDFFF5F5F5FFF3F4F4FFF5F5F5FFFDFDFDFFFFFFFFFF9D9D9DFF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFF5F5F5FFF3F4F4FFF5F5
      F5FFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFF6A70F0FF444BEFFF444BEFFF444B
      EFFF444BEEFF444BE6FF444BE5FF444BE6FF3F7BF3FF2B97F8FF52BAFBFF81E6
      FFFF4FB5F7FF1D84EFFF1D84EEFF1F81E6FF1F80E5FF1F81E6FF1D84EEFF4FB5
      F7FF81E6FFFF4FB5F7FF1B8AF1FF2968E8FF373ADDFF373AD6FF393DD9FF4349
      E4FF444BEEFF444BEFFF444BEFFF6B72F1FF0000000000000000000000000000
      00000000000000000000000000000000000000000000020200037C7A7891DEDD
      D6FEAAC8BBFF6BB9A1FF33A885FF0F9E75FF16A47CFF23A17EFF2E8B70FF42A2
      85FF4DB594FF57B092FF83CDB1FF97BDAAFFC8CBBFFFE6E0D5FFE5DFD5FFB8B4
      AFFF908D8AFF9B9895FF9C9996FD2322213B0000000000000000D1BDA9FFFFFF
      FFFFFDFDFDFFFDFDFDFFE0D3C5FFE0D3C5FFE0D3C5FFE0D3C5FFE0D3C5FFE0D3
      C5FFE0D3C5FFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFE0D3C5FFE0D3C5FFE0D3
      C5FFE0D3C5FFE0D3C5FFE0D3C5FFE0D3C5FFFDFDFDFFFDFDFDFFFFFFFFFF8F78
      65FF00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFDFDFDFFF5F5F5FFF3F4F4FFF5F5F5FFF9F9F9FF515151FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FFDDDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFF5F5F5FFF3F4
      F4FFF5F5F5FFFEFEFEFFFFFFFFFFFFFFFFFF8D91F4FF444BEFFF444BEFFF444B
      EFFF444BEFFF444BEEFF444BE6FF444BE5FF444BE6FF444BEEFFA2A6F7FFFFFF
      FFFF9C9DEFFF373ADEFF373ADEFF373ADDFF373AD6FF373BD5FF373AD6FF9B9C
      EEFFFFFFFFFF9C9DEFFF373ADEFF373ADEFF373ADEFF393DE1FF4349E4FF444B
      E5FF444BE6FF444BEEFF444BEFFF8F94F4FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005553
      525DBAC6BCF340B08EFF45D6A8FF55E3B3FF57D1A6FF62BC9AFF86C0A7FF8FAB
      9BFF9C9F99FF97A4A4FF79979DFF6A7D83FFA9A6A1FFE0D9CDFFE5DED1FFE5DD
      D1FFCAC5BDFF9A9591EA3A39385D000000000000000000000000D1BDA9FFFFFF
      FFFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFD
      FDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFD
      FDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFFFFFFFF8F78
      65FF00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFDFDFDFFF5F5F5FFF3F4F4FFC2C2C2FF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFF5F5
      F5FFF3F4F4FFF7F7F7FFFEFEFEFFFFFFFFFFBCC0F8FF444BEFFF444BEFFF444B
      EFFF444BEFFF444BEFFF444BEEFF444BE6FF444BE5FF444BE6FFA1A5F6FFFFFF
      FFFF9C9DEFFF373ADEFF373ADEFF373ADEFF373ADDFF373AD6FF373BD5FF9798
      E6FFFEFEFEFF9C9DEFFF373ADEFF373ADEFF393DE2FF4349EDFF444BEEFF444B
      E6FF444BE5FF444BE8FF444BEEFFC0C2F9FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000201F1D26B6B4ADC8A3D6BCFFB2CCB9FFBBB9B1FF75736FFF6D898FFF6C97
      B0FF79B8CBFF8CCFE0FF96DCEEFF90CDE2FF6B7E86F78A8986C7959188AC7572
      698B3D3A35520503030900000000000000000000000000000000D1BDA9FFFFFF
      FFFFFDFDFDFFFDFDFDFFE0D3C5FFE0D3C5FFE0D3C5FFE0D3C5FFE0D3C5FFE0D3
      C5FFE0D3C5FFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFE0D3C5FFE0D3C5FFE0D3
      C5FFE0D3C5FFE0D3C5FFE0D3C5FFE0D3C5FFFDFDFDFFFDFDFDFFFAF9F7FF927B
      68FF00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFF5F5F5FF909090FF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF676767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
      FDFFF5F5F5FFF6F6F6FFF9F9F9FFFFFFFFFFF4F4FEFF4A51EEFF444BEFFF444B
      EFFF444BEFFF444BEFFF444BEFFF444BEEFF444BE6FF444BE5FF9DA0EEFFFEFE
      FEFF9C9DEFFF373ADEFF373ADEFF373ADEFF373ADEFF373ADDFF373AD6FF9698
      E5FFF5F5F5FF999BEDFF373ADEFF393DE2FF4349EDFF444BEFFF444BEFFF444B
      EEFF444BE6FF444BE7FF494FEAFFF6F6FDFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000002020203605D5A6AD3CDC3E8E7E1D6FFA09D97FF78A4B1FF94D6
      EBFF90CEEFFF94D5EFFF90D0EAFF8BCAE4FF7DBCD6F9212C2F3B000000000000
      0000000000000000000000000000000000000000000000000000D1BDA9FFFFFF
      FFFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
      FEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
      FEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFBFBFBFFF5F5F5FFDCD5CFFF9F8A
      76FF00000000000000000000000000000000FFFFFFFFFCFCFCFFFEFEFEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF6B6B6BFF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF454545FFF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFDFDFDFFF7F7F7FFF9F9F9FFFCFCFCFFFFFFFFFF898EF1FF444BEEFF444B
      EFFF444BEFFF444BEFFF444BEFFF444BEFFF444BEEFF444BE6FF8F93EBFFF5F5
      F5FFB2B3F1FF373ADEFF373ADEFF373ADEFF373ADEFF373ADEFF373ADDFFB0B1
      EAFFF4F4F4FF8788E3FF393DE1FF4349EDFF444BEFFF444BEFFF444BEFFF444B
      EFFF444BEEFF444BE8FF8A8FEFFFFCFCFCFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000004040407201F1E302828263D141515204F70
      7F8D81BAD3FF77AED5FF80BAD2FF7DB6CEFF78B0C7FF6594A8DE020303090000
      0000000000000000000000000000000000000000000000000000D1BDA9FFFFFF
      FFFFFEFEFEFFFEFEFEFFB6B6B6FFACACACFFB6B6B6FFD5D5D5FFC1C1C1FFFEFE
      FEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFCBCBCBFFACACACFF8383
      83FFD5D5D5FFB6B6B6FFF1F1F1FFF0F0F0FFE4E4E4FFD8D6D5FFBAAA9BFFB9A4
      91FF00000000000000000000000000000000FFFFFFFFFCFCFCFFF9F9F9FFFEFE
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5A5A5AFF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF424242FFE0E0E0FFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEFFF9F9F9FFFCFCFCFFFFFFFFFFE0E1FAFF444BE9FF444B
      EEFF444BEFFF444BEFFF444BEFFF444BEFFF444BEFFF444BEEFF6166E9FFF4F4
      F4FFECECF3FF4D50E1FF373ADEFF373ADEFF373ADEFF373ADEFF4E51E2FFF5F6
      FDFFF5F5F5FF575ADDFF4349E4FF444BEEFF444BEFFF444BEFFF444BEFFF444B
      EFFF444BEFFF474EEBFFE0E1F8FFFCFCFCFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000567D8DB37BB2CAFF94CBE7FF9CD3E9FF6899AEFF6494A9FF283C446D0000
      0000000000000000000000000000000000000000000000000000D1BDA9FFFFFF
      FFFFFEFEFEFFFEFEFEFF989898FFA2A2A2FF989898FFCBCBCBFFB6B6B6FFFEFE
      FEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFA2A2A2FF989898FFA2A2
      A2FFC1C1C1FF9C9B9AFFCBC5C1FFC9C2BDFFBBAFA4FFB8A89BFFCDBFB1FFA898
      88CF00000000000000000000000000000000FFFFFFFFFCFCFCFFF9F9F9FFF7F7
      F7FFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D5D5DFF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF424242FFE1E1E1FFF5F5F5FFFDFDFDFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFEFEFFFCFCFCFFFFFFFFFFFCFCFCFF9599F0FF444B
      E8FF444BEEFF444BEFFF444BEFFF444BEFFF444BEFFF444BEFFF444BEEFFBEC0
      F1FFF4F4F4FFD9D9F1FF6366E4FF373ADEFF373ADEFF6567E6FFE2E3FAFFFFFF
      FFFFBCBEF4FF4349E4FF444BE5FF444BE6FF444BEEFF444BEFFF444BEFFF444B
      EFFF444BEFFF9A9DF5FFFEFEFEFFFCFCFCFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001E272B356481
      8C8EA8D3E4E6CBF0FFFFDBF5FFFFD1E4ECFF588497FF547D91FF354F5CA80000
      0000000000000000000000000000000000000000000000000000D1BDA9FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFB
      F9FFCFBDACFFC4B4A6FFC1B1A3FFC4B4A7FFCCC3BCFFD0C3B7FFA99889CF0D0C
      0B1000000000000000000000000000000000FFFFFFFFFFFFFFFFF9F9F9FFF6F6
      F6FFF5F5F5FFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFF7C7C7CFF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF4E4E4EFFF4F4F4FFF3F4F4FFF5F5F5FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F9FF6166
      EAFF444BE6FF444BEEFF444BEFFF444BEFFF444BEFFF444BEFFF444BEFFF5258
      EFFFD5D7F2FFF4F4F4FFF5F5F5FFEEEFFBFFF0F0FDFFFFFFFFFFFFFFFFFFDADB
      FAFF4F55EEFF444BEEFF444BE6FF444BE5FF444BE6FF444BEEFF444BEFFF444B
      EFFF656BF1FFF8F8FDFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009EBFCCCCD5F3FFFFE8F9
      FFFFF5FCFEFFF5F7F8FFF2F1F1FFEAE9E8FFA9B3B8F651656FC1141B1F3C0000
      0000000000000000000000000000000000000000000000000000D1BDA9FFFFFF
      FFFFFFFFFFFFFFFFFFFFD5CDC6FFD5CDC6FFD5CDC6FFCEC4BCFFCEC4BCFFC7BC
      B3FFE3DED9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFDDD1C5FFFFFFFFFFFAFAFAFFE7E7E7FFD1C4B8FFA99889CF0D0C0B100000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFEFEFEFFF7F7
      F7FFF3F4F4FFF5F5F5FFFDFDFDFFFFFFFFFFFFFFFFFFBFBFBFFF424242FF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF424242FF929292FFFDFDFDFFF5F5F5FFF3F4F4FFF5F5F5FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFDDDE
      F5FF5257E4FF444BE6FF444BEEFF444BEFFF444BEFFF444BEFFF444BEFFF444B
      EFFF4C53EFFFA1A4EEFFE4E5F3FFF5F5F5FFFEFEFEFFEDEEFDFFA5A8F7FF4B52
      F0FF444BEFFF444BEFFF444BEEFF444BE6FF444BE5FF444BE6FF444BEEFF525A
      EEFFE4E5FCFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000095999B9DF4F4F4FFF2F2
      F1FFDAD9D9EF9C9C9CB4676665782B2B2B3B0404040700000000000000000000
      0000000000000000000000000000000000000000000000000000D1BDA9FFFFFF
      FFFFFFFFFFFFFFFFFFFF8F7865FFAB9B8CFFA49283FFB2A396FF8F7865FFB9AB
      9FFFE3DED9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFE5DCD4FFFBFBFBFFE9E9E9FFDBD2C9FFA99889CF0D0C0B10000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFF5F5F5FFF3F4F4FFF5F5F5FFFDFDFDFFFFFFFFFFFDFDFDFF6B6B6BFF4242
      42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
      42FF4E4E4EFFEDEDEDFFFFFFFFFFFDFDFDFFF5F5F5FFF3F4F4FFF5F5F5FFFDFD
      FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFD2D3F2FF5257E4FF444BE6FF444BEEFF444BEFFF444BEFFF444BEFFF444B
      EFFF444BEFFF444BEEFF454CE6FF555BE7FF545AE7FF444BEEFF444BEFFF444B
      EFFF444BEFFF444BEFFF444BEFFF444BEEFF444BE6FF444BE5FF5159E6FFDBDC
      FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000001010102272726371E1E
      1E2D010101020000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D1BDA9FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFDBCFC4FFEEEEEEFFE8E0D9FFA99889CF0D0C0B1000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFEFEFFF7F7F7FFF6F6F6FFF7F7F7FFFEFEFEFFFFFFFFFFEDEDEDFF5F5F
      5FFF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4B4B
      4BFFD3D3D3FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFF7F7F7FFF6F6F6FFF7F7
      F7FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFEFEFFDDDEF5FF6166EAFF444BE8FF444BEEFF444BEFFF444BEFFF444B
      EFFF444BEFFF444BEFFF444BEEFF444BE8FF444BE7FF444BE8FF444BEEFF444B
      EFFF444BEFFF444BEFFF444BEFFF444BEFFF444BEEFF6369EBFFDDDEF4FFF7F7
      F7FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D1BDA9FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F0
      ECFFDBD2C9FFDACDBFFF847A6F9F000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEFFF9F9F9FFF9F9F9FFF9F9F9FFFEFEFEFFFFFFFFFFF4F4
      F4FF969696FF484848FF424242FF424242FF424242FF424242FF7C7C7CFFE6E6
      E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFF9F9F9FFF9F9
      F9FFF9F9F9FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEFFF3F3F9FF9599F0FF444BE9FF444BEEFF444BEFFF444B
      EFFF444BEFFF444BEFFF444BEFFF444BEEFF444BEBFF444BEAFF444BEBFF444B
      EEFF444BEFFF444BEFFF444BEFFF474EEDFF9A9DF5FFF7F8FDFFF9F9F9FFF9F9
      F9FFF9F9F9FFFEFEFEFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D1BDA9FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAFFF1ECE7FFD7C9
      BDFFD4C4B5FF8176689F00000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFFCFCFCFFFCFCFCFFFFFFFFFFFFFF
      FFFFFFFFFFFFF8F8F8FFD0D0D0FFC0C0C0FFCBCBCBFFEDEDEDFFFCFCFCFFFCFC
      FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFC
      FCFFFCFCFCFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFE0E1FAFF898EF1FF4A51EEFF444B
      EFFF444BEFFF444BEFFF444BEFFF444BEFFF444BEFFF444BEDFF444BECFF444B
      EDFF444BEFFF4B50EFFF8C91F4FFE3E4FCFFFFFFFFFFFFFFFFFFFFFFFFFFFCFC
      FCFFFCFCFCFFFCFCFCFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D1BDA9FFD1BD
      A9FFD1BDA9FFD1BDA9FFD1BDA9FFD1BDA9FFD1BDA9FFD1BDA9FFD1BDA9FFD1BD
      A9FFD1BDA9FFD1BDA9FFD1BDA9FFD1BDA9FFD1BDA9FFD1BDA9FFD1BDA9FFD1BD
      A9FF756A5E8F0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4FDFFBCC0
      F8FF8D91F4FF6A70F0FF4F58EEFF484FEDFF484FEDFF5257EEFF6A70F0FF8D91
      F4FFBDC1F8FFF4F4FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000131313224341
      3F7561605FAD797474D4878180ED8D8988F98A8685F8838181EC787574D3625E
      5EAC41403F731212122000000000000000000000000000000003010101040000
      0003000000000000000000000000000000000000000000000000000000000000
      0003010101040000000300000000000000000000000000000000000000000000
      0000000000000000000000000000000000030101010400000003000000000000
      0000000000000000000000000000000000000000000000000003010101040000
      0003000000000000000000000000000000000000000000000000000000000000
      0003010101040000000300000000000000000000000000000000000000000000
      000000000000000000000000000000000003000000050000003C000000770000
      00970000009A0000007F00000047000000050000000000000003010101040000
      0003000000000000000000000000000000000000000000000000000000000000
      0003010101040000000300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004846467F908C8BFD918D
      8CFF918D8CFF918D8CFF918D8CFF918D8CFF8F8B8AFF8F8B8AFF8F8B8AFF918D
      8CFF918D8CFF8D8988FC4543437A00000000000000000000000101010107110F
      0F213E3C3C715F5B5BA7757171D0837F7FEA8B8786F88C8887FA858483EE7977
      74D763615FB34644447F19181830000000000000000000000000000000000000
      0000000000000000000000000000000000010101010702020208020202080414
      1D40071F2F66051F2E65051E2D64051E2D64072B42761373ACDA147CC2ED1371
      AADB106298C70D5481B10C456B9D0A37558707293F71051D2C5E041B295B041B
      295B061B295E061B285B03090D22000000000000000000000000000000000000
      000000000000000000000000000000000054000202B101010176010101550000
      0058000000580000005100000067000000AD0000006E00000004010101070202
      0208010101070000000100000000000000000000000000000000000000000000
      0001010101070202020801010107000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000311191F6B88859571B1B8C2217FAFBF0F396D8B050E0F1A0000
      00000000000039404050BED5CDFF5058547F000000050000000A000000090000
      000600000002000000000000000000000000000000007E7D7CE3918D8CFF918D
      8CFF918D8CFF918D8CFF918D8CFF918D8CFF918D8CFF8E8A89FF8D8A89FF8E8A
      89FF918D8CFF918D8CFF7F7A7ADF0000000000000000000000003B3939688B87
      86F98D8A89FF8E8A89FF918D8CFF918D8CFF918D8CFF918D8CFF918D8CFF918D
      8CFF918D8CFF8E8A89FF8F8B8AFF535150950000000000000003000000010000
      000000000000000000000000000000000000000000010303030A0A2F469A0E50
      7AFF0B517DFF0B517DFF0B517DFF0B517DFF1377B7FF1794E3FF1693E1FF1890
      DCFF178FDBFF178FDBFF1591DFFF1590DDFF148EDBFF158CD7FF1485CCFF137C
      BFFF1173B2FF12689FFF0E4C74F70517224D0000000000000003000000010000
      0000000000000000000400000096000000700000006C020202DF020202FF0102
      02FF000000FF000000FF000000EA0000008300000059000000AC000000120303
      030A0303030B0303030A00000001000000000000000000000000000000000000
      0000000000010303030A02020208000000030000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000494E9FFADF8FFFF8DF2FFFF38BFF9FF2F92E7FF57D7DEDE0000
      00007578779C909B9AFFACC4C1FFAFC5BFFF2A2B296200000015000000120000
      000D0000000500000002000000000000000000000000817B7AE48F8B8AFF918D
      8CFF918D8CFF918D8CFF918D8CFF8C8887FA8C8887FA908D8CFF8D8988FF8C89
      88FF8D8988FF908D8CFF7E7C7BE0000000000000000000000000706C6CC7908D
      8CFF8D8988FF8C8988FF8D8988FF908D8CFF918D8CFF918D8CFF918D8CFF918D
      8CFF918D8CFF918D8CFF8F8B8AFF8E8A89FB0000000001010104010101070000
      0001000000000000000000000000000000000000000001060B160E4F79FF0E50
      7AFF0E507AFF145783FF205F88FF1F5E87FF1982C4FF1794E3FF1794E3FF1692
      E1FF188FDAFF188ED9FF178ED9FF1591E0FF1491E0FF1491E0FF1491E0FF1491
      E0FF1491E0FF1490DEFF137BC0FF0A3F62CC0000000001010104010101070000
      0001000000000000009B0000004D000000C1000000FF000000FF020303FF0303
      03F6030303EA000000FF000000FF000000FF000000DB00000045000000B10000
      000A0202020D0303030F0202020D010101020000000000000000000000000000
      0000000000000000000101010107010101040000000000000000000000000F11
      1114727D7E93919F9EED7E8683FF949A97FFD6DCDBFFEEF3F3FFDAE1E0FFB2B5
      A9D46C7A83A812ADF2FF5FE5FFFF50D5F9FF33B2F2FF1C98EAFF5ED6FEFFF1E5
      DAFFB2B4B3FF929C9BFFA4B9B5FF9BACA8FF535B5A7F2B474A6513475F7F0519
      2E540000000B000000020000000000000000000000007D7B7AE08F8B8AFF6661
      61B844424178403E3E713D3B3B6B3B3A39683432325B262525431818182C201E
      1E3F636161B88D8988FF7C7776DB000000000000000000000000726F6EC8918D
      8CFF908D8CFF8D8988FF8C8988FF8D8988FF8E8B8AFB8E8A89F9918D8CFF918D
      8CFF918D8CFF918D8CFF918D8CFF8C8887FC0000000000000003020202080303
      030A0101010200000000000000000000000000000000010B12240C527EFF0F51
      7BFF6C93AAFFE3E4E5FFEAEAEAFFE6E6E6FF5DAFE3FF1795E4FF1794E3FF1794
      E3FF1692E1FF188FDAFF188ED9FF178ED9FF1591E0FF1491E0FF1491E0FF1491
      E0FF1491E0FF1491E0FF1491DFFF0E5684E60000000000000003020202080303
      030A0000006300000063000000C6000000FF000000FF000000FF000000FF0303
      03BA04040469020303FF000000FF000000FF000000FF000000E30000004A0000
      008C010101020202020D0303030F0202020D0101010200000000000000000000
      00000000000000000000000000010000000300000000000000006C7879A4D3D4
      D3FFD9D2D1FF5E5E59FF646D69FF8E9493FFC9C8C5FFFBFAFAFFE7E9E7FFCFC7
      C4FFBAB9B2FF53D9F9FF23C4FFFF19B4FEFF019BF3FF0081EBFF3A98E0FFEEDE
      D3FFAFBBB7FFA6B8B8FF9EB0AEFF95A398FFA9E5F7FF87FDFFFF37C8FFFF2B8E
      F6FF75F8F8F800000019000000070000000114131323757171CD8F8B8AFF8D8A
      89FF8D8988FF908D8CFF918D8CFF918D8CFF918D8CFF918D8CFF918D8CFF8C89
      88FC8D8988FF787676DE292928500101010200000000000000006F6C6AC3918D
      8CFF73706FCA4C4A488645434381403F3D793C3A3A713533335E292828481E1D
      1D341E1D1D345A57579E918D8CFF8B8988F70000000000000000010101070303
      030B0202020D01010102000000000000000000000000010B12240C5380FF185C
      86FFE8EAEBFFE6E7E7FFE2E2E2FFE5E5E5FF5DAFE3FF1895E4FF1895E4FF1794
      E3FF1794E3FF1692E1FF188FDAFF188ED9FF178ED9FF1591E0FF1491E0FF1491
      E0FF1491E0FF1491E0FF1491E0FF236B99EB0000000000000000010101070303
      0312020202AE0000007E000000FF000000FF000000FF000000EE000000540000
      00070202020D0404043D030303D2000000FF000000FF000000FF000000AA0000
      009500000021010101020202020D0303030F0202020D01010102000000000000
      000000000000000000000000000000000000000000008D9B9CEE524C46FFCCCA
      C8FFE3E7E6FF879C9BFF9BB1B3FF9CA7A8FFD3D6D6FFF9FDFEFFE8EFF1FFDCE2
      E3FFB4B0AAFFB4BFBFFF7EB2C2FF5D93B8FF6194BCFF7CA9BEFFB4BAB0FFE9E8
      E2FFC5D4D4FFACBEBFFF9AAAA6FF8E9288FF99D3E4FF7BECFFFF31BAF0FF2B8D
      DFFF6AFFFFFF000000000000000000000000838180E9918D8CFF918D8CFF8E8A
      89FF8C8988FF8D8988FF908D8CFF918D8CFF918D8CFF918D8CFF918D8CFF918D
      8CFF908D8CFF5D5C5CAD0303030F0202020D010101020D0D0D176A6666BB918D
      8CFF918D8CFF918D8CFF908D8CFF8D8988FF8C8988FF8D8988FF908D8CFF918D
      8CFF8D8988FC918D8CFF837D7BE6333131590000000000000000000000010303
      030A0303030F0202020D010101020000000000000000010B12240D5381FF2765
      8EFFF5F5F5FFE8E8E8FFE1E1E1FFDDDEDEFF5DAFE3FF1895E4FF1895E4FF1895
      E4FF1794E3FF1794E3FF1693E2FF188FDAFF188ED9FF178ED9FF1591E0FF1592
      E1FF1491E0FF1491E0FF1491E0FF3477A1EE0000000000000000000000010202
      025C03030363030303F0000000FF000000FF000000FF0000006A000000000000
      0096000000B50304042004040440020303FF000000FF000000FF000000FE0000
      00480000008300000000010101020202020D0303030F0202020D010101020000
      0000000000000000000000000000000000000000000099A8A8FF81918FFFDCE5
      E4FFE9EEEDFF95ACACFF9AADAEFF8F9391FFE4EDEDFFF4F7F7FFE7EDEDFFE4EE
      EFFFBDC4C3FFABB3B0FFB0BAB8FFA4ADA1FFB1B4AEFFA6B3B1FFBBC8C7FFEEF2
      F1FFCBDBDCFFAFC1C2FF97A39FFF868478FF98D0E1FF7BEBFFFF2FB9EEFF2787
      DEFF67F7FFFF000000000000000000000000918D8CFF918D8CFF918D8CFF918D
      8CFF8D8988FF8C8988FF8D8988FF908D8CFF918D8CFF918D8CFF918D8CFF918D
      8CFF918D8CFF6B6868C00202020D0303030F0202020D747070CD918D8CFF918D
      8CFF918D8CFF918D8CFF918D8CFF908D8CFF8D8988FF8C8988FF8D8988FF908D
      8CFF918D8CFF918D8CFF726F6EC8000000000000000000000000000000000000
      00010202020D0303030F0202020D0101010200000000010B12240D5482FF2766
      8FFFF6F6F6FFF0F0F0FFE2E2E2FFDCDCDCFF5BAADCFF1995E4FF1896E5FF1895
      E4FF1895E4FF1794E3FF1794E3FF1693E2FF188FDAFF188ED9FF178ED9FF1591
      E0FF1592E1FF1491E0FF1491E0FF3477A1EE0000000000000000000000000101
      01970303035A030303FF020303FF000000FF000000FF000000910000007B0000
      00FF000000FF0000003703030323030303FF020303FF000000FF000000FF0000
      0076000000A50000000000000000010101020202020D0303030F0202020D0101
      01020000000000000000000000000000000000000000A7BBBBFF99AFB0FFDBE1
      E1FFD2CCCCFF8D9D9DFF9EB2B3FF919695FFEAF3F4FFF4F6F6FFE9EFF0FFE2EC
      EDFFCBD5D6FF9CA1A1FFADC4C5FFA6BDC2FF92A69CFF748870FFCDDADDFFEFF4
      F6FFCDDCDDFFB1C4C5FF9AA9A5FF848176FF96CDDCFF7DECFFFF31BAEFFF2784
      DEFF60E6FFFF000000000000000000000000918D8CFF918D8CFF848181EC6A67
      64BA5A5857A0514F4E964D4B4A904D4B4B90545151945D5A59A46F6C6CC48B89
      88F7918D8CFF6C6969C0010101020202020D0303030F7E7978E5908D8CFF918D
      8CFF918D8CFF918D8CFF918D8CFF918D8CFF908D8CFF8D8988FF8C8988FF8D89
      88FF908D8CFF918D8CFF7E7C7BE0000000000000000000000000000000000000
      0000010101020202020D0303030F0909043A00000005010B12240E5583FF2867
      90FFF6F6F6FFF1F1F1FFEAEAEAFFDDDEDEFF5CAADBFF1B92DDFF1995E4FF1896
      E5FF1895E4FF1895E4FF1794E3FF1794E3FF1793E2FF188FDAFF188ED9FF178E
      D9FF1591E0FF1592E1FF1491E0FF3478A1EE0000000000000000000000000000
      00A000000074020303FF030303FF020303FF000000FF000000FF000000FF0000
      00C000000053000000000000006D020303FF030303FF020303FF000000FF0000
      00A1000000A1000000000000000000000000010101020202020D0303030F0202
      020D0101010200000000000000000000000000000000A8BBBCFFA6BBBDFFD0D2
      D2FFC7C5C3FF8FA0A1FFA5B9BBFF939795FFEDF6F8FFF5F7F9FFEBF1F1FFE4EF
      F0FFD1DDDEFF99A19FFFB5CFD1FFBCD4DCFF5D6B41FF38450FFFC9D7D8FFF3FA
      FCFFD2E2E4FFB4C9CAFFA6B9B9FF979E97FF98CFE1FF7AE9FFFF2FB9EFFF2582
      DCFF5BDBF5FF0000000000000000000000007B7874D9918D8CFF61605FAD3F3D
      3C6E52504E90666463B6726E6ED0777572DB787474DA73706FCC666463B47571
      71D0918D8CFF5855559A00000000010101020202020D7E7978E68D8988FF8985
      85F26D6A69BF5C5858A1525050914E4C4C8A4E4C4C8A525050925A5858A76A67
      66C3868282F3918D8CFF7E7C7BE0000000000000000000000000000000000000
      000000000000010101020202020D654C1DB67B5E24CB0A1820440E5684FF2868
      91FFF6F6F6FFF1F1F1FFEBEBEBFFE5E5E5FF5CABDDFF1C92DCFF1B92DDFF1995
      E4FF1896E5FF1895E4FF1895E4FF1794E3FF1794E3FF1793E2FF188FDAFF188E
      D9FF178ED9FF1592E0FF1592E1FF3478A1EE0000000000000000000000000000
      00A00000007C000000FF020303FF030303FF020303FF000000F70000004A0000
      00000000002200000091000000FD000000FF020303FF030303FF020303FF0000
      00AC000000A000000000000000000000000000000000010101020202020D0303
      030F0202020D00000001000000000000000000000000AABDBEFFA7C0C1FFDCE2
      E2FFE7EAEAFFB0C4C5FFAFC7C8FF9BA3A2FFE4EBEBFFFAFDFDFFECF3F4FFEAF6
      F7FFCDD7D7FFA4AEACFFBEDADDFFC1DBE0FFA0B4ACFF9AAEA3FFD2E3E7FFE8EE
      EEFFD4E5E6FFA5B2B2FFACC1C1FFA9BDB8FFA0D7E6FF7DE8FFFF30B9EFFF257E
      DAFF5AD7F1FF00000000000000000000000009090910716D6DC6918D8CFF918D
      8CFF918D8CFF918D8CFF908D8CFF8D8988FF8C8988FF8D8988FF908D8CFF918D
      8CFF918D8CFF8A8685F2373535600000000001010102686664BF8C8988FF6966
      66C03E3C3C6E2D2C2B4F2423233F201F1F38201F1F382423233F2D2C2B503E3D
      3D75686665C18E8A89FF676564B6000000000000000C0202011A0202011A0202
      011A0202011A0202011A0101001C6D541EBBD1A03BFFBB923AF5587167FF2968
      91FFF6F6F6FFF1F1F1FFEBEBEBFFE6E6E6FF5EB0E4FF1C93DEFF1C92DCFF1B92
      DDFF1995E4FF1896E5FF1895E4FF1895E4FF1795E4FF1794E3FF1793E2FF188F
      DAFF188ED9FF1790DCFF1592E0FF3478A2EE0000000000000000000000000000
      00A100000064000000FF000000FF020303FF030303FF030303A3010101020000
      007F000000FE000000EE000000EA000000FF000000FF020303FF030303FF0404
      0498010101A30000000000000000000000000000000000000000010101020202
      020D0303030F0303030A000000010000000000000000ABBFC0FFAFC2C3FFE9F0
      F0FFEFF3F4FFA2B4B4FF9DB0AFFFA9B6B5FFD1D5D4FFFEFFFFFFF2FAFBFFF0FB
      FCFFBEC4C3FFBACBCEFFA5B9B8FF9EB1B0FFA1B4B6FF97ABADFFB9C4C4FFE5E7
      E7FFC4D0CFFF8C9796FFB7CFD0FFBCC8C2FFA9DCEAFF77E9FFFF36BDF1FF2E88
      DDFF66E1F2FF00000000000000000000000000000000817D7AE2918D8CFF918D
      8CFF918D8CFF918D8CFF918D8CFF908D8CFF8D8988FF8C8988FF8D8988FF908D
      8CFF918D8CFF918D8CFF7C7B7ADE00000000000000000605050A3F3E3D766C69
      68C7878382F8908D8CFF918D8CFF918D8CFF918D8CFF918D8CFF918D8CFF8989
      88F76B6868C53D3B3B720404040D00000000917027D3D5A33AFFD5A33AFFD5A3
      3AFFD5A33AFFD5A33AFFD5A33AFFD8A53BFFD3A23BFFD2A13BFFD0A03AFF9A8F
      57FFF3EFE8FFF1F1F1FFEBEBEBFFE6E6E6FF5FB1E5FF1A97E6FF1C93DEFF1C92
      DCFF1B93DEFF1995E4FF1996E5FF1895E4FF1895E4FF1795E4FF1794E3FF1793
      E2FF188FDAFF188FDBFF1791DEFF3478A2EE0000000000000000000000000000
      007D0000004A000000FF000000FF000000FF020303FF040404970202020D0000
      00B8000000FD0000002900000026000000FF000000FF000000FF020303FF0303
      0363030303A50101010200000000000000000000000000000000000000000101
      01020202020D0303030B010101070000000000000000AFC3C4FFAFC0C0FFDDDF
      DFFFE4E5E3FF8D9B9AFF96A8A7FF929592FFCCCDCBFFF4EEEEFFE7E9E8FFCECC
      CAFFABAAA7FFA8B1B0FF8E9A99FF8C9997FF7D8984FF8C9C99FFC1CDCDFFE8E8
      E8FFC3D4D4FFC8E0E1FFE4EDE3FFD6DEE0FF64D3F3FF4FC9F8FF35ABF0FF2492
      E9FF40BEF1FF00000000000000000000000000000000817B7AE4918D8CFF918D
      8CFF918D8CFF918D8CFF918D8CFF918D8CFF908D8CFF8D8988FF8C8988FF8D89
      88FF908D8CFF918D8CFF7E7C7BE0000000000000000000000000010101020202
      020D060606131514142E2221203C28272646282726462221203B131313220202
      0203010101020303030A0202020800000003AA802FE0DBA83DFFDCA93DFFDDA9
      3DFFDDA93DFFDDA93DFFDDA93DFFDDA93DFFDCA83DFFD5A43DFFD4A33DFFD5A4
      3DFFD9AB4FFFE8DCC1FFEBEBEBFFE6E6E6FF5FB2E6FF1B98E7FF1A97E6FF1C93
      DEFF1C92DCFF1B93DEFF1995E4FF1996E5FF1895E4FF1895E4FF1795E4FF1794
      E3FF1793E2FF1890DCFF1791DDFF3577A2EE0000000000000003000000010000
      002A00000082000000C5000000FF000000FF000000FF030303E5040404250203
      031A000101200000000000000094000000FF000000FF000000FF000000E90303
      0364040404610202020D01010102000000000000000000000000000000000000
      0000010101020303030A020202080000000300000000A2B3B3FF868F8DFFDFE5
      E3FFDEE5E5FFADBBBAFFB2C2C2FFC5D7D5FFD7E9E7FFD6E8E9FFD4E4E5FFD1DF
      DFFFC1CECEFFA3A9A7FF828885FF787B7AFF8D9593FFB0C3C3FFBECFCEFFC7D8
      D8FFD0DDDDFFEDEFE5FFBBD5E5FF5BD6F5FF42C1F6FD50B2F2FF2A94EAFF1686
      E7FF06458A9C00000000000000000000000000000000807C79E28F8B8AFF625F
      5FAE2C2B2B4E1C1B1B31131212210F0E0E1A0F0E0E1A131212221D1D1C3D2E2D
      2D5A646261B8908D8CFF7C7B7ADE000000000000000000000000000000000101
      01020202020D2F25033E433302513729003B3729003A433200475641005C1812
      001B00000000000000010101010701010104AA832FE0DCA83FFFDAA73FFFDDA9
      3FFFDEAA3FFFDEAA3FFFDEAA3FFFDEAA3FFFDEAA3FFFDDA93FFFD6A53FFFD5A4
      3FFFD6A53FFFDBA840FFDEC38CFFE5E4E2FF5FB2E6FF1B99E8FF1B98E7FF1B97
      E6FF1C93DEFF1C92DCFF1B93DEFF1995E4FF1996E5FF1895E4FF1895E4FF1895
      E4FF1794E3FF1794E2FF1791DEFF3578A2EE0000000001010104010101070000
      0001000000A100000048000000FB000000FF000000FF000000FF030303EC0303
      038A03030330000000C7000000FF000000FF000000FF000000FF000000630000
      00B0020303110303030F0202020D010101020000000000000000000000000000
      00000000000000000001010101070101010400000000879290FF9DABAAFFDCF6
      F8FFC9D7D6FFADB1A6FFAEB0A4FFBDC5C5FFCDDBDDFFDFEFEAFFEFF9EEFFEBF7
      EEFFE7F7F4FFF0FFFCFFF5FFFFFFF4FFFFFFE6F8F6FFD9E9E3FFDADAD5FFC5D0
      CCFFC2DDE1FF78CAEBFF127BDFFF49BCD7E3000000000003050501080E100000
      0000000000000000000000000000000000000000000038373665878483F28B87
      86FE7B7978DC6D6A69BF64615FAF605D5CA8605D5CA8636161B06B6868C07978
      77E0898685FE848080F13533335E000000000000000000000000000000000000
      00007156007AE7AF03FFE5AE04FFE7AF03FFEFB400FFF0B500FFF0B500FFE1A8
      00F03E2F0042000000000000000100000003AB8532E0DEAB41FFDBA941FFDAA8
      41FFDFAB41FFE0AC41FFE0AC41FFE0AC41FFE0AC41FFE0AC41FFDFAB41FFD8A7
      41FFD6A641FFD8A741FFDEAA41FFDCB666FF5FB2E6FF1C99E8FF1B99E8FF1B98
      E7FF1B97E6FF1C93DEFF1C92DCFF1B93DEFF1995E4FF1996E5FF1895E4FF1895
      E4FF1895E4FF1794E3FF1794E2FF3878A3EE0000000000000003020202080303
      030A00000021000000A700000066000000FE000000FF000000FF000000FF0303
      03E404040487020303FF000000FF000000FF000000FF000000910000008D0000
      003F010101020202020D0303030F0202020D0101010200000000000000000000
      00000000000000000000000000010000000300000000CEE8EAFFE2FDFDFFEFFD
      F5FFC4E9ECFF9AD1E1FF55C9E6FF2094DFFF39A9E4FF3762656B16212D325EC3
      EDFFC2F0F6FFADE5F2FFAFDFEFFFBCE2EFFFC9E4DFEB8F9494A567B8DEFF92D8
      EBFF74DFF8FF17B5EFFF1E7CDDFF57CFE6F40000000000000000000000000000
      000000000000000000000000000000000000000000000000000007070712312F
      2F5C4F4C4C92666361B4726F6FCB7A7575D67A7575D6726F6FCB656262B24E4D
      4C8C2F2E2D5A0909091A0202020D010101020000000000000000000000005641
      005BF0B500FFEFB400FFE7AF03FFE5AE04FFE7AF03FFEFB400FFF0B500FFF0B5
      00FFE4AB00F3201800220000000000000000AF8633E0E2AE42FFDEAB42FFDBA9
      42FFDAA942FFE1AD42FFE2AE42FFE2AE42FFE2AE42FFE2AE42FFE2AE42FFE1AD
      42FFDAA942FFD8A842FFDBAE52FFE4D7BBFF60B3E7FF1C99E8FF1C99E8FF1770
      AAFF1473B1FF1B97E6FF1C94DFFF1C92DCFF1C93DEFF1995E4FF1996E5FF1896
      E5FF1895E4FF1895E4FF1794E3FF387AA4EE0000000000000000010101070303
      030B0202020D0000003F000000A100000055000000E7000000FF000000FF0000
      00FF020303FF030303FF020303FF000000F40000006F00000087000000630000
      000000000000010101020202020D0303030F0202020D01010102000000000000
      0000000000000000000000000000000000000000000015161618A4A49CA4709D
      C1D620B6F0FFA9F1FFFF50DBFDFF138FE5FF3AA8E6FF17434A4E000000000DA2
      EAFF9EEBFBFF55D8F8FF0796E8FF1587E0FF3A8A919600000000007DE2FF90EB
      FFFF84E8FAFF2EB9EFFF2680DBFF59D1E9F70000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000010303
      030A0303030F0202020D01010102000000000000000000000000000000000101
      0001211900245A45026A090803160202020D010101020000000005040005D8A3
      00E5F0B500FFF0B500FFEFB400FFE7AF03FFE5AE04FFE7AF03FFEFB400FFF0B5
      00FFF0B500FF987301A30000000000000000AF8635E0E3AF44FFE2AF44FFDDAB
      44FFD9A944FFDBA944FFE2AE44FFE3AF44FFE3AF44FFE3AF44FFE3AF44FFE3AF
      44FFE2AE44FFDFBD78FFE0DCD5FFDDDEDEFF60B2E6FF1D9AE9FF1C99E8FF1661
      91FF106195FF1B98E7FF1B97E6FF1C94DFFF1C92DCFF1C93DEFF1995E4FF1996
      E5FF1896E5FF1895E4FF1895E4FF387AA4EE0000000000000000000000010303
      030A0303030F0202020D00000030000000B00000005A00000067000000AE0000
      00D3000000D6030303BC0303037D03030358000000AF0000004A000000000000
      00000000000000000000010101020202020D0303030F0202020D010101020000
      0000000000000000000000000000000000000000000000000000000000000021
      4D5F2FBAEFFFB4EFF9FF57D8F6FF2093E4FF41ABE6FF1F4D51570001020228AD
      EAFFB2F0F9FF64DDF7FF22A3E9FF3293E1FF3D969CA000000000088AE1FF9CED
      FAFF86E5F8FF30B8EFFF2681DDFF59D0EAF80000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00010202020D0303030F0202020D01010102000000003F300043C09200CDE1A8
      00F0F0B500FFEFB400FF896A039D0303030F0202020D01010102382B003DF0B5
      00FFF0B500FFF0B500FFE6AD00F74534004A0F0B031A74580487E7AF03FFEFB4
      00FFF0B500FFE5AB00F40302000300000000AB8435DDE5B146FFE5B146FFE4B0
      46FFDCAB46FFDBAA46FFDCAB46FFE4B046FFE5B146FFE5B146FFE5B146FFDEAE
      49FFF0DBB1FFF0F0F0FFE2E2E2FFDCDCDCFF5EADDFFF1D99E8FF1D9AE9FF1A85
      C8FF1887CDFF1C99E8FF1B98E7FF1B97E6FF1C94DFFF1C92DCFF1C93DEFF1995
      E4FF1996E5FF1896E5FF1895E4FF397BA5EE0000000000000000000000000000
      00010202020D0303030F0202020D000000060000005F000000A8000000A20000
      0087000000840101019F020202AE0303037A0203031A01010102000000000000
      0000000000000000000000000000000000030202020D0303030F0202020D0101
      0102000000000000000000000000000000000000000000000000000000000024
      5A6F46BFF0FFB7F1F9FF56D7F6FF2192E4FF42ABE6FF1E4C5157000103042AAD
      EAFFB3F1F9FF64DCF7FF25A2E8FF3896E2FF43979CA0000000000B8CE1FF9CED
      F8FF86E5F9FF2EB8EEFF2681DBFF59D0EAF80000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000010101020202020D0303030F0202020D0101010201010001A47C00AFF0B5
      00FFF0B500FFF0B500FFEFB400FF584404680303030F0202020D5743005FF0B5
      00FFF0B500FFF0B500FFA07901AA00000000010101020403020FD8A404F0E7AF
      03FFEFB400FFF0B500FF18120019000000000806023316110650161106501611
      06501612065119140A5918150A5A87682CC9E5B148FFE6B248FFBDA155FF4878
      8CFFF6F6F6FFF1F1F1FFEAEAEAFFDDDEDEFF5FACDDFF1F96E1FF1D99E8FF1D9A
      E9FF1C9AE9FF1C99E8FF1C99E8FF1B98E7FF1B97E6FF1C94DFFF1C92DCFF1C93
      DEFF1995E4FF1996E5FF1896E5FF397CA6EE0000000000000000000000000000
      0000010101020202020D0303030F0202020D0101010200000000000000040000
      001C0000001E00000008010101020202020D0303030F0202020D010101020000
      00000000000F0000006200000070000000860000007B0202026C030303350202
      020D01010102000000000000000000000000000000000000000000000000002C
      5F7346C2EFFFB8F1F9FF57D8F7FF2192E4FF41ABE6FF1E4D5257000103042AAD
      EAFFB2F1F9FF65DFF8FF25A4E9FF3896E2FF43979BA0000000000B8CE1FF9EEC
      FAFF88E7F9FF30B8EFFF2681DBFF59D1EBF80000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000010101020202020D0303030F0202020D010101020E0B000FCB98
      00D9F0B500FFF0B500FFF0B500FFE5AC00F73025043D0303030F4E3D035DEFB4
      00FFF0B500FFF0B500FFC09200CD03020003000000001A14001DE1AA04FBE5AE
      04FFE7AF03FFEFB400FF0E0B000F000000000000000000000000000000000000
      000000000000010101020202020D665023B1DAAB47FD51543E9B19608BFF2D6F
      99FFF6F6F6FFF1F1F1FFEBEBEBFFE5E5E5FF5FAEE0FF2096E0FF1F96E1FF1D9A
      E9FF1D9AE9FF1C9AE9FF1C99E8FF1C99E8FF1B99E8FF1B97E6FF1C94DFFF1C92
      DCFF1C93DEFF1997E5FF1996E5FF397CA9EE0000000000000000000000000000
      000000000000010101020202020D0303030F0202020D0000001A0000004C0000
      0056000000340000000200000000010101020202020D0303030F0202020D0000
      001D00000077000000B5000000FF000000FD000000FF000000D7020202790404
      044B0202020D000000010000000000000000000000000000000000000000002C
      5F7346C2EFFFBCF1F9FF57D8F6FF2192E4FF41AAE5FF204E5257000103042AAD
      EAFFB2EFF9FF64DDF8FF25A2E9FF3896E2FF43969BA0000000000B8CE2FF9CED
      FAFF86E5F8FF30B8EEFF2681DBFF59D1EAF80000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000120E0014523E00586851027A5946046B211A042D01010102271F
      002BE5AB00F4F0B500FFF0B500FFF0B500FFD19B01DF1410031F1F18032CE7AF
      03FFEFB400FFF0B500FFF0B500FFB38800BF7E5F0186D09D00DEEFB400FFE7AF
      03FFE5AE04FFC39503D800000001000000000000000000000000000000000000
      0000000000000000000001010102372C1484120F094D060F152F155E8EFF2E6F
      9AFFF6F6F6FFF1F1F1FFEBEBEBFFE6E6E6FF61B3E7FF2097E2FF2096E0FF2096
      E1FF1D9AE9FF1D9AE9FF1C9AE9FF1C99E8FF1C99E8FF1B99E8FF1B97E6FF1C94
      DFFF1C92DCFF1B94E0FF1997E5FF397CA9EE0000000000000000000000000000
      00000000000000000000010101020203032A0404048404040480010101830000
      00870000007B0000007B0000005600000000010101020202020D0303030F0202
      0279000000D4000000FF000000E900000053000000CE000000FF000000F50202
      027B040404260303030A00000001000000000000000000000000000000000026
      5C7345BFF0FFAEF1FAFF53DAF8FF299DE7FF4AB0E8FF23515459000203042AAD
      EAFFB2F1F9FF65DFF8FF25A2E8FF3896E1FF43979CA0000000000C8DE2FF9CEC
      FAFF86E5F8FF2EB8EEFF2781DDFF59D2EAF80000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000504
      00057F5F0187E7AE00F8F0B500FFEFB400FFE7AF03FFE5AE04FF9B7604AF140F
      0016513E0057F0B500FFF0B500FFF0B500FFF0B500FFAA8200B8060504109F78
      04B5E7AF03FFEFB400FFF0B500FFF0B500FFF0B500FFF0B500FFF0B500FFEFB4
      00FFE7AF03FF624B037001010107000000000000000000000000000000000000
      0000000000000000000000000000010101020202020D06101631175E8BFF2E70
      9AFFF6F6F6FFF1F1F1FFEBEBEBFFE6E6E6FF61B5E9FF1F9BEAFF2097E2FF2096
      E0FF2096E1FF1D9AE9FF1D9AE9FF1C9AE9FF1C99E8FF1C99E8FF1B99E8FF1B97
      E6FF1D94DFFF1C93DFFF1B95E2FF397CAAEE0000000000000000000000000000
      000000000000000000000000002A0000007D040404B4030303FF020303FF0000
      00FD000000FF000000E80000006E0000006F0000000001010102030404410303
      038D020303FF000000FF000000250000008F00000025000000D2000000FF0000
      00B50202026A0303030B01010107000000000000000000000000000000000B40
      697748D3F8FF63D9FAFF47BAF3FF2C9DECFF289CEBFF1F515E62000307082BAC
      EAFFB2F1F9FF65DDF8FF25A4E9FF3896E2FF43979CA0000000000C8DE1FF9CEC
      F9FF86E5F9FF30B8EEFF2681DBFF59D2EAF80000000000000000000000000000
      000000000000000000000000000000000000000000000000000302000003A47C
      00AFF0B500FFF0B500FFF0B500FFF0B500FFEFB400FFE7AF03FFE5AE04FFC496
      04DC120E00148564018DF0B500FFF0B500FFF0B500FFF0B500FF7B5D01841B16
      0327CC9903E5E7AF03FFEFB400FFF0B500FFF0B500FFF0B500FFF0B500FFF0B5
      00FFA87F00B50404020D02020208000000030000000000000003000000010000
      000000000000000000000000000000000000010101020610152F185E8BFF306F
      97FFF5F5F5FFF1F1F1FFEBEBEBFFE6E6E6FF62B5E9FF1F9DECFF1F9BEAFF2097
      E2FF2096E0FF2096E1FF1D9AE9FF1D9AE9FF1C9AE9FF1C99E8FF1C99E8FF1B99
      E8FF1B97E6FF1C95E1FF1B95E1FF3B7EA8EE0000000000000003000000010000
      0000000000000000000500000082000000C9000000FF020303FF030404DA0303
      035A000000F5000000FF000000FC0000006F0000004C000000000000005D0404
      04B6030303FF020303FF000000DD000000BC00000022000000D8000000FF0000
      00F7000000620303030A02020208000000030000000000000000000000000918
      191944B9DBDE4BB7F3FF3297ECFF1E8BE8FF0D6FC7DE00000000000B1A2030AF
      EAFFB4F1F9FF64DDF7FF25A2E9FF3896E2FF43979CA0000000000B8DE1FF9CEC
      F9FF86E5F8FF2EB8EEFF2883DDFF59D2EAF80000000000000000000000000000
      00000000000000000000000000000000000000000000010101046049026BEFB4
      00FFF0B500FFF0B500FFF0B500FFF0B500FFF0B500FFEFB400FFE7AF03FFE5AE
      04FF926F03A506050007B58900C1F0B500FFF0B500FFF0B500FFF0B500FF4737
      004E1F18042BAC8305C2E7AF03FFEFB400FFF0B500FFF0B500FFEBB300FC8967
      0193080600080000000101010107010101040000000001010104010101070000
      00010000000000000000000000000000000000000000030D1425185F8DFF306F
      98FFEDEDEDFFF0F0F0FFEBEBEBFFE6E6E6FF62B5E9FF209DECFF1F9DECFF1F9B
      EAFF2097E2FF2096E0FF2096E1FF1D9AE9FF1D9AE9FF1D9AE9FF1C99E8FF1C99
      E8FF1B99E8FF1B98E6FF1C96E3FF3B7EA8EE0000000001010104010101070000
      0001000000000000005A0000007D000000FF000000FF010101990203032C0303
      035C0303032E000000F9000000FF000000DC00000078000000000000005C0000
      00B8020303FF030303FF0303036F00000054000000D0000000FF000000FF0000
      00FC000000610000000101010107010101040000000000000000000000000000
      00000000000000000000000000000000000000000000000000000011283331B0
      EBFFB4F1F9FF65DFF8FF24A2E8FF3796E1FF43979CA0000000000B8DE2FF9CEC
      F9FF86E5F9FF2EB8EFFF2681DBFF59D0EBF80000000000000000000000000000
      0000000000000000000000000000000000000000000000000003C39503D7E9B1
      03FFEFB400FFF0B500FFD39F00E18564018DBC8E00C9F0B500FFEFB400FFE7AF
      03FFE1AC04FD1410031F1712001AD8A300E5F0B500FFF0B500FFF0B500FFE2A9
      00F1231900260303030E2F25033E674E0477775A01805E4700641A14001C0000
      0000000000000000000000000001000000030000000000000003020202080303
      030A0101010200000000000000000000000000000000020D1524176291FF3171
      99FFEBEBEBFFE8E8E8FFEAEAEAFFE6E6E6FF62B5E9FF209EEDFF209DECFF1F9D
      ECFF1F9BEAFF2097E2FF2097E1FF2096E1FF1D9AE9FF1D9AE9FF1D9AE9FF1C9A
      E9FF1C99E8FF1B99E8FF1B98E6FF3C7EA8EE0000000000000003020202080303
      030A0101010200000072000000C4000000FF000000FF000000A8000000C80303
      03EB03030311030303E6000000FF000000FF0000007B00000017000000470000
      008E000000FF020303FF03030343030303A80000003A000000D2000000FF0000
      00C9000000620000000000000001000000030000000000000000000000000000
      000000000000000000000000000000000000000000000000000000132C3732B0
      EBFFB7F1F9FF66DFF7FF25A3E8FF3795E0FF43979CA0000000000C8CE1FF9CEC
      F9FF86E5F9FF2EB8EFFF2681DDFF59D1EAF80000000000000000000000000000
      000000000000000000000000000000000000000000000E0B000FEBB202FFE8B0
      03FFE7AF03FFE8AF00FA1A14001C0000000005040005C99800D6F0B500FFEFB4
      00FFE7AF03FF463603550202020D3729003BEAB000FBF0B500FFF0B500FFF0B5
      00FFC69600D30B09000D0202020D0303030F0202020D01010102000000000000
      0000000000000000000000000000000000000000000000000000010101070303
      030B0202020D01010102000000000000000000000000020D1524176293FF3073
      9DFFEDEDEDFFE6E7E7FFE2E2E2FFE5E5E5FF63B5E9FF209EEDFF209EEDFF209D
      ECFF1F9DECFF1F9BEAFF2197E2FF2097E1FF2096E1FF1D9AE9FF1D9AE9FF1D9A
      E9FF1C9AE9FF1C99E8FF1C99E8FF3C82ABEE0000000000000000010101070303
      030B0202020D00000070000000E4000000FF000000FF000000F7000000740000
      001904040480030303FF020303FF000000FF0000007C00000033000000050000
      0073000000EE000000FF020202DB0303034C030303AA000000FF000000FF0000
      00780000002F0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000112E3B31AF
      EAFFACF3FAFF64E1F9FF2EACEBFF3CA2E4FF4B9C9CA0000000000C8DE1FF9CEC
      F9FF86E5F8FF2EB7EEFF2681DDFF59D1EAF80000000000000000000000000000
      000000000000000000000000000000000000000000001712001AEFB500FFE9B1
      03FFE5AE04FFD29F04EB020200030000000000000000A67D00B0F0B500FFF0B5
      00FFEFB400FF503D025F0303030F0202020D634B006CF0B500FFF0B500FFF0B5
      00FFF0B500FF9B7401A5020200030202020D0303030F0202020D010101020000
      0000000000000000000000000000000000000000000000000000000000010303
      030A0303030F0202020D010101020000000000000000030D1524186394FF2E72
      9EFFF5F5F5FFE8E8E8FFE1E1E1FFDDDEDEFF63B5E9FF219EEDFF209EEDFF209E
      EDFF209DECFF1F9DECFF1F9BEAFF2197E2FF2097E1FF2096E1FF1D9AE9FF1D9A
      E9FF1D9AE9FF1C9AE9FF1C99E8FF3C82ABEE0000000000000000000000010303
      030A0303030F02020278000000D3000000FF000000FF00000091000000350000
      00EB000000C1020303F8030303FF020303FF0000007B00000024000000000000
      003700000072000000E4000000FF030303E4030303FF020303F8010101810000
      005D000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000031D384343CE
      F6FF57D6FAFF45BAF4FF2C9EECFF2295E9FF358CA5AA000000000D8FE1FF9CEC
      F9FF88E5F9FF2EB8EFFF2681DBFF59D1EBF80000000000000000000000000000
      0000000000000000000000000000000000000000000005040005E7AE00F6EFB4
      00FFE7AF03FFE5AE04FF6A51027B0806000941320046E7AE00F8F0B500FFF0B5
      00FFF0B500FF312500350202020D0303030F0303030E967301A3F0B500FFF0B5
      00FFF0B500FFF0B500FF684E006F010101020202020D0303030F0202020D0101
      0102000000000000000000000000000000000000000000000000000000000000
      00010202020D0303030F0202020D0101010200000000030D1524186494FF1965
      94FFCEDCE4FFF0F0F0FFE2E2E2FFDCDCDCFF61B0E1FF219EEDFF219EEDFF219E
      EDFF209EEDFF209DECFF1F9DECFF1F9BEAFF2197E2FF2097E1FF2096E1FF1D9A
      E9FF1D9BEAFF1D9AE9FF1C9AE9FF226994E70000000000000000000000000000
      00010202020D0404047304040497000000FF000000FF000000A1000000280000
      008400000011000000F7020303FF030303F30202027D00000003000000000000
      0000000000300000006E000000840101018F0202028D0303037C030303590101
      0102000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003DA7
      BBBE47B8F4FF359CEDFF228EE8FF0F7AD8F001112429000000001498E2FFA0EC
      F8FF89E6F8FF2FB7EEFF267EDAFF59D2EAF80000000000000000000000000000
      00000000000000000000000000000000000000000000000000009D7801A9F0B5
      00FFEFB400FFE9B103FFE8B003FFE9B103FFEFB400FFF0B500FFF0B500FFF0B5
      00FFD29F00E002010002000000010303030A0303030B0B0A0214C39300D0F0B5
      00FFF0B500FFF0B500FFEAB000FB382B003C000000010303030A0303030B0303
      030A000000010000000000000000000000000000000000000000000000000000
      0000000000010303030A0303030B0303030A00000001030D1422196595FF1965
      95FF2E739EFF8BAFC5FF9BB7C9FF95B1C2FF4AA2DAFF239BE7FF219FEDFF219E
      EDFF219EEDFF209EEDFF209DECFF1F9DECFF1F9DEBFF2099E5FF1F98E3FF1F98
      E4FF1E9BE9FF1D9BEAFF2A8FCEFF165681DF0000000000000000000000000000
      0000000000010103031E0202027E020202ED000000FF000000FF000000AC0000
      0038000000D8000000FF000000FF030303870303036E0303030A000000010000
      000000000000000000000000001D0000003C0000002B0303030C0303030B0303
      030A000000010000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001393E2FF96ED
      F9FF7DE5F9FF34BAF1FF328EDFFF64DEEFFB0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000251C0028E6AE
      00F5F0B500FFEFB500FFEBB202FFEBB202FFEBB202FFEFB500FFF0B500FFF0B5
      00FF503D00560000000000000000000000010101010702020208211A0129E0A9
      00EFF0B500FFF0B500FFF0B500FFB88900C30000000000000001010101070202
      0208010101070000000100000000000000000000000000000000000000000000
      0000000000000000000101010107020202080101010700010105175984E01A65
      96FF1A6596FF1A6596FF1A6596FF1A6596FF2085C6FF239DEAFF239DEAFF219F
      EDFF219FEEFF219EEDFF209EEDFF209DECFF1F9CEAFF1E95DEFF1F8BCFFF1D83
      C3FF1D7BB8FF1B72ABFF196596FF104162A60000000000000000000000000000
      000000000000000000010101015502020270010101E8000000FF000000FF0000
      00D4000000FF000000FF00000095000000800101010B02020208010101070000
      0001000000000000000000000000000000000000000000000001010101070202
      0208010101070000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000039C2F1FF59DC
      FCFF57C7F6FF35A7EFFF1F8EE9FF36B0F0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004433
      0048E3AC00F2F0B500FFF0B500FFEEB401FFEDB301FFEEB401FFEDB200FE7054
      0077000000000000000000000000000000000000000000000003010101044635
      004DF0B500FFF0B500FFF0B500FFBA8D00C60000000000000000000000000000
      0003010101040000000300000000000000000000000000000000000000000000
      00000000000000000000000000000000000301010104000000030510192B144A
      6EB9175985E0175A86E2175A86E2165B86E317618EE71F89CBF71F90D8FA1E89
      C9F71C7EBDF41A74B0F1196CA1EE196496EC185B8BE9185F8AEA185E89EB195E
      88EB195C8BEC195F8AEA104365AB02070C140000000000000000000000000000
      00000000000000000000000000000000004E0000007B01010183000000B40000
      00BF0000009900000072000000780000000B0000000000000003010101040000
      0003000000000000000000000000000000000000000000000000000000000000
      0003010101040000000300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003383858549C0
      F6FF3FA7EFFF228DE9FF127EE3FC002658630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001C15001E89670193D09D00DEE7AE00F8D9A400E89D7801A9332500360000
      0000000000000000000000000000000000000000000000000000000000000000
      0000664D006CE2A900F1D19D00DF3729003A0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000B0000005A0000006D0000
      006B0000006C0000002B00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000030101010400000003000000320000
      00D2000000D40000004100000000000000000000000000000003010101040000
      0003000000000000000000000000000000000000000000000000000000000000
      000301010104000000030000000000000000000000E8000000FF000000FF0000
      00FF000000C00000000A00000000000000030101010400000003000000000000
      0000000000000000000000000000000000000000000000000003010101040000
      0003000000000000000000000000000000000000000000000000000000000000
      0003010101040000000300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000010101011202020290010101FD0000
      00DB000000D3000000FF000000B40000002C0000000000000001010101070202
      0208010101070000000100000000000000000000000000000000000000000000
      0001010101070202020801010107000000000000000E00000014000000140000
      0017000000D10000004E00000000000000010101010702020208010101070000
      000100000000000000000000003500000082000000BD000000E1010101EA0101
      01DD020202C3000000930000004E000000050000000000000000000000000000
      0001010101070202020801010107000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000003000000010000
      00000000000000000000000000000000004E000000E2020202EF0202026A0303
      030C0000000100000046000000D0000000FD0000009B0000001A000000010303
      030A0303030B0303030A00000001000000000000000000000000000000000000
      0000000000010303030A020202080000000300000000010101340000001B0000
      0000000000BC000000540000000000000000000000010303030A0303030B0103
      031800000074000000D9000000E700000098000000570000002F000000270202
      023B0303035A03030389000000D3000000DF0000004D00000000000000000000
      0000000000010303030A02020208000000030000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000001010104010101070000
      0001000000000000001C000000AE000000FF000000A3000000180202020D0303
      03540203035400000003000000030000005F000000E4000000F7000000890000
      000F0202020D0303030F0202020D010101020000000000000000000000000000
      00000000000000000001010101070101010400000000000000E30101019C0000
      0001000000BC00000054000000000000000000000000000000150303038A0303
      03F1030303BA0000004B00000003000000000000000000000000000000000101
      01020202020D0303030F0202020D00000056000000E5000000AE0000001C0000
      00000000000000000001010101070101010404040317221F1DA2262622BC2626
      22BC262622BC262622BC262622BC292E66D328283FC6262622BC262622BC2626
      22BC262622BC262622BC1B191987010101040000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000003020202080202
      020D0000006F000000F3000000DB00000044000000000000001C000000AF0203
      03FF030303FF030303C4000000360000000000000020000000FF000000F40000
      00E90000006A030404120303030F0202020D0101010200000000000000000000
      000000000000000000000000000100000003000000000101012D0101011C0303
      030A000000BC0000005400000060000000BB000000D5000000F9000000AD0204
      04390303030F0202020D01010102000000000000000000000000000000000000
      0000010101020202020D0303030F0202020D0000001000000093000000F00000
      0070000000030000000000000001000000031E1D1D950F0D0C46010101040101
      01040101010401010104010101041A1E76820E113C4301010104010101040101
      010401010104000000051B1A1983121010570000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0303202489952A2FB6C4252CA5B3040514150000000000000000000000000406
      1517242BA7B42A2FB6C41E228892000002020000000000000000000000000000
      0000000000000000000000000000000000000000000000000000010101370303
      03CE020303FA0101018400000009000000030000006D000000F3000000DE0000
      004902020244030303C8020303FF010101A800000036000000FF0000004B0000
      0091000000FA000000D903030359040404100202020D01010102000000000000
      0000000000000000000000000000000000000000000000000000010101070303
      030B020303BF0000005500000027000000540000003D0000000F000000000101
      01020202020D0303030F0202020D0101010200000003000000130000001E0000
      001E00000018000000090202020D0303030F0202020D01010102000000350000
      00CE000000CD000000340000000000000000222220A804040418000000000000
      00000000000000000000000000001B1F77800E103C4000000000000000000000
      00000000000000000000111110541515156C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001214
      4E541C1F7983000000000F1041461F2386910000000000000000000000001F24
      8C970E103C40000000001B207D8611134B510000000000000000000000000000
      0000000000000000000000000000000000000000000D0000008E000000FD0202
      02C4040404370202020D00000033000000CC000000FB000000870000000A0000
      0000010101020303030E0303035B020202DB000000FA000000FF0000003C0000
      000000000023000000AA000000FF030303C7030303440202020D010101020000
      0000000000000000000000000000000000000000000000000000000000010303
      030A030303C00203035D01010102000000000000000000000000000000000000
      000000000015030303A2030303C8030303E6000000FD000000FB000000F10000
      00F1000000F6000000FD000000C903030364040404120202020D010101020000
      000300000072000000F0000000920000000B222220A804040418000000000000
      00000000000000000000000000001B1F77800E103C4000000000000000000000
      00000000000000000000111110541515156C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001517
      5B621518616800000000090A272A202696A10000000000000000000000002327
      9AA60809222400000000151A626A13165A600000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF0000007F0000
      00030304041904040495020303FD000000C60000002D00000000000000320000
      00D0000000D2010101420202020D030303140202027E000000FF0000003C0000
      0000000000000000000000000038000000C3020303FF040404AF0204042F0101
      0102000000000000000000000000000000000000000000000000000000000000
      0001020303BF0404045E0202020D010101020000000000000000000000000000
      00000000000D00000070030303580404043A0203031D01010102000000000000
      0000000000000000000F00000059000000D0020202DE0303036C030404120101
      0102000000000000001D000000B8000000AF222220A804040418000000000000
      00000000000000000000000000001B1F77800E103C4000000000000000000000
      00000000000000000000111110541515156C0000000000000000000000000000
      00000000000000000000000000000101010B202020A4292927CF1817167A0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000303
      0D0E282EB1C02126939D2B30BCC9090A2A2E000000000000000000000000090B
      2D312B30BCC92025929E262CB1BE03030B0C0000000000000000000000000000
      0000000000000000000000000000000000000000006C000000F8000000F90000
      00AC000000E2030303F1030303700202020F0000000E0000008D000000FD0000
      00DF000000D4000000FF000000B40204043604040426020303FF0000003D0000
      0000000000000000000000000000000000010000005F020303FA030303FC0404
      0497000000170000000000000000000000000000000000000000000000000000
      0000000000BC0203035D0303030F0202020D0101010200000000000000000000
      000000000000000000000101010203030316030303630202027A000000750000
      00740000007A000000D300000048000000010000004F030303CC030303E30304
      04730000000A000000000000001E000000F7222220A804040418000000000000
      00000000000000000000000000001B1F77800E103C4000000000000000000000
      00000000000000000000111110541515156C0000000000000000000000000000
      000000000000000000000101010B262423B810100E4F000000011E1E1B941918
      177D000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000020A0A
      0A370F0F0F4614142E610E0E144B0E0E0D440E0E0D440E0E0D440E0E0D440E0E
      0D440E0E144B13152D600E0E0E450908082A0000000000000000000000000000
      0000000000000000000000000000000000000000000000000022000000CE0000
      00FF000000A70000001A0202020D03030359030303E4000000F0000000670000
      00020000000000000046000000D0000000FD030303A9030303FF030404460101
      01020000000000000000000000000000000000000018000000FF020202920303
      03EA020303F20000007900000009000000000000000000000000000000000000
      0000000000BC000000550202020D0303030F0202020D01010102000000000000
      0000000000000000000000000044000000E1030303C9030303A2030303A10101
      019D000000970000005C00000002000000000000000001010102020202510303
      03C6030303E70000007D000000A9000000BB222220A804040418000000000000
      00000000000000000000000000001B1F77800E103C4000000000000000000000
      00000000000000000000111110541515156C0000000000000000000000000000
      0000000000000101010B262423B810100E4F0000000000000000000000011F1C
      1C931918177D0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000002252321B01D1D
      1A921918177C1918177C1918177C1918177C1918177C1918177C1918177C1918
      177C1918177C1918177C1918177D22201EA71C1B1B8B00000000000000000000
      00000000000000000000000000000000000000000075000000FF000000DE0000
      0048000000000000001C000000AF020303FF040404AC02030324010101020000
      00460000004800000001000000030000005F000000E6020303FF030303480202
      020D0101010200000000000000000000000000000018000000FF0000003D0203
      031A03030389020202F5000000F8000000610000000000000000000000000000
      0000000000BC00000054010101020202020D0303030F0202020D010101020000
      00000000000400000084000000ED00000057010101020202020D0303030F0202
      020D010101020000000000000000000000000000000000000000010101020202
      020D0404044B030303A40000008D00000013282A66C61E24879A1D2185901D21
      85901D2185901D2185901D2185902A2FB9C823299FAC1D2185901D2185901D21
      85901D2185901D21859024298DB51D1E408A0000000000000000000000000000
      00000101010B262423B810100E4F00000000090B2C2F0A0C3438000000000000
      00011D1D1A921918177D00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000C0B0B3D1D1B1A8E0000
      00000000050503030B0C03030B0C03030B0C03030B0C03030B0C03030B0C0303
      0B0C03030B0C03030B0C0101040400000000262222B50505051E000000000000
      000000000000000000000000000000000000000000FF000000FF0000009E0000
      00200000006E000000F3000000DE000000490202020D04040428020202AD0000
      00FF000000FF000000BE000000330000000000000020000000FF030404460303
      030F0202020D01010102000000000000000000000018000000FF000000B30000
      001D0204041302020290010101FF000000FF0000000000000000000000000000
      0000000000BC000000540000001B010101450303034E0404044F0303034E0000
      0058000000CE000000C7000000200000000000000000010101020202020D0303
      030F0202020D0101010200000000000000000000000000000000000000000101
      01020202020D0303030B0101010700000000242434B10D0F3043090C2D30090C
      2D30090C2D30090C2D30090C2D3020248D9815195E64090C2D30090C2D30090C
      2D30090C2D30090C2D3018193A74181821740000000000000000000000000101
      010B262423B810100E4F00000000000002022A30BDCA282FB7C50F1242470000
      0000000000011E1B1B911918177D000000000000000000000000000000000000
      000000000000000000000000000000000000000000001B1A19860D0C0B410000
      000014175C63242BA7B4242BA7B4242BA7B4242BA7B4242BA7B4242BA7B4242B
      A7B4242BA7B4242BA7B41316585E000000001211115B17161673000000000000
      000000000000000000000000000000000000000000080000006D000000E80000
      00F1000000FB000000870000000A000000030000006B020303F2040404E00202
      02510000003B000000C6000000FF000000A500000036000000FF0000003D0202
      020D0303030F0202020D010101020000000000000018000000FF000000E70000
      00F7000000EC020202F80202028B000000110000000000000003000000010000
      0000000000BC000000540000006E000000D0000000D0030303D2040404D30303
      03C70000006B0000000300000000000000000000000000000000010101020204
      041303030330030303370000001B000000010000000000000000000000000000
      0000010101020303030A0202020800000003222220A804040418000000000000
      00000000000000000000000000001B1F77800E103C4000000000000000000000
      00000000000000000000111110541515156C00000000000000000101010B2624
      23B810100E4F0000000004041617000001012528A4B02A31BCCB111452580000
      000000000000000000011D1C1C90171616730000000000000000000000000000
      00000000000000000000000000000000000000000000282625C2010101060000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000303030E272724C1000000000000
      0000000000000000000000000000000000000000000D01010190010101FD0000
      00CC0000002C000000000000002F000000C8000000FB01010188020303170404
      0415030404120000000300000053000000DB000000FA000000FF0000003C0101
      01020202020D0303030F0202020D0101010200000018000000FF000000420000
      0075000000F5000000ED02020270000000090000001700000023010101260000
      0023000000D30000004C000000000000000000000000010101020202020D0303
      030F0202020D0101010200000000000000000000000600000060000000BF0000
      00FA030303F0030505E7020303F7000000EC000000A200000038000000000000
      000000000000000000010101010701010104222220A804040418000000000000
      00000000000000000000000000001B1F77800E103C4000000000000000000000
      00000000000000000000111110541515156C0000000000000003262222B51010
      0E4F00000000000000001F238791262BA8B7252AA5B320248D980D0F3F430101
      0404000000000000000000000001292724C70000000000000000000000000000
      00000000000000000000000000000000000004040419232222AF000000000505
      171A1011464C1011464C1011464C1011464C1011464C1011464C1011464C1011
      464C1011464C1011464C1011464C0405171900000000232321AD070707220000
      000000000000000000000000000000000000000000FF000000FF020202870303
      030C0000000D0000008A000000FC000000C60000002D000000000000004B0303
      03EE030303F10303036500000004000000060000007B000000FF0000003C0000
      0000010101020202020D0303030F0202020D0000001A000000FF000000550000
      00000000001200000099000000FF000000F9000000DD000000F0010101F00202
      02F1000000B30000000800000000000000000000000000000000010101020202
      020D0303030F0202020D010101020000003A000000D9000000CC000000600000
      00180000000603040419040404120303033801010183000000EC000000A70000
      001100000000000000000000000100000003222220A804040418000000000000
      00000000000000000000000000001B1F77800E103C4000000000000000000000
      00000000000000000000111110541515156C00000000121010571A19187E0000
      0000000000000000000000000000090B30342126919D161861681F21848E1619
      656E00000000000000001311115C20201D9E0000000000000000000000000000
      000000000000000000000000000000000000141212611414146700000000080B
      292C181C6B74181C6B74181C6B74181C6B74181C6B74181C6B74181C6B74181C
      6B74181C6B74181C6B74181C6B740809272B0000000012101057191716770000
      00000000000000000000000000000000000000000070000000FC010101F90202
      02AF040404E2000000F000000067000000020000001A000000A9000000FF0000
      00BF040404B6030303FD030303D10101014500000018000000FF0000003C0000
      000000000000010101020202020D0303030F02030324000000FF000000FB0000
      008F0000006C000000E6000000FF0000007C0000000000000000010101070303
      030B0202020D0101010200000000000000000000000000000000000000000101
      01020202020D0303030F03030360000000F200000066000000130000007E0000
      00D3000000FD000000FF020303F5030303BD0204045E00000015000000A70000
      00D90000001C000000000000000000000000222220A804040418000000000000
      00000000000000000000000000001B1F77800E103C4000000000000107070000
      01010000000000000000111110541515156C00000000211E1E9D080806260000
      0000000000000000000000000000242A9EAB1D22858E252AA5B3000000000000
      0000000000001311115C232222AF000000070000000000000000000000000000
      000000000000000000000000000000000000232121AA0505051E000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000101010B292424C30000
      0000000000000000000000000000000000000000000000000021000000CD0102
      02FF040404AC02030324000000050000006A000000F1000000E10000004B0000
      00000101010203030338030303BA020303FF000000BE000000FF0000003C0000
      00000000000000000000010101020202020D04040426020303FF0101018D0000
      00E9000000FC000000C80000001E000000000000000000000000000000010303
      030A0303030F0202020D01010102000000000000000000000000000000000000
      0000010101020202024A030303F20303034800000049000000EB000000B20000
      004D0000001600000005000000210303036F020404DB030303C30000001A0000
      008D000000D30000000B0000000000000000222220A804040419000000000000
      00000000000000000000000000001B1F77801619636B282EB1C0272DAEBC2A30
      BAC81B207D8600010707111010561515156C00000000222220AE040403120000
      0000000000000000000000000000090D3235282CB3C11C207D86000000000000
      00001311115C232222AF00000007000000000000000000000000000000000000
      000000000000000000000000000001010104282525C4000000000A0B2F321C20
      7E881C207E881C207E881C207E881C207E881C207E881C207E881C207E881C20
      7E881C207E881C207E881C207E881C207E88090B2C2F00000000232121AA0706
      06250000000000000000000000000000000000000071000000FF000000DE0000
      00490202020D0303033B030303CB000000FC0000008B0000000B000000000000
      000000000000010101020202020D0303034D030303E3000000FF0000003C0000
      00000000000000000000000000000101010202030324030303FF030404460000
      000F00000086000000F5000000F30000005D0000000000000000000000000000
      00010202020D0303030F0202020D010101020000000000000000000000000000
      00000000000A000000E10303036604040456030303F100000052000000000000
      000000000000000000000000000001010102020404130404049B020202DB0000
      0016000000B80000008D00000000000000001616146F201D1D9B151312641513
      1264151312641513126415131264292C96C32E35C5E317172773151312641413
      13652022669E2B31ADD2252527BD0A09093400000000262323BA010101061817
      15742A2525C81311115C00000000000000000000000000000000000000001311
      115C232222AF0000000700000000000000000000000000000000000000000000
      00000000000000000000000000000B0B0B3C1C1C1A8D00000000030310110C0E
      34380C0E34380C0E34380C0E34380C0E34380C0E34380C0E34380C0E34380C0E
      34380C0E34380C0E34380C0E34380C0E343803040F100000000010100F531918
      187B00000000000000000000000000000000000000FF000000FF0000009C0000
      00270101018B020303FC030303CC0202023B0101010200000000000000000000
      000000000000000000000000001B020202B2030303FF030303A70000000A0000
      0000000000000000000000000000000000000000001A020303FF040404B80204
      0426000000080000008A000000FF000000FF0000000000000000000000000000
      0000010101020202020D0303030F0202020D0101010200000000000000000000
      000000000070000000C200000019030303EF040404580202020D010101020000
      000000000035000000B10000000C00000000010101020303030E030303A90202
      02AE00000023000000F40000001A00000000000000010E0E0D441311115C1311
      115C1311115C15151F661C1F558D2D33BAD9222880AE181A3C7B1211135D1311
      115C1311115C21236A9D2124839D0000000000000000262525BE000000002C2D
      5AD820248A98282525C4000000000000000000000000000000001311115C2322
      22AF000000070000000000000000000000000000000000000000000000000000
      00000000000000000000000000001B1A19861A1918810E0E0E480E0E0E480E0E
      0E480E0E0E480E0E0E480E0E0E480E0E0E480E0E0E480E0E0E480E0E0E480E0E
      0E480E0E0E480E0E0E480E0E0E480E0E0E480E0E0E480E0E0E48141414671F1F
      1C9900000000000000000000000000000000000000080000006C000000EC0000
      00F7000000F20000006C030404100303030F0202020D01010102000000000000
      00000000000100000061000000EF000000DD0203034C0303030F0202020D0101
      01020000000000000000000000000000000000000018000000FF030303EA0303
      03F6030303EC000000F9000000890000000E0000000000000000000000000000
      000000000000010101020202020D0303030F0202020D01010102000000000000
      0000000000D3000000510000008A010101A90202020D0303030F0202020D0000
      0055000000F0000000CB000000E00000001400000000010101020203031D0303
      03F00202023B000000AC00000074000000000000000000000000000000000000
      05051D207C87282EB3C1191E717A3038D8EA242AA0AB20248995292FB8C60F11
      454A00000000000001012025929E1C1F7C850C0E34382B2B63D223299FAA2A2F
      9DCB292932CB111110580000000000000000000000001311115C232222AF0000
      0007000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000282525C41817167818171678181716781817
      1678181716781817167818171678181716781817167818171678181716781817
      1678181716781817167818171678181716781817167818171678181615720303
      0314000000000000000000000000000000000000001A000000AA000000FF0000
      00B50000001A00000000010101020202020D0303030F0202020D010101020000
      0021000000BB000000FE0000008E0000000B01010102020303110303030F0202
      020D0101010200000000000000000000000000000018000000FF010101440202
      027F030303F7020202ED00000068000000050000000000000000000000000000
      00000000000000000000010101020202020D0303030F0202020D010101020000
      0016000000FB0000000B000000E30000003E010101020202020D0303030F0303
      03C70000005A00000000000000B4000000670000000000000000010101020303
      039D0303039002020267000000B7000000000000000000000000000000002126
      939D151861680000010104061517292EB7C5242AA1AE0000000003030D0E252A
      A4B00F11464B000000000000020211144F561C21818B2C3182DE0A0B28310000
      000000000005030303100604041B090908311C1B1B8B242220AB000000070000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000404041A242221B10000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF0000007D0000
      0000000000000000000000000000010101020202020D04040412020404760000
      00F5000000D5000000370000000000000000000000130101019D0303039E0404
      04AC020404260101010200000000000000000000002B000000FF000000680101
      010203040420030303A0010101FF000000F70000000000000000000000000000
      0000000000000000000000000000010101020202020D0303030F0202020D0000
      003C000000DC00000014000000FF0000000600000000010101020202020D0303
      03430202021A0001012D000000D90000004F0000000000000000000000000000
      005E020303BE0202023E010101DE00000000000000000000000003031011272C
      A9B600000000000000001E2288921011464C23279AA60C0E3438000000000203
      0E0F252CACB9000000000000000000000000000000000F0E0E4B272724C12727
      24C1272524BD242221B123211FA61E1E1B94100E0E4C00000001000000000000
      0000000000000000000000000000000000000000000000000000141212611515
      156C1515156C1615156E272524C00D0D0C3F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000051000000DA000000FF0000
      00B3000000360000000000000000000000000001012B030303CA030303FB0304
      0488000000090000000000000003000000000000000000000000000101480303
      03C40303030F0202020D0000000300000055000000EC000000FC000000FF0000
      00AD00000076020202E5010101FF010101810000000000000003000000010000
      000000000000000000000000000000000000010101020202020D0303030F0303
      0350000000D000000020000000F3000000000000000000000000010101020202
      023F030303E8030303EC0101018D000000010000000000000000000000000000
      004C000000C902030330010101EA000000030000000000000000000107072B30
      BCC90405141511134B512329A1AC0000010106071A1C2930B9C706071A1D0F12
      474D2026919B0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000F0F0D4A1111
      10541111105410100F530505051F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000005010101530000
      00CB000000FF000000B8000000400000007D000000FA000000CB020404390303
      030F03040429000000C6000000BA000000BC000000A60000007B000000BA0101
      01970202020D04040428040404B4000000FF0000009F000000130000004D0000
      00D7000000FE000000D402020230010101040000000001010104010101070000
      00010000000000000000000000000000000000000000010101020202020D0303
      0342030303E30000000C000000FF0000000B0000000000000000000000000000
      00BA0202027B0303030F0303034D0000002E0000000000000000000000000000
      0064000000B40000003B010101D9010101040000000000000000000000000C0E
      3438272DAEBC21248F9A03030B0C0000000000000000090A2A2E242BA7B42126
      94A002030E0F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000003020202080303
      030B00000049000000C6000000FF000000FC0000009600000004010101020202
      020D04040457040404B30101010200000000000000170000003E000000280000
      000100000063030303F1040404E2030303500101010200000000000000000000
      00040000006B000000E7000000FF0000007F0000000000000003020202080303
      030A010101020000000000000000000000000000000000000000010101020202
      021B030303FC0303031F000000D00000004E0000000000000000000000000000
      00BC0000007103040412030303C9030303660101010200000000000000000000
      00A60000007C0000006B000000AD000000030000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000010101070303
      030B0202020D0000000300000043000000C6000000FF000000C2000000430000
      000303040472040404AB020202AE0001012B0000000000000000000000220000
      00BC000000FE01010191030404190303030F0202020D01010102000000000000
      00000000001000000097000000FF000000F50000000000000000010101070303
      030B0202020D0101010200000000000000000000000000000000000000000101
      0102030303C60303036C02020279000000C10000000100000000000000000000
      0038000000EA000000F4030303C1030303170202020D01010102000000200000
      00F500000021000000BE00000065000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000010303
      030A0303030F0202020D01010102000000000000003F000000BC000000FF0000
      00C6000000490303030E030303110202020F0000000500000070000000F50000
      00D60000003900000000010101020202020D0303030F0202020D000000070000
      006A000000EC000000EC0000006C000000050000000000000000000000010303
      030A0303030F0202020D01010102000000000000000000000000000000000000
      00000000005C030303D80303031C020202DE0000007200000000000000000000
      00000000001900000083010101020202020D0303030F02030314000000C20000
      008D00000036000000EF0000000E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00010202020D0303030F0202020D010101020000000000000000000000390000
      00B7000000FF000000CB0303035604040439030303CB000000FB000000820000
      0007000000000000000000000000010101020303030E03030354030303D80000
      00FA0000008D0000001000000000000000000000000000000000000000000000
      00010202020D0303030F0202020D010101020000000000000000000000000000
      000000000003000000CC0304048703030338030303ED01010180000000050000
      00000000000000000000000000000101010203030325030303C1020303BF0000
      0012000000D20000007100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000010303030A0303030B0303030A0000000100000000000000000000
      000000000035000000B2000000FF020202FA020202DE01030338000000010000
      00000000000000000000000000000000002C000000B9010202FF020202B20102
      022D000000010000000000000000000000000000000000000000000000000000
      0000000000010303030A0303030B0303030A0000000100000000000000000000
      00000000000000000027000000ED0202026A0303032E020202CC000000DC0000
      007B00000045000000350000004F00000095000000F1010101990202021B0202
      02B7000000B60000000200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000101010107020202080101010700000001000000000000
      0000000000000000000000000030000000BA010101FF010101D40202025A0000
      0004000000000000001600000098000000FD000000CD00000040010101070202
      0208010101070000000100000000000000000000000000000000000000000000
      0000000000000000000101010107020202080101010700000001000000000000
      0000000000000000000000000035000000EA0101019601010115010101510000
      00A0000000CC000000DD000000C70000008B0000002A0000002E010101CE0202
      02BB010101110000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000030101010400000003000000000000
      0000000000000000000000000000000000000000002C010101A8000000FE0000
      00DB000000F8000000F2000000E50000005F0000000200000000000000000000
      0003010101040000000300000000000000000000000000000000000000000000
      0000000000000000000000000000000000030101010400000003000000000000
      00000000000000000000000000000000001C000000B2000000ED010101900101
      01470000001D00000014000000280000005A000000AF000000F30000007A0101
      0106010101040000000300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000280000
      00BE000000FF0000008B0000000B000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000033000000920000
      00D2000000F5000000FD000000EC000000BF0000007500000015000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000030101010400000003000000000000
      0000000000000000000000000000000000000000000000000003010101040000
      0003000000000000000000000000000000000000000000000000000000000000
      0003010101040000000300000000000000000000000000000000000000130000
      00B1000000FB000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FB0000
      00AE000000120000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000030101010400000003000000000000
      0000000000000000000000000000000000000000000000000003010101040000
      0003000000000000000000000000000000000000000000000000000000000000
      0003010101040000000300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000010101010702020208010101070000
      0001000000000000000000000000000000000000000000000001010101070202
      0208010101070000000100000000000000000000000000000000000000000000
      0001010101070202020801010107000000000000000000000000000000AE0000
      00A40000001D0000001400000014000000140000001400000014000000140000
      0014000000140000001400000014000000140000001400000014000000140000
      00140000001400000014000000140000001400000014000000140000001E0000
      00A9000000AB0000000000000000000000001F113063321E5DA4321E5DA4321E
      5DA4321E5DA4321E5DA4321E5DA4321E5DA4321F5CA6321E5BA7321F5CA6321E
      5DA4321E5DA4321E5DA4321E5DA4321E5DA4321E5DA4321E5DA4321F5CA6321E
      5BA7321F5CA6321E5DA4321E5DA4321E5DA4321E5DA4321E5DA4321E5DA4321E
      5DA4321F5CA6321E5BA7321F5CA61E0F2D5F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000003000000010000
      000000000000000000000000000000000000000000010303030A0303030B0303
      030A000000010000000000000000000000000000000000000000000000010303
      030A0303030B0303030A00000001000000000000000000000000000000000000
      0000000000010303030A02020208000000030000000000000000000000FB0000
      001300000025000000B9000000DB000000DC000000DC000000DC000000DC0000
      00DC000000DC000000DC000000DC000000DC000000DC000000DC000000DC0000
      00DC000000DC0000008E00000026000000B50000000D00000000000000000000
      0018000000F900000000000000000000000047317FD25B52D4FF5B50D1FF5B4F
      CFFF5B4ECDFF5B4CC8FF5B4CC8FF5B49C0FF5A48BBFF5948B7FF5948B7FF5948
      B7FF5B48BDFF5A4AC3FF5A48BCFF5A48BCFF5A48BCFF5A48BCFF5A48BBFF5A4B
      BFFF5948B7FF5948B7FF5A48BBFF5A48BCFF5A48BCFF5B4BC6FF5B4CC8FF5B4E
      CEFF5B4FCEFF5A4FCCFF5A52D2FF432D7BCE0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000001010104010101070000
      00010000000000000000000000000000000000000000010101020202020D0303
      030F0202020D080808092F2F2F2F464646464747474731313131080808080101
      01020202020D0303030F0202020D010101020000000000000000000000000000
      0000000000000000000101010107010101040000000000000000000000FF0000
      0008000000C50000008600000034000000340000003400000034000000340000
      0034000000340000003400000034000000340000003400000034000000340000
      003400000073000000B800000002000000A4000000C30000000B000000000000
      000C000000FF00000000000000000000000008040919160A1A44876981E2B9A5
      B7F4997B91F595788FFE987B93FE66458CFE5545BEFF5545BDFF5445B8FF5445
      B7FF5C3F8CFF6E4F88FE5344C3FF5344C3FF5344C3FF5344C3FF573A9EFF7756
      82FE5243B7FF5244BBFF5244BCFF5344C2FF533FB2FF846582FE8B6C86FE997B
      94F5B19DAFF2866681E5160C1B460904091A0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000003020202080303
      030A010101020000000000000000000000000000000000000000070707085C5C
      5C67B3B3B3C0E3E5E5F9D1D0D1FFBCBBBDFFBABABBFFCFCFD0FFEDEDEEFABCBC
      BCBD5859595B060606100303030F0202020D0101010200000000000000000000
      0000000000000000000000000001000000030000000000000000000000FF0000
      0008000000EF0000001C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000050000000B80000000000000003000000AA000000BF000000090000
      000C000000FF0000000000000000000000000000000000000003998594D9F1F1
      F4FFC5B4C3FFDFDBDFFFE0DFE5FF6552B6FF5757F0FF5757F0FF5757EFFF5656
      E7FF5A49AFFF7967AEFF5858EFFF5858F0FF5858F0FF5858F0FF5949C1FF9582
      B4FF5855E7FF5757E7FF5757E6FF5757E7FF574FD7FFB8ABC4FFC2BAC7FFC5B6
      C5FFEDECF2FFA196A3D900000001000000030000000000000000000000310000
      00B9000000F5000000E5010101890000000E0101010400000001000000000000
      0000000000000000000000000000000000010101010400000005010101040000
      0001000000000000001A000000A3000000EF000000EE000000A10000001C0000
      0005010101040000000100000000000000000000000000000000010101070303
      030B0202020D010101020000000000000000000000004F4F4F4FDCDCDCDFB6B6
      B7FF5B5B5EFF2F2E32FE464648F5545150EA545151EA494748F32F2F32FE5C5B
      5EFFBDBCBDFFD3D3D3D73A3A3A440303030F0202020D01010102000000000000
      0000000000000000000000000000000000000000000000000000000000FF0000
      0008000000F00000001C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000050000000B8000000000000000000000004000000AF000000B30000
      000C000000FF0000000000000000000000000000000000000000998595D9F0F0
      F3FFBFAFBDFFDEDADEFFE0DFE5FF7C67AEFF6451B6FF6451B6FF6451B6FF6451
      B5FF6C549FFF9483B0FF6654B0FF6855B5FF6855B6FF6855B6FF694EA1FFAC9B
      BDFF6853B3FF6855B5FF6654B0FF6654AFFF654FA6FFC4B9CAFFC2BAC7FFC5B6
      C5FFEDECF2FF968194DF00000000000000000000000000000030000000EA3131
      31C9646464ED565656E0111111CD020202BB0303030C02020209000000010000
      00000000000000000000000000000000000000000001020202090303030A0202
      020900000013000000DE232323C8606060E8606060E8202020C8000000DC0101
      01170303030A0202020900000001000000000000000000000000000000010303
      030A0303030F0202020D010101020404040493939395D7D7D7FF4C4C4FFF4847
      48F3776140D99C5D0AFAA36409FFAE6E0EFFB9740EFFB8730FFFAA6612FD7960
      41E2444244F55B5B5EFFE1E1E2FB8080808B060606120202020D010101020000
      0000000000000000000000000000000000000000000000000000000000FF0000
      0008000000F00000001C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000002A000000EE00000099000000980000007000000021000000EC0000
      000C000000FF00000000000000000000000000000000000000009C8797D8F1F1
      F4FFBEAEBCFFD7D3D7FFDFDEE4FF8268A3FF624FB4FF624FB4FF624FB4FF624F
      B4FF725699FF9480A9FF604EADFF604EAEFF624FB3FF624FB4FF654796FFD8D4
      DCFFE0DFE5FFE0DFE5FFDFDEE4FFD8D7DDFFD6D6DBFFD8D7DDFFC1B9C6FFC5B6
      C5FFEDECF2FFA396A3D9000000000000000000000000000000B93C3C3CE85A5A
      5AFF121212FF272727FF737373FF090909E7030303560303030F0202020D0101
      01020000000000000000000000000000000000000000010101020202020D0303
      030F030303891F1F1FE0696969FF1A1A1AFF1B1B1BFF6A6A6AFF1C1C1CDF0000
      007E0202020D0303030B01010107000000000000000000000000000000000000
      00010202020D0303030F06060610ABABABAEB6B5B7FF343336FD796245D9B26D
      02FFC2790AFFDA8D14FFDC901BFFD98E1CFFDA8E1DFFE0911CFFE0911DFFDE90
      1EFFD4881DFF786651EC343337FEB6B6B7FFACACACB7090B0B160202020D0101
      0102000000000000000000000000000000000000000000000000000000FF0000
      0008000000F00000001C00000000000000000000005A00000086000000190000
      0000000000450000008800000088000000880000008800000088000000420000
      0000000000000000003D00000077000000780000005600000020000000EC0000
      000C000000FF00000000000000000000000000000000000000009C8797D8F7F7
      FAFFBFAFBDFFD5D2D6FFD8D7DDFF6451B5FF5555F0FF5555F0FF5555F0FF5555
      F0FF5B48B6FF7A67B3FF5454E7FF5454E6FF5454E7FF5555EFFF5747C2FFD8D3
      DCFFE0DFE5FFE0DFE5FFE0DFE5FFDFDEE4FFD8D7DDFFD6D6DBFFBBB4C0FFC4B5
      C4FFEDECF2FF937E92E00000000000000000000000F5000000FF5E5E5EFF1C1C
      1CFF646464FF212121FF4F4F4FFF191919F9000000FF0202027F0303030F0202
      020D0101010200000000000000000000000000000000000000000000003E0203
      03FF030303FF3B3B3BFF343434FF454545FF414141FF363636FF393939FE0000
      00FF000000FF0303034102020208000000030000000000000000000000000000
      0000010101020202020D88888895B2B2B3FF373639FC9B6D26E4C17805FFE08F
      10FFEA9815FFE99716FFE79517FFDE911AFFDB8F1CFFDC901CFFE2921BFFE192
      1CFFE0911CFFDF901DFFB47E38F839383BFCA9A9AAFFA2A2A2AD0303030F0202
      020D010101020000000000000000000000000000000000000000000000FF0000
      0008000000F00000001C00000000000000000000005E0000008B0000001A0000
      0000000000480000008C0000008C0000008C0000008C0000008C000000450000
      0000000000000000000000000000000000000000000000000020000000EC0000
      000C000000FF00000000000000000000000000000000000000009C8797D8F8F8
      FBFFC5B4C3FFD7D3D7FFD6D6DBFF725CA3FF624FB6FF624FB7FF624FB7FF624F
      B7FF684C9EFF8E79B1FF624FB6FF604EB1FF604EB0FF604EB1FF61449AFFD9D5
      DCFFE0DFE5FFE0DFE5FFE0DFE5FFE0DFE5FFDFDEE4FFD8D7DDFFBAB3BFFFBEB0
      BEFFECEBF1FF937E92E00000000000000000000000FF000000FF404040FF4444
      44FF121212FF0F0F0FFF686868FF0A0A0AFE000000FF000000BB020202510303
      0353020202510000004900000048000000480000004800000048000000870606
      06F6080808F9232323FF555555FF0E0E0EFF0E0E0EFF585858FF1F1F1FFF0606
      06F9050505F7010101850202024D000000170000000000000000000000000000
      00000000000043434345D6D6D6FF353438FE986F2BE4CB8105FFEC9810FFEF9A
      12FFEE9913FFEC9914FFEB9815FFE99616FFDF9219FFDD911BFFDD911BFFDC90
      1DFFDF921DFFE2921BFFE1921CFFBE8331F8343337FCC9C8C9FF6161616C0303
      030F0202020D0000000100000000000000000000000000000000000000FF0000
      0008000000F00000001C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000020000000EC0000
      000C000000FF00000000000000000000000000000000000000009C8797D8F8F8
      FBFFC6B5C4FFDEDADEFFD8D7DDFF8671A6FF6D59AAFF6F5AAFFF6F5AB0FF6F5A
      B0FF8369A2FFE0DFE5FFE0DFE5FFDFDEE4FFD8D7DDFFD6D6DBFFD8D7DDFFDFDE
      E4FFE0DFE5FFE0DFE5FFE0DFE5FFE0DFE5FFE0DFE5FFDFDEE4FFBBB4C0FFBDAF
      BDFFE4E3E9FF937E91E00000000000000000010101F9191919F7060606FF6464
      64FF6D6D6DFF737373FF383838FF000000FF161616FF000000FF090909D00C0D
      0DD20D0D0DD30C0D0DD2090909D0090909D0090909D0090909D0000000FF0303
      03FD3B3B3BFD030303FF515151FF6D6E6EFF707070FF505050FF000000FF3E3E
      3EFD020202FD000000FF000000FF010101850000000000000000000000000000
      000001010101D1D1D1D358575AFF77634BDDC98009FFE89610FFF29C0FFFF29C
      10FFF19B11FFEF9B12FFEE9A13FFED9914FFEB9715FFE19317FFDF9219FFBD8F
      45FFB59766FFD19332FFE4941AFFE3931BFF937144DB403F43FFE2E2E2EA0E0E
      0E180303030F0303030A00000001000000000000000000000000000000FF0000
      0008000000F00000001C000000000000000000000032000000520000000A0000
      0000000000250000005400000054000000540000005400000054000000540000
      0054000000540000002D00000000000000000000000000000020000000EC0000
      000C000000FF00000000000000000000000000000000000000009C8797D8F8F8
      FBFFC6B5C4FFDFDBDFFFDFDEE4FF5E4CB0FF5555E6FF5555E7FF5656EFFF5656
      F0FF5E4BB6FFE0DFE5FFE0DFE5FFE0DFE5FFDFDEE4FFD8D7DDFFD6D6DBFFD8D7
      DDFFDFDEE4FFE0DFE5FFE0DFE5FFE0DFE5FFE0DFE5FFE0DFE5FFC1B9C6FFBEB0
      BEFFE3E2E8FF907C8FE10000000100000000070707C5323232FF141414F00202
      02FF090909FF030303FF010101FE383838F01B1B1BFF181818FDA9A9A9FFA8A8
      A8FFA4A4A4FFA3A3A3FFA4A4A4FFA8A8A8FFA9A9A9FFA9A9A9FF5A5A5AFF0202
      02FE626262FF222222EC030303FF080909FF080808FF000000FF262626EB6262
      62FF010101FE5F5F5FFF636363FE020202B20000000000000000000000000000
      000049494949C9C9CAFF3E3E40F8D58706FFE5940CFFED9A0FFFED9A10FFF49D
      0EFFF49D0FFFF39D10FFF19C10FFF09B11FFEF9A12FFED9813FFE39516FFE192
      18FFBA924FFFCBB693FFD39431FFE69519FFE59419FF514D4DEFAEADAFFF6666
      66670202020D0303030B01010107000000000000000000000000000000FF0000
      0008000000F00000001C000000000000000000000084000000BB000000280000
      000000000066000000BC000000BC000000BC000000BC000000BC000000BC0000
      00BC000000BC0000007700000000000000000000000000000020000000EC0000
      000C000000FF00000000000000000000000000000000000000009C8797D8F8F8
      FBFFC6B5C4FFDFDBDFFFE0DFE5FF6B52A8FF6053C2FF6053C1FF6053C2FF6254
      C8FF674CA2FFE0DFE5FFE0DFE5FFE0DFE5FFE0DFE5FFDFDEE4FFD8D7DDFFD6D6
      DBFFD8D7DDFFDFDEE4FFE0DFE5FFE0DFE5FFE0DFE5FFE0DFE5FFC2BAC7FFC4B5
      C4FFE4E3E9FF907B8EE1010101070000000001010122080808F92E2E2EFF3838
      38F31E1E1EEC242525EB404040FD454545FF0D0D0DFF0B0B0BFE787878FF8D8D
      8DFF8D8E8EFF8A8A8AFF898A8AFF8A8A8AFF888888FF777777FF737373FF0000
      00FF0B0B0BFF2E2E2EFF383838F8191919EE1A1A1AEE3C3C3CF93F3F3FFF0909
      09FF000000FE747474FF535353FF080808CF0000000000000003000000010000
      0000A1A1A1A3727174FF7C684BDBE49106FFFBA109FFF19D0DFFEF9B0EFFEE9B
      0FFFF69E0DFFF69E0DFFF59E0EFFF39D0FFFF29C10FFF19B11FFEE9A12FFE596
      15FFDF9219FFC2A678FFC5A878FFE59518FFE89617FF8E7347DA5D5C5FFFB8B8
      B8B9010101020303030A02020208000000030000000000000000000000FF0000
      0008000000F00000001C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000020000000EC0000
      000C000000FF00000000000000000000000000000000000000039C8797D8F8F8
      FBFFC6B5C4FFDFDBDFFFE0DFE5FFD5D0D9FFCEC6D0FFC8C0CAFFC6BFC9FFC8C0
      CAFFD1CAD4FFE0DFE5FFE0DFE5FFE0DFE5FFE0DFE5FFE0DFE5FFDFDEE4FFD8D7
      DDFFD6D6DBFFD8D7DDFFDFDEE4FFE0DFE5FFE0DFE5FFE0DFE5FFC2BAC7FFC5B6
      C5FFECEBF1FF907C8FE102020208000000030000000005050527151515D20B0B
      0BF90B0B0BFC0A0B0BFC020303FF000000FF000000FF000000FF000000FF0C0C
      0CFD0F0F0FFC0F0F0FFC121212FC101010FC030303FF010101FF000000FF0000
      00FF000000FF000000FF000000FF000000FF030303FF040404FF030303FF0000
      00FF000000FF010101FF010101FF03040AC60000000001010104010101070000
      0001E2E2E2E4343337FFC6841AEFF59D06FFFFA407FFFDA208FFF39E0BFFF19C
      0CFFF09C0DFFF89F0BFFF8A00CFFF69F0DFFF59E0EFFF49D0FFFF39C10FFF09B
      11FFE79614FFBE934CFFEAE7E1FFC99540FFEB9815FFDB911DF62B2A2EFFECEC
      ECF1000000000000000101010107010101040000000000000000000000FF0000
      0008000000F00000001C00000000000000000000000F0000001E000000000000
      00000000000A0000002000000020000000200000002000000020000000200000
      002000000020000000200000000E000000000000000000000020000000EC0000
      000C000000FF0000000000000000000000000000000001010104998595D9F7F7
      FAFFC6B5C4FFDFDBDFFFE0DFE5FFE0DFE5FFE0DFE5FFDFDEE4FFD8D7DDFFD6D6
      DBFFD8D7DDFFDFDEE4FFE0DFE5FFE0DFE5FFE0DFE5FFE0DFE5FFE0DFE5FFDFDE
      E4FFD8D7DDFFD6D6DBFFD8D7DDFFDFDEE4FFE0DFE5FFE0DFE5FFC2BAC7FFC5B6
      C5FFEDECF2FF937E91E001010107010101040000000000000000000000000000
      0000010101020204042F060606FC6D6E6EFF000000FF626262FF040404FA0000
      003000000000000000000101010203040483030728C9021AD3FF000003FF0013
      90FF0022EEFF0022EEFF0022EEFF0022EEFF0022EDFF0224E5FF0324E4FF0224
      E5FF001FDBFF000F5EFF000F58FF000000FF0000000000000003020202080E0E
      0E15ECECECFF333235FCEA9506FFFEA307FFFFA407FFFFA407FFFEA307FFF59F
      0AFFF29D0CFFF29D0CFFFAA10AFFFAA10BFFF8A00CFFF79F0DFFF69E0DFFF59E
      0EFFF29C0FFFC99338FFEAE8E2FFC09E63FFED9913FFED9914FF363538FBE8E8
      E9FF131313130000000000000001000000030000000000000000000000FF0000
      0008000000F00000001C0000000000000000000000A7000000EF000000320000
      000000000082000000F0000000F0000000F0000000F0000000F0000000F00000
      00F0000000F0000000F0000000A2000000000000000000000020000000EC0000
      000C000000FF0000000000000000000000000000000000000003998594D9F1F1
      F4FFC5B4C3FFDFDBDFFFE0DFE5FFE0DFE5FFE0DFE5FFE0DFE5FFDFDEE4FFD8D7
      DDFFD6D6DBFFD8D7DDFFDFDEE4FFE0DFE5FFE0DFE5FFE0DFE5FFE0DFE5FFE0DF
      E5FFDFDEE4FFD8D7DDFFD6D6DBFFD8D7DDFFDFDEE4FFE0DFE5FFC2BAC7FFC5B6
      C5FFEDECF2FF937E92E000000001000000030000000000000000000000000000
      0000000000000000001C020303FF040404FF020303FF000000FF000000FF0000
      003100000000000000000000000000000078030725C9031BD2FF020307FF0012
      8CFF0022EEFF0022EEFF0022EEFF0022EEFF0022EEFF0022EDFF0224E5FF0324
      E4FF021DB7FF000000FF004769FF000000FF0000000000000000010101071F20
      2028D2D2D3FF444244F7F09A06FFFFA407FFFFA407FFFBA30AFFCA9D4DFFCCA1
      58FFC6984AFFC9953BFFD4962AFFEC9C13FFFBA209FFFAA10AFFF9A00BFFF8A0
      0CFFF69F0DFFCD973CFFEEEDE9FFC2A574FFE89714FFEF9A11FF3E3E40F8DEDE
      DEFF1E1E1E1E0000000000000000000000000000000000000000000000FF0000
      0008000000F00000001C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000020000000EC0000
      000C000000FF0000000000000000000000000000000000000000998595D9F0F0
      F3FFD5CDD5FFB6A2B3FFB9A6B7FFB9A6B7FFB9A6B7FFB9A6B7FFB9A6B7FFB8A5
      B6FFB3A1B1FFB2A0B0FFB3A1B1FFB8A5B6FFB9A6B7FFB9A6B7FFB9A6B7FFB9A6
      B7FFB9A6B7FFB8A5B6FFB3A1B1FFB2A0B0FFB3A1B1FFB8A5B6FFB09AADFFDDD5
      DEFFEDECF2FF937E92E000000000000000000000000000000000000000000000
      00000000000000000000010101020202020D0303030F0202020D010101020000
      00000000000000000000000000000000006E00041DC7021AD3FF03040BFF0214
      7CFF0022EDFF0022EEFF0022EEFF0022EEFF0022EEFF0022EEFF0022EDFF0224
      E5FF031DB6FF011322FF0093D9FF000000FF0000000000000000000000011D1E
      1E25D4D4D4FF3F3E40F8F59D06FFFFA407FFFFA407FFDE9A23FFEBE5DBFFFFFF
      FFFFFEFEFEFFF1F1EFFFE5E1DAFFC8B592FFEB9C16FFFDA308FFFCA209FFFBA1
      0AFFFAA10BFFC79F59FFFEFEFEFFC3A673FFE99911FFEA9812FF363438FCEAEA
      EAFF101010100000000000000000000000000000000000000000000000FF0000
      0008000000F00000001C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000020000000EC0000
      000C000000FF00000000000000000000000000000000000000009C8797D8F1F1
      F4FFE5E4E9FFCEC3CDFFD4C8D2FFD5CAD3FFD6CAD5FFE3DBE5FFF0EEF4FFD6CA
      D5FFD4C8D2FFCDC3CCFFCDC2CCFFDBD2DCFFEAE5ECFFD6CAD4FFD5C9D3FFD5CA
      D3FFD6CAD5FFEAE5ECFFEAE5ECFFCEC3CDFFCCC1CAFFCDC3CCFFD5C9D4FFEAE5
      ECFFEDECF2FF937E92E000000000000000000000000000000000000000000000
      0000000000000000000000000000010101020202020D0303030F0202020D0101
      010200000000000000000000000000000064000219CA0018DAFF02030EFF0312
      6EFF0224E5FF001ED9FF00000AFF00021BFF0022EEFF0022EEFF0022EEFF0022
      EDFF021EBDFF020202FF010101FF000000FF0000000000000000000000000505
      0506E6E5E6FC2F2E32FEEE9B09FFFEA307FFFFA407FFD89A2FFFF3EFE9FFFFFF
      FFFFFFFFFFFFFEFEFEFFF3F2F2FFBFA372FFEB9A11FFFEA307FFFFA407FFFEA3
      08FFE69D1FFFDAC9AAFFFFFFFFFFC8A261FFEE9A0FFFD89217F62F2E32FFE8E8
      E8ED000000000000000000000000000000000000000000000000000000FF0000
      0008000000F00000001C0000000000000000000000A3000000EA000000310000
      00000000007F000000EC000000EC000000EC000000EC000000EC000000EC0000
      00EC0000008D0000000000000000000000000000000000000020000000EC0000
      000C000000FF00000000000000000000000000000000000000009C8797D8F7F7
      FAFFD4CBD4FFAE9685FFBBA77DFFC1AB81FFBFA876FFAE9391FFDED5DFFFB59A
      89FFC2AC81FFC1AB81FFB8A373FFA68B8BFFB0989DFFCAB793FFC2AC81FFC2AC
      81FFBDA671FFB7A0A7FFB79FA3FFCBB893FFBBA77DFFBAA67CFFB7A16FFFB69F
      A6FFEDECF2FF937E92E000000000000000000000000000000003000000010000
      000000000000000000000000000000000000010101020202020D0303030F0202
      020D0101010200000000000000000000005A000113CE0018DBFF00010FFF0210
      62FF0324E4FF0224E5FF0020DCFF001FE0FF0022EEFF0022EEFF0022EEFF0022
      EEFF0022EDFF0121D7FF011DC6FF000000FF0000000000000000000000000000
      0000CCCECED0464649FFB3822FE7F59F0AFFFEA307FFD39A38FFF8F5F2FFFFFF
      FFFFFFFFFFFFFFFFFFFFC3A777FFE89A15FFF49E0BFFF59F0AFFFEA307FFE89E
      1DFFCAAE7CFFFFFFFFFFF2EEE8FFD39A36FFFAA00AFF907043DC606062FFACAC
      ACB7010101020000000000000000000000000000000000000000000000FF0000
      0008000000F00000001C00000000000000000000001200000023000000010000
      00000000000C0000002400000024000000240000002400000024000000240000
      00240000000E0000000000000000000000000000000000000020000000EC0000
      000C000000FF00000000000000000000000000000000000000009C8797D8F8F8
      FBFFDBD1DBFFC0AC91FFCCBE88FFCDBF88FFD1C080FFB39A95FFDED5DFFFC7B1
      95FFD5C68CFFD5C68CFFD1C080FFAC938FFFAF989CFFD8CD9EFFD4C58CFFD5C6
      8CFFD0BF79FFB8A2A8FFB79FA3FFE1D5A2FFD4C58CFFCDBF88FFC7B876FFB29D
      A3FFECEBF1FF937E92E000000000000000000000000001010104010101070000
      00010000000000000000000000000000000000000000010101020202020D0303
      030F0202020D01010102000000000000005000010ED20018DBFF000114FF000B
      59FF0224E5FF0324E4FF0224E5FF0020DCFF0019AFFF001281FF09124FFF0000
      00FF001CC4FF0022EDFF0120D7FF000000FF0000000000000000000000000000
      000082828284919092FF645B51E4F49E0BFFF59F0AFFCD9940FFFDFCFBFFFFFF
      FFFFFFFFFFFFFFFFFFFFF3EEE7FFC6A367FFC79641FFC7953DFFC29B57FFD8C5
      A6FFFFFFFFFFFFFFFFFFC7A770FFFBA209FFFEA308FF544F4EEEAAAAABFF5E60
      606B0202020D0000000100000000000000000000000000000000000000FF0000
      0008000000F00000001C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000020000000EC0000
      000C000000FF00000000000000000000000000000000000000009C8797D8F8F8
      FBFFDCD2DCFFC6B194FFCDBF88FFCCBE88FFCABB7CFFB29994FFDED5DFFFC7B1
      95FFD5C68CFFD5C68CFFD2C180FFB19692FFB0989DFFD6CB9DFFCDBF88FFD4C5
      8CFFD0BF79FFB8A2A8FFB79FA3FFE1D5A2FFD5C68CFFD4C58CFFC9B976FFB19C
      A2FFE4E3E9FF937E91E000000000000000000000000000000003020202080303
      030A010101020000000000000000000000000000000000000000010101020202
      020D0303030F0202020D010101020000004700000AD70018DBFF000219FF000A
      4EFF0022EDFF0221D2FF030303FF050506FF1F1D23FF544A44FF8B7966FF0000
      00FF0019AFFF0022EEFF001BC1FF000104F70000000000000000000000000000
      000020202020E6E6E6FB333236FED19322F6F49E0BFFC59645FFFEFEFEFFE8DE
      CCFFD6C19FFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAFFF1F1EFFFF4F4F4FFF5F5
      F5FFFEFEFEFFD2BA93FFE89E20FFFFA407FFB28231DF3C3B3EFFE5E5E5ED0E0E
      0E180303030F0303030A00000001000000000000000000000000000000FF0000
      0008000000F00000001C00000000000000000000007F000000B6000000270000
      000000000063000000B8000000B8000000B8000000B8000000B8000000B80000
      00B8000000B80000007300000000000000000000000000000020000000EC0000
      000C000000FF0000000000000000000000005E3F80EE90718EEFD0C2CCFBF7F7
      FAFFEAE5ECFFB29998FFB1988FFFAC968FFFAE9896FFC4B5BBFFEAE6ECFFB299
      99FFB29990FFB29A93FFB59D9BFFCABBC1FFD8CDD1FFAF9794FFAB948BFFAD96
      90FFB49D9CFFD8CDD3FFDACED4FFB59D97FFB29990FFB39A94FFB49D9CFFD0C6
      CCFFE4E3E8FFB4A7B6FC856884F3604184EB0000000000000000010101070303
      030B0202020D0101010200000000000000000000000000000000000000000101
      01020202020D0303030F0202020D0000003E000007DD0018DBFF00031FFF0008
      43FF0022EEFF001DCBFF020303FFDEC4A5FFE7CCABFFEFD2B0FFF0D3B1FF1F1D
      23FF0019AFFF0022EEFF001280FE000007B30000000000000000000000000000
      00000000000090909092A1A1A3FF4B4949F5F29D0FFFDE9A20FFBFA069FFD39A
      3AFFE69D21FFC9A973FFF3F0EAFFFFFFFFFFFFFFFFFFFEFEFEFFF5F5F5FFE7E4
      DEFFC0A26EFFE79D20FFFFA407FFEF9C0FF9403F41F8B7B7B8FF737373730101
      01020202020D0303030B01010107000000000000000000000000000000FF0000
      0008000000F00000001C000000000000000000000036000000570000000C0000
      0000000000280000005800000058000000580000005800000058000000580000
      0058000000580000003000000000000000000000000000000020000000EC0000
      000C000000FF0000000000000000000000005F4AA6FBC3B4CCFFF6F5F9FFF4F3
      F8FFF4F3F8FFF4F3F8FFF4F3F8FFF3F2F7FFEBEAEFFFE9E8EDFFEBEAEFFFF3F2
      F7FFF4F3F8FFF4F3F8FFF4F3F8FFF4F3F8FFF4F3F8FFF3F2F7FFEBEAEFFFE9E8
      EDFFEBEAEFFFF3F2F7FFF4F3F8FFF4F3F8FFF4F3F8FFF4F3F8FFF4F3F8FFF3F2
      F7FFEBEAEFFFEAE9EEFFA18EAEFF624BAEF90000000000000000000000010303
      030A0303030F0202020D01010102000000000000000000000000000000000000
      0000010101020202020D0303030F0203033E000003E30018DBFF000426FF0007
      3BFF0022EEFF001DCCFF0A0A0EFFE7CCABFFE5CAAAFFE7CCABFFEFD2B0FF1F1D
      23FF0019AFFF0022EEFF000524F3000000570000000000000003000000010000
      0000000000000A0A0A0AD3D3D3D56D6C6FFF686051EFF59F0AFFF49E0BFFF59F
      0AFFFEA307FFFBA30AFFD69B36FFCDA560FFCEAC73FFCEAC73FFCBA35EFFCE96
      36FFF09C0CFFF59F0AFFF79E09FE57514FEC777779FFC8C8C8CB040404040000
      0000010101020303030A02020208000000030000000000000000000000FF0000
      0008000000F00000001C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000020000000EC0000
      000C000000FF0000000000000000000000005F4AA8FBA891B1FFFDFDFDFFFBFB
      FDFFF6F5F9FFF4F3F8FFF4F3F8FFF4F3F8FFF3F2F7FFEBEAEFFFE9E8EDFFEBEA
      EFFFF3F2F7FFF4F3F8FFF4F3F8FFF4F3F8FFF4F3F8FFF4F3F8FFF3F2F7FFEBEA
      EFFFE9E8EDFFEBEAEFFFF3F2F7FFF4F3F8FFF4F3F8FFF4F3F8FFF4F3F8FFF2F1
      F7FFE5E3ECFFD3D2DCFF896E9DFF624BADF90000000000000000000000000000
      00010202020D0303030F0202020D010101020000000000000000000000000000
      000000000000010101020202020D04040436030306EB0018DAFF00052EFF0006
      31FF0022EEFF001DCCFF000000FF3A3436FF3A3537FF3A3537FF3A3537FF0000
      00FF00169BFF001ABAFF000006F0000000070000000001010104010101070000
      0001000000000000000023232323E4E4E4ED535255FF675F52E2F49E0BFFF49E
      0BFFF59F0AFFFEA307FFFFA407FFFFA407FFFFA407FFFFA407FFFFA407FFFEA3
      07FFF59F0AFFDD9316F5514E4CEF656467FFE0E0E0E61E1E1E1E000000000000
      0000000000000000000101010107010101040000000000000000000000FF0000
      0008000000F00000001C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000020000000EC0000
      000C000000FF000000000000000000000000553D6CBA604BA1FA7861AAFFB5A4
      C2FFFCFBFBFFFBFAFCFFF5F4F9FFF4F3F8FFF4F3F8FFF3F2F7FFEBEAEFFFE9E8
      EDFFEBEAEFFFF3F2F7FFF4F3F8FFF4F3F8FFF4F3F8FFF4F3F8FFF4F3F8FFF3F2
      F7FFEBEAEFFFE9E8EDFFEBEAEFFFF3F2F7FFF4F3F8FFF3F2F6FFE7E5EDFFD6D4
      DFFF9D89B5FF705AADFF61499FF9533B6AB80000000000000000000000000000
      0000010101020202020D0303030F0202020D0101010200000000000000000000
      00000000000000000000010101020203032C030304F3021AD3FF000535FF0005
      28FE0022EEFF0021EAFF0016A0FF00169CFF00169BFF021897FF031997FF0218
      98FF0020E0FF000526F40000006A000000000000000000000003020202080303
      030A0101010200000000000000003A3A3A3AE5E5E5F25D5C5FFF4C4C4BF1BC85
      2BE5F49E0BFFF59F0AFFFEA307FFFFA407FFFFA407FFFFA407FFFFA407FFFEA3
      08FF8F7345D937373AFC838385FFD5D5D5E42929292A00000000000000000000
      0000000000000000000000000001000000030000000000000000000000FF0000
      0008000000F00000001C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000020000000EC0000
      000C000000FF00000000000000000000000000000000070306144D3962AE614C
      9DF47159ABFFA48FBAFFF5F1F4FFFAFAFCFFF5F4F9FFF4F3F8FFF3F2F7FFEBEA
      EFFFE9E8EDFFEBEAEFFFF3F2F7FFF4F3F8FFF4F3F8FFF4F3F8FFF4F3F8FFF4F3
      F8FFF3F2F7FFEBEAEFFFE9E8EDFFEAE9EEFFE6E5ECFFD1CCD9FF927CB0FF6A52
      ACFF624B9FF34B3560A705020411000000030000000000000000000000000000
      00000000000000000001020202090303030A0202020900000001000000000000
      000000000000000000000000000000000017010101FB021AD5FF01083EFF0003
      21FE0022EEFF0022EEFF0022EEFF0022EEFF0022EEFF0022EDFF0123E8FF0222
      E2FF010D4FF7000008C200000002000000000000000000000000010101070303
      030B0202020D0101010200000000000000002F2F2F2FDADADADDA2A2A4FF3736
      39FF504F4DF07F6A49DCA77C33DFC48928E5BC872BE2967440D9696052E03836
      39FB58575AFFCECECFFFB0B0B0BB191A1A250202020D01010102000000000000
      0000000000000000000000000000000000000000000000000000000000FF0000
      0008000000F00000001C0000000000000000000000000000003B000000640000
      0064000000640000006400000064000000640000006400000064000000640000
      0064000000640000003900000000000000000000000000000020000000EC0000
      000C000000FF0000000000000000000000000000000000000000010101070404
      041242305198634A98ED6951ACFF9781B5FFE7E1E9FFFAF9FCFFF5F4F8FFF3F2
      F7FFEBEAEFFFE9E8EDFFEBEAEFFFF3F2F7FFF4F3F8FFF4F3F8FFF4F3F8FFF4F3
      F8FFF4F3F8FFF2F0F6FFDFDFE5FFBEB6C8FF8671A9FF644DABFF644B99EB3E2B
      4D8C010101060000000000000000000000000000000000000000000000000000
      0000000000000000000000000001010101040000000501010104000000010000
      00000000000000000000000000000000000A000000FE0016B7FB000843FF0002
      0EFE001DD1FF0020DEFF0020DFFF0020E1FF0020DEFF001DCEFF001594FF0005
      1DF3000209BE0101011000000001000000000000000000000000000000010303
      030A0303030F0202020D0101010200000000000000000B0B0B0B81818183E8E8
      E8F0B5B5B6FF777679FF545356FF464649FF4C4B4EFF666568FF959597FFDBDB
      DCFFCDCDCDCF53535353010101020202020D0303030F0202020D010101020000
      0000000000000000000000000000000000000000000000000000000000FF0000
      0008000000F000000066000000540000005100000005000000BC000000C50000
      00AC000000AC000000AC000000AC000000AC000000AC000000AC000000AC0000
      00AC000000C7000000B800000007000000510000005400000069000000EC0000
      000C000000FF0000000000000000000000000000000000000000000000010303
      030A0303030F0302030F35233E76634C94E3634CA8FE8C75B2FFD4C8D9FFF9F9
      FBFFF4F3F7FFEBEAEFFFE9E8EDFFEBEAEFFFF3F2F7FFF4F3F8FFF4F3F8FFF3F2
      F7FFE9E7EEFFB9ADC5FF846EAFFF5F49A3FE5F4B8AE231223874000000030000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000007E000001F8000000FF0000
      00FF000000FE000001FD000000FE000000FE000000FF000000FF00020BC10000
      0052000000010000000000000000000000000000000000000000000000000000
      00010202020D0303030F0202020D010101020000000000000000000000000909
      09095454545491919193B1B1B1BDBEBEBECBBBBCBCC7AAAAAAAB787878783030
      3030000000000000000000000000010101020202020D0303030F0202020D0101
      0102000000000000000000000000000000000000000000000000000000F60000
      001A000000A1000000BC000000BC000000B90000001B000000BC0000004C0000
      0000000000000000000000000003000000370000000200000000000000000000
      000000000050000000B80000001F000000BA000000BC000000BC0000009E0000
      001F000000F60000000000000000000000000000000000000000000000000000
      00010202020D0303030F0202020D0101010224182B54614988D75F4AABFD826B
      B2FFC0B0C9FFF7F5F9FFEBEAEFFFE9E8EDFFEBEAEFFFF2F1F6FFE8E6EEFFAB9B
      BBFF7C66AFFF5E49ABFD5D4684D31F13254A0202020D0303030F0202020D0101
      0102000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000010303030A0303030B0303030A0000000100000000000000000000
      00000000000000000000000000010303030A0303030B0303030A000000010000
      000000000000000000000000000000000000000000010303030A0303030B0303
      030A0000000100000000000000000000000000000000000000000000009B0000
      00BA0000003900000030000000300000002E00000002000000BC0000006E0000
      0030000000300000000B00000074000000FF0000006F0000000C000000300000
      003000000071000000B8000000020000002E0000003000000030000000390000
      00BD0000009A0000000000000000000000000000000000000000000000000000
      0000000000010303030A0303030B0303030A0000000100000000160F18345B44
      7CCA6149ADFC7660B1FFAD9BBEFFEBE9EEFFDDDBE3FF9C89B1FF735EAFFF614B
      A8FB574176C4120C132C0000000000000000000000010303030A0303030B0303
      030A000000010000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000101010107020202080101010700000001000000000000
      0000000000000000000000000000000000010101010702020208010101070000
      0001000000000000000000000000000000000000000000000001010101070202
      0208010101070000000100000000000000000000000000000000000000090000
      0091000000DB000000E0000000E0000000DE0000002100000096000000E00000
      00E0000000EE0000008C00000042000000D40000003F00000091000000ED0000
      00E0000000E00000009200000025000000DF000000E0000000E0000000DC0000
      0090000000080000000000000000000000000000000000000000000000000000
      0000000000000000000101010107020202080101010700000001000000000000
      00000B070B1C533E6DB8604EA9F86E58B3FF6B56ADFF614AA2F64D3967B20703
      0716000000000000000000000000000000000000000000000001010101070202
      0208010101070000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000030101010400000003000000000000
      0000000000000000000000000000000000000000000000000003010101040000
      0003000000000000000000000000000000000000000000000000000000000000
      0003010101040000000300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000028000000F00000005C000000170000005F000000F0000000240000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000030101010400000003000000000000
      000000000000000000000401030D49365DA1443254950301030B010101040000
      0003000000000000000000000000000000000000000000000000000000000000
      0003010101040000000300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000044000000D2000000FC000000D100000041000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF050606FF060709FF020203FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000020202FF060606FF0C0C0CFF0C0C0CFF060606FF020202FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000101FF0F1111FF11161CFF0E1014FF070809FF000000FF0000
      00FF000000FF000000FF020303FF707D75FF999C7EFF644B1EFF1A1208FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000F0F0FFF2828
      28FF363636FF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF3F3F3FFF3636
      36FF272727FF0F0F0FFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF0E100FFF353C3BFF222220FF524326FF85682AFF816023FF050300FF0000
      00FF000000FF000000FF3B4846FF5F6C5BFFD1B64EFFD9B940FF6E5E3BFF0606
      06FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005C2F14FFB85F29FFB85F29FF793F1BFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FF00070EFF00060DFF00060DFF00060DFF00060DFF00060EFF0007
      0DFF00060FFF0F0B04FF4D2700FF6D4000FF905D0CFF9F6911FF9A6611FF7047
      00FF3D2500FF00000000000D0DFF000404FF000000FF000000FF000000FF0002
      02FF000C0CFF000D0DFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000FF151515FF3C3C3CFF4B4B4BFF4C4C
      4CFF686868FF878787FF949494FF9D9D9DFF9C9C9CFF929292FF848484FF6666
      66FF4C4C4CFF4B4B4BFF3C3C3CFF151515FF000000FF00000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0809
      08FF232724FF514932FFBDA34BFFDEBA3AFFBB9021FF79561AFF2E2823FF070A
      0CFF0B0C0CFF424A47FF617269FFB5A554FFE1C239FFC0B570FF6F766AFF1F21
      1DFF0C0B08FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000783E1AFFF07D36FFF07D36FF9F5223FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000024C67FF0389D9FF0380CDFF0382D1FF0383D2FF0384D3FF0385D4FF0389
      D7FF0087E4FF7CA76DFFFFDC25FFFFCD2AFFFFB014FFFB990BFFF98608FFFF83
      17FFF37813FF0000000011A8B2FF23DDE6FF25D9DCFF25DADDFF29DCDEFF2CE2
      E4FF28ECF4FF095E66FF00000000000000000000000000000000000000000000
      00000000000000000000060606FF353535FF525252FF6B6B6BFF9D9D9DFFAEAE
      AEFF9C9C9DFF717183FF59597CFF4C4C7AFF4A4A79FF51517AFF666680FF8F8F
      94FFA8A8A8FF999999FF6B6B6BFF525252FF363636FF060606FF000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0506
      07FF3C372CFFB7922FFFCFAB2CFF886419FF413420FF1C1E20FF1A1E1DFF2022
      1CFF12171BFF121519FF6E5E3AFFDAB944FFB4A655FF4C5A51FF383626FF342F
      1BFF302B19FF14110AFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000030100FF00000000000000000000
      00000000000000000000783E1AFFF07D36FFF07D36FF9F5223FF000000000000
      0000000000000000000000000000010000FF000000FF00000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      00FF0395D9FF02A5E5FF02A2E1FF02A2E1FF02A1E0FF02A1E0FF02A1E0FF02A1
      E0FF00A0EFFF7BA864FFFFCC05FFF6B60DFFF2A40AFFF19007FFED7C02FFEE6D
      00FFE45E00FF00000000009AABFF01D6EFFF09E1F4FF0FEDFBFF16F6FFFF1AFC
      FFFF0BF4FFFF005762FF00000000000000000000000000000000000000000000
      0000000000000D0D0DFF454545FF616161FFA2A2A2FFA2A2A3FF5E5E88FF2929
      88FF08088CFF00008EFF00008CFF00008BFF00008AFF00008BFF00008DFF0303
      8DFF171783FF454580FF8E8E94FF999999FF626262FF454545FF0D0D0DFF0000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0202
      03FF291F17FF906B22FF6B5323FF21201CFF21221DFF2C2919FF332E1AFF3430
      1DFF1B1E1AFF171B1EFF4B3519FF917D4BFF525C4FFF36392DFF37321CFF3833
      1DFF37321CFF141108FF00000000000000000000000000000000000000000000
      0000000000000000000000000000683617FFC4662CFF0F0702FF000000000000
      0000231107FF7C401BFFCC6A2DFFF07D36FFF07D36FFDA7131FF8C481FFF3A1E
      0CFF000000FF00000000030100FFAC5926FF8F4A1FFF000000FF000000000000
      000000000000000000000000000000000000000000FF024C80FF00519DFF0158
      A8FF16C5F2FF15BEEBFF15BEEAFF15BEEAFF15BEEAFF15BEEAFF15BEEAFF15BE
      EAFF07BEFBFF82B46AFFFFCB07FFF6B710FFF2A50CFFF19008FFED7D03FFEF6E
      00FFE35E00FF0069B4FF00B0CAFF04D3EAFF0CDFF1FF12EAF7FF18F2FAFF1BF6
      FAFF0EEFFBFF009AC1FF024579FF000000FF0000000000000000000000000000
      00000C0C0CFF4C4C4CFF777777FFACACACFF62628EFF16169AFF00009EFF0000
      99FF000096FF000093FF000091FF000090FF000090FF000090FF000092FF0000
      94FF000097FF00009CFF070799FF404085FF989899FF777777FF4C4C4CFF0C0C
      0CFF0000000000000000000000000000000000000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF1A1C
      1BFF1F2022FF201813FF474941FF3B3B2DFF36301BFF38321BFF38331CFF3733
      1EFF21221CFF121A20FF13171CFF14181CFF23231AFF37311CFF3A341DFF3A36
      1FFF332F1DFF0C0A06FF000000FF000000000000000000000000000000000000
      00000000000000000000683617FFEF7C35FFF07D36FFC5662CFF341A0BFFAB58
      26FFEF7C35FFF07D36FFF07D36FFF07D36FFF07D36FFF07D36FFF07D36FFF07D
      36FFC7672CFF42220EFFAC5926FFF07D36FFF07D36FF8F4A1FFF000000FF0000
      000000000000000000000000000000000000000000FF16B6DEFF1DD0F9FF1BCE
      F3FF16BFEAFF16BFEAFF16BFEAFF16BFEAFF16BFEAFF16BFEAFF16BFEAFF16BF
      EAFF07C0FAFF84B46BFFFFCB07FFF6B710FFF2A50CFFF19008FFED7D03FFEF6D
      00FFE45D00FF03C8FFFF03B9D0FF03D2EBFF0CE0F2FF12E9F7FF18F3FAFF1BF8
      FAFF0DEBF7FF06C1DBFF19B7E0FF000000FF0000000000000000000000000404
      04FF484848FF838383FFA0A0A4FF34349AFF0000ABFF0000A6FF0000A1FF0000
      A1FF0000A7FF0000AFFF0000B6FF0000B9FF0000B9FF0000B7FF0000B1FF0000
      AAFF0000A2FF0000A0FF0000A3FF0000A8FF17179AFF818192FF808080FF4949
      49FF040404FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000FF000000FF000000FF000000FF151716FF6B76
      6EFF65695BFF261F18FF2E261BFF3C361EFF3B341DFF3B351CFF3B351EFF3834
      1EFF312E1BFF292719FF2D2A1AFF342F1BFF37321DFF38341EFF3A361EFF5444
      1FFF886828FF6E511BFF080501FF000000000000000000000000000000000000
      0000000000000000000088461EFFF07D36FFF07D36FFF07D36FFF07D36FFF07D
      36FFF07D36FFEF7C35FFE27633FFD56F30FFD46E2FFFDE7432FFEE7C35FFF07D
      36FFF07D36FFF07D36FFF07D36FFF07D36FFF07D36FFA85725FF010000FF0000
      000000000000000000000000000000000000000000FF07A1D4FF07B1E9FF07AE
      E5FF08AEE5FF08AEE5FF08AEE5FF08AEE5FF08AEE5FF08AEE5FF08AEE5FF08AE
      E5FF00ADF5FF7DAD67FFFFCB07FFF6B710FFF2A50CFFF19008FFED7D03FFEF6D
      00FFE55E00FF00A7F2FF00B6D1FF04D4EDFF0CDFF3FF12ECF7FF18F3FAFF1BF7
      FAFF0DEDF8FF01B9D5FF079ED6FF000000FF0000000000000000000000003434
      34FF777777FFA2A2A8FF2424A1FF0000B1FF0000ADFF0000AEFF0000BAFF0106
      C7FF0511CFFF0719D5FF091DD5FF091ED5FF091ED5FF091ED6FF081BD6FF0614
      D2FF0209CAFF0000C0FF0000B1FF0000ABFF0000AFFF0B0BA6FF7D7D95FF7777
      77FF353535FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000272A28FF76827AFF9599
      85FFAB9055FF876B3BFF332B1CFF3F381EFF3D361DFF3C351DFF3B341CFF3933
      1CFF3A341DFF3B361EFF3C371EFF3D371EFF3C371FFF3A361EFF39341EFF7355
      1CFFA37B25FF735724FF242725FF050605FF0000000000000000000000000000
      000000000000000000000000000089471EFFF07D36FFF07D36FFF07D36FFEF7C
      35FFD16D2FFFA85725FF9B5123FF9B5123FF9B5123FF9B5123FFA25424FFC667
      2CFFED7B35FFF07D36FFF07D36FFF07D36FFA85725FF030100FF000000000000
      000000000000000000000000000000000000000000FF0085C5FF0191D7FF018F
      D4FF018FD4FF018FD4FF018FD4FF018FD4FF018FD3FF018FD3FF018ED3FF018E
      D3FF008BE2FF799F60FFFFCD08FFF6B710FFF2A50CFFF19008FFED7D03FFEF6E
      00FFE45D00FF0083DEFF01B3D2FF04D7F0FF0CE3F3FF12EDF7FF18F4FAFF1BF8
      FAFF0EEFF9FF00B0CFFF0080C6FF000000FF0000000000000000111111FF6565
      65FFB0B0B1FF2F2FA0FF0000B2FF0000B3FF0000BCFF0207CDFF0717D4FF091D
      D8FF091FDEFF0A23E3FF0B25E6FF0B27E7FF0B28E8FF0B27E7FF0B25E4FF0A22
      E1FF091FDBFF081BD6FF030CD2FF0000C4FF0000B6FF0000B2FF0E0EA6FF9191
      9CFF686868FF111111FF00000000000000000000000000000000000000000000
      00FF0E1111FF0E1213FF0D1010FF101212FF363D3AFF66736BFF858773FF9278
      47FFA78541FFB7AF8BFF3F4034FF3D361EFF3C351DFF3C351DFF3C341CFF2B26
      13FF19170BFF0C0B05FF050402FF0A0804FF4A401FFF473F1FFF3B361DFF5444
      1DFF382F1FFF1D1E1CFF29291CFF19160DFF0000000000000000000000000000
      0000000000000000000000000000120903FFE87934FFF07D36FFEE7C35FFB860
      29FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B51
      23FFAB5926FFE77834FFF07D36FFF07D36FF42220EFF00000000000000000000
      000000000000000000000000000000000000000000FF0067A0FF0065A4FF0064
      A2FF0064A3FF0064A4FF0065A4FF0066A3FF0067A5FF0068A6FF006AA5FF006C
      A7FF0068B2FF7D954BFFFFD303FFFFBD08FFFFAA02FFFF9500FFFF8100FFFF6F
      00FFEE5F00FF005CABFF00B2D1FF04DCF2FF0CE5F3FF12EFF7FF18F5FAFF1BF8
      FAFF0EF2FAFF00A5C1FF005F9BFF000000FF00000000000000003E3E3EFFA4A4
      A4FF6161A0FF0000B1FF0000B4FF0000C5FF0510D3FF081CD8FF091FE1FF0B24
      E7FF0C29ECFF0D2DEFFF0E2FF1FF0E31F2FF0E31F2FF0E30F1FF0D2FF0FF0D2C
      EDFF0C28EAFF0A23E4FF091EDCFF0616D7FF0001CFFF0000B9FF0000B2FF2B2B
      9FFF999999FF3E3E3EFF00000000000000000000000000000000000000002832
      30FF465854FF3F3C30FF272118FF242727FF3F4D46FF7C805EFF9B7A3FFF896C
      37FF99977CFF6D766DFF343120FF3C351DFF3D361CFF231F10FF050402FF0000
      0000000000000000000000000000080603FF433723FF4D4423FF484023FF4F44
      24FF3B351DFF39341DFF3A361FFF1A170DFF0000000000000000000000000000
      0000000000000000000000000000904A20FFF07D36FFF07D36FFBC622AFF9B51
      23FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B51
      23FF9B5123FFAB5926FFED7B35FFF07D36FFC5662CFF000000FF000000000000
      000000000000000000000000000000000000000000FF0A79BDFF147ACEFF1378
      CCFF1378CFFF137AD0FF137BD1FF1380D3FF1582D4FF1588D7FF168BD8FF188F
      D9FF0E93E5FF7BB186FFB6A92FFF7D8343FF65704AFF576551FF546051FF7360
      3FFFA16B2DFF0788E8FF04C5EDFF03E7F9FF0CF0FDFF12F8FFFF18FEFFFF1EFF
      FFFF0EF7FFFF0EAFE0FF0A73BBFF000000FF00000000020202FF6A6A6AFFB4B4
      B8FF0E0EACFF0000B3FF0000C4FF0613D4FF081CDCFF0A21E6FF0B27ECFF0D2D
      F0FF0D30F3FF0E32F5FF0E34F6FF0E35F7FF0E35F7FF0E34F7FF0E33F6FF0E32
      F4FF0D2FF2FF0C2BEEFF0B25E9FF091FE1FF0719D9FF0002D0FF0000B7FF0000
      B1FF7B7BA5FF6B6B6BFF020202FF0000000000000000000000000D0E0DFF232F
      2FFF908D5FFFB8942CFF835E1DFF201D1AFF201E1AFF7B5B24FF907437FF898B
      74FF5D655FFF343222FF3D361DFF373119FF0E0C06FF00000000000000000000
      000000000000000000000000000018140AFF463A1FFF443B20FF675936FF4E43
      23FF3D371EFF3D381FFF3C3820FF0C0A05FF0000000000000000000000000000
      00000000000000000000080401FFE87934FFF07D36FFDB7231FF9B5123FF9B51
      23FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B51
      23FF9B5123FF9B5123FFC7682CFFF07D36FFF07D36FF391D0CFF000000000000
      000000000000000000000000000000000000000000FF28BADFFF2DD2FAFF2CCF
      F5FF2CCFF5FF2CCEF5FF2CCEF5FF2CCEF5FF2CCEF5FF2CCEF4FF2CCDF4FF2BCD
      F4FF2CD3F9FF1580C3FF1E64CAFF2774D6FF2B73D8FF2668D7FF1E5AD5FF1552
      D2FF0949BEFF2DD3F5FF0B9C85FF039781FF059C91FF059E92FF059D8CFF0196
      80FF019371FF17AA9CFF2ABEE8FF000000FF00000000181818FF9B9B9BFF7171
      AEFF0000B2FF0000BDFF040FD4FF081BDCFF0A20E7FF0B27EDFF0C2CF2FF0D2F
      F5FF0E32F7FF1032F4FF3750F0FF5A6DF1FF5A6DF1FF364FF0FF1033F4FF0E33
      F7FF0D31F6FF0D2EF3FF0C2AEFFF0B24EAFF091EE2FF0716D9FF0000C9FF0000
      B3FF2E2EA9FF969696FF191919FF0000000000000000000000FF50564CFF665A
      35FFCEAB34FFD1BC4DFF837751FF171717FF131110FF434032FF5D7162FF4A52
      4CFF34301FFF3F371EFF2C2714FF030301FF0000000000000000000000000000
      0000000000000000000000000000463E28FF564119FF503D22FF675639FF453C
      1EFF3E391FFF3C371EFF17150BFF000000000000000000000000000000000000
      00000000000000000000492510FFF07D36FFF07D36FFB65F29FF9B5123FF9B51
      23FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B51
      23FF9B5123FF9B5123FFA35524FFEF7C35FFF07D36FF89471EFF000000000000
      000000000000000000000000000000000000000000FF1DB1DBFF24C6F3FF24C3
      EFFF24C3EFFF24C3EFFF24C3EFFF24C3EFFF24C3EFFF24C3EFFF24C3EFFF24C3
      EFFF23C6F0FF29ADDDFF34B3F9FF2898F1FF1A79EBFF115DE4FF0941DDFF0228
      DBFF0016CDFF26C9F0FF11BF79FF1FDB94FF22DEAAFF27E3BDFF2DEDD0FF35F6
      E4FF28EFBEFF0AB688FF1FB1E5FF000000FF000000002A2A2AFFB5B5B5FF3939
      AEFF0000B5FF0105CDFF081ADAFF091DE5FF0B24EDFF0C2AF1FF0C2DF5FF0D2E
      F5FF6272EFFFDBDCF8FFFEFEFEFFFFFFFFFFFFFFFFFFFEFEFEFFDADBF8FF6070
      EFFF0C2FF5FF0D2FF6FF0C2CF3FF0B28EFFF0A22E9FF081CDFFF030CD7FF0000
      BCFF0303B0FF9999A4FF2C2C2CFF0000000000000000050505FF3F402FFFB794
      35FFBF9621FF686C4DFF515E59FF2B2A1FFF2B2719FF242216FF2A271AFF3B35
      1FFF40391EFF211D0FFF000000FF000000000000000000000000000000000000
      0000000000000000000022201AFF8E7A51FFA6823DFF674819FF594D2DFF403A
      1EFF2C2816FF050502FF00000000000000000000000000000000000000006032
      15FFA05323FFA05323FFC7672CFFF07D36FFEF7C35FF9F5324FF9B5123FF9B51
      23FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B51
      23FF9B5123FF9B5123FF9B5123FFE07532FFF07D36FFD97130FFA05323FFA053
      23FF793F1BFF000000000000000000000000000000FF18ACD9FF1DC2F1FF1DBF
      EDFF1DBFEDFF1DBFEDFF1DBFEDFF1DBFEDFF1DBFEDFF1DBFEDFF1DBFEDFF1DBF
      EDFF1BC1EEFF25A6DAFF34ACF3FF2994EDFF1D79E8FF145FE2FF0C44DBFF052C
      D8FF011BCBFF20C3EEFF00B56FFF02CF86FF0ADCA8FF10E7C5FF17F1DCFF1AF6
      E9FF0BE2AEFF06B186FF1AACE4FF000000FF00000000353535FFC1C1C1FF1D1D
      B0FF0000BCFF0511D7FF081AE1FF0920EAFF0A26F0FF0B2AF4FF0B2BF5FF8F98
      F1FFFEFEFEFFD8D8F5FF717AEAFF3F4FE9FF4151E9FF7780EBFFDFDFF7FFFEFE
      FEFF8B94F0FF0B2CF6FF0C2CF5FF0B28F2FF0A24EDFF091DE6FF0718DCFF0000
      C9FF0000B2FF8181AEFF373737FF0000000000000000000000FF63553AFFCAA6
      42FF9D8847FF252A27FF44412EFF453E26FF423B22FF413A21FF413A21FF423A
      1FFF18150AFF0000000000000000000000000000000000000000000000000000
      000000000000000000FF4D483AFFB8A466FFAE822EFF5E4618FF4D4324FF332E
      19FF010100FF000000000000000000000000000000000000000000000000904B
      20FFF07D36FFF07D36FFF07D36FFF07D36FFEA7A34FF9B5123FF9B5123FF9B51
      23FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B51
      23FF9B5123FF9B5123FF9B5123FFD66F30FFF07D36FFF07D36FFF07D36FFF07D
      36FFB65E28FF0000000000000000000000000000000012A7D6FF15BCEFFF14B9
      EBFF14B9EBFF14B9EBFF14B9EBFF14B9EBFF14B9EBFF14B9EBFF14B9EBFF14B9
      EBFF12BBECFF22A5D9FF35ADF3FF2994EDFF1D79E8FF145FE2FF0C44DBFF052D
      D8FF001BCBFF18BDECFF01B570FF05CF86FF0DDCA8FF13E7C4FF19F0DAFF1CF5
      E8FF0EE3AFFF03B086FF14A7DFFF000000FF00000000373737FFC2C2C2FF0D0D
      B1FF0000C3FF0617DBFF081AE6FF0920EDFF0A25F2FF0A28F5FF5362EEFFFEFE
      FEFFB3B5F1FF142CEEFF0C2CF8FF0C2BF7FF0C2BF7FF0C2CF8FF172EEDFFBFC1
      F3FFFEFEFEFF4F60EFFF0A29F6FF0A27F3FF0A23EFFF091EEAFF0719E0FF0106
      D2FF0000B6FF6C6CAFFF373738FF0000000000000000000000000F0A03FF5A41
      17FF4D4C37FF413E2DFF4E482EFF4A4228FF463F24FF453E23FF443C21FF1513
      09FF000000000000000000000000000000000000000000000000000000000000
      000000000000171A17FF665F41FFC49D43FFB28631FF877552FF473F21FF0F0E
      07FF00000000000000000000000000000000000000000000000000000000904B
      20FFF07D36FFF07D36FFF07D36FFF07D36FFEC7B35FF9B5123FF9B5123FF9B51
      23FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B51
      23FF9B5123FF9B5123FF9B5123FFD87030FFF07D36FFF07D36FFF07D36FFF07D
      36FFB65E28FF000000000000000000000000000000000BA2D4FF0FB5EDFF0EB2
      E9FF0EB2E9FF0EB2E9FF0EB2E9FF0EB2E9FF0EB2E9FF0EB2E9FF0EB2E9FF0EB2
      E9FF0BB3EAFF1FA2D8FF35ADF4FF2994EDFF1D79E8FF145FE2FF0C44DBFF052D
      D8FF021CCBFF0EB6EAFF00B56FFF05CF86FF0DDCA8FF13E7C4FF19F0DAFF1CF5
      E8FF0EE3AFFF02AD85FF0CA1DEFF00000000000000002E2E2EFFC1C1C1FF0808
      B3FF0004C9FF0717DFFF071AE8FF081FEFFF0923F2FF0925F4FFBBBEF3FFF2F2
      FBFF1A2EECFF0B28F8FF0B24F0FFCACBF4FFACAFEEFF0B27F6FF0B28F8FF2335
      EBFFF9F9FDFFB7BAF3FF0925F5FF0925F4FF0922F0FF081EECFF0719E4FF030B
      D8FF0000BAFF6868B0FF2C2C2FFF000000000000000000000000000000001919
      15FF3D3C32FF5B543AFF534B30FF4D4529FF4A4126FF483F24FF262211FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00001C2120FF363F38FF9D7C34FFBD932FFF6C5323FF605739FF3A351CFF0606
      04FF000000000000000000000000000000000000000000000000000000004624
      0FFF753D1AFF753D1AFFAE5A26FFF07D36FFF07D36FFA45625FF9B5123FF9B51
      23FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B51
      23FF9B5123FF9B5123FF9B5123FFE67733FFF07D36FFCA692DFF753D1AFF753D
      1AFF592E13FF000000000000000000000000000000000899D1FF0BAAE9FF0AA7
      E5FF0AA7E5FF0AA7E5FF0AA8E5FF0AA8E5FF0AA8E5FF0AA8E6FF0BA8E6FF0BA8
      E6FF07A9E6FF1F9ED6FF35AEF4FF2994EDFF1D79E8FF145FE2FF0C44DBFF052D
      D8FF021CCAFF0BABE4FF01B470FF05D086FF0DDCA8FF13E7C4FF19F0DAFF1CF5
      E8FF0EE4AFFF01AA84FF0999DBFF00000000000000001C1C1CFFB7B7B7FF0F0F
      B5FF0105CCFF0616E1FF0719E9FF081DEFFF0820F2FF081FF0FFE7E7F9FFB8BA
      F2FF0B26F6FF0B26F7FF0A21F0FFF3F3FCFFCECFF4FF0B26F6FF0B26F7FF0B25
      F5FFC9C9F3FFE4E4F8FF0820F1FF0822F3FF081FF0FF071CECFF0718E5FF030C
      DAFF0000BCFF6A6AAAFF1A1A1DFF000000000000000000000000000000000606
      06FF625F51FF675E41FF5C5235FF52492DFF4C4429FF453C22FF060502FF0000
      0000000000000000000000000000000000000000000000000000000000002A2E
      2BFF939B8BFFAF9D60FFB88D2BFF937D44FF484129FF453D1FFF3E391FFF2321
      14FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000371C0BFFF07D36FFF07D36FFBF632BFF9B5123FF9B51
      23FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B51
      23FF9B5123FF9B5123FFAB5926FFF07D36FFF07D36FF773E1AFF000000000000
      00000000000000000000000000000000000000000000079BD1FF09ADE8FF09A9
      E4FF07A7E5FF07A6E3FF07A5E3FF07A3E3FF07A2E3FF07A1E2FF069FE2FF069E
      E2FF039DE3FF1C99D2FF36AEF4FF2994EDFF1D79E8FF155EE2FF0D43DCFF052D
      D8FF011BCAFF069FE0FF00B36EFF05D087FF0DDCA8FF13E7C4FF19F0DAFF1CF5
      E8FF0FE4B0FF00A882FF058ED8FF0000000000000000030303FF939394FF2A2A
      B6FF0004CAFF0715E1FF0C1CEAFF0F23EFFF1227F2FF1126F0FFDFDFF7FFBBBD
      F3FF152CF6FF152CF6FF1227F0FFEEEEFAFFC8C9F3FF152CF6FF152CF6FF152C
      F6FFCBCBF3FFDBDCF6FF1227F1FF1228F3FF1125F0FF0E20ECFF0919E6FF030A
      D9FF0000BAFF65658DFF020203FF000000000000000000000000020303FF3237
      35FF2A2922FF272A2AFF37362FFF5F563AFF4D4428FF292513FF000000000000
      00000000000000000000000000000000000000000000000000FF313633FF868B
      7BFFCCB877FFD5B149FFA99E62FF3A4035FF433B1EFF443D1FFF423C1FFF1E1B
      0EFF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010000FFDB7231FFF07D36FFE57733FF9E5223FF9B51
      23FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B51
      23FF9B5123FF9B5123FFD56F30FFF07D36FFEF7C35FF211106FF000000000000
      000000000000000000000000000000000000000000000597CEFF07ABE9FF07A8
      E5FF07A8E5FF07A8E5FF07A8E5FF07A8E5FF07A8E5FF07A8E5FF07A8E5FF07A8
      E5FF03A9E4FF1FA6E0FF3AAEF4FF2D90EBFF2172E4FF1558DFFF0C3CD7FF051E
      D3FF0314CFFF05A1E7FF00B76EFF05D382FF0DDEA5FF13E9C4FF19F3DAFF1DF9
      E8FF0FE8ACFF00AC85FF0385D2FF000000000000000000000000515152FF5B5B
      BCFF0000C3FF1724E2FF1E2CEBFF1F30EFFF1F31F2FF1F32F3FFA7A9EFFFF3F3
      FCFF2B3BEFFF2135F6FF1D30F0FFE8E9F9FFC2C4F3FF2135F6FF2135F6FF3341
      EDFFFAFAFDFFA3A6EFFF1F33F4FF1F32F3FF1F31F0FF1F2EEDFF1D2BE7FF0206
      D3FF0808B6FF404052FF0000000000000000000000FF212523FF5F6B67FF6169
      62FF4D4835FF1C1C1AFF141515FF5F5639FF4D4426FF0F0D06FF000000000000
      0000000000000000000000000000000000000A0C0BFF424D4AFF909681FFCCB0
      68FFD3AD44FFD7C380FF848B78FF454128FF463E20FF463F20FF2C2714FF0000
      00FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006D3817FFF07D36FFF07D36FFD06C2FFF9B51
      23FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B51
      23FF9B5123FFBD622AFFF07D36FFF07D36FFA65625FF00000000000000000000
      000000000000000000000000000000000000000000000393CCFF04A5E7FF04A3
      E3FF04A3E3FF04A3E3FF04A3E3FF04A3E3FF04A3E3FF04A3E3FF04A3E3FF04A3
      E3FF03A3E3FF09A5E5FF08A1E2FF00A2E1FF01A9E4FF02ACE4FF03B0E5FF04AC
      E2FF0593E0FF05A6EAFF03AFB3FF04BDA2FF0ACEB2FF0FD9C5FF14DDD8FF14DA
      E1FF09C3C2FF03A9CBFF038DCEFF000000000000000000000000151517FF8383
      A7FF0000BBFF141DDFFF2B36EBFF2B39EFFF2B3AF1FF2B3BF3FF4952E9FFF9F9
      FDFFB1B4F3FF2D3DF2FF2B3BF3FF666CEAFF5D63E9FF2D3EF6FF2F3EF1FFBCBF
      F4FFF8F8FDFF4650E9FF2B3CF4FF2B3BF2FF2B3AF0FF2B38EDFF1F2BE6FF0000
      C8FF2B2BA1FF0D0D17FF00000000000000001F2320FF454E48FF747456FFB39C
      4EFFA5802BFF5F4C2DFF373529FF5B5234FF41391FFF000000FF000000000000
      00000000000000000000030304FF191D1DFF424A44FFB1B28DFFC2A24DFFC9A4
      3FFFC5B076FF808675FF4E492FFF3B351AFF312B15FF231F0FFF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000A0401FFE57733FFF07D36FFF07D36FFD16C
      2FFF9E5223FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B5123FF9B51
      23FFC1642BFFEF7C35FFF07D36FFEF7C35FF31190AFF00000000000000000000
      000000000000000000000000000000000000000000000394CCFF05A6E8FF05A4
      E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4
      E4FF05A4E4FF04A3E3FF03A4E4FF04A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4
      E4FF05A6E4FF05A4E4FF05A2E9FF05A0EBFF049EE9FF039CE7FF029CE4FF029C
      E4FF049FE7FF05A5EBFF0393CBFF000000000000000000000000000000004444
      4DFF2D2CB8FF0307CFFF323DE9FF3742EEFF3743F1FF3744F2FF3644F2FF797D
      E7FFFDFDFEFFC8C9F5FF656DEFFF3E48EEFF3F49EEFF6A71EFFFCFD1F6FFFCFC
      FEFF777AE7FF3644F3FF3745F3FF3744F1FF3743F0FF3742ECFF0E15DDFF0000
      BCFF1F1F4FFF0000000000000000000000001F1F1CFFA9995EFFE5C84FFFC7A1
      27FF8A6B2AFF484536FF59533EFF5A5031FF312C18FF070706FF050607FF0809
      0AFF0B0E10FF101619FF1F2426FF504834FFB59B58FFC8A03BFFB28F39FF8E8B
      65FF5F6358FF474125FF231F0FFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000030100FFAC5926FFF07D36FFF07D36FFF07D36FFF07D
      36FFE67833FFC1642BFFA65725FF9B5123FF9B5123FFA25524FFB96029FFDE74
      32FFF07D36FFF07D36FFF07D36FFF07D36FFC5662CFF0F0702FF000000000000
      000000000000000000000000000000000000000000000394CCFF05A6E8FF05A4
      E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4
      E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4
      E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4
      E4FF05A4E4FF05A6E8FF0393CBFF000000000000000000000000000000000505
      07FF56567BFF0202BCFF181FDFFF434CEDFF434DF0FF434EF2FF434EF3FF404B
      F1FF696DE7FFDCDCF6FFFFFFFFFFFBFBFEFFFBFBFEFFFFFFFFFFDBDBF6FF686B
      E7FF414BF2FF434FF3FF434EF2FF434EF1FF434DEFFF2932E7FF0000C8FF1515
      84FF010107FF000000000000000000000000120E09FF8E681DFFA58122FF4D3D
      1BFF181511FF434030FF655C3DFF5B5030FF36311EFF0E0E10FF13161AFF2024
      26FF2D2923FF524225FF856527FFAF862BFFA47A26FF866D3AFF9AA18DFF4346
      39FF463D1DFF19160AFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A55524FFF07D36FFF07D36FFF07D36FFE37633FFF07D
      36FFF07D36FFF07D36FFF07D36FFEE7C35FFED7B35FFF07D36FFF07D36FFF07D
      36FFF07D36FFE77834FFF07D36FFF07D36FFF07D36FFC4662CFF030100FF0000
      000000000000000000000000000000000000000000000393CCFF05A6E8FF05A4
      E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4
      E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4
      E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4
      E4FF05A4E4FF05A6E8FF0393CBFF000000000000000000000000000000000000
      00000B0B14FF39398AFF0001C3FF282FE5FF5057EFFF5158F1FF5158F3FF5158
      F3FF5159F4FF474DEBFF6265E7FF8284EAFF8284EAFF6265E7FF474DECFF5159
      F4FF5159F3FF5158F3FF5158F2FF5158F0FF3B42EBFF0305D0FF08089DFF0202
      18FF00000000000000000000000000000000000000FF2B2418FF70796BFF3B3D
      34FF5C553DFF635A3BFF605635FF5C512FFF4B4123FF181C1CFF111417FF3429
      1DFF644720FF815C20FF7B5A20FF56421EFF333128FF4C4F49FF443E26FF4C42
      1EFF272210FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000043230EFFE97934FFF07D36FFA85725FF090401FF6C38
      18FFD97130FFF07D36FFF07D36FFF07D36FFF07D36FFF07D36FFF07D36FFE678
      33FF8A471EFF100803FF89471EFFF07D36FFEF7C35FF653416FF000000000000
      000000000000000000000000000000000000000000000391C9FF05A6E8FF05A4
      E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4
      E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4
      E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4
      E4FF05A4E4FF05A6E8FF038FC6FF000000000000000000000000000000000000
      000000000000080816FF1D1C80FF0202C4FF282DE5FF595EF0FF5D62F2FF5D63
      F3FF5D63F3FF5D63F4FF5D63F4FF5D63F4FF5D63F4FF5D63F4FF5D63F4FF5D63
      F4FF5D63F3FF5D63F3FF5D62F2FF3B40EBFF0406D0FF0000A2FF01011DFF0000
      00000000000000000000000000000000000000000000030303FF3F3F37FF8075
      57FF726747FF665B39FF625633FF655630FF584B28FF3F381EFF191914FF1712
      11FF2D2922FF292823FF1E2121FF25261FFF3E3720FF4E421EFF50441EFF4D43
      1FFF1A170BFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000043230EFFA25424FF030100FF000000000000
      0000010000FF381C0BFFAE5A26FFF07D36FFF07D36FFC4662CFF49260FFF0703
      00FF00000000000000000000000088461EFF653416FF00000000000000000000
      000000000000000000000000000000000000000000000492CCFF05A5E5FF05A4
      E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4
      E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4
      E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4
      E4FF05A4E4FF05A5E5FF0390C9FF000000000000000000000000000000000000
      0000000000000000000002020CFF101063FF0303BDFF181ADAFF474BEEFF696C
      F2FF6B6EF3FF6B6EF3FF6B6EF4FF6B6EF4FF6B6EF4FF6B6EF4FF6B6EF4FF6B6E
      F3FF6B6EF3FF5559F0FF2528E2FF0202C7FF00008EFF000015FF000000000000
      0000000000000000000000000000000000000000000000000000302D25FF8679
      57FF746845FF675B36FF795E29FFB18531FF7C622EFF574A26FF504421FF443A
      1CFF40371CFF453A1CFF4D411CFF453B19FF54461FFF53451EFF50441EFF2A25
      11FF000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000783E1AFFF07D36FFF07D36FF9F5223FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000049CD6FF05A4E4FF05A4
      E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4
      E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4
      E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4E4FF05A4
      E4FF05A4E4FF05A4E4FF0498D3FF000000000000000000000000000000000000
      0000000000000000000000000000000000FF03032EFF02028FFF0909C5FF1B1D
      DBFF4042EBFF5052F0FF6466F2FF6F71F3FF7072F3FF686AF2FF5759F1FF494B
      EDFF2426E0FF0909CBFF0000B0FF000056FF000002FF00000000000000000000
      0000000000000000000000000000000000000000000000000000090806FF5751
      3EFF443C25FF18140BFF9F7E3AFFCCA63BFF746C48FF60522BFF574A23FF5648
      21FF4E411CFF26200DFF080702FF000000FF362E16FF3A3114FF110E05FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000783E1AFFF07D36FFF07D36FF9F5223FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000499D7FF03A3E5FF03A3
      E4FF03A3E4FF03A3E4FF03A3E4FF03A3E4FF03A3E4FF03A3E4FF03A3E4FF03A3
      E4FF03A3E4FF03A3E4FF03A3E4FF03A3E4FF03A3E4FF03A3E4FF03A3E4FF03A3
      E4FF03A3E4FF03A3E4FF03A3E4FF03A3E4FF03A3E4FF03A3E4FF03A3E4FF03A3
      E4FF03A3E4FF03A3E5FF0497D4FF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000031FF0000
      79FF0000AEFF0F0FC2FF1112CCFF1212D2FF1212D2FF1112CEFF0F0FC5FF0000
      B9FF000094FF000052FF00000CFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF110A01FF58441DFF535039FF5D5028FF584922FF4E42
      1DFF0C0A04FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000046240FFF8E491FFF8E491FFF5D3014FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000002D44FF013D5DFF013C
      5BFF013C5BFF013C5BFF013C5BFF013C5BFF013C5BFF013C5BFF013C5BFF013C
      5BFF013C5BFF013C5BFF013C5BFF013C5BFF013C5BFF013C5BFF013C5BFF013C
      5BFF013C5BFF013C5BFF013C5BFF013C5BFF013C5BFF013C5BFF013C5BFF013C
      5BFF013C5BFF013D5DFF002C43FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000003FF000022FF00003FFF000050FF000055FF000049FF000030FF0000
      0EFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010100FF3E3A33FF675931FF5D4E24FF54451DFF1512
      07FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000010100FF18150BFF171308FF040300FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FF010102FF010202FF010202FF010202FF0102
      02FF010202FF010202FF010202FF010303FF010303FF010203FF010203FF0103
      03FF010203FF010202FF010101FF020202FF000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FF1123
      19FF234834FF2F6044FF356C4DFF366E4FFF33694BFF2D5E43FF254D36FF1A37
      26FF0D1D14FF000201FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000B191BFF3D9FACFF3DA0AEFF3DA2B0FF3DA3B0FF3CA3
      B2FF3BA4B4FF37A3B4FF33A2B5FF2DA0B5FF249EB4FF1998B4FF0D94B4FF0695
      B5FF0A8BA6FF0F7285FF145964FF174148FF111515FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000070E0AFF2E5E44FF4FA173FF55AC
      7CFF52A677FF4EA072FF4B996DFF479268FF438B62FF3F835DFF3B7A57FF3773
      51FF346C4CFF1E2C1CFF3A2915FF3A2B15FF030200FF00000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0101
      01FF080B0AFF080B0AFF080B0AFF080B0AFF080B0AFF080B0AFF080B0AFF080A
      09FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      000000000000000000000F2325FF52EBFFFF52EBFFFF52EAFFFF52EAFEFF51EA
      FEFF50E9FEFF4EE8FEFF4BE7FDFF45E4FCFF3CE0FBFF30DAF9FF1FD2F7FF0BC8
      F5FF00C6F5FF00CEF8FF00D5FBFF00DAFDFF102C31FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000030303FF070707FF0B0B0BFF100F
      10FF141314FF181718FF181718FF181718FF181718FF181718FF141314FF100F
      10FF0B0B0BFF070707FF030303FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000051A375FF5BB785FF58B281FF55AC
      7CFF52A677FF4EA072FF4B996DFF479268FF438B62FF3F835DFF3B7A57FF3773
      51FF346C4CFF67693BFFA6783FFFA77E3CFF8B642AFF2F210CFF000000000000
      000000000000000000000000000000000000000000FF9BADA9FFBBCEC9FFC1D3
      CEFFC7D6D2FFCCDAD6FFD1DDDAFFD5E0DDFFD9E3E0FFDCE5E3FFDFE7E5FFD0DE
      DAFFA8C3BCFFA8C3BCFFA8C3BCFFA8C3BCFFA8C3BCFFA8C3BCFFA8C3BCFFA6C3
      BBFFCEDCD9FFD2DEDBFFCDDBD7FFC7D7D3FFC2D3CFFFBBCFCAFFB4CAC5FFADC5
      BFFFA5C0B9FF9DBAB3FF7E9A93FF000000FF0000000000000000000000000000
      000000000000000000000F2225FF53EBFFFF53EBFFFF53EBFFFF53EBFFFF53EB
      FFFF52EBFFFF52EAFEFF51EAFEFF4FE9FEFF4AE6FDFF42E3FCFF36DDFAFF25D5
      F8FF0FCAF5FF00C6F4FF00CEF8FF00D5FBFF0F373EFF00000000000000000000
      000000000000000000000000000000000000000000FF030707FF080808FF0308
      08FF151615FF1C1A1AFF292829FF363536FF3E3D3EFF474647FF4B4A4BFF4F4E
      4FFF585758FF585758FF585758FF585758FF585758FF585758FF585758FF5453
      54FF4B4A4BFF474647FF3E3D3EFF363536FF2D2C2DFF1C1C1CFF0E0E0EFF0E10
      0EFF030803FF080808FF070707FF000000000000000000000000000000000000
      000000000000050F10FF3E9298FF368689FF5AB584FF5BB785FF58B281FF55AC
      7CFF52A677FF4EA072FF4B996DFF479268FF438B62FF3F835DFF3B7A57FF3773
      51FF346C4CFF6A703EFFAF8444FFA77E3CFF9B702FFF8C6024FF33210BFF0000
      000000000000000000000000000000000000010101FFB3C9C3FFB9CFC9FFBED3
      CDFFC3D6D1FFC8D9D5FFCCDCD8FFD0DFDBFFD3E1DDFFD6E3E0FFD8E5E2FFC8DA
      D6FFC6D9D4FFC6D9D4FFC6D9D4FFC6D9D4FFC6D9D4FFC6D9D4FFC6D9D4FFBFD4
      CFFFC7D9D4FFCDDDD9FFC9DAD6FFC4D7D2FFBFD4CEFFBAD0CAFFB3CCC5FFADC7
      C1FFA6C3BBFF9FBDB6FF94B3ABFF000101FF0000000000000000000000000000
      000000000000000000000F2225FF53EBFFFF53EBFFFF53EBFFFF53EBFFFF53EB
      FFFF53EBFFFF53EBFFFF53EBFFFF52EAFEFF50E9FEFF4DE8FDFF45E4FDFF39DE
      FBFF27D6F8FF0FCAF5FF00C6F4FF00CEF8FF0D414BFF00000000000000000000
      000000000000000000000000000000000000040604FF0F0F0FFF0F0F0FFF0F0F
      0FFF070B07FF3B3835FF3A393AFF3F3E38FF423D3AFF3A393AFF3C3B3CFF3C37
      34FF3C3B34FF363936FF363936FF363936FF363936FF363936FF363936FF3437
      34FF343734FF3C3734FF3A3532FF383738FF3D3C3DFF3E3D3EFF353535FF0F0F
      0FFF0F0F0FFF0F0F0FFF0F0F0FFF030303FF0000000000000000000000000000
      0000010607FF32818DFF51BDBFFF4EB7B1FF5DBB88FF5BB785FF58B281FF55AC
      7CFF52A677FF4EA072FF4B996DFF479268FF438B62FF3F835DFF3B7A57FF3773
      51FF346C4CFF6C7641FFB88F49FFA77E3CFF9B702FFF8E6125FF7D521BFF0805
      00FF000000FF000000000000000000000000010202FFB2C9C3FFB9CFCAFFBED3
      CEFFC3D6D1FFC8D9D5FFCCDCD8FFD0DFDBFFD3E1DDFFD6E3E0FFD9E5E2FFC7DA
      D6FFDDE7E5FFDDE7E5FFDDE7E5FFDDE7E5FFDDE7E5FFDDE7E5FFDDE7E5FFD2E1
      DDFFC5D9D4FFCDDDD9FFC9DAD6FFC4D7D2FFBFD3CEFFBAD0CAFFB3CCC5FFADC7
      C0FFA6C3BBFF9FBDB5FF95B4ACFF010101FF0000000000000000000000000000
      0000000000000000000010282BFF53EBFFFF53EBFFFF53EBFFFF53EBFFFF53EB
      FFFF53EBFFFF53EBFFFF53EBFFFF53EBFFFF52EAFFFF51EAFEFF4EE8FEFF46E5
      FDFF3ADEFBFF26D5F8FF0DC9F5FF00C7F5FF0B4D5AFF00000000000000000000
      000000000000000000000000000000000000060806FF0F130FFF282320FF2823
      28FF201B30FF171338FF0F0B38FF070738FF070738FF070749FF070759FF070B
      62FF070B6AFF0F0B72FF0F0B7AFF0F0B7AFF07077AFF07077AFF07077AFF0703
      72FF07036AFF07036AFF070359FF070341FF0F0F41FF302F62FF515072FF514C
      62FF413B49FF383338FF0F130FFF050605FF0000000000000000000000000000
      0000163C45FF3C9BA7FF52BEBDFF50B6A6FF5DBB88FF5BB785FF58B281FF55AC
      7CFF52A677FF4EA072FF4B996DFF479268FF438B62FF3F835DFF3B7A57FF3773
      51FF346C4CFF6D7B44FFC09A4EFFA77E3CFF9B702FFF8E6125FF81541CFF2E1C
      07FF000000FF000000FF0000000000000000010101FFB4CAC4FFBED3CEFFC5D7
      D2FFCADBD7FFD0DFDBFFD5E2DEFFD9E5E2FFDDE7E5FFE0EAE7FFE3ECE9FFCFE0
      DCFFECF2F0FFECF2F0FFECF2F0FFECF2F0FFECF2F0FFECF2F0FFECF2F0FFDFEA
      E8FFCDDEDAFFD6E3E0FFD1E0DCFFCCDCD8FFC6D8D3FFBFD4CEFFB8CFC9FFB1CA
      C4FFA9C5BDFFA1BFB7FF94B3ABFF000101FF0000000000000000000000000000
      0000000000000000000010282BFF53EBFFFF53EBFFFF53EBFFFF53EBFFFF53EB
      FFFF53EBFFFF53EBFFFF53EBFFFF53EBFFFF53EBFFFF52EBFFFF52EAFEFF4EE8
      FEFF46E5FDFF38DEFBFF22D4F8FF08C7F4FF0B4E5DFF00000000000000000000
      000000000000000000000000000000000000060806FF0F1317FF0F0B51FF0000
      7AFF000084FF00007AFF000072FF07037AFF0F0F94FF171362FF171351FF1713
      49FF171341FF0F1338FF0F1330FF0F0F28FF0F0F28FF0F0F30FF0F0F30FF0F0F
      38FF0F0B41FF0F0B49FF070759FF070094FF00009CFF00009CFF00009CFF0703
      9CFF070794FF201F72FF171717FF050705FF0000000000000000000000000000
      00001E535DFF3E9FABFF54C0BEFF51B7A4FF5DBB88FF5BB785FF58B281FF55AC
      7CFF52A677FF4EA072FF4B996DFF479268FF438B62FF3F835DFF3B7A57FF3773
      51FF346C4CFF6E8047FFC7A553FFA77E3CFF9B702FFF8E6125FF81541CFF4A2E
      0DFF000000FF000000FF000000FF00000000020202FFD9E3E0FFDEE9E6FFDEE9
      E6FFDFE9E6FFDFE9E6FFDFE9E6FFDFE9E7FFDFE9E7FFDFE9E7FFDFE9E7FFC9DC
      D8FFEAF1EFFFEAF1EFFFEAF1EFFFEAF1EFFFEAF1EFFFEAF1EFFFEAF1EFFFDDE9
      E6FFD0E1DCFFDFE9E6FFDFE9E6FFDFE9E6FFDEE9E6FFDEE9E6FFDEE8E6FFDEE8
      E5FFDDE8E5FFDDE8E5FFD1DDDAFF020202FF0000000000000000000000000000
      000000000000000000000F272BFF53EBFFFF53EBFFFF53EBFFFF53EBFFFF53EB
      FFFF53EBFFFF53EBFFFF53EBFFFF53EBFFFF53EBFFFF53EBFFFF53EBFFFF52EA
      FEFF4EE8FDFF44E4FCFF34DCFAFF1BD0F7FF0E4E5EFF00000000000000000000
      00000000000000000000000000000000000007090BFF07077AFF070384FF0F0F
      6AFF0F0B49FF070759FF000072FF0F0B8CFF0F0F0FFF0F0F0FFF0F0F0FFF0F13
      0FFF0F130FFF0F130FFF0F130FFF0F130FFF0F130FFF0F0F0FFF0F0F0FFF0F13
      0FFF0F130FFF0F0F0FFF0F0F0FFF0F0F20FF07009CFF0703BDFF0F0B7AFF1717
      6AFF201B8CFF1713BDFF171784FF050709FF0000000000000000000000000000
      0000235E6AFF40A3AFFF55C2BFFF52B7A3FF5DBB88FF5BB785FF58B281FF55AC
      7CFF52A677FF4EA072FF4B996DFF479268FF438B62FF3F835DFF3B7A57FF3773
      51FF346C4CFF738B51FFCDC070FFBAA157FFA77E39FF8E6125FF81541CFF5937
      10FF000000FF000000FF000000FF00000000000000FFD5DBD9FF99C3B9FF66A9
      9AFFACCCC5FF6AAB9CFF4D9B8AFF509C8BFF539D8DFF559F8EFF59A090FF5BA0
      91FFD9E5E2FFDCE7E4FFDCE7E4FFDCE7E4FFDCE7E4FFDCE7E4FFDCE7E4FFC7DB
      D6FF72A99CFF79ADA1FF7CAEA2FF80AFA4FF83B0A5FF86B2A7FF9ABDB4FFBFD4
      CEFF9DBEB6FFB8CFC9FFD5DBD9FF000000FF0000000000000000000000000000
      000000000000000000000F272AFF52EAFFFF52EAFFFF52EAFFFF53EBFFFF53EB
      FFFF53EBFFFF53EBFFFF53EBFFFF53EBFFFF53EBFFFF53EBFFFF53EBFFFF52EB
      FFFF51EAFEFF4CE7FDFF40E2FCFF2CD8F9FF165360FF000000FF000000000000
      000000000000000000000000000000000000070918FF0727C6FF0F0F6AFF7A6C
      6AFF514C49FF070372FF070384FF07077AFF070372FF07037AFF000384FF0000
      8CFF000094FF00009CFF00009CFF0000A5FF0000A5FF0700A5FF0703A5FF0703
      A5FF0703A5FF07039CFF070794FF07078CFF07039CFF0703C6FF0F0BA5FF5954
      51FF72686AFF171FA5FF1740D6FF060915FF0000000000000000000000000000
      0000276A76FF42A7B2FF55C2BEFF53B8A2FF5DBB88FF5BB785FF58B281FF55AC
      7CFF52A677FF4EA072FF4B996DFF479268FF438B62FF3F835DFF3B7A57FF3773
      51FF346C4CFF618156FFAFA56AFFAEA368FFB0A567FFAB914FFF885B22FF673F
      11FF000000FF000000FF000000FF000000FF000000FFB7BAB9FFADCEC7FF60A7
      97FF519E8EFF157E67FF198069FF1D826BFF21846DFF25856FFF2A8771FF3089
      75FFDFEAE8FFEAF0EFFFEAF0EFFFEAF0EFFFEAF0EFFFEAF0EFFFEAF0EFFFC5DB
      D6FF539788FF57998AFF5C9B8CFF609D8EFF649E91FF68A093FF6DA295FF93B8
      AFFF9EBFB7FFC5D8D3FFB7BAB9FF000000FF0000000000000000000000000000
      000000000000000000000E2629FF4CE8FEFF4DE8FEFF4EE8FEFF50E9FEFF52EA
      FEFF52EBFFFF53EBFFFF53EBFFFF53EBFFFF53EBFFFF53EBFFFF53EBFFFF53EB
      FFFF52EAFFFF50E9FEFF48E6FDFF39DEFBFF2DB7D1FF1E6876FF0B1B1FFF0002
      02FF00000000000000000000000000000000070B32FF0F3BCEFF07039CFF2823
      84FF07037AFF000084FF070394FF00009CFF0000A5FF0000A5FF0000ADFF0000
      ADFF0000B5FF0000B5FF0703B5FF0703B5FF0703BDFF0703BDFF0703BDFF0703
      C6FF0703C6FF0703C6FF0707C6FF0707C6FF0707C6FF0F0BC6FF0F0FCEFF1713
      C6FF302BB5FF201BD6FF2044DEFF090A2BFF0000000000000000000000000000
      00002C7684FF43ABB5FF57C4BFFF53B8A1FF5DBB88FF5BB785FF58B281FF55AC
      7CFF52A677FF4EA072FF4B996DFF479268FF438B62FF3F835DFF3B7A57FF3773
      51FF346C4CFF5B7A54FFA89F6BFFA69B69FFA39766FFA09363FFA89253FF7D52
      19FF000000FF000000FF000000FF000000FF000000FF949595FF7DB7AAFF0F7B
      63FF127D65FF167E67FF1A8169FF1E836CFF22846EFF278670FF2B8872FF338B
      77FFE1EDEAFFF7F9F8FFF7F9F8FFF7F9F8FFF7F9F8FFF7F9F8FFF7F9F8FFCCE1
      DCFF5A9B8CFF599A8BFF5D9C8DFF619D8FFF659F91FF6AA094FF6EA296FF72A4
      98FF76A59AFFB2CBC5FF949595FF000000FF0000000000000000000000000000
      000000000000000000000D2528FF45E4FDFF46E4FDFF47E5FDFF49E6FDFF4CE8
      FEFF50E9FEFF52EAFFFF53EBFFFF53EBFFFF53EBFFFF53EBFFFF53EBFFFF53EB
      FFFF53EBFFFF52EAFEFF4EE8FEFF42E3FCFF3AC9E1FF37DDFAFF1BCFF5FF0B84
      A1FF0C2E35FF020506FF000000000000000002024AFF0703C6FF0703B5FF0000
      94FF00008CFF070394FF0F07ADFF0F0BB5FF0F0BBDFF0F0FC6FF0F0FC6FF1713
      CEFF1713CEFF1713CEFF1717D6FF1717D6FF1717D6FF1717D6FF1717D6FF1717
      D6FF1713D6FF1713D6FF1713CEFF0F0FCEFF0F0FCEFF0F0FCEFF1713D6FF1717
      D6FF201BDEFF201FDEFF201FDEFF0B0942FF0000000000000000000000000000
      0000318492FF45AEB9FF57C4BDFF54B9A0FF5DBB88FF5BB785FF58B281FF55AC
      7CFF52A677FF4EA072FF4B996DFF479268FF438B62FF3F835DFF3B7A57FF3773
      51FF346C4CFF547553FF9C9169FF988D66FF958863FF918360FF9C8856FFA47D
      33FF000000FF000000FF000000FF000000FF000000FF6D6D6DFFA3CBC2FF107B
      63FF137D66FF178068FF1B816AFF1F836CFF23856EFF288670FF2C8873FF569F
      8FFFE0EEEBFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFD6E8
      E4FF7BAFA3FF5A9A8BFF5E9C8EFF629E90FF669F92FF6BA194FF6FA396FF73A4
      98FF77A69BFFC7D9D4FF6D6D6DFF000000FF0000000000000000000000000000
      000000000000000000000C2428FF42E1FCFF42E1FCFF43E2FCFF44E3FCFF46E5
      FDFF4AE6FDFF4EE9FEFF52EAFEFF53EBFFFF53EBFFFF53EBFFFF53EBFFFF53EB
      FFFF53EBFFFF52EBFFFF50E9FEFF49E6FDFF42CDE3FF44E4FCFF2FD9F9FF0FCA
      F5FF00C9F6FF0B8CA3FF132124FF070808FF02005AFF0703C6FF1713CEFF1717
      CEFF201BD6FF201BDEFF201BDEFF201BC6FF201FA5FF201F9CFF201F94FF201F
      8CFF201B8CFF201B84FF201784FF201784FF201784FF17177AFF201784FF2017
      84FF201B84FF201B8CFF201B94FF201B9CFF2017B5FF1717D6FF1717D6FF2017
      D6FF281FDEFF2827E7FF201BDEFF0C0958FF0000000000000000000000000104
      05FF358C9BFF47B2BCFF57C4BDFF54B99FFF5DBB88FF5BB886FF67C398FF69C5
      9EFF66C49EFF64C39DFF62C19CFF61B99FFF63BCA4FF5FB89FFF5AAE96FF53A3
      88FF4A9275FF557B5EFF8D8166FF897B62FF86765FFF82715CFF897251FFA179
      33FF000000FF000000FF000000FF00000000000000FF444444FFC8E0DBFF117C
      64FF147D66FF188068FF1D826BFF21836DFF25856FFF298771FF2D8873FF398F
      7BFFD0E5E0FFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFC4DD
      D8FF5F9E8FFF5B9B8CFF5F9D8EFF639E90FF68A093FF6CA195FF70A397FF74A5
      99FF78A69BFFDDE8E5FF444444FF000000FF0000000000000000000000000000
      000000000000000000000B2124FF41DEFBFF41DFFBFF41DFFBFF42E1FBFF43E2
      FCFF44E4FDFF49E6FDFF4EE9FEFF52EAFFFF53EBFFFF53EBFFFF53EBFFFF53EB
      FFFF53EBFFFF53EBFFFF52EAFEFF4DE8FDFF47D0E3FF4CE7FDFF3CE0FBFF21D3
      F8FF02C6F4FF00CFF9FF00CDF0FF16444CFF07036BFF1713CEFF302BADFF302B
      9CFF414494FF282772FF0F0BBDFF201F41FF201B20FF201B17FF201B17FF201F
      20FF202320FF303330FF383738FF494449FF383330FF302F30FF302F30FF201F
      20FF201B17FF171717FF201B17FF201B17FF201762FF201FB5FF282B72FF494C
      94FF383794FF302FA5FF281FDEFF0A0A66FF000000000000000000000000040E
      10FF37919FFF48B5BFFF58C5BDFF56BCA3FF71D2ADFF6FD2B2FF5FC4A0FF5ABD
      98FF58BA95FF57B793FF55B391FF57A999FF5BB1A4FF59AFA3FF58ADA2FF57AB
      A0FF5F9D9CFF737A86FF737380FF706F7CFF6A6979FF646376FF4D4B5AFF0705
      01FF000000FF000000FF0000000000000000000000FF1B1B1BFFF2F7F6FF89BE
      B2FF62A999FF2C8B75FF1E826BFF22846DFF26866FFF2A8772FF2E8974FF328B
      76FFB4D4CDFFFBFCFCFFFBFCFCFFFBFCFCFFFBFCFCFFFBFCFCFFFBFCFCFF9FC7
      BEFF589A8AFF5C9B8DFF609D8FFF649F91FF69A093FF6DA295FF7CAB9FFFA1C1
      B9FFBCD2CDFFF5F8F7FF1B1B1BFF000000FF0000000000000000000000000000
      00FF020404FF0A1213FF1D4951FF3FDCFAFF3FDCFAFF40DDFAFF41DEFBFF41E0
      FBFF42E2FCFF44E4FDFF4AE6FDFF50E9FEFF52EBFFFF53EBFFFF53EBFFFF53EB
      FFFF53EBFFFF53EBFFFF52EAFFFF50E9FEFF4AD1E4FF50E9FEFF45E4FDFF2FDA
      F9FF0DC9F5FF00CAF6FF00D6FBFF0E2D32FF0D0D87FF0F0BADFF848284FF4948
      49FF949694FF595CB5FF413BB5FF0F0F7AFF302F30FF383330FF302B28FF302F
      30FF303330FF383330FF515051FF7A7C7AFF626062FF515051FF302F30FF302F
      30FF302F30FF302F30FF302F30FF302F30FF1713ADFF4948ADFF625CB5FF8C8A
      8CFF414441FF84869CFF171BDEFF100D71FF0000000000000000000000000818
      1BFF3995A2FF4AB8C1FF5AC8BFFF50B7AAFF4EB1A1FF52B49CFF58BC9AFF58BB
      98FF56B795FF54B392FF52AF8FFF54A499FF58AAA4FF55A6A1FF53A29EFF5389
      9CFF6B799CFF6B7699FF687296FF646E92FF60698FFF5A638CFF484F74FF0000
      00FF000000FF000000FF0000000000000000000000FF000000FFECEDEDFF71B1
      A3FF81B9ADFFC3DDD7FF56A291FF59A393FF5DA494FF60A596FF63A698FF66A8
      99FFABCFC7FFEDF3F1FFEDF3F1FFEDF3F1FFEDF3F1FFEDF3F1FFEDF3F1FFA0C7
      BEFF83B3A8FF86B4A9FF89B5ABFF8CB7ADFF90B8AEFF93B9B0FFD8E6E2FFAFCA
      C4FFB3CCC6FFECEDEDFF000000FF000000FF05090AFF122225FF21494FFF327E
      88FF42BED0FF49E5FCFF44DCF4FF3CD9F9FF3DD9F9FF3EDAF9FF3FDCFAFF40DE
      FAFF41E0FBFF43E2FCFF46E4FDFF4CE7FEFF52EAFEFF53EBFFFF53EBFFFF53EB
      FFFF53EBFFFF53EBFFFF53EBFFFF51EAFEFF4BD2E4FF52EAFEFF4BE7FDFF3ADF
      FBFF1BD0F7FF00C7F5FF02B7D8FF04090AFF13158DFF2023DEFF6260C6FF4948
      62FF595484FF38379CFF282794FF0F0BC6FF171784FF201B6AFF201B62FF1717
      62FF171762FF171762FF201B6AFF17176AFF17176AFF17176AFF17176AFF1717
      72FF171772FF171772FF201B7AFF17179CFF1717D6FF28279CFF3837ADFF4144
      94FF494872FF494CCEFF2023E7FF11127DFF0000000000000000000000000C21
      26FF3B99A6FF4BBBC4FF5CCBC1FF55C1B2FF50B7AAFF48A89DFF429A92FF469E
      8EFF4CA78EFF4FAA8DFF4CA489FF4F9894FF519C9DFF4D959BFF40799EFF3869
      9AFF3C6595FF4B6491FF58648DFF57608AFF535B87FF4C5585FF324386FF0000
      00FF000000FF000000FF000000000000000000000000000000FF404040FF6E6E
      6EFF6E6E6EFF6E6E6EFF6E6E6EFF7193A9FF6FA5C0FF6FA5C1FF70A1BFFF729C
      BDFF6396B2FF6A9BB1FF6992A7FF6B99B1FF69A1B8FF69A1B8FF6B9DB7FF6395
      B2FF719EBEFF70A4BFFF6FA7C0FF71A2BDFF738FA7FF6E6E6EFF6E6E6EFF6E6E
      6EFF6E6E6EFF404040FF000000FF0000000048CBDDFF51EAFEFF52EAFEFF52EA
      FEFF52EAFEFF51EAFEFF49DFF6FF2BD5FAFF2FD6FAFF37D7F9FF3ED9F9FF3FDC
      FAFF40DEFAFF42E0FBFF43E3FCFF49E6FDFF50E9FEFF53EBFFFF53EBFFFF53EB
      FFFF53EBFFFF53EBFFFF53EBFFFF52EAFEFF4CD2E4FF52EAFFFF4FE9FEFF41E2
      FCFF26D5F8FF04C6F4FF0C6172FF000000FF1B1D8AFF383BEFFF4140EFFF3027
      E7FF2823E7FF2823E7FF2823E7FF201FDEFF2017DEFF2017DEFF2017DEFF2017
      DEFF2017DEFF2017DEFF2017DEFF2017DEFF2017DEFF2017DEFF2017DEFF2017
      DEFF2017DEFF2017DEFF2017DEFF2017DEFF302FEFFF413BF7FF413BF7FF3837
      F7FF302BEFFF4140EFFF383BEFFF18197AFF000000000000000000000000102C
      32FF3D9EAAFF4CBDC6FF5BCAC0FF53BFB2FF51BAADFF4FB5A8FF4AAB9FFF4198
      90FF378480FF357E78FF3B887EFF46878EFF488A9BFF3F75A4FF3B6EA1FF3868
      9CFF356297FF325C92FF31568FFF394F98FF344995FF274098FF213994FF0000
      00FF000000FF000000FF000000000000000000000000000000FF000000FF0000
      00FF000000FF000000FF000000FF065B7DFF0188AEFF0089AFFF057DABFF0A74
      A9FF0875A8FF04729EFF015984FF086F9EFF0188AEFF0089AFFF057EACFF0A74
      A8FF0976A9FF0581ACFF0386ADFF0A7BA8FF0F5277FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000003998A5FF53EBFFFF53EBFFFF53EB
      FFFF53EBFFFF53EBFFFF4DE0F7FF39D8FDFF40D9FCFF4CDCFBFF5BDEFAFF63E1
      FAFF66E4FBFF6AE6FCFF6DE8FDFF77ECFDFF84EFFEFF87F1FFFF85F0FFFF83F0
      FFFF80F0FFFF7DEFFFFF7AEFFFFF77EFFFFF5DD4E4FF53EBFFFF50E9FEFF46E5
      FDFF2ED9F9FF09C7F3FF071D22FF00000000211F66FF5958F7FF5954F7FF302F
      EFFF302BE7FF302BE7FF302BE7FF201FDEFF201BDEFF201BDEFF201BDEFF201B
      DEFF201BDEFF201BDEFF201BDEFF201BDEFF201BDEFF201BDEFF201BDEFF201B
      DEFF201BDEFF201BDEFF201BDEFF201BDEFF3833EFFF5150FFFF5150FFFF5150
      FFFF3833EFFF5954F7FF5958F7FF19174EFF0000000000000000000000001436
      3CFF3FA2ADFF4DBFC7FF5BCBC1FF53BEB3FF50B9ADFF4DB2A7FF4AABA1FF47A4
      9BFF429B92FF388681FF2A707DFF2F5C9BFF457CB0FF3E72A8FF3B6DA3FF3867
      9FFF35619AFF325B95FF2E5592FF2A49A6FF2744A1FF243E9BFF213995FF0000
      01FF000000FF000000FF00000000000000000000000000000000000000000000
      00000000000000000000000000FF0A7795FF02B1CEFF01B3CFFF08A5CBFF0F99
      C7FF0D9AC6FF0795BAFF02789DFF0B95BCFF02B1CFFF01B2CFFF08A5CBFF0F9A
      C7FF0E9CC8FF09A7CBFF05AFCDFF0FA8C7FF176A8DFF000000FF000000000000
      00000000000000000000000000000000000027656DFF53EBFFFF53EBFFFF53EB
      FFFF53EBFFFF53EBFFFF57E3F8FF6AE2FEFF73E4FEFF82E6FDFF92E9FCFF9FEC
      FCFFA6EEFCFFACF0FDFFB1F2FEFFBCF5FEFFD3F9FFFFDCFAFFFFD6FAFFFFCFF9
      FFFFC8F8FFFFC1F7FFFFBAF7FFFFB3F6FFFF76D7E4FF53EBFFFF51EAFEFF49E6
      FDFF34DCFAFF168AA4FF000102FF000000000000000036337AFF625CF7FF3837
      EFFF5954EFFF5954EFFF5150EFFF302BE7FF302BE7FF302BE7FF302BE7FF302B
      E7FF302BE7FF302BE7FF302BE7FF302BE7FF302BE7FF302BE7FF302BE7FF302B
      E7FF302BE7FF302BE7FF302BE7FF302BE7FF302BE7FF6A64FFFF6A68FFFF6A68
      FFFF3833EFFF625CF7FF2B2762FF000000000000000000000000000000001841
      49FF41A6B1FF4DC0C9FF5AC9C0FF50BCB3FF4DB5ADFF4AAEA6FF47A79FFF449F
      98FF3D9393FF31808CFF297184FF315DA0FF4C89BEFF447DB5FF3D70ABFF3866
      A2FF35609DFF325A99FF2E5495FF2A49A6FF2744A1FF243E9BFF213995FF0205
      10FF000000FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000FF0E8AA4FF03CFE3FF00D0E5FF0BBEE0FF14AE
      DBFF10B3DBFF05B4D0FF028CADFF10AACEFF02CFE4FF00D1E5FF0ABFE0FF13AF
      DCFF11B4DDFF07C9E1FF02D6E4FF14BCDBFF1E7A9CFF000000FF000000000000
      00000000000000000000000000000000000016363BFF53EBFFFF53EBFFFF53EB
      FFFF53EBFFFF53EBFFFF57E3F8FF67E1FFFF6BE2FFFF77E4FEFF8AE8FDFF9AEB
      FCFFA2EDFCFFA8F0FDFFADF2FDFFB3F4FEFFC4F7FEFFD9FAFFFFDBFAFFFFD4FA
      FFFFCEF9FFFFC6F8FFFFBFF7FFFFB8F6FFFF79D8E4FF53EBFFFF52EAFEFF4BE7
      FDFF38DEFBFF11363EFF00000000000000000000000000000000322AB9FF3837
      E7FF8482FFFF8482FFFF726CF7FF4944EFFF4944EFFF5954F7FF4944F7FF4948
      F7FF4948F7FF4948F7FF4948F7FF4948F7FF4948F7FF4948F7FF4948F7FF4948
      F7FF4948F7FF4948F7FF6264F7FF4948EFFF4944EFFF5958F7FF8482FFFF8C86
      FFFF302FE7FF2F2BB1FF00000000000000000000000000000000000000001D4D
      55FF47AFB9FF66DCE1FF5FD7D5FF57CAC5FF4CB4AEFF48AAA5FF43A2A0FF3B95
      9EFF338897FF2E7C8DFF297185FF3260A3FF4B86C0FF457EBBFF437BB8FF3F72
      B1FF3765A6FF315A9EFF2E5399FF2A49A6FF2744A1FF243E9BFF213995FF060B
      1FFF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FF0F96ADFF03E0F0FF02E0F1FF0CD0ECFF15BF
      E8FF12C2E7FF0ABCDAFF0592B6FF12B8DAFF03E1F1FF02E0F1FF0CD0ECFF15BF
      E8FF13C4E9FF0CD3ECFF09DAEEFF17CBE7FF2287A5FF000000FF000000000000
      000000000000000000000000000000000000050E0FFF51E9FDFF53EBFFFF53EB
      FFFF53EBFFFF53EBFFFF56E7FCFF5EDFF7FF5BDFF7FF61E0F7FF6BE2F6FF73E4
      F6FF80E0F4FF87E3F7FF91E6F7FF98E7F6FF83E4F6FF88E6F6FF90E9F7FF8EEA
      F8FF8EEBF9FF8DECF9FF89ECF9FF85ECF9FF66E2F2FF53EBFFFF52EAFFFF4CE7
      FDFF35BED5FF020708FF00000000000000000000000000000000040319FF1616
      C7FF7A78F7FF625CF7FF4140EFFF3837EFFF3833EFFF4140EFFF726CFFFF7A74
      FFFF7A78FFFF7A7CFFFF847CFFFF847CFFFF847CFFFF847CFFFF7A78FFFF7A78
      FFFF7274FFFF6A6CFFFF4944EFFF3833EFFF302FEFFF382FEFFF413BEFFF6260
      EFFF1612C7FF030317FF00000000000000000000000000000000000000002865
      6EFF61DCE1FF54D0D6FF54D0D6FF54D1D7FF59D5DBFF51BCCEFF49B1C1FF3A97
      A5FF338897FF2E7C8DFF297185FF3461A7FF4880C1FF4277BBFF4074B8FF3D6F
      B4FF3A69AFFF3662A9FF3056A1FF2A4AA6FF2744A1FF243E9BFF213995FF080F
      29FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FF0EA0B3FF03EAF8FF03EBF8FF0AE0F5FF0FD8
      F3FF10D4F1FF0ECBE9FF09A9CAFF10C7E3FF03EAF8FF03EBF8FF0AE1F5FF0FD9
      F3FF10D5F2FF0FD8F3FF0AE2F5FF14DEF0FF228CABFF000000FF000000000000
      000000000000000000000000000000000000000000FF43B7C7FF53EBFFFF53EB
      FFFF53EBFFFF53EBFFFF53EBFFFF53EBFFFF53EBFFFF53EBFFFF53EBFFFF53E9
      FDFF67DFFAFF6AE2FFFF7BE5FDFF92E9FCFF9EECFCFF80E8FCFF56E3FCFF44E4
      FCFF4CE8FEFF52EAFFFF53EBFFFF53EBFFFF53EBFFFF53EBFFFF52EAFFFF4CE7
      FDFF21565EFF00000000000000000000000000000000040406FF0A0B16FF1618
      50FF28278CFF282B38FF302F49FF302F62FF302B6AFF28278CFF302BC6FF302B
      CEFF302FDEFF302FDEFF302FDEFF3833DEFF3833DEFF302FDEFF302FD6FF302B
      CEFF302BC6FF302BBDFF28278CFF302F62FF302F59FF302F49FF282B38FF2827
      62FF191C5BFF0E101AFF080A0FFF00000000000000000000000000000000337E
      85FF54D0D6FF54D0D6FF54D0D6FF54CFD5FF52CAD5FF4CAFD4FF4CAFD3FF4FB5
      D7FF47AAC6FF3B96ACFF2B768AFF3563AAFF4578C2FF3F70BBFF3C6CB8FF3A68
      B3FF3762B0FF335AAEFF2E51ACFF2A49A8FF2744A1FF243E9BFF213995FF0A12
      32FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FF09ABB8FF04F2FBFF03EEFBFF15DCF3FF17D5
      F2FF20C9EEFF1DCCEFFF10DAF5FF10E0F6FF04F2FBFF04EEFBFF11E0F5FF15D7
      F3FF1ECBEFFF1FC9EFFF12D7F5FF1AC6F1FF1C93B0FF000000FF000000000000
      000000000000000000000000000000000000000000002F7E8AFF4FE9FEFF4FE9
      FEFF4FE9FEFF50E9FEFF52EAFEFF52EAFFFF53EBFFFF53EBFFFF53EBFFFF53EB
      FFFF52E6FAFF59E1F8FF73E2F9FF91E9FCFFA1EDFCFFA9EFFDFFB0F2FDFFA3F1
      FDFF7CEEFEFF55EBFFFF53EBFFFF53EBFFFF53EBFFFF53EBFFFF52EAFEFF49DF
      F4FF091315FF00000000000000000000000003030AFF201F94FF201BADFF1E1A
      87FF2925B3FF282B30FF302F28FF282F28FF302F28FF302F28FF282F30FF302F
      30FF302F30FF302F30FF302F28FF282B28FF282B28FF282F28FF302F30FF302F
      30FF303330FF302F30FF303330FF303330FF282F28FF282F28FF282B28FF2B23
      95FF1C188DFF201BC6FF201FB5FF080720FF000000000000000000000000122F
      31FF51C9CFFF52CDD3FF52CBD1FF51C8CFFF4EBFCEFF48A5CDFF47A3CBFF47A1
      C9FF459DC6FF4192C2FF3E88C0FF3D73BBFF426FCAFF3B67C3FF3862C0FF365D
      BDFF3357BAFF3053B4FF2D4EAEFF2A49A8FF2744A1FF243E9BFF213995FF0C16
      3CFF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FF00AEAEFF06EEFAFF01F0FDFF15DBF4FF16D8
      F3FF18D9F2FF12E3F5FF03F7FCFF04F8FCFF04EFFBFF00F1FDFF18D8F2FF16D8
      F3FF19D7F2FF19DBF2FF02F8FCFF15DBF4FF1785AAFF000000FF000000000000
      000000000000000000000000000000000000000000001C4C54FF47E5FDFF46E5
      FDFF47E5FDFF48E6FDFF4BE7FDFF4FE9FEFF52EAFEFF53EBFFFF53EBFFFF53EB
      FFFF53EBFFFF53EBFFFF52E9FDFF61E4F8FF84E6F7FFA4EEFBFFAFF2FDFFBCF5
      FEFFD8FAFFFFCBF8FFFF91F2FFFF5EECFFFF53EBFFFF53EBFFFF52EAFEFF317C
      88FF000000FF000000000000000000000000000000002B2763FF2E2E86FF1411
      71FF130F4DFF28236AFF282B28FF282728FF282728FF282728FF282728FF2827
      28FF282728FF282B28FF282728FF282728FF282728FF282728FF282B28FF282B
      28FF282728FF282B28FF282728FF282728FF282728FF282B28FF282341FF1614
      6AFF0D0B4DFF1E1E6AFF242150FF000000000000000000000000000000000000
      0000102A2CFF3C989FFF4BBCC5FF4AB8C2FF47AFC0FF4397C4FF4291C5FF4189
      C7FF4084CAFF4286CDFF4388CEFF498DD4FF416BD2FF3A63CAFF375FC5FF355C
      C0FF3357BAFF3053B4FF2D4EAEFF2A49A8FF2744A1FF243E9BFF213995FF0E1A
      46FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FF001818FF069EA4FF14D7EDFF16D6F3FF10E0
      F6FF0EE5F7FF11E2F5FF1EC8EBFF10ADD4FF0CD9EBFF15DAF3FF18D3F2FF12DC
      F5FF0DE5F7FF0FE7F6FF1BD6F1FF1C9DC1FF031F27FF000000FF000000000000
      000000000000000000000000000000000000000000000B2024FF42E2FCFF42E1
      FCFF42E1FCFF43E2FCFF44E3FCFF47E5FDFF4CE7FEFF51EAFEFF53EBFFFF53EB
      FFFF53EBFFFF53EBFFFF53EBFFFF53EBFFFF51EAFEFF2F5D64FF4A6B71FFA2D9
      E1FFD4F9FFFFDAFAFFFFD1F9FFFFC4F8FFFF99F3FFFF69EDFFFF51EAFEFF1227
      2AFF000000000000000000000000000000000000000000000000000000000000
      0000000000002E27ACFF202320FF202320FF202320FF1D201DFF202320FF2023
      20FF202320FF282728FF202320FF202320FF1E211EFF1E211EFF202320FF2023
      20FF202320FF202320FF1E211EFF1E211EFF202320FF202320FF252492FF0000
      05FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000E2426FF21555BFF24536AFF4285CFFF4386D1FF4388
      D2FF4388D2FF4388D2FF4387D0FF498BD4FF416CD2FF3A63CAFF375FC5FF355C
      C0FF3357BAFF3053B4FF2D4EAEFF2A49A8FF2744A1FF243E9BFF213995FF101D
      4FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000FF000000FF000708FF003032FF0674
      8FFF07C3E4FF04CEE6FF09BCDCFF11ADD7FF10AFD8FF0ACCE6FF09DBEEFF11D0
      EAFF0E8DA8FF06525EFF03242BFF000000FF000000FF00000000000000000000
      00000000000000000000000000000000000000000000000303FF3DCEE8FF41DE
      FAFF41DEFBFF41DFFBFF42E0FBFF43E2FCFF46E4FDFF4CE7FEFF51EAFEFF53EB
      FFFF53EBFFFF53EBFFFF53EBFFFF53EBFFFF54EBFEFF347077FF000000000507
      07FF405053FF9FBDC0FFD3F9FFFFC9F8FFFFBFF7FFFFB5F6FFFF6EB0B8FF0103
      03FF000000000000000000000000000000000000000000000000000000000000
      0000000000000D0B32FF201F72FF171F20FF171B17FF0C0F0CFF121512FF171B
      17FF201F20FF201F20FF0B0D0BFF131313FF141414FF0D100DFF111411FF201F
      20FF171F17FF141814FF0F110FFF121512FF171F20FF171B30FF161155FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000012223EFF3F73D2FF407AD1FF4180
      D0FF4181CFFF4181CEFF4080CCFF4784D1FF416CD2FF3A63CAFF375FC5FF355C
      C0FF3357BAFF3053B4FF2D4EAEFF2A49A8FF2744A1FF243E9BFF213995FF1221
      58FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF064E
      6CFF04D2EFFF00EEFBFF09E5F9FF12D7F6FF12D9F6FF0AE8F9FF05F0FAFF19C4
      E8FF0F4664FF000000FF000000FF000000FF0000000000000000000000000000
      00000000000000000000000000000000000000000000000000002D90A3FF3FDB
      F9FF3FDBF9FF3FDCFAFF40DEFAFF41E0FBFF43E2FCFF46E5FDFF4DE8FEFF52EA
      FFFF5EECFFFF78EFFFFF90F2FFFFA3F4FFFFB1F6FFFF80B8BFFF010202FF0000
      000000000000000000FF253032FF719397FFBAF1F9FFB7F6FFFF314447FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001B1A76FF201B49FF201F41FF131329FF13131BFF1616
      16FF0E1616FF0C100CFF0B0B0BFF0D0D0DFF0E0E0EFF0C0C0CFF0C0F0CFF0E16
      16FF171720FF151925FF141832FF1E1D46FF201F49FF201885FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000142348FF3D69D2FF3D69D2FF3D69
      D1FF3D6AD1FF3D6CD0FF3D6DCFFF4675D6FF426CD2FF3A63CAFF375FC5FF355C
      C0FF3357BAFF3053B4FF2D4EAEFF2A49A8FF2744A1FF243E9BFF213995FF1526
      63FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FF0558
      70FF03EDF9FF05EFFBFF0EE4F7FF16D8F3FF1ECDF0FF1BCDF1FF14D5F5FF1AC8
      EFFF0E4E68FF000000FF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001C5E6CFF35D7
      F9FF37D7F9FF3CD9F9FF3FDBF9FF42DDFAFF58E3FCFF75EAFDFFA0F2FEFFCAF8
      FEFFD7FAFFFFD1F9FFFFCAF8FFFFC3F8FFFFBCF7FFFFAFF2FAFF0A0E0EFF0000
      0000000000000000000000000000000000000F1516FF46666AFF070A0BFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000005FF29258AFF6E68E7FF7A78FFFF7A78FFFF7A78
      FFFF7A78FFFF7A74F7FF7274EFFF7274EFFF7274EFFF7A74EFFF7A74F7FF7A78
      FFFF7A78FFFF7A78FFFF7A78FFFF7674F7FF4139B3FF050419FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000172850FF3D69D2FF3D69D2FF3D69
      D2FF3D69D2FF4272D8FF4E86E1FF558DE5FF4C83E1FF4A80DFFF497DDEFF487B
      DDFF4679DBFF4577DAFF4475D8FF4272D7FF4170D5FF3F6DD3FF3D6AD0FF233B
      78FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FF006F
      6FFF06F0FAFF00F2FDFF13DDF5FF16D8F3FF19D7F2FF12E2F5FF04F7FCFF1CCD
      F1FF0D4E65FF000000FF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000D333CFF27D4
      FCFF41D9FCFF63E0FBFF87E7FBFFA2EDFCFFACF0FDFFB1F2FDFFBBF5FEFFD0F9
      FFFFDCFAFFFFD8FAFFFFCBF5FBFF92BAC0FF628388FF374E51FF040707FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000030307FF0D0D17FF1C1D
      30FF292741FF343351FF393859FF393859FF393859FF393859FF343351FF2E2E
      49FF232238FF131220FF08080FFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000192D59FF406FD6FF4B82E1FF4D85
      E5FF4E87E7FF4A81E3FF4170DBFF4170DBFF4170DBFF4170DBFF4170DBFF4170
      DBFF406FDAFF406ED9FF3F6DD7FF3E6AD4FF3B66CEFF2E50A4FF162750FF0000
      01FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FF0003
      03FF016B6EFF10B0C1FF13D4ECFF10E0F6FF0EE3F7FF11D9EDFF18A2BCFF0D52
      67FF000102FF000000FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000071012FF6BE1
      FDFF74E4FEFF83E6FDFF93E9FCFFA0ECFCFFA6EFFDFFABF1FDFF97D4DEFF7197
      9CFF526568FF2B3536FF080B0BFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A1222FF26426FFF2B4B8FFF3156
      A9FF3860BDFF3C68CDFF3F6ED7FF406FDAFF406FD9FF3E6BD4FF3A65C9FF345B
      B8FF2E4FA2FF254186FF1C3166FF111F40FF040813FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF000000FF000000FF000000FF000C0DFF000B0CFF000000FF000000FF0000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FF59B9
      D0FF69E2FFFF70DDF7FF60A3B2FF4B727AFF2E4549FF121A1CFF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000FF000001FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FF000000FF000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C36
      3DFF14292EFF030708FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000E00000000100010000000000000E00000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFC000000F0000000000000000
      FFFFFFFFC000000F0000000000000000FFFFFFFFC000000F0000000000000000
      FFE3FFFFC000000F0000000000000000FF00FFFFC000000F0000000000000000
      F8007FFFC000000F0000000000000000C0001FFFC000000F0000000000000000
      00000FFFC000000F0000000000000000000003FFC000000F0000000000000000
      000001FFC000000F00000000000000008000007FC000000F0000000000000000
      C000003FC000000F0000000000000000E000000FC000000F0000000000000000
      E0000007C000000F0000000000000000F0000003C000000F0000000000000000
      F8000001C000000F0000000000000000FC000001C000000F0000000000000000
      FE000000C000000F0000000000000000FF000000C000000F0000000000000000
      FF800000C000000F0000000000000000FFE00001C000000F0000000000000000
      FFF00003C000000F0000000000000000FFF8003FC000000F0000000000000000
      FFFE001FC000000F0000000000000000FFFFF01FC000000F0000000000000000
      FFFFC01FC000000F0000000000000000FFFF801FC000001F0000000000000000
      FFFF807FC000003F0000000000000000FFFF87FFC000007F0000000000000000
      FFFFFFFFC00001FF0000000000000000FFFFFFFFC00003FF0000000000000000
      FFFFFFFFC00007FF0000000000000000C0038FE3FE3F8FE3FE008FE3FFFFFFFF
      80018001FE000001FE0003E1FFF818078001C0009F000000980001F0FFF81003
      8001C0008F800000880000F8E00000038001C000878000008000007CC0000000
      0000C000C3800000C000003F8000000700000000C1800000C020041F80000007
      00000001E0800000E000060F8000000700000001F0000000E004070780000007
      00020001F8000000E0100783800000070001000100000000E00007C180000007
      8001800100000000E00003E1800000078001C00000000000800401F080000007
      8001E00800000000800000F88000009F8001F004000000008000007C800000FF
      C000E00300000000C000183F802040FFC1E0400300000000C0003C1FE00040FF
      E080000100000000E0003E0FE00040FFF000010100000000F0401007E00040FF
      F8000081F8000000F8020003E00040FFF8000001FC000000FC010001E00040FF
      E0000001FE000000FC008001E00040FF800000009F00000098004000E04040FF
      800000008F80000088004000FFC040FF8000001C8780000080000004FFC040FF
      8100003FC3800000C0000007FFC040FF8180001FC1800000C000200FFFC040FF
      8000000FE0800000E000300FFFE040FFC0000007F0000000F0001C07FFFFC0FF
      C0060083F8000000F8000F83FFFFC0FFE00F80E3FE000000FE008FE3FFFFC0FF
      F01FF0FFFFFFFFFFFF03FFFFFFFFFFFFFFFFFFFFFFFFFFFFFE038FE3023F8FE3
      FFFFFFFFFFFFFFFFFE0083E1020C00E1FFFFFFFFFFFFFFFF9E0001F093000070
      FFFFFFFFFFFFFFFF880000F88381E0180000FFFFFFFFFFFF8081007C8001F004
      0000FFFFFFE0E0FFC000003FC02000033E7CFFFFFFE4E4FF0010101FC1F00000
      3E7CFFFFFFE4E4FF00401C0FE0F038083E7CFE1FFFE0E0FF00001E07F07C0004
      3E7CFC0FFFC000FF80080F01F03C01803E7CF8C7FF80007F08000700F01007C0
      0000F123FF90013F00010300F00183E10000E211FF90013F000001009003C0F0
      3E7CC418FF9FFF3F04000000038300383E7C8C0CFF20009F0040101003C0000C
      3E7C9E0CFF20009F00001800C3E000073E4C9E38FF3FFF9F80101C01C1F00003
      3E009E31FE40004F00381E00E0F03E03000083E3FE40004F007C1F00F0701101
      0001A3C7FE00000F00300F00F8300081E008038FFE00000F04000700FC0004C1
      E044101FFCFFFFFF1E030300FE0080E1CC27803FC0FFFFFF0705C0009F01C0E0
      C007FFFFC1FFFFFF800000008F80E0E0E187FFFFFFFFFFFF8001006087C0E060
      FFFFFFFFFFFFFFFFC000C030C3E06001FFFFFFFFFFFFFFFFC1000400C1F07001
      FFFFFFFFFFFFFFFFE0C00E03E0F01E03FFFFFFFFFFFFFFFFF0701E07F0780003
      FFFFFFFFFFFFFFFFF83C0803F83C0003FFFFFFFFFFFFFFFFFE3F0063FE3E0003
      FFFFFFFFFFFFFFFFFFFFC1FFFFFF803F00000000FE3F8FE3C0000007FE3F8FE3
      00000000FE0F83E1C000000700000000000000009F07C1F0C000006700000000
      000000008F8000F8C0000027000000000000000087C0007CC3FFF20780000000
      00000000C380003FC3FFF307C000000300000000C000001FC3FFF007C0000003
      00000000E000000FC3101807C000000300000000F0000007C3101F87C0000003
      00000000F8000003C3FFFF87C000000300000000F0000001C3100387C0000001
      00000000F0000001C3100387C00000010000000090000000C3FFFF8780000000
      0000000080000008C3300187800000000000000080000004C310018780000000
      00000000C0000007C3FFFF87C000000300000000C0000007C3FFFF87C0000003
      00000000E000000FC3100787C000000300000000F0000007C3100787C0000003
      00000000F0000003C3FFFF87C000000300000000F0000001C310038700000000
      00000000F8000001C3100387000000000000000098000010C3FFFF8700000000
      000000008C000038C3FFFF8700000000000000008600007CC3FFFF8780000000
      00000000C300003FC3800387C000000700000000C180001FC0000007C000001F
      00000000E0E00E0FC01C7007E000000F00000000F07C1F07C0000007F0400307
      00000000F83E0F83C0000007F8300F8300000000FE3F8FE3FFF01FFFFE3C0FE3
      00000000FFFFFFFFFFF83FFFFFFFFFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 424
    Top = 264
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    Left = 352
    Top = 304
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 288
    Top = 264
  end
  object aplctnvntsApp: TApplicationEvents
    OnException = aplctnvntsAppException
    Left = 288
    Top = 152
  end
end
