unit ControllerProdutos;

interface

uses
   Windows,Data.DB,  Messages, SysUtils, Variants, Classes, ControllerTabelas,
   PrecoVenda, GenericEntidade, Dialogs;

type
  TPrecoVenda = record
     Custo: double;
     Imposto: double;
     Taxa: double;
     Comissao: double;
     Desconto: double;
     CustoFixo: double;
     Lucro: double ;
     ValorVenda: double;
     Markup: double;
  end;

  TControllerProdutos= class( TControllerTabelas )
  private
    function ProdutoExiste(Descricao: string): Boolean;
    procedure VerificarProduto(Descricao: string);
  public
    function CalculaLucro(PrecoVenda: TPrecoVenda): double;
    function CalculaPercentualLucro(PrecoVenda: TPrecoVenda): double;
    function CalculaPercentualLucroLiquido(PrecoVenda: TPrecoVenda): double;
    function CalculaTotalDespesas(PrecoVenda: TPrecoVenda): double;
    function CalculaValorLucro(PrecoVenda: TPrecoVenda): double;
    function CalculaPrecoSugerido(PrecoVenda: TPrecoVenda): double;

    procedure Inserir(Objecto: TGenericEntidade);override;
    procedure Atualizar(Objecto: TGenericEntidade);override;
    procedure Excluir(Objecto: TGenericEntidade);override;
    function GetDataSet(Objecto: TGenericEntidade;Condicao: string;  Fields: string= ''):TDataset;
    function GetSelect(Tabela, Condicao:string; Fields: string= ''):TDataset;

    function GetPrecoVenda(CodigoProduto, CodigoCliente: string):Double;
    function EhServico(CodigoProduto : string):Boolean;
    function GetProdutoEstoque(CodigoProduto: string):TDataset;
    function GetCurvaAbc(condicao: string):TDataSet;
  end;


  const

  Consultatabela = 'Produtos T1 left join tabelaNCM on T1.CodigoNCM = tabelaNCM.Codigo';
  CamposProduto  = 'T1.*, ( TabelaNCM.CodigoNCM ) as CodificacaoNCM';


implementation

{ TControllerProdutos }

uses  GenericDAO, Produtos, UtilsNumeros, EntidadeFactory;

function TControllerProdutos.CalculaTotalDespesas(PrecoVenda: TPrecoVenda): double;
begin
  result:= PrecoVenda.Custo + PrecoVenda.Custo +
                            PrecoVenda.Taxa +
                            PrecoVenda.Comissao +
                            PrecoVenda.Desconto +
                            PrecoVenda.CustoFixo +
                            PrecoVenda.Lucro;
end;

function TControllerProdutos.CalculaLucro(PrecoVenda: TPrecoVenda): double;
begin
  result:= PrecoVenda.ValorVenda - CalculaTotalDespesas(PrecoVenda);
end;

function TControllerProdutos.CalculaPercentualLucro(PrecoVenda: TPrecoVenda): double;
begin
  result:= CalculaLucro(PrecoVenda)/ PrecoVenda.ValorVenda *100;
end;

function TControllerProdutos.CalculaPrecoSugerido(PrecoVenda: TPrecoVenda):double;
begin
  result:= PrecoVenda.Custo/((100/100)-( PrecoVenda.Markup /100));
end;

function TControllerProdutos.CalculaPercentualLucroLiquido(PrecoVenda: TPrecoVenda):double;
begin
  if CalculaPrecoSugerido(PrecoVenda) > 0 then
     result :=  CalculaPercentualLucro(PrecoVenda)  / CalculaPrecoSugerido(PrecoVenda)  * 100;
end;

function TControllerProdutos.CalculaValorLucro(PrecoVenda: TPrecoVenda):double;
begin
  result := CalculaPercentualLucroLiquido(PrecoVenda)  * 100 / CalculaPrecoSugerido(PrecoVenda) ;
end;

procedure TControllerProdutos.Atualizar(Objecto: TGenericEntidade);
begin
  inherited;
end;

procedure TControllerProdutos.Excluir(Objecto: TGenericEntidade);
begin
  inherited;
end;

function TControllerProdutos.GetCurvaAbc(condicao: string): TDataSet;
begin
  result:= GetSelect( 'vwCurvaABC T1', condicao);
end;

function TControllerProdutos.GetDataSet(Objecto: TGenericEntidade; Condicao: string; Fields: string= ''): TDataset;
begin
  result := inherited;
end;

function TControllerProdutos.GetPrecoVenda(CodigoProduto,
  CodigoCliente: string): Double;
var
  Produto:TGenericEntidade;
  DataSetProduto: TDataSet;
begin
  Produto:= TEntidadeFactory.Criar(tpProduto);
  DataSetProduto:= GetDataSet( Produto , 'Codigo='+  quotedstr( CodigoProduto ), 'ValorVenda' );
  result:= DataSetProduto.FieldByName('ValorVenda').AsFloat;
end;

function TControllerProdutos.GetProdutoEstoque(CodigoProduto: string): TDataset;
begin
  result:=  GetSelect( 'EstoqueProduto estpr '+
                       ' inner join Estoque est on estpr.CodigoEstoque = est.Codigo',
                       ' CodigoProduto='+  quotedstr( CodigoProduto ),
                       ' est.Descricao, estpr.Quantidade ');
end;

function TControllerProdutos.GetSelect(Tabela, Condicao,
  Fields: string): TDataset;
begin
  result:= inherited;
end;

function TControllerProdutos.EhServico(CodigoProduto: string): Boolean;
begin
  result:= TGenericDAO.GetValue('Produtos','Codigo='+CodigoProduto,'upper(Tipo)') = 'SERVIÇO';
end;

function TControllerProdutos.ProdutoExiste(Descricao: string): Boolean;
begin
  result:= TGenericDAO.GetValue('Produtos','Descricao ='+ quotedstr( Descricao ) ,'Descricao') <> '';
end;

procedure TControllerProdutos.VerificarProduto(Descricao: string);
begin
  if ProdutoExiste( PMapper.GetValueEntidade('Descricao') ) then
  begin
    showmessage('Produto já está cadastrado!');
    abort;
  end;
end;

procedure TControllerProdutos.Inserir(Objecto:TGenericEntidade);
begin
  VerificarProduto( PMapper.GetValueEntidade('Descricao') );
  inherited;
end;

end.
