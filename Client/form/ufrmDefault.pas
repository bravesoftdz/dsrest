unit ufrmDefault;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, cxClasses, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxStatusBar, ActnList, ExtCtrls, cxStyles, cxGrid,
  ImgList, System.Actions, dxBarExtDBItems, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, Datasnap.DBClient,
  Datasnap.Provider, ClientModule, ClientClassesUnit2, uModel, cxCheckBox,
  cxBarEditItem, cxDBExtLookupComboBox, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPrnDlg, dxPgsDlg, dxPSCore;

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
    cbbLUCabang: TdxBarLookupCombo;
    cxGridDBTableCabang: TcxGridDBTableView;
    cxGridColCabangKode: TcxGridDBColumn;
    cxGridColCabangNama: TcxGridDBColumn;
    dsCabang: TDataSource;
    DSPCabang: TDataSetProvider;
    cdsCabang: TClientDataSet;
    chkKonsolidasi: TcxBarEditItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure InisialisasiCDSCabang;
    { Private declarations }
  protected
    FID: string;
  public
    { Public declarations }
  end;

var
  frmDefault: TfrmDefault;

implementation
uses
  uAppUtils, uDBUtils;

{$R *.dfm}

procedure TfrmDefault.FormCreate(Sender: TObject);
begin
  InisialisasiCDSCabang;
end;

procedure TfrmDefault.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmDefault.InisialisasiCDSCabang;
var
  sSQL: string;
begin
  sSQL := 'select * from tcabang';
  dsCabang.DataSet := TDBUtils.OpenDataset(sSQL);

  cbbLUCabang.KeyValue := ClientDataModule.Cabang.ID;
  cbbLUCabang.Enabled := ClientDataModule.Cabang.IsHO = 1;
  chkKonsolidasi.EditValue := False;
  chkKonsolidasi.Enabled := ClientDataModule.Cabang.IsHO = 1;
end;

end.
