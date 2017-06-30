unit uAppUtils;

interface
uses
  //AdvGrid,
  Rtti, cxGrid,cxGridDBTableView, cxTreeView,  Math, cxGridExportLink,
  cxExportPivotGridLink, cxGridDBBandedTableView, cxDBPivotGrid, cxCurrencyEdit,
  cxCustomPivotGrid, cxGridBandedTableView, cxDBExtLookupComboBox, cxCustomData,
  cxFilter, cxGridCustomTableView, cxDBTL, cxTLExportLink,cxCalendar, Dialogs,
  SysUtils, cxGridDBDataDefinitions, System.Classes, DBClient,

  Vcl.Controls, Vcl.Forms, Windows, Messages, Variants, Graphics, ExtCtrls,
  ActnList, System.Actions, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit,  cxLookupEdit, cxDBLookupEdit, cxCheckBox, cxSpinEdit, Data.DB,
  cxPC,   Registry,
  ComCtrls,
   cxGridTableView,
  StrUtils,
    SqlExpr, System.UITypes,System.TypInfo,


    cxDropDownEdit,  System.Contnrs, cxMemo, System.Generics.Collections, uModel;

type
  TTag = set of byte;
  TTreeValues = Array of Variant;
  TComboObject = class(TComponent)
  public
    cmbID: string;
    child1: String;
    child2: String;
  end;

//  TSelfSQLQuery = class (TIBQuery)
//    private
//    protected
//    public
//
//    end;

  TAppUtils = class(TObject)
  private
  protected
  public
    class procedure AddKolomToGrid(AKolom: String; var ADBGrid:
        TcxGridDBTableView); overload;
    class function BacaRegistry(aNama: String; aPath : String = ''): string;
    class procedure BeginBusy;
    class function BoolToInt(AStatus : Boolean): Integer;
    class procedure cCloseWaitWindow;
//    class function cGetIDfromCombo(AComboBox :TComboBox; itemIndex : integer = -1):
//        string; overload;
//    class function cGetIDfromCombo(AComboBox :TcxComboBox; itemIndex : integer =
//        -1): string; overload;
    class procedure CheckDataNumeric(AKey : Char);
    class function Confirm(const Text: string): Boolean;
    class procedure Warning(const Text: string);
    class procedure Error(const Text: string);
//    class procedure CreateJsonValueByField(AArray : ISuperObject; Field: TField);
    class function ConfirmBerhasilSimpanCetakReport(ANamaLaporan : String): Boolean;
    class function ConfirmHapus: Boolean;
    class function ConfirmSimpan: Boolean;
//    class function cOpenQuery(AIQL: String): TSelfSQLQuery;
    class procedure cShowWaitWindow(aCaption : String =
    'Mohon Ditunggu ...'; aPicture : TPicture = nil);
    class procedure EndBusy;

    class procedure ErrorHapus(AErrorMessage : String = '');
    class procedure ErrorSimpan(AErrorMessage : String = '');
    class function FileToString(AFileName : String; Var ASize : Double): string;
    class function GetAppVersion:string;
    class function GetBarisKosong(ASG : TcxGridTableView; AKolAcuan : Integer):
        Integer; overload;
    class function GetEnvirontmentVariable(Const AVarName : String): string;
//    class function Terbilang(x : LongInt): string;
    class function GetGeneralVar(AVar : String) : String;
    class function GetValue(ADataController : TcxGridDataController; ABaris :
        Integer; AKolom : Integer; AdefaultValue : Variant): Variant;
    class procedure HapusBaris(ASG : TcxGridTableView; ABaris : Integer); overload;
    class procedure HapusBarisAll(ASG : TcxGridTableView);
    class procedure Information(const Text: string);
    class procedure InformationBerhasilHapus;
    class procedure InformationBerhasilSimpan; overload;
    class procedure InformationBerhasilSimpan(aNoBukti: string); overload;
    class function IsDeveloperMode: Boolean;
    class function ParseSpace(aColName: string): string;
// Update
// 2 July 2004 :
// - cQueryToListView/Grid update agar tetap keluar field walaupun data eof ...
// - Nambah LoginPtompt = false di AdoConnection
// - ngilangin exception pas Exec or Open

//tambahan Fungtion
    class function Quot(aString : String): String;
    class function QuotD(aDate : TDateTime; aTambahJam235959 : Boolean = false):
        String;
    class function QuotDLong(aDate : TDateTime): String;
    class function QuotDt(aDate : TDateTime): String; overload;
    class function QuotDT(aDate : TDateTime; aTambahJam235959 : Boolean): String;
        overload;
    class function ParseStrToArr(aStr: string; aSep: Char): TStrings;
    class procedure SetFocus(ABaris : Integer; ADataController :
        TcxGridDataController);
    class procedure SetHeaderGrid(AHeader: array of String; var ADBGrid:
        TcxGridDBTableView);
//    class procedure SetItemAtComboObject(AComboBox : TComboBox; AID : String);
//        overload;
//    class procedure SetItemAtComboObject(AComboBox : TcxComboBox; AID : String);
//        overload;
    class procedure SetRegionalSetting_ID;
    class procedure StrToFile(AFileName : String; AString : String);
    class function StrToStringStream(AString : String): TStream;
    class function TambahkanKarakterNol(AAngka, ALength : Integer): string;
    class function TulisRegistry(aName, aValue: String; sAppName : String = ''): Boolean;
    class function VarIsBoolean(const V: Variant) :  Boolean;

    class function GetAppPath: string;
    class function HitungKarakterReplace(AStringHitung : Char; AStringSource :
        String): Integer;
    class function HitungKarakterLooping(AStringHitung : Char; AStringSource :
        String): Integer;
    class function ConverToFilter(ADate : TDateTime; AFormat : String =
        'dd MMM YYYY'): String;
//    class function DataSetToJSON(ACaption : String; AQ: TSQLQuery; AKey : String):
//        ISuperObject; overload;
//    class function DataSetToJSON(ACaption : String; ASQL : String; AKey : String):
//        ISuperObject; overload;
    class function LoadFromStreamToString(Stream: TStream; var myString: String;
        Encoding: TEncoding = nil): Double;
    class function QuotF(ANumber : Double): String;
    class function StringToStrings(AString : String;  ASeparator : String):
        TStrings;
    class function NumberToLetter(aNumber: Integer): string;
    class function DateToTiseraDate(aTanggal: TDateTime; aSeparator: string = ' '):
        string;
    class function StrToOEM(s:string): string;
    class function BytesToStr(const Bytes: TBytes): string;
    class procedure IncStepProgressBar(AStep : Integer; ANomorPB : Integer = 0);
    class procedure InisialisasiProgressBar(AParent : TWinControl; AMax : Integer;
        ANomorPB : Integer = 0);
    class procedure FinalisasiProgressBar(ANomorPB : Integer = 0);
    class function DecPeriode(APeriode : Integer): Integer;
    class function StrToBytes(const value: string): TBytes;
  end;

  TcxGridTableViewHelper = class helper for TcxGridTableView
  private
  public
    procedure AddRow;
    procedure ClearRows;
    function FocusedIndex: Integer;
    procedure SetValue(ARec, ACol : Integer; AValue : Variant);

    function GetDouble(ARec, ACol : Integer): Double;
    function GetString(ARec, ACol : Integer): string;
    function GetInteger(ARec, ACol : Integer): Integer;
    function GetDate(ARec, ACol : Integer): TDatetime;
    procedure LoadObjectData(AObject : TAppObject; ARow : Integer);
    procedure SetObjectData(AObject : TAppObject; ARow : Integer);
    procedure SetDouble(ARec, ACol : Integer; AValue : Double);
    function Summary(ACol : Integer): Double;
  end;


  TcxGridDBTableViewHelper = class helper for TcxGridDBTableView
    function GetFooterSummary(aColumn: TcxGridDBBandedColumn): Variant;
  public
    procedure AutoFormatCurrency(ADisplayFormat: String = ',0;(,0)');
    procedure AutoFormatDate(ADisplayFormat: String = 'yyyy/mm/dd');
    function DS: TDataset;
    procedure ExportToXLS(sFileName: String = '');
    procedure SetAllUpperCaseColumn;
    procedure SetColumnsCaption(ColumnSets, ColumnCaption: Array Of String);
    procedure SetDataset(ADataset : TDataset;AAutoCreateField : Boolean=False);
        overload;
    procedure SetDataset(ASQL : String; AAutoCreateField : Boolean = False);
        overload;
    procedure SetDetailKeyField(aKeyField: String);
    procedure SetExtLookupCombo(ExtLookup: TcxExtLookupComboBox; IDField,
        DisplayField: String; HideIDField: Boolean = True); overload;
    procedure SetExtLookupCombo(ExtLookupProp: TcxExtLookupComboBoxProperties;
        IDField, DisplayField: String; HideIDField: Boolean = True); overload;
    procedure SetMasterKeyField(aKeyField: String);
    procedure SetVisibleColumns(ColumnSets: Array Of String; IsVisible: Boolean);
  end;

