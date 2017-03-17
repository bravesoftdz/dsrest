unit ufrmLookUpTransaksi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.ExtCtrls, Vcl.StdCtrls, Datasnap.Provider, Datasnap.DBClient, ClientModule;

type
  TfrmLookUpTransaksi = class(TForm)
    pnlHeader: TPanel;
    pnlBottom: TPanel;
    cxGrid: TcxGrid;
    cxGridDBTableGrdBrowse: TcxGridDBTableView;
    cxGridDBTableGrdDetail: TcxGridDBTableView;
    cxgrdlvlMaster: TcxGridLevel;
    lblBulan: TLabel;
    lblTahun: TLabel;
    cbbBulan: TComboBox;
    cbbTahun: TComboBox;
    btnCari: TButton;
    btnOK: TButton;
    btnCancel: TButton;
    cdsLookUp: TClientDataSet;
    dtstprvdrLookUp: TDataSetProvider;
    procedure btnCariClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

    { Private declarations }
  public
    FJenisTransaksi: string;
    class function LookUp(ACaption : String; AJenisTransaksi : String): string;
    { Public declarations }
  end;

var
  frmLookUpTransaksi: TfrmLookUpTransaksi;
  StringResult      : string;

implementation
uses
  System.DateUtils, uDBUtils, uAppUtils, uModel;

{$R *.dfm}

procedure TfrmLookUpTransaksi.btnCariClick(Sender: TObject);
var
  iBulan: Integer;
  iTahun: Integer;
begin
  iBulan := cbbBulan.ItemIndex + 1;
  iTahun := StrToIntDef(cbbTahun.Text, 1900);

  try
    cdsLookUp.Close;

    if FJenisTransaksi = TPenerimaanBarang.ClassName then
      dtstprvdrLookUp.DataSet := ClientDataModule.ServerLaporanClient.LookUpPenerimaan(iBulan,iTahun);

    cdsLookUp.Open;
  except
    on E : Exception do
    begin
      TAppUtils.Error(E.Message);
    end;
  end;

  cxGridDBTableGrdBrowse.SetDataset(cdsLookUp, True);
  cxGridDBTableGrdBrowse.SetVisibleColumns(['ID'], False);
  cxGridDBTableGrdBrowse.ApplyBestFit();

end;

procedure TfrmLookUpTransaksi.btnOKClick(Sender: TObject);
begin
  StringResult := cxGridDBTableGrdBrowse.DataController.DataSet.FieldByName('ID').AsString;
end;

procedure TfrmLookUpTransaksi.FormCreate(Sender: TObject);
var
  I: Integer;
  iTahun: Integer;
begin
  iTahun := CurrentYear - 5;
  for I := 1 to 10 do
  begin
    cbbTahun.Items.Add(IntToStr(iTahun + i));
  end;

  cbbBulan.ItemIndex := MonthOf(Now) - 1;
  cbbTahun.ItemIndex := cbbTahun.Items.IndexOf(IntToStr(CurrentYear));
end;

class function TfrmLookUpTransaksi.LookUp(ACaption : String; AJenisTransaksi :
    String): string;
begin
  frmLookUpTransaksi := TfrmLookUpTransaksi.Create(nil);
  try
    frmLookUpTransaksi.Caption         := ACaption;
    frmLookUpTransaksi.FJenisTransaksi := AJenisTransaksi;

    frmLookUpTransaksi.ShowModal;
    if frmLookUpTransaksi.ModalResult = mrOk then
      Result := StringResult
    else
      Result := '';

  finally
    frmLookUpTransaksi.Free;
  end;


end;

end.
