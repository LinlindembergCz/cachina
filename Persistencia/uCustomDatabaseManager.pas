//NAO MECHA AQUI
unit uCustomDatabaseManager;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
FireDAC.DApt,
  Vcl.AppEvnts, FireDAC.Comp.UI, TypInfo, Dialogs, strUtils, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, RTTI;

//NAO MECHA AQUI
type
  TCustomDatabaseManager = class
  private
    DbConn:TFDConnection;
    MetaInfoQuery:TFDMetaInfoQuery;
    procedure AlterarEstrutura( proEntidade: TObject;
                             prsTabela: string;
                             MetaInfoFields: TFDMetaInfoQuery;
                             prsCampoDB: string;
                             prsPropriedade: string;
                             prlstAtributos:TStringList);
    function GetFieldsMetaInfoQuery(prsTabela: string): TFDMetaInfoQuery;
    function TipoEhDiferente(PropType, DBType: string; var NewType: string  ): boolean;
    function UpperTextoUnDerline(const Texto: String): String;
    procedure DropColumn(prsTabela: string; prsCampoDB: string);
    procedure AlterType(prsTabela: string; prsCampoDB: string; lsTipoDB: string; lsNovoTipo: string);
    function GetAttributiesList(E: TOBject): TStringList;
    function CreateSchemaConnection: FireDAC.Comp.Client.TFDConnection;
    procedure CreateField(prsTabela, prsCampoDB, lsTipoDB, lsNovoTipo: string);

  public
    procedure UpdateDatabase;
    function DatabaseExists: Boolean;
    procedure CreateDatabase;
    procedure SincronizarEstrutura;
    constructor Create( proDBConn: TFDConnection);overload;
  end;

  TCustomField = record
    Length:integer;
  end;

implementation

//NAO MECHA AQUI

uses
  {$IFDEF DESKTOP} uDialog, {$ENDIF}
   Mapper, CAtribEntity;

constructor TCustomDatabaseManager.Create(proDBConn: TFDConnection);
begin
   DBConn:= proDBConn;
end;

procedure TCustomDatabaseManager.CreateDatabase;
var loConn: FireDAC.Comp.Client.TFDConnection;
begin
   try
      try
         loConn := CreateSchemaConnection;
         loConn.Connected := True;
         loConn.ExecSQL('CREATE DATABASE IF NOT EXISTS my_db');
      except
         on E: Exception do
         begin
            raise Exception.Create('CREATE DATABASE IF NOT EXISTS my_db : '+E.Message);
         end;
      end;
   finally
      loConn.Connected := False;
      loConn.Free;
      loConn := Nil;
   end;
end;

function TCustomDatabaseManager.CreateSchemaConnection: FireDAC.Comp.Client.TFDConnection;
begin
   Result := FireDAC.Comp.Client.TFDConnection.Create(Nil);
   Result.Params.DriverID  := 'MySQL';
   Result.Params.Pooled    := False;
   Result.Params.Database  := 'information_schema';
   Result.Params.UserName  := 'root';
   Result.Params.Password  := DBConn.Params.Values['Password'];
   Result.Params.Values['Server'] := DbConn.Params.Values['Server'];
end;

function  TCustomDatabaseManager.GetFieldsMetaInfoQuery(prsTabela: string): TFDMetaInfoQuery;
var
   MetaInfoFields: TFDMetaInfoQuery;
begin
   MetaInfoFields:= TFDMetaInfoQuery.Create(nil);
   MetaInfoFields.Connection := DBConn;
   MetaInfoFields.MetaInfoKind:= mkTableFields;
   MetaInfoFields.ObjectName := prsTabela;//<<-----
   MetaInfoFields.Active:= true;
   MetaInfoFields.First;
   result:= MetaInfoFields;
end;

procedure TCustomDatabaseManager.SincronizarEstrutura;
var
  loMapperClasses: TMapper;
  lstClassses : TstringList;
  I : integer;
  lsTabela: string;
  Entidade: TObject;
  lsPropriedade, lsCampoDB: string;
  MetaInfoFields  : TFDMetaInfoQuery;
  lstAtributos:TStringList;
  J: Integer;
