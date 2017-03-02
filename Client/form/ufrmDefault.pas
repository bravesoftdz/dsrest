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
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPrnDlg, dxPgsDlg, dxPSCore,
  System.ImageList, dxBarExtItems, ufrmPilihGrid;

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
    cbbLUCabang: TdxBarLookupCombo;
    cxGridDBTableCabang: TcxGridDBTableView;
    cxGridColCabangKode: TcxGridDBColumn;
    cxGridColCabangNama: TcxGridDBColumn;
    dsCabang: TDataSource;
    DSPCabang: TDataSetProvider;
    cdsCabang: TClientDataSet;
    chkKonsolidasi: TcxBarEditItem;
    cxGridDBTableWarehouse: TcxGridDBTableView;
    cxGridColWHKode: TcxGridDBColumn;
    cxGridColWHNama: TcxGridDBColumn;
    dxbrbtn1: TdxBarButton;
    dxbrlrgbtn1: TdxBarLargeButton;
    actExport: TAction;
    dxbrstc1: TdxBarStatic;
    dlgSaveExportExcel: TSaveDialog;
    ilButton: TImageList;
    dxbrcmb1: TdxBarCombo;
    procedure actExportExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function GetcxGridDBTableViewExport(AGridName : String): TcxGridDBTableView;
        virtual;
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

procedure TfrmDefault.actExportExecute(Sender: TObject);
var
  cxGridDBTableView: TcxGridDBTableView;
  I: Integer;
  lDaftarGrids: TStrings;
begin
  lDaftarGrids := TfrmPilihGrid.ShowPilihGrid(Self);
  try
    for I := 0 to lDaftarGrids.Count - 1 do
    begin
      cxGridDBTableView := GetcxGridDBTableViewExport(lDaftarGrids[i]);
      if cxGridDBTableView <> nil then
      begin
        if dlgSaveExportExcel.Execute then
        begin
          cxGridDBTableView.ExportToXLS(dlgSaveExportExcel.FileName);
        end;
      end;
    end;
  finally
    lDaftarGrids.Free;
  end;
end;

procedure TfrmDefault.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  InisialisasiCDSCabang;

  for I := 0 to cxGridRepTransaksi.Count  do
  begin
    cxGridRepTransaksi.Items[i].Tag := 99;
  end;
end;

procedure TfrmDefault.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

function TfrmDefault.GetcxGridDBTableViewExport(AGridName : String):
    TcxGridDBTableView;
var
  I: Integer;
begin
  Result := nil;

  for I := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TcxGridDBTableView) and (Components[i].Name = AGridName) then
    begin
      Result := Components[i] as TcxGridDBTableView;
      Exit;
    end;
  end;
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
