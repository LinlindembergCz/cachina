unit DBUtils;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Data.DB, EntidadeFactory,  Data.Bind.DBScope,strUtils,  DBClient, Vcl.StdCtrls,
  Vcl.DBCtrls;

  procedure FillCombobox( TipoEntidade : TTipoEntidade;
                          Combobox     : TCombobox;
                          Condicao     : string ='0=0';
                          KeyField: string= 'Codigo';
                          ListField: string = 'Descricao';
                          OrderBy      : string = 'Descricao');overload;
   procedure FillCombobox( TipoEntidade : String;
                          Combobox     : TCombobox;
                          Condicao     : string ='0=0';
                          KeyField: string= 'Codigo';
                          ListField: string = 'Descricao';
                          OrderBy      : string = 'Descricao');overload;

  procedure FillLookUpCombobox(TipoEntidade:TTipoEntidade;
                             Combobox:TDBlookupCombobox;
                             KeyField: string  = 'Codigo';
                             ListField: string = 'Descricao';
                             Condicao: string  = '0=0');
procedure FillList( TipoEntidade : string;
                        Combobox     : TCombobox;
                        Condicao     : string ='0=0';
                        KeyField     : string= 'Codigo';
                        ListField    : string = 'Descricao';
                        OrderBy      : string = 'Descricao'  );
 { procedure FillComboEdit( TipoEntidade : TTipoEntidade;
                          Combobox     : TComboEdit;
                          Condicao     : string ='0=0'); }

implementation

uses GenericDAO,  Mapper;


procedure FillCombobox( TipoEntidade : TTipoEntidade;
                        Combobox     : TCombobox;
                        Condicao     : string ='0=0';
                        KeyField     : string= 'Codigo';
                        ListField    : string = 'Descricao';
                        OrderBy      : string = 'Descricao'  );
var
  DataSet    : TDataSet;
  Tabela     : string;
  I , max    : integer;
begin
  Tabela     := TMapper.GetTableNameClasse( TEntidadeFactory.GetClassInfo(TipoEntidade) );

  KeyField   := ifthen(TGenericDAO.isFireBird ,'"'+KeyField+'"', KeyField) ;
  ListField  := ifthen(TGenericDAO.isFireBird , '"'+ListField+'"', ListField );

  DataSet    := TGenericDAO.GetSelect( Tabela,   Condicao+' Order By "'+ OrderBy+'"' ,
                                       KeyField +','+ ListField );

  DataSet.First;
  max := Combobox.Items.Count - 1;

  for I := 0 to max do
    Combobox.Items.Delete(i);

  while not DataSet.Eof do
  begin
    //Combobox.Items.AddObject(DataSet.FieldByName(stringReplace(ListField,'"','',[rfReplaceAll])).AsString,
    //               TObject(  DataSet.FieldByName(stringReplace(KeyField,'"','',[rfReplaceAll])).AsInteger) );
    Combobox.Items.AddObject(DataSet.Fields[1].asstring ,
                             TObject( DataSet.Fields[0].asInteger) );
    DataSet.Next;
  end;
  DataSet.Free;
end;



procedure FillList( TipoEntidade : string;
                        Combobox     : TCombobox;
                        Condicao     : string ='0=0';
                        KeyField     : string= 'Codigo';
                        ListField    : string = 'Descricao';
                        OrderBy      : string = 'Descricao'  );
var
  DataSet    : TDataSet;
  Tabela     : string;
  I , max    : integer;
begin
  Tabela     := TipoEntidade;

  KeyField   := ifthen(TGenericDAO.isFireBird ,'T1."'+KeyField+'"', 'T1.'+KeyField) ;
  ListField  := ifthen(TGenericDAO.isFireBird , 'T1."'+ListField+'"', 'T1.'+ListField );

  DataSet    := TGenericDAO.GetSelect( ifthen( Pos('T1',Tabela) = 0 , Tabela+' T1', Tabela),
                                       Condicao+' Order By "'+OrderBy+'"' ,
                                       KeyField +','+ ListField );

  DataSet.First;
  max := Combobox.Items.Count - 1;
  for I := 0 to max do
    Combobox.Items.Delete(i);

  while not DataSet.Eof do
  begin

    //Combobox.Items.AddObject(DataSet.FieldByName(stringReplace(ListField ,'"','',[rfReplaceAll])).AsString,
    //               TObject(  DataSet.FieldByName(stringReplace('Codigo','"','',[rfReplaceAll])).AsInteger) );
    Combobox.Items.AddObject(DataSet.Fields[1].AsString,
                   TObject(  DataSet.Fields[0].AsInteger) );
    DataSet.Next;
  end;
  DataSet.Free;
