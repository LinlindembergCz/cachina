program cryptus;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {FormPrincipal},
  Controller in '..\Controller\Controller.pas',
  ControllerCaixaMovimentacao in '..\Controller\ControllerCaixaMovimentacao.pas',
  ControllerClientes in '..\Controller\ControllerClientes.pas',
  ControllerFornecedores in '..\Controller\ControllerFornecedores.pas',
  ControllerFuncionarios in '..\Controller\ControllerFuncionarios.pas',
  ControllerPermissoes in '..\Controller\ControllerPermissoes.pas',
  ControllerTabelas in '..\Controller\ControllerTabelas.pas',
  Caixa in '..\Modelos\Caixa.pas',
  CaixaMovimentacao in '..\Modelos\CaixaMovimentacao.pas',
  Categoria in '..\Modelos\Categoria.pas',
  ClassificacaoCliente in '..\Modelos\ClassificacaoCliente.pas',
  Contatos in '..\Modelos\Contatos.pas',
  Empresa in '..\Modelos\Empresa.pas',
  FormaPagamento in '..\Modelos\FormaPagamento.pas',
  Fornecedores in '..\Modelos\Fornecedores.pas',
  FuncionarioComissao in '..\Modelos\FuncionarioComissao.pas',
  Funcionarios in '..\Modelos\Funcionarios.pas',
  GenericEntidade in '..\Modelos\GenericEntidade.pas',
  Log in '..\Modelos\Log.pas',
  Modulo in '..\Modelos\Modulo.pas',
  Pagamentos in '..\Modelos\Pagamentos.pas',
  Pessoa in '..\Modelos\Pessoa.pas',
  Recebimentos in '..\Modelos\Recebimentos.pas',
  CAtribEntity in '..\Persistencia\CAtribEntity.pas',
  Mapper in '..\Persistencia\Mapper.pas',
  srvModBaseDados in '..\Persistencia\srvModBaseDados.pas' {DSServerModuleBaseDados: TDataModule},
  ClientesDAO in '..\Dao\ClientesDAO.pas',
  GenericDAO in '..\Dao\GenericDAO.pas',
  ControllerProcesso in 'Controllers\ControllerProcesso.pas',
  EntidadeFactory in 'Factory\EntidadeFactory.pas',
  Processo in 'Modelos\Processo.pas',
  Baixar in '..\Baixar.pas' {FormBaixar},
  Constantes in '..\Constantes.pas',
  DBUtils in '..\DBUtils.pas',
  DialogsUtils in '..\DialogsUtils.pas',
  FiltroPeriodo in '..\FiltroPeriodo.pas' {Form1},
  LoginAcesso in '..\LoginAcesso.pas' {FormLoginAcesso},
  Parcelar in '..\Parcelar.pas' {FormParcelar},
  TemplateComboEditDialog in '..\TemplateComboEditDialog.pas' {TemplateFormComboboEditDialog},
  TemplateDetalhesBase in '..\TemplateDetalhesBase.pas' {TemplateFormBaseDetalhes},
  TemplateDetalhesComTab in '..\TemplateDetalhesComTab.pas' {TemplateFormComTabDetalhes},
  TemplateDetalhesComTabGrid in '..\TemplateDetalhesComTabGrid.pas' {TemplateFormComTabGridDetalhes},
  TemplateListagemBase in '..\TemplateListagemBase.pas' {TemplateFormListagemBase},
  UtilsNumeros in '..\UtilsNumeros.pas',
  UtilsString in '..\UtilsString.pas',
  CaixaDetalhes in '..\Views\Caixa\CaixaDetalhes.pas' {FormCaixaDetalhes},
  CaixaFinanceiroDetalhes in '..\Views\Caixa\CaixaFinanceiroDetalhes.pas' {FormCaixaFinanceiroDetalhes},
  FiltroFluxoCaixa in '..\Views\Caixa\FiltroFluxoCaixa.pas' {FormFiltroFluxoCaixa},
  RelFluxoCaixa in '..\Views\Caixa\RelFluxoCaixa.pas' {FormRelFluxoCaixa},
  RelMovimentacaoCaixaFinanceiro in '..\Views\Caixa\RelMovimentacaoCaixaFinanceiro.pas' {FormRelMovimentacaoCaixaFinanceiro},
  ClientesDetalhes in '..\Views\Clientes\ClientesDetalhes.pas' {FormClientesDetalhes},
  ContatosClientesListagem in '..\Views\Clientes\ContatosClientesListagem.pas' {FormContatosClientesListagem},
  EmpresaDetalhes in '..\Views\Empresa\EmpresaDetalhes.pas' {FormEmpresaDetalhes},
  FornecedoresDetalhes in '..\Views\Fornecedores\FornecedoresDetalhes.pas' {FormFornecedoresDetalhes},
  FuncionariosComboboEditDialog in '..\Views\Funcionarios\FuncionariosComboboEditDialog.pas' {FormFuncionariosComboboEditDialog},
  FuncionariosDetalhes in '..\Views\Funcionarios\FuncionariosDetalhes.pas' {FormFuncionariosDetalhes},
  PagamentoDetalhes in '..\Views\Pagamentos\PagamentoDetalhes.pas' {FormPagamentoDetalhes},
  Relpagamento in '..\Views\Pagamentos\Relpagamento.pas' {FormRelPagamento},
  PermissoesAcessos in '..\Views\Permissoes\PermissoesAcessos.pas' {FormPermissoes},
  RecebimentosDetalhes in '..\Views\Recebimentos\RecebimentosDetalhes.pas' {FormRecebimentoDetalhes},
  RelRecebimento in '..\Views\Recebimentos\RelRecebimento.pas' {FormRelRecebimento},
  CategoriasDetalhes in '..\Views\Tabelas\CategoriasDetalhes.pas' {FormCategoriasDetalhes},
  ClassificacaoDetalhes in '..\Views\Tabelas\ClassificacaoDetalhes.pas' {FormClassificacaoDetalhes},
  FormaPagamentoDetalhes in '..\Views\Tabelas\FormaPagamentoDetalhes.pas' {FormFormaPagamentoDetalhes},
  LogListagem in '..\Views\Log\LogListagem.pas' {FormLogListagem},
  ControllerOrcamento in '..\Controller\ControllerOrcamento.pas',
  Boleto in '..\Views\Boleto\Boleto.pas' {FormBoleto},
  AreaJuridica in 'Modelos\AreaJuridica.pas',
  ResultadoProcesso in 'Modelos\ResultadoProcesso.pas',
  TipoAcaoProccesso in 'Modelos\TipoAcaoProccesso.pas',
  FaseProcesso in 'Modelos\FaseProcesso.pas',
  Distribuicao in 'Modelos\Distribuicao.pas',
  ObjetoProcesso in 'Modelos\ObjetoProcesso.pas',
  FaseProcessoDetalhes in 'Views\Tabelas\FaseProcessoDetalhes.pas' {FormFaseProcessoDetalhes},
  ObjetoProcessoDetalhes in 'Views\Tabelas\ObjetoProcessoDetalhes.pas' {FormObjetoProcessoDetalhes},
  TipoAcaoProcessoDetalhes in 'Views\Tabelas\TipoAcaoProcessoDetalhes.pas' {FormTipoAcaoProcessoDetalhes},
  AreaJuridicaDetalhes in 'Views\Tabelas\AreaJuridicaDetalhes.pas' {FormAreaJuridicaDetalhes},
  DistribuicaoDetalhes in 'Views\Tabelas\DistribuicaoDetalhes.pas' {FormDistribuicaoDetalhes},
  ResultadoProcessoDetalhes in 'Views\Tabelas\ResultadoProcessoDetalhes.pas' {FormResultadoProcessoDetalhes},
  ProcessoDetalhes in 'Views\Processo\ProcessoDetalhes.pas' {FormProcessoDetalhes},
  ControllerPagamento in '..\Controller\ControllerPagamento.pas',
  ControllerRecebimento in '..\Controller\ControllerRecebimento.pas',
  ControllerFormaPagamento in '..\Controller\ControllerFormaPagamento.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDSServerModuleBaseDados, DSServerModuleBaseDados);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
