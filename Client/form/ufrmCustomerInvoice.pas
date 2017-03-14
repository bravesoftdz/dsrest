unit ufrmCustomerInvoice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxCheckBox, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  System.ImageList, Vcl.ImgList, Datasnap.DBClient, Datasnap.Provider,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, System.Actions, Vcl.ActnList, dxBar, dxBarExtItems,
  cxBarEditItem, dxBarExtDBItems, Vcl.ExtCtrls, dxStatusBar, Vcl.StdCtrls,
  cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, cxMemo, cxDropDownEdit,
  cxCalendar, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  cxTextEdit, uCustomerInvoice, ClientModule,uModel, uAR;

type
  TfrmCustomerInvoice = class(TfrmDefault)
    pnlTransaksi: TPanel;
    pnlHeader: TPanel;
    lblNoBukti: TLabel;
    lblCustomer: TLabel;
    lblJatuhTempo: TLabel;
    lblKeterangan: TLabel;
    edNoBukti: TcxTextEdit;
    cbbCustomer: TcxExtLookupComboBox;
    edJthTempo: TcxDateEdit;
    memKeterangan: TcxMemo;
    lblTglBukti: TLabel;
    edTglBukti: TcxDateEdit;
    procedure ActionBaruExecute(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    FCustomerInvoice: TCustomerInvoice;
    function GetCustomerInvoice: TCustomerInvoice;
    procedure InisialisasiCBBSalesman;
    property CustomerInvoice: TCustomerInvoice read GetCustomerInvoice write
        FCustomerInvoice;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCustomerInvoice: TfrmCustomerInvoice;

implementation
uses
  uDBUtils, uAppUtils;

{$R *.dfm}

procedure TfrmCustomerInvoice.ActionBaruExecute(Sender: TObject);
begin
  inherited;
  FreeAndNil(FCustomerInvoice);
  edNoBukti.Text  := '';
  edTglBukti.Date := Now;
  edJthTempo.Date := Now + 7;


  memKeterangan.Clear;
end;

procedure TfrmCustomerInvoice.ActionSimpanExecute(Sender: TObject);
begin
  inherited;

  CustomerInvoice.NoBukti    := edNoBukti.Text;
  CustomerInvoice.TglBukti   := edTglBukti.Date;
  CustomerInvoice.JatuhTempo := edJthTempo.Date;
  CustomerInvoice.Keterangan := memKeterangan.Text;
  CustomerInvoice.Customer   := TSupplier.CreateID(cbbCustomer.EditValue);
  CustomerInvoice.AR         := TAR.CreateID(cbbCustomer.EditValue);
  CustomerInvoice.Cabang     := TCabang.CreateID(cbbLUCabang.KeyValue);

  if ClientDataModule.ServerCustomerInvoiceClient.Save(CustomerInvoice) then
  begin
    TAppUtils.InformationBerhasilSimpan;
    ActionBaruExecute(Sender);
  end;
end;

procedure TfrmCustomerInvoice.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(FCustomerInvoice);
end;

procedure TfrmCustomerInvoice.FormShow(Sender: TObject);
begin
  inherited;
  InisialisasiCBBSalesman;
  ActionBaruExecute(Sender);
end;

function TfrmCustomerInvoice.GetCustomerInvoice: TCustomerInvoice;
begin
  if FCustomerInvoice =nil then
    FCustomerInvoice := TCustomerInvoice.Create;

  Result := FCustomerInvoice;
end;

procedure TfrmCustomerInvoice.InisialisasiCBBSalesman;
var
  lCDSSalesman: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select Nama,Kode,ID from TSupplier where issalesman = 1';
  lCDSSalesman := TDBUtils.OpenDataset(sSQL);
  cbbCustomer.Properties.LoadFromCDS(lCDSSalesman,'ID','Nama',['ID'],Self);
  cbbCustomer.Properties.SetMultiPurposeLookup;
end;

end.
