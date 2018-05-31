unit Controller;

interface

uses
   Windows, DB,  Messages, forms, SysUtils, Variants, Classes, InterfaceController,
   GenericEntidade, mapper, strUtils, DBClient;

type
  TController = class( TInterfacedObject, IController)
  protected
    Mapper: TMapper;
    Entidade:TGenericEntidade;
    DataSet:TClientDataSet;
    View: TForm;
  public
    procedure Edit;virtual;
    procedure Insert;virtual;
    procedure Update;virtual;
    procedure Delete;virtual;
    procedure Select( where: string = '') ;virtual;
    procedure SelectId(id: string = '');virtual;
    procedure SetValue(Propriedade, Value: string);
    {
    procedure Excluir;virtual;
    procedure DeleteSQL(Tabela, Condicao: string);virtual;
    function GetDataSet( Condicao: string; Fields: string= ''):TDataset;virtual;
    function GetSelect(Select: string ): TDataset;overload;
    function GetSelect(Select, Condicao:string; Fields: string= ''):TDataset;overload;
    class function GetValue(Tabela, Condicao, Field: string): String; static;
    property CodigoModulo: string read FCodigoModulo write SetCodigoModulo;
    function GetMaxEntidade(Tabela: string):string;
    }
    constructor Create(Sender:TForm; ClientDataSet:TClientDataSet);virtual;

  end;

implementation

{ TControllerTabelas }

uses GenericDAO;

procedure TController.Insert;
begin
  TMapper.Send_ComponentToObject( View , Entidade );
  TMapper.Send_ObjectToDataSet(Entidade, DataSet , dsinsert);
  TGenericDAO.Insert(Entidade);
end;

procedure TController.Update;
begin
  TMapper.Send_ComponentToObject( View , Entidade );
  TMapper.Send_ObjectToDataSet(Entidade, DataSet , dsedit);
  TGenericDAO.Update(Entidade);
end;

procedure TController.Edit;
begin
  TMapper.Send_DataSetToComponent( DataSet , View );
  TMapper.Send_DataSetToObject( DataSet , Entidade);
end;

procedure TController.SetValue(Propriedade, Value: string);
begin
  TMapper.SetValue(View ,Entidade, Propriedade, Value );
end;

procedure TController.Delete;
begin
  TMapper.Send_DataSetToObject( DataSet , Entidade );
  TGenericDAO.Delete(Entidade);
  Select;
end;

procedure TController.Select( where: string = '') ;
begin
  DataSet.CloneCursor( TGenericDAO.GetDataSet(Entidade, where) , true);
end;

procedure TController.SelectId(id: string = '');
begin
  if id = '' then
     TMapper.Send_DataSetToObject( DataSet , Entidade );
  DataSet.CloneCursor( TGenericDAO.GetDataSetID( Entidade, id) , true);
end;

constructor TController.Create(Sender: TForm; ClientDataSet:TClientDataSet );
begin
  DataSet:= ClientDataSet;
end;

{
class function TController.GetValue(Tabela, Condicao, Field: string): String;
begin
  result := TGenericDAO.GetValue(Tabela,Condicao, Field);
end;

procedure TController.Excluir;
begin
  TGenericDAO.Delete(Entidade ,  '' );
end;

procedure TController.DeleteSQL(Tabela, Condicao: string);
begin
  TGenericDAO.DeleteSQL(Tabela, Condicao);
end;

function TController.GetDataSet(Condicao: string; Fields: string= ''): TDataset;
begin
   result := TGenericDAO.GetAll(Entidade,Condicao, Fields);
end;

function TController.GetMaxEntidade(Tabela: string): string;
var
  DataSet: TDataSet;
begin
   DataSet:= TGenericDAO.GetSelect('Select  ISNULL( Max(Codigo), 0) +1 as Max From '+
             Tabela+' T1' );
   result := trim(DataSet.FieldByName('Max').asstring);
end;

procedure TController.SetCodigoModulo(const Value: string);
begin
  FCodigoModulo := Value;
end;

function TController.GetSelect(Select, Condicao: string; Fields: string= ''): TDataset;
begin
  result := TGenericDAO.GetSelect(Select,Condicao, Fields);
end;

function TController.GetSelect(Select: string ): TDataset;
begin
  result := TGenericDAO.GetSelect(Select);
end;
}



end.
