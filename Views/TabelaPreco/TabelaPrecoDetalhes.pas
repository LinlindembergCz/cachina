unit TabelaPrecoDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TemplateDetalhesBase, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TFormTabelaPreco = class(TTemplateFormBaseDetalhes)
    grdItens: TDBGrid;
    Edit1: TEdit;
    lbDataEmissao: TLabel;
    dateDataEmissao: TDateTimePicker;
    Label4: TLabel;
    cboFormaPagamento: TComboBox;
    Label1: TLabel;
    Label11: TLabel;
    cboProduto: TDBLookupComboBox;
    Label12: TLabel;
    edtValor: TEdit;
    SpeedButton3: TSpeedButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTabelaPreco: TFormTabelaPreco;

implementation

{$R *.dfm}

uses DBUtils, EntidadeFactory, GenericEntidade;

procedure TFormTabelaPreco.FormCreate(Sender: TObject);
var
  ItemEntrada:TGenericEntidade;
begin
  //Controller         := TControllerTabelaPreco.Create;
  Entidade           := TEntidadeFactory.Criar(tpTabelaPreco);
  //Tabela             := ControllerEntrada.ConsultaTabela;
  //Campos             := ControllerEntrada.CamposEntrada;
  ItemEntrada        := TEntidadeFactory.Criar(tpItemEntrada);
  Condicao           := '0=1';
  inherited;
  FillCombobox( tpFormaPagamento , cboFormaPagamento);
  FillLookUpCombobox( tpProduto, cboProduto,'Codigo','descricao',
   'Tipo=''MATERIAL''' );
end;

end.
