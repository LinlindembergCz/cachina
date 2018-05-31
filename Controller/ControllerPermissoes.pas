 unit ControllerPermissoes;

interface

uses
   Windows,Data.DB,  Messages, SysUtils, Variants, Classes,  ControllerTabelas,
   Forms, Mapper, GenericEntidade;

type
  TControllerPermissoes = class( TControllerTabelas )
  private


  public
    procedure Inserir(Objecto: TGenericEntidade);override;
    procedure Atualizar(Objecto: TGenericEntidade);override;
    procedure Excluir(Objecto: TGenericEntidade);override;
    function GetDataSet(Objecto: TGenericEntidade;
                        Condicao: string;
                        Fields: string= ''):TDataset;
    function GetSelect(Tabela, Condicao: string; Fields: string = ''): TDataset;overload;
     function GetSelect(Select: string ): TDataset;overload;
    class function GetValue(Tabela, Condicao, Field: string): String; static;

    procedure InsertPermissao(CodigoFuncionario, CodigoModuloAcesso: string);
    procedure DeletePermissao(CodigoFuncionario, CodigoModuloAcesso: string);

    class procedure TemPermissao( CodigoFuncionario, CodigoModulo, CodigoAcesso: string);static;
  end;

const
  consultaAcessos = ' Select'+
                    ' moac."Codigo", moac."CodigoModulo", moac."CodigoAcesso", mo."Descricao", ac."Descricao" as Acesso'+
                    ' From ModuloAcesso moac'+
                    ' inner join Acessos ac on ac."Codigo"   = moac."CodigoAcesso"'+
                    ' inner join Modulo mo on mo."Codigo" = moac."CodigoModulo" ';



  consultaPermissoes = ' Select'+
                       ' moac."Codigo", moac."CodigoModulo", moac."CodigoAcesso", '+
                       ' mo."Descricao",ac."Descricao" as Acesso , perm."CodigoFuncionario", func."Nome"'+
                       ' From ModuloAcesso moac'+
                       ' inner join Acessos ac on ac."Codigo"   = moac."CodigoAcesso"'+
                       ' inner join Modulo mo on mo."Codigo" = moac."CodigoModulo"'+
                       ' inner join PermissoesModuloAcesso perm on perm."CodigoModuloAcesso" = moac."Codigo"'+
                       ' inner join Funcionarios func on func."Codigo" = perm."CodigoFuncionario"';


implementation

{ TControllerClientes }

uses  GenericDAO, DialogsUtils;//, SaidaListagem;

procedure TControllerPermissoes.Atualizar(Objecto: TGenericEntidade);
begin
  inherited  ;
end;

procedure TControllerPermissoes.Excluir(Objecto: TGenericEntidade);
begin
  inherited ;
end;

function TControllerPermissoes.GetDataSet(Objecto: TGenericEntidade;
                                         Condicao: string;
                                         Fields: string = ''): TDataset;
begin
  result:= inherited;
end;

function TControllerPermissoes.GetSelect(Select: string): TDataset;
begin
  result := TGenericDAO.GetSelect(Select);
end;

procedure TControllerPermissoes.Inserir(Objecto:TGenericEntidade);
begin
  inherited;
end;

procedure TControllerPermissoes.InsertPermissao(CodigoFuncionario, CodigoModuloAcesso : string);
begin
  TGenericDAO.InsertSQL('PermissoesModuloAcesso' ,
                        '"CodigoFuncionario", "CodigoModuloAcesso"',
                        CodigoFuncionario+ ', '+ CodigoModuloAcesso);
end;

class procedure TControllerPermissoes.TemPermissao(CodigoFuncionario, CodigoModulo,
  CodigoAcesso: string);
  var
   sql: string;
   Dataset:TDataSet;
begin
  if (CodigoModulo <> '') and (CodigoAcesso <> '') and (CodigoFuncionario <> '') then
   begin
     sql:= consultaPermissoes+ ' where "CodigoFuncionario"='+ CodigoFuncionario + ' and '+
                               ' "CodigoModulo"     = '+ CodigoModulo + ' and '+
                               ' "CodigoAcesso"     = '+ CodigoAcesso ;
     Dataset:=  TGenericDAO.GetSelect(sql);
     if Dataset.IsEmpty then
     begin
        TDialogs.MensagemAtencao('Acesso restristo! Entre em contato com o administrador');
        abort;
     end;
   end;
end;

procedure TControllerPermissoes.DeletePermissao(CodigoFuncionario, CodigoModuloAcesso : string);
begin
  TGenericDAO.DeleteSQL('PermissoesModuloAcesso' ,
                        ' "CodigoFuncionario" ='+CodigoFuncionario +
                        ' and '+
                        ' "CodigoModuloAcesso"='+ CodigoModuloAcesso );
end;

function TControllerPermissoes.GetSelect(Tabela, Condicao: string; Fields: string= ''): TDataset;
begin
  result := TGenericDAO.GetSelect(Tabela,Condicao, Fields);
end;

class function TControllerPermissoes.GetValue(Tabela, Condicao, Field: string): String;
begin
  result := TGenericDAO.GetValue(Tabela,Condicao, Field);
end;

end.
