 unit ControllerProcesso;

interface

uses
   Windows,Data.DB,  Messages, SysUtils, Variants, Classes,  ControllerTabelas,
   Forms, Mapper, GenericEntidade;

type
  TControllerProcesso = class( TControllerTabelas )
  private
  public
    procedure Inserir(Objecto: TGenericEntidade);override;
    procedure Atualizar(Objecto: TGenericEntidade);override;
    procedure Excluir(Objecto: TGenericEntidade);override;
    function GetDataSet(Objecto: TGenericEntidade;
                        Condicao: string;
                        Fields: string= ''):TDataset;
    function GetSelect(Tabela, Condicao: string; Fields: string = ''): TDataset;
    class function GetValue(Tabela, Condicao, Field: string): String; static;

    function GetMaxSaida:String;

  end;
  const
  CamposProcesso  = 'T1.*,'+
                    'Cli."Nome"          as NomeCliente,'+
                    'Fun."Nome"          as NomeAdvogado,'+
                    'Contra."Nome"       as NomeContrario,'+
                    'Obj."Descricao"     as NomeObjeto,'+
                    'Tipo."Descricao"    as NomeTipoAcao,'+
                    'fas."Descricao"     as NomeFase,'+
                    'area."Descricao"    as NomeArea,'+
                    'resulta."Descricao" as NomeResultado,'+
                    'dist."Descricao"    as NomeDistribuicao';

  ConsultaTabela = ' Processo T1 '+
                   ' left join Pessoa Cli                on Cli."Codigo"     = T1."CodigoCliente"'+
                   ' left join Funcionarios Fun          on Fun."Codigo"     = T1."CodigoAdvogado"'+
                   ' left join Pessoa Contra             on Contra."Codigo"  = T1."CodigoContrario"'+
                   ' left join ObjetoProcesso Obj        on Obj."Codigo"     = T1."CodigoObjeto"'+
                   ' left join TipoAcaoProccesso Tipo    on Tipo."Codigo"    = T1."CodigoTipoAcao"'+
                   ' left join FaseProcesso fas          on fas."Codigo"     = T1."CodigoFaseAtual"'+
                   ' left join AreaJuridicaProcesso area on area."Codigo"    = T1."CodigoAreaJuridica"'+
                   ' left join ResultadoProcesso resulta on resulta."Codigo" = T1."CodigoResultado"'+
                   ' left join Distribuicao dist         on dist."Codigo"    = T1."CodigoDistribuicao"';

implementation

{ TControllerProcesso }

uses  GenericDAO;

procedure TControllerProcesso.Atualizar(Objecto: TGenericEntidade);
begin
  inherited  ;
end;

procedure TControllerProcesso.Excluir(Objecto: TGenericEntidade);
begin
  inherited ;
end;

function TControllerProcesso.GetDataSet(Objecto: TGenericEntidade;
                                         Condicao: string;
                                         Fields: string = ''): TDataset;
begin
  result:= inherited;
end;

function TControllerProcesso.GetMaxSaida: String;
begin
   result := GetSelect('Processo','0=0','isNull( Max("Codigo"),0)+1 as Max').FieldByName('Max').AsString;
end;

procedure TControllerProcesso.Inserir(Objecto:TGenericEntidade);
begin
  inherited;
end;

function TControllerProcesso.GetSelect(Tabela, Condicao: string; Fields: string= ''): TDataset;
begin
  result := TGenericDAO.GetSelect(Tabela,Condicao, Fields);
end;

class function TControllerProcesso.GetValue(Tabela, Condicao, Field: string): String;
begin
  result := TGenericDAO.GetValue(Tabela,Condicao, Field);
end;



end.
