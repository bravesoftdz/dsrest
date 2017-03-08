unit ufrmLookUpTransaksi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.ExtCtrls, Vcl.StdCtrls;

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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    class function LookUp: string;
    { Public declarations }
  end;

var
  frmLookUpTransaksi: TfrmLookUpTransaksi;
  StringResult      : string;

implementation
uses
  System.DateUtils, uDBUtils;

{$R *.dfm}

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

class function TfrmLookUpTransaksi.LookUp: string;
begin
  frmLookUpTransaksi := TfrmLookUpTransaksi.Create(nil);
  try
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
