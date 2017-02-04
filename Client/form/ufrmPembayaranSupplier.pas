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
  Vcl.ExtCtrls, dxStatusBar, ClientModule, ClientClassesUnit2, uModel,
  cxContainer, cxTextEdit, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TfrmPembayaranSupplier = class(TfrmDefault)
    lblNoBukti: TLabel;
    dtpTglBukti: TDateTimePicker;
    lblTglBukti: TLabel;
    edNoBukti: TcxTextEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPembayaranSupplier: TfrmPembayaranSupplier;

implementation
uses
  uAppUtils, uDBUtils, System.StrUtils, System.DateUtils;

{$R *.dfm}

end.