begin
   try
      loMapperClasses := TMapper.Create(nil);
      lstClassses :=TstringList.Create;
      //Mapea todas as classes registradas ( ver RegisterClass)
      loMapperClasses.EnumClasses( lstClassses );

      for I := 0 to lstClassses.Count - 1 do
      begin
         try
            //Ex: TCliente, TVenda
            Entidade:= lstClassses.Objects[I];
            //Ex: Cliente, Venda
            lsTabela :=  UpperTextoUnDerline(lstClassses[I]); //copy(lstClassses[I],2, length(lstClassses[I]) );
            //Consulta todos os campos da Tabela
            MetaInfoFields:= GetFieldsMetaInfoQuery( lsTabela );
            lstAtributos:= GetAttributiesList(Entidade);
            for J := 0 to lstAtributos.Count - 1 do
            begin
               lsCampoDB     :=  '';
               if MetaInfoFields.Locate('COLUMN_NAME',lstAtributos.Strings[J],[loCaseInsensitive] ) then
                   lsCampoDB     := MetaInfoFields.FieldByName('COLUMN_NAME').AsString;
               lsPropriedade := lstAtributos.Strings[j];

               AlterarEstrutura(Entidade, lsTabela, MetaInfoFields, lsCampoDB, lsPropriedade, lstAtributos);

            end;
         finally
            Entidade.Free;
            MetaInfoFields.Close;
            MetaInfoFields.Free;
         end;
      end;
   finally
      loMapperClasses.Free;
      lstClassses.Clear;
      lstClassses.Free;
   end;
end;

function TCustomDatabaseManager.GetAttributiesList(E: TOBject): TStringList;
var
  Field: TRttiProperty;
  Atributo: TCustomAttribute;
  TypObj: TRttiType;
  ctx : TRttiContext;
  L: TStringList;
  loField: TCustomField;
begin
  try
    L := TStringList.Create(true);
    ctx := TRttiContext.Create;
    TypObj := ctx.GetType(E.ClassInfo);
    for Field in TypObj.GetProperties do
    begin
        for Atributo in Field.GetAttributes do
        begin
          if Atributo is FieldName then
          begin
             L.AddObject( FieldName(Atributo).Name, TObject(FieldName(Atributo).Length) );
          end;
        end;
    end;
  finally
    result := L;
    ctx.Free;
  end;
end;

procedure TCustomDatabaseManager.AlterarEstrutura(proEntidade: TObject;
                                               prsTabela: string;
                                               MetaInfoFields: TFDMetaInfoQuery;
                                               prsCampoDB: string;
                                               prsPropriedade: string;
                                               prlstAtributos: TStringList );
var
   lsTipo: string;
   lsTipoDB: string;
   lsNovoTipo: string;
   ctx : TRttiContext;
   TypObj: TRttiType;
   lsLength:string;
   indexAtribute:integer;
   lsNewLength:string;
begin
    //Se a propriedade existe na Entidade
    try
       ctx := TRttiContext.Create;
       TypObj := ctx.GetType(proEntidade.ClassInfo);

       //Se a Classe nao possuir a propriedade correspondente na tabela, este ser removido!
       if ( prsCampoDB <> '' ) and (not Assigned( TypObj.GetProperty(StringReplace( prsCampoDB ,'_','',[rfReplaceAll])) ) ) then
       begin
         DropColumn(prsTabela, prsCampoDB);
       end
       else
       begin
          ctx := TRttiContext.Create;
          TypObj := ctx.GetType(proEntidade.ClassInfo);
          lsTipo   := uppercase( TypObj.GetProperty(prsPropriedade).PropertyType.Name );
          lsTipoDB := uppercase(MetaInfoFields.FieldByName('COLUMN_TYPENAME').AsString );
          //lsLength := '50';
          if (lsTipo= 'STRING') or  (lsTipo= 'CHAR') then
          begin
            indexAtribute := prlstAtributos.IndexOf(ifthen( prsCampoDB <> '' ,prscampoDB, prsPropriedade) );
            if indexAtribute > -1 then
            begin
               lsNewLength:= string(prlstAtributos.Objects[indexAtribute]);
               lsNovoTipo:= 'VARCHAR('+ lsNewLength  +')';
            end;
          end;
          if (prscampoDB = '') then  //or ( (lsNovoTipo <> '') and (lsTipoDB <> lsNovoTipo) )
          begin
             //if prscampoDB <> '' then
             //   AlterType(prsTabela,  prsCampoDB  , lsTipoDB, lsNovoTipo)
             //else
                CreateField(prsTabela, prsPropriedade , lsTipoDB, lsNovoTipo);
          end;
       end;
    finally
      ctx.Free;
    end;
end;

function TCustomDatabaseManager.DatabaseExists: Boolean;
var loConn: FireDAC.Comp.Client.TFDConnection;
    lslDatabases: TStringList;
