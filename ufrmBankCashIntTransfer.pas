unit ufrmBankCashIntTransfer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxPCdxBarPopupMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxContainer, Menus, cxSplitter, StdCtrls, cxButtons,
  cxCheckBox, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxMemo, cxCalendar, cxTextEdit, cxMaskEdit,
  cxButtonEdit, cxLabel, cxGroupBox, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  ExtCtrls, cxPC, ufrmDefMSC, ImgList, dxBar, cxDBEditRepository, DBClient,uStrUtils,
  DMClient, DMClient_Classes, uModel, cxCurrencyEdit, ERPTSPMVariables, Provider, uDXUtils,
  uAppUtils, uApprovalApp, uReport;

type
  TfrmBankCashIntTransfer = class(TfrmDefMSC)
    scrlbxHeader: TScrollBox;
    lblTransNo: TcxLabel;
    edTransNo: TcxButtonEdit;
    lblTransDate: TcxLabel;
    dtTransDate: TcxDateEdit;
    memDesxription: TcxMemo;
    lblDescription: TcxLabel;
    lbl2: TcxLabel;
    lblCurr: TcxLabel;
    cbbMataUang: TcxExtLookupComboBox;
    lbl4: TcxLabel;
    lblRefNum: TcxLabel;
    edRefNum: TcxButtonEdit;
    lblProyek: TcxLabel;
    cbbProject: TcxExtLookupComboBox;
    PCDetail: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    Panel1: TPanel;
    cxgrdBankCash: TcxGrid;
    cxgrdlvlBankCash: TcxGridLevel;
    pnlButtonBankCash: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxGridDBTableLUCurrency: TcxGridDBTableView;
    edRate: TcxCurrencyEdit;
    cxGridColGridDBTableLUCurrencyCurrId: TcxGridDBColumn;
    cxGridColGridDBTableLUCurrencyCurrSymbol: TcxGridDBColumn;
    cxGridDBTableLUProject: TcxGridDBTableView;
    cxGridColGridDBTableLUProjectProjId: TcxGridDBColumn;
    cxGridColGridDBTableLUProjectProjName: TcxGridDBColumn;
    cxGridColGridDBTableLUProjectUnitBisnis: TcxGridDBColumn;
    cxGridColGridDBTableLUProjectProjPosisi: TcxGridDBColumn;
    cxGridColOverViewTransNo: TcxGridDBColumn;
    cxGridColOverViewRefNum: TcxGridDBColumn;
    cxGridColOverViewDesription: TcxGridDBColumn;
    cxGridColOverviewTransdate: TcxGridDBColumn;
    cxGridColOverviewProject: TcxGridDBColumn;
    cxGridColOverViewCurrency: TcxGridDBColumn;
    cxGridDBTableLUBankCashAccount: TcxGridDBTableView;
    cxGridColGridDBTableLUBankCashAccountAccCode: TcxGridDBColumn;
    cxGridColGridDBTableLUBankCashAccountBankCode: TcxGridDBColumn;
    cxGridColGridDBTableLUBankCashAccountAccName: TcxGridDBColumn;
    cxGridColGridDBTableLUBankCashAccountAccNum: TcxGridDBColumn;
    cxGridColGridDBTableLUBankCashAccountnamabank: TcxGridDBColumn;
    cxGridTableBankCash: TcxGridTableView;
    cxGridColBankCashFrom: TcxGridColumn;
    cxGridColBankCashTo: TcxGridColumn;
    cxGridColBankCashAdmCost: TcxGridColumn;
    cxGridColBankCashTransferValue: TcxGridColumn;
    cxGridColBankCashAmount: TcxGridColumn;
    cxGridColBankCashDeskripsi: TcxGridColumn;
    cxGridDBTableLUAccount: TcxGridDBTableView;
    cxGridColGridDBTableLUAccountAccountCode: TcxGridDBColumn;
    cxGridColGridDBTableLUAccountAccountName: TcxGridDBColumn;
    cxGridDBTableLUAllocation: TcxGridDBTableView;
    cxGridColGridDBTableLUAllocationDeptCode: TcxGridDBColumn;
    cxGridColGridDBTableLUAllocationDeptName: TcxGridDBColumn;
    splDetail: TSplitter;
    cxGridColBankCashObject: TcxGridColumn;
    cxGridColOverviewPrepareName: TcxGridDBColumn;
    cxGridColOverviewVerified: TcxGridDBColumn;
    cxGridColOverviewApproved: TcxGridDBColumn;
    cxGridColBankCashOtherIncome: TcxGridColumn;
    cxTCAdminCostOI: TcxTabControl;
    pnlButtonAdmCost: TPanel;
    btnAddAdmCost: TcxButton;
    btnDelAdmCost: TcxButton;
    cxgrdAdmCost: TcxGrid;
    cxGridTableBCITAdmCost: TcxGridTableView;
    cxGridColBCITAdmCostAccount: TcxGridColumn;
    cxGridColBCITAdmCostAccountNama: TcxGridColumn;
    cxGridColBCITAdmCostDescription: TcxGridColumn;
    cxGridColBCITAdmCostAmount: TcxGridColumn;
    cxGridColBCITAdmCostAllocation: TcxGridColumn;
    cxGridColBCITAdmObject: TcxGridColumn;
    cxGridColBCITAdmObjectHeader: TcxGridColumn;
    cxgrdlvlAdmCost: TcxGridLevel;
    cxGridColBCITAdmJenis: TcxGridColumn;
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxGridColBankCashAdmCostPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridColBankCashTransferValuePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridTableBankCashEditing(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; var AAllow: Boolean);
    procedure cxGridColBCITAdmCostAccountPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridTableBankCashDataControllerAfterInsert(
      ADataController: TcxCustomDataController);
    procedure cxGridTableBankCashFocusedRecordChanged(Sender:
        TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord:
        TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure cxGridTableBCITAdmCostDataControllerAfterInsert(
      ADataController: TcxCustomDataController);
    procedure cxGridColBCITAdmCostAmountPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure rgApproveClick(Sender: TObject);
    procedure rgVerifyClick(Sender: TObject);
    procedure cxGridColBankCashFromPropertiesInitPopup(Sender: TObject);
    procedure cxGridColBCITAdmCostAccountPropertiesInitPopup(Sender: TObject);
    procedure cxGridColBCITAdmCostAllocationPropertiesInitPopup(
      Sender: TObject);
    procedure btnAddAdmCostClick(Sender: TObject);
    procedure cxGridTableBankCashDataControllerAfterDelete(
      ADataController: TcxCustomDataController);
    procedure cxGridColBCITAdmCostAccountPropertiesCloseUp(Sender: TObject);
    procedure btnDelAdmCostClick(Sender: TObject);
    procedure grdvwOverviewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      out AStyle: TcxStyle);
    procedure cxGridTableBCITAdmCostDataControllerAfterDelete(
      ADataController: TcxCustomDataController);
    procedure btnSaveClick(Sender: TObject);
    procedure btnPrintItemClick(Sender: TObject);
    procedure cxTCAdminCostOIChange(Sender: TObject);
  private
    FAppUtils: TAppUtilsClient;
    FBCITClient: TBCITClient;
    FModBCIT: TModBCIT;
    function GenerateFilterDisplayDeliveryFG: string;
    function GetAppUtils: TAppUtilsClient;
    function GetBCITClient: TBCITClient;
    function GetModBCIT: TModBCIT;
    function GetVarCOAAdmCost: string;
    procedure HitungNominalAdmCost;
    procedure LoadDataBCITAdmCost(AModBCITBankCash : TModBCITBankCash); overload;
    procedure LoadDataBCITAdmCost; overload;
    procedure LoadDataBCITBankCash;
    procedure UpdateDataBCITAdmCost(ABCITBankCash: TModBCITBankCash);
    procedure UpdateDataBCITBankCashs;
    function ValidateBCITBankCash: Boolean;
    property AppUtils: TAppUtilsClient read GetAppUtils write FAppUtils;
    property BCITClient: TBCITClient read GetBCITClient write FBCITClient;
    { Private declarations }
  public
    function DeleteData: Boolean; override;
    procedure InitOpenForm; override;
    function LoadData: Boolean; override;
    procedure LoadDataBCIT(ATransNo : String);
    procedure NewData; override;
    procedure RefreshOverview; override;
    function SaveData: Boolean; override;
    procedure UpdateData; override;
    procedure UpdateDataApproval(AModTransApproval : TModTransApproval); override;
    function ValidateData: Boolean; override;
    property ModBCIT: TModBCIT read GetModBCIT write FModBCIT;
    { Public declarations }
  end;

