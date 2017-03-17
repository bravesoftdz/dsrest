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
  cxTextEdit, Vcl.StdCtrls, cxPC, cxGridLevel, ClientModule, uModel,
  dxBarExtItems;

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
    procedure ActionHapusExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
    procedure cxGridDBTableGudangCellDblClick(Sender: TcxCustomGridTableView;
        ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
        TShiftState; var AHandled: Boolean);
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
uses
  uDBUtils, uAppUtils;

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
  FID         := '';
end;

procedure TfrmGudang.ActionHapusExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.ConfirmHapus then
    Exit;

  if ClientDataModule.ServerGudangClient.Delete(FGudang) then
      ActionBaruExecute(Sender);
end;

procedure TfrmGudang.ActionRefreshExecute(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := 'select * from ' + TGudang.ClassName;
  if ClientDataModule.Cabang.IsHO <> 1 then
    sSQL := sSQL + ' where cabang = ' + QuotedStr(ClientDataModule.Cabang.ID);

  TDBUtils.DataSetToCxDBGrid(TDBUtils.OpenDataset(sSQL), cxGridDBTableGudang);
end;

procedure TfrmGudang.ActionSimpanExecute(Sender: TObject);
begin
  inherited;
  try
    Gudang.Kode   := edKode.Text;
    Gudang.Nama   := edNama.Text;
    Gudang.ID     := FID;

    Gudang.Cabang := TCabang.CreateID(ClientDataModule.Cabang.ID);

    if ClientDataModule.ServerGudangClient.Save(FGudang) then
      ActionBaruExecute(Sender);
  finally
    FreeAndNil(FGudang);
  end;
end;

procedure TfrmGudang.cxGridDBTableGudangCellDblClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if cxGridDBTableGudang.DataController.FocusedRecordIndex >= 0 then
  begin
    FreeAndNil(FGudang);


    FGudang     := ClientDataModule.ServerGudangClient.Retrieve(cxGridDBTableGudang.DataController.DataSource.DataSet.FieldByName('ID').AsString);
    edKode.Text := Gudang.Kode;
    edNama.Text := Gudang.Nama;
    FID         := Gudang.ID;
  end;

end;

function TfrmGudang.GetGudang: TGudang;
begin
  if FGudang = nil then
    FGudang := TGudang.Create;

  Result := FGudang;
end;

end.
