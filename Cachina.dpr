program Cachina;

uses
  MidasLib,
  Vcl.Forms,
  EntidadeFactory in 'Factory\EntidadeFactory.pas',
  ClassificacaoCliente in 'Modelos\ClassificacaoCliente.pas',
  Pessoa in 'Modelos\Pessoa.pas',
  Contatos in 'Modelos\Contatos.pas',
  FormaPagamento in 'Modelos\FormaPagamento.pas',
  FuncionarioComissao in 'Modelos\FuncionarioComissao.pas',
  Funcionarios in 'Modelos\Funcionarios.pas',
  ItemOrcamento in 'Modelos\ItemOrcamento.pas',
  MarcaVeiculo in 'Modelos\MarcaVeiculo.pas',
  ModeloVeiculo in 'Modelos\ModeloVeiculo.pas',
  Orcamento in 'Modelos\Orcamento.pas',
  ParametrosPrecoVenda in 'Modelos\ParametrosPrecoVenda.pas',
  PrecoVenda in 'Modelos\PrecoVenda.pas',
  Produtos in 'Modelos\Produtos.pas',
  TabelasProdutos in 'Modelos\TabelasProdutos.pas',
  Veiculos in 'Modelos\Veiculos.pas',
  CAtribEntity in 'Persistencia\CAtribEntity.pas',
  srvModBaseDados in 'Persistencia\srvModBaseDados.pas' {DSServerModuleBaseDados: TDataModule},
  ClientesDAO in 'Dao\ClientesDAO.pas',
  GenericDAO in 'Dao\GenericDAO.pas',
  OrcamentosDAO in 'Dao\OrcamentosDAO.pas',
  Controller in 'Controller\Controller.pas',
  ControllerClientes in 'Controller\ControllerClientes.pas',
  ControllerFuncionarios in 'Controller\ControllerFuncionarios.pas',
  ControllerOrcamento in 'Controller\ControllerOrcamento.pas',
  ControllerProdutos in 'Controller\ControllerProdutos.pas',
  ControllerTabelas in 'Controller\ControllerTabelas.pas',
  TemplateDetalhesBase in 'TemplateDetalhesBase.pas' {TemplateFormBaseDetalhes},
  TemplateDetalhesComTab in 'TemplateDetalhesComTab.pas' {TemplateFormComTabDetalhes},
  TemplateDetalhesComTabGrid in 'TemplateDetalhesComTabGrid.pas' {TemplateFormComTabGridDetalhes},
  TemplateListagemBase in 'TemplateListagemBase.pas' {TemplateFormListagemBase},
  DBUtils in 'DBUtils.pas',
  UtilsNumeros in 'UtilsNumeros.pas',
  UtilsString in 'UtilsString.pas',
  DialogsUtils in 'DialogsUtils.pas',
  ContatosClientesListagem in 'Views\Clientes\ContatosClientesListagem.pas' {FormContatosClientesListagem},
  FuncionariosDetalhes in 'Views\Funcionarios\FuncionariosDetalhes.pas' {FormFuncionariosDetalhes},
  ProdutosDetalhes in 'Views\Produtos\ProdutosDetalhes.pas' {FormProdutosDetalhes},
  OrcamentoDetalhes in 'Views\Orcamento\OrcamentoDetalhes.pas' {FormOrcamentoDetalhes},
  ItensOrcamento in 'ObjectValues\ItensOrcamento.pas',
  Principal in 'Principal.pas' {FormPrincipal},
  OrcamentoListagem in 'Views\Orcamento\OrcamentoListagem.pas' {FormOrcamentoListagem},
  TemplateComboEditDialog in 'TemplateComboEditDialog.pas' {TemplateFormComboboEditDialog},
  FuncionariosComboboEditDialog in 'Views\Funcionarios\FuncionariosComboboEditDialog.pas' {FormFuncionariosComboboEditDialog},
  ClassificacaoDetalhes in 'Views\Tabelas\ClassificacaoDetalhes.pas' {FormClassificacaoDetalhes},
  FamiliaProdutosDetalhes in 'Views\Tabelas\FamiliaProdutosDetalhes.pas' {FormFamiliaProdutosDetalhes},
  FormaPagamentoDetalhes in 'Views\Tabelas\FormaPagamentoDetalhes.pas' {FormFormaPagamentoDetalhes},
  GrupoProdutosDetalhes in 'Views\Tabelas\GrupoProdutosDetalhes.pas' {FormGrupoProdutosDetalhes},
  MarcasDetalhes in 'Views\Tabelas\MarcasDetalhes.pas' {FormMarcasDetalhes},
  ModelosDetalhes in 'Views\Tabelas\ModelosDetalhes.pas' {FormModelosDetalhes},
  ParametrosPrecoVendaDetalhes in 'Views\Tabelas\ParametrosPrecoVendaDetalhes.pas' {FormParametrosPrecoVendaDetalhes},
  SubGrupoProdutosDetalhes in 'Views\Tabelas\SubGrupoProdutosDetalhes.pas' {FormSubGrupoProdutosDetalhes},
  ClientesDetalhes in 'Views\Clientes\ClientesDetalhes.pas' {FormClientesDetalhes},
  RelOrcamento in 'Views\Orcamento\RelOrcamento.pas' {FormRelOrcamento},
  FornecedoresDetalhes in 'Views\Fornecedores\FornecedoresDetalhes.pas' {FormFornecedoresDetalhes},
  ControllerFornecedores in 'Controller\ControllerFornecedores.pas',
  EntradaDetalhes in 'Views\Entradas\EntradaDetalhes.pas' {FormEntradaDetalhes},
  ItemEntrada in 'Modelos\ItemEntrada.pas',
  Entrada in 'Modelos\Entrada.pas',
  ItensEntrada in 'ObjectValues\ItensEntrada.pas',
  ControllerEntrada in 'Controller\ControllerEntrada.pas',
  EntradaListagem in 'Views\Entradas\EntradaListagem.pas' {FormEntradaListagem},
  ControllerSaida in 'Controller\ControllerSaida.pas',
  ItemSaida in 'Modelos\ItemSaida.pas',
  Saida in 'Modelos\Saida.pas',
  ItensSaida in 'ObjectValues\ItensSaida.pas',
  SaidaDetalhes in 'Views\Saidas\SaidaDetalhes.pas' {FormSaidaDetalhes},
  SaidaListagem in 'Views\Saidas\SaidaListagem.pas' {FormSaidaListagem},
  Recebimentos in 'Modelos\Recebimentos.pas',
  PagamentoDetalhes in 'Views\Pagamentos\PagamentoDetalhes.pas' {FormPagamentoDetalhes},
  RecebimentosDetalhes in 'Views\Recebimentos\RecebimentosDetalhes.pas' {FormRecebimentoDetalhes},
  Pagamentos in 'Modelos\Pagamentos.pas',
  Categoria in 'Modelos\Categoria.pas',
  PlanoContasDetalhes in 'Views\Tabelas\PlanoContasDetalhes.pas' {FormPlanoContasDetalhes},
  CaixaDetalhes in 'Views\Caixa\CaixaDetalhes.pas' {FormCaixaDetalhes},
  Caixa in 'Modelos\Caixa.pas',
  ControllerPagamento in 'Controller\ControllerPagamento.pas',
  ControllerRecebimento in 'Controller\ControllerRecebimento.pas',
  LoginAcesso in 'LoginAcesso.pas' {FormLoginAcesso},
  LogListagem in 'Views\Log\LogListagem.pas' {FormLogListagem},
  Log in 'Modelos\Log.pas',
  Modulo in 'Modelos\Modulo.pas',
  Baixar in 'Baixar.pas' {FormBaixar},
  CaixaMovimentacao in 'Modelos\CaixaMovimentacao.pas',
  RelMovimentacaoCaixaFinanceiro in 'Views\Caixa\RelMovimentacaoCaixaFinanceiro.pas' {FormRelMovimentacaoCaixaFinanceiro},
  FiltroFluxoCaixa in 'Views\Caixa\FiltroFluxoCaixa.pas' {FormFiltroFluxoCaixa},
  FiltroPeriodo in 'FiltroPeriodo.pas' {FormFiltroPeriodo},
  CaixaFinanceiroDetalhes in 'Views\Caixa\CaixaFinanceiroDetalhes.pas' {FormCaixaFinanceiroDetalhes},
  RelFluxoCaixa in 'Views\Caixa\RelFluxoCaixa.pas' {FormRelFluxoCaixa},
  Pedido in 'Modelos\Pedido.pas',
  ItemPedido in 'Modelos\ItemPedido.pas',
  PedidoDetalhes in 'Views\Pedidos\PedidoDetalhes.pas' {FormPedidoDetalhes},
  ItensPedido in 'ObjectValues\ItensPedido.pas',
  ControllerPedido in 'Controller\ControllerPedido.pas',
  PedidoListagem in 'Views\Pedidos\PedidoListagem.pas' {FormPedidoListagem},
  Relpagamento in 'Views\Pagamentos\Relpagamento.pas' {FormRelPagamento},
  RelRecebimento in 'Views\Recebimentos\RelRecebimento.pas' {FormRelRecebimento},
  ControllerCaixaMovimentacao in 'Controller\ControllerCaixaMovimentacao.pas',
  Parcelar in 'Parcelar.pas' {FormParcelar},
  PermissoesAcessos in 'Views\Permissoes\PermissoesAcessos.pas' {FormPermissoes},
  ControllerPermissoes in 'Controller\ControllerPermissoes.pas',
  Empresa in 'Modelos\Empresa.pas',
  EmpresaDetalhes in 'Views\Empresa\EmpresaDetalhes.pas' {FormEmpresaDetalhes},
  ControllerFormaPagamento in 'Controller\ControllerFormaPagamento.pas',
  ufrmStatus in 'Nfe\ufrmStatus.pas' {frmStatus},
  UnidadeMedida in 'Modelos\UnidadeMedida.pas',
  BoletoACBr in 'Views\Boleto\BoletoACBr.pas' {frmBoletoACBr},
  CAPICOM_TLB in 'NFSe\CAPICOM_TLB.pas',
  MSXML2_TLB in 'NFSe\MSXML2_TLB.pas',
  ServiceGinfesImpl1 in 'NFSe\ServiceGinfesImpl1.pas',
  CargoDetalhes in 'Views\Tabelas\CargoDetalhes.pas' {FormCargoDetalhes},
  Cargo in 'Modelos\Cargo.pas',
  RelOrcamentoGeral in 'Views\Orcamento\RelOrcamentoGeral.pas' {FormRelOrcamentoGeral},
  RelRecibo in 'Views\Recebimentos\RelRecibo.pas' {FormRelRecibo},
  CentroCusto in 'Modelos\CentroCusto.pas',
  CentroCustoDetalhes in 'Views\Tabelas\CentroCustoDetalhes.pas' {FormCentroCustoDetalhes},
  RelOrcamento2 in 'Views\Orcamento\RelOrcamento2.pas' {FormRelOrcamento2},
  Fornecedores in 'Modelos\Fornecedores.pas',
  TabelaNCMDetalhes in 'Views\Tabelas\TabelaNCMDetalhes.pas' {FormTabelaNCMDetalhes},
  TabelaNCM in 'Modelos\TabelaNCM.pas',
  Diretorios in 'Diretorios.pas' {FormDiretorios},
  ControllerNFE in 'Controller\ControllerNFE.pas',
  TabelaNFSeDetalhes in 'Views\Tabelas\TabelaNFSeDetalhes.pas' {FormTabelaNFSeDetalhes},
  TabelaNFSe in 'Modelos\TabelaNFSe.pas',
  RelRecebimento2 in 'Views\Recebimentos\RelRecebimento2.pas' {FormRelRecebimento2},
  RelBalancoContabil in 'Views\Pagamentos\RelBalancoContabil.pas' {FormRelBalancoContabil},
  RelComissaoOrcamento in 'Views\Orcamento\RelComissaoOrcamento.pas' {FormRelComissaoOrcamento},
  ControllerFactory in 'Factory\ControllerFactory.pas',
  GenericEntidade in 'Modelos\GenericEntidade.pas',
  RelCurvaABC in 'Views\Produtos\RelCurvaABC.pas' {FormRelCurvaABC},
  EmissorNfe in 'Nfe\EmissorNfe.pas' {FormEmissorNfe},
  uConsultaCPF in 'Views\uConsultaCPF.pas' {formConsultaCPF},
  uDataModuleTEF in 'uDataModuleTEF.pas' {DmTEF: TDataModule},
  uMensagensTef in 'uMensagensTef.pas',
  uTEFExibeMenu in 'uTEFExibeMenu.pas' {frmTEFExibeMenu},
  uTEFObtemCampo in 'uTEFObtemCampo.pas' {frmTEFObtemCampo},
  uClassConsultaCNPJ in 'uClassConsultaCNPJ.pas',
  uConsultaCNPJReceita in 'uConsultaCNPJReceita.pas' {frmConsultaCNPJReceita},
  Vcl.Themes,
  Vcl.Styles,
  Indicadores in 'Views\Orcamento\Indicadores.pas' {FormIndicadores},
  ProdutoListagem in 'Views\Produtos\ProdutoListagem.pas' {FormProdutoListagem},
  uCustomDatabaseManager in 'Persistencia\uCustomDatabaseManager.pas',
  Mapper in 'Persistencia\Mapper.pas',
  Sequencias in 'Views\Tabelas\Sequencias.pas' {FormSequencias},
  SequenciaNF in 'Modelos\SequenciaNF.pas',
  TabelaCFOP in 'Modelos\TabelaCFOP.pas',
  ParametrosDetalhes in 'Views\Orcamento\ParametrosDetalhes.pas' {FormParametrosDetalhes},
  Parametros in 'Modelos\Parametros.pas',
  ControllerParametros in 'Controller\ControllerParametros.pas',
  TabelaPreco in 'Modelos\TabelaPreco.pas',
  TabelaPrecoDetalhes in 'Views\TabelaPreco\TabelaPrecoDetalhes.pas' {FormTabelaPrecoDetalhes},
  AlterarProdutos in 'Views\Produtos\AlterarProdutos.pas' {FormAlterarProdutos},
  ControllerSequencias in 'Controller\ControllerSequencias.pas',
  TabelaPrecoListagem in 'Views\TabelaPreco\TabelaPrecoListagem.pas' {FormTabelaPrecoListagem};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Amethyst Kamri');
  Application.CreateForm(TDSServerModuleBaseDados, DSServerModuleBaseDados);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
