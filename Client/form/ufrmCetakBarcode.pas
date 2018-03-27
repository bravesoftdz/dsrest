unit ufrmCetakBarcode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxCurrencyEdit,uAppUtils, ClientModule,
  Datasnap.DBClient,uDBUtils;

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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FCDSBarang: tclientDataSet;
    function GetCDSBarang: tclientDataSet;
    procedure InisialisasiBarang;
    property CDSBarang: tclientDataSet read GetCDSBarang write FCDSBarang;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCetakBarcode: TfrmCetakBarcode;

implementation

{$R *.dfm}

procedure TfrmCetakBarcode.FormCreate(Sender: TObject);
begin
  InisialisasiBarang;
end;

procedure TfrmCetakBarcode.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

function TfrmCetakBarcode.GetCDSBarang: tclientDataSet;
begin
  if FCDSBarang = nil then
    CDSBarang := TDBUtils.DSToCDS(ClientDataModule.DSDataCLient.DS_BarangLookUp, Self);

  Result := FCDSBarang;
end;

procedure TfrmCetakBarcode.InisialisasiBarang;
begin

end;

end.