type
  TcxExtLookupHelper = class helper for TcxExtLookupComboBoxProperties
  protected
  public
    function cxDBTableGrid: TcxGridDBTableView;
    function Dataset: TDataset;
    procedure LoadFromCDS(aCDS: TClientDataSet; IDField, DisplayField: String;
        HideFields: Array Of String; aOwnerForm: TComponent);
    procedure LoadFromSQL(aSQL, IDField, DisplayField: String; HideFields: Array Of
        String; aOwnerForm: TComponent);
    procedure SetMultiPurposeLookup(ADropDownAutoSize : Boolean = True);

  end;

type
  TcxExtLookup= class(TcxExtLookupComboBoxProperties)
  protected
  public
    class procedure OnInitPopupCustom(Sender: TObject);

  end;

  TFormHelper = class helper for TForm
  private
    procedure OnKeyEnter(Sender: TObject; var Key: Word; Shift: TShiftState);
  public
    procedure AssignKeyDownEvent;
    procedure ClearByTag(Tag: TTag);
    function ValidateEmptyCtrl(Tag: TTag = [1]; ShowWarning: Boolean = True):
        Boolean;
    class procedure OnEditValueChanged(Sender: TObject);
    function SetFocusRec(aWinCTRL: TWinControl): Boolean;
  end;

var
  FWaitForm : TForm;
  BusySaveCursor: TCursor;
  BusyCount: Integer;
  PB  : TProgressBar;
  PB1 : TProgressBar;

const
  _ColorBarisGrid                 : TColor = $00E1E1E1;
  _MSG_BERHASIL_SIMPAN            : String = 'Berhasil Menyimpan Data';
  _MSG_BERHASIL_SIMPAN_NOBUKTI    : String = 'Berhasil Menyimpan Data' + #13
                                    + 'Dengan No Bukti';

  _MSG_GAGAL_SIMPAN               : String = 'Gagal Menyimpan Data';

  _MSG_BERHASIL_HAPUS             : String = 'Berhasil Menghapus Data';
  _MSG_GAGAL_HAPUS                : String = 'Gagal Menghapus Data';

  _MSG_MAU_SIMPAN                 : String = 'Anda Yakin Akan Menyimpan Data ?';
  _MSG_MAU_HAPUS                  : String = 'Anda Yakin Akan Menghapus Data ?';

  _MSG_ITEM_PUNYA_ANAK            : String = 'Item Ini Mempunyai Sub Item, Tidak Bisa Dhapus';


  _PERTANYAAN_MAU_DESIGN          : String = 'Anda Mempunyai Hak Untuk Design Report' + #13
                                    + 'Anda Akan Melakukan Design Report';

implementation

uses
   uDBUtils;

//uses
//  DSharp.Bindings.VCLControls;

const
  sSpace: string = ' ';


class procedure TAppUtils.AddKolomToGrid(AKolom: String; var ADBGrid:
    TcxGridDBTableView);


function getJumlahKolom : Integer;
begin
  Result := Length(AKolom) - Length(StringReplace(AKolom, ',', '', [rfReplaceAll, rfIgnoreCase])) + 1;

end;

var
  i: Integer;
  sKolom: string;
begin
  ADBGrid.ClearItems;

  if trim(AKolom) = '*' then
  begin
    ADBGrid.DataController.CreateAllItems;
  end else begin
    if ADBGrid.ColumnCount = getJumlahKolom then
      Exit;

    sKolom := '';

    for i := 1 to Length(AKolom) do
    begin
      if AKolom[i] = ',' then
      begin
        with ADBGrid.CreateColumn do
        begin
          HeaderAlignmentHorz   := taCenter;

          //DataBinding.FieldName := Trim(UpperCase(sKolom));
          DataBinding.FieldName := Trim(sKolom);
          DataBinding.ValueType := 'String';
        end;
        sKolom := '';
      end else begin
        sKolom := sKolom + AKolom[i];
      end;
    end;

    if sKolom <> '' then
    begin
      with ADBGrid.CreateColumn do
      begin
//        DataBinding.FieldName := Trim(UpperCase(sKolom));
        DataBinding.FieldName := Trim(sKolom);
        DataBinding.ValueType := 'String';
      end;

    end;

  end;
end;

class function TAppUtils.BacaRegistry(aNama: String; aPath : String = ''):
    string;
var
  Registry: TRegistry;
  //S: string;
