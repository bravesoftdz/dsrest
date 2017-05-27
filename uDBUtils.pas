unit uDBUtils;

interface
uses
  IB, Rtti, uModel, typinfo, SysUtils, StrUtils,
  Forms, DBClient,
  Provider, uAppUtils, cxGridDBTableView, Generics.Collections, Classes, StdCtrls,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Phys.PG, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSSQL, Data.DB, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet;

type
  TDBUtils = class(TObject)
  private
    class function GenerateSQLInsert(AObject : TAppObject): string;
    class function GenerateSQLUpdate(AObject : TAppObject): string;
  protected
  public
    class function ConnectDB(ADBEngine, AServer, ADatabase, AUser , APassword,
        APort : String): Boolean;
    class procedure DataSetToCxDBGrid(ADataset : TDataset; ACxDBGrid :
        TcxGridDBTableView; AutoCreateFields : Boolean = False);
    class function DSToCDS(aDataset: TDataSet; aOwner: TComponent): TClientDataset;
        overload;
    class function ExecuteSQL(ASQL : String): Boolean;
    class function OpenDataset(ASQL : String; AOwner : TComponent = nil):
        TClientDataSet; overload;
    class function GenerateSQL(AObject : TAppObject): string;
    class function GenerateSQLDelete(AObject : TAppObject; AID : String): string;
    class function GenerateSQLSelect(AObject : TAppObject): string;
    class function GetNextID(AOBject : TAppObject): Integer;
    class function GetNextIDGUID: TGuid;
    class function GetNextIDGUIDToString: string;
    class procedure LoadFromDB(AOBject : TAppObject; AID : String);
    class procedure LoadFromDBSQL(AOBject : TAppObject; ASQL : String);
    class function OpenMemTable(ASQL : String): TFDMemTable;
    class function OpenQuery(ASQL : String): TFDQuery;
  end;

var
  ADConnection: TFDConnection;
  ADTransaction: TFDTransaction;
  ADPhysIBDriverLink1: TFDPhysIBDriverLink;
  mmoLogs : TMemo;

implementation

class function TDBUtils.ConnectDB(ADBEngine, AServer, ADatabase, AUser ,
    APassword, APort : String): Boolean;
begin
  Result := False;

  ADConnection := TFDConnection.Create(Application);
  ADTransaction:= TFDTransaction.Create(Application);

  ADConnection.Transaction := ADTransaction;

  ADConnection.DriverName := ADBEngine;
  ADConnection.LoginPrompt:= False;

  ADConnection.Params.Add('Server=' + AServer);
  ADConnection.Params.Add('Database=' + ADatabase);
  ADConnection.Params.Add('User_Name=' + AUser);
  ADConnection.Params.Add('Password=' + APassword);

  if APort <> '' then
    ADConnection.Params.Add('Port=' + APort);

  ADConnection.Connected := True;
  if ADConnection.Connected then
  begin
    TAppUtils.TulisRegistry('Engine', ADBEngine);
    TAppUtils.TulisRegistry('server', AServer);
    TAppUtils.TulisRegistry('Database', ADatabase);
    TAppUtils.TulisRegistry('User_Name', AUser);
    TAppUtils.TulisRegistry('Password', APassword);
    TAppUtils.TulisRegistry('Port', APort);

    Result := True;
  end;

end;

class procedure TDBUtils.DataSetToCxDBGrid(ADataset : TDataset; ACxDBGrid :
    TcxGridDBTableView; AutoCreateFields : Boolean = False);
//var
//  i: Integer;
//  lCDS: TClientDataSet;
//  lDSP: TDataSetProvider;
begin
//  lDSP := TDataSetProvider.Create(Application);
//  lCDS := TClientDataSet.Create(Application);
//
//
//
//  lDSP.DataSet := ADataset;
//  lCDS.SetProvider(lDSP);
//  lCDS.Open;

//  while not lCDS.Eof do
//  begin
//    showmessage(lCDS.Fields[4].AsString);
//    lCDS.Next;
//  end;


  if ACxDBGrid.DataController.DataSource = nil then
    ACxDBGrid.DataController.DataSource := TDataSource.Create(Application);

  ACxDBGrid.DataController.DataSource.DataSet := ADataset;

  if AutoCreateFields then
    ACxDBGrid.DataController.CreateAllItems(True);
