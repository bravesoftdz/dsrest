unit ufrmClosingInventory;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.ImgList, cxGrid, cxStyles,
  cxClasses, System.Actions, Vcl.ActnList, dxBar, Vcl.ExtCtrls, dxStatusBar, ClientModule, ClientClassesUnit2, uModel,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, Datasnap.DBClient, Datasnap.Provider, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, dxBarExtDBItems;

type
  TfrmClosingInventory = class(TfrmDefault)
    procedure ActionSimpanExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClosingInventory: TfrmClosingInventory;

implementation
uses
  uAppUtils, uDBUtils, System.DateUtils, System.StrUtils;

{$R *.dfm}

procedure TfrmClosingInventory.ActionSimpanExecute(Sender: TObject);
begin
  inherited;

  with TServerClosingInventoryClient.Create(ClientDataModule.DSRestConnection, False) do
  begin
    Close(201701, TCabang.CreateID(ClientDataModule.Cabang.ID));
  end;
end;

end.
