unit ufrmPembayaranSupplier;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxCheckBox, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  Datasnap.DBClient, Datasnap.Provider, Vcl.ImgList, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, cxClasses,
  System.Actions, Vcl.ActnList, cxBarEditItem, dxBar, dxBarExtDBItems,
  Vcl.ExtCtrls, dxStatusBar;

type
  TfrmPembayaranSupplier = class(TfrmDefault)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPembayaranSupplier: TfrmPembayaranSupplier;

implementation

{$R *.dfm}

end.
