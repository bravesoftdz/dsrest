unit ufrmAccount;

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
  dxStatusBar, cxTL, cxMaskEdit, cxTLdxBarBuiltInMenu, cxInplaceContainer,
  cxDBTL, cxTLData, ClientModule, uAccount, uAppUtils, uDBUtils;

type
  TfrmAccount = class(TfrmDefault)
    lstAccount: TcxDBTreeList;
    cxdbtrlstclmnKode: TcxDBTreeListColumn;
    cxdbtrlstclmnNama: TcxDBTreeListColumn;
    cxdbtrlstclmnKelompok: TcxDBTreeListColumn;
    cxdbtrlstclmnIsAkunTransaksi: TcxDBTreeListColumn;
    procedure ActionRefreshExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAccount: TfrmAccount;

implementation

{$R *.dfm}

procedure TfrmAccount.ActionRefreshExecute(Sender: TObject);
var
  lcds: TClientDataSet;
begin
  inherited;
  lcds := TDBUtils.DSToCDS(ClientDataModule.ServerLaporanClient.DS_OverviewAccount(), Self);
  if lstAccount.DataController.DataSource = nil then
    lstAccount.DataController.DataSource := TDataSource.Create(lstAccount);

  lstAccount.DataController.DataSource.DataSet := lcds;
  lstAccount.ApplyBestFit;
end;

end.
