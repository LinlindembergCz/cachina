unit EntidadeFactory;

interface

uses
  GenericEntidade, Dialogs;

Type
  TTipoEntidade = (
  tpClassificacaoCliente, tpProduto, tpPessoa, tpContatos,
  tpVeiculos, tpModeloVeiculo, tpMarcaVeiculo, tpFormaPagamento,
  tpFuncionarios,tpFuncionarioComissao, tpOrcamento,tpOrcamentoFormaPagamento,
  tpItemOrcamento, tpParametrosPrecoVenda, tpFamilia, tpGrupo,
  tpSubGrupo, tpItemEntrada, tpEntrada, tpItemSaida, tpSaida, tpRecebimento,
  tpPagamento, tpCategoria, tpCaixa,tpCaixaMovimentacao, tpLog, tpModulo,
  tpPedido, tpItemPedido, tpEmpresa, tpUnidadeMedida, tpEtapa, tpFase, tpSubFase,
  tpEquipe,tpItemEquipe, tpCargo, tpDiarioAtividade, tpItemDiarioAtividade,
  tpimovel,tpImovelTipo, tpImovelCaracteristica, tpImovelClassificacao,  tpImovelSituacao,
  tpImovelUnidade, tpQuantitativo, tpItemQuantitativo, tpProjeto, tpCentroCusto,
  tpFuncionarioFaltas , tpTabelaNCM, tpTabelaNFSe  );

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
  ClassificacaoCliente, Produtos, Contatos,  Pessoa,
  FormaPagamento, Funcionarios,
  ItemOrcamento, TabelasProdutos, UnidadeMedida,
  FuncionarioComissao, Mapper, Entrada, ItemEntrada, Saida, ItemSaida,
  Recebimentos, Pagamentos, Categoria, Caixa, Modulo, Log, CaixaMovimentacao,
  Pedido, ItemPedido, Empresa, EtapaFase, Equipe, Cargo, DiarioAtividade,
  ItemDiarioAtividade, Imovel, ImovelCaracteristica, ImovelClassificacao,
  ImovelSituacao, ImovelTipo, ImovelUnidade, ParametrosPrecoVenda, Quantitativo,
  ItemQuantitativo, Projeto;

class function TEntidadeFactory.Criar(
  const TipoEntidade: TTipoEntidade): TGenericEntidade;
begin
  case TipoEntidade of
    tpClassificacaoCliente : result := TClassificacaoCliente.create;
    tpProduto              : result := TProdutos.create;
    tpPessoa               : result := TPessoa.create;
    tpContatos             : result := TContatos.create;
    tpFormaPagamento       : result := TFormaPagamento.create;
    tpFuncionarios         : result := TFuncionarios.create;
    tpFuncionarioComissao  : result := TFuncionarioComissao.Create;
    tpFuncionarioFaltas    : result := TFuncionarioFaltas.Create;
    tpParametrosPrecoVenda : result := TParametrosPrecoVenda.create;

    tpItemOrcamento        : result := TItemOrcamento.Create;
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
    tpCaixaMovimentacao    : result := TCaixaMovimentacao.Create;
    tpLog                  : result := TCaixa.Create;
    tpModulo               : result := TModulo.Create;
    tpPedido               : result := TPedido.Create;
    tpItemPedido           : result := TItemPedido.Create;
    tpEmpresa              : result := TEmpresa.Create;
    tpUnidadeMedida        : result := TUnidadeMedida.Create;

    tpEtapa                : result := TEtapa.Create;
    tpFase                 : result := TFase.Create;
    tpSubFase              : result := TSubFase.Create;
    tpEquipe               : result := TEquipe.Create;
    tpItemEquipe           : result := TItemEquipe.Create;
    tpCargo                : result := TCargo.Create;
    tpDiarioAtividade      : result := TDiarioAtividade.Create;
    tpItemDiarioAtividade  : result := TItemDiarioAtividade.Create;
    tpimovel               : result := TImovel.Create;
    tpImovelTipo           : result := TImovelTipo.Create;
    tpImovelCaracteristica : result := TImovelCaracteristica.Create;
    tpImovelClassificacao  : result := TImovelClassificacao.Create;
    tpImovelSituacao       : result := TImovelSituacao.Create;
    tpImovelUnidade        : result := TImovelUnidade.Create;
    tpQuantitativo         : result := TQuantitativo.Create;
    tpItemQuantitativo     : result := TItemQuantitativo.Create;
    tpProjeto              : result := TProjeto.Create;
  else
    showmessage('Tipo de classe nao implementada pela factory!');
  end;
end;

class function TEntidadeFactory.GetClassInfo(
  const TipoEntidade: TTipoEntidade): Pointer;
begin
  case TipoEntidade of
    tpClassificacaoCliente : result := TClassificacaoCliente.ClassInfo;
    tpProduto              : result := TProdutos.ClassInfo;
    tpPessoa               : result := TPessoa.ClassInfo;
    tpContatos             : result := TContatos.ClassInfo;
    tpFormaPagamento       : result := TFormaPagamento.ClassInfo;
    tpFuncionarios         : result := TFuncionarios.ClassInfo;
    tpFuncionarioComissao  : result := TFuncionarioComissao.ClassInfo;
    tpParametrosPrecoVenda : result := TParametrosPrecoVenda.ClassInfo;
    tpItemOrcamento        : result := TItemOrcamento.ClassInfo;
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
    tpCaixaMovimentacao    : result := TCaixaMovimentacao.ClassInfo;
    tpLog                  : result := TLog.ClassInfo;
    tpModulo               : result := TModulo.ClassInfo;
    tpPedido               : result := TPedido.ClassInfo;
    tpItemPedido           : result := TItemPedido.ClassInfo;
    tpEmpresa              : result := TEmpresa.ClassInfo;
    tpUnidadeMedida        : result := TUnidadeMedida.ClassInfo;

    tpEtapa                : result := TEtapa.ClassInfo;
    tpFase                 : result := TFase.ClassInfo;
    tpSubFase              : result := TSubFase.ClassInfo;
    tpEquipe               : result := TEquipe.ClassInfo;
    tpItemEquipe           : result := TItemEquipe.ClassInfo;
    tpCargo                : result := TCargo.ClassInfo;

    tpDiarioAtividade      : result := TDiarioAtividade.ClassInfo;
    tpItemDiarioAtividade  : result := TItemDiarioAtividade.ClassInfo;
    tpimovel               : result := TImovel.ClassInfo;
    tpImovelTipo           : result := TImovelTipo.ClassInfo;
    tpImovelCaracteristica : result := TImovelCaracteristica.ClassInfo;
    tpImovelClassificacao  : result := TImovelClassificacao.ClassInfo;
    tpImovelSituacao       : result := TImovelSituacao.ClassInfo;
    tpImovelUnidade        : result := TImovelUnidade.ClassInfo;
    tpQuantitativo         : result := TQuantitativo.ClassInfo;
    tpItemQuantitativo     : result := TItemQuantitativo.ClassInfo;
    tpProjeto              : result := TProjeto.ClassInfo;

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
