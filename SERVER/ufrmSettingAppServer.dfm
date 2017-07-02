object frmSettingAppServer: TfrmSettingAppServer
  Left = 0
  Top = 0
  Caption = 'Setting App Server'
  ClientHeight = 297
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxGridSettingApp: TcxGrid
    Left = 0
    Top = 0
    Width = 536
    Height = 297
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 152
    ExplicitTop = 72
    ExplicitWidth = 250
    ExplicitHeight = 200
    object cxGridTableSettingApp: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      object cxGridColID: TcxGridColumn
        AlternateCaption = 'ID'
        Caption = 'ID'
        HeaderAlignmentHorz = taCenter
      end
      object cxGridColRekBankCash: TcxGridColumn
        Caption = 'Rek Bank Cash'
        HeaderAlignmentHorz = taCenter
        Width = 77
      end
      object cxGridColAkunHPP: TcxGridColumn
        Caption = 'Akun HPP'
        HeaderAlignmentHorz = taCenter
        Width = 52
      end
      object cxGridColAkunPersediaan: TcxGridColumn
        Caption = 'Akun Persediaan'
        HeaderAlignmentHorz = taCenter
        Width = 98
      end
      object cxGridColAkunPendapatan: TcxGridColumn
        Caption = 'Akun Pendapatan'
        HeaderAlignmentHorz = taCenter
        Width = 91
      end
      object cxGridColAkunPiutangDagang: TcxGridColumn
        Caption = 'Akun Piutang Dagang'
        HeaderAlignmentHorz = taCenter
        Width = 109
      end
      object cxGridColHutangDagang: TcxGridColumn
        Caption = 'AkunHutangDagang'
        HeaderAlignmentHorz = taCenter
        Width = 102
      end
    end
    object cxgrdlvlSettingApp: TcxGridLevel
      GridView = cxGridTableSettingApp
    end
  end
end