end;

class function TDBUtils.DSToCDS(aDataset: TDataSet; aOwner: TComponent):
    TClientDataset;
var
  ADSP: TDataSetProvider;
begin
  Result := nil;
  if ADataSet.FieldCount <> 0 then
  begin
    Result:= TClientDataSet.Create(aOwner);
    ADSP := TDataSetProvider.Create(Result);
    ADSP.DataSet:= aDataset;
    Result.SetProvider(ADSP);
    Result.Open;

    aDataset.Free;
  end;
end;

class function TDBUtils.ExecuteSQL(ASQL : String): Boolean;
begin
  try
    if mmoLogs <> nil then
      mmoLogs.Lines.Add(ASQL);

    ADConnection.ExecSQL(ASQL);
    Result := True;
  except
    raise
  end;
end;

class function TDBUtils.OpenDataset(ASQL : String; AOwner : TComponent = nil):
    TClientDataSet;
var
  LDSP: TDataSetProvider;
  LSQLQuery: TFDQuery;
begin
  if AOwner = nil then
    AOwner := Application;

  Result      := TClientDataSet.Create(AOwner);
  LDSP        := TDataSetProvider.Create(Result);
  LSQLQuery   := TFDQuery.Create(LDSP);
  LSQLQuery.FetchOptions.Unidirectional := False;

  LSQLQuery.Connection := ADConnection;
  LSQLQuery.SQL.Append(ASQL);

  LDSP.DataSet            := LSQLQuery;
  Result.SetProvider(LDSP);
  Result.Open;

end;

class function TDBUtils.GenerateSQLInsert(AObject : TAppObject): string;
var
  i: Integer;
//  lValue: TValue;
  ctx : TRttiContext;
  rt : TRttiType;
  prop : TRttiProperty;
  ResultObjectList: string;
  meth : TRttiMethod;
  sNama : String;
begin
  Result := '';
  ResultObjectList := '';

  ctx := TRttiContext.Create();
  try
      rt := ctx.GetType(AObject.ClassType);

      if AObject.ID = '' then
        AObject.ID := TDBUtils.GetNextIDGUIDToString();

      Result := 'insert into ' + AObject.ClassName + '(';
      for prop in rt.GetProperties() do
      begin
        If prop.Visibility <> mvPublished then continue;

        meth := prop.PropertyType.GetMethod('ToArray');
        if Assigned(meth) then
          Continue;

        if prop.Name = 'ObjectState' then
          Continue;

        if not prop.IsWritable then continue;

        if Result = 'insert into ' + AObject.ClassName + '(' then
          Result := Result + prop.Name
        else
          Result := Result + ',' + prop.Name;
      end;

      Result := Result + ') values(';


      for prop in rt.GetProperties() do
      begin
        If prop.Visibility <> mvPublished then continue;

        if not prop.IsWritable then continue;
        if prop.Name = 'ObjectState' then Continue;

        case prop.PropertyType.TypeKind of
          tkClass   : begin
                        meth := prop.PropertyType.GetMethod('ToArray');
                        if Assigned(meth) then
                        begin
                          with meth.Invoke(prop.GetValue(AObject),[]) do
                          begin
                            for i := 0 to GetArrayLength - 1 do
                            begin
                              if i = 0 then
                              begin
                                ResultObjectList := 'delete from ' + GetArrayElement(i).AsObject.ClassName
                                                    + ' where ' + TAppObjectItem(GetArrayElement(i).AsObject).GetHeaderField + ' = ' + QuotedStr(AObject.ID) + ';';

                              end;
                              TAppObjectItem(GetArrayElement(i).AsObject).Urutan := i;
                              TAppObjectItem(GetArrayElement(i).AsObject).SetHeaderProperty(AObject);
                              ResultObjectList := ResultObjectList + GenerateSQLInsert(TAppObject(GetArrayElement(i).AsObject));
                            end;
                          end;
                        end else begin
                          sNama := prop.Name;
                          if prop.GetValue(AObject).AsObject = nil then
                            Result := Result +  ' null,'
                          else
                            Result := Result + QuotedStr(TAppObject(prop.GetValue(AObject).AsObject).ID) + ',';
                        end;


                      end;
          tkInteger : Result := Result + FloatToStr(prop.GetValue(AObject).AsExtended) + ',';
          
          tkFloat   : if CompareText('TDateTime',prop.PropertyType.Name)=0 then
                        Result := Result + QuotedStr(FormatDateTime('MM/dd/yyyy hh:mm:ss',prop.GetValue(AObject).AsExtended)) + ','
                      else
                        Result := Result + FloatToStr(prop.GetValue(AObject).AsExtended) + ',' ;
                        
          tkUString : Result := Result + QuotedStr(prop.GetValue(AObject).AsString) + ',';
        end;
      end;

      Result := LeftStr(Result, Length(Result)-1) + ');';
      if ResultObjectList <> '' then
      begin
        Result := Result + ResultObjectList;
      end;
  finally
      ctx.Free();
  end;
