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
  dxBarExtItems, Vcl.Menus, cxButtons, Vcl.ComCtrls, uInterface, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, uSupplier, uAccount;

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
    edAkunHutang: TcxTextEdit;
    cbbAkunHutang: TcxExtLookupComboBox;
    lblParent: TLabel;
    lblAkunPiutang: TLabel;
    cbbAkunPiutang: TcxExtLookupComboBox;
    edAkunPiutang: TcxTextEdit;
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
    procedure cbbAkunHutangPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cbbAkunPiutangPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    cdsAccount: tclientDataSet;
    FSupplier: TSupplier;
    function GetSupplier: TSupplier;
    procedure InisialisasiCBBAccount;
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

  InisialisasiCBBAccount;
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
  sSQL := 'select * from vBusinessPartner order by nama';
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
      Supplier.AkunHutang := TAccount.CreateID(cbbAkunHutang.EditValue);
      Supplier.AkunPiutang:= TAccount.CreateID(cbbAkunPiutang.EditValue);

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

procedure TfrmSupplier.cbbAkunHutangPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  edAkunHutang.Text := cdsAccount.FieldByName('nama').AsString;
end;

procedure TfrmSupplier.cbbAkunPiutangPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  edAkunPiutang.Text := cdsAccount.FieldByName('nama').AsString;
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

procedure TfrmSupplier.InisialisasiCBBAccount;
begin
  cdsAccount := TDBUtils.OpenDataset('Select ID,Kode,Nama' +
                               ' From TAccount' +
                               ' where isakuntransaksi = 1' +
                               ' order by kode ');

  cbbAkunHutang.Properties.LoadFromCDS(cdsAccount,'ID','Kode',['ID'],Self);
  cbbAkunHutang.Properties.SetMultiPurposeLookup;

  cbbAkunPiutang.Properties.LoadFromCDS(cdsAccount,'ID','Kode',['ID'],Self);
  cbbAkunPiutang.Properties.SetMultiPurposeLookup;
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

    try
      cbbAkunHutang.EditValue  := FSupplier.AkunHutang.ID;
      cdsAccount.Filtered      := False;
      cdsAccount.Filter        := ' id = ' + QuotedStr(FSupplier.AkunHutang.ID);
      cdsAccount.Filtered      := True;
      edAkunHutang.Text        := cdsAccount.FieldByName('nama').AsString;

      cbbAkunPiutang.EditValue := FSupplier.AkunPiutang.ID;
      cdsAccount.Filtered      := False;
      cdsAccount.Filter        := ' id = ' + QuotedStr(FSupplier.AkunPiutang.ID);
      cdsAccount.Filtered      := True;
      edAkunPiutang.Text       := cdsAccount.FieldByName('nama').AsString;
    finally
      cdsAccount.Filtered      := False;
    end;

  except
    raise
  end;

  Result := True;
end;


end.
