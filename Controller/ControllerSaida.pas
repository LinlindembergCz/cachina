 unit ControllerSaida;

interface

uses
   Windows,Data.DB,  Messages, SysUtils, Variants, Classes,  ControllerTabelas,
   Forms, Mapper, GenericEntidade;

type
  TControllerSaida = class( TControllerTabelas )
  private




  public
    function SelectSaida: string;
    procedure Inserir(Objecto: TGenericEntidade);override;
    procedure Atualizar(Objecto: TGenericEntidade);override;
    procedure Excluir(Objecto: TGenericEntidade);override;
    function GetDataSet(Objecto: TGenericEntidade;
                        Condicao: string;
                        Fields: string= ''):TDataset;
    function GetSelect(Tabela, Condicao: string; Fields: string = ''): TDataset;
    class function GetValue(Tabela, Condicao, Field: string): String; static;
    procedure ExcluirItens(CodigoSaida: string);
    function GetMaxSaida:String;

  end;
  const
  CamposSaida  = 'T1.*';
  ConsultaTabela = 'Saida T1';
  CamposItemSaida = 'T1.*, (Select "Descricao" from Produtos where Produtos."Codigo"="CodigoProduto") as Descricao';

implementation

{ TControllerClientes }

uses  GenericDAO, EntidadeFactory;//, SaidaListagem;

procedure TControllerSaida.Atualizar(Objecto: TGenericEntidade);
begin
  inherited  ;
end;

procedure TControllerSaida.Excluir(Objecto: TGenericEntidade);
begin
  inherited ;
end;

function TControllerSaida.GetDataSet(Objecto: TGenericEntidade;
                                         Condicao: string;
                                         Fields: string = ''): TDataset;
begin
  result:= inherited;
end;

function TControllerSaida.GetMaxSaida: String;
begin
   result := GetSelect('Saida','0=0','isNull( Max("Codigo"),0)+1 as Max').FieldByName('Max').AsString;
end;

procedure TControllerSaida.Inserir(Objecto:TGenericEntidade);
begin
  inherited;
end;

function TControllerSaida.GetSelect(Tabela, Condicao: string; Fields: string= ''): TDataset;
begin
  result := TGenericDAO.GetSelect(Tabela,Condicao, Fields);
end;

class function TControllerSaida.GetValue(Tabela, Condicao, Field: string): String;
begin
  result := TGenericDAO.GetValue(Tabela,Condicao, Field);
end;

function TControllerSaida.SelectSaida:string;
begin
  //FormSaidaListagem:= TFormSaidaListagem.Create(application);
  //FormSaidaListagem.Showmodal;

  //result:= FormSaidaListagem.Codigo;
  //FormSaidaListagem.Free;

end;


procedure TControllerSaida.ExcluirItens(CodigoSaida: string );
begin
  inherited;
    TGenericDAO.DeleteSQL(TEntidadeFactory.GetNameEntidade(tpItemSaida) ,
                         ' CodigoSaida ='+ CodigoSaida);
end;

end.
