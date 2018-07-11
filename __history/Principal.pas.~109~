unit Principal;

interface

uses
  SysUtils, Types, System.UITypes, System.Classes, System.Variants, DBClient,
  Graphics, Controls, Forms, Dialogs, StdCtrls, DB ,Menus, VCL.ActnList,
  EntidadeFactory, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.CategoryButtons,
  Vcl.Imaging.jpeg, Vcl.AppEvnts, System.Actions, Windows;

type
  TFormPrincipal = class(TForm)
    ActionList1: TActionList;
    ActFuncionarios: TAction;
    ActClientes: TAction;
    ActProdutos: TAction;
    ActOrcamento: TAction;
    ActParametros: TAction;
    ActMarcas: TAction;
    ActModelos: TAction;
    ActFormaPagamentos: TAction;
    ActFamilia: TAction;
    ActGrupoProduto: TAction;
    ActSubGrupoProduto: TAction;
    ActOrcamentoPesquisa: TAction;
    CategoryButtons1: TCategoryButtons;
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Funcionarios1: TMenuItem;
    Clientes1: TMenuItem;
    N2: TMenuItem;
    Produtos1: TMenuItem;
    abelas1: TMenuItem;
    Marcas1: TMenuItem;
    Modelos1: TMenuItem;
    FormadePagamento1: TMenuItem;
    ParametrosPrecoVenda1: TMenuItem;
    Familia1: TMenuItem;
    Oramento1: TMenuItem;
    GrupodeProduto1: TMenuItem;
    SubGrupodeProduto1: TMenuItem;
    Oramentopesquisa1: TMenuItem;
    Fornecedor1: TMenuItem;
    ActClassificacaoCliente: TAction;
    ActFornecedores: TAction;
    ActEntrada: TAction;
    Suprimentos1: TMenuItem;
    Entradas1: TMenuItem;
    ActSaida: TAction;
    ActSaida1: TMenuItem;
    Financeiro1: TMenuItem;
    Pagamentos1: TMenuItem;
    Recebecimentos1: TMenuItem;
    ActPagamentos: TAction;
    ActRecebimentos: TAction;
    ActCategorias: TAction;
    ActCaixa: TAction;
    ActCaixa1: TMenuItem;
    ActCategorias1: TMenuItem;
    Log1: TMenuItem;
    Fluxodecaixa1: TMenuItem;
    ActCaixaFinanceiro: TAction;
    CaixaFinanceiro1: TMenuItem;
    L1: TMenuItem;
    Fluxodecaixa2: TMenuItem;
    Movimentao1: TMenuItem;
    Compras1: TMenuItem;
    Pedidosdecompr1: TMenuItem;
    Segurana1: TMenuItem;
    Acessos1: TMenuItem;
    ActPedido: TAction;
    Empresa1: TMenuItem;
    ActEmpresa: TAction;
    N1: TMenuItem;
    ActCargo: TAction;
    ActCentroCusto: TAction;
    ActTabelaNCM: TAction;
    N3: TMenuItem;
    ActTabelaNFSe: TAction;
    Balanocontbil2: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    ActUnidadeMedida: TAction;
    Indicadores1: TMenuItem;
    SequenciaNF1: TMenuItem;
    Parametros1: TMenuItem;
    ActParametrosSistema: TAction;
    Image2: TImage;
    ActTabelaPreco: TAction;
    procedure ActFuncionariosExecute(Sender: TObject);
    procedure ActProdutosExecute(Sender: TObject);
    procedure ActClientesExecute(Sender: TObject);
    procedure ActOrcamentoExecute(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure ActParametrosExecute(Sender: TObject);
    procedure ActMarcasExecute(Sender: TObject);
    procedure ActModelosExecute(Sender: TObject);
    procedure ActFormaPagamentosExecute(Sender: TObject);
    procedure ActFamiliaExecute(Sender: TObject);
    procedure ActGrupoProdutoExecute(Sender: TObject);
    procedure ActSubGrupoProdutoExecute(Sender: TObject);
    procedure ActOrcamentoPesquisaExecute(Sender: TObject);
    procedure ActClassificacaoClienteExecute(Sender: TObject);
    procedure ActFornecedoresExecute(Sender: TObject);
    procedure ActEntradaExecute(Sender: TObject);
    procedure ActSaidaExecute(Sender: TObject);
    procedure ActPagamentosExecute(Sender: TObject);
    procedure ActRecebimentosExecute(Sender: TObject);
    procedure ActCategoriasExecute(Sender: TObject);
    procedure ActCaixaExecute(Sender: TObject);
    procedure Log1Click(Sender: TObject);
    procedure Fluxodecaixa1Click(Sender: TObject);
    procedure ActCaixaFinanceiroExecute(Sender: TObject);
    procedure Fluxodecaixa2Click(Sender: TObject);
    procedure ActPedidoExecute(Sender: TObject);
    procedure Acessos1Click(Sender: TObject);
    procedure ActEmpresaExecute(Sender: TObject);
    procedure ActCargoExecute(Sender: TObject);
    procedure ActCentroCustoExecute(Sender: TObject);
    procedure ActTabelaNCMExecute(Sender: TObject);
    procedure ActTabelaNFSeExecute(Sender: TObject);
    procedure Balanocontbil2Click(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure ActUnidadeMedidaExecute(Sender: TObject);
    procedure Indicadores1Click(Sender: TObject);
    procedure SequenciaNF1Click(Sender: TObject);
    procedure ActParametrosSistemaExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActTabelaPrecoExecute(Sender: TObject);
    procedure CategoryButtons1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure CategoryButtons1MouseLeave(Sender: TObject);
  private
    { Private declarations }
     FormList: TStringList;
     function SetScreenResolution(Width, Height: integer): Longint;
  public
    { Public declarations }
    Login: string;
    CodigoPessoa: string;
    procedure AjustaForm(Form:TForm);
    procedure UnRegisterForm(ClassFormName: string);
    function ShowForm( FormClass:TFormClass;
                       Action:TAction;
                       Modal:boolean = false; Showing:boolean = true):TForm;

    procedure ShowFormClienteDetlahes(CPF: string);
    function ShowComboEditDialgo(TipoEntidade: TTipoEntidade; Titulo: string): string;
    function ShowFuncionariosComboEditDialgo(TipoEntidade: TTipoEntidade;
      Titulo: string): string;
    procedure SelecionarContato(CodigoCliente: string; var CPF, Nome: string);
    procedure ShowRelOrcamento(DataSetOrcamento, DataSetItemOrcamento, DataSetFormaPagamento: TDataSet);
    procedure ShowRelOrcamento2(DataSetOrcamento, DataSetItemOrcamento,
      DataSetFormaPagamento: TDataSet);
    function ShowEntradaListagem: string;
    function ShowSaidaListagem: string;
    procedure ShowRecebimentosListagem(Condicao: string);
    function ShowTabelaPrecoListagem: string;
    procedure ShowProdutosListagem(prsCondicao: string);

    function SelectOrcamento: string;
    procedure SelecionarOrcamentDetalhe(prsOperacao, Codigo: string);
  end;

var
  FormPrincipal: TFormPrincipal;

  Oldwidth:integer;
  OldHeight :integer;
  Auxwidth:integer;
  Auxheight:integer ;

implementation

{$R *.dfm}

uses
  ClientesDetalhes, FuncionariosDetalhes,  ProdutosDetalhes, OrcamentoDetalhes,
  ParametrosPrecoVendaDetalhes, MarcasDetalhes, ModelosDetalhes,
  FormaPagamentoDetalhes,  FamiliaProdutosDetalhes, GrupoProdutosDetalhes,
  SubGrupoProdutosDetalhes, OrcamentoListagem, TemplateComboEditDialog,
  ContatosClientesListagem, RelOrcamento, ClassificacaoDetalhes, Controller,
  FornecedoresDetalhes, EntradaDetalhes, EntradaListagem, SaidaDetalhes,
  SaidaListagem, RecebimentosDetalhes, PagamentoDetalhes,
  CaixaDetalhes, LoginAcesso, Log, LogListagem, FiltroFluxoCaixa,
  CaixaFinanceiroDetalhes, RelMovimentacaoCaixaFinanceiro, RelFluxoCaixa,
  PedidoDetalhes, PedidoListagem, PermissoesAcessos, EmpresaDetalhes,
  ControllerPermissoes, CargoDetalhes, FuncionariosComboboEditDialog,
  CentroCustoDetalhes, RelOrcamento2, TabelaNCMDetalhes, TabelaNFSeDetalhes,
  RelBalancoContabil, GenericDAO, UnidadeMedida, Indicadores,
  ParametrosDetalhes, PlanoContasDetalhes, Sequencias, TabelaPrecoDetalhes,
  TabelaPrecoListagem;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
   FormList:= TStringList.Create;
   AjustaForm(self);
   //EnableMenuItem(GetSystemMenu(handle, False), SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);
end;

procedure TFormPrincipal.UnRegisterForm(ClassFormName: string);
  var
  i:integer;
begin
  i :=  formPrincipal.FormList.IndexOf(  ClassFormName );
  if i > -1 then
    FormList.Delete( i );
end;

function TFormPrincipal.ShowForm( FormClass:TFormClass;
                                   Action:TAction; Modal:boolean = false; Showing:boolean = true):TForm;
var
  Form: Tform;
  i:integer;
begin
  i :=  FormList.IndexOf( FormClass.ClassName );
  if i = -1 then
  begin
    application.CreateForm( FormClass , Form );
    if Modal then
    begin
       if Showing then
       begin
          Form.ShowModal;
       end;
    end
    else
    begin
       FormList.AddObject( FormClass.ClassName ,  Form );
       if Showing then
       begin
          Form.Show;
       end;
    end;
    result := Form;
  end
  else
  begin
    if Modal then
    begin
      if Showing then
      begin
         Form.ShowModal;
      end;
    end
    else
    if Showing then
    begin
       Tform( FormList.Objects[i] ).Show;
    end;
    result := Tform( FormList.Objects[i] );
  end;
end;

procedure TFormPrincipal.Acessos1Click(Sender: TObject);
begin
   TControllerPermissoes.TemPermissao(formPrincipal.CodigoPessoa, '0', '4');
   ShowForm(TFormPermissoes, nil);
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
  ShowForm(TFormPlanoContasDetalhes, ActCategorias, true);
end;

procedure TFormPrincipal.ActCentroCustoExecute(Sender: TObject);
begin
  ShowForm(TFormCentroCustoDetalhes, ActCentroCusto);
end;

procedure TFormPrincipal.ActClassificacaoClienteExecute(Sender: TObject);
begin
   ShowForm(TFormClassificacaoDetalhes, ActClassificacaoCliente);
end;

procedure TFormPrincipal.ActClientesExecute(Sender: TObject);
begin
   ShowForm(TFormClientesDetalhes, ActClientes);
end;

procedure TFormPrincipal.ActEmpresaExecute(Sender: TObject);
begin
   TControllerPermissoes.TemPermissao(formPrincipal.CodigoPessoa, '0', '4');
   ShowForm(TFormEmpresaDetalhes, ActEmpresa);
end;

procedure TFormPrincipal.ActEntradaExecute(Sender: TObject);
begin
  ShowForm(TFormEntradaDetalhes, ActEntrada);
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

procedure TFormPrincipal.SelecionarOrcamentDetalhe(prsOperacao, Codigo: string);
var
  Form:Tform;
begin
  Form:= showForm(TFormOrcamentoDetalhes,nil);
  with TFormOrcamentoDetalhes(Form) do
  begin
     Operacao:= prsOperacao;
     if Operacao = 'Update' then
     begin
        GetOrcamentoPesquisa(Codigo);
        btnAlterar.Click;
     end
     else
     if Operacao = 'Insert' then
        btnInserir.Click
     else
     if Operacao = 'Retornar' then
     begin
        btnInserir.Click;
        GetOrcamentoPesquisa(Codigo);
        RefreshDataSetItemOrcamento('0');
        cboSituacao.ItemIndex:= 6;
        edtCodigo.text:= '';
        dateData.Date:= now;
        lbdatahorainicio.caption:= datetimetostr(now);
     end
     else
     if Codigo <> '' then
        GetOrcamentoPesquisa(Codigo);
  end;
end;

procedure TFormPrincipal.ActOrcamentoPesquisaExecute(Sender: TObject);
begin
  if FormList.IndexOf(  'TFormOrcamentoDetalhes' ) = - 1 then
     showform(TFormOrcamentoListagem,  ActOrcamento)
  else
     ShowForm(TFormOrcamentoDetalhes, ActOrcamento )
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

function TFormPrincipal.ShowFuncionariosComboEditDialgo(TipoEntidade: TTipoEntidade; Titulo: string): string;
begin
   application.CreateForm(TFormFuncionariosComboboEditDialog,FormFuncionariosComboboEditDialog);

   FormFuncionariosComboboEditDialog.lbEntidade.caption := 'Selecione '+ Titulo;
   FormFuncionariosComboboEditDialog.Caption         := Titulo;
   FormFuncionariosComboboEditDialog.TipoEntidade    := TipoEntidade;

   FormFuncionariosComboboEditDialog.Showmodal;

   result:= FormFuncionariosComboboEditDialog.Codigo;
   FormFuncionariosComboboEditDialog.Free;
end;

function TFormPrincipal.ShowEntradaListagem: string;
begin
  FormEntradaListagem:= TFormEntradaListagem.Create(application);
  FormEntradaListagem.Showmodal;
  result:= FormEntradaListagem.Codigo;
end;

function TFormPrincipal.ShowTabelaPrecoListagem: string;
begin
  FormTabelaPrecoListagem:= TFormTabelaPrecoListagem.Create(application);
  FormTabelaPrecoListagem.Showmodal;
  result:= FormTabelaPrecoListagem.Codigo;
end;

function TFormPrincipal.ShowSaidaListagem: string;
begin
  FormSaidaListagem:= TFormSaidaListagem.Create(application);
  FormSaidaListagem.Showmodal;

  result:= FormSaidaListagem.Codigo;
  FormSaidaListagem.Free;
end;

procedure TFormPrincipal.ShowFormClienteDetlahes( CPF: string);
var
  form: Tform;
begin
  form:= ShowForm( TFormClientesDetalhes , nil );
  with TFormClientesDetalhes( form ) do
  begin
     condicao:= 'CPFCNPJ='+quotedstr(CPF);
     srcPesquisa.DataSet := Controller.GetDataset(Entidade, condicao , Campos);
  end;
end;

procedure TFormPrincipal.ActFamiliaExecute(Sender: TObject);
begin
  ShowForm(TFormFamiliaProdutosDetalhes, ActFamilia);
end;

procedure TFormPrincipal.ActGrupoProdutoExecute(Sender: TObject);
begin
  ShowForm(TFormGrupoProdutosDetalhes, ActGrupoProduto);
end;

procedure TFormPrincipal.ActSaidaExecute(Sender: TObject);
begin
  ShowForm(TFormSaidaDetalhes, ActSaida);
end;

procedure TFormPrincipal.ActSubGrupoProdutoExecute(Sender: TObject);
begin
  ShowForm(TFormSubGrupoProdutosDetalhes, ActSubGrupoProduto);
end;

procedure TFormPrincipal.ActTabelaNCMExecute(Sender: TObject);
begin
  ShowForm(TFormTabelaNCMDetalhes, ActTabelaNCM, true);
end;

procedure TFormPrincipal.ActTabelaNFSeExecute(Sender: TObject);
begin
  ShowForm(TFormTabelaNFSeDetalhes, ActTabelaNFSe, true);
end;

procedure TFormPrincipal.ActTabelaPrecoExecute(Sender: TObject);
begin
  ShowForm(TFormTabelaPrecoDetalhes, ActTabelaPreco );
end;

procedure TFormPrincipal.ActUnidadeMedidaExecute(Sender: TObject);
begin
  //ShowForm(TFormUnidadeDetalhes, ActUnidadeMedida, true);
end;

procedure TFormPrincipal.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
  TGenericDAO.RegistrarLog(CodigoPessoa, '', E.Message, 'Aviso', '');
end;

procedure TFormPrincipal.Balanocontbil2Click(Sender: TObject);
begin
  application.CreateForm(TFormRelBalancoContabil,FormRelBalancoContabil );
  FormRelBalancoContabil.QuickRep1.PreviewModal;
  FormRelBalancoContabil.FreeOnRelease;
end;

procedure TFormPrincipal.CategoryButtons1MouseLeave(Sender: TObject);
begin
 CategoryButtons1.Width:= 33;
end;

procedure TFormPrincipal.CategoryButtons1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
 CategoryButtons1.Width:= 225;
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
var
 form:TForm;
begin
  form:= ShowForm(TFormLoginAcesso, nil, true );
  form.Free;
end;

procedure TFormPrincipal.Indicadores1Click(Sender: TObject);
begin
   ShowForm(TFormIndicadores, nil, false );
end;

procedure TFormPrincipal.Log1Click(Sender: TObject);
begin
  // ShowForm(TFormLogListagem, nil, true );
end;

procedure TFormPrincipal.ActFormaPagamentosExecute(Sender: TObject);
begin
  ShowForm(TFormFormaPagamentoDetalhes, ActFormaPagamentos, true );
end;

procedure TFormPrincipal.ActFornecedoresExecute(Sender: TObject);
begin
  ShowForm(TFormFornecedoresDetalhes, ActFornecedores , true );
end;

procedure TFormPrincipal.ActFuncionariosExecute(Sender: TObject);
begin
   ShowForm(TFormFuncionariosDetalhes, ActFuncionarios );
end;

procedure TFormPrincipal.ActMarcasExecute(Sender: TObject);
begin
   ShowForm(TFormMarcasDetalhes, ActMarcas );
end;

procedure TFormPrincipal.ActModelosExecute(Sender: TObject);
begin
   ShowForm(TFormModelosDetalhes, ActModelos, true );
end;

procedure TFormPrincipal.ActOrcamentoExecute(Sender: TObject);
begin

   ShowForm(TFormOrcamentoDetalhes, ActOrcamento );
end;

procedure TFormPrincipal.ActPagamentosExecute(Sender: TObject);
begin
   ShowForm(TFormPagamentoDetalhes, ActPagamentos );
end;

procedure TFormPrincipal.ActParametrosExecute(Sender: TObject);
begin
   ShowForm(TFormParametrosPrecoVendaDetalhes, ActParametros );
end;

procedure TFormPrincipal.ActParametrosSistemaExecute(Sender: TObject);
begin
    ShowForm(TFormParametrosDetalhes, ActParametrosSistema );
end;

procedure TFormPrincipal.ActPedidoExecute(Sender: TObject);
begin
   ShowForm(TFormPedidoDetalhes, ActPedido );
end;

procedure TFormPrincipal.ActProdutosExecute(Sender: TObject);
begin
   ShowForm(TFormProdutosDetalhes, ActProdutos );
end;

procedure TFormPrincipal.ActRecebimentosExecute(Sender: TObject);
begin
   ShowForm(TFormRecebimentoDetalhes, ActRecebimentos );
end;

procedure TFormPrincipal.MenuItem6Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TFormPrincipal.ShowRecebimentosListagem(Condicao: string);
var
  Form:TForm;
begin
   Form:= Showform( TFormRecebimentoDetalhes, nil);
   with TFormRecebimentoDetalhes(Form) do
   begin
     Condicao:= Condicao;
     RefreshDataSet;
   end;
end;

procedure  TFormPrincipal.ShowRelOrcamento(DataSetOrcamento,DataSetItemOrcamento,DataSetFormaPagamento: TDataSet);
begin
   application.CreateForm(TFormRelOrcamento,FormRelOrcamento);
   FormRelOrcamento.cdsOrcamento.CloneCursor( TClientDataset(DataSetOrcamento),true );
   FormRelOrcamento.cdsItens.CloneCursor(  TClientDataset(DataSetItemOrcamento),true );
   FormRelOrcamento.cdsFormaPagamento.CloneCursor(  TClientDataset(DataSetFormaPagamento),true);
   FormRelOrcamento.QRCompositeReport1.Preview;
   FormRelOrcamento.Free;
end;

procedure  TFormPrincipal.ShowRelOrcamento2(DataSetOrcamento,DataSetItemOrcamento,DataSetFormaPagamento: TDataSet);
begin
   application.CreateForm(TFormRelOrcamento2,FormRelOrcamento2);

   FormRelOrcamento2.cdsOrcamento.Data:=TClientDataset(DataSetOrcamento).Data;
   FormRelOrcamento2.cdsItens.Data :=   TClientDataset(DataSetItemOrcamento).Data;

   FormRelOrcamento2.cdsItens.mastersource    := FormRelOrcamento2.srcOrcamento;
   FormRelOrcamento2.cdsItens.IndexFieldNames := 'CodigoOrcamento';
   FormRelOrcamento2.cdsItens.masterFields    := 'Codigo';

   FormRelOrcamento2.cdsRecebimento.mastersource    := FormRelOrcamento2.srcOrcamento;
   FormRelOrcamento2.cdsRecebimento.IndexFieldNames := 'CodigoOrcamento';
   FormRelOrcamento2.cdsRecebimento.masterFields    := 'Codigo';

   FormRelOrcamento2.cdsRecebimento.Data :=  TClientDataset(DataSetFormaPagamento).Data;

   FormRelOrcamento2.QRCompositeReport1.preview;
end;

function TFormPrincipal.SelectOrcamento:string;
begin
  if FormOrcamentoListagem = nil then
     FormOrcamentoListagem:= TFormOrcamentoListagem.Create(self);

  //if not FormOrcamentoListagem.Showing then
  FormOrcamentoListagem.Showmodal;

  result:= FormOrcamentoListagem.Codigo;
  //FormOrcamentoListagem.Free;
end;

procedure TFormPrincipal.SequenciaNF1Click(Sender: TObject);
begin
    ShowForm(TFormSequencias, nil, false );
end;

procedure TFormPrincipal.ShowProdutosListagem(prsCondicao: string);
var
  Form: TForm;
begin
   Form := Showform( TFormProdutosDetalhes , nil );
   with TFormProdutosDetalhes(Form) do
   begin
      Condicao:= prsCondicao;
      RefreshDataSet;
   end;
end;

function TFormPrincipal.SetScreenResolution(Width, Height: integer): Longint;
var
DeviceMode: TDeviceMode;
begin
{
  with DeviceMode do begin
    dmSize := SizeOf(TDeviceMode);
    dmPelsWidth := Width;
    dmPelsHeight := Height;
    dmFields := DM_PELSWIDTH or DM_PELSHEIGHT;
  end;
  Result := ChangeDisplaySettings(DeviceMode, CDS_UPDATEREGISTRY);
  }
end;


procedure TFormPrincipal.AjustaForm(Form:TForm);
Const
nTamOriginal = 1280; // Será o 100% da escala
Var
nEscala : Double; // Vai me dar o percentual de Transformação escalar
nPorcento : Integer; // Vai me dar em percentual inteiro o valor
begin
  {  With Form do
    begin
    if nTamOriginal <> Screen.Width then
      begin
        nEscala := ((Screen.Width-nTamOriginal)/nTamOriginal);
        nPorcento := Round((nEscala*100) + 100);
        Form.Width := Round(Form.Width * (nEscala+1));
        Form.Height := Round(Form.Height * (nEscala+1));
        Form.ScaleBy(nPorcento,100);
      end;
    end; }
end;

//initialization
//ReportMemoryLeaksOnShutdown := true;

end.