var
  frmBankCashIntTransfer: TfrmBankCashIntTransfer;

implementation

{$R *.dfm}

procedure TfrmBankCashIntTransfer.btnAddAdmCostClick(Sender: TObject);
var
  lModBCITAdmCost: TModBCITAdmCost;
begin
  inherited;
  if cxGridTableBankCash.FocusedRecord < 0 then
    Exit;

  cxGridTableBCITAdmCost.DataController.RecordCount        := cxGridTableBCITAdmCost.DataController.RecordCount + 1;
  cxGridTableBCITAdmCost.DataController.FocusedRecordIndex := cxGridTableBCITAdmCost.DataController.RecordCount - 1;

  lModBCITAdmCost := TModBCITAdmCost.Create;

  cxGridTableBCITAdmCost.SetNilai(cxGridTableBCITAdmCost.DataController.RecordCount - 1, cxGridColBCITAdmObject.Index, Integer(lModBCITAdmCost));
  cxGridTableBCITAdmCost.SetNilai(cxGridTableBCITAdmCost.DataController.RecordCount - 1, cxGridColBCITAdmObjectHeader.Index, cxGridTableBankCash.Int(cxGridTableBankCash.FocusedRecord, cxGridColBankCashObject.Index));
  cxGridTableBCITAdmCost.SetNilai(cxGridTableBCITAdmCost.FocusedRecord, cxGridColBCITAdmJenis.Index, cxTCAdminCostOI.TabIndex);

  HitungNominalAdmCost;
end;

procedure TfrmBankCashIntTransfer.btnDelAdmCostClick(Sender: TObject);
begin
  inherited;
  if cxGridTableBCITAdmCost.DataController.RecordCount > 0 then
  begin
    if cxGridTableBCITAdmCost.FocusedRecord >= 0 then
    begin
      cxGridTableBCITAdmCost.DataController.DeleteFocused;
      HitungNominalAdmCost;
    end;
  end;
end;

