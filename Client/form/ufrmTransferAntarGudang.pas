unit ufrmTransferAntarGudang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uModel, uTransferAntarGudang, uAppUtils, uDBUtils,
  ufrmDefault, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, Vcl.Menus, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  System.ImageList, Vcl.ImgList, Datasnap.DBClient, Datasnap.Provider,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  System.Actions, Vcl.ActnList, cxCheckBox, cxGridLevel, cxClasses,
  cxGridCustomView, Vcl.StdCtrls, cxButtons, Vcl.ComCtrls, Vcl.ExtCtrls, cxPC,
  dxStatusBar, uInterface, dxCore, cxDateUtils, cxMemo, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, cxMaskEdit, cxCalendar,
  cxTextEdit, ClientModule;

type
  TfrmTransferAntarGudang = class(TfrmDefault, IForm)
    lblNoBukti: TLabel;
    edNoBukti: TcxTextEdit;
    lblTglBukti: TLabel;
    edTglBukti: TcxDateEdit;
    lblSupplier: TLabel;
    cbbGudangAsal: TcxExtLookupComboBox;
    lblPembeli: TLabel;
    cbbGudangTujuan: TcxExtLookupComboBox;
    memKeterangan: TcxMemo;
    lblKeterangan: TLabel;
    lblPetugas: TLabel;
    edPetugas: TcxTextEdit;
    procedure ActionBaruExecute(Sender: TObject);
    procedure ActionSimpanExecute(Sender: TObject);
  strict private
  private
    FTransferAntarGudang: TTransferAntarGudang;
    function GetTransferAntarGudang: TTransferAntarGudang;
    property TransferAntarGudang: TTransferAntarGudang read GetTransferAntarGudang
        write FTransferAntarGudang;
    { Private declarations }
  public
    destructor Destroy; override;
    function LoadData(AID : String): Boolean; stdcall;
    { Public declarations }
  end;

var
  frmTransferAntarGudang: TfrmTransferAntarGudang;

implementation

{$R *.dfm}

destructor TfrmTransferAntarGudang.Destroy;
begin
  inherited;
  FreeAndNil(FTransferAntarGudang);
end;

procedure TfrmTransferAntarGudang.ActionBaruExecute(Sender: TObject);
begin
  inherited;
  LoadData('');
  cxPCData.ActivePageIndex := 1;
end;

procedure TfrmTransferAntarGudang.ActionSimpanExecute(Sender: TObject);
begin
  inherited;

  if not ValidateEmptyCtrl([1]) then
    Exit;

  edNoBukti.Text                    := ClientDataModule.ServerTransferAntarGudang.GenerateNoBukti(edTglBukti.Date, 'TAG');
  FTransferAntarGudang.NoBukti      := edNoBukti.Text;
  FTransferAntarGudang.TglBukti     := edTglBukti.Date;
  FTransferAntarGudang.GudangAsal   := TGudang.CreateID(cbbGudangAsal.EditValue);
  FTransferAntarGudang.GudangTujuan := TGudang.CreateID(cbbGudangTujuan.EditValue);
  FTransferAntarGudang.Petugas      := edPetugas.Text;
  FTransferAntarGudang.Keterangan   := memKeterangan.Text;

  if ClientDataModule.ServerTransferAntarGudang.Save(TransferAntarGudang) then
  begin
    TAppUtils.Information('Berhasil Simpan Dengan No Bukti ' + edNoBukti.Text);
    ActionBaruExecute(Sender);
  end;
end;

function TfrmTransferAntarGudang.GetTransferAntarGudang: TTransferAntarGudang;
begin
  if FTransferAntarGudang = nil then
    FTransferAntarGudang := TTransferAntarGudang.Create;

  Result := FTransferAntarGudang;
end;

function TfrmTransferAntarGudang.LoadData(AID : String): Boolean;
begin
  Result := False;

  try
    ClearByTag([0,1]);
    edNoBukti.Text  := 'Otomatis';
    memKeterangan.Clear;

    FreeAndNil(FTransferAntarGudang);
    FTransferAntarGudang := ClientDataModule.ServerTransferAntarGudang.Retrieve(AID);

    if FTransferAntarGudang = nil then
      Exit;

    if FTransferAntarGudang.ID = '' then
      Exit;

    edNoBukti.Text            := FTransferAntarGudang.NoBukti;
    edTglBukti.Date           := FTransferAntarGudang.TglBukti;
    cbbGudangAsal.EditValue   := FTransferAntarGudang.GudangAsal.ID;
    cbbGudangTujuan.EditValue := FTransferAntarGudang.GudangTujuan.ID;
    edPetugas.Text            := FTransferAntarGudang.Petugas;
    memKeterangan.Text        := FTransferAntarGudang.Keterangan;

    Result                    := True;
  except
    raise;
  end;
end;

end.
