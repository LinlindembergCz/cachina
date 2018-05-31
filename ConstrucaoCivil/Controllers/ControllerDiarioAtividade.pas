unit ControllerDiarioAtividade;

interface

uses
   Windows,Data.DB,  Messages, SysUtils, Variants, Classes,  ControllerTabelas,
   Forms, Mapper, GenericEntidade, strUtils;

type

  TControllerDiarioAtividade = class(TControllerTabelas)
  public
    procedure Inserir(Objecto: TGenericEntidade);override;
    procedure Atualizar(Objecto: TGenericEntidade);override;
    procedure Excluir(Objecto: TGenericEntidade);override;
    function GetDataSet(Objecto: TGenericEntidade;
                        Condicao: string;
                        Fields: string= ''):TDataset;
    function GetSelect(Tabela, Condicao: string; Fields: string = ''): TDataset;
    class function GetValue(Tabela, Condicao, Field: string): String; static;
    function GetProducao100(Condicao:String):TDataSet;
    function GetProducaoAcumulada(Aprovado:integer; Condicao, DataInicio, DataFim, Ordem: string):TDataSet;
    function GetResumoDiariodeObra(Condicao: string):TDataSet;

    procedure AprovarTodoHistorico(CodigoUnidade, CodigoEquipe, CodigoSubFase: string);

    function GetEstatistica(Condicao: string):TDataSet;
    function AtividadeAprovada(CodigoUnidade, CodigoSubFase: string):boolean;
  end;

  const

  TabelaDiarioAtividade = 'DiarioAtividade T1 '+
                          ' left join Imovel imo on imo.Codigo = CodigoObra '+
                          ' left join Funcionarios func on func.Codigo = CodigoFuncionario';

  TabelaItemDiarioAtividade =  'ItemDiarioAtividade ite '+
                               ' inner join DiarioAtividade T1 on CodigoDiarioAtividade = T1.Codigo'+
                               ' inner join Equipe eq on eq.Codigo = ite.CodigoEquipe '+
                               ' inner join SubFase sub on sub.Codigo = ite.CodigoSubFase '+
                               ' left join ImovelUnidade un on un.Codigo = ite.CodigoUnidade'+
                               ' left join Fase on fase.Codigo = sub.CodigoFase '+
                               ' left join UnidadeMedida unid on unid.Codigo = sub.CodigoUnidade';

implementation

{ TControllerDiarioAtividade }

uses GenericDAO;

procedure TControllerDiarioAtividade.AprovarTodoHistorico(
  CodigoUnidade, CodigoEquipe, CodigoSubFase: string);
begin
  TGenericDAO.ExecSQL('Update ItemDiarioAtividade set Status =''Aprovado'' '+
                      ' where '+
                      ' CodigoUnidade= '+ CodigoUnidade +
                      ' and CodigoEquipe= '+CodigoEquipe+
                      ' and CodigoSubFase= '+ CodigoSubFase );
end;

function TControllerDiarioAtividade.AtividadeAprovada(CodigoUnidade,
  CodigoSubFase: string): boolean;
begin
{Controller.GetSelect('ImovelUnidade T1 ',
                                        '0=0',
                                        ' T1.*, ( Select Count(Distinct CodigoSubFase) from ItemDiarioAtividade where '+
                                        ' CodigoUnidade = T1.Codigo '+ ifthen(CodigoAtividade <> '',
                                        ' and CodigoSubFase='+ CodigoAtividade , '') +' ) as Atividades , '+
                                        ' (select SUM(ISNULL(Apontamento,0)) From ItemDiarioAtividade where '+
                                        ' CodigoUnidade = T1.Codigo'+ ifthen(CodigoAtividade <> '',
                                        ' and CodigoSubFase='+ CodigoAtividade , '') +' ) as Apontamento');  }
end;

procedure TControllerDiarioAtividade.Atualizar(Objecto: TGenericEntidade);
begin
  inherited;

end;

procedure TControllerDiarioAtividade.Excluir(Objecto: TGenericEntidade);
begin
  inherited;

end;

function TControllerDiarioAtividade.GetDataSet(Objecto: TGenericEntidade;
  Condicao, Fields: string): TDataset;
begin
  result:= inherited;
end;

