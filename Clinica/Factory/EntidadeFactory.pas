unit EntidadeFactory;

interface

uses
  GenericEntidade, Vcl.Dialogs;

Type
  TTipoEntidade = ( tpTriagem , tpAgendamento, tpConvenio, tpTipoAgendamento,
                    tpEspecialista , tpEspecialistaConvenio,tpProduto, tpPessoa, tpContatos,
                    tpFormaPagamento, tpFuncionarios,tpFuncionarioComissao,
                    tpParametrosPrecoVenda, tpFamilia, tpGrupo, tpSubGrupo, tpItemEntrada,
                    tpEntrada, tpItemSaida, tpSaida, tpRecebimento,
                    tpPagamento, tpCategoria, tpCaixa, tpEstabelecimento, tpTabelaCID, tpSessoes,
                    tpCaixaMovimentacao, tpUnidadeMedida, tpFornecedor, tpSubfase , tpitemorcamento,
                    tpCentroCusto, tpTabelaNCM, tpVeiculos, tpOrcamentoFormaPagamento, tpTabelaNFSe,tpSequenciaNF, tpCFOP,
                    tpTabelaPreco, tpItemTabelaPreco, tpLembretes, tpPlanoContas);



  TEntidadeFactory = class
  private

  public
    class function Criar (const TipoEntidade: TTipoEntidade):TGenericEntidade;
    class function GetClassInfo(const TipoEntidade: TTipoEntidade): Pointer; static;
    class function GetNameEntidade(const TipoEntidade:TTipoEntidade): string;
  end;

implementation

{ TEntidadeFactory }

uses
 Triagem, Agendamento, Convenio, TipoAgendamento, Especialista, Mapper,
  Produtos,  Pessoa,  Contatos,  FormaPagamento,   Funcionarios,   FuncionarioComissao,
  ParametrosPrecoVenda, ItemEntrada,   Entrada,  ItemSaida,   Saida, TabelasProdutos,
  Recebimentos, Pagamentos, Categoria, Caixa, Estabelecimento, TabelaCID,
  Sessoes, CaixaMovimentacao, UnidadeMedida;


class function TEntidadeFactory.Criar(
  const TipoEntidade: TTipoEntidade): TGenericEntidade;
begin
  case TipoEntidade of
     tpTriagem              : result := TTriagem.create;
     tpAgendamento          : result := TAgendamento.create;
     tpConvenio             : result := TConvenio.create;
     tpTipoAgendamento      : result := TTipoAgendamento.create;
     tpEspecialista         : result := TEspecialista.create;
     tpEspecialistaConvenio : result := TEspecialistaConvenio.create;
     tpProduto              : result := TProdutos.create;
     tpPessoa               : result := TPessoa.create;
     tpContatos             : result := TContatos.create;
     tpFormaPagamento       : result := TFormaPagamento.create;
     tpFuncionarios         : result := TFuncionarios.create;
     tpFuncionarioComissao  : result := TFuncionarioComissao.Create;
     tpParametrosPrecoVenda : result := TParametrosPrecoVenda.create;
     tpFamilia              : result := TFamiliaProdutos.Create;
     tpGrupo                : result := TGrupoProdutos.Create;
     tpSubGrupo             : result := TSubGrupoProdutos.Create;
     tpItemEntrada          : result := TItemEntrada.Create;
     tpEntrada              : result := TEntrada.Create;
     tpItemSaida            : result := TItemSaida.Create;
     tpSaida                : result := TSaida.Create;
     tpRecebimento          : result := TRecebimento.Create;
     tpPagamento            : result := TPagamento.Create;
     tpCategoria            : result := TCategoria.Create;
     tpCaixa                : result := TCaixa.Create;
     tpEstabelecimento      : result := TEstabelecimento.Create;
     tpTabelaCID            : result := TTabelaCID.Create;
     tpSessoes              : result := TSessoes.Create;
     tpCaixaMovimentacao    : result := TCaixaMovimentacao.Create;
     tpUnidadeMedida        : result := TUnidadeMedida.Create;

  else
    showmessage('Tipo de classe nao implementada pela factory!');
  end;
end;

class function TEntidadeFactory.GetClassInfo(
  const TipoEntidade: TTipoEntidade): Pointer;
begin
  case TipoEntidade of
    tpTriagem              : result := TTriagem.ClassInfo;
    tpAgendamento          : result := TAgendamento.ClassInfo;
    tpConvenio             : result := TConvenio.ClassInfo;
    tpTipoAgendamento      : result := TTipoAgendamento.ClassInfo;
    tpEspecialista         : result := TEspecialista.ClassInfo;
    tpEspecialistaConvenio : result := TEspecialistaConvenio.ClassInfo;
    tpProduto              : result := TProdutos.ClassInfo;
    tpPessoa               : result := TPessoa.ClassInfo;
    tpContatos             : result := TContatos.ClassInfo;
    tpFormaPagamento       : result := TFormaPagamento.ClassInfo;
    tpFuncionarios         : result := TEspecialista.ClassInfo;
    tpFuncionarioComissao  : result := TFuncionarioComissao.ClassInfo;
    tpParametrosPrecoVenda : result := TParametrosPrecoVenda.ClassInfo;
    tpFamilia              : result := TFamiliaProdutos.ClassInfo;
    tpGrupo                : result := TGrupoProdutos.ClassInfo;
    tpSubGrupo             : result := TSubGrupoProdutos.ClassInfo;
    tpItemEntrada          : result := TItemEntrada.ClassInfo;
    tpEntrada              : result := TEntrada.ClassInfo;
    tpItemSaida            : result := TItemSaida.ClassInfo;
    tpSaida                : result := TSaida.ClassInfo;
    tpRecebimento          : result := TRecebimento.ClassInfo;
    tpPagamento            : result := TPagamento.ClassInfo;
    tpCategoria            : result := TCategoria.ClassInfo;
    tpCaixa                : result := TCaixa.ClassInfo;
    tpEstabelecimento      : result := TEstabelecimento.ClassInfo;
    tpTabelaCID            : result := TTabelaCID.ClassInfo;
    tpSessoes              : result := TSessoes.ClassInfo;
    tpUnidadeMedida        : result := TUnidadeMedida.ClassInfo;
  else
    showmessage('Tipo de classe nao implementada pela factory!');
  end;
end;

class function TEntidadeFactory.GetNameEntidade(
  const TipoEntidade: TTipoEntidade): string;
begin
  result := TMapper.GetTableNameClasse( GetClassInfo(TipoEntidade));
end;

end.
