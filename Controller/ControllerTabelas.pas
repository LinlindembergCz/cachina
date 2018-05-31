unit ControllerTabelas;

interface

uses
   Windows, DB,  Messages, SysUtils, Variants, Classes, Controller, GenericEntidade,Mapper, strUtils;

type
  TControllerTabelas = class( TInterfacedObject, IController)
  private
    FMapper: TMapper;
    FCodigoModulo: string;
    function GetMapper : TMapper;
    procedure SetMapper(const Value: TMapper);
    procedure SetCodigoModulo(const Value: string);
  protected

  public
    property PMapper: TMapper read FMapper write SetMapper;
    procedure Inserir(Objecto: TGenericEntidade); virtual;
    procedure Atualizar(Objecto: TGenericEntidade);virtual;
    procedure Excluir(Objecto: TGenericEntidade);virtual;
    procedure DeleteSQL(Tabela, Condicao: string);virtual;
    function GetDataSet(Objecto: TGenericEntidade;
                        Condicao: string;
                        Fields: string= ''):TDataset;virtual;
    function GetSelect(Select: string ): TDataset;overload;
    function GetSelect(Select, Condicao:string; Fields: string= ''):TDataset;overload;

    procedure Inicializar(Sender:TStringList);virtual;

    class function GetValue(Tabela, Condicao, Field: string): String; static;
    property CodigoModulo: string read FCodigoModulo write SetCodigoModulo;

    function GetMaxEntidade(Tabela: string):string;
  end;

implementation

{ TControllerTabelas }

uses GenericDAO, Principal, ControllerPermissoes;

class function TControllerTabelas.GetValue(Tabela, Condicao, Field: string): String;
begin
  result := TGenericDAO.GetValue(Tabela,Condicao, Field);
end;

procedure TControllerTabelas.Inserir(Objecto:TGenericEntidade);
begin
  TControllerPermissoes.TemPermissao(formPrincipal.CodigoPessoa,
  ifthen( FCodigoModulo <> '', FCodigoModulo, TGenericDAO.GetModulo(Objecto)) , '1');
  TGenericDAO.Insert(Objecto, formPrincipal.CodigoPessoa );
end;

procedure TControllerTabelas.Atualizar(Objecto: TGenericEntidade);
begin
  TControllerPermissoes.TemPermissao(formPrincipal.CodigoPessoa,
  ifthen( FCodigoModulo <> '', FCodigoModulo, TGenericDAO.GetModulo(Objecto)) , '2');
  TGenericDAO.Update(Objecto , formPrincipal.CodigoPessoa );
end;

procedure TControllerTabelas.Excluir(Objecto: TGenericEntidade);
begin
  TControllerPermissoes.TemPermissao(formPrincipal.CodigoPessoa,
  ifthen( FCodigoModulo <> '', FCodigoModulo, TGenericDAO.GetModulo(Objecto)) , '3');
  TGenericDAO.Delete(Objecto ,  formPrincipal.CodigoPessoa );
end;

procedure TControllerTabelas.DeleteSQL(Tabela, Condicao: string);
begin
  TGenericDAO.DeleteSQL(Tabela, Condicao);
end;

function TControllerTabelas.GetDataSet(Objecto: TGenericEntidade;Condicao: string; Fields: string= ''): TDataset;
begin
   result := TGenericDAO.GetAll(Objecto,Condicao, Fields);
end;

function TControllerTabelas.GetMapper: TMapper;
begin
  result:= FMapper;
end;

function TControllerTabelas.GetMaxEntidade(Tabela: string): string;
var
  DataSet: TDataSet;
begin
   DataSet:= TGenericDAO.GetSelect('Select  ISNULL( Max(Codigo), 0) +1 as Max From '+
             Tabela+' T1' );
   result := trim(DataSet.FieldByName('Max').asstring);
end;

procedure TControllerTabelas.SetCodigoModulo(const Value: string);
begin
  FCodigoModulo := Value;
end;

procedure TControllerTabelas.SetMapper(const Value: TMapper);
begin
  FMapper := Value;
end;

function TControllerTabelas.GetSelect(Select, Condicao: string; Fields: string= ''): TDataset;
begin
  result := TGenericDAO.GetSelect(Select,Condicao, Fields);
end;

function TControllerTabelas.GetSelect(Select: string ): TDataset;
begin
  result := TGenericDAO.GetSelect(Select);
end;

procedure TControllerTabelas.Inicializar(Sender: TStringList);
begin

end;


end.
