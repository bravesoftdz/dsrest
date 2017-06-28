unit ufrmPembayaranPOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxCurrencyEdit, Vcl.Menus, cxButtons, System.Actions, Vcl.ActnList;

type
  TfrmPembayaran = class(TForm)
    lblTotal: TLabel;
    lblDibayar: TLabel;
    lblSisa: TLabel;
    edTotal: TcxCurrencyEdit;
    edDibayar: TcxCurrencyEdit;
    edSisa: TcxCurrencyEdit;
    btnSave: TcxButton;
    btnHapus: TcxButton;
    actlstBayar: TActionList;
    actBayar: TAction;
    actBatal: TAction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPembayaran: TfrmPembayaran;

implementation

{$R *.dfm}

end.
