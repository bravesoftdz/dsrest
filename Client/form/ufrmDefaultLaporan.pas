unit ufrmDefaultLaporan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, Vcl.Menus, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, System.ImageList, Vcl.ImgList, Datasnap.DBClient,
  Datasnap.Provider, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, System.Actions, Vcl.ActnList, cxCheckBox, cxGridLevel, cxClasses,
  cxGridCustomView, Vcl.StdCtrls, cxButtons, Vcl.ComCtrls, Vcl.ExtCtrls, cxPC,
  dxStatusBar, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox, ClientModule,
  uAppUtils, uDBUtils, uDMReport, Data.FireDACJSONReflect, System.DateUtils;

type
  TfrmDefaultLaporan = class(TfrmDefault)
    cbbGudang: TcxExtLookupComboBox;
    lblGudang: TLabel;
    lblCabang: TLabel;
    cbbCabang: TcxExtLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure cbbCabangPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    { Private declarations }
  protected
    FCDSCabang: tclientDataSet;
    FCDSGudang: tclientDataSet;
    procedure InisialisasiGudang;
    procedure InisialisasiCabang;
  public
    { Public declarations }
  end;

var
  frmDefaultLaporan: TfrmDefaultLaporan;

implementation

{$R *.dfm}

procedure TfrmDefaultLaporan.cbbCabangPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  FCDSGudang.Filtered := False;
  FCDSGudang.Filter   := 'cabang = ' + QuotedStr(cbbCabang.EditValue);
  FCDSGudang.Filtered := True;
end;

procedure TfrmDefaultLaporan.FormCreate(Sender: TObject);
begin
  inherited;
  dtpAwal.DateTime := StartOfTheMonth(Now);
  dtpAkhir.DateTime := EndOfTheDay(Now);

  InisialisasiGudang;
  InisialisasiCabang;
end;

procedure TfrmDefaultLaporan.InisialisasiGudang;
begin
  with ClientDataModule.DSDataCLient do
  begin
    FCDSGudang := TDBUtils.DSToCDS(DS_GudangLookUp(), Self);
    cbbGudang.Properties.LoadFromCDS(FCDSGudang, 'id','nama',['id','cabang'], Self);
    cbbGudang.Properties.SetMultiPurposeLookup();
  end;
end;

procedure TfrmDefaultLaporan.InisialisasiCabang;
begin
  with ClientDataModule.DSDataCLient do
  begin
    FCDSCabang := TDBUtils.DSToCDS(DS_CabangLookUp(), Self);
    cbbCabang.Properties.LoadFromCDS(FCDSCabang, 'id','cabang',['id'], Self);
    cbbCabang.Properties.SetMultiPurposeLookup();

    cbbCabang.EditValue := ClientDataModule.Cabang.ID;
  end;
end;

end.
