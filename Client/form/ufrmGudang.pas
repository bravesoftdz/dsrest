unit ufrmGudang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxCheckBox, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  Datasnap.DBClient, Datasnap.Provider, System.ImageList, Vcl.ImgList,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, cxClasses, System.Actions, Vcl.ActnList, cxBarEditItem, dxBar,
  dxBarExtDBItems, Vcl.ExtCtrls, dxStatusBar, dxBarBuiltInMenu, cxContainer,
  cxTextEdit, Vcl.StdCtrls, cxPC, cxGridLevel, ClientModule, uModel;

type
  TfrmGudang = class(TfrmDefault)
    cxPCInput: TcxPageControl;
    Input: TcxTabSheet;
    lblKode: TLabel;
    lblNama: TLabel;
    edKode: TcxTextEdit;
    edNama: TcxTextEdit;
    cxGridDBGudang: TcxGrid;
    cxGridDBTableGudang: TcxGridDBTableView;
    cxgrdbclmnGridDBTableGudangColumnKode: TcxGridDBColumn;
    cxgrdbclmnGridDBTableGudangColumnNama: TcxGridDBColumn;
    cxgrdlvlGudang: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
    procedure ActionBaruExecute(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
  private
    FGudang: TGudang;
    function GetGudang: TGudang;
    { Private declarations }
  public
    property Gudang: TGudang read GetGudang write FGudang;
    { Public declarations }
  end;

var
  frmGudang: TfrmGudang;

implementation

{$R *.dfm}

procedure TfrmGudang.FormCreate(Sender: TObject);
begin
  inherited;
  ActionBaruExecute(Sender);
end;

procedure TfrmGudang.ActionBaruExecute(Sender: TObject);
begin
  inherited;
  edKode.Text := '';
  edNama.Text := '';
end;

procedure TfrmGudang.ActionSimpanExecute(Sender: TObject);
begin
  inherited;
  try
    Gudang.Kode := edKode.Text;
    Gudang.Nama := edNama.Text;
    Gudang.Cabang := TCabang.CreateID(ClientDataModule.Cabang.ID);

    if ClientDataModule.ServerGudangClient.Save(FGudang) then
      ActionBaruExecute(Sender);
  finally
    FreeAndNil(FGudang);
  end;
end;

function TfrmGudang.GetGudang: TGudang;
begin
  if FGudang = nil then
    FGudang := TGudang.Create;

  Result := FGudang;
end;

end.
