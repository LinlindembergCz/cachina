unit EntidadeFactory;

interface

uses
  GenericEntidade, Dialogs;

Type
  TTipoEntidade = ( tpClassificacaoCliente, tpProduto, tpPessoa, tpContatos,
                    tpVeiculos, tpModeloVeiculo, tpMarcaVeiculo, tpFormaPagamento,
                    tpFuncionarios,tpFuncionarioComissao, tpOrcamento,tpOrcamentoFormaPagamento,
                    tpItemOrcamento, tpParametrosPrecoVenda, tpFamilia, tpGrupo,
                    tpSubGrupo, tpItemEntrada, tpEntrada, tpItemSaida, tpSaida, tpRecebimento,
                    tpPagamento, tpPlanoContas, tpCaixa,tpCaixaMovimentacao, tpLog, tpModulo,
                    tpPedido, tpItemPedido, tpEmpresa , tpUnidadeMedida, tpCargo, tpSubFase , tpCentroCusto,
                    tpFuncionarioFaltas, tpTabelaNCM, tpTabelaNFSe,tpSequenciaNF, tpCFOP,
                    tpTabelaPreco, tpItemTabelaPreco, tpLembretes );

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
  ClassificacaoCliente, Produtos, Contatos, Veiculos, Pessoa,
  ModeloVeiculo, MarcaVeiculo, FormaPagamento, Funcionarios,
  ParametrosPrecoVenda, Orcamento, ItemOrcamento, TabelasProdutos,
  FuncionarioComissao, Mapper, Entrada, ItemEntrada, Saida, ItemSaida,
  Recebimentos, Pagamentos, Categoria, Caixa, Modulo, Log, CaixaMovimentacao,
  Pedido, ItemPedido, Empresa, UnidadeMedida, Cargo, CentroCusto, TabelaNCM,
  TabelaNFSe, SequenciaNF, TabelaCFOP, TabelaPreco, Lembrete;

class function TEntidadeFactory.Criar( const TipoEntidade: TTipoEntidade): TGenericEntidade;
begin
  case TipoEntidade of
    tpClassificacaoCliente    : result := TClassificacaoCliente.create;
    tpProduto                 : result := TProdutos.create;
    tpPessoa                  : result := TPessoa.create;
    tpContatos                : result := TContatos.create;
    tpVeiculos                : result := TVeiculos.create;
    tpModeloVeiculo           : result := TModeloVeiculo.create;
    tpMarcaVeiculo            : result := TMarcaVeiculo.create;
    tpFormaPagamento          : result := TFormaPagamento.create;
    tpFuncionarios            : result := TFuncionarios.create;
    tpFuncionarioComissao     : result := TFuncionarioComissao.Create;
    tpParametrosPrecoVenda    : result := TParametrosPrecoVenda.create;
    tpOrcamento               : result := TOrcamento.Create;
    tpOrcamentoFormaPagamento : result := TOrcamentoFormaPagamento.Create;
    tpItemOrcamento           : result := TItemOrcamento.Create;
    tpFamilia                 : result := TFamiliaProdutos.Create;
    tpGrupo                   : result := TGrupoProdutos.Create;
    tpSubGrupo                : result := TSubGrupoProdutos.Create;
    tpItemEntrada             : result := TItemEntrada.Create;
    tpEntrada                 : result := TEntrada.Create;
    tpItemSaida               : result := TItemSaida.Create;
    tpSaida                   : result := TSaida.Create;
    tpRecebimento             : result := TRecebimento.Create;
    tpPagamento               : result := TPagamento.Create;
    tpPlanoContas             : result := TCategoria.Create;
    tpCaixa                   : result := TCaixa.Create;
    tpCaixaMovimentacao       : result := TCaixaMovimentacao.Create;
    tpLog                     : result := TCaixa.Create;
    tpModulo                  : result := TModulo.Create;
    tpPedido                  : result := TPedido.Create;
    tpItemPedido              : result := TItemPedido.Create;
    tpEmpresa                 : result := TEmpresa.Create;
    tpUnidadeMedida           : result := TUnidadeMedida.Create;
    tpCargo                   : result := TCargo.Create;
    tpCentroCusto             : result := TCentroCusto.Create;
    tpFuncionarioFaltas       : result := TFuncionarioFaltas.Create;
    tpTabelaNCM               : result := TTabelaNCM.Create;
    tpTabelaNFSe              : result := TTabelaNFSe.Create;
    tpSequenciaNF             : result := TSequenciaNF .Create;
    tpCFOP                    : result := TTabelaCFOP .Create;
    tpTabelaPreco             : result := TTabelaPreco.Create;
    tpItemTabelaPreco         : result := TItemTabelaPreco.Create;
    tpLembretes               : result := TLembrete.Create;
  //tpSubFase              : result := TSubFase.Create;
  else
    showmessage('Tipo de classe nao implementada pela factory!');
  end;
