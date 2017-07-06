unit ufrmPembayaranPOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxCurrencyEdit, Vcl.Menus, cxButtons, System.Actions, Vcl.ActnList;

type
  TfrmPembayaranPOS = class(TForm)
    lblTotal: TLabel;
    lblDibayar: TLabel;
    lblSisa: TLabel;
    edTotal: TcxCurrencyEdit;
    edDibayar: TcxCurrencyEdit;
    edSisa: TcxCurrencyEdit;
    btnSave: TcxButton;
    btnHapus: TcxButton;
    procedure edDibayarPropertiesChange(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    FDibayar: Double;
    { Private declarations }
  public
    class function Bayar(ANominalBeli : Double): Double;
    property Dibayar: Double read FDibayar write FDibayar;

    { Public declarations }
  end;

var
  frmPembayaranPOS: TfrmPembayaranPOS;

implementation

{$R *.dfm}

class function TfrmPembayaranPOS.Bayar(ANominalBeli : Double): Double;
begin
  Result := 0;

  frmPembayaranPOS                := TfrmPembayaranPOS.Create(Application);
  frmPembayaranPOS.edTotal.Value  := ANominalBeli;
  frmPembayaranPOS.ShowModal;

  if frmPembayaranPOS.ModalResult = mrOk then
    Result := frmPembayaranPOS.Dibayar;

end;

procedure TfrmPembayaranPOS.btnSaveClick(Sender: TObject);
begin
  Dibayar := edDibayar.Value;
end;

procedure TfrmPembayaranPOS.edDibayarPropertiesChange(Sender: TObject);
begin
  edSisa.Value := edDibayar.Value - edTotal.Value;
end;

end.
