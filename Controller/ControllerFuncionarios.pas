unit ControllerFuncionarios;

interface

uses
   GenericEntidade, Windows, Data.DB,  Messages, SysUtils, Variants, Classes, ControllerTabelas;

type
  TControllerFuncionarios = class( TControllerTabelas )
  private
  public
    procedure Inserir(Objecto: TGenericEntidade); override;
    procedure Atualizar(Objecto: TGenericEntidade);override;
    procedure Excluir(Objecto: TGenericEntidade);override;
    function GetDataSet(Objecto: TGenericEntidade;Condicao: string;  Fields: string= ''):TDataset;
    function GetSelect(Tabela, Condicao:string; Fields: string= ''):TDataset;
    function VerificarLogin(Login, Senha: string): string;
    procedure UsuarioAdministrador(Login: string);
  end;

  const
  camposFuncionario = 'T1.*, (Select Descricao from Cargos where Codigo = T1.CodigoCargo) as NomeCargo';
   camposFuncionarioComissao = 'T1.*, (Select Descricao from Produtos where Codigo = T1.CodigoProduto) as Servico';

implementation

{ TControllerClientes }

uses  GenericDAO, DialogsUtils, EntidadeFactory, Mapper;

procedure TControllerFuncionarios.Atualizar(Objecto: TGenericEntidade);
begin
  inherited  ;
end;

procedure TControllerFuncionarios.Excluir(Objecto: TGenericEntidade);
begin
  inherited ;
end;

function TControllerFuncionarios.GetDataSet(Objecto: TGenericEntidade;
                                            Condicao: string;
                                            Fields: string= ''): TDataset;
begin
   inherited;
end;

function TControllerFuncionarios.GetSelect(Tabela, Condicao,
  Fields: string): TDataset;
begin
  result:= inherited;
end;

procedure TControllerFuncionarios.Inserir(Objecto:TGenericEntidade);
begin
  inherited;
end;

function TControllerFuncionarios.VerificarLogin(Login, Senha: string): string;
var
  DataSet:TDataSet;
begin
  DataSet:= GetSelect( TMapper.GetTableNameClasse( TEntidadeFactory.GetClassInfo(tpFuncionarios)),
                      '"Login"='+ quotedstr(Login)+' and "Senha"='+ quotedstr(senha),
                      '"Login","Codigo"');
  if DataSet.IsEmpty then
  begin
    TDialogs.MensagemAtencao('Usuário/senha não confere!');
    abort;
  end;

  result :=  DataSet.FieldByName('Codigo').AsString;

end;

procedure TControllerFuncionarios.UsuarioAdministrador(Login : string);
var
  DataSet:TDataSet;
begin
  DataSet:= GetSelect( TMapper.GetTableNameClasse( TEntidadeFactory.GetClassInfo(tpFuncionarios)),
                      '"Login"='+ quotedstr(Login), '"Administrador"');

  if DataSet.FieldByName('Administrador').AsString <> 'SIM' then
  begin
    TDialogs.MensagemAtencao('Acesso negado!');
    abort;
  end;
end;

end.

{
Select
Modulo.Descricao , Acessos.Descricao, PermissoesModuloAcesso.CodigoFuncionario
From
ModuloAcesso
left join Modulo on
Modulo.Codigo = ModuloAcesso.CodigoModulo
left join Acessos on
Acessos.Codigo = ModuloAcesso.CodigoAcesso
left join PermissoesModuloAcesso on
PermissoesModuloAcesso.CodigoModuloAcesso = ModuloAcesso.Codigo
order by Modulo.Descricao
}
