unit Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, VCL.StdCtrls, VCL.Menus,  VCL.ActnList,
  Vcl.ExtCtrls, Vcl.OleCtrls, SHDocVw, DB, System.Actions;

type
  TFormPrincipal = class(TForm)
    ActionList1: TActionList;
    ActTipoAgendamento: TAction;
    ActPaciente: TAction;
    ActAgendamento: TAction;
    ActConvenio: TAction;
    ActEspecialista: TAction;
    ActPacientePesquisa: TAction;
    MainMenu1: TMainMenu;
    MenuItem7: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem6: TMenuItem;
    ActAgendaPesquisa: TAction;
    ActAgendaRecorrencia: TAction;
    WebBrowser1: TWebBrowser;
    ActFamilia: TAction;
    Actgrupoproduto: TAction;
    ActSubgrupoProduto: TAction;
    Especialista1: TMenuItem;
    Fornecedor1: TMenuItem;
    Suprimentos1: TMenuItem;
    ActFornecedor: TAction;
    ActProdutos: TAction;
    ActEntrada: TAction;
    ActSaida: TAction;
    ActProdutos1: TMenuItem;
    ActEntrada1: TMenuItem;
    ActSaida1: TMenuItem;
    ActFormaPagamentos: TAction;
    ActPagamento: TAction;
    ActRecebimento: TAction;
    ActCategoria: TAction;
    ActCaixa: TAction;
    Financeiro1: TMenuItem;
    ActCategoria1: TMenuItem;
    ActCaixa1: TMenuItem;
    ActPagamento1: TMenuItem;
    ActRecebimento1: TMenuItem;
    ActEstabelecimento: TAction;
    Estabelecimento1: TMenuItem;
    ActTabelaCID: TAction;
    ActFornecedores: TAction;
    ActCategorias: TAction;
    ActCentroCusto: TAction;
    ActTabelaNCM: TAction;
    ActTabelaNFSe: TAction;
    procedure MenuItem6Click(Sender: TObject);
    procedure ActPacienteExecute(Sender: TObject);
    procedure ActTipoAgendamentoExecute(Sender: TObject);
    procedure ActAgendamentoExecute(Sender: TObject);
    procedure ActEspecialistaExecute(Sender: TObject);
    procedure ActConvenioExecute(Sender: TObject);
    procedure ActPacientePesquisaExecute(Sender: TObject);
    procedure ActAgendaPesquisaExecute(Sender: TObject);
    procedure ActAgendaRecorrenciaExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActFornecedorExecute(Sender: TObject);
    procedure ActProdutosExecute(Sender: TObject);
    procedure ActEntradaExecute(Sender: TObject);
    procedure ActSaidaExecute(Sender: TObject);
    procedure ActFamiliaExecute(Sender: TObject);
    procedure ActgrupoprodutoExecute(Sender: TObject);
    procedure ActSubgrupoProdutoExecute(Sender: TObject);
    procedure ActFormaPagamentosExecute(Sender: TObject);
    procedure ActRecebimentoExecute(Sender: TObject);
    procedure ActCategoriaExecute(Sender: TObject);
    procedure ActCaixaExecute(Sender: TObject);
    procedure ActPagamentoExecute(Sender: TObject);
    procedure ActEstabelecimentoExecute(Sender: TObject);
    procedure ActTabelaCIDExecute(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
    login: string;
    CodigoPessoa: string;
    function SelecionarPaciente( var CodigoConvenio , NomePaciente, Telefone , CodigoCID: string): string;
    procedure ShowAgendaPesquisa(CodigoEspecialista, Paciente, Mes: string);
    procedure ShowRelFichaTriagem(DataSet:TDataSet);
    function ShowPacientePesquisa: string;
    procedure ShowParcienteDetalhes(Codigo: string);
    function ShowParcienteDetalhesInsert(Nome: string): string;
    function ShowEntradaListagem: string;
    function ShowSaidaListagem: string;
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses AgendamentoDetalhes ,  TipoAgendamentoDetalhes,  ConvenioDetalhes,  EspecialistaDetalhes,
     PacienteDetalhes, PacienteListagem, EspecialistaDetalhes2, AgendaPesquisa,
     AgendaRecorrencia, RelFichaTriagem, ModuloAgenda, RelFichaPaciente,
     EntidadeFactory, ControllerPaciente, EntradaListagem, SaidaListagem,
     FornecedoresDetalhes, ProdutosDetalhes, EntradaDetalhes, SaidaDetalhes,
     FamiliaProdutosDetalhes, FormaPagamentoDetalhes, GrupoProdutosDetalhes,
     SubGrupoProdutosDetalhes, CaixaDetalhes, CategoriasDetalhes,
     PagamentoDetalhes, RecebimentosDetalhes, EstabelecimentoDetalhes,
     TabelaCIDDetalhes, LoginAcesso, AgendamentoMedicoDetalhes;

procedure TFormPrincipal.ActAgendamentoExecute(Sender: TObject);
begin
   application.CreateForm(TFormAgendamentoMedicosDetalhes,FormAgendamentoMedicosDetalhes);
   FormAgendamentoMedicosDetalhes.Show;
end;

procedure TFormPrincipal.ActAgendaPesquisaExecute(Sender: TObject);
begin
   application.CreateForm(TFormAgendamentoPesquisa,FormAgendamentoPesquisa);
   FormAgendamentoPesquisa.Showmodal;
   FormAgendamentoPesquisa.Free;
end;

procedure TFormPrincipal.ActAgendaRecorrenciaExecute(Sender: TObject);
begin
   application.CreateForm(TFormAgendaRecorrencia,FormAgendaRecorrencia);
   FormAgendaRecorrencia.Showmodal;
   FormAgendaRecorrencia.Free;
end;

procedure TFormPrincipal.ShowAgendaPesquisa(CodigoEspecialista, Paciente, Mes: string );
begin
   if FormAgendamentoPesquisa = nil then
      application.CreateForm(TFormAgendamentoPesquisa,FormAgendamentoPesquisa);

   FormAgendamentoPesquisa.CodigoEspecialista:= CodigoEspecialista;
   FormAgendamentoPesquisa.Paciente:= Paciente;
   FormAgendamentoPesquisa.Mes := Mes;

   FormAgendamentoPesquisa.Showmodal;
 //FormAgendamentoPesquisa.Free;
end;



procedure TFormPrincipal.ActConvenioExecute(Sender: TObject);
begin
   application.CreateForm(TFormConvenioDetalhes,FormConvenioDetalhes);
   FormConvenioDetalhes.Show;
end;

procedure TFormPrincipal.ActEntradaExecute(Sender: TObject);
begin
   application.CreateForm(TFormEntradaDetalhes,FormEntradaDetalhes);
   FormEntradaDetalhes.Show;
end;

procedure TFormPrincipal.ActEspecialistaExecute(Sender: TObject);
begin
   application.CreateForm(TFormEspecialistaDetalhes2,FormEspecialistaDetalhes2);
   FormEspecialistaDetalhes2.Show;
end;

procedure TFormPrincipal.ActEstabelecimentoExecute(Sender: TObject);
begin
   application.CreateForm(TFormEstabelecimentoDetalhes,FormEstabelecimentoDetalhes);
   FormEstabelecimentoDetalhes.Show;
end;

procedure TFormPrincipal.ActFamiliaExecute(Sender: TObject);
begin
   application.CreateForm(TFormFamiliaProdutosDetalhes,FormFamiliaProdutosDetalhes);
   FormFamiliaProdutosDetalhes.Show;
end;

procedure TFormPrincipal.ActFormaPagamentosExecute(Sender: TObject);
begin
   application.CreateForm(TFormFormaPagamentoDetalhes,FormFormaPagamentoDetalhes);
   FormFormaPagamentoDetalhes.Show;
end;

procedure TFormPrincipal.ActFornecedorExecute(Sender: TObject);
begin
   application.CreateForm(TFormFornecedoresDetalhes,FormFornecedoresDetalhes);
   FormFornecedoresDetalhes.Show;
end;

procedure TFormPrincipal.ActgrupoprodutoExecute(Sender: TObject);
begin
   application.CreateForm(TFormGrupoProdutosDetalhes,FormGrupoProdutosDetalhes);
   FormGrupoProdutosDetalhes.Show;
end;

procedure TFormPrincipal.ActTabelaCIDExecute(Sender: TObject);
begin
   Application.CreateForm(TFormTabelaCIDDetalhes, FormTabelaCIDDetalhes);
   FormTabelaCIDDetalhes.Showmodal;
end;

procedure TFormPrincipal.ActPacienteExecute(Sender: TObject);
begin
   application.CreateForm(TFormPacienteDetalhes,FormPacienteDetalhes);
   FormPacienteDetalhes.Show;
end;

function TFormPrincipal.SelecionarPaciente(var CodigoConvenio, NomePaciente, Telefone, CodigoCID: string): string;
begin
  application.CreateForm(TFormPacienteListagem,FormPacienteListagem);
  with FormPacienteListagem do
  begin
     edtPesquisa.Text:= NomePaciente;
     btnPesquisar.Click;
     ShowModal;
     if Codigo <> '' then
     begin
       result         := Codigo;
       NomePaciente   := srcEntidade.DataSet.FieldByName('Nome').AsString;
       Telefone       := srcEntidade.DataSet.FieldByName('Telefones').AsString;
       CodigoConvenio := srcEntidade.DataSet.FieldByName('CodigoConvenio').AsString;
       //CodigoCID      := srcEntidade.DataSet.FieldByName('CodigoCID').AsString;
     end;
     Free;
  end;
end;

procedure TFormPrincipal.ShowParcienteDetalhes(Codigo: string);
begin
   application.CreateForm(TFormPacienteDetalhes,FormPacienteDetalhes);
   with FormPacienteDetalhes do
   begin
      srcEntidade.DataSet    :=  Controller.GetSelect(ControllerPaciente.SQLConsultaPaciente,
                               'T1."Codigo" = '+quotedstr(Codigo));
      MapperEntidade.Dataset := srcEntidade.DataSet;
      Alterar;
      ShowModal;
   end;
end;

function TFormPrincipal.ShowParcienteDetalhesInsert(Nome: string): string;
begin
   application.CreateForm(TFormPacienteDetalhes,FormPacienteDetalhes);
   with FormPacienteDetalhes do
   begin
      srcEntidade.DataSet    :=  Controller.GetSelect(ControllerPaciente.SQLConsultaPaciente, '0=1');
      MapperEntidade.Dataset :=  srcEntidade.DataSet;
      Inserir;
      edtNome.text:= Nome;
      ShowModal;
      result:= edtNome.text;
   end;
end;

procedure TFormPrincipal.ActPacientePesquisaExecute(Sender: TObject);
begin
   application.CreateForm(TFormPacienteListagem,FormPacienteListagem);
   FormPacienteListagem.Showmodal;
   FormPacienteListagem.Free;
end;

procedure TFormPrincipal.ActPagamentoExecute(Sender: TObject);
begin
   application.CreateForm(TFormPagamentoDetalhes,FormPagamentoDetalhes);
   FormPagamentoDetalhes.Show;
end;

procedure TFormPrincipal.ActRecebimentoExecute(Sender: TObject);
begin
   application.CreateForm(TFormRecebimentoDetalhes,FormRecebimentoDetalhes);
   FormRecebimentoDetalhes.Show;
end;

procedure TFormPrincipal.ActCaixaExecute(Sender: TObject);
begin
   Application.CreateForm(TFormCaixaDetalhes, FormCaixaDetalhes);
   FormCaixaDetalhes.Show;
end;

procedure TFormPrincipal.ActCategoriaExecute(Sender: TObject);
begin
    Application.CreateForm(TFormCategoriasDetalhes, FormCategoriasDetalhes);
  FormCategoriasDetalhes.Show;
end;

procedure TFormPrincipal.ActProdutosExecute(Sender: TObject);
begin
   application.CreateForm(TFormProdutosDetalhes,FormProdutosDetalhes);
   FormProdutosDetalhes.Show;
end;



procedure TFormPrincipal.ActSaidaExecute(Sender: TObject);
begin
   application.CreateForm(TFormSaidaDetalhes,FormSaidaDetalhes);
   FormSaidaDetalhes.Show;
end;

procedure TFormPrincipal.ActSubgrupoProdutoExecute(Sender: TObject);
begin
   application.CreateForm(TFormSubGrupoProdutosDetalhes,FormSubGrupoProdutosDetalhes);
   FormSubGrupoProdutosDetalhes.Show;
end;

function TFormPrincipal.ShowPacientePesquisa: string;
begin
   application.CreateForm(TFormPacienteListagem,FormPacienteListagem);
   FormPacienteListagem.Showmodal;
   result:= FormPacienteListagem.Codigo;
   FormPacienteListagem.Free;
end;

procedure TFormPrincipal.ActTipoAgendamentoExecute(Sender: TObject);
begin
   application.CreateForm(TFormTipoAgendamentoDetalhes,FormTipoAgendamentoDetalhes);
   FormTipoAgendamentoDetalhes.Show;
end;

procedure TFormPrincipal.FormShow(Sender: TObject);
begin
    Application.CreateForm(TFormLoginAcesso, FormLoginAcesso);
    FormLoginAcesso.ShowModal;
    //WebBrowser1.Navigate('http://www.amil.com.br/portal/home/credenciado-medico/consulta-elegibilidade?btn-nova=Nova+consulta');
end;

procedure TFormPrincipal.MenuItem6Click(Sender: TObject);
begin
   application.Terminate;
end;

procedure TFormPrincipal.ShowRelFichaTriagem(DataSet:TDataSet);
begin
  application.CreateForm(TFormRelFichaPacinte,FormRelFichaPacinte);
  FormRelFichaPacinte.DataSet := DataSet;
  FormRelFichaPacinte.QuickRep1.Previewmodal;
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


end.
