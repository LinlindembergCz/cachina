unit Principal;

interface

uses
  SysUtils, Types, System.UITypes, System.Classes, System.Variants, DBClient,
  Graphics, Controls, Forms, Dialogs, StdCtrls, DB ,Menus, VCL.ActnList,
  EntidadeFactory, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.CategoryButtons,
  Vcl.Imaging.jpeg;

type
  TFormPrincipal = class(TForm)
    Panel1: TPanel;
    Image2: TImage;
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Empresa1: TMenuItem;
    Funcionarios1: TMenuItem;
    Fornecedor1: TMenuItem;
    Clientes1: TMenuItem;
    N2: TMenuItem;
    Financeiro1: TMenuItem;
    FormadePagamento1: TMenuItem;
    ActCaixa1: TMenuItem;
    ActCategorias1: TMenuItem;
    L1: TMenuItem;
    Pagamentos1: TMenuItem;
    Recebecimentos1: TMenuItem;
    CaixaFinanceiro1: TMenuItem;
    Fluxodecaixa1: TMenuItem;
    Fluxodecaixa2: TMenuItem;
    Jurdico1: TMenuItem;
    Processo1: TMenuItem;
    reasJurdicas1: TMenuItem;
    Objetos1: TMenuItem;
    iposdeAes1: TMenuItem;
    Fases1: TMenuItem;
    Distribuies1: TMenuItem;
    Resultados1: TMenuItem;
    Segurana1: TMenuItem;
    Log1: TMenuItem;
    Acessos1: TMenuItem;
    ActionList1: TActionList;
    ActFuncionarios: TAction;
    ActClientes: TAction;
    ActFornecedores: TAction;
    ActFormaPagamentos: TAction;
    ActClassificacaoCliente: TAction;
    ActPagamentos: TAction;
    ActRecebimentos: TAction;
    ActCategorias: TAction;
    ActCaixa: TAction;
    ActCaixaFinanceiro: TAction;
    ActEmpresa: TAction;
    ActAreaJuridica: TAction;
    ActDistribuicao: TAction;
    ActFaseProcesso: TAction;
    ActObjetoProcesso: TAction;
    ActTipoAcao: TAction;
    ActResultado: TAction;
    procedure ActFuncionariosExecute(Sender: TObject);
    procedure ActClientesExecute(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure ActFormaPagamentosExecute(Sender: TObject);
    procedure ActClassificacaoClienteExecute(Sender: TObject);
    procedure ActFornecedoresExecute(Sender: TObject);
    procedure ActPagamentosExecute(Sender: TObject);
    procedure ActRecebimentosExecute(Sender: TObject);
    procedure ActCategoriasExecute(Sender: TObject);
    procedure ActCaixaExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Log1Click(Sender: TObject);
    procedure Fluxodecaixa1Click(Sender: TObject);
    procedure ActCaixaFinanceiroExecute(Sender: TObject);
    procedure Fluxodecaixa2Click(Sender: TObject);
    procedure Acessos1Click(Sender: TObject);
    procedure ActEmpresaExecute(Sender: TObject);
    procedure Processo1Click(Sender: TObject);
    procedure ActAreaJuridicaExecute(Sender: TObject);
    procedure ActDistribuicaoExecute(Sender: TObject);
    procedure ActFaseProcessoExecute(Sender: TObject);
    procedure ActObjetoProcessoExecute(Sender: TObject);
    procedure ActTipoAcaoExecute(Sender: TObject);
    procedure ActResultadoExecute(Sender: TObject);
  private
    procedure SelecionarOrcamentDetalhe(Operacao, Codigo: string);
    { Private declarations }
  public
    { Public declarations }
    Login: string;
    CodigoPessoa: string;
    procedure ShowFormClienteDetlahes(CPF, Placa: string);
    function ShowComboEditDialgo(TipoEntidade: TTipoEntidade; Titulo: string): string;
    procedure SelecionarContato(CodigoCliente: string; var CPF, Nome: string);
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses
  ClientesDetalhes, FuncionariosDetalhes,  FormaPagamentoDetalhes,
  TemplateComboEditDialog,  ContatosClientesListagem,
  ClassificacaoDetalhes, Controller,  FornecedoresDetalhes,
  RecebimentosDetalhes, PagamentoDetalhes, CategoriasDetalhes,
  CaixaDetalhes, LoginAcesso, Log, LogListagem, FiltroFluxoCaixa,
  CaixaFinanceiroDetalhes, RelMovimentacaoCaixaFinanceiro, RelFluxoCaixa,
  PermissoesAcessos, EmpresaDetalhes, ProcessoDetalhes, AreaJuridicaDetalhes,
  DistribuicaoDetalhes, FaseProcessoDetalhes, ObjetoProcessoDetalhes,
  ResultadoProcessoDetalhes, TipoAcaoProcessoDetalhes;

procedure TFormPrincipal.Acessos1Click(Sender: TObject);
begin
   Application.CreateForm(TFormPermissoes, FormPermissoes);
   FormPermissoes.showmodal;
   FormPermissoes.Free;
end;

procedure TFormPrincipal.ActAreaJuridicaExecute(Sender: TObject);
begin
     Application.CreateForm(TFormAreaJuridicaDetalhes, FormAreaJuridicaDetalhes);
   FormAreaJuridicaDetalhes.Showmodal;
end;

procedure TFormPrincipal.ActCaixaExecute(Sender: TObject);
begin
   Application.CreateForm(TFormCaixaDetalhes, FormCaixaDetalhes);
   FormCaixaDetalhes.Show;
end;

procedure TFormPrincipal.ActCaixaFinanceiroExecute(Sender: TObject);
begin
  Application.CreateForm(TFormCaixaFinanceiroDetalhes, FormCaixaFinanceiroDetalhes);
  FormCaixaFinanceiroDetalhes.Show;
end;

procedure TFormPrincipal.ActCategoriasExecute(Sender: TObject);
begin
  Application.CreateForm(TFormCategoriasDetalhes, FormCategoriasDetalhes);
  FormCategoriasDetalhes.Show;
end;

procedure TFormPrincipal.ActClassificacaoClienteExecute(Sender: TObject);
begin
     application.CreateForm(TFormClassificacaoDetalhes,FormClassificacaoDetalhes);
   FormClassificacaoDetalhes.Show;
end;

procedure TFormPrincipal.ActClientesExecute(Sender: TObject);
begin
   application.CreateForm(TFormClientesDetalhes,FormClientesDetalhes);
   FormClientesDetalhes.Showmodal;
end;

procedure TFormPrincipal.ActDistribuicaoExecute(Sender: TObject);
begin
   application.CreateForm(TFormDistribuicaoDetalhes,FormDistribuicaoDetalhes);
   FormDistribuicaoDetalhes.Showmodal;
end;

procedure TFormPrincipal.ActEmpresaExecute(Sender: TObject);
begin
   application.CreateForm(TFormEmpresaDetalhes,FormEmpresaDetalhes);
   FormEmpresaDetalhes.Show;
end;

procedure TFormPrincipal.SelecionarContato(CodigoCliente: string; var CPF,
  Nome: string);
begin
   application.CreateForm(TFormContatosClientesListagem,FormContatosClientesListagem);
   FormContatosClientesListagem.CodigoCliente:= CodigoCliente;
   FormContatosClientesListagem.Showmodal;

   CPF  := FormContatosClientesListagem.CPFContato;
   Nome := FormContatosClientesListagem.NomeContato;

   FormContatosClientesListagem.Free;
end;

procedure TFormPrincipal.SelecionarOrcamentDetalhe(Operacao, Codigo: string);
begin

end;

function TFormPrincipal.ShowComboEditDialgo(TipoEntidade: TTipoEntidade; Titulo: string): string;
begin
   application.CreateForm(TTemplateFormComboboEditDialog,TemplateFormComboboEditDialog);

   TemplateFormComboboEditDialog.lbEntidade.caption := 'Selecione '+ Titulo;
   TemplateFormComboboEditDialog.Caption         := Titulo;
   TemplateFormComboboEditDialog.TipoEntidade    := TipoEntidade;

   TemplateFormComboboEditDialog.Showmodal;

   result:= TemplateFormComboboEditDialog.Codigo;
   TemplateFormComboboEditDialog.Free;
end;


procedure TFormPrincipal.ShowFormClienteDetlahes( CPF, Placa: string);
begin
  FormPrincipal.ActClientes.Execute;
  with FormClientesDetalhes do
  begin
     srcPesquisa.DataSet := Controller.GetDataset(Entidade,'CPFCNPJ='+quotedstr(CPF) , Campos);
     tabPrincipal.ActivePageIndex := 1;
     tabDetalhes.ActivePageIndex := 0;
  end;
end;

procedure TFormPrincipal.Fluxodecaixa1Click(Sender: TObject);
begin
  Application.CreateForm(TFormRelMovimentacaoCaixaFinanceiro,
                          FormRelMovimentacaoCaixaFinanceiro);
  with FormRelMovimentacaoCaixaFinanceiro do
  begin
    Application.CreateForm(TFormFiltroFluxoCaixa, FormFiltroFluxoCaixa);
    if FormFiltroFluxoCaixa.ShowModal <> mrCancel then
    begin
      DataInicial := FormFiltroFluxoCaixa.dateInicio.date;
      DataFinal   := FormFiltroFluxoCaixa.dateFim.date;
      if FormFiltroFluxoCaixa.cboCodigoCaixa.KeyValue <> null then
      CodigoCaixa := string(FormFiltroFluxoCaixa.cboCodigoCaixa.KeyValue);
      Consultar;
      QuickRep1.PreviewModal;
      Free;
    end;
  end;
  FormFiltroFluxoCaixa.free;
end;

procedure TFormPrincipal.Fluxodecaixa2Click(Sender: TObject);
begin
  Application.CreateForm(TFormRelFluxoCaixa, FormRelFluxoCaixa);
  with FormRelFluxoCaixa do
  begin
    Application.CreateForm(TFormFiltroFluxoCaixa, FormFiltroFluxoCaixa);
    FormFiltroFluxoCaixa.ShowModal;

    if FormFiltroFluxoCaixa.ShowModal <> mrCancel then
    begin
      DataInicial := FormFiltroFluxoCaixa.dateInicio.date;
      DataFinal   := FormFiltroFluxoCaixa.dateFim.date;
      if FormFiltroFluxoCaixa.cboCodigoCaixa.KeyValue <> null then
         CodigoCaixa := string(FormFiltroFluxoCaixa.cboCodigoCaixa.KeyValue);
      Consultar;
      QuickRep1.PreviewModal;
      Free;
    end;
  end;
  FormFiltroFluxoCaixa.free;
end;

procedure TFormPrincipal.FormShow(Sender: TObject);
begin
  Application.CreateForm(TFormLoginAcesso, FormLoginAcesso);
  FormLoginAcesso.ShowModal;
end;

procedure TFormPrincipal.Log1Click(Sender: TObject);
begin
    Application.CreateForm(TFormLogListagem, FormLogListagem);
    FormLogListagem.showmodal;
end;

procedure TFormPrincipal.ActFaseProcessoExecute(Sender: TObject);
begin
   application.CreateForm(TFormFaseProcessoDetalhes,FormFaseProcessoDetalhes);
   FormFaseProcessoDetalhes.Showmodal;
end;

procedure TFormPrincipal.ActFormaPagamentosExecute(Sender: TObject);
begin
   application.CreateForm(TFormFormaPagamentoDetalhes,FormFormaPagamentoDetalhes);
   FormFormaPagamentoDetalhes.Show;
end;

procedure TFormPrincipal.ActFornecedoresExecute(Sender: TObject);
begin
   application.CreateForm(TFormFornecedoresDetalhes,FormFornecedoresDetalhes);
   FormFornecedoresDetalhes.Show;
end;

procedure TFormPrincipal.ActFuncionariosExecute(Sender: TObject);
begin
   application.CreateForm(TFormFuncionariosDetalhes,FormFuncionariosDetalhes);
   FormFuncionariosDetalhes.Show;
end;

procedure TFormPrincipal.ActObjetoProcessoExecute(Sender: TObject);
begin
  application.CreateForm(TFormObjetoProcessoDetalhes,FormObjetoProcessoDetalhes);
   FormObjetoProcessoDetalhes.Show;
end;

procedure TFormPrincipal.ActPagamentosExecute(Sender: TObject);
begin
   application.CreateForm(TFormPagamentoDetalhes,FormPagamentoDetalhes);
   FormPagamentoDetalhes.Show;
end;

procedure TFormPrincipal.ActRecebimentosExecute(Sender: TObject);
begin
   application.CreateForm(TFormRecebimentoDetalhes,FormRecebimentoDetalhes);
   FormRecebimentoDetalhes.Show;
end;

procedure TFormPrincipal.ActResultadoExecute(Sender: TObject);
begin
   application.CreateForm(TFormResultadoProcessoDetalhes,FormResultadoProcessoDetalhes);
   FormResultadoProcessoDetalhes.Showmodal;
end;

procedure TFormPrincipal.ActTipoAcaoExecute(Sender: TObject);
begin
   application.CreateForm(TFormTipoAcaoProcessoDetalhes,FormTipoAcaoProcessoDetalhes);
   FormTipoAcaoProcessoDetalhes.Showmodal;
end;

procedure TFormPrincipal.MenuItem6Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TFormPrincipal.Processo1Click(Sender: TObject);
begin
  application.CreateForm(TFormProcessoDetalhes,FormProcessoDetalhes);
   FormProcessoDetalhes.Show;
end;

end.
