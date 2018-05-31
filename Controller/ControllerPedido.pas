unit ControllerPedido;

interface

uses
   Windows,Data.DB,  Messages, SysUtils, Variants, Classes,
   Forms, Mapper, GenericEntidade, ControllerTabelas;

type
  TControllerPedido = class( TControllerTabelas )
  private


  public
    function SelectPedido: string;
    procedure Inserir(Objecto: TGenericEntidade);override;
    procedure Atualizar(Objecto: TGenericEntidade);override;
    procedure Excluir(Objecto: TGenericEntidade);override;
    function GetDataSet(Objecto: TGenericEntidade;
                        Condicao: string;
                        Fields: string= ''):TDataset;
    function GetSelect(Tabela, Condicao: string; Fields: string = ''): TDataset;
    class function GetValue(Tabela, Condicao, Field: string): String; static;

    function GetMaxPedido:String;
    procedure ExcluirItens(CodigoPedido: string);

  end;
  const
  CamposPedido  = 'T1.*,'+
                   '(Select SUM( "Valor" * "Quantidade" - ( "Valor" * "Quantidade" * ( "Desconto" /100))) '+
                   ' from ItemPedido where "CodigoPedido"= T1."Codigo") - '+
                   '( ( Select SUM( "Valor" * "Quantidade" - ( "Valor" * "Quantidade" * ( "Desconto" /100))) '+
                   '    From ItemPedido where "CodigoPedido"= T1."Codigo") * T1."Desconto" / 100 )'+
                   '    As TotalPedido,'+
                   ' forn."Nome", forn."CPFCNPJ", forn."Telefone", forn."RazaoSocial", forn."Endereco", forn."Bairro", '+
                   ' forn."Municipio", forn."UF", forn."CEP"';

  ConsultaTabela = 'Pedido T1 left join Pessoa forn on forn."Codigo"= T1."CodigoFornecedor"';

  CamposItemPedido = 'T1.*, (Select "Descricao" from Produtos where Produtos."Codigo"="CodigoProduto") as Descricao';
  CamposEntradaFormaPagamento = 'T1.*,(Select "Descricao" from FormaPagamento where "Codigo"=T1."CodigoFormaPagamento") as Descricao';

implementation

{ TControllerPedido }

uses  GenericDAO, EntidadeFactory;

procedure TControllerPedido.Atualizar(Objecto: TGenericEntidade);
begin
  inherited  ;
end;

procedure TControllerPedido.Excluir(Objecto: TGenericEntidade);
begin
  inherited ;
end;

function TControllerPedido.GetDataSet(Objecto: TGenericEntidade;
                                         Condicao: string;
                                         Fields: string = ''): TDataset;
begin
  result:= inherited;
end;

function TControllerPedido.GetMaxPedido: String;
begin
   result := GetSelect('Pedido','0=0','isNull( Max("Codigo"),0)+1 as Max').FieldByName('Max').AsString;
end;

procedure TControllerPedido.Inserir(Objecto:TGenericEntidade);
begin
  inherited;
end;

function TControllerPedido.GetSelect(Tabela, Condicao: string; Fields: string= ''): TDataset;
begin
  result := TGenericDAO.GetSelect(Tabela,Condicao, Fields);
end;

class function TControllerPedido.GetValue(Tabela, Condicao, Field: string): String;
begin
  result := TGenericDAO.GetValue(Tabela,Condicao, Field);
end;

function TControllerPedido.SelectPedido:string;
begin
  //FormEntradaListagem:= TFormEntradaListagem.Create(application);
  //FormEntradaListagem.Showmodal;

  //result:= FormEntradaListagem.Codigo;
  //FormEntradaListagem.Free;

end;

procedure TControllerPedido.ExcluirItens(CodigoPedido: string );
begin
  inherited;
    TGenericDAO.DeleteSQL(TEntidadeFactory.GetNameEntidade(tpItemPedido) ,
                         ' CodigoPedido ='+ CodigoPedido);
end;

end.
