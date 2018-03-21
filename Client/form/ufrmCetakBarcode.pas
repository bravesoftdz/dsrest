unit ufrmCetakBarcode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxCurrencyEdit;

type
  TfrmCetakBarcode = class(TForm)
    lblBarcode: TLabel;
    cbbBaranf: TcxExtLookupComboBox;
    edHarga: TcxCurrencyEdit;
    lblHarga: TLabel;
    cbbSatuanStock: TcxExtLookupComboBox;
    lblSatuanStock: TLabel;
    cbbGroup: TcxExtLookupComboBox;
    lblGroup: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCetakBarcode: TfrmCetakBarcode;

implementation

{$R *.dfm}

procedure TfrmCetakBarcode.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
