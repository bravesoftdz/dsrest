unit ufrmSettingAppServer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSettingAppServer, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxGridCustomTableView,
  cxGridTableView, cxGridCustomView, cxClasses, cxGridLevel, cxGrid;

type
  TfrmSettingAppServer = class(TForm)
    cxgrdlvlSettingApp: TcxGridLevel;
    cxGridSettingApp: TcxGrid;
    cxGridTableSettingApp: TcxGridTableView;
    cxGridColID: TcxGridColumn;
    cxGridColRekBankCash: TcxGridColumn;
    cxGridColAkunHPP: TcxGridColumn;
    cxGridColAkunPersediaan: TcxGridColumn;
    cxGridColAkunPendapatan: TcxGridColumn;
    cxGridColAkunPiutangDagang: TcxGridColumn;
    cxGridColHutangDagang: TcxGridColumn;
  private
//    property SettingAppServer: TSettingAppServer read GetSettingAppServer write
//        FSettingAppServer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSettingAppServer: TfrmSettingAppServer;

implementation

{$R *.dfm}

end.