procedure TfrmBankCashIntTransfer.btnPrintItemClick(Sender: TObject);
var
  frxReport: TTSReport;
  sSQL: string;

begin
  inherited;
  frxReport:=TTSReport.Create(nil);
  try
    sSQL:= 'select * from tperusahaan';
    frxReport.AddSQL(sSQL);

    sSQL:= 'SELECT a.* FROM VW_Slip_BCIT a ' +
           ' where a.TransNum= ' + TAppUtils.Quot(edtransno.Text);
    frxReport.AddSQL(sSQL);

    frxReport.ShowReport('Finance\Bank and Cash\SlipBCIT');
  finally
    frxReport.Free;
  end;
end;

procedure TfrmBankCashIntTransfer.btnSaveClick(Sender: TObject);
begin
  inherited;
  RefreshOverview;
end;

procedure TfrmBankCashIntTransfer.cxButton1Click(Sender: TObject);
var
  lBCITBankCash: TModBCITBankCash;
begin
  inherited;
  cxGridTableBankCash.DataController.RecordCount := cxGridTableBankCash.DataController.RecordCount + 1;
  cxGridTableBankCash.DataController.FocusedRecordIndex := cxGridTableBankCash.DataController.RecordCount - 1;

  lBCITBankCash := TModBCITBankCash.Create;
  cxGridTableBankCash.SetNilai(cxGridTableBankCash.FocusedRecord, cxGridColBankCashObject.Index, Integer(lBCITBankCash));
  LoadDataBCITAdmCost(TModBCITBankCash(cxGridTableBankCash.Int(cxGridTableBankCash.FocusedRecord, cxGridColBankCashObject.Index)));

end;

procedure TfrmBankCashIntTransfer.cxButton2Click(Sender: TObject);
begin
  inherited;
  if cxGridTableBankCash.DataController.RecordCount > 0 then
  begin
    if cxGridTableBankCash.FocusedRecord >= 0 then
    begin
      cxGridTableBankCash.DataController.DeleteFocused;

      if cxGridTableBankCash.DataController.RecordCount = 0 then
      begin
        cxGridTableBCITAdmCost.ClearRecords;
        cxGridTableBCITAdmCost.DataController.Filter.Root.Clear;
      end;
    end;
  end;

end;

procedure TfrmBankCashIntTransfer.cxGridColBankCashAdmCostPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  if DisplayValue <> null then
  begin
    cxGridTableBankCash.SetNilai(cxGridTableBankCash.FocusedRecord,
                                   cxGridColBankCashAmount.Index,
                                   cxGridTableBankCash.Float(cxGridTableBankCash.FocusedRecord, cxGridColBankCashTransferValue.Index) + DisplayValue);

  end else begin
      ErrorText := DisplayValue + '   angka valid';
  end;
end;

procedure TfrmBankCashIntTransfer.cxGridColBankCashFromPropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  cxGridDBTableLUBankCashAccount.DataController.Filter.Root.Clear;
  cxGridDBTableLUBankCashAccount.DataController.DataSource.DataSet.First;
end;

procedure TfrmBankCashIntTransfer.cxGridColBankCashTransferValuePropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  if DisplayValue  <> null then
  begin
    cxGridTableBankCash.SetNilai(cxGridTableBankCash.FocusedRecord,
                                   cxGridColBankCashAmount.Index,
                                   cxGridTableBankCash.Float(cxGridTableBankCash.FocusedRecord, cxGridColBankCashAdmCost.Index) + DisplayValue);

  end else begin
    ErrorText := DisplayValue + ' Bukan angka valid';
  end;
end;

procedure TfrmBankCashIntTransfer.cxGridColBCITAdmCostAccountPropertiesCloseUp(
  Sender: TObject);
begin
  inherited;
  Datamodule2.DSCOA.DataSet.Filtered := False;
end;

procedure TfrmBankCashIntTransfer.cxGridColBCITAdmCostAccountPropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
   if GetVarCOAAdmCost <> '' then
  begin
    Datamodule2.DSCOA.DataSet.Filter   := ' AccountCode in (' + GetVarCOAAdmCost + ')';
    Datamodule2.DSCOA.DataSet.Filtered := True;
  end;

  cxGridDBTableLUAccount.DataController.Filter.Root.Clear;
  cxGridDBTableLUAccount.DataController.DataSource.DataSet.First;
end;

procedure TfrmBankCashIntTransfer.cxGridColBCITAdmCostAccountPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  cxGridTableBCITAdmCost.SetNilai(cxGridTableBCITAdmCost.FocusedRecord, cxGridColBCITAdmCostAccountNama.Index, Datamodule2.DSCOA.DataSet.FieldByName('AccountName').AsString);
end;

procedure TfrmBankCashIntTransfer.cxGridColBCITAdmCostAllocationPropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  cxGridDBTableLUAllocation.DataController.Filter.Root.Clear;
  cxGridDBTableLUAllocation.DataController.DataSource.DataSet.First;
end;

procedure TfrmBankCashIntTransfer.cxGridColBCITAdmCostAmountPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  dAmount: Double;
  dTotal: Double;
  I: Integer;
