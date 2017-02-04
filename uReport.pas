unit uReport;

interface

uses
  Forms, Classes, Db, frxDesgn, frxClass, frxChart,
  frxRich, frxBarcode, ImgList, ComCtrls, ExtCtrls, frxOLE,
  frxCross, frxDMPExport, frxExportImage, frxExportRTF,
   frxExportHTML, frxGZip, frxExportPDF,
  frxChBox, frxExportText, frxExportCSV,
   frxCrypt,  frxGradient,
  DBXMsSQL,  SqlExpr, DBXCommon ,
  frxDBSet, FMTBcd, DBClient;

type
  TDBDatasets = array of TfrxDBDataset;

type
  TVariable = record
  private
    FCategory: string;
    FName: string;
    FValue: Variant;
  public
    property Category: string read FCategory write FCategory;
    property Name: string read FName write FName;
    property Value: Variant read FValue write FValue;
  end;

  TVariables = record
  private
  public
    Vars: Array Of TVariable;
    procedure AddVar(aCategory, aVarName: String; AVarValue: Variant);
  end;

  TCDSITem = class(TCollectionItem)
  private
    FCDS: TClientDataSet;
    FSQL: string;
    FCDSName: string;
  public
    constructor Create(aCollection : TCollection); override;
    destructor Destroy; override;
    property CDS: TClientDataSet read FCDS write FCDS;
    property SQL: string read FSQL write FSQL;
    property CDSName: string read FCDSName write FCDSName;
  end;

  TCDSItems = class(TCollection)
  private
    function GetCDSItem(Index: Integer): TCDSITem;
    procedure SetCDSItem(Index: Integer; const Value: TCDSITem);
  public
    function Add: TCDSITem;
    property CDSItem[Index: Integer]: TCDSITem read GetCDSItem write SetCDSItem;
        default;
  end;

  TTSReport = class(TComponent)
  private
    FFrxReport: TfrxReport;
    FNama: string;
    FDatasets: TCDSItems;
    FVariables: TVariables;
    procedure AddVar(const VarName: string; var Value: Variant);
    procedure SetNama(const Value: string);
    procedure SettingFrxDatasets;
    property Variables: TVariables read FVariables write FVariables;
  public

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddDataset(ADataset : TClientDataSet); overload;
    procedure AddDataset(ADataset: TClientDataSet; ASQL, AName: String); overload;
    procedure ShowReport(AReportFileName: String; AFolderReportPath: String = '');
        overload;
    procedure AddSQL(ASQL : String); overload;
    procedure AddSQL(ASQL, ANama: String); overload;
    procedure AddVariable(aCategory, AVarName: String; AVarValue: Variant);
    procedure ClearSQL;
    procedure ShowReport; overload;

    property Datasets: TCDSItems read FDatasets write FDatasets;
    property FrxReport: TfrxReport read FFrxReport write FFrxReport;
    property Nama: string read FNama write SetNama;
  published
  end;


implementation

uses
  SysUtils, uAppUtils;


function TCDSItems.Add: TCDSITem;
begin
  Result := TCDSITem(inherited  Add);
end;

function TCDSItems.GetCDSItem(Index: Integer): TCDSITem;
begin
  Result := (Inherited Items[Index]) AS TCDSITem;
end;

procedure TCDSItems.SetCDSItem(Index: Integer; const Value: TCDSITem);
begin
  Items[Index].Assign(Value);
end;

constructor TCDSITem.Create(aCollection : TCollection);
begin
  inherited;
end;

destructor TCDSITem.Destroy;
begin
  inherited;
  CDS.Free;
end;

constructor TTSReport.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Datasets   := TCDSItems.Create(TCDSITem);
  FrxReport  := TfrxReport.Create(Self);
end;

destructor TTSReport.Destroy;
begin
  FrxReport.Free;
  Datasets.Clear;
  Datasets.Free;
  inherited;
end;

procedure TTSReport.SetNama(const Value: string);
begin
  FNama := Value;
end;

procedure TTSReport.SettingFrxDatasets;
var
  frxDBDataset: TfrxDBDataset;
  i: Integer;
  sNama: string;
begin
  FrxReport.StoreInDFM:= False;
//  FrxReport.IniFile:= '';
//  FrxReport.EngineOptions.UseFileCache:= False;
  FrxReport.EngineOptions.IgnoreDevByZero:= True;


  FrxReport.DataSets.BeginUpdate;
  FrxReport.DataSets.Clear;

  for i := 0 to Datasets.Count - 1 do
  begin
    frxDBDataset          := TfrxDBDataset.Create(Self);

    sNama                 := 'Q' + IntToStr(i);
    frxDBDataset.DataSet  := Datasets[i].CDS;
    if (Datasets[i].CDSName = '') then
      frxDBDataset.Name   := sNama
    else
      frxDBDataset.Name   := Datasets[i].CDSName;

    FrxReport.DataSets.Add(frxDBDataset);
  end;
  FrxReport.DataSets.EndUpdate;
