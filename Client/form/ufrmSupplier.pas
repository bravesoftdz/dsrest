unit ufrmSupplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDefault, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxClasses, ActnList, dxBar, ExtCtrls,
  dxStatusBar, cxContainer, cxEdit, cxTextEdit, StdCtrls,  ClientClassesUnit2, ClientModule,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxGridCustomView, cxGrid, Grids, DBGrids, DBClient, Provider,
  cxPCdxBarPopupMenu, cxPC, cxMemo, ImgList, uModel, cxNavigator, System.Actions,
  dxBarExtDBItems, cxCheckBox, dxBarBuiltInMenu, System.ImageList, cxBarEditItem;

type
  TfrmSupplier = class(TfrmDefault)
    cxGridDBTableSupplier: TcxGridDBTableView;
    cxgrdlvlSupplier: TcxGridLevel;
    cxGridDBSupplier: TcxGrid;
    cxPCInput: TcxPageControl;
    Input: TcxTabSheet;
    lblKode: TLabel;
    lblNama: TLabel;
    edKode: TcxTextEdit;
    edNama: TcxTextEdit;
    cxgrdbclmnGridDBTableSupplierColumnKode: TcxGridDBColumn;
    cxgrdbclmnGridDBTableSupplierColumnNama: TcxGridDBColumn;
    cxgrdbclmnGridDBTableSupplierColumnAlamat: TcxGridDBColumn;
    lblAlamat: TLabel;
    memAlamt: TcxMemo;
    procedure FormCreate(Sender: TObject);
    procedure ActionBaruExecute(Sender: TObject);
    procedure ActionHapusExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
    procedure cxGridDBTableSupplierCellDblClick(Sender: TcxCustomGridTableView;
        ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
        TShiftState; var AHandled: Boolean);
    procedure cxGridDBTableSupplierEditing(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; var AAllow: Boolean);
  private
    FSupplier: TSupplier;
    function GetSupplier: TSupplier;
//    FSupplier: TSupplier;
//    function GetSupplier: TSupplier;
    { Private declarations }
  public
    property Supplier: TSupplier read GetSupplier write FSupplier;
//    property Supplier: TSupplier read GetSupplier write FSupplier;
    { Public declarations }
  end;

var
  frmSupplier: TfrmSupplier;

implementation

uses
  uDBUtils, uAppUtils;

{$R *.dfm}

procedure TfrmSupplier.FormCreate(Sender: TObject);
begin
  inherited;
  ActionBaruExecute(Sender);
end;

procedure TfrmSupplier.ActionBaruExecute(Sender: TObject);
begin
  inherited;
  edKode.Text := '';
  edNama.Text := '';

  memAlamt.Clear;
  FID         := '';
end;

procedure TfrmSupplier.ActionHapusExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Anda yakin akan menghapus Data ?') then
    Exit;

  with TServerSupplierClient.Create(ClientDataModule.DSRestConnection, False) do
  begin
    try
      if Delete(Supplier) then
      begin
        ActionBaruExecute(Sender);
        ActionRefreshExecute(Sender);
      end;
    finally
      FreeAndNil(FSupplier);
      Free;
    end;
  end;
end;

procedure TfrmSupplier.ActionRefreshExecute(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := 'select * from ' + TSupplier.ClassName;
  TDBUtils.DataSetToCxDBGrid(TDBUtils.OpenDataset(sSQL), cxGridDBTableSupplier);
end;

procedure TfrmSupplier.ActionSimpanExecute(Sender: TObject);
begin
  inherited;
  with TServerSupplierClient.Create(ClientDataModule.DSRestConnection, False) do
  begin
    try
      Supplier.ID     := FID;
      Supplier.Kode   := edKode.Text;
      Supplier.Nama   := edNama.Text;
      Supplier.Alamat := memAlamt.Text;

      if Save(Supplier) then
      begin
        ActionBaruExecute(Sender);
        ActionRefreshExecute(Sender);
      end;
    finally
     FreeAndNil(FSupplier);
     Free;
    end;
  end;
end;

procedure TfrmSupplier.cxGridDBTableSupplierCellDblClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  with TServerSupplierClient.Create(ClientDataModule.DSRestConnection, False) do
  begin
    try
      if cxGridDBTableSupplier.DataController.FocusedRecordIndex >= 0 then
      begin
        FreeAndNil(FSupplier);
        FSupplier := Retrieve(cxGridDBTableSupplier.DataController.DataSource.DataSet.FieldByName('ID').AsString);

        edKode.Text   := FSupplier.Kode;
        edNama.Text   := FSupplier.Nama;
        memAlamt.Text := FSupplier.Alamat;
        FID           := FSupplier.ID;
      end;

    finally
      Free;
    end;
  end;
end;

procedure TfrmSupplier.cxGridDBTableSupplierEditing(Sender:
    TcxCustomGridTableView; AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  inherited;
  AAllow := False;
end;

function TfrmSupplier.GetSupplier: TSupplier;
begin
  if FSupplier = nil then
    FSupplier := TSupplier.Create;

  Result := FSupplier;
end;


end.