begin
  Registry:=TRegistry.Create;

  Registry.RootKey := HKEY_CURRENT_USER;
  {False because we do not want to create it if it doesn’t exist}
  if Trim(aPath) = '' then
    Registry.OpenKey('\Software\' + Application.Title, False)
  else
    Registry.OpenKey('\Software\' + aPath, False);

  Result := Registry.ReadString(aNama);

  Registry.Free;
end;

class procedure TAppUtils.BeginBusy;
begin
  if BusyCount = 0 then
  begin
    BusySaveCursor := Screen.Cursor;
    Screen.Cursor := crHourglass;
  end;
  Inc(BusyCount);
end;

class function TAppUtils.BoolToInt(AStatus : Boolean): Integer;
begin
  Result := 0;
  if AStatus then
    Result := 1;
end;

class procedure TAppUtils.cCloseWaitWindow;
begin
  FreeAndNil(FWaitForm);
  Screen.Cursor := crDefault;
end;

//class function TAppUtils.cGetIDfromCombo(AComboBox :TComboBox; itemIndex :
//    integer = -1): string;
//begin
//  Result := '';
//
//  if AComboBox.Items.Count = 0 then
//  begin
//    Exit;
//  end;
//
//  if itemIndex = -1 then
//    itemIndex := AComboBox.ItemIndex;
//
//  if itemIndex = -1 then
//    Exit;
//
//  Result := TComboObject(AComboBox.Items.Objects[itemIndex]).cmbID;
//end;
//
//class function TAppUtils.cGetIDfromCombo(AComboBox :TcxComboBox; itemIndex :
//    integer = -1): string;
//begin
//  if AComboBox.Properties.Items.Count = 0 then
//  begin
//    Result := '';
//    Exit;
//  end;
//
//  if itemIndex = -1 then itemIndex := AComboBox.ItemIndex;
//  Result := TComboObject(AComboBox.Properties.Items.Objects[itemIndex]).cmbID;
//end;

class procedure TAppUtils.CheckDataNumeric(AKey : Char);
begin
  if not (CharInSet(AKey,['0'..'9',#8,#9]))  then
  begin
    TAppUtils.Warning('Data Yang Anda Masukkan Salah, Data Harus Numeric');
    Abort;
  end;
end;

class function TAppUtils.Confirm(const Text: string): Boolean;
begin
  Result := MessageDlg(Text, mtConfirmation, [mbYes, mbNo], 0) = mrYes;
end;

class function TAppUtils.ConfirmBerhasilSimpanCetakReport(ANamaLaporan :
    String): Boolean;
begin
  Result := TAppUtils.Confirm(_MSG_BERHASIL_SIMPAN + #13
                              + 'Apakah Anda Akan Cetak Laporan/Slip ' + ANamaLaporan);
end;

class function TAppUtils.ConfirmHapus: Boolean;
begin
  Result := TAppUtils.Confirm(_MSG_MAU_HAPUS);
end;

class function TAppUtils.ConfirmSimpan: Boolean;
begin
  Result := TAppUtils.Confirm(_MSG_MAU_SIMPAN);
end;

//class function TAppUtils.cOpenQuery(AIQL: String): TSelfSQLQuery;
//begin
//  Result := TSelfSQLQuery.Create(nil);
//
//  if not Assigned(Result.Database) then
//  begin
////    Result.Database := frmKoneksi.IBDb;
//  end;
//
//  if not Assigned(Result.Transaction) then
//  begin
////    Result.Transaction := frmKoneksi.IBTrans;
//  end;
//
//    Result.SQL.Clear;
//    Result.SQL.add(AIQL);
//
//  Result.Open;
//  Result.FetchAll;
//
//end;

class procedure TAppUtils.cShowWaitWindow(aCaption : String =
    'Mohon Ditunggu ...'; aPicture : TPicture = nil);
begin
    if FWaitForm = nil then
    begin
        FWaitForm             := TForm.Create(application);
        FWaitForm.BorderStyle := bsNone;
        FWaitForm.Width       := Screen.Width div 3;
        FWaitForm.Height      := (Screen.Height div 10) + 10;
        FWaitForm.Position    := poScreenCenter;
        FWaitForm.FormStyle   := fsStayOnTop;

        if aPicture <> nil then
        begin
          with TImage.Create(FWaitForm) do
          begin
            Parent  := FWaitForm;
            Align   := alTop;
            Picture := aPicture;
            Height  := 10;
            Stretch := True;
          end;
        end;

        with TPanel.Create(FWaitForm) do
        begin
            Parent      := FWaitForm;
            Align       := alClient;
            Font.Name   := 'Verdana';
            Font.Size   := 10;
            Font.Style  := [fsBold];
            Font.Color  := clBlue;
            Caption     := aCaption;
            BevelInner  := bvLowered;
            Color       := clMoneyGreen;
        end;

        with TTimer.Create(FWaitForm) do
        begin
          Interval := 1000;
          Enabled := False;
        end;
    end else
    begin
      (FWaitForm.Components[0] as TPanel).Caption := aCaption;
    end;
    FWaitForm.Show;
    screen.Cursor := crDefault;
end;

class procedure TAppUtils.EndBusy;
begin
  if BusyCount > 0 then
  begin
    Dec(BusyCount);
    if BusyCount = 0 then
      Screen.Cursor := BusySaveCursor;
  end;
end;

class procedure TAppUtils.Error(const Text: string);
begin
  MessageDlg(Text, mtError, [mbYes], 0);
end;

class procedure TAppUtils.ErrorHapus(AErrorMessage : String = '');
begin
  if Trim(AErrorMessage) = '' then
    MessageDlg(_MSG_GAGAL_HAPUS, mtError, [mbYes], 0)
  else
    MessageDlg(_MSG_GAGAL_HAPUS + #13 + 'Dengan Error : ' + AErrorMessage , mtError, [mbYes], 0);
end;

class procedure TAppUtils.ErrorSimpan(AErrorMessage : String = '');
begin
  if Trim(AErrorMessage) = '' then
    MessageDlg(_MSG_GAGAL_SIMPAN, mtError, [mbYes], 0)
  else
    MessageDlg(_MSG_GAGAL_SIMPAN + #13 + 'Dengan Error : ' + AErrorMessage , mtError, [mbYes], 0)

end;

class function TAppUtils.FileToString(AFileName : String; Var ASize : Double):
    string;
var
  fs: TfileStream;
begin
  fs := TFileStream.Create(AFileName, fmOpenRead);
  try
    ASize := LoadFromStreamToString(fs, Result);
  finally
    fs.Free;
  end;
end;

class function TAppUtils.GetAppPath: string;
begin
  Result := ExtractFilePath(ParamStr(0));
end;

class function TAppUtils.GetAppVersion:string;
var
  Size, Size2: DWord;
  Pt, Pt2: Pointer;
begin
 Size := GetFileVersionInfoSize(PChar (ParamStr(0)), Size2);
 if Size > 0 then
 begin
   GetMem (Pt, Size);
   try
      GetFileVersionInfo (PChar (ParamStr (0)), 0, Size, Pt);
      VerQueryValue (Pt, '\', Pt2, Size2);
      with TVSFixedFileInfo (Pt2^) do
      begin
        Result:= ' Ver '+
                 IntToStr (HiWord (dwFileVersionMS)) + '.' +
                 IntToStr (LoWord (dwFileVersionMS)) + '.' +
                 IntToStr (HiWord (dwFileVersionLS)) + '.' +
                 IntToStr (LoWord (dwFileVersionLS));
     end;
   finally
     FreeMem (Pt);
   end;
 end;
end;

class function TAppUtils.GetBarisKosong(ASG : TcxGridTableView; AKolAcuan :
    Integer): Integer;
var
  i: Integer;
  sDataAcuan: string;
begin
  Result := 0;

  for i := 0 to ASG.DataController.RecordCount -1 do
  begin
    sDataAcuan := '';
    if (not VarIsNull(ASG.DataController.Values[i, AKolAcuan])) then
      sDataAcuan := ASG.DataController.Values[i, AKolAcuan];

    if  Trim(sDataAcuan) = '' then
    begin
      Result := i;
      Exit;
    end;
  end;


  if Result = 0 then
  begin
    ASG.DataController.RecordCount := ASG.DataController.RecordCount + 1;
    Result := ASG.DataController.RecordCount - 1;
  end;
end;

class function TAppUtils.GetEnvirontmentVariable(Const AVarName : String):
    string;
var
   c: array[0..1023] of Char;
begin
   if ExpandEnvironmentStrings(PChar(AVarName), c, 1024) = 0 then
     Result := AVarName
   else
     Result := Trim(c);
end;

class function TAppUtils.GetGeneralVar(AVar : String) : String;
begin
  Result := 'D:\SharedProjects\Projects\GAIS\Debug\Win32\';
end;

class function TAppUtils.GetValue(ADataController : TcxGridDataController;
    ABaris : Integer; AKolom : Integer; AdefaultValue : Variant): Variant;
begin
  Result := AdefaultValue;
  if not VarIsNull(ADataController.Values[ABaris,AKolom]) then
    Result := ADataController.Values[ABaris,AKolom];

end;

class procedure TAppUtils.HapusBaris(ASG : TcxGridTableView; ABaris : Integer);
begin
  if ABaris < ASG.DataController.RecordCount then
    ASG.DataController.DeleteRecord(ABaris);

end;

class procedure TAppUtils.HapusBarisAll(ASG : TcxGridTableView);
var
  i: Integer;
begin
  for i := ASG.DataController.RecordCount - 1 downto 0 do
    TAppUtils.HapusBaris(ASG, i);
end;

class function TAppUtils.HitungKarakterReplace(AStringHitung : Char;
    AStringSource : String): Integer;
begin
  Result := Length(AStringSource) - Length(StringReplace(AStringSource, AStringHitung, '', [rfReplaceAll, rfIgnoreCase])) + 1;
end;

class function TAppUtils.HitungKarakterLooping(AStringHitung : Char;
    AStringSource : String): Integer;
var
  i: Integer;
begin
   Result := 0;

   for i := 1 to Length(AStringSource) do
    if AStringSource[i] = AStringHitung then
      Result := Result + 1;
end;

class procedure TAppUtils.Information(const Text: string);
begin
  MessageDlg(Text, mtInformation, [mbYes], 0);;
end;

class procedure TAppUtils.InformationBerhasilHapus;
begin
  MessageDlg(_MSG_BERHASIL_HAPUS, mtInformation, [mbYes], 0);;
end;

class procedure TAppUtils.InformationBerhasilSimpan;
begin
  MessageDlg(_MSG_BERHASIL_SIMPAN, mtInformation, [mbYes], 0);;
end;

class procedure TAppUtils.InformationBerhasilSimpan(aNoBukti: string);
begin
  MessageDlg(_MSG_BERHASIL_SIMPAN_NOBUKTI + ' ->  '+ aNoBukti + '  <- ',
              mtInformation, [mbYes], 0);;
end;

class function TAppUtils.IsDeveloperMode: Boolean;
begin
  {$WARN SYMBOL_PLATFORM OFF}
  Result := DebugHook <> 0;
  {$WARN SYMBOL_PLATFORM OFF}
end;

class function TAppUtils.ParseSpace(aColName: string): string;
var
  iPos: Integer;
  s: string;
begin
  aColName:= Trim(aColName);

  iPos:= PosEx(sSpace, aColName) ;
  if iPos > 0 then
    s:= UpperCase(Trim(Copy(aColName, iPos + 1, Length(aColName) - iPos)))
  else
    s := UpperCase(Trim(aColName));

  Result:= s;
end;

class function TAppUtils.Quot(aString : String): String;
begin
    result := QuotedSTr(trim(Astring));
end;

class function TAppUtils.QuotD(aDate : TDateTime; aTambahJam235959 : Boolean =
    false): String;
begin
    if not aTambahJam235959 then
    begin
      Result := Quot(FormatDateTime('mm/dd/yyyy', aDate));
    end else
    begin
      Result := Quot(FormatDateTime('mm/dd/yyyy 23:59:59', aDate));
    end;
end;

class function TAppUtils.QuotDLong(aDate : TDateTime): String;
begin
    result := Quot(FormatDateTime('dd mmm yyyy', aDate));
end;

class function TAppUtils.QuotDt(aDate : TDateTime): String;
begin
    result := Quot(FormatDateTime('mm/dd/yyyy hh:mm:ss', aDate));
end;

class function TAppUtils.QuotDT(aDate : TDateTime; aTambahJam235959 : Boolean):
    String;
begin
    if not aTambahJam235959 then
    begin
      Result := Quot(FormatDateTime('mm/dd/yyyy hh:mm:ss', aDate));
    end else
    begin
      Result := Quot(FormatDateTime('mm/dd/yyyy 23:59:59', aDate));
    end;
end;

class function TAppUtils.ParseStrToArr(aStr: string; aSep: Char): TStrings;
const
  sCres : Char = '#';
  sAs   : string = ' as ';
var
  i: Integer;
  iPos1: Integer;
  nDelimeter: Integer;
  s: string;
  sKol: string;
  iPos2: Integer;
  sKolAs: string;
  aFld: string;
//  sS: TStrings;
begin

    S:= aStr;
    nDelimeter:= 0;
    while Pos(aSep, s) > 0 do
    begin
      S[Pos(aSep, S)] := sCres;
      Inc(nDelimeter);
    end;

  Result:= TStringList.Create;
    for i:= 0 to nDelimeter do
    begin
      iPos1 := PosEx(sCres, s);

      if iPos1 > 0 then
      begin
        sKolAs  := Copy(s, 1, iPos1 - 1);

        s := Trim(Copy(s, iPos1 + 1, Length(s)- iPos1));

        iPos2 := PosEx(sAs, sKolAs);
        if iPos2 > 0 then
          sKol:= Trim(Copy(sKolAs, 1, iPos2 - 1))
        else
          sKol:= Trim(sKolAs);


        aFld:= ParseSpace(sKol);

      end
      else
      begin
        aFld:= Trim(UpperCase(s));

      end;
      Result.Append(aFld);

    end;


end;

class function TAppUtils.ConverToFilter(ADate : TDateTime; AFormat : String =
    'dd MMM YYYY'): String;
begin
  Result := FormatDateTime(AFormat, ADate);
end;

class function TAppUtils.LoadFromStreamToString(Stream: TStream; var myString:
    String; Encoding: TEncoding = nil): Double;
var
  Size: Integer;
  Buffer: TBytes;
begin
  Result := Stream.Size / 1024;
  try
    Stream.Position := 0;
    Size := Stream.Size;

    SetLength(Buffer, Size);

    Stream.ReadBuffer(Pointer(Buffer)^, Size);

    Size := TEncoding.GetBufferEncoding(Buffer, Encoding);
    myString := Encoding.GetString(Buffer, Size, Length(Buffer) - Size);
  except
    on E : Exception do
    begin
      TAppUtils.Error('Ada Kesalahan ' + E.Message);
    end;
  end;
end;

class function TAppUtils.QuotF(ANumber : Double): String;
begin
  Result := QuotedSTr(trim(FloatToStr(ANumber)));
end;

class procedure TAppUtils.SetFocus(ABaris : Integer; ADataController :
    TcxGridDataController);
begin
  ADataController.SetFocus;
  ADataController.FocusedRecordIndex := ABaris;
end;

class procedure TAppUtils.SetHeaderGrid(AHeader: array of String; var ADBGrid:
    TcxGridDBTableView);
var
  i: Integer;
begin
  for i := low(AHeader) to high(AHeader) do
  begin
    if i <= ADBGrid.ColumnCount - 1 then
      ADBGrid.Columns[i].Caption:= AHeader[i];
  end;

end;

//class procedure TAppUtils.SetItemAtComboObject(AComboBox : TComboBox; AID :
//    String);
//var
//  i: Integer;
//begin
//  AComboBox.ItemIndex := -1;
//
//  for i := 0 to aComboBox.Items.Count - 1 do
//  begin
//    if TComboObject(aComboBox.Items.Objects[i]).cmbID = aID then
//    begin
//      AComboBox.ItemIndex := i;
//      Exit;
//    end;
//  end;
//end;
//
//class procedure TAppUtils.SetItemAtComboObject(AComboBox : TcxComboBox; AID :
//    String);
//var
//  i: Integer;
//begin
//  AComboBox.ItemIndex := -1;
//
//  for i := 0 to aComboBox.Properties.Items.Count - 1 do
//  begin
//    if TComboObject(aComboBox.Properties.Items.Objects[i]).cmbID = aID then
//    begin
//      AComboBox.ItemIndex := i;
//      Exit;
//    end;
//  end;
//end;

class procedure TAppUtils.SetRegionalSetting_ID;
begin
  {$IF CompilerVersion >= 22}
   with FormatSettings do
   begin
     CurrencyString := 'Rp.';
     CurrencyFormat := 2; {Contoh: 'Rp. 1'}
     NegCurrFormat := 14; {Contoh: '(Rp. 1)'}
     CurrencyDecimals := 2;
     TimeAMString := 'AM';
     TimePMString := 'PM';
     ThousandSeparator := '.';
     DecimalSeparator := ',';
     DateSeparator := '/';
     TimeSeparator := ':';
     LongTimeFormat := 'hh:mm:ss';
     ShortTimeFormat := 'hh:mm';
     ShortDateFormat := 'dd/mm/yyyy';
     LongDateFormat := 'dd mmmm yyyy';

     LongDayNames[1] := 'Senin';
     LongDayNames[2] := 'Selasa';
     LongDayNames[3] := 'Rabu';
     LongDayNames[4] := 'Kamis';
     LongDayNames[5] := 'Jumat';
     LongDayNames[6] := 'Sabtu';
     LongDayNames[7] := 'Minggu';

     ShortDayNames[1] := 'Sen';
     ShortDayNames[2] := 'Sel';
     ShortDayNames[3] := 'Rab';
     ShortDayNames[4] := 'Kam';
     ShortDayNames[5] := 'Jum';
     ShortDayNames[6] := 'Sab';
     ShortDayNames[7] := 'Ming';

     ShortMonthNames[1] := 'Jan';
     ShortMonthNames[2] := 'Feb';
     ShortMonthNames[3] := 'Mar';
     ShortMonthNames[4] := 'Apr';
     ShortMonthNames[5] := 'Mei';
     ShortMonthNames[6] := 'Jun';
     ShortMonthNames[7] := 'Jul';
     ShortMonthNames[8] := 'Agt';
     ShortMonthNames[9] := 'Sep';
     ShortMonthNames[10] := 'Okt';
     ShortMonthNames[11] := 'Nov';
     ShortMonthNames[12] := 'Des';

     LongMonthNames[1] := 'Januari';
     LongMonthNames[2] := 'Februari';
     LongMonthNames[3] := 'Maret';
     LongMonthNames[4] := 'April';
     LongMonthNames[5] := 'Mei';
     LongMonthNames[6] := 'Juni';
     LongMonthNames[7] := 'Juli';
     LongMonthNames[8] := 'Agustus';
     LongMonthNames[9] := 'September';
     LongMonthNames[10] := 'Oktober';
     LongMonthNames[11] := 'November';
     LongMonthNames[12] := 'Desember';
   end;
  {$ELSE}
    CurrencyString := 'Rp.';
     CurrencyFormat := 2; {Contoh: 'Rp. 1'}
     NegCurrFormat := 14; {Contoh: '(Rp. 1)'}
     CurrencyDecimals := 2;
     TimeAMString := 'AM';
     TimePMString := 'PM';
     ThousandSeparator := '.';
     DecimalSeparator := ',';
     DateSeparator := '/';
     TimeSeparator := ':';
     LongTimeFormat := 'hh:mm:ss';
     ShortTimeFormat := 'hh:mm';
     ShortDateFormat := 'dd/mm/yyyy';
     LongDateFormat := 'dd mmmm yyyy';

     LongDayNames[1] := 'Senin';
     LongDayNames[2] := 'Selasa';
     LongDayNames[3] := 'Rabu';
     LongDayNames[4] := 'Kamis';
     LongDayNames[5] := 'Jumat';
     LongDayNames[6] := 'Sabtu';
     LongDayNames[7] := 'Minggu';

     ShortDayNames[1] := 'Sen';
     ShortDayNames[2] := 'Sel';
     ShortDayNames[3] := 'Rab';
     ShortDayNames[4] := 'Kam';
     ShortDayNames[5] := 'Jum';
     ShortDayNames[6] := 'Sab';
     ShortDayNames[7] := 'Ming';

     ShortMonthNames[1] := 'Jan';
     ShortMonthNames[2] := 'Feb';
     ShortMonthNames[3] := 'Mar';
     ShortMonthNames[4] := 'Apr';
     ShortMonthNames[5] := 'Mei';
     ShortMonthNames[6] := 'Jun';
     ShortMonthNames[7] := 'Jul';
     ShortMonthNames[8] := 'Agt';
     ShortMonthNames[9] := 'Sep';
     ShortMonthNames[10] := 'Okt';
     ShortMonthNames[11] := 'Nov';
     ShortMonthNames[12] := 'Des';

     LongMonthNames[1] := 'Januari';
     LongMonthNames[2] := 'Februari';
     LongMonthNames[3] := 'Maret';
     LongMonthNames[4] := 'April';
     LongMonthNames[5] := 'Mei';
     LongMonthNames[6] := 'Juni';
     LongMonthNames[7] := 'Juli';
     LongMonthNames[8] := 'Agustus';
     LongMonthNames[9] := 'September';
     LongMonthNames[10] := 'Oktober';
     LongMonthNames[11] := 'November';
     LongMonthNames[12] := 'Desember';

  {$IFEND}
end;

class function TAppUtils.StringToStrings(AString : String;  ASeparator :
    String): TStrings;
var
  i: Integer;
  sKolom: string;
begin
  Result := TStringList.Create;

  sKolom := '';

  for i := 1 to Length(AString) do
  begin
    if AString[i] = ASeparator then
    begin
      Result.Add(Trim(sKolom));
      sKolom := '';
    end else begin
      sKolom := sKolom + AString[i];
    end;
  end;

  if Trim(sKolom) <> '' then
  begin
    Result.Add(Trim(sKolom));
  end;
end;

class function TAppUtils.NumberToLetter(aNumber: Integer): string;
var
  iStartAlpha, isumAlpha, iAlphabet : Integer;
begin
  iStartAlpha := 64;
  isumAlpha   := 26;
  Result := '';
  iAlphabet := aNumber mod isumAlpha;
  Result := Chr(iAlphabet+iStartAlpha);
end;

class function TAppUtils.DateToTiseraDate(aTanggal: TDateTime; aSeparator:
    string = ' '): string;
var
  iYear, iMonth, iDay : Word;
begin
  DecodeDate(aTanggal, iYear, iMonth, iDay);
  Result := RightStr(IntToStr(iYear), 1) + aSeparator
         +  NumberToLetter(iMonth) + aSeparator
         +  IntToStr(iDay);
end;

class procedure TAppUtils.StrToFile(AFileName : String; AString : String);
var
  f: TextFile;
begin
  AssignFile(f, AFileName);
  Rewrite(F);
  Writeln(F, AString);
  CloseFile(F);
end;

class function TAppUtils.StrToStringStream(AString : String): TStream;
begin
  Result := TStringStream.Create(AString);
end;

class function TAppUtils.TambahkanKarakterNol(AAngka, ALength : Integer): string;
begin
  Result := SysUtils.Format('%.*d',[ALength, AAngka]);
end;

class function TAppUtils.TulisRegistry(aName, aValue: String; sAppName : String = ''): Boolean;
var
   Reg : TRegistry;
begin
    result := true;
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if sAppName = '' then
      begin
        if Reg.OpenKey('\Software\' + Application.Title, True) then
        begin
             Reg.WriteString(aName, aValue);
             Reg.CloseKey;
        end
      end else begin
        if Reg.OpenKey('\Software\' + sAppName, True) then
        begin
             Reg.WriteString(aName, aValue);
             Reg.CloseKey;
        end;
      end;
    Except
      result := false;
      Reg.Free;
      exit;
    end;
   Reg.Free;
end;

class function  TAppUtils.VarIsBoolean(const V: Variant): Boolean;
begin
   Result := VarIsType(V, varBoolean);
end;

class procedure TAppUtils.Warning(const Text: string);
begin
  MessageDlg(Text, mtWarning, [mbYes], 0);
end;


//class procedure TAppUtils.CreateJsonValueByField(AArray : ISuperObject; Field:
//    TField);
////var
////  JsonTyp, FieldTyp : string;
////  tmpStr : string;
//begin
////  Field.DataType.
//  if Field Is TBooleanField then begin
//    if Field.AsBoolean then
//      AArray.I[Field.FieldName] := 1
//    else
//      AArray.I[Field.FieldName] := 0
//  end else if Field Is TSQLTimeStampField then begin
//      AArray.O[Field.FieldName] := SO('"'+FormatDateTime('yyyy-mm-dd hh:nn:ss',Field.AsDateTime)+'"')
//  end else if Field Is TDateField then begin
//      AArray.O[Field.FieldName] := SO('"'+FormatDateTime('yyyy-mm-dd',Field.AsDateTime)+'"')
//  end else if Field Is TDateTimeField then begin
//      AArray.O[Field.FieldName] := SO('"'+FormatDateTime('yyyy-mm-dd hh:nn:ss',Field.AsDateTime)+'"')
//  end else if Field is TMemoField then begin
//      AArray.S[Field.FieldName] := Field.AsString
//  end else if Field is TBlobField then begin
//      AArray.S[Field.FieldName] := Field.AsString
//  end else if Field is TStringField then begin
//      AArray.S[Field.FieldName] := Field.AsString
//  end else if Field is TFloatField then begin
//      AArray.O[Field.FieldName] := SO(ReplaceStr(Field.AsString,',','.'))
//  end else begin
//      AArray.O[Field.FieldName] := SO(Field.Value);
//  end;
//end;
//
//
//class function TAppUtils.DataSetToJSON(ACaption : String; AQ: TSQLQuery; AKey :
//    String): ISuperObject;
//var
//  i: Integer;
////  j: Integer;
//  lData: ISuperObject;
////  SS: TStrings;
////  x: TGuid;
//begin
//  Result := SO;
//  Result.O[ACaption] := SA([]);
//
//  AQ.First;
//  while not AQ.Eof do
//  begin
//    lData := SO;
//    for i := 0 to AQ.FieldCount - 1 do
//      TAppUtils.CreateJsonValueByField(lData, AQ.Fields[i]);
//
//    Result.A[ACaption].Add(lData);
//    AQ.Next;
//  end;
//end;
//
//class function TAppUtils.DataSetToJSON(ACaption : String; ASQL : String; AKey :
//    String): ISuperObject;
////var
////  Q: TSQLQuery;
//begin
////  Q := TMainModule.cOpenQuery(ASQL);
////  try
////    Result := TAppUtils.DataSetToJSON(ACaption, Q, AKey);
////  finally
////    Q.Free;
////  end;
//end;
//
// There is one more StrToOEM  function in the JRZip Unit
class function TAppUtils.StrToOEM(s:string): string;
var
  i  : integer;
begin
  for i:=1 to length(s) do
  begin
    if s[i]>=#128 then s[i]:='_';
  end;
  result:=s;
end;

class function TAppUtils.BytesToStr(const Bytes: TBytes): string;
var
  I: Integer;
begin
  Result := '';
  for I := Low(Bytes) to High(Bytes) do
    Result := Result + LowerCase(IntToHex(Bytes[I], 2));
end;

class procedure TAppUtils.IncStepProgressBar(AStep : Integer; ANomorPB :
    Integer = 0);
var
  lPB: TProgressBar;
begin
  lPB := PB;
  if AnomorPB <> 0 then
    lPB := PB1;

  if lPB <> nil then
  begin
    lPB.StepBy(AStep);
  end;

  TPanel(lPB.Parent).Caption := 'Data ' +  IntToStr(lPB.Position) + ' / ' + IntToStr(lPB.Max);


end;

class procedure TAppUtils.InisialisasiProgressBar(AParent : TWinControl; AMax :
    Integer; ANomorPB : Integer = 0);
var
  lPanel: TPanel;
  lPB: TProgressBar;
begin
  if AnomorPB = 0 then
  begin
    if PB = nil then
    begin
      lPanel                   := TPanel.Create(AParent);
      lPanel.VerticalAlignment := taAlignBottom;
      lPanel.Parent            := AParent;
      lPanel.Align             := alBottom;
      lPanel.Height            := 30;
      lPanel.Visible           := True;
      PB                       := TProgressBar.Create(lPanel);
      PB.Parent                := lPanel;
    end;

    lPB := PB;
  end else begin
    if PB1 = nil then
    begin
      lPanel                   := TPanel.Create(AParent);
      lPanel.VerticalAlignment := taAlignBottom;
      lPanel.Parent            := AParent;
      lPanel.Align             := alBottom;
      lPanel.Height            := 30;
      lPanel.Visible           := True;
      PB1                      := TProgressBar.Create(lPanel);
      PB1.Parent               := lPanel;
    end;

    lPB := PB1;
  end;

//  lPB.Parent  := lPanel;
  lPB.Visible := True;
  lPB.Width   := Floor(AParent.Width / 2);
  lPB.Left    := Floor(lPB.Width/2);
  lPB.Top     := AParent.Top + 10;
  lPB.Step    := 0;
  lPB.Max     := AMax;
  lPB.Align   := alTop;

//  lPB.BringToFront;
end;

class procedure TAppUtils.FinalisasiProgressBar(ANomorPB : Integer = 0);
begin
  if AnomorPB = 0 then
  begin
    if PB <> nil then
    begin
      PB.Parent.Free;
      PB := nil;
    end;
  end else begin
    if PB1 <> nil then
    begin
      PB1.Parent.Free;
      PB1 := nil;
    end;
  end;
end;

class function TAppUtils.DecPeriode(APeriode : Integer): Integer;
begin
  case APeriode of
    201101 : Result := 201012;
    201201 : Result := 201112;
    201301 : Result := 201212;
    201401 : Result := 201312;
    201501 : Result := 201412;
    201601 : Result := 201512;
    201701 : Result := 201612;
    201801 : Result := 201712;
    201901 : Result := 201812;
    202001 : Result := 201912;
    202101 : Result := 202012;
    202201 : Result := 202112;
    202301 : Result := 202212;
    202401 : Result := 202312;
  else
    Result := APeriode + 1;
  end;
end;

class function TAppUtils.StrToBytes(const value: string): TBytes;
var
  I: Integer;
begin
  SetLength(Result, Length(value) div 2);
  for I := Low(Result) to High(Result) do
    Result[I] := StrToIntDef('$' + Copy(value, (I * 2) + 1, 2), 0);
end;

procedure TcxGridDBTableViewHelper.AutoFormatCurrency(ADisplayFormat: String =
    ',0;(,0)');
var
  i: Integer;
  lDS: TDataSet;
begin
  lDS := Self.DataController.DataSource.DataSet;

  //why use DS, because sometime format CDS <> grid.column.format
  for i := 0 to lDS.FieldCount-1 do
  begin
    If not Assigned(Self.GetColumnByFieldName(lDS.Fields[i].FieldName)) then
      continue;
    with Self.GetColumnByFieldName(lDS.Fields[i].FieldName) do
    begin
      If lDS.Fields[i].DataType = ftFloat then
      begin
        PropertiesClassName := 'TcxCurrencyEditProperties';
        TcxCurrencyEditProperties( Properties).DisplayFormat := ADisplayFormat;
        TcxCurrencyEditProperties( Properties).Alignment.Horz := taRightJustify;
        DataBinding.ValueType := 'Float';
      end;
    end;
  end;
end;

procedure TcxGridDBTableViewHelper.AutoFormatDate(ADisplayFormat: String =
    'yyyy/mm/dd');
var
  i: Integer;
  lDS: TDataSet;
begin
  lDS := Self.DataController.DataSource.DataSet;

  //why use DS, because sometime format CDS <> grid.column.format
  for i := 0 to lDS.FieldCount-1 do
  begin
    If not Assigned(Self.GetColumnByFieldName(lDS.Fields[i].FieldName)) then
      continue;
    with Self.GetColumnByFieldName(lDS.Fields[i].FieldName) do
    begin
      If lDS.Fields[i].DataType in [ftDate, ftDateTime] then
      begin
        PropertiesClassName := 'TcxDateEditProperties';
        TcxDateEditProperties( Properties).DisplayFormat := ADisplayFormat;
        TcxDateEditProperties( Properties).EditMask := ADisplayFormat;
        DataBinding.ValueType := 'DateTime';
      end;
    end;
  end;
end;

function TcxGridDBTableViewHelper.DS: TDataset;
begin
  Result := Self.DataController.DataSource.DataSet;
  // TODO -cMM: TcxGridDBTableViewHelper.DS default body inserted
end;

procedure TcxGridDBTableViewHelper.ExportToXLS(sFileName: String = '');
var
  DoSave: Boolean;
  lSaveDlg: TSaveDialog;
begin
  DoSave := True;
  If sFileName = '' then
  begin
    lSaveDlg := TSaveDialog.Create(nil);
    Try
      if lSaveDlg.Execute then
        sFileName := lSaveDlg.FileName
      else
        DoSave := False;
    Finally
      lSaveDlg.Free;
    End;
  end;

  If DoSave then
  begin
    Try
      ExportGridToExcel(sFileName, TcxGrid(Self.Control));
      TAppUtils.Information('Data berhasil diexport ke: ' + sFileName);
    except
      TAppUtils.Warning('Gagal menyimpan data ke excel');
    end;
  end;
end;

function TcxGridDBTableViewHelper.GetFooterSummary(aColumn:
    TcxGridDBBandedColumn): Variant;
var
  i: Integer;
begin
  Result := 0;

  with Self.DataController.Summary do
  begin
    for i :=0 to FooterSummaryItems.Count-1 do
    begin
//      If FooterSummaryItems.Items[i].ItemLink.ClassName <> aColumn.ClassName then
//        continue;

      If FooterSummaryItems.Items[i].ItemLink = aColumn then
        Result := FooterSummaryValues[i];
    end;
  end;
end;

procedure TcxGridDBTableViewHelper.SetAllUpperCaseColumn;
var
  i: Integer;
begin
  for i := 0 to Self.ColumnCount-1 do
  begin
    Self.Columns[i].Caption := UpperCase(Self.Columns[i].Caption);
  end;
end;

procedure TcxGridDBTableViewHelper.SetColumnsCaption(ColumnSets, ColumnCaption:
    Array Of String);
var
  i: Integer;
begin
  for i := Low(ColumnSets) to High(ColumnSets) do
  begin
    If Assigned(Self.GetColumnByFieldName(ColumnSets[i])) then
      Self.GetColumnByFieldName(ColumnSets[i]).Caption := ColumnCaption[i];
  end;
end;

procedure TcxGridDBTableViewHelper.SetDataset(ADataset : TDataset;
    AAutoCreateField : Boolean=False);
var
  I: Integer;
begin
  if Self.DataController.DataSource = nil then
    Self.DataController.DataSource := TDataSource.Create(Self);

  Self.DataController.DataSource.DataSet := ADataset;
  if AAutoCreateField then
  begin
    Self.DataController.CreateAllItems(True);
    for I := 0 to Self.ColumnCount - 1 do
    begin
      Self.Columns[i].Caption := UpperCase(Trim(' ' + Self.Columns[i].Caption) + ' ');
      Self.Columns[i].Caption := StringReplace(Self.Columns[i].Caption ,'_', ' ',[rfReplaceAll]);
      Self.Columns[i].HeaderAlignmentHorz := taCenter;

//      if Self.Columns[i].DataBinding.ValueTypeClass  = tks

    end;
  end;

end;

procedure TcxGridDBTableViewHelper.SetDataset(ASQL : String; AAutoCreateField :
    Boolean = False);
var
  lCDS: TClientDataSet;
begin
  lCDS := TDBUtils.OpenDataset(ASQL);
  Self.SetDataset(lCDS, AAutoCreateField);
end;

procedure TcxGridDBTableViewHelper.SetDetailKeyField(aKeyField: String);
begin
  Self.DataController.MasterKeyFieldNames   := aKeyField ;
end;

procedure TcxGridDBTableViewHelper.SetExtLookupCombo(ExtLookup:
    TcxExtLookupComboBox; IDField, DisplayField: String; HideIDField: Boolean =
    True);
begin
  SetExtLookupCombo( ExtLookup.Properties , IDField, DisplayField, HideIDField);
end;

procedure TcxGridDBTableViewHelper.SetExtLookupCombo(ExtLookupProp:
    TcxExtLookupComboBoxProperties; IDField, DisplayField: String; HideIDField:
    Boolean = True);
begin
  with ExtLookupProp do
  begin
    View              := Self;
    KeyFieldNames     := IDField;
    If HideIDField then Self.SetVisibleColumns([IDField],False);
    ListFieldItem     := Self.GetColumnByFieldName(DisplayField);
    DropDownAutoSize  := True;
  end;
  ExtLookupProp.PopupAutoSize := True;
  Self.OptionsBehavior.BestFitMaxRecordCount := 0;
  Self.ApplyBestFit;
end;

procedure TcxGridDBTableViewHelper.SetMasterKeyField(aKeyField: String);
begin
  Self.DataController.DetailKeyFieldNames   := aKeyField ;
end;

procedure TcxGridDBTableViewHelper.SetVisibleColumns(ColumnSets: Array Of
    String; IsVisible: Boolean);
var
  i: Integer;
begin
  for i := Low(ColumnSets) to High(ColumnSets) do
  begin
    If Assigned(Self.GetColumnByFieldName(ColumnSets[i])) then
      Self.GetColumnByFieldName(ColumnSets[i]).Visible := IsVisible;
  end;
end;

procedure TcxGridTableViewHelper.AddRow;
begin
  Self.DataController.RecordCount := Self.DataController.RecordCount + 1;
end;

procedure TcxGridTableViewHelper.ClearRows;
var
  I: Integer;
begin
  BeginUpdate;
  try
    for I := DataController.RecordCount - 1 downto 0 do
    begin
      DataController.FocusedRecordIndex := i;
      DataController.DeleteFocused;
    end;
  finally
    EndUpdate;
  end;
end;

function TcxGridTableViewHelper.FocusedIndex: Integer;
begin
  Result := Self.DataController.FocusedRecordIndex;
end;

function TcxGridTableViewHelper.GetDouble(ARec, ACol : Integer): Double;
begin
  if Self.DataController.Values[ARec, ACol] = null  then
    Result := 0
  else
    Result := Self.DataController.Values[ARec, ACol];
end;

function TcxGridTableViewHelper.GetString(ARec, ACol : Integer): string;
begin
  if Self.DataController.Values[ARec, ACol] = null  then
    Result := ''
  else
    Result := Self.DataController.Values[ARec, ACol];
end;

function TcxGridTableViewHelper.GetInteger(ARec, ACol : Integer): Integer;
begin
  if Self.DataController.Values[ARec, ACol] = null  then
    Result := 0
  else
    Result := Self.DataController.Values[ARec, ACol];
end;

function TcxGridTableViewHelper.GetDate(ARec, ACol : Integer): TDatetime;
begin
  Result := Self.DataController.Values[ARec, ACol];
end;

procedure TcxGridTableViewHelper.LoadObjectData(AObject : TAppObject; ARow :
    Integer);
var
  ctx : TRttiContext;
  rt : TRttiType;
  prop : TRttiProperty;
  meth : TRttiMethod;
  I: Integer;
  lAppObject: TAppObject;
begin
  ctx := TRttiContext.Create();
  try
    rt := ctx.GetType(AObject.ClassType);
    for prop in rt.GetProperties() do
    begin
      if UpperCase(prop.Name) = 'URUTAN' then
      begin
        prop.SetValue(AObject,ARow);
      end;

      for I := 0 to Self.ColumnCount - 1 do
      begin
        if UpperCase(prop.Name) = UpperCase(Self.Columns[i].AlternateCaption) then
        begin
          if prop.Visibility <> mvPublished then
            Continue;

          case prop.PropertyType.TypeKind of
            tkInteger : prop.SetValue(AObject,Self.GetInteger(ARow,i));
            tkFloat   : prop.SetValue(AObject,Self.GetDouble(ARow,i));
            tkUString : prop.SetValue(AObject,Self.GetString(ARow,i));
            tkClass   : begin
                        meth := prop.PropertyType.GetMethod('ToArray');
                        if Assigned(meth) then
                        begin
                          Continue;
                        end else begin
                          meth          := prop.PropertyType.GetMethod('Create');
                          lAppObject    := TAppObject(meth.Invoke(prop.PropertyType.AsInstance.MetaclassType, []).AsObject);
                          lAppObject.ID := Self.GetString(ARow,i);

                          prop.SetValue(AOBject, lAppObject);
                        end;
                      end;
          end;
        end;
      end;
    end;
  finally
    ctx.Free();
  end;

end;

procedure TcxGridTableViewHelper.SetObjectData(AObject : TAppObject; ARow :
    Integer);
var
  ctx : TRttiContext;
  rt : TRttiType;
  prop : TRttiProperty;
  j: Integer;

begin
  ctx := TRttiContext.Create();
  try
    rt := ctx.GetType(AObject.ClassType);
      for prop in rt.GetProperties() do
      begin
        for j := 0 to Self.ColumnCount - 1 do
        begin

          if UpperCase(prop.Name) <> UpperCase(Self.Columns[j].AlternateCaption) then
            Continue;

          case prop.PropertyType.TypeKind of
            tkClass   : begin
                          Self.SetValue(ARow,j,TAppObject(prop.GetValue(AObject).AsObject).ID);
                        end;
            tkInteger : Self.SetValue(ARow,j,prop.GetValue(AObject).AsInteger);

            tkFloat   : //if CompareText('TDateTime',prop.PropertyType.Name)=0 then
  //                          Self.SetValue(i,j,QuotedStr(FormatDateTime('MM/dd/yyyy hh:mm:ss',prop.GetValue(AObject).AsExtended)))
  //                        else
                          Self.SetValue(ARow,j,prop.GetValue(AObject).AsExtended);

            tkUString : Self.SetValue(ARow,j,prop.GetValue(AObject).AsString);
          end;
        end;
      end;
  finally
    ctx.Free;
  end;
end;

procedure TcxGridTableViewHelper.SetValue(ARec, ACol : Integer; AValue :
    Variant);
begin
  DataController.Values[ARec,ACol] := AValue;
end;

procedure TcxGridTableViewHelper.SetDouble(ARec, ACol : Integer; AValue :
    Double);
begin
  DataController.Values[ARec,ACol] := AValue;
end;

function TcxGridTableViewHelper.Summary(ACol : Integer): Double;
var
  iGroupIndex: Integer;
  iIndex: Integer;
begin
  with DataController do
  begin
    iGroupIndex := Groups.DataGroupIndexByRowIndex[0];
    iIndex      :=  Summary.DefaultGroupSummaryItems.IndexOfItemLink(Self.Columns[ACol]);
    Result      := Summary.GroupSummaryValues[iGroupIndex, iIndex]
  end;
end;

function TcxExtLookupHelper.cxDBTableGrid: TcxGridDBTableView;
begin
  Result := Self.View as TcxGridDBTableView;
end;

function TcxExtLookupHelper.Dataset: TDataset;
begin
  Result := (Self.View as TcxGridDBTableView).DataController.DataSource.DataSet;
end;

procedure TcxExtLookupHelper.LoadFromCDS(aCDS: TClientDataSet; IDField,
    DisplayField: String; HideFields: Array Of String; aOwnerForm: TComponent);
var
  aRepo: TcxGridViewRepository;
  aView: TcxGridDBTableView;
  i: Integer;
begin
  aRepo := nil;
  for i := 0 to aOwnerForm.ComponentCount - 1 do
  begin
    If aOwnerForm.Components[i] is TcxGridViewRepository then
    begin
      aRepo := aOwnerForm.Components[i] as TcxGridViewRepository;
      break;
    end;
  end;
  If not Assigned(aRepo) then
  begin
    aRepo := TcxGridViewRepository.Create( aOwnerForm );
    aRepo.Name  := 'ViewRepository_' + IntToStr(Integer(aRepo));

  end;
  aView       := aRepo.CreateItem(TcxGridDBTableView) as TcxGridDBTableView;
  aView.Name  := 'GridView_' + IntToStr(Integer(aView));

  aView.OptionsView.GroupByBox        := False;
  aView.DataController.Filter.Active  := True;
  aView.FilterBox.Visible             := fvNever;

  aView.SetDataset(aCDS, True);
  aView.SetVisibleColumns(HideFields,False);
  aView.SetExtLookupCombo(Self, IDField, DisplayField, False);

  If Self.GetOwner is TcxExtLookupComboBox then
  begin
    if aView.VisibleColumnCount = 1 then
    begin
      If aView.VisibleColumns[0].Width < TcxExtLookupComboBox(Self.GetOwner).Width then
        aView.VisibleColumns[0].Width := TcxExtLookupComboBox(Self.GetOwner).Width
    end;
  end;
end;

procedure TcxExtLookupHelper.LoadFromSQL(aSQL, IDField, DisplayField: String;
    HideFields: Array Of String; aOwnerForm: TComponent);
var
  lCDS: TClientDataSet;
begin
  //method ini hanya digunakan sekali saja,
  //membuat cds sesuai owner form agar di free on destroy
  lCDS := TDBUtils.OpenDataset(aSQL);
  Self.LoadFromCDS(lCDS, IDField, DisplayField, HideFields, aOwnerForm);
end;

procedure TcxExtLookupHelper.SetMultiPurposeLookup(ADropDownAutoSize : Boolean =
    True);
begin
  AutoSearchOnPopup  := True;
  FocusPopup         := True;
  DropDownAutoSize   := ADropDownAutoSize;
  DropDownListStyle  := lsEditList;
  FocusPopup         := True;

  If Self.View is TcxGridDBTableView then
  begin
    Self.View.OptionsData.Editing           := False;
    Self.View.OptionsData.Inserting         := False;
    Self.View.OptionsData.Deleting          := False;
    Self.View.OptionsData.Appending         := False;
    Self.View.DataController.Filter.Options := [fcoCaseInsensitive];

    TcxGridDBTableView(Self.View).Tag       := 99;

    TcxGridDBTableView(Self.View).FilterRow.InfoText
      := 'Click Here & Press F2 To Define Filter (use "%" for parsial word)';
    TcxGridDBTableView(Self.View).FilterRow.Visible       := True;
    TcxGridDBTableView(Self.View).FilterRow.ApplyChanges  := fracImmediately;
  end;
  If not Assigned(Self.OnInitPopup) then
    Self.OnInitPopup := TcxExtLookup.OnInitPopupCustom;
end;

class procedure TcxExtLookup.OnInitPopupCustom(Sender: TObject);
begin
  If Sender is TcxExtLookupComboBox then
  begin
    TcxExtLookupComboBox(Sender).Properties.View.DataController.Filter.Clear;
    TcxExtLookupComboBox(Sender).Properties.ListFieldItem.Focused := True;
  end;
end;

//class function TAppUtils.Terbilang(x : LongInt): string;
//const abil : array[0..11] of string[10]=('','Satu ','Dua ','Tiga ', 'Empat ','Lima ','Enam ','Tujuh ','Delapan ','Sembilan ', 'Sepuluh ','Sebelas ');
//begin
//  if (x < 12) then Result := abil[x]
//  else
//  if (x < 20) then Result := Terbilang(x-10) + 'Belas '
//  else
//  if (x < 100) then Result := Terbilang(x div 10) + 'Puluh ' + Terbilang(x mod 10)
//  else
//  if (x < 200) then Result := 'Seratus ' + Terbilang(x-100)
//  else
//  if (x < 1000) then Result := Terbilang(x div 100) + 'Ratus ' + Terbilang(x mod 100)
//  else
//  if (x < 2000) then Result := 'Seribu ' + Terbilang(x-1000)
//  else
//  if (x < 1000000) then Result := Terbilang(x div 1000) + 'Ribu ' + Terbilang(x mod 1000)
//  else
//  if (x < 1000000000) then Result := Terbilang(x div 1000000) + 'Juta ' + Terbilang(x mod 1000000)
//  else
//   Result := Terbilang(x div 1000000000) + 'milyar ' + Terbilang(x mod 1000000000);
//end;



procedure TFormHelper.AssignKeyDownEvent;
var
  C: TComponent;
  i: Integer;
begin
  for i := 0 to Self.ComponentCount-1 do
  begin
    C := Self.Components[i];
    if C is TEdit then
      If not Assigned(TEdit(C).OnKeyDown) then
        TEdit(C).OnKeyDown := OnKeyEnter;
    if C is TcxTextEdit then
      If not Assigned(TcxTextEdit(C).OnKeyDown) then
        TcxTextEdit(C).OnKeyDown := OnKeyEnter;
    if C is TcxExtLookupComboBox then
    begin
      //bug: lookup standar, ketika user memilih dengan keyboard panah, lalu enter tidak ngefek
      //bug: lookup generic / multipurpose harus enter 2x
      //fix by this code :
      //1st postpopupvalue must be active
      TcxExtLookupComboBox(C).Properties.PostPopupValueOnTab := True;
      //2nd utk generic lookup tambahkan editvaluechanged post tab agar fokus pindah dari view ke lookup
      if TcxExtLookupComboBox(C).Properties.FocusPopup then
        if not Assigned(TcxExtLookupComboBox(C).Properties.OnEditValueChanged) then
          TcxExtLookupComboBox(C).Properties.OnEditValueChanged := OnEditValueChanged;
      //3rd onEnter send tab key
      if not Assigned(TcxExtLookupComboBox(C).OnKeyDown) then
        TcxExtLookupComboBox(C).OnKeyDown:= OnKeyEnter;
    end;
    if C is TcxComboBox then
      if not Assigned(TcxComboBox(C).OnKeyDown) then
        TcxComboBox(C).OnKeyDown := OnKeyEnter;
    if C is TcxCheckBox then
      if not Assigned(TcxCheckBox(C).OnKeyDown) then
        TcxCheckBox(C).OnKeyDown := OnKeyEnter;
    if C is TcxSpinEdit then
      if not Assigned(TcxSpinEdit(C).OnKeyDown) then
        TcxSpinEdit(C).OnKeyDown := OnKeyEnter;
    if C is TCheckBox then
      if not Assigned(TCheckBox(C).OnKeyDown) then
        TCheckBox(C).OnKeyDown := OnKeyEnter;
  end;
end;

procedure TFormHelper.ClearByTag(Tag: TTag);
var
  C: TComponent;
  i: Integer;
begin
  for i := 0 to Self.ComponentCount-1 do
  begin
    C := Self.Components[i];
    if not (C.Tag in Tag) then continue;
    if C is TEdit then TEdit(C).Clear else
    if C is TcxTextEdit then TcxTextEdit(C).Clear else
    if C is TcxExtLookupComboBox then TcxExtLookupComboBox(C).Clear else
    if C is TcxComboBox then TcxComboBox(C).Clear else
    if C is TcxCheckBox then TcxCheckBox(C).Clear else
    if C is TCheckBox then TCheckBox(C).Checked := False else
    if C is TcxSpinEdit then TcxSpinEdit(C).Clear else
    if C is TcxCurrencyEdit then TcxCurrencyEdit(C).Value := 0 else
    if C is TcxMemo then TcxMemo(C).Clear else
//    if C is TcxGridTableView then TcxGridTableView(C).ClearRows else
    if C is TcxDateEdit then TcxDateEdit(C).Date := Now;

  end;
end;

function TFormHelper.ValidateEmptyCtrl(Tag: TTag = [1]; ShowWarning: Boolean =
    True): Boolean;
var
  C: TComponent;
  i: Integer;
  iTabOrd: Integer;
  sMsg: string;
  EmptyCtrl: TWinControl;
  IsEmpty: Boolean;
begin
  IsEmpty   := False;
  iTabOrd   := MaxInt;
  EmptyCtrl := nil;
  for i := 0 to Self.ComponentCount-1 do
  begin
    C := Self.Components[i];
    if not (C.Tag in Tag) then continue;
    if not C.InheritsFrom(TWinControl) then continue;
    if C is TcxExtLookupComboBox then
      IsEmpty := VarIsNull(TcxExtLookupComboBox(C).EditValue)
    else if C is TcxComboBox then IsEmpty := TcxComboBox(C).ItemIndex = -1
    else if C is TComboBox then IsEmpty := TComboBox(C).ItemIndex = -1
    else if C is TcxTextEdit then IsEmpty := TcxTextEdit(C).Text = ''
    else if C is TEdit then IsEmpty := TEdit(C).Text = ''
    else if C is TcxSpinEdit then IsEmpty := TcxSpinEdit(C).Value = 0
    else if C is TcxCurrencyEdit then IsEmpty := TcxCurrencyEdit(C).Value = 0;
    if (IsEmpty) and (TWinControl(C).TabOrder < iTabOrd) then
    begin
      EmptyCtrl := TWinControl(C);
      iTabOrd   := EmptyCtrl.TabOrder;
    end;
  end;
  Result := EmptyCtrl = nil;
  if (not Result) {and (ShowWarning)} then
  begin
    SetFocusRec(EmptyCtrl);
    If ShowWarning then
    begin
      if EmptyCtrl.HelpKeyword <> '' then
        sMsg := EmptyCtrl.HelpKeyword + ' tidak boleh kosong'
      else
        sMsg := 'Input Tidak Boleh Kosong';
      TAppUtils.Warning(sMsg);
    end;
  end;
end;


procedure TFormHelper.OnKeyEnter(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if Sender is TcxExtLookupComboBox then
      Key := VK_TAB
    else
      SelectNext(Screen.ActiveControl, True, True);
  end else if Key = VK_F5 then
  begin
//    if Sender is TcxExtLookupComboBox then
//      TcxExtLookupComboBox(Sender).Properties.OnPopup(Sender); ;
  end;
end;

class procedure TFormHelper.OnEditValueChanged(Sender: TObject);
var
  sDebug: string;
begin
  if Sender is TcxExtLookupComboBox then
  begin
    //agar generic lookup cukup enter 1x utk pindah ke komponent
    Keybd_event(VK_TAB, 0, 0, 0);
    sDebug := TcxExtLookupComboBox(Sender).Name;
  end;
end;

function TFormHelper.SetFocusRec(aWinCTRL: TWinControl): Boolean;
begin
  Result := False;
  If aWinCTRL.Enabled and aWinCTRL.Visible then
  begin
    //kapan2 diterusin
//    if (aWinCTRL is TcxTabSheet) and (not aWinCTRL.Visible) then
//    begin
//      If (TcxPageControl(aWinCTRL.Parent).Enabled)
//      and (TcxPageControl(aWinCTRL.Parent).Visible) then
//        TcxPageControl(aWinCTRL.Parent).ActivePage := TcxTabSheet(aWinCTRL);
//      Result := True;
//    end else

    If aWinCTRL.Parent <> nil then
      Result := SetFocusRec(aWinCTRL.Parent)
    else
      Result := True;

    If Result then
      aWinCTRL.SetFocus;
  end;
end;

end.
