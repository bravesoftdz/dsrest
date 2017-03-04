unit ufrmPilihGrid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.CheckLst,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid;

type
  TfrmPilihGrid = class(TForm)
    chklstGrid: TCheckListBox;
    pnlButton: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  protected

  public
    class function ShowPilihGrid(AForm : TForm): TStrings;
    { Public declarations }
  end;

var
  frmPilihGrid: TfrmPilihGrid;

implementation
var
  GridTerpilih : TStrings;

{$R *.dfm}

procedure TfrmPilihGrid.FormCreate(Sender: TObject);
begin
  GridTerpilih := TStringList.Create;
end;

procedure TfrmPilihGrid.btnOKClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to chklstGrid.Items.Count - 1 do
  begin
    if chklstGrid.Checked[i] then
    begin
      GridTerpilih.Add(chklstGrid.Items[i]);
    end;
  end;
end;

class function TfrmPilihGrid.ShowPilihGrid(AForm : TForm): TStrings;
var
  I: Integer;
begin
  frmPilihGrid := TfrmPilihGrid.Create(Application);
  Result := GridTerpilih;

  for I := 0 to AForm.ComponentCount - 1 do
  begin
    if AForm.Components[i] is TcxGridDBTableView then
    begin
      if AForm.Components[i].Tag = 0 then
      begin
        frmPilihGrid.chklstGrid.Items.Add(AForm.Components[i].Name);
      end;
    end;

  end;
  frmPilihGrid.ShowModal;
end;

end.
