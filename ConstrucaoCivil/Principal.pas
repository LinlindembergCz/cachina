unit Principal;

interface

uses
  Windows, SysUtils, Types, System.UITypes, System.Classes, System.Variants, DBClient,
  Graphics, Controls, Forms, Dialogs, StdCtrls, DB ,Menus, VCL.ActnList,
  EntidadeFactory, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.CategoryButtons, WinTypes, WinProcs,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, Vcl.DBCtrls, Vcl.DBCGrids;

type
  TFormPrincipal = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    ActionList1: TActionList;
    ActFuncionarios: TAction;
    ActClientes: TAction;
    ActFornecedores: TAction;
    ActProdutos: TAction;
    ActOrcamento: TAction;
    ActOrcamentoPesquisa: TAction;
    ActParametros: TAction;
    ActMarcas: TAction;
    ActModelos: TAction;
    ActFormaPagamentos: TAction;
    ActFamilia: TAction;
    ActGrupoProduto: TAction;
    ActSubGrupoProduto: TAction;
    ActClassificacaoCliente: TAction;
    ActEntrada: TAction;
    ActSaida: TAction;
    ActPagamentos: TAction;
    ActRecebimentos: TAction;
    ActCategorias: TAction;
    ActCaixa: TAction;
    ActCaixaFinanceiro: TAction;
    ActPedido: TAction;
    ActEmpresa: TAction;
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Empresa1: TMenuItem;
    Funcionarios1: TMenuItem;
    Fornecedor1: TMenuItem;
    Clientes1: TMenuItem;
    abelas1: TMenuItem;
    Marcas1: TMenuItem;
    Modelos1: TMenuItem;
    Familia1: TMenuItem;
    GrupodeProduto1: TMenuItem;
    SubGrupodeProduto1: TMenuItem;
    FormadePagamento1: TMenuItem;
    ParametrosPrecoVenda1: TMenuItem;
    N2: TMenuItem;
    Oramento1: TMenuItem;
    Oficina1: TMenuItem;
    Oramento2: TMenuItem;
    Oramentopesquisa1: TMenuItem;
    Suprimentos1: TMenuItem;
    Compras1: TMenuItem;
    Pedidosdecompr1: TMenuItem;
    Movimentao1: TMenuItem;
    Entradas1: TMenuItem;
    ActSaida1: TMenuItem;
    Financeiro1: TMenuItem;
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
    Etapas1: TMenuItem;
    ActEtapa: TAction;
    ActFase: TAction;
    ActSubFase: TAction;
    Fases1: TMenuItem;
    SubFase1: TMenuItem;
    Equipes1: TMenuItem;
    ActEquipes: TAction;
    ActCargo: TAction;
    Obra1: TMenuItem;
    DiriodeObra1: TMenuItem;
    ActDiarioAtividade: TAction;
    actSituacao: TAction;
    actTipo: TAction;
    ActImoveis: TAction;
    actClassificacao: TAction;
    Obra2: TMenuItem;
    ActUnidadeImovel: TAction;
    ProdutosServios1: TMenuItem;
    ActQuantitativo: TAction;
    Quantitativos1: TMenuItem;
    N1: TMenuItem;
    ActProjeto: TAction;
    Projetos1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Mapadaobra1: TMenuItem;
    Image2: TImage;
    ActCentroCusto: TAction;
    procedure ActFuncionariosExecute(Sender: TObject);
    procedure ActProdutosExecute(Sender: TObject);
    procedure ActClientesExecute(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure ActParametrosExecute(Sender: TObject);
    procedure ActFormaPagamentosExecute(Sender: TObject);
    procedure ActFamiliaExecute(Sender: TObject);
    procedure ActGrupoProdutoExecute(Sender: TObject);
    procedure ActSubGrupoProdutoExecute(Sender: TObject);
    procedure ActClassificacaoClienteExecute(Sender: TObject);
    procedure ActFornecedoresExecute(Sender: TObject);
    procedure ActEntradaExecute(Sender: TObject);
    procedure ActSaidaExecute(Sender: TObject);
    procedure ActPagamentosExecute(Sender: TObject);
    procedure ActRecebimentosExecute(Sender: TObject);
    procedure ActCategoriasExecute(Sender: TObject);
    procedure ActCaixaExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Log1Click(Sender: TObject);
    procedure Fluxodecaixa1Click(Sender: TObject);
    procedure ActCaixaFinanceiroExecute(Sender: TObject);
    procedure Fluxodecaixa2Click(Sender: TObject);
    procedure ActPedidoExecute(Sender: TObject);
    procedure Acessos1Click(Sender: TObject);
    procedure ActEmpresaExecute(Sender: TObject);
    procedure ActEtapaExecute(Sender: TObject);
    procedure ActFaseExecute(Sender: TObject);
    procedure ActSubFaseExecute(Sender: TObject);
    procedure ActEquipesExecute(Sender: TObject);
    procedure ActCargoExecute(Sender: TObject);
    procedure ActDiarioAtividadeExecute(Sender: TObject);
    procedure actSituacaoExecute(Sender: TObject);
    procedure actTipoExecute(Sender: TObject);
    procedure ActImoveisExecute(Sender: TObject);
    procedure actClassificacaoExecute(Sender: TObject);
    procedure ActUnidadeImovelExecute(Sender: TObject);
    procedure ActQuantitativoExecute(Sender: TObject);
    procedure ActProjetoExecute(Sender: TObject);
    procedure Mapadaobra1Click(Sender: TObject);
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
    procedure ShowRelOrcamento(DataSetOrcamento, DataSetItemOrcamento, DataSetFormaPagamento: TDataSet);
    function ShowEntradaListagem: string;
    function ShowSaidaListagem: string;
    procedure ShowUnidadeImovel(Codigo: string);
    function SelectOrcamento: string;
    procedure ShowForm(FormClass: TFormClass; Action: TAction; Modal: boolean  = false);
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses
  ClientesDetalhes, FuncionariosDetalhes, ParametrosPrecoVendaDetalhes,
  FormaPagamentoDetalhes,  FamiliaProdutosDetalhes, GrupoProdutosDetalhes,
  SubGrupoProdutosDetalhes,  TemplateComboEditDialog,
  ContatosClientesListagem, ClassificacaoDetalhes, Controller,
  FornecedoresDetalhes, EntradaDetalhes, EntradaListagem, SaidaDetalhes,
  SaidaListagem, RecebimentosDetalhes, PagamentoDetalhes, CategoriasDetalhes,
  CaixaDetalhes, LoginAcesso, Log, LogListagem, FiltroFluxoCaixa,
  CaixaFinanceiroDetalhes, RelMovimentacaoCaixaFinanceiro, RelFluxoCaixa,
  PedidoDetalhes, PedidoListagem, PermissoesAcessos, EmpresaDetalhes,
  ConstrutoraProdutosDetalhes, EtapaFase, FaseDetalhes, SubFaseDetalhes,
  EtapaDetalhes, EquipeDetalhes, CargoDetalhes, DiarioAtvidadeDetalhes,
  ImovelDetalhes, ImovelClassificacaoDetalhes, ImovelTipoDetalhes,
  ImovelSituacaoDetalhes, ImovelUnidadeDetalhes, QuantitativoDetalhes,
  ProjetoDetalhes, Messages, DBCtrlGridNew, MapaObraAgora;


procedure TFormPrincipal.Acessos1Click(Sender: TObject);
begin
   Application.CreateForm(TFormPermissoes, FormPermissoes);
   FormPermissoes.showmodal;
   FormPermissoes.Free;
end;

procedure TFormPrincipal.ActCaixaExecute(Sender: TObject);
begin
   ShowForm(TFormCaixaDetalhes, ActCaixa);

end;

procedure TFormPrincipal.ActCaixaFinanceiroExecute(Sender: TObject);
begin
  ShowForm(TFormCaixaFinanceiroDetalhes, ActCaixaFinanceiro);
end;

procedure TFormPrincipal.ActCargoExecute(Sender: TObject);
begin
    ShowForm(TFormCargoDetalhes, ActCargo);
end;

procedure TFormPrincipal.ActCategoriasExecute(Sender: TObject);
begin
  ShowForm(TFormCategoriasDetalhes, ActCategorias);
end;

procedure TFormPrincipal.ActClassificacaoClienteExecute(Sender: TObject);
begin
  ShowForm(TFormClassificacaoDetalhes, ActClassificacaoCliente);
end;

procedure TFormPrincipal.actClassificacaoExecute(Sender: TObject);
begin
   ShowForm(TFormImovelClassificacaoDetalhes, actClassificacao);
end;

procedure TFormPrincipal.ActClientesExecute(Sender: TObject);
begin
   ShowForm(TFormClientesDetalhes, ActClientes);
end;

procedure TFormPrincipal.ActDiarioAtividadeExecute(Sender: TObject);
begin
   ShowForm(TFormDiarioAtividadeDetalhes, ActDiarioAtividade);
end;

procedure TFormPrincipal.ActEmpresaExecute(Sender: TObject);
begin
   ShowForm(TFormEmpresaDetalhes, ActEmpresa);
end;

procedure TFormPrincipal.ActEntradaExecute(Sender: TObject);
begin
   ShowForm(TFormEntradaDetalhes, ActEntrada);
end;

procedure TFormPrincipal.ActEquipesExecute(Sender: TObject);
begin
   ShowForm(TFormEquipeDetalhes, ActEquipes);
end;

procedure TFormPrincipal.ActEtapaExecute(Sender: TObject);
begin
   ShowForm(TFormEtapaDetalhes, ActEtapa);
end;

procedure TFormPrincipal.ActFaseExecute(Sender: TObject);
begin
   ShowForm(TFormFaseDetalhes, ActFase);
end;

procedure TFormPrincipal.ActSubFaseExecute(Sender: TObject);
begin
   ShowForm(TFormSubFaseDetalhes, ActSubFase);
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

function TFormPrincipal.ShowEntradaListagem: string;
begin
  FormEntradaListagem:= TFormEntradaListagem.Create(application);
  FormEntradaListagem.Showmodal;

  result:= FormEntradaListagem.Codigo;
  FormEntradaListagem.Free;
end;

function TFormPrincipal.ShowSaidaListagem: string;
begin
  FormSaidaListagem:= TFormSaidaListagem.Create(application);
  FormSaidaListagem.Showmodal;

  result:= FormSaidaListagem.Codigo;
  FormSaidaListagem.Free;
end;

procedure TFormPrincipal.ShowFormClienteDetlahes( CPF, Placa: string);
begin
  FormPrincipal.ActClientes.Execute;
  with FormClientesDetalhes do
  begin
     srcPesquisa.DataSet := Controller.GetDataset(Entidade,'CPFCNPJ='+quotedstr(CPF) , Campos);
     {
     if srcPesquisa.DataSet.IsEmpty then
     begin
        Inserir;
        edtCPFCNPJ.text := CPF;
        tabDetalhes.TabIndex:= 0;
     end
     else
     begin
        Alterar;
        if Placa <> '' then
           tabDetalhes.TabIndex:= 3;
     end;
     edtPlaca.text   := Placa;
     }
     tabPrincipal.ActivePageIndex := 1;
     tabDetalhes.ActivePageIndex := 0;
  end;
end;

procedure TFormPrincipal.ActFamiliaExecute(Sender: TObject);
begin
   application.CreateForm(TFormFamiliaProdutosDetalhes,FormFamiliaProdutosDetalhes);
   FormFamiliaProdutosDetalhes.Show;
end;



procedure TFormPrincipal.ActGrupoProdutoExecute(Sender: TObject);
begin
   application.CreateForm(TFormGrupoProdutosDetalhes,FormGrupoProdutosDetalhes);
   FormGrupoProdutosDetalhes.Show;
end;

procedure TFormPrincipal.ActImoveisExecute(Sender: TObject);
begin
    Application.CreateForm(TFormImoveisDetalhes, FormImoveisDetalhes);
   FormImoveisDetalhes.show;
end;

procedure TFormPrincipal.ActSaidaExecute(Sender: TObject);
begin
   application.CreateForm(TFormSaidaDetalhes,FormSaidaDetalhes);
   FormSaidaDetalhes.Show;
end;


procedure TFormPrincipal.actSituacaoExecute(Sender: TObject);
begin
  Application.CreateForm(TFormImovelSituacaoDetalhes, FormImovelSituacaoDetalhes);
  FormImovelSituacaoDetalhes.showmodal;
end;

procedure TFormPrincipal.ActSubGrupoProdutoExecute(Sender: TObject);
begin
   application.CreateForm(TFormSubGrupoProdutosDetalhes,FormSubGrupoProdutosDetalhes);
   FormSubGrupoProdutosDetalhes.Show;
end;

procedure TFormPrincipal.actTipoExecute(Sender: TObject);
begin
      Application.CreateForm(TFormImovelTipoDetalhes, FormImovelTipoDetalhes);
    FormImovelTipoDetalhes.showmodal;
end;

procedure TFormPrincipal.ActUnidadeImovelExecute(Sender: TObject);
begin
   Application.CreateForm(TFormUnidadeImovelDetalhes, FormUnidadeImovelDetalhes);
   FormUnidadeImovelDetalhes.showmodal;
end;

procedure TFormPrincipal.ShowUnidadeImovel(Codigo: string);
begin
   Application.CreateForm(TFormUnidadeImovelDetalhes, FormUnidadeImovelDetalhes);
   FormUnidadeImovelDetalhes.CodigoImovel:= Codigo;
   FormUnidadeImovelDetalhes.showmodal;
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
  ShowForm(TFormLoginAcesso, nil, true);
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

procedure TFormPrincipal.ActPagamentosExecute(Sender: TObject);
begin
   application.CreateForm(TFormPagamentoDetalhes,FormPagamentoDetalhes);
   FormPagamentoDetalhes.Show;
end;

procedure TFormPrincipal.ActParametrosExecute(Sender: TObject);
begin
   application.CreateForm(TFormParametrosPrecoVendaDetalhes,FormParametrosPrecoVendaDetalhes);
   FormParametrosPrecoVendaDetalhes.Show;
end;

procedure TFormPrincipal.ActPedidoExecute(Sender: TObject);
begin
   application.CreateForm(TFormPedidoDetalhes,FormPedidoDetalhes);
   FormPedidoDetalhes.Show;
end;

procedure TFormPrincipal.ActProdutosExecute(Sender: TObject);
begin
   application.CreateForm(TFormConstrutoraProdutosDetalhes,FormConstrutoraProdutosDetalhes);
   FormConstrutoraProdutosDetalhes.Show;
end;

procedure TFormPrincipal.ActProjetoExecute(Sender: TObject);
begin
  ShowForm(TFormProjetoDetalhes, nil, true);
end;

procedure TFormPrincipal.ActQuantitativoExecute(Sender: TObject);
begin
    ShowForm(TFormQuantitativoDetalhes, nil, true);
end;

procedure TFormPrincipal.ActRecebimentosExecute(Sender: TObject);
begin
   application.CreateForm(TFormRecebimentoDetalhes,FormRecebimentoDetalhes);
   FormRecebimentoDetalhes.Show;
end;

procedure TFormPrincipal.Mapadaobra1Click(Sender: TObject);
begin
  ShowForm(TFormMapaDaObra, nil, false);
end;

procedure TFormPrincipal.MenuItem6Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure  TFormPrincipal.ShowRelOrcamento(DataSetOrcamento,
                                           DataSetItemOrcamento,
                                           DataSetFormaPagamento: TDataSet);
begin

end;

function TFormPrincipal.SelectOrcamento:string;
begin

end;

procedure TFormPrincipal.ShowForm(FormClass:TFormClass; Action:TAction; Modal:boolean = false);
var
  Form:Tform;
begin
   {TControllerPermissoes.TemPermissao(formPrincipal.CodigoPessoa,
                                      inttostr(Action.tag),
                                      '4'); }
   application.CreateForm( FormClass, Form );
   if Modal then
      Form.showmodal
   else
      Form.Show;
end;


end.
