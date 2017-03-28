unit ufrmLaporanAR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultLaporan, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu,
  Vcl.Menus, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, Data.DB, cxDBData, cxContainer, System.ImageList, Vcl.ImgList,
  Datasnap.DBClient, Datasnap.Provider, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, System.Actions, Vcl.ActnList, cxCheckBox,
  cxGridLevel, cxClasses, cxGridCustomView, Vcl.StdCtrls, cxButtons,
  Vcl.ComCtrls, Vcl.ExtCtrls, cxPC, dxStatusBar;

type
  TfrmLaporanAR = class(TfrmDefaultLaporan)
    chkJatuhTempo: TcxCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLaporanAR: TfrmLaporanAR;

implementation

{$R *.dfm}

end.