end;

procedure TTSReport.ClearSQL;
begin
  Datasets.Clear;
end;

procedure TTSReport.AddDataset(ADataset : TClientDataSet);
begin
  Datasets.Add.CDS := ADataset;
end;

procedure TTSReport.AddDataset(ADataset: TClientDataSet; ASQL, AName: String);
var
  lCDS: TClientdataset;
begin
  lCDS := TClientDataSet.Create(Self);
  lCDS.CloneCursor(ADataset, False);

  with Datasets.Add do
  begin
    CDS     := lCDS;
    CDSName := AName;
    SQL     := ASQL;
  end;
end;

procedure TTSReport.AddSQL(ASQL : String);
var
  CDS: TClientDataSet;
begin
  CDS := TClientDataSet.Create(Self);
//  CDS.ProviderName := DataModule2.CDSCommand2.ProviderName;
//  CDS.RemoteServer := DataModule2.CDSCommand2.RemoteServer;

//  case Datasets.Count of
//    0 : CDS := DataModule2.CDSCommand2;
//    1 : CDS := DataModule2.CDSCommand3;
//    2 : CDS := DataModule2.CDSCommand4;
//    3 : CDS := DataModule2.CDSCommand5;
//    4 : CDS := DataModule2.CDSCommand6;
//  end;

  CDS.Close;
  CDS.CommandText := ASQL;
  CDS.Open;
  AddDataset(CDS);
end;

procedure TTSReport.AddSQL(ASQL, ANama: String);
var
  CDS: TClientDataSet;
begin
  CDS := TClientDataSet.Create(Self);
//  CDS.ProviderName := DataModule2.CDSCommand2.ProviderName;
//  CDS.RemoteServer := DataModule2.CDSCommand2.RemoteServer;

//  case Datasets.Count of
//    0 : CDS := DataModule2.CDSCommand2;
//    1 : CDS := DataModule2.CDSCommand3;
//    2 : CDS := DataModule2.CDSCommand4;
//    3 : CDS := DataModule2.CDSCommand5;
//    4 : CDS := DataModule2.CDSCommand6;
//  end;

  CDS.Close;
  CDS.CommandText := ASQL;
  CDS.Open;
  AddDataset(CDS, ASQL, ANama);
end;

procedure TTSReport.AddVar(const VarName: string; var Value: Variant);
var
  i: Integer;
begin
  for i:= 0 to Pred(Length(Variables.Vars)) do
  begin
    if CompareText(VarName, Variables.Vars[i].Name) = 0 then
    begin
      Value:= Variables.Vars[i].Value;
    end;
  end;
end;

procedure TTSReport.AddVariable(aCategory, AVarName: String; AVarValue:
    Variant);
begin
  Variables.AddVar(aCategory, AVarName, AVarValue);
  { block by ATY
  with FrxReport.Variables.Add do
  begin
    Name:= ' ' + AVarName;
    Value:= AVarValue;
  end;
  FrxReport.Variables.AddVariable(AVarName, ' ' + AVarName, AVarValue);
  }
end;

procedure TTSReport.ShowReport(AReportFileName: String; AFolderReportPath:
    String = '');
begin
  Nama := AFolderReportPath + AReportFileName + '.fr3';
  if not LocaleFileExists(Nama) then
  begin
    Nama := 'Laporan\' + AReportFileName + '.fr3';
  end;
  ShowReport();
end;

procedure TTSReport.ShowReport;
begin
  SettingFrxDatasets;
  with FrxReport do
  begin
    FileName := Nama;
    FrxReport.ReportOptions.Name := ExtractFileName(Nama);
    if PrepareReport then
    begin
      OnGetValue:= AddVar;
      if TAppUtils.Confirm('Anda Mempunyai Hak Untuk Mendesain Report'
                            + #13 + 'Apakah Anda Akan Melakukan Desain Report ?') then
      begin
        if FileExists(FileName) then
        begin
          try
            LoadFromFile(FileName);
          except
            LoadFromFile('default');
          end;
        end else
        begin
          LoadFromFile('default.fr3');
        end;
        Application.ProcessMessages;
        DesignReport();
      end else begin
        if LoadFromFile(FileName) then
        begin
          ShowReport();
        end else
        Begin
          DesignReport;
        End;
      end;
      Application.ProcessMessages;
    end;
  end;
end;

procedure TVariables.AddVar(aCategory, aVarName: String; AVarValue: Variant);
var
  aNewIdx: Integer;
begin
  aNewIdx:= Length(Vars);
  System.SetLength(Vars, aNewIdx + 1);
  Vars[aNewIdx].Category:= aCategory;
  Vars[aNewIdx].Name:= aVarName;
  Vars[aNewIdx].Value:= AVarValue;
end;

end.