begin
  inherited;
  dTotal := DisplayValue;
  for I := 0 to cxGridTableBCITAdmCost.DataController.RecordCount - 1 do
  begin
    if i <> cxGridTableBCITAdmCost.FocusedRecord then
      if (cxGridTableBCITAdmCost.Int(i, cxGridColBCITAdmObjectHeader.Index) = cxGridTableBankCash.Int(cxGridTableBankCash.FocusedRecord, cxGridColBankCashObject.Index))
          and (cxGridTableBCITAdmCost.Int(i, cxGridColBCITAdmJenis.Index) = cxTCAdminCostOI.TabIndex) then
        dTotal := dTotal + cxGridTableBCITAdmCost.Float(i, cxGridColBCITAdmCostAmount.Index);
  end;

  if cxTCAdminCostOI.TabIndex = 0 then
  begin
    cxGridTableBankCash.SetNilai(cxGridTableBankCash.FocusedRecord, cxGridColBankCashAdmCost.Index, dTotal);
    dAmount := cxGridTableBankCash.Float(cxGridTableBankCash.FocusedRecord, cxGridColBankCashTransferValue.Index) + dTotal;
    cxGridTableBankCash.SetNilai(cxGridTableBankCash.FocusedRecord, cxGridColBankCashAmount.Index, dAmount);
  end else
    cxGridTableBankCash.SetNilai(cxGridTableBankCash.FocusedRecord, cxGridColBankCashOtherIncome.Index, dTotal);


end;

procedure TfrmBankCashIntTransfer.cxGridTableBankCashDataControllerAfterDelete(
  ADataController: TcxCustomDataController);
begin
  inherited;
  if cxGridTableBankCash.DataController.RecordCount = 0 then
  begin
    cxGridTableBCITAdmCost.DataController.Filter.Root.Clear;
    cxGridTableBCITAdmCost.ClearRecords;
  end;
end;

procedure TfrmBankCashIntTransfer.cxGridTableBankCashDataControllerAfterInsert(
  ADataController: TcxCustomDataController);
var
  lBCITBankCash: TModBCITBankCash;
begin
  inherited;
  lBCITBankCash := TModBCITBankCash.Create;
  cxGridTableBankCash.SetNilai(cxGridTableBankCash.FocusedRecord, cxGridColBankCashObject.Index, Integer(lBCITBankCash));
  LoadDataBCITAdmCost(TModBCITBankCash(cxGridTableBankCash.Int(cxGridTableBankCash.FocusedRecord, cxGridColBankCashObject.Index)));
end;