begin
   try
      try
         lslDatabases := TStringList.Create;
         loConn := CreateSchemaConnection;
         loConn.Connected := True;
         loConn.GetCatalogNames('', lslDatabases);
         Result := lslDatabases.IndexOf('my_db') > -1;
      except
         on E: Exception do
         begin
            raise;
         end;
      end;
   finally
      loConn.Connected := False;
      loConn.Free;
      loConn := Nil;
      lslDatabases.Free;
      lslDatabases := Nil;
   end;
end;

procedure TCustomDatabaseManager.DropColumn(prsTabela: string; prsCampoDB: string);
begin
  try
       DbConn.ExecSQL('ALTER TABLE ' + prsTabela + ' DROP COLUMN ' + prsCampoDB, true);
  except
    on E: Exception do
    begin
       raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TCustomDatabaseManager.AlterType(prsTabela: string; prsCampoDB: string; lsTipoDB: string; lsNovoTipo: string);
var
  lsAlterTable: string;
begin
  try
     //MySQL
    //lsAlterTable := 'ALTER TABLE ' + prsTabela + ' ' + 'CHANGE COLUMN ' + prsCampoDB +
    //                ' ' + prsCampoDB + ' ' + lsNovoTipo + ' NULL ';
    lsAlterTable := 'ALTER TABLE ' + prsTabela + ' ' + 'ALTER COLUMN ' +
                  ' ' + prsCampoDB + ' ' + lsNovoTipo + ' NULL ';
    //if (lsTipoDB = 'INT') or (lsTipoDB = 'DOUBLE') or (lsNovoTipo='DOUBLE') or (lsNovoTipo = 'INT') then
    if (lsTipoDB = 'INT') or (lsTipoDB = 'FLOAT') or (lsNovoTipo='FLOAT') or (lsNovoTipo = 'INT') then
    begin
      DBConn.ExecSQL('update ' + prsTabela + ' set ' + prsCampoDB + '= ''0'' ');//where ' + prsCampoDB + '='''' ');
    end;
    DbConn.ExecSQL(lsAlterTable, true);
  except
    on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TCustomDatabaseManager.CreateField(prsTabela: string; prsCampoDB: string; lsTipoDB: string; lsNovoTipo: string);
var
  lsAlterTable: string;
begin
  try
     //MySQL
    //lsAlterTable := 'ALTER TABLE ' + prsTabela + ' ' + 'CHANGE COLUMN ' + prsCampoDB +
    //                ' ' + prsCampoDB + ' ' + lsNovoTipo + ' NULL ';
    lsAlterTable := 'ALTER TABLE ' + prsTabela + ' ' + ' ADD ' +
                  ' ' + prsCampoDB + ' ' + lsNovoTipo + ' NULL ';
    DbConn.ExecSQL(lsAlterTable, true);
  except
    on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

function TCustomDatabaseManager.TipoEhDiferente( PropType, DBType: string;
                                                 var NewType: string  ): boolean;
begin
  result:= false;
  if (UPPERCASE( PropType ) = 'STRING') AND (Pos( 'VARCHAR',DBType) = 0) then
  begin
     result:= true;
     NewType := 'VARCHAR(50)';
  end else
  if (UPPERCASE( PropType ) = 'INTEGER') AND (Pos( 'INT',DBType) = 0) then
  begin
     result:= true;
     NewType := 'INT';
  end else
  //if (UPPERCASE( PropType ) = 'DOUBLE') AND (Pos( 'DOUBLE',DBType) = 0) then
  if (UPPERCASE( PropType ) = 'FLOAT') AND (Pos( 'FLOAT',DBType) = 0) then
  begin
     result:= true;
     NewType := 'FLOAT';
  end else
  if (UPPERCASE( PropType ) = 'BOOLEAN') AND (Pos( 'CHAR',DBType) = 0) then
  begin
     result:= true;
     NewType := 'CHAR(1)';
  end;
end;

{ TCustomDatabaseManager }

function TCustomDatabaseManager.UpperTextoUnDerline(const Texto: String): String;
var
  x : Integer;
  Resultado: string;
begin
  Result := Texto;
  Resultado:= '';
  for x := 2 to Length(Texto) do
  begin
     if (Texto[x] = uppercase(Texto[x])) and (x > 2) then
       Resultado:= Resultado+'_'+Texto[x]
     else
       Resultado:= Resultado+Texto[x];
  end;
  result:= resultado;
end;


procedure TCustomDatabaseManager.UpdateDatabase;
begin
  inherited;
  //SincronizarEstrutura;
end;

end.
