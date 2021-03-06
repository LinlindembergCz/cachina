unit GenericDAO;

interface

Uses
  Db, Rtti, AtributoEntidade, TypInfo, SysUtils,  DBClient, Provider,
  Forms, Dialogs, strUtils, GenericEntidade,Dateutils;

type
  TGenericDAO = class
  strict private
    class procedure ExecSQL(SQL: string); static;
  private
   //class procedure SetAspas;
  public
     class function Insert(Obj: TGenericEntidade):boolean;
     class function Update(Obj: TGenericEntidade):boolean;
     class function Delete(Obj: TGenericEntidade):boolean;
     class function GetDataSet(Obj: TGenericEntidade; where : string = ''): TClientDataSet;
     class function GetDataSetID(Obj: TGenericEntidade; id : string  ='' ): TClientDataSet; static;

     {
     class function Insert<TGenericEntidade: class>(Obj: TGenericEntidade; CodigoPessoa: string = ''):boolean;
     class function Update<TGenericEntidade: class>(Obj: TGenericEntidade; CodigoPessoa: string = ''):boolean;
     class function Delete<TGenericEntidade: class>(Obj: TGenericEntidade; CodigoPessoa: string = ''):boolean;
     class function GetAll<TGenericEntidade: class>(Obj: TGenericEntidade; Condicao: string; Fields: string= ''): TDataSet;
     class function GetSelect(Select, Condicao: string; Fields: string= ''): TDataSet;overload;
     class function GetValue(Tabela, Condicao, Field: string): String; static;
     class function DeleteSQL(Tabela, Condicao: string): String; static;
     class procedure InsertSQL(Tabela, Campos, Values: string);static;
     class procedure InsertSQLSelect(Tabela, Campos, Select: string); static;
     class procedure UpdateSQL(Tabela, CamposValues, Where: string); static;
     class procedure ExecSQL(SQL: string);
     class function GetModulo<TGenericEntidade>(Obj: TGenericEntidade): String;
     }
   //class procedure RegistrarLog(CodigoPessoa, Modulo, log, Operacao, Tabela: string); static;
  end;

  var
   Aspas : string;

implementation

uses Mapper, Conexao;


class function TGenericDAO.Insert(Obj: TGenericEntidade): boolean;
begin
   ExecSQL( TMapper.Parser_SQLInsert( obj ) );
end;

class function TGenericDAO.Update(Obj: TGenericEntidade): boolean;
begin
   ExecSQL( TMapper.Parser_SQLUpdate(obj) );
end;

class function TGenericDAO.Delete(Obj: TGenericEntidade): boolean;
begin
   ExecSQL( TMapper.Parser_SQLDelete(obj) );
end;

class function TGenericDAO.GetDataSet(Obj: TGenericEntidade; where : string = ''): TClientDataSet;
begin
   result:= Conexao.TSingletonConexao.GetConexao.GetDataSet( TMapper.Parser_SQLSelect(obj , where ) );
end;

class function TGenericDAO.GetDataSetID( Obj:TGenericEntidade; id : string = ''): TClientDataSet;
begin
   result:= Conexao.TSingletonConexao.GetConexao.GetDataSet( TMapper.Parser_SQLSelectId(Obj, id ) );
end;

class procedure TGenericDAO.ExecSQL(SQL: string);
begin
   Conexao.TSingletonConexao.GetConexao.ExecSQL(SQL);
end;

