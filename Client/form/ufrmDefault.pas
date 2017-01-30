unit ufrmDefault;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, cxClasses, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxStatusBar, ActnList, ExtCtrls, cxStyles, cxGrid,
  ImgList, System.Actions;

type
  TfrmDefault = class(TForm)
    dxBarManagerForm: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarLargeButtonNew: TdxBarLargeButton;
    dxBarLargeButtonSave: TdxBarLargeButton;
    dxBarLargeButtonEdit: TdxBarLargeButton;
    dxBarLargeButtonDel: TdxBarLargeButton;
    dxBarLargeButtonRefresh: TdxBarLargeButton;
    cxSBTransaksi: TdxStatusBar;
    ActionListForm: TActionList;
    ActionBaru: TAction;
    ActionSimpan: TAction;
    actCetak: TAction;
    ActionHapus: TAction;
    ActionRefresh: TAction;
    pnlListTransaksi: TPanel;
    splTransaksi: TSplitter;
    cxStyleRepTrans: TcxStyleRepository;
    cxstylGridHeader: TcxStyle;
    cxstylGridOdd: TcxStyle;
    cxstylGridEven: TcxStyle;
    cxGridRepTransaksi: TcxGridViewRepository;
    ilButton: TImageList;
    procedure ActionRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  protected
    FID: string;
  public
    { Public declarations }
  end;

var
  frmDefault: TfrmDefault;

implementation

{$R *.dfm}

procedure TfrmDefault.ActionRefreshExecute(Sender: TObject);
begin
  //
end;

procedure TfrmDefault.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
