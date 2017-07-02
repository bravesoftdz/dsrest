unit ufrmLapPenerimaanBarang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultLaporan, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu,
  Vcl.Menus, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, System.ImageList, Vcl.ImgList,
  Datasnap.DBClient, Datasnap.Provider, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, System.Actions, Vcl.ActnList, cxCheckBox,
  cxGridLevel, cxClasses, cxGridCustomView, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  Vcl.StdCtrls, cxButtons, Vcl.ComCtrls, Vcl.ExtCtrls,
  cxPC, dxStatusBar,ClientModule,ClientClassesUnit2, uDBUtils, uModel, uAppUtils;

type
  TfrmLapPenerimaanBarang = class(TfrmDefaultLaporan)
    procedure ActionRefreshExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLapPenerimaanBarang: TfrmLapPenerimaanBarang;

implementation

{$R *.dfm}

procedure TfrmLapPenerimaanBarang.ActionRefreshExecute(Sender: TObject);
var
  lcds: tclientDataSet;
begin
  inherited;
  with TServerLaporanClient.Create(ClientDataModule.DSRestConnection, False) do
  begin
    try
      if chkKonsolidasi1.Checked then
        lcds := TDBUtils.DSToCDS(LaporanPenerimaanBarang(dtpAwal.DateTime, dtpAkhir.DateTime, nil, nil), cxGridDBTableOverview)
      else
        lcds := TDBUtils.DSToCDS(LaporanPenerimaanBarang(dtpAwal.DateTime, dtpAkhir.DateTime, TCabang.CreateID(cbbCabang.EditValue), TGudang.CreateID(cbbGudang.EditValue)), cxGridDBTableOverview);

      cxGridDBTableOverview.SetDataset(lcds, True);
      cxGridDBTableOverview.SetVisibleColumns(['GUDANG','KODEGUDANG','KODECABANG','URUTAN', 'CABANG'], False);
      cxGridDBTableOverview.ApplyBestFit();
    finally
      Free;
    end;
  end;
end;

end.