end;

class function TDBUtils.GenerateSQLUpdate(AObject : TAppObject): string;
var
  ctx : TRttiContext;
  i: Integer;
  rt : TRttiType;
  prop : TRttiProperty;
  meth : TRttiMethod;
  ResultObjectList: string;
begin

  Result := '';
  ctx := TRttiContext.Create();
  try
      rt := ctx.GetType(AObject.ClassType);
      Result := 'update ' + AObject.ClassName + ' set ';

      for prop in rt.GetProperties() do
      begin
        If prop.Visibility <> mvPublished then continue;

        meth := prop.PropertyType.GetMethod('ToArray');
        if (not prop.IsWritable) or
           (UpperCase(prop.Name) = 'ID')  or
           (prop.Name = 'ObjectState') then continue;

        if not Assigned(meth) then
          Result := Result + prop.Name + ' = ';

        case prop.PropertyType.TypeKind of
//          tkArray     :
          tkClass     : begin
                          meth := prop.PropertyType.GetMethod('ToArray');
                          if Assigned(meth) then
                          begin
                            with meth.Invoke(prop.GetValue(AObject),[]) do
                            begin
                              for i := 0 to GetArrayLength - 1 do
                              begin
                                if i = 0 then
                                begin
                                  ResultObjectList := 'delete from ' + GetArrayElement(i).AsObject.ClassName
                                                      + ' where ' + TAppObjectItem(GetArrayElement(i).AsObject).GetHeaderField + ' = ' + QuotedStr(AObject.ID) + ';';

                                end;

                                TAppObjectItem(GetArrayElement(i).AsObject).SetHeaderProperty(AObject);
                                ResultObjectList := ResultObjectList + GenerateSQLInsert(TAppObject(GetArrayElement(i).AsObject));
                              end;
                            end;
                          end else begin
                            Result := Result + QuotedStr(TAppObject(prop.GetValue(AObject).AsObject).ID) + ',';
                          end;
                        end;
          tkInteger   : Result := Result + FloatToStr(prop.GetValue(AObject).AsExtended) + ',';
          
          tkFloat     : if CompareText('TDateTime',prop.PropertyType.Name)=0 then
                          Result := Result + QuotedStr(FormatDateTime('MM/dd/yyyy hh:mm:ss',prop.GetValue(AObject).AsExtended)) + ','
                        else
                          Result := Result + FloatToStr(prop.GetValue(AObject).AsExtended) + ',';
                          
          tkUString   : Result := Result + QuotedStr(prop.GetValue(AObject).AsString) + ',';
        end;
      end;

      Result := LeftStr(Result, Length(Result)-1) + ' where id = ' + QuotedStr(AObject.ID) + ';';
      if ResultObjectList <> '' then
      begin
        Result := Result + ResultObjectList;
      end;
  finally
      ctx.Free();
  end;   
end;

class function TDBUtils.GenerateSQL(AObject : TAppObject): string;
begin
  if (AObject.ObjectState = 1) then
  begin
    Result := TDBUtils.GenerateSQLInsert(AObject)
  end else
    Result := TDBUtils.GenerateSQLUpdate(AObject);

end;

class function TDBUtils.GenerateSQLDelete(AObject : TAppObject; AID : String):
    string;
var
  ctx : TRttiContext;
  i: Integer;
//  lValue: TValue;
  rt : TRttiType;
  prop : TRttiProperty;
  ResultObjectList: string;
  meth : TRttiMethod;