procedure TfrmBankCashIntTransfer.cxGridTableBankCashEditing(Sender:
    TcxCustomGridTableView; AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  inherited;
  AAllow := True;
  if AItem.Index in [cxGridColBankCashAmount.Index, cxGridColBankCashAdmCost.Index, cxGridColBankCashOtherIncome.Index] then
    AAllow := False;
end;

procedure TfrmBankCashIntTransfer.cxGridTableBankCashFocusedRecordChanged(
    Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord:
    TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  if AFocusedRecord <> nil then
    LoadDataBCITAdmCost(TModBCITBankCash(cxGridTableBankCash.Int(AFocusedRecord.Index, cxGridColBankCashObject.Index)));
end;

procedure TfrmBankCashIntTransfer.cxGridTableBCITAdmCostDataControllerAfterDelete(
  ADataController: TcxCustomDataController);
begin
  inherited;
  HitungNominalAdmCost;
end;

procedure TfrmBankCashIntTransfer.cxGridTableBCITAdmCostDataControllerAfterInsert(
  ADataController: TcxCustomDataController);
var
  lModBCITAdmCost: TModBCITAdmCost;
begin
  inherited;
  lModBCITAdmCost := TModBCITAdmCost.Create;

  cxGridTableBCITAdmCost.SetNilai(cxGridTableBCITAdmCost.FocusedRecord, cxGridColBCITAdmObject.Index, Integer(lModBCITAdmCost));
  cxGridTableBCITAdmCost.SetNilai(cxGridTableBCITAdmCost.FocusedRecord, cxGridColBCITAdmObjectHeader.Index, cxGridTableBankCash.Int(cxGridTableBankCash.FocusedRecord, cxGridColBankCashObject.Index));
  cxGridTableBCITAdmCost.SetNilai(cxGridTableBCITAdmCost.FocusedRecord, cxGridColBCITAdmJenis.Index, cxTCAdminCostOI.TabIndex);

//  TModBCITBankCash(cxGridTableBankCash.Int(cxGridTableBankCash.FocusedRecord, cxGridColBankCashObject.Index)).BCITAdmCosts.Add(lModBCITAdmCost);
end;

procedure TfrmBankCashIntTransfer.cxTCAdminCostOIChange(Sender: TObject);
begin
  inherited;
  if cxGridTableBankCash.DataController.FocusedRecordIndex >= 0 then
    LoadDataBCITAdmCost(TModBCITBankCash(cxGridTableBankCash.Int(cxGridTableBankCash.DataController.FocusedRecordIndex, cxGridColBankCashObject.Index)));

end;

function TfrmBankCashIntTransfer.DeleteData: Boolean;
begin
  Result := inherited DeleteData;

  if Result then
  begin
    Result := False;

    if BCITClient.Delete(ModBCIT) then
      Result := True;

  end;
end;

procedure TfrmBankCashIntTransfer.FormShow(Sender: TObject);
begin
  inherited;
  Datamodule2.DSCurrency.DataSet.Open;
  Datamodule2.DSProject.DataSet.Open;
  Datamodule2.DSBankCash.DataSet.Open;

  Datamodule2.DSCOA.DataSet.Open;

  Datamodule2.DSDepartemen.DataSet.Open;
  RefreshOverview;
end;

function TfrmBankCashIntTransfer.GenerateFilterDisplayDeliveryFG: string;
begin
  Result := '';
end;

function TfrmBankCashIntTransfer.GetAppUtils: TAppUtilsClient;
begin
  if FAppUtils = nil then
  begin
    FAppUtils := TAppUtilsClient.Create(MainClientConn, False);
  end;
  Result := FAppUtils;
end;

function TfrmBankCashIntTransfer.GetBCITClient: TBCITClient;
begin
  if FBCITClient = nil then
  begin
    FBCITClient := TBCITClient.Create(MainClientConn, False);
  end;

  Result := FBCITClient;
end;

function TfrmBankCashIntTransfer.GetModBCIT: TModBCIT;
begin
  if FModBCIT = nil then
    FModBCIT := TModBCIT.Create;

  Result := FModBCIT;
end;

function TfrmBankCashIntTransfer.GetVarCOAAdmCost: string;
var
  lCOA: TStringList;
  i: Integer;
begin
  Result := '';
  lCOA := TStringList.Create;
  try
    TStringUtils.SplitString(';', VarCOABankCashAdmCost, lCOA);
    for i := 0 to lCOA.Count-1 do
    begin
      if i > 0 then
        Result := Result + ',';

      Result := Result + QuotedStr(lCOA.Strings[i]);
    end;
  finally
    lCOA.Free;
  end;
end;

procedure TfrmBankCashIntTransfer.grdvwOverviewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  inherited;

  if ARecord.Values[cxGridColOverviewVerified.Index] = 'Y' then
    AStyle := Datamodule2.cxstylVerifiedY;

  if ARecord.Values[cxGridColOverviewVerified.Index] = 'N' then
    AStyle := Datamodule2.cxstylVerifiedN;

  if ARecord.Values[cxGridColOverviewApproved.Index] = 'Y' then
    AStyle := Datamodule2.cxstylApprovedY;

  if ARecord.Values[cxGridColOverviewApproved.Index] = 'N' then
    AStyle := Datamodule2.cxstylVerifiedN

end;

procedure TfrmBankCashIntTransfer.HitungNominalAdmCost;
var
  dTotal: Double;
  I: Integer;
begin
  if cxGridTableBankCash.FocusedRecord < 0  then
    Exit;

  dTotal := 0;
  for I := 0 to cxGridTableBCITAdmCost.DataController.RecordCount - 1 do
  begin
    if (cxGridTableBCITAdmCost.Int(i, cxGridColBCITAdmObjectHeader.Index) =  cxGridTableBankCash.Int(cxGridTableBankCash.FocusedRecord, cxGridColBankCashObject.Index))
       and (cxGridTableBCITAdmCost.Int(i, cxGridColBCITAdmJenis.Index) = cxTCAdminCostOI.TabIndex) then
     begin
       dTotal := dTotal + cxGridTableBCITAdmCost.Float(i, cxGridColBCITAdmCostAmount.Index);
     end;
  end;

  if cxTCAdminCostOI.TabIndex = 0 then
  begin
    cxGridTableBankCash.SetNilai(cxGridTableBankCash.FocusedRecord, cxGridColBankCashAdmCost.Index, dTotal);
    cxGridTableBankCash.SetNilai(cxGridTableBankCash.FocusedRecord, cxGridColBankCashAmount.Index, cxGridTableBankCash.Float(cxGridTableBankCash.FocusedRecord, cxGridColBankCashTransferValue.Index) + dTotal);
  end else
    cxGridTableBankCash.SetNilai(cxGridTableBankCash.FocusedRecord, cxGridColBankCashOtherIncome.Index, dTotal);


end;

procedure TfrmBankCashIntTransfer.InitOpenForm;
begin
  inherited;
  IsValidateBeforeUpdate := True;
end;

function TfrmBankCashIntTransfer.LoadData: Boolean;
begin
  LoadDataBCIT(grdvwOverview.DataController.DataSource.DataSet.FieldByName('TransNo').AsString);
  Result := inherited LoadData;

  LoadDataApproval(ModBCIT);
end;

procedure TfrmBankCashIntTransfer.LoadDataBCIT(ATransNo : String);
begin
  FreeAndNil(FModBCIT);

  edTransNo.Text          := '';
  edRefNum.Text           := '';
  dtTransDate.Date        := Now;
  cbbMataUang.EditValue   := AppUtils.Currency('Rp').CurrID;
  edRate.Value            := 1;
  cbbProject.EditValue    := null;
  memDesxription.Clear;

  cxGridTableBankCash.ClearRecords;
  cxGridTableBCITAdmCost.ClearRecords;


  FModBCIT                := BCITClient.RetrieveNo(ATransNo);
  if FModBCIT.BCITID > 0 then
  begin
    edTransNo.Text        := FModBCIT.TransNo;
    edRefNum.Text         := FModBCIT.RefNum;
    dtTransDate.Date      := FModBCIT.TransDate;
    cbbMataUang.EditValue := FModBCIT.MataUang.CurrID;
    cbbProject.EditValue  := FModBCIT.Project.ProjId;
    memDesxription.Text   := FModBCIT.Description;

    LoadDataBCITBankCash();
  end;
end;

procedure TfrmBankCashIntTransfer.LoadDataBCITAdmCost(AModBCITBankCash :
    TModBCITBankCash);
begin
  if AModBCITBankCash = nil then
    Exit;

  with cxGridTableBCITAdmCost.DataController.Filter do
  begin
    BeginUpdate;
    try
      Root.Clear;
      Root.BoolOperatorKind :=  fboAnd;
      Root.AddItem(cxGridColBCITAdmObjectHeader, foEqual, Integer(AModBCITBankCash), IntToStr(Integer(AModBCITBankCash)));
      Root.AddItem(cxGridColBCITAdmJenis, foEqual, cxTCAdminCostOI.TabIndex, IntToStr(cxTCAdminCostOI.TabIndex));

      cxGridTableBCITAdmCost.DataController.Filter.Active := True;
    finally
      EndUpdate;
    end;
  end;
end;

procedure TfrmBankCashIntTransfer.LoadDataBCITAdmCost;
var
  dNominal: Double;
  I: Integer;
  iBaris: Integer;
  j: Integer;
begin
  cxGridTableBCITAdmCost.ClearRecords;
  for I := 0 to ModBCIT.BCITBankCashs.Count - 1 do
  begin
    for j := 0 to ModBCIT.BCITBankCashs[i].BCITAdmCosts.Count - 1 do
    begin
      iBaris := cxGridTableBCITAdmCost.AddRecord;

      cxGridTableBCITAdmCost.SetNilai(iBaris, cxGridColBCITAdmObjectHeader.Index, Integer(ModBCIT.BCITBankCashs[i]));
      cxGridTableBCITAdmCost.SetNilai(iBaris, cxGridColBCITAdmObject.Index, Integer(ModBCIT.BCITBankCashs[i].BCITAdmCosts[j]));
      cxGridTableBCITAdmCost.SetNilai(iBaris, cxGridColBCITAdmCostAccount.Index, ModBCIT.BCITBankCashs[i].BCITAdmCosts[j].Account.AccountCode);
      cxGridTableBCITAdmCost.SetNilai(iBaris, cxGridColBCITAdmCostAccountNama.Index, ModBCIT.BCITBankCashs[i].BCITAdmCosts[j].Account.AccountName);
      cxGridTableBCITAdmCost.SetNilai(iBaris, cxGridColBCITAdmCostDescription.Index, ModBCIT.BCITBankCashs[i].BCITAdmCosts[j].Deskripsi);

      dNominal := ModBCIT.BCITBankCashs[i].BCITAdmCosts[j].AmountC + ModBCIT.BCITBankCashs[i].BCITAdmCosts[j].AmountD;
      cxGridTableBCITAdmCost.SetNilai(iBaris, cxGridColBCITAdmCostAmount.Index, dNominal);

      if ModBCIT.BCITBankCashs[i].BCITAdmCosts[j].AmountD > 0 then
        cxGridTableBCITAdmCost.SetNilai(iBaris, cxGridColBCITAdmJenis.Index, 0)
      else
        cxGridTableBCITAdmCost.SetNilai(iBaris, cxGridColBCITAdmJenis.Index, 1);

      if ModBCIT.BCITBankCashs[i].BCITAdmCosts[j].Allocation <> nil then
        cxGridTableBCITAdmCost.SetNilai(iBaris, cxGridColBCITAdmCostAllocation.Index, ModBCIT.BCITBankCashs[i].BCITAdmCosts[j].Allocation.Kode);
    end;
  end;

  if cxGridTableBCITAdmCost.DataController.RecordCount > 0 then
  begin
    LoadDataBCITAdmCost(TModBCITBankCash(cxGridTableBankCash.Int(0, cxGridColBankCashObject.Index)));
  end;
end;

procedure TfrmBankCashIntTransfer.LoadDataBCITBankCash;
var
  I: Integer;
begin
  cxGridTableBankCash.ClearRecords;
  for I := 0 to ModBCIT.BCITBankCashs.Count - 1 do
  begin
    cxGridTableBankCash.AddRecord;
    cxGridTableBankCash.DataController.FocusedRecordIndex := 0;

    if ModBCIT.BCITBankCashs[i].BankCashFrom <> nil then
      cxGridTableBankCash.SetNilai(i, cxGridColBankCashFrom.Index, ModBCIT.BCITBankCashs[i].BankCashFrom.RekeningCode)
    else
      cxGridTableBankCash.SetNilai(i, cxGridColBankCashFrom.Index, null);

    if ModBCIT.BCITBankCashs[i].BankCashTo <> nil then
      cxGridTableBankCash.SetNilai(i, cxGridColBankCashTo.Index, ModBCIT.BCITBankCashs[i].BankCashTo.RekeningCode)
    else
      cxGridTableBankCash.SetNilai(i, cxGridColBankCashTo.Index, null);

    cxGridTableBankCash.SetNilai(i, cxGridColBankCashAdmCost.Index, ModBCIT.BCITBankCashs[i].AdministrativeCost);
    cxGridTableBankCash.SetNilai(i, cxGridColBankCashTransferValue.Index, ModBCIT.BCITBankCashs[i].TransferValue);
    cxGridTableBankCash.SetNilai(i, cxGridColBankCashAmount.Index, ModBCIT.BCITBankCashs[i].Amount);
    cxGridTableBankCash.SetNilai(i, cxGridColBankCashDeskripsi.Index, ModBCIT.BCITBankCashs[i].Deskripsi);
    cxGridTableBankCash.SetNilai(i, cxGridColBankCashObject.Index, Integer(ModBCIT.BCITBankCashs[i]));
  end;

  LoadDataBCITAdmCost();
end;

procedure TfrmBankCashIntTransfer.NewData;
begin
  inherited;
  LoadDataBCIT('LEMBUR');

//  cdsBankCash.Open;
//  cdsBankCash.EmptyDataSet;
end;

procedure TfrmBankCashIntTransfer.RefreshOverview;
var
  sFilter: string;
begin
  inherited;
  Datamodule2.CDSBCIT.Close;
  Datamodule2.CDSBCIT.Open;

  sFilter                             := GenerateFilterDisplayDeliveryFG;
  Datamodule2.CDSBCIT.Filter   := sFilter;
//  Datamodule2.CDSBCIT.Filtered := True;

  if grdvwOverview.DataController.DataSource = nil then
    grdvwOverview.DataController.DataSource := TDataSource.Create(Self);

  grdvwOverview.DataController.DataSource.DataSet := Datamodule2.CDSBCIT;
  grdvwOverview.ApplyBestFit();
end;

procedure TfrmBankCashIntTransfer.rgApproveClick(Sender: TObject);
begin
  lblUserApp.Caption  := vUserTSPM.UserName;
  dtApproveDate.Date  := Now;
end;

procedure TfrmBankCashIntTransfer.rgVerifyClick(Sender: TObject);
begin
  lblUserVer.Caption := vUserTSPM.UserName;
  dtVerifyDate.Date  := Now;

end;

function TfrmBankCashIntTransfer.SaveData: Boolean;
begin
  Result := inherited SaveData;

  if not Result then
    Exit;

  Result := False;
  if not BCITClient.SaveToDB(ModBCIT) then
  begin
    Exit;
  end;


  Result := True;
end;

procedure TfrmBankCashIntTransfer.UpdateData;
begin
  ModBCIT.Description := memDesxription.Text;
  ModBCIT.MataUang    := AppUtils.CurrencyID(cbbMataUang.EditValue);
  ModBCIT.Project     := AppUtils.Projects(cbbProject.EditValue);
  ModBCIT.Rate        := edRate.Value;
  ModBCIT.RefNum      := edRefNum.Text;
  ModBCIT.TransDate   := dtTransDate.Date;

  if ModBCIT.ObjectState = osSaveNew then
  begin
    edTransNo.Text    := AppUtils.GenerateNoBuktiBCIT(ModBCIT);
    ModBCIT.TransNo   := edTransNo.Text;
  end;
  UpdateDataBCITBankCashs;

  UpdateDataApproval(ModBCIT);
end;

procedure TfrmBankCashIntTransfer.UpdateDataApproval(AModTransApproval :
    TModTransApproval);
begin
  if AModTransApproval = nil then
  begin
    ShowMessage('Kok Nil ?');
    Exit;
  end;

  if AModTransApproval.ObjectState = osSaveNew then
  begin
    AModTransApproval.PrepareDate := dtPrepareDate.Date;
    AModTransApproval.PrepareName := lblUserPrepare.Caption;
  end;

  AModTransApproval.VerifyDate   := dtVerifyDate.Date;
  AModTransApproval.VerifyName   := lblUserVer.Caption;
  AModTransApproval.VerifyStatus := GetVerifyStatus;

  AModTransApproval.ApproveDate  := dtApproveDate.Date;
  AModTransApproval.ApproveName  := lblUserApp.Caption;
  AModTransApproval.ApproveStatus:= GetApprovalStatus;

end;

procedure TfrmBankCashIntTransfer.UpdateDataBCITAdmCost(ABCITBankCash:
    TModBCITBankCash);
var
  I: Integer;
  lModBCITAdmCost: TModBCITAdmCost;
begin
  ABCITBankCash.BCITAdmCosts.Clear;

  for I := 0 to cxGridTableBCITAdmCost.DataController.RecordCount - 1 do
  begin
    if cxGridTableBCITAdmCost.Int(i, cxGridColBCITAdmObjectHeader.Index) = Integer(ABCITBankCash) then
    begin
      lModBCITAdmCost             := TModBCITAdmCost(cxGridTableBCITAdmCost.Int(i, cxGridColBCITAdmObject.Index));
      lModBCITAdmCost.Account     := AppUtils.Account(cxGridTableBCITAdmCost.Str(i, cxGridColBCITAdmCostAccount.Index));
      lModBCITAdmCost.Allocation  := AppUtils.Departemen(cxGridTableBCITAdmCost.Str(i, cxGridColBCITAdmCostAllocation.Index));

      lModBCITAdmCost.AmountC := 0;
      lModBCITAdmCost.AmountD := 0;

      {
      if (ABCITBankCash.BankCashFrom <> nil) and (ABCITBankCash.BankCashTo <> nil) then
        lModBCITAdmCost.AmountD := cxGridTableBCITAdmCost.Float(i, cxGridColBCITAdmCostAmount.Index)
      else if ABCITBankCash.BankCashFrom  = nil then
        lModBCITAdmCost.AmountD := cxGridTableBCITAdmCost.Float(i, cxGridColBCITAdmCostAmount.Index)
      else
        lModBCITAdmCost.AmountC := cxGridTableBCITAdmCost.Float(i, cxGridColBCITAdmCostAmount.Index);
      }

      if cxGridTableBCITAdmCost.Int(i, cxGridColBCITAdmJenis.Index) = 0 then
        lModBCITAdmCost.AmountD := cxGridTableBCITAdmCost.Float(i, cxGridColBCITAdmCostAmount.Index)
      else
        lModBCITAdmCost.AmountC := cxGridTableBCITAdmCost.Float(i, cxGridColBCITAdmCostAmount.Index);


      lModBCITAdmCost.BCITBankCash := ABCITBankCash;
      lModBCITAdmCost.Deskripsi := cxGridTableBCITAdmCost.Str(i, cxGridColBCITAdmCostDescription.Index);

      ABCITBankCash.BCITAdmCosts.Add(lModBCITAdmCost);
    end;
  end;
end;

procedure TfrmBankCashIntTransfer.UpdateDataBCITBankCashs;
var
  I: Integer;
  lBCITBankCash: TModBCITBankCash;
begin
  ModBCIT.BCITBankCashs.Clear;
  for I := 0 to cxGridTableBankCash.DataController.RecordCount - 1 do
  begin
    lBCITBankCash                    := TModBCITBankCash(cxGridTableBankCash.Int(i, cxGridColBankCashObject.Index));
//    lBCITBankCash.AdministrativeCost := cxGridTableBankCash.Float(i, cxGridColBankCashAdmCost.Index);
    lBCITBankCash.TransferValue      := cxGridTableBankCash.Float(i, cxGridColBankCashTransferValue.Index);
    lBCITBankCash.BankCashFrom       := AppUtils.BankCashAccount(cxGridTableBankCash.Str(i, cxGridColBankCashFrom.Index));
    lBCITBankCash.BankCashTo         := AppUtils.BankCashAccount(cxGridTableBankCash.Str(i, cxGridColBankCashTo.Index));

    lBCITBankCash.BCIT               := ModBCIT;
    lBCITBankCash.Deskripsi          := cxGridTableBankCash.Str(i, cxGridColBankCashDeskripsi.Index);

    ModBCIT.BCITBankCashs.Add(lBCITBankCash);
    UpdateDataBCITAdmCost(lBCITBankCash);

  end;
end;

function TfrmBankCashIntTransfer.ValidateBCITBankCash: Boolean;
var
  I: Integer;
begin
  Result := False;

//  if FApprovalApp.LastStatus = asApproved  then
//  begin
//    TAppUtils.Warning('Data Sudah Diapprove');
//    Exit;
//  end;

  if cxGridTableBankCash.DataController.RecordCount <= 0 then
  begin
    TAppUtils.Warning('Bank Cash Belum Diisi');
    Exit;
  end else begin
    for I := 0 to cxGridTableBankCash.DataController.RecordCount - 1 do
    begin
      if cxGridTableBankCash.Float(i, cxGridColBankCashTransferValue.Index) > 0 then
      begin
        if cxGridTableBankCash.Str(i, cxGridColBankCashFrom.Index) = '' then
        begin
          TAppUtils.Warning('Baris ' + IntToStr(i+1) + ' Bank Form Harus Diisi');
        end else if cxGridTableBankCash.Str(i, cxGridColBankCashTo.Index) = '' then
        begin
          TAppUtils.Warning('Baris ' + IntToStr(i+1) + ' Bank To Harus Diisi');
        end;
      end;

      if cxGridTableBankCash.Float(i, cxGridColBankCashAdmCost.Index) > 0 then
      begin
        if cxGridTableBankCash.Str(i, cxGridColBankCashFrom.Index) = '' then
        begin
          TAppUtils.Warning('Baris ' + IntToStr(i+1) + ' Bank Form Harus Diisi');
        end;
      end;

      if cxGridTableBankCash.Float(i, cxGridColBankCashOtherIncome.Index) > 0 then
      begin
        if cxGridTableBankCash.Str(i, cxGridColBankCashTo.Index) = '' then
        begin
          TAppUtils.Warning('Baris ' + IntToStr(i+1) + ' Bank To Harus Diisi');
        end;
      end;
    end;
  end;

  Result := True;
end;

function TfrmBankCashIntTransfer.ValidateData: Boolean;
begin
  Result := False;

  if ApprovalValue in [ATApproved, ATApprovedNo] then
  begin
    TAppUtils.Warning('Data Sudah Approved.'
                      + #13 + 'Data Tidak Bisa Diedit.');
    Exit;
  end;

  if cbbMataUang.EditValue = null then
  begin
    TAppUtils.Warning('Mata Uang Belum Diisi');
    Exit;
  end else if (UpperCase(cbbMataUang.Text) <> 'RP') and ((edRate.Value) <= 0) then
  begin
    TAppUtils.Warning('Rate Mata Uang Belum Diisi');
    Exit;
  end else if cbbProject.EditValue = null then
  begin
    TAppUtils.Warning('Project Belum Diisi');
    Exit;
  end else if not ValidateBCITBankCash then
  begin
    Exit;
  end;

  Result := True;

end;

end.
