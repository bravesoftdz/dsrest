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
  cxTextEdit, Vcl.StdCtrls, Vcl.ExtCtrls, dxStatusBar, cxCalc, dxBarBuiltInMenu,
  cxButtons, cxPC;

type
  TfrmPenjualanPOS = class(TfrmPenjualan)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    function getDefaultHarga: string; override;
    function JenisPenjualan: string; override;
    procedure SetInfix; override;
  public
    { Public declarations }
  end;

var
  frmPenjualanPOS: TfrmPenjualanPOS;

implementation

{$R *.dfm}

procedure TfrmPenjualanPOS.FormCreate(Sender: TObject);
begin
  inherited;
  cbbJenisPembayaran.ItemIndex := 0;
  cbbJenisPembayaran.Enabled   := False;

  CDSSalesman.Filter    := ' nama = ' + QuotedStr('Point Of Sales');
  CDSSalesman.Filtered  := True;
  try
    cbbSalesman.EditValue := CDSSalesman.FieldByName('ID').AsString;
  finally
    CDSSalesman.Filtered  := False;
  end;

  CDSPembeli.Filter    := ' nama = ' + QuotedStr('Point Of Sales');
  CDSPembeli.Filtered  := True;
  try
    cbbPembeli.EditValue := CDSPembeli.FieldByName('ID').AsString;
  finally
    CDSPembeli.Filtered  := False;
  end;
end;

function TfrmPenjualanPOS.getDefaultHarga: string;
begin
  Result := 'umum';
end;

function TfrmPenjualanPOS.JenisPenjualan: string;
begin
  Result := 'POS';
end;

procedure TfrmPenjualanPOS.SetInfix;
begin
  Infix := '/POS';
end;

end.
