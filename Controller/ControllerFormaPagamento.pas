unit ControllerFormaPagamento;

interface

uses
   Windows,Data.DB,  Messages, SysUtils, Variants, Classes,  ControllerTabelas,
   GenericEntidade;

type
  TControllerFormaPagamento = class( TControllerTabelas )
  private
     procedure VincularFormaPagamento;
  public
    procedure Inserir(Objecto: TGenericEntidade);override;
    procedure Atualizar(Objecto: TGenericEntidade);override;
    procedure Excluir(Objecto: TGenericEntidade);override;
    function GetDataSet(Objecto: TGenericEntidade;Condicao: string;Fields: string= '') :TDataset;
    function GetSelect(Tabela, Condicao:string; Fields: string= ''):TDataset;
    constructor Create;
  end;

implementation

{ TControllerFormaPagamento }

uses  GenericDAO, EntidadeFactory, Principal, UtilsNumeros,
  UtilsString, Mapper;


procedure TControllerFormaPagamento.Atualizar(Objecto: TGenericEntidade);
begin
  inherited;
  VincularFormaPagamento;
end;

procedure TControllerFormaPagamento.Inserir(Objecto:TGenericEntidade);
begin
  inherited;
  VincularFormaPagamento;
end;

procedure TControllerFormaPagamento.VincularFormaPagamento;
var
  Codigo: string;
begin
  if  PMapper.GetValueEntidade('Padrao') = 'S' then
  begin
    Codigo := TGenericDAO.Getvalue('FormaPagamento',
              '"Descricao" = '+ quotedstr(PMapper.GetValueEntidade('Descricao')),'Codigo' );
    if Codigo <> '' then
    begin
      TGenericDAO.DeleteSQL('PessoaFormaPagamento','"CodigoFormaPagamento" = '+ Codigo );

      TGenericDAO.InsertSQLSelect('PessoaFormaPagamento',
                                '"CodigoPessoa", "CodigoFormaPagamento", "CodigoFilial"',
                                'Select "Codigo" , '+ Codigo +', 1 From Pessoa  '+
                                'where "Tipo" = ''CLIENTE'' and Codigo Not IN ( Select CodigoPessoa From '+
                                ' PessoaFormaPagamento  where CodigoFormaPagamento ='+ Codigo +')');
    end;
  end;
end;

constructor TControllerFormaPagamento.Create;
begin

end;

procedure TControllerFormaPagamento.Excluir(Objecto: TGenericEntidade);
begin
  inherited ;
end;

function TControllerFormaPagamento.GetDataSet(Objecto: TGenericEntidade;Condicao: string;  Fields: string= ''): TDataset;
begin
  result:= inherited;
end;

function TControllerFormaPagamento.GetSelect(Tabela, Condicao,
  Fields: string): TDataset;
begin
  result:= inherited;
end;



end.
