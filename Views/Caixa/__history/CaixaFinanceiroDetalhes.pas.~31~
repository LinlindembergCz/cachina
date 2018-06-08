unit CaixaFinanceiroDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TemplateDetalhesComTabGrid,
  Vcl.ComCtrls, Vcl.StdCtrls, Data.DB, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, DateUtils;

type
  TFormCaixaFinanceiroDetalhes = class(TTemplateFormComTabGridDetalhes)
    edtValor: TEdit;
    cboTipo: TComboBox;
    cboFuncionario: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    dateDataHora: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cboCaixa: TComboBox;
    Label6: TLabel;
    edtObservacao: TEdit;
    Label7: TLabel;
    cboCategoria: TComboBox;
    dateInicio: TDateTimePicker;
    dateFim: TDateTimePicker;
    cboCaixaPesquisa: TComboBox;
    cboTipoPesquisa: TComboBox;
    Label11: TLabel;
    edtConta: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCaixaFinanceiroDetalhes: TFormCaixaFinanceiroDetalhes;

implementation

{$R *.dfm}

uses ControllerTabelas, EntidadeFactory, DBUtils, ControllerCaixaMovimentacao,
  Principal;

procedure TFormCaixaFinanceiroDetalhes.btnInserirClick(Sender: TObject);
begin
  inherited;
  dateDataHora.Date := date;
  cboFuncionario.ItemIndex:= cboFuncionario.Items.IndexOfObject(
                             TObject(strtoInt(FormPrincipal.CodigoPessoa)));
end;

procedure TFormCaixaFinanceiroDetalhes.btnPesquisarClick(Sender: TObject);
begin
  Condicao := ' "DataHora" >=' + quotedstr(formatdatetime('DD/MM/YYYY 00:00:00', dateInicio.date )) + ' and ' +
              ' "DataHora" <=' + quotedstr(formatdatetime('DD/MM/YYYY 23:59:59', dateFim.date ));

  if cboCaixaPesquisa.Text <> '' then
     Condicao := condicao + ' and caix."Descricao" ='+ quotedstr(cboCaixaPesquisa.Text);

  if cboTipoPesquisa.Text <> '' then
     Condicao := condicao + ' and T1."Tipo" ='+ quotedstr(cboTipoPesquisa.Text);

  if edtConta.Text <> '' then
     Condicao := condicao + ' and T1."CodigoConta" ='+ quotedstr(edtConta.Text);

  inherited;
end;

procedure TFormCaixaFinanceiroDetalhes.FormCreate(Sender: TObject);
begin
  Controller:= TControllerCaixaMovimentacao.create;
  Entidade  := TEntidadeFactory.criar(tpCaixaMovimentacao);
  Campos    := ControllerCaixaMovimentacao.StrCamposCaixaMovimentacao;
  Tabela    := ControllerCaixaMovimentacao.ConsultaTabela;

  dateInicio.date:= StartOfTheWeek(date) ;
  dateFim.date:= date+1;

  inherited;
  with MapperEntidade do
  begin
    associar('Codigo',nil);
    associar('CodigoFilial',nil);
    associar('CodigoConta',nil);
    associar('CodigoCaixa',cboCaixa);
    associar('Observacao',edtObservacao);
    associar('Tipo', cboTipo);
    associar('Valor', edtValor);
    associar('DataHora',dateDataHora);
    associar('CodigoFuncionario',cboFuncionario);
    associar('CodigoCategoria',cboCategoria);
  end;

  FillCombobox( tpCaixa, cboCaixa);
  FillCombobox( tpCaixa, cboCaixaPesquisa);
  FillCombobox( tpCategoria, cboCategoria);
  FillCombobox( tpFuncionarios, cboFuncionario,'0=0','Codigo','Nome','Nome');

  TFloatField(srcPesquisa.DataSet.FieldByName('Valor')).DisplayFormat:= ',0.00;';

  CampoPesquisa := 'Observacao';

end;

end.