end;

procedure FillCombobox( TipoEntidade : string;
                        Combobox     : TCombobox;
                        Condicao     : string ='0=0';
                        KeyField     : string= 'Codigo';
                        ListField    : string = 'Descricao';
                        OrderBy      : string = 'Descricao'  );
var
  DataSet    : TDataSet;
  Tabela     : string;
  I , max    : integer;
begin
  Tabela     := TipoEntidade;

  KeyField   := ifthen(TGenericDAO.isFireBird ,'T1."'+KeyField+'"', 'T1.'+KeyField) ;
  ListField  := ifthen(TGenericDAO.isFireBird , 'T1."'+ListField+'"', 'T1.'+ListField );

  DataSet    := TGenericDAO.GetSelect( ifthen( Pos('T1',Tabela) = 0 , Tabela+' T1', Tabela),
                                       Condicao+' Order By "'+OrderBy+'"' ,
                                       KeyField +','+ ListField );

  DataSet.First;
  max := Combobox.Items.Count - 1;
  for I := 0 to max do
    Combobox.Items.Delete(i);

  while not DataSet.Eof do
  begin

    //Combobox.Items.AddObject(DataSet.FieldByName(stringReplace(ListField ,'"','',[rfReplaceAll])).AsString,
    //               TObject(  DataSet.FieldByName(stringReplace('Codigo','"','',[rfReplaceAll])).AsInteger) );
    Combobox.Items.AddObject(DataSet.Fields[1].AsString,
                   TObject(  DataSet.Fields[0].AsInteger) );
    DataSet.Next;
  end;
  DataSet.Free;
end;

procedure FillLookUpCombobox(TipoEntidade:TTipoEntidade;
                             Combobox:  TDBlookupCombobox;
                             KeyField:  string = 'Codigo';
                             ListField: string = 'Descricao';
                             Condicao:  string = '0=0');
var
  DataSet    : TDataSet;
  DataSource:TDataSource;
  Tabela: string;
begin
  Tabela := TMapper.GetTableNameClasse( TEntidadeFactory.GetClassInfo(TipoEntidade) );

  DataSource:= TDataSource.Create(nil);

  DataSet    := TGenericDAO.GetSelect( Tabela,   Condicao+' Order By '+
                                       ifthen(TGenericDAO.isFireBird ,'"'+ListField+'"',ListField) ,
                                       ifthen(TGenericDAO.isFireBird ,'"'+KeyField+'"',KeyField) +','+
                                       ifthen(TGenericDAO.isFireBird ,'"'+ListField+'"',ListField) );

  DataSource.DataSet:= DataSet;

  Combobox.ListSource := DataSource;
  Combobox.KeyField   := DataSet.Fields[0].FieldName;
  Combobox.ListField  := DataSet.Fields[1].FieldName;
end;

{
procedure FillComboEdit( TipoEntidade : TTipoEntidade;
                          Combobox     : TComboEdit;
                          Condicao     : string ='0=0');
var
  DataSet    : TDataSet;
  Tabela     : string;
  KeyField   : string;
  ListField  : string;
begin
  Tabela     := TMapper.GetTableNameClasse( TEntidadeFactory.GetClassInfo(TipoEntidade) );

  try
    KeyField   := ifthen(TGenericDAO.isFireBird ,'"Codigo"','Codigo') ;
    ListField  := ifthen(TGenericDAO.isFireBird ,'"Descricao"','Descricao');

    DataSet    := TGenericDAO.GetSelect( Tabela,   Condicao+' Order By '+ ListField ,
                                    KeyField +','+ ListField );
  except
     KeyField   := ifthen(TGenericDAO.isFireBird ,'"Codigo"','Codigo') ;
     ListField  := ifthen(TGenericDAO.isFireBird ,'"Nome"','Nome') ;
     DataSet    := TGenericDAO.GetSelect( Tabela,   Condicao+' Order By '+ ListField ,
                                    KeyField +','+ ListField );
  end;


  DataSet.First;
  Combobox.Items.clear;
  while not DataSet.Eof do
  begin
    if DataSet.FindField('Descricao') <> nil then
       Combobox.Items.AddObject(DataSet.FieldByName('Descricao').AsString,
                   TObject(  DataSet.FieldByName('Codigo').AsInteger) )
    else
       Combobox.Items.AddObject(DataSet.FieldByName('Nome').AsString,
                   TObject(  DataSet.FieldByName('Codigo').AsInteger) );
    DataSet.Next;
  end;
  DataSet.Free;
end;

}

end.
