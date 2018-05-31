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
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Empresa1: TMenuItem;
    Funcionarios1: TMenuItem;
    Fornecedor1: TMenuItem;
    Clientes1: TMenuItem;
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
    Segurana1: TMenuItem;
    Log1: TMenuItem;
    Acessos1: TMenuItem;
    Imoveis1: TMenuItem;
    ActImovel: TAction;
    ActTipo: TAction;
    ActSituacao: TAction;
    ActClassificacao: TAction;
    ActImovel1: TMenuItem;
    ActTipo1: TMenuItem;
    ActSituacao1: TMenuItem;
    ActClassificacao1: TMenuItem;

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
    procedure ActImovelExecute(Sender: TObject);
    procedure ActTipoExecute(Sender: TObject);
    procedure ActSituacaoExecute(Sender: TObject);
    procedure ActClassificacaoExecute(Sender: TObject);
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
  TemplateComboEditDialog,
  ClassificacaoDetalhes, Controller,  FornecedoresDetalhes,
  RecebimentosDetalhes, PagamentoDetalhes, CategoriasDetalhes,
  CaixaDetalhes, LoginAcesso, Log,  FiltroFluxoCaixa,
  CaixaFinanceiroDetalhes, RelMovimentacaoCaixaFinanceiro, RelFluxoCaixa,
  PermissoesAcessos, EmpresaDetalhes, LogListagem, ImovelDetalhes,
  ImovelClassificacaoDetalhes, ImovelSituacaoDetalhes, ImovelTipoDetalhes;

procedure TFormPrincipal.Acessos1Click(Sender: TObject);
begin
   Application.CreateForm(TFormPermissoes, FormPermissoes);
   FormPermissoes.showmodal;
   FormPermissoes.Free;
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

procedure TFormPrincipal.ActClassificacaoExecute(Sender: TObject);
begin
  Application.CreateForm(TFormImovelClassificacaoDetalhes, FormImovelClassificacaoDetalhes);
  FormImovelClassificacaoDetalhes.showmodal;
end;

procedure TFormPrincipal.ActClientesExecute(Sender: TObject);
begin
   application.CreateForm(TFormClientesDetalhes,FormClientesDetalhes);
   FormClientesDetalhes.Showmodal;
end;

procedure TFormPrincipal.ActEmpresaExecute(Sender: TObject);
begin
   application.CreateForm(TFormEmpresaDetalhes,FormEmpresaDetalhes);
   FormEmpresaDetalhes.Show;
end;

procedure TFormPrincipal.SelecionarContato(CodigoCliente: string; var CPF,
  Nome: string);
begin

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

procedure TFormPrincipal.ActImovelExecute(Sender: TObject);
begin
   Application.CreateForm(TFormImoveisDetalhes, FormImoveisDetalhes);
   FormImoveisDetalhes.show;
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

procedure TFormPrincipal.ActSituacaoExecute(Sender: TObject);
begin
  Application.CreateForm(TFormImovelSituacaoDetalhes, FormImovelSituacaoDetalhes);
  FormImovelSituacaoDetalhes.showmodal;
end;

procedure TFormPrincipal.ActTipoExecute(Sender: TObject);
begin
       Application.CreateForm(TFormImovelTipoDetalhes, FormImovelTipoDetalhes);
    FormImovelTipoDetalhes.showmodal;
end;

procedure TFormPrincipal.MenuItem6Click(Sender: TObject);
begin
  application.Terminate;
end;

end.
