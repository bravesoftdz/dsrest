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
  System.ImageList, dxBarExtItems, ufrmPilihGrid, dxBarBuiltInMenu, cxPC,
  Vcl.ComCtrls, Vcl.StdCtrls, cxGridLevel, Vcl.Menus, cxButtons, cxContainer;

type
  TfrmDefault = class(TForm)
    cxSBTransaksi: TdxStatusBar;
    ActionListForm: TActionList;
    ActionBaru: TAction;
    ActionSimpan: TAction;
    actCetak: TAction;
    ActionHapus: TAction;
    ActionRefresh: TAction;
    cxGridRepTransaksi: TcxGridViewRepository;
    cxGridDBTableCabang: TcxGridDBTableView;
    cxGridColCabangKode: TcxGridDBColumn;
    cxGridColCabangNama: TcxGridDBColumn;
    dsCabang: TDataSource;
    DSPCabang: TDataSetProvider;
    cdsCabang: TClientDataSet;
    cxGridDBTableWarehouse: TcxGridDBTableView;
    cxGridColWHKode: TcxGridDBColumn;
    cxGridColWHNama: TcxGridDBColumn;
    actExport: TAction;
    dlgSaveExportExcel: TSaveDialog;
    ilButton: TImageList;
    cxPCData: TcxPageControl;
    cxTSOverview: TcxTabSheet;
    cxTSInputData: TcxTabSheet;
    pnlListTransaksi: TPanel;
    splTransaksi: TSplitter;
    pnlFilter: TPanel;
    lblPeriode: TLabel;
    lblSD: TLabel;
    dtpAwal: TDateTimePicker;
    dtpAkhir: TDateTimePicker;
    cxGrid: TcxGrid;
    cxGridDBTableOverview: TcxGridDBTableView;
    cxgrdlvlMaster: TcxGridLevel;
    btnRefresh: TcxButton;
    pnlButton: TPanel;
    btnBaru: TcxButton;
    btnCetak: TcxButton;
    btnHapus: TcxButton;
    btnExport: TcxButton;
    btnSave: TcxButton;
    chkKonsolidasi1: TcxCheckBox;
    actNextTransaction: TAction;
    procedure actCetakExecute(Sender: TObject);
    procedure actExportExecute(Sender: TObject);
    procedure ActionBaruExecute(Sender: TObject);
    procedure cxPCDataChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function GetcxGridDBTableViewExport(AGridName : String): TcxGridDBTableView;
        virtual;
    procedure InisialisasiCDSCabang;
    { Private declarations }
  protected
    FID: string;
    procedure CetakSlip; virtual;
    function PanjangNoBukti: Integer;
    function User: string;
  public
    { Public declarations }
  end;

var
  frmDefault: TfrmDefault;

implementation
uses
  uAppUtils, uDBUtils, System.DateUtils;

{$R *.dfm}

procedure TfrmDefault.actCetakExecute(Sender: TObject);
begin
  CetakSlip;
end;

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

procedure TfrmDefault.ActionBaruExecute(Sender: TObject);
begin
  dtpAwal.DateTime := StartOfTheMonth(Now);
  dtpAkhir.DateTime:= EndOfTheDay(Now);

  cxPCData.ActivePageIndex := 1;

end;

procedure TfrmDefault.CetakSlip;
begin
  // TODO -cMM: TfrmDefault.CetakSlip default body inserted
end;

procedure TfrmDefault.cxPCDataChange(Sender: TObject);
begin
  btnSave.Enabled    := cxPCData.ActivePageIndex = 1;
  btnHapus.Enabled   := cxPCData.ActivePageIndex = 1;
//  btnCetak.Enabled   := cxPCData.ActivePageIndex = 1;

  btnExport.Enabled  := cxPCData.ActivePageIndex = 0;
  btnRefresh.Enabled := cxPCData.ActivePageIndex = 0;
end;

procedure TfrmDefault.FormCreate(Sender: TObject);
begin
  InisialisasiCDSCabang;
  cxPCDataChange(Sender)
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

//  cbbLUCabang.KeyValue := ClientDataModule.Cabang.ID;
//  cbbLUCabang.Enabled := ClientDataModule.Cabang.IsHO = 1;
//  chkKonsolidasi.EditValue := False;
//  chkKonsolidasi.Enabled := ClientDataModule.Cabang.IsHO = 1;
end;

function TfrmDefault.PanjangNoBukti: Integer;
begin
  Result := 10;
end;

function TfrmDefault.User: string;
begin
  Result := 'AKU';
end;

end.
