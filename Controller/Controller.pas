unit Controller;

interface

uses
  DB, Classes, GenericEntidade, Mapper;

type
  IController = interface['{F3ED2A00-1809-4084-88D9-5A0D92CE4925}']
    function GetMapper : TMapper;
    procedure SetMapper(const Value : TMapper);
    property Mapper : TMapper read GetMapper write SetMapper;
    procedure Inserir(Entidade:TGenericEntidade);
    procedure Atualizar(Entidade:TGenericEntidade);
    procedure Excluir(Entidade:TGenericEntidade);
    function  GetDataSet(Entidade:TGenericEntidade;Condicao: string; Fields: string= ''):TDataSet;
    function  GetSelect(Select:String; Condicao: string; Fields: string= ''):TDataSet;
    procedure Inicializar(Sender:TStringList);
  //function  GetDataSet(DataSet:TObject;Condicao: string; Fields: string= ''):TDataSet;
  end;

implementation


end.