function TControllerDiarioAtividade.GetEstatistica(Condicao: string): TDataSet;
begin
  result:= GetSelect('SubFase SUB', 'SUB.Codigo IN ( Select CodigoSubFase from ItemDiarioAtividade where status = ''Aprovado''  )'+
                     ' order by Realizado desc',
                     ' SUB.DESCRICAO as DescricaoServico, '+
                     ' ( Select COUNT(Distinct CodigoUnidade) from '+
                     '   ItemDiarioAtividade it '+
                     '   where CodigoSubFase = SUB.Codigo and status = ''Aprovado'' ) as Realizado,'+
                     ' (Select Count(*) from ImovelUnidade un '+
                     '  inner join Imovel imo on   imo.Codigo = un.CodigoImovel) - '+
                     ' (Select COUNT(Distinct CodigoUnidade) from ItemDiarioAtividade it '+
                     '  where CodigoSubFase = SUB.Codigo  and status = ''Aprovado'' ) as Falta,'+

                    ' ( ( Select COUNT(Distinct CodigoUnidade) from ItemDiarioAtividade it  '+
                    '    where CodigoSubFase = SUB.Codigo  and status = ''Aprovado'')  * 100 /  '+
                    '  ( Select Count(*) from ImovelUnidade un inner join Imovel imo on   imo.Codigo = un.CodigoImovel) ) as PercRealizado,'+
                    ' ( 100 -  '+
                    ' ( Select COUNT(Distinct CodigoUnidade) from ItemDiarioAtividade it '+
                    '    where CodigoSubFase = SUB.Codigo  and status = ''Aprovado'')  * 100 /  '+
                    '  ( Select Count(*) from ImovelUnidade un inner join Imovel imo on   imo.Codigo = un.CodigoImovel)   ) as PercFalta' );
end;

function TControllerDiarioAtividade.GetProducao100(Condicao: String): TDataSet;
begin
  result:= GetSelect(
  ' ItemDiarioAtividade T2'+
  ' inner join DiarioAtividade T1 on CodigoDiarioAtividade = T1.Codigo'+
  ' left join Equipe eq on eq.Codigo = T2.CodigoEquipe'+
  ' left join ItemEquipe ieq on  ieq.CodigoEquipe = eq.Codigo'+
  ' left join Funcionarios func on func.Codigo = ieq.CodigoFuncionario'+
  ' left join FuncionarioComissao funccomi on func.Codigo = funccomi.CodigoFuncionario'+
  ' left join Produtos prod on prod.Codigo = funccomi.CodigoProduto and prod.CodigoSubFase = T2.CodigoSubFase'+
  ' left join SubFase sub on sub.Codigo = T2.CodigoSubFase'+
  ' left join Fase on fase.Codigo = sub.CodigoFase'+
  ' left join ImovelUnidade un on un.Codigo = T2.CodigoUnidade'+
  ' left join UnidadeMedida unid on unid.Codigo = sub.CodigoUnidade'
  , Condicao +' and '+
  ' Apontamento = 100 and T2.Status= ''Aprovado'' and ISNULL(sub.Valor,0) > 0 and ISNULL(ieq.Participacao,0) >= 0 '+
  ' order by func.Nome ',
  ' eq.Descricao as DescricaoEquipe, func.Nome as NomeFuncionario, T1.Data,'+
  ' un.Descricao as DescricaoUnidade, sub.Descricao as DescricaoServico,'+
  ' ISNULL(Apontamento,0) , cast( ISNULL(sub.Valor,0)as Numeric(10,2)) as ValorServico,'+
  ' ( Select ISNULL(Participacao,0) from ItemEquipe where  Codigo = ieq.Codigo ) as Participacao,'+
  ' ( case ' +
  '       when ISNULL(funccomi.Valor,0) > 0  then '+
  '         funccomi.Valor '+
  '       when ISNULL(func.Gratificacao,0) > 0 then  '+
  '         func.Gratificacao   '+
  '       else '+
  '          ISNULL(sub.Valor,0) *  ISNULL(ieq.Participacao,0) / 100 '+
  '   end '+
  ' ) as Producao' );
end;

function TControllerDiarioAtividade.GetProducaoAcumulada(Aprovado:integer; Condicao, DataInicio,
  DataFim, Ordem: string): TDataSet;
  var
    status: string;