end;

class function TEntidadeFactory.GetClassInfo( const TipoEntidade: TTipoEntidade): Pointer;
begin
  case TipoEntidade of
    tpClassificacaoCliente    : result := TClassificacaoCliente.ClassInfo;
    tpProduto                 : result := TProdutos.ClassInfo;
    tpPessoa                  : result := TPessoa.ClassInfo;
    tpContatos                : result := TContatos.ClassInfo;
    tpVeiculos                : result := TVeiculos.ClassInfo;
    tpModeloVeiculo           : result := TModeloVeiculo.ClassInfo;
    tpMarcaVeiculo            : result := TMarcaVeiculo.ClassInfo;
    tpFormaPagamento          : result := TFormaPagamento.ClassInfo;
    tpFuncionarios            : result := TFuncionarios.ClassInfo;
    tpFuncionarioComissao     : result := TFuncionarioComissao.ClassInfo;
    tpParametrosPrecoVenda    : result := TParametrosPrecoVenda.ClassInfo;
    tpOrcamento               : result := TOrcamento.ClassInfo;
    tpOrcamentoFormaPagamento : result := TOrcamentoFormaPagamento.ClassInfo;
    tpItemOrcamento           : result := TItemOrcamento.ClassInfo;
    tpFamilia                 : result := TFamiliaProdutos.ClassInfo;
    tpGrupo                   : result := TGrupoProdutos.ClassInfo;
    tpSubGrupo                : result := TSubGrupoProdutos.ClassInfo;
    tpItemEntrada             : result := TItemEntrada.ClassInfo;
    tpEntrada                 : result := TEntrada.ClassInfo;
    tpItemSaida               : result := TItemSaida.ClassInfo;
    tpSaida                   : result := TSaida.ClassInfo;
    tpRecebimento             : result := TRecebimento.ClassInfo;
    tpPagamento               : result := TPagamento.ClassInfo;
    tpPlanoContas               : result := TCategoria.ClassInfo;
    tpCaixa                   : result := TCaixa.ClassInfo;
    tpCaixaMovimentacao       : result := TCaixaMovimentacao.ClassInfo;
    tpLog                     : result := TLog.ClassInfo;
    tpModulo                  : result := TModulo.ClassInfo;
    tpPedido                  : result := TPedido.ClassInfo;
    tpItemPedido              : result := TItemPedido.ClassInfo;
    tpEmpresa                 : result := TEmpresa.ClassInfo;
    tpUnidadeMedida           : result := TUnidadeMedida.ClassInfo;
    tpCargo                   : result := TCargo.ClassInfo;
    tpCentroCusto             : result := TCentroCusto.ClassInfo;
    tpTabelaNCM               : result := TTabelaNCM.ClassInfo;
    tpTabelaNFSe              : result := TTabelaNFSe.ClassInfo;
    tpSequenciaNF             : result := TSequenciaNF .ClassInfo;
    tpCFOP                    : result := TTabelaCFOP.ClassInfo;
    tpTabelaPreco             : result := TTabelaPreco.ClassInfo;
    tpItemTabelaPreco         : result := TItemTabelaPreco.ClassInfo;
    tpLembretes               : result := TLembrete.ClassInfo;
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