begin
  Result := '';
  ResultObjectList := '';

  TDBUtils.LoadFromDB(AObject, AID);

  ctx := TRttiContext.Create();
  try
      rt := ctx.GetType(AObject.ClassType);

      Result := 'delete from ' + AObject.ClassName
            + ' where id =' + QuotedStr(AID) + ';';

      for prop in rt.GetProperties() do begin
        if (not prop.IsWritable) or
           (prop.PropertyType.TypeKind <> tkClass) then continue;

        meth := prop.PropertyType.GetMethod('ToArray');
        if Assigned(meth) then
        begin
          with meth.Invoke(prop.GetValue(AObject),[]) do
          begin
            for i := 0 to GetArrayLength - 1 do
            begin
//              if i = 0 then
//              begin
//                ResultObjectList := 'delete from ' + GetArrayElement(i).AsObject.ClassName
//                                    + ' where ' + TAppObject(GetArrayElement(i).AsObject).GetHeaderField + ' = ' + QuotedStr(AID) + ';';
//              end;

              ResultObjectList := ResultObjectList + GenerateSQLDelete(TAppObject(GetArrayElement(i).AsObject),TAppObject(GetArrayElement(i).AsObject).ID );
            end;
          end;
        end;
      end;

      if ResultObjectList <> '' then
      begin
        Result := Result + ResultObjectList;
      end;
  finally
      ctx.Free();
  end;
end;

class function TDBUtils.GenerateSQLSelect(AObject : TAppObject): string;
var
  ctx : TRttiContext;
//  i: Integer;
//  lValue: TValue;
  rt : TRttiType;
  prop : TRttiProperty;
  ResultObjectList: string;
  meth : TRttiMethod;
  sFieldName: string;
begin
  Result := '';
  ResultObjectList := '';

  ctx := TRttiContext.Create();
  try
      rt := ctx.GetType(AObject.ClassType);

      if AObject.ID = '' then
        AObject.ID := TDBUtils.GetNextIDGUIDToString();

      Result := 'select ' ;
      for prop in rt.GetProperties() do begin
          meth := prop.PropertyType.GetMethod('ToArray');
          if Assigned(meth) then
            Continue;

          if prop.Name = 'ObjectState' then
            Continue;

          if not prop.IsWritable then continue;

          sFieldName := prop.Name;
          if CompareText('TDateTime',prop.PropertyType.Name)=0 then
            sFieldName := 'cast(' + sFieldName + ' as character varying(40)) as ' + sFieldName;

          if prop.PropertyType.TypeKind = tkUString then
            sFieldName := 'cast(' + sFieldName + ' as character(140)) as ' + sFieldName;

          if Result = 'select ' then
            Result := Result + sFieldName
          else
            Result := Result + ',' + sFieldName;
      end;

      Result := 'Select a.* from ( ' + Result + ' from ' + AObject.ClassName + ') a ';


  finally
      ctx.Free();
  end;
end;

class function TDBUtils.GetNextID(AOBject : TAppObject): Integer;
var
  Q: TFDQuery;
  sSQL: string;
begin
  Result := 0;

  sSQL := 'select max(id) as ID from ' + AOBject.ClassName;

  Q := TDBUtils.OpenQuery(sSQL);
  try
    while not Q.Eof do
    begin
      Result := Q.FieldByName('ID').AsInteger;
      Q.Next;
    end;
  finally
    Q.Free;
  end;

  Result := Result + 1;
end;

class function TDBUtils.GetNextIDGUID: TGuid;
begin
  CreateGUID(Result);
end;

class function TDBUtils.GetNextIDGUIDToString: string;
var
  lGUID: TGuid;
begin
  CreateGUID(lGUID);
  Result := GUIDToString(lGUID);
end;

class procedure TDBUtils.LoadFromDB(AOBject : TAppObject; AID : String);
var
  Q: TFDQuery;
  sSQL: string;

  ctx : TRttiContext;
  lAppObject: TAppObject;
//  lAppObjectList: TObjectList<TAppObject>;
  lObjectList: TObject;
  rt : TRttiType;
  prop : TRttiProperty;
  meth : TRttiMethod;
  QQ: TClientDataSet;
  sGenericItemClassName: string;
