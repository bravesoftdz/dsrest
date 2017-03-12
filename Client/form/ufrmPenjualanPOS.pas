unit ufrmPenjualanPOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmPenjualan, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBExtLookupComboBox, cxCurrencyEdit, cxCheckBox, Data.DB,
  cxDBData, Vcl.Menus, System.ImageList, Vcl.ImgList, Datasnap.DBClient,
  Datasnap.Provider, cxGridDBTableView, cxGrid, cxClasses, System.Actions,
  Vcl.ActnList, dxBar, dxBarExtItems, cxBarEditItem, dxBarExtDBItems,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridCustomView,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxMemo, cxMaskEdit, cxCalendar,
  cxTextEdit, Vcl.StdCtrls, Vcl.ExtCtrls, dxStatusBar, cxCalc;

type
  TfrmPenjualanPOS = class(TfrmPenjualan)
  private
    { Private declarations }
  protected
    function getDefaultHarga: string; override;
    function JenisPenjualan: string; override;
  public
    { Public declarations }
  end;

var
  frmPenjualanPOS: TfrmPenjualanPOS;

implementation

{$R *.dfm}

function TfrmPenjualanPOS.getDefaultHarga: string;
begin
  Result := 'umum';
end;

function TfrmPenjualanPOS.JenisPenjualan: string;
begin
  Result := 'POS';
end;

end.