begin
   if Aprovado = 1 then
      status:= 'Aprovado'
   else
   if Aprovado = 2 then
      status:= 'Reprovado'
   else
      status:= '';

   TGenericDAO.ExecSQL('IF object_id(''tempdb..#Producao'') IS NOT NULL BEGIN DROP TABLE #Producao END');

   TGenericDAO.ExecSQL('create table  #Producao '+
                       ' ('+
                       ' CodigoUnidade INT, '+
                       ' DescricaoUnidade  varchar(200),  '+
                       ' CodigoServico INT,'+
                       ' DescricaoServico  varchar(200), '+
                       ' Apontamento  float,'+
                       ' ValorServico  float,'+
                       ' Status varchar(10) )');

   TGenericDAO.ExecSQL('EXEC spProducao '+ quotedstr(DataInicio) +','+ quotedstr(DataFim) );

   result := GetSelect(' #Producao Produ'+
                       ' inner join ItemDiarioAtividade ite on  ite.CodigoUnidade =  Produ.CodigoUnidade and '+
                       '                                        ite.CodigoSubFase =  Produ.CodigoServico  '+
                       ' Inner join SubFase sub on sub.Codigo = ite.CodigoSubFase '+
                       ' inner join Fase on fase.Codigo = sub.Codigofase'+
                       ' inner join DiarioAtividade T1 on  ite.CodigoDiarioAtividade =  T1.Codigo'+
                       ' inner join Equipe eq on eq.Codigo = ite.CodigoEquipe'+
                       ' inner join ItemEquipe iteq on iteq.CodigoEquipe = eq.Codigo'+
                       ' inner join Funcionarios func on func.Codigo = iteq.CodigoFuncionario'+
                       ' left join FuncionarioComissao funccomi on func.Codigo = funccomi.CodigoFuncionario'+
                       ' left join Produtos prod on '+
                       ' prod.Codigo = funccomi.CodigoProduto and '+
                       ' prod.CodigoSubFase = ite.CodigoSubFase' ,

                       ' ISNULL(ValorServico,0) > 0 AND '+
                       ' ( ISNULL(Participacao,0) > 0 or '+
                       ' ISNULL(func.Gratificacao,0) > 0 or '+
                       ' ISNULL(iteq.Gratificacao,0) > 0 or '+
                       ' ISNULL(funccomi.Valor,0) > 0 ) and '+
                         ifthen(status <> '' , '   ite.Status = '''+ status +''' and ','')+ Condicao +
                       //GROUP BY
                       ' GROUP BY '+
                       '  func.Nome, func.Codigo, func.SalarioBase, T1.Codigo, DescricaoUnidade  , fase.Descricao, eq.descricao , DescricaoServico, '+
                       ' isNull(Participacao,0), isNull(ParticipacaoReal,0) , ValorServico, funccomi.Valor,  ISNULL(func.Gratificacao,0),'+
                       ' ISNULL(iteq.Gratificacao,0), iteq.TipoGratificacao, func.TipoGratificacao,  eq.Codigo '+

                       ' ORDER BY '+Ordem,
                       //////////////////
                       ' func.Nome as NomeFuncionario, '+
                       //////////////////
                       ' DescricaoUnidade, '+
                       //////////////////
                       ' DescricaoServico, '+
                       //////////////////
                       ' fase.Descricao as DescricaoFase, '+
                       //////////////////
                       '  eq.descricao as DescricaoEquipe,'+
                       //////////////////
                       ' eq.Descricao, '+
                       //////////////////
                       ' ISNULL(func.SalarioBase, 0) as SalarioBase  ,'+
                       //////////////////
                       '  (case '+
                       '     when (ISNULL(iteq.Gratificacao,0) > 0) or (ISNULL(func.Gratificacao,0) > 0) or (ISNULL(funccomi.Valor,0) > 0 ) then  '+
                       '       0  '+
                       '     else '+
                       '        isNull(ParticipacaoReal,0) '+
                       '     end)'+
                       '   as Participacao , '+
                       //////////////////
                       '  ValorServico , '+
                       //////////////////
                       '  ( case '+
                       '    when ISNULL(Participacao,0) > 0  then '+
                       '         SUM(ISNULL(ValorServico,0) * isNull(ite.Apontamento,0) /100 * isNull(Participacao,0) /100) '+
                       '    else '+
                       '         0 '+
                       '    end '+
                       '  ) as Producao, '+
                       //////////////////
                       '  ( case '+
                       '    when ISNULL(ParticipacaoReal,0) > 0  then '+
                       '         SUM(ISNULL(ValorServico,0) * isNull(ite.Apontamento,0) / 100 * ( isNull(ParticipacaoReal,0) /100 ) ) '+
                       '    else '+
                       '         0 '+
                       '    end '+
                       '  ) as ProducaoReal, '+
                       //////////////////
                       '  ( case '+
                       '    when ISNULL(funccomi.Valor,0) > 0  then funccomi.Valor '+
                       '     '+
                       '    when (ISNULL(iteq.Gratificacao,0) > 0) and (upper(iteq.TipoGratificacao) = ''FIXO'' OR func.TipoGratificacao IS NULL) then '+
                       '         ( ISNULL(iteq.Gratificacao,0) / (Select COUNT(Distinct CodigoSubFase) From DiarioAtividade dia '+
                       '           inner join ItemDiarioAtividade itDia on dia.Codigo = itDia.CodigoDiarioAtividade '+
                       '           where itDia.CodigoEquipe = eq.Codigo and  '+
                       '                 Data >= '+ quotedstr(DataInicio) +' and Data<='+ quotedstr(DataFim)+' ) ) '+
                       '     '+
                       '    when (ISNULL(iteq.Gratificacao,0) > 0) and (upper(iteq.TipoGratificacao) = ''POR SERVIÇO'') then '+
                       '         ( ISNULL(iteq.Gratificacao,0) ) '+
                       '     '+
                       '    when ISNULL(func.Gratificacao,0) > 0  and (upper(func.TipoGratificacao) = ''FIXO'' OR func.TipoGratificacao IS NULL) then '+
                       '         ( ISNULL(func.Gratificacao,0)/ (Select COUNT(Distinct CodigoSubFase) From DiarioAtividade dia '+
                       '           inner join ItemDiarioAtividade itDia on dia.Codigo = itDia.CodigoDiarioAtividade '+
                       '           where itDia.CodigoEquipe = eq.Codigo and  '+
                       '                 Data >= '+ quotedstr(DataInicio) +' and Data<='+ quotedstr(DataFim)+' ) )' +
                       '    ' +
                       '    when ISNULL(func.Gratificacao,0) > 0  and (upper(func.TipoGratificacao) = ''POR SERVIÇO'') then '+
                       '         ( ISNULL(func.Gratificacao,0) ) '+
                       '  end '+
                       '  ) as Gratificacao , '+
                       ////////////////////
                       ' ( Select COUNT(DISTINCT DATA) '+
                       '   From '+
                       '   DiarioAtividade dia '+
                       '   inner join ItemDiarioAtividade it on CodigoDiarioAtividade  = Dia.Codigo'+
                       '   inner join ItemEquipe iteq2 on it.CodigoEquipe =  iteq2.CodigoEquipe  where '+
                       '   Data >= '+ quotedstr(DataInicio) +' and Data<='+ quotedstr(DataFim) +
                       '   and  iteq2.CodigoFuncionario= func.Codigo ) as Dias, '+
                       ////////////////////
                       ' ( Select count(*) From FuncionarioFaltas func3 '+
                       '   inner join ItemEquipe iteq3 on iteq3.CodigoFuncionario = func3.CodigoFuncionario '+
                       '   where '+
                       '   iteq3.CodigoEquipe  = eq.Codigo and '+
                       '   iteq3.ParticipacaoReal > 0 and '+
                       '   func3.CodigoFuncionario  <> func.Codigo and '+
                       '   Data >= '+ quotedstr(DataInicio) +
                       ' and Data <='+ quotedstr(DataFim) +'  ) as FaltasRepasse, '+
                       ////////////////////
                       ' ( Select  count(*) from FuncionarioFaltas where '+
                       '   CodigoFuncionario = func.Codigo and '+
                       '   Data >= '+ quotedstr(DataInicio) +' and Data<='+ quotedstr(DataFim)+
                       '  ) as Faltas ' );

end;

function TControllerDiarioAtividade.GetResumoDiariodeObra(
  Condicao: string): TDataSet;
begin
  result := GetSelect('DiarioAtividade T1'+
                      ' inner join ItemDiarioAtividade ite on T1.Codigo = ite.CodigoDiarioAtividade'+
                      ' inner join Equipe eq on eq.Codigo = ite.CodigoEquipe'+
                      ' inner join ItemEquipe iteq on iteq.CodigoEquipe = eq.Codigo'+
                      ' inner join Funcionarios func on func.Codigo = iteq.CodigoFuncionario'+
                      ' inner join Cargos carg on carg.Codigo = CodigoCargo',
                        Condicao  +
                      ' GROUP BY carg.Descricao',
                      ' carg.Descricao, Count(Distinct func.Codigo) as Quantidade');
end;

function TControllerDiarioAtividade.GetSelect(Tabela, Condicao,
  Fields: string): TDataset;
begin
  result := TGenericDAO.GetSelect(Tabela,Condicao, Fields);
end;

class function TControllerDiarioAtividade.GetValue(Tabela, Condicao,
  Field: string): String;
begin
   result := TGenericDAO.GetValue(Tabela,Condicao, Field);
end;

procedure TControllerDiarioAtividade.Inserir(Objecto: TGenericEntidade);
begin
  inherited;

end;




end.
