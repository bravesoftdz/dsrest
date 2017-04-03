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
  dxBarExtDBItems, cxCheckBox, dxBarBuiltInMenu, System.ImageList, cxBarEditItem,
  dxBarExtItems, Vcl.Menus, cxButtons, Vcl.ComCtrls, uInterface;

type
  TfrmSupplier = class(TfrmDefault, IForm)
    lblKode: TLabel;
    lblNama: TLabel;
    lblAlamat: TLabel;
    edKode: TcxTextEdit;
    edNama: TcxTextEdit;
    memAlamt: TcxMemo;
    grpRole: TGroupBox;
    chkSupplier: TCheckBox;
    chkPembeli: TCheckBox;
    chkSalesman: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ActionBaruExecute(Sender: TObject);
    procedure ActionHapusExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
    procedure cxGridDBTableOverviewCellDblClick(Sender: TcxCustomGridTableView;
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
    function LoadData(AID : String): Boolean; stdcall;
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
  LoadData('');
  cxPCData.ActivePageIndex := 1;
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
  sSQL := 'select * from vBusinessPartner';
  cxGridDBTableOverview.SetDataset(sSQL, True);
  cxGridDBTableOverview.SetVisibleColumns(['ID'], False);
  cxGridDBTableOverview.ApplyBestFit();
end;

procedure TfrmSupplier.ActionSimpanExecute(Sender: TObject);
begin
  inherited;
  if not ValidateEmptyCtrl([1]) then
    Exit;

  if chkSupplier.Checked = chkPembeli.Checked = chkSalesman.Checked = False then
  begin
    TAppUtils.Warning('Role Belum Diset');
    Exit;
  end;

  with TServerSupplierClient.Create(ClientDataModule.DSRestConnection, False) do
  begin
    try
      Supplier.Kode       := edKode.Text;
      Supplier.Nama       := edNama.Text;
      Supplier.Alamat     := memAlamt.Text;
      Supplier.IsSupplier := TAppUtils.BoolToInt(chkSupplier.Checked);
      Supplier.IsPembeli  := TAppUtils.BoolToInt(chkPembeli.Checked);
      Supplier.IsSalesman := TAppUtils.BoolToInt(chkSalesman.Checked);

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

procedure TfrmSupplier.cxGridDBTableOverviewCellDblClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if LoadData(cxGridDBTableOverview.DS.FieldByName('ID').AsString) then
    cxPCData.ActivePageIndex := 1;

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

function TfrmSupplier.LoadData(AID : String): Boolean;
begin
  Result := False;

  FreeAndNil(FSupplier);
  ClearByTag([0,1]);

  try
    FSupplier := ClientDataModule.ServerSupplierClient.Retrieve(AID);
    if FSupplier =nil then
      Exit;

    if FSupplier.ID = '' then
      Exit;

    edKode.Text              := FSupplier.Kode;
    edNama.Text              := FSupplier.Nama;
    memAlamt.Text            := FSupplier.Alamat;

    chkSupplier.Checked      := FSupplier.IsSupplier =1;
    chkPembeli.Checked       := FSupplier.IsPembeli =1;
    chkSalesman.Checked      := FSupplier.IsSalesman =1;
  except
    raise
  end;

  Result := True;
end;


end.
