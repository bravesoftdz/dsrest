unit ufrmCetakBarcode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxCurrencyEdit,uAppUtils, ClientModule,
  Datasnap.DBClient,uDBUtils, cxSpinEdit, Vcl.Menus, cxButtons,
  uCetakBarcode, uModel, uDMReport, Data.FireDACJSONReflect;

type
  TfrmCetakBarcode = class(TForm)
    lblBarcode: TLabel;
    cbbBarang: TcxExtLookupComboBox;
    cbbSatuanStock: TcxExtLookupComboBox;
    lblSatuanStock: TLabel;
    lblGroup: TLabel;
    cbbBarangNama: TcxExtLookupComboBox;
    lblJumlahLabel: TLabel;
    cxSpinQty: TcxSpinEdit;
    cbbJenisLabel: TcxComboBox;
    bCetak: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbbBarangPropertiesChange(Sender: TObject);
    procedure bCetakClick(Sender: TObject);
    procedure cbbBarangPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    FCDSBarang: tclientDataSet;
    FCDSUOM: tclientDataSet;
    FCetakBarcode: TCetakBarcode;
    function GetCDSBarang: tclientDataSet;
    function GetCDSUOM: tclientDataSet;
    function GetCetakBarcode: TCetakBarcode;
    procedure InisialisasiBarang;
    property CDSBarang: tclientDataSet read GetCDSBarang write FCDSBarang;
    property CDSUOM: tclientDataSet read GetCDSUOM write FCDSUOM;
    property CetakBarcode: TCetakBarcode read GetCetakBarcode write FCetakBarcode;
    { Private declarations }
  protected
    procedure CetakSlip; virtual;
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

procedure TfrmCetakBarcode.bCetakClick(Sender: TObject);
var
  lCBItem: TCetakBarcodeItem;
  I: Integer;
  sNoBukti: string;
begin
  FreeAndNil(FCetakBarcode);

  sNoBukti                := ClientDataModule.ServerCetakBarcodeClient.GenerateNoBukti(Now,'CB');
  CetakBarcode.NoBukti    := sNoBukti;
  CetakBarcode.Tanggal    := Now;
  CetakBarcode.JenisLabel := cbbJenisLabel.Text;

  CetakBarcode.CetakBarcodeItems.Clear;
  for I := 1 to cxSpinQty.Value do
  begin
    lCBItem             := TCetakBarcodeItem.Create;
    lCBItem.Barang      := TBarang.CreateID(cbbBarang.EditValue);
    lCBItem.Qty         := 1;
    CetakBarcode.CetakBarcodeItems.Add(lCBItem);
  end;

  if ClientDataModule.ServerCetakBarcodeClient.Save(CetakBarcode) then
  begin
    CetakBarcode := ClientDataModule.ServerCetakBarcodeClient.RetrieveNoBukti(sNoBukti);
    CetakSlip;
  end;
end;

procedure TfrmCetakBarcode.cbbBarangPropertiesChange(Sender: TObject);
begin
  cbbBarangNama.EditValue := cbbBarang.EditValue;
end;

procedure TfrmCetakBarcode.cbbBarangPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  cbbBarangNama.EditValue := cbbBarang.EditValue;
end;

procedure TfrmCetakBarcode.CetakSlip;
var
  lcds: TFDJSONDataSets;
//  lcds: TClientDataSet;
begin
  inherited;

  with dmReport do
  begin
    AddReportVariable('UserCetak', 'System');

    lcds := ClientDataModule.ServerCetakBarcodeClient.RetrieveCDSlip(CetakBarcode.ID);


    ExecuteReport( 'Reports/Slip_CetakBarcode_Standar' ,
      lcds

    );
  end;
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

function TfrmCetakBarcode.GetCDSUOM: tclientDataSet;
begin
  if FCDSUOM = nil then
    CDSUOM := TDBUtils.DSToCDS(ClientDataModule.DSDataCLient.DS_BarangLookUp, Self);

  Result := FCDSUOM;
end;

function TfrmCetakBarcode.GetCetakBarcode: TCetakBarcode;
begin
  if FCetakBarcode = nil then
    FCetakBarcode := TCetakBarcode.Create;

  Result := FCetakBarcode;
end;

procedure TfrmCetakBarcode.InisialisasiBarang;
begin
  cbbBarang.Properties.LoadFromCDS(CDSBarang,'ID','SKU',['ID','hargajual','diskonmember'],Self);
  cbbBarang.Properties.SetMultiPurposeLookup;

  cbbBarangNama.Properties.LoadFromCDS(CDSBarang,'ID','Nama',['ID','hargajual','diskonmember'],Self);
  cbbBarangNama.Properties.SetMultiPurposeLookup;
end;

end.
