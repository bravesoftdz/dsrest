unit ufrmPilihCabang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, StdCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, uModel,
  cxNavigator, ClientModule;

type
  TfrmPilihCabang = class(TForm)
    cbbCabang: TcxExtLookupComboBox;
    lblCabang: TLabel;
    btnPilih: TButton;
    cxGridRepCabang: TcxGridViewRepository;
    cxGridDBTableCabang: TcxGridDBTableView;
    cxgrdbclmnGridDBTableCabangColumnKode: TcxGridDBColumn;
    cxgrdbclmnGridDBTableCabangColumnNama: TcxGridDBColumn;
    procedure btnPilihClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure InisialisasiDataCabang;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPilihCabang: TfrmPilihCabang;

implementation
uses
  uAppUtils, uDBUtils;

{$R *.dfm}

procedure TfrmPilihCabang.btnPilihClick(Sender: TObject);
begin
  TDBUtils.LoadFromDB(ClientDataModule.Cabang, cbbCabang.EditValue);
  TAppUtils.TulisRegistry('Cabang', ClientDataModule.Cabang.ID);
end;

procedure TfrmPilihCabang.FormCreate(Sender: TObject);
begin
  InisialisasiDataCabang;
end;

procedure TfrmPilihCabang.InisialisasiDataCabang;
var
  sSQL: string;
begin
  sSQL := 'select * from tcabang order by Nama';
  cxGridDBTableCabang.SetDataset(sSQL);

end;

end.