//  sX: string;
begin

  sSQL := 'select * from ' + AOBject.ClassName
          + ' where id = ' + QuotedStr(AID);

  ctx := TRttiContext.Create();
  Q := TDBUtils.OpenQuery(sSQL);
  try
    rt := ctx.GetType(AObject.ClassType);

    if not Q.IsEmpty then
    begin
      for prop in rt.GetProperties() do begin
        if prop.Visibility <> mvPublished then
          Continue;

        if prop.Name = 'ObjectState' then
          Continue;

        if (not prop.IsWritable) then
          Continue;

        if AOBject is TAppObjectItem then
        begin
          if (UpperCase(prop.Name)=UpperCase((AOBject as TAppObjectItem).GetHeaderField)) then
            continue;
        end;

        case prop.PropertyType.TypeKind of
          tkInteger : prop.SetValue(AObject,Q.FieldByName(prop.Name).AsInteger );
          tkFloat   : prop.SetValue(AObject,Q.FieldByName(prop.Name).AsFloat );
          tkUString : prop.SetValue(AObject,Q.FieldByName(prop.Name).AsString );
          tkClass   : begin
                        meth := prop.PropertyType.GetMethod('ToArray');
                        if Assigned(meth) then
                        begin
                          lObjectList := prop.GetValue(AOBject).AsObject;
                          sGenericItemClassName :=  StringReplace(lObjectList.ClassName, 'TOBJECTLIST<','', [rfIgnoreCase]);
                          sGenericItemClassName :=  StringReplace(sGenericItemClassName, '>','', [rfIgnoreCase]);
//                          sGenericItemClassName :=  StringReplace(sGenericItemClassName, 'UMODEL.','', [rfIgnoreCase]);

                          lAppObject := TAppObject((ctx.FindType(sGenericItemClassName) as TRttiInstanceType).MetaClassType.Create);
                          meth := prop.PropertyType.GetMethod('Add');

                          if Assigned(meth) then
                          begin
                            sSQL := 'select id from ' + lAppObject.ClassName
                                    + ' where ' + TAppObjectItem(lAppObject).GetHeaderField + ' = ' + QuotedStr(AID)
                                    + ' order by urutan';

                            QQ := TDBUtils.OpenDataset(sSQL);
                            try
                              while not QQ.Eof do
                              begin
                                lAppObject.ID := QQ.FieldByName('ID').AsString;
                                TAppObjectItem(lAppObject).SetHeaderProperty(AOBject);
                                LoadFromDB(lAppObject, lAppObject.ID);
                                meth.Invoke(lObjectList,[lAppObject]);

                                QQ.Next;
                                if not QQ.Eof then
                                  lAppObject := TAppObject((ctx.FindType(sGenericItemClassName) as TRttiInstanceType).MetaClassType.Create);



                              end;
                            finally
                              QQ.Free;
                            end;


                          end;
                        end else begin
                          meth          := prop.PropertyType.GetMethod('Create');
                          lAppObject    := TAppObject(meth.Invoke(prop.PropertyType.AsInstance.MetaclassType, []).AsObject);
                          lAppObject.ID := Q.FieldByName(prop.Name).AsString;

                          prop.SetValue(AOBject, lAppObject);
                        end;
                      end;
        end;
      end;
    end;
  finally
    if AOBject.ID <> '' then
      AOBject.ObjectState := 3;

    Q.Free;
  end;
end;

class procedure TDBUtils.LoadFromDBSQL(AOBject : TAppObject; ASQL : String);
begin
  with TDBUtils.OpenQuery(ASQL) do
  begin
    try
      LoadFromDB(AOBject, FieldByName('ID').AsString);
    finally
      Free;
    end;
  end;

end;

class function TDBUtils.OpenMemTable(ASQL : String): TFDMemTable;
var
  Q: TFDQuery;
begin
  Result := TFDMemTable.Create(nil);

  Q := TDBUtils.OpenQuery(ASQL);
  try
    Q.FetchAll;
    Result.Data := Q.Data;
    Result.First;
  finally
    Q.Free;
  end;
end;

class function TDBUtils.OpenQuery(ASQL : String): TFDQuery;

begin
  if mmoLogs <> nil then
    mmoLogs.Lines.Add(ASQL);

  Result := TFDQuery.Create(nil);
  Result.Connection := ADConnection;
  Result.Open(ASQL);
end;



end.
