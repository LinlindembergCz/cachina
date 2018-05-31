unit ControllerCaixaMovimentacao;

interface

uses
   Windows,Data.DB,  Messages, SysUtils, Variants, Classes,  ControllerTabelas,
   GenericEntidade;

type
  TControllerCaixaMovimentacao = class( TControllerTabelas )
  private

  public
    procedure Inserir(Objecto: TGenericEntidade);override;
    procedure Atualizar(Objecto: TGenericEntidade);override;
    procedure Excluir(Objecto: TGenericEntidade);override;
    function GetDataSet(Objecto: TGenericEntidade;
                        Condicao: string;
                        Fields: string= '') :TDataset;
    function GetSelect(Tabela, Condicao:string; Fields: string= ''):TDataset;
  end;

  resourcestring
  StrCamposCaixaMovimentacao = 'T1.*, categ."Descricao" as Categoria,'+
                               ' caix."Descricao" as Caixa, cast( Valor as Numeric(10,2)) as ValorFormatado';
  ConsultaTabela = ' CaixaMovimentacao T1 '+
                  // ' left join Pessoa pess on pess."Codigo" = T1."CodigoPessoa" '+
                   ' left join Categorias categ on categ."Codigo" = T1."CodigoCategoria"'+
                   ' left join Caixa caix on caix."Codigo" = T1."CodigoCaixa" ';


implementation

{ TControllerClientes }

uses  GenericDAO, EntidadeFactory, Principal, UtilsNumeros,
  UtilsString, Mapper, Controller;

procedure TControllerCaixaMovimentacao.Atualizar(Objecto: TGenericEntidade);
begin
  inherited  ;

end;

procedure TControllerCaixaMovimentacao.Excluir(Objecto: TGenericEntidade);
begin
  inherited ;
end;


function TControllerCaixaMovimentacao.GetDataSet(Objecto: TGenericEntidade;Condicao: string;  Fields: string= ''): TDataset;
begin
  result:= inherited;
end;

function TControllerCaixaMovimentacao.GetSelect(Tabela, Condicao,
  Fields: string): TDataset;
begin
  result:= inherited;
end;

procedure TControllerCaixaMovimentacao.Inserir(Objecto:TGenericEntidade);
begin
  inherited;
end;



end.