{

class function TGenericDAO.GetTableName<TGenericEntidade>(Obj: TGenericEntidade): String;
var
  Contexto: TRttiContext;
  TypObj: TRttiType;
  Atributo: TCustomAttribute;
  strTable: String;
begin
  Contexto := TRttiContext.Create;
  TypObj := Contexto.GetType(TObject(Obj).ClassInfo);

  for Atributo in TypObj.GetAttributes do
  begin
     if Atributo is TableName then
     begin
        result:= TableName(Atributo).Name;
        exit;
     end;
  end;
end;

{
class function TGenericDAO.GetModulo<TGenericEntidade>(Obj: TGenericEntidade): String;
begin
   result := ''
end;


class function TGenericDAO.Insert<TGenericEntidade>(Obj: TGenericEntidade; CodigoPessoa: string = ''):boolean;

var
  Contexto: TRttiContext;
  TypObj: TRttiType;
  Prop: TRttiProperty;
  strInsert, strFields, strValues: String;
  Atributo: TCustomAttribute;
  Log: string;
begin
   SetAspas;

   strInsert := '';
   strFields := '';
   strValues := '';
   Log       := '';
   strInsert := 'INSERT INTO ' + GetTableName(Obj);

   Contexto  := TRttiContext.Create;
   TypObj := Contexto.GetType(TObject(Obj).ClassInfo);

   for Prop in TypObj.GetProperties do
   begin
     for Atributo in Prop.GetAttributes do
     begin

       if Atributo is FieldName then
       begin
         if FieldName(Atributo).Name = 'CodigoFilial' then
         begin
           strFields := strFields + Aspas+FieldName(Atributo).Name+Aspas + ',';
           strValues := strValues + '1' + ',';
         end
         else
         begin
           strFields := strFields + Aspas+FieldName(Atributo).Name+Aspas + ',';
           if Pos('string', lowerCase(Prop.toString)) > 0 then
           begin
             //Log := Log + FieldName(Atributo).Name + ' = '+ Prop.GetValue(TObject(Obj)).AsString +#13;

             strValues := strValues + QuotedStr(Prop.GetValue(TObject(Obj)).AsString) + ','
           end
           else
           if Pos('integer', lowerCase(Prop.toString)) > 0 then
           begin
             //Log := Log + FieldName(Atributo).Name + ' = '+ IntToStr(Prop.GetValue(TObject(Obj)).AsInteger)+#13;

             strValues := strValues + IntToStr(Prop.GetValue(TObject(Obj))
               .AsInteger) + ','
           end
           else
           if Pos('double', lowerCase(Prop.toString)) > 0 then
           begin
             //Log := Log + FieldName(Atributo).Name + ' = '+ FloatToStr(Prop.GetValue(TObject(Obj)).AsExtended)+#13;

             strValues := strValues +
               StringReplace(FloatToStr(Prop.GetValue(TObject(Obj)).AsExtended), ',', '.', []) + ','
           end
           else
           if Pos('tdatetime', lowerCase(Prop.toString)) > 0 then
           begin
                //Log := Log + FieldName(Atributo).Name + ' = '+ FormatDatetime('DD/MM/YYYY',  TDateTime(Prop.GetValue(TObject(Obj)).AsVariant))+#13;

                if YearOf( TDateTime( Prop.GetValue(TObject(Obj)).AsVariant) ) > 1899  then
                   strValues := strValues + QuotedStr(FormatDatetime('DD/MM/YYYY',
                   //TDateTime(Prop.GetValue(TObject(Obj)).AsExtended))) + ','
                   TDateTime(Prop.GetValue(TObject(Obj)).AsVariant))) + ','
                else
                   strValues := strValues + ' NULL ' + ','

           end
           else
             raise Exception.Create('Type not Supported');

         end;
       end;
     end;
   end;

   strFields := Copy(strFields, 1, Length(strFields) - 1);
   strValues := Copy(strValues, 1, Length(strValues) - 1);
   strInsert := strInsert + ' ( ' + strFields + ' ) VALUES ( ' + strValues + ' )';




   //RegistrarLog(CodigoPessoa, GetModulo(Obj), Log , 'Cadastro', GetTableName(Obj) );

end;

class function TGenericDAO.Update<TGenericEntidade>(Obj: TGenericEntidade; CodigoPessoa: string = ''):boolean;
begin

end;

class function TGenericDAO.Delete<TGenericEntidade>(Obj: TGenericEntidade; CodigoPessoa: string = ''): boolean;
begin

end;
}



{
class procedure TGenericDAO.InsertSQL(Tabela, Campos, Values: string);
begin
  execSql( 'insert into '+ Tabela +' ( '+ Campos +' ) Values ( '+ Values + ')');
end;

class procedure TGenericDAO.InsertSQLSelect(Tabela, Campos, Select: string);
begin
  execSql( 'insert into '+ Tabela +' ( '+ Campos +' ) '+ Select );
end;

class procedure TGenericDAO.UpdateSQL(Tabela, CamposValues, Where: string);
begin
  execSql( ' Update '+ Tabela +' Set '+ CamposValues+' Where '+ Where );
end;

class function TGenericDAO.DeleteSQL(Tabela, Condicao: string): String;
begin
  ExecSql( 'Delete From '+Tabela+' where '+ Condicao );
end;

class function TGenericDAO.GetAll<TGenericEntidade>(Obj: TGenericEntidade; Condicao: string; Fields: string= ''): TDataSet;
var
  DataSet:TDataSet;
  DataSetClient: TClientDataSet;
begin
   if Obj <> nil then
   begin
     DataSetClient:= TClientDataSet.create(nil);
     //DataSet := GetDataSet('SELECT ' + ifthen( Fields <> '', Fields , 'T1.*')+
     //          ' FROM ' + GetTableName(Obj) + ' T1 '+ ifthen(Condicao <> '',' where '+Condicao,'' ));
     DataSetClient.CloneCursor( TClientDataSet(DataSet) , true );

     result:= DataSetClient;
   end;
end;


class function TGenericDAO.GetSelect(Select: string): TDataSet;
  var
  DataSet:TDataSet;
  DataSetClient: TClientDataSet;
begin
   result:= nil;
   if Select <> '' then
   begin
     DataSetClient:= TClientDataSet.create(nil);
     //DataSet := GetDataSet(Select);
     DataSetClient.CloneCursor( TClientDataSet(DataSet) , true );

     result:= DataSetClient;
   end;
end;

class function TGenericDAO.GetSelect(Select, Condicao: string;Fields: string= ''): TDataSet;
var
  DataSet:TDataSet;
  DataSetClient: TClientDataSet;
begin
   result:= nil;
   if Select <> '' then
   begin
     DataSetClient:= TClientDataSet.create(nil);
     //DataSet := DSServerModuleBaseDados.GetDataSet('SELECT ' + ifthen( Fields <> '', Fields , 'T1.*')+
     //          ' FROM ' + Select + ifthen(Condicao <> '',' where '+Condicao,'' ));
     DataSetClient.CloneCursor( TClientDataSet(DataSet) , true );

     result:= DataSetClient;
   end;
end;

class procedure TGenericDAO.SetAspas;
begin
  if isFireBird then
     aspas := '"'
  else
     aspas := '';
  aspas := '';
end;

class function TGenericDAO.GetValue(Tabela, Condicao, Field: string): String;
var
  DataSet:TDataSet;
begin
  SetAspas;
  DataSet := TGenericDAO.GetSelect(Tabela,Condicao, Aspas + Field+Aspas );
  result  := DataSet.Fields[0].AsString;
end;
}


end.
