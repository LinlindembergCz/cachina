unit ControllerClientes;

interface

uses
   Windows,Data.DB,  Messages, SysUtils, Variants, Classes,  ControllerTabelas,
   GenericEntidade;

type
  TControllerClientes = class( TControllerTabelas )
  private
    procedure VerificarCamposRequeridos;
    procedure VincularFormaPagamento;
  public
    procedure Inserir(Objecto: TGenericEntidade);override;
    procedure Atualizar(Objecto: TGenericEntidade);override;
    procedure Excluir(Objecto: TGenericEntidade);override;
    function GetDataSet(Objecto: TGenericEntidade;
                        Condicao: string;
                        Fields: string= '') :TDataset;
    class function GetClientes(Condicao: string; Campos: string = ''):TDataSet;
    class function GetCliente(Codigo: string;Campos: string = ''):TDataSet;
    class function GetClientePlaca(CodigoCliente: string; Placa: string): TDataset;
    class function GetClienteCPFCNPJ(CPFCNPJ: string): TDataset; static;
    class function GetClienteNomeCPFCNPJ(NomeCPFCNPJ: string): TDataset; static;
    class function GetClienteContatoCPF(CPFCNPJ: string): TDataset; static;
    function GetSelect(Tabela, Condicao:string; Fields: string= ''):TDataset;

    function GetClienteFormaPagamento(CodigoCliente: string):TDataset;
    function AddClienteFormaPagamento(CodigoCliente, CodigoFormaPagamento: string):TDataset;
    function RemoverClienteFormaPagamento(CodigoCliente, CodigoFormaPagamento: string):TDataset;

    constructor Create;
  end;


  resourcestring
  StrCamposVeiculos = 'Placa,'#9'CodigoCliente,'#9'CodigoFilial,'#9'CodigoMo' +
  'delo,'#9'Chassi,'#9'Ano,'#9'Cor,'#9'Observacao,'#9'Data,'#9'Potencia,'+
  '(Select Descricao from ModeloVeiculo where Codigo= CodigoModelo) as Modelo';

implementation

{ TControllerClientes }

uses  GenericDAO, EntidadeFactory, ClientesDAO, Principal, UtilsNumeros,
  UtilsString, Mapper;


procedure TControllerClientes.Atualizar(Objecto: TGenericEntidade);
begin
  VerificarCamposRequeridos;
  PMapper.SendValueToFieldEntidade('Tipo','CLIENTE');
  inherited;
  //VincularFormaPagamento;
end;

procedure TControllerClientes.Inserir(Objecto:TGenericEntidade);
begin
  VerificarCamposRequeridos;
  PMapper.SendValueToFieldEntidade('Tipo','CLIENTE');
  inherited;
  VincularFormaPagamento;

end;

procedure TControllerClientes.VincularFormaPagamento;
var
  CodigoPessoa: string;
begin
  if PMapper.GetValueEntidade('CPFCNPJ') <> '' then
  begin
    CodigoPessoa := TGenericDAO.GetValue('Pessoa','"CPFCNPJ"='+
                    quotedstr( PMapper.GetValueEntidade('CPFCNPJ') ), 'Codigo' );

    TGenericDAO.DeleteSQL('PessoaFormaPagamento','"CodigoPessoa" = '+ CodigoPessoa );

    TGenericDAO.InsertSQLSelect('PessoaFormaPagamento',
                                '"CodigoPessoa", "CodigoFormaPagamento", "CodigoFilial"',
                                'Select '+ CodigoPessoa +' , "Codigo" , 1 From FormaPagamento '+
                                'where "Padrao" = ''S'' ');
  end;
end;

function TControllerClientes.RemoverClienteFormaPagamento(CodigoCliente,
  CodigoFormaPagamento: string): TDataset;
begin
   TGenericDAO.DeleteSQL('PessoaFormaPagamento',
                      ' CodigoPessoa='+CodigoCliente+
                      ' and '+
                      ' CodigoFormaPagamento= '+CodigoFormaPagamento);
end;

function TControllerClientes.AddClienteFormaPagamento(CodigoCliente,
  CodigoFormaPagamento: string): TDataset;
begin
     TGenericDAO.InsertSQL('PessoaFormaPagamento','CodigoPessoa, CodigoFormaPagamento, CodigoFilial',
   CodigoCliente+','+CodigoFormaPagamento+', 1');
end;

procedure TControllerClientes.VerificarCamposRequeridos;
begin
  if (PMapper.GetValueEntidade('Faturar') = 'S') then
     PMapper.IsRiquired(['Endereco','Bairro','Municipio','CEP','Telefone','UF']);

  PMapper.IsRiquired(['CPFCNPJ']);

  if Length( UtilsString.SoNumeros( PMapper.GetValueEntidade('CPFCNPJ') ) ) = 14 then
     PMapper.IsRiquired(['RazaoSocial']);
end;

constructor TControllerClientes.Create;
begin
  CodigoModulo:= '1';
end;

procedure TControllerClientes.Excluir(Objecto: TGenericEntidade);
begin
  inherited ;
end;

class function TControllerClientes.GetClientePlaca(CodigoCliente: string; Placa: string):TDataset;
begin
   Result:= TClientesDAO.GetClientePlaca(CodigoCliente, Placa);
end;

class function TControllerClientes.GetClientes(Condicao,
  Campos: string): TDataSet;
begin
   result:=  TClientesDAO.GetClientes( Condicao  , Campos );
end;

class function TControllerClientes.GetCliente(Codigo: string;Campos: string = ''): TDataSet;
begin
   result:=  TClientesDAO.GetCliente( Codigo  , Campos );
end;

class function TControllerClientes.GetClienteContatoCPF(CPFCNPJ: string):TDataset;
begin
   result:= TClientesDAO.GetClienteContatoCPF( CPFCNPJ);
end;

class function TControllerClientes.GetClienteCPFCNPJ(CPFCNPJ: string): TDataset;
begin
  result:= TClientesDAO.GetClienteCPFCNPJ( CPFCNPJ);
end;

function TControllerClientes.GetClienteFormaPagamento(
  CodigoCliente: string): TDataset;
begin
   result := GetSelect(' PessoaFormaPagamento T1 inner join FormaPagamento on '+
                       ' FormaPagamento.Codigo = CodigoFormaPagamento',
                       ' T1.CodigoPessoa= '+ CodigoCliente,
                       ' T1."CodigoPessoa", FormaPagamento."Codigo", '+
                       ' FormaPagamento."Descricao", T1."CodigoFormaPagamento"');
end;

class function TControllerClientes.GetClienteNomeCPFCNPJ(NomeCPFCNPJ: string): TDataset;
begin
   result:= TClientesDAO.GetClienteNomeCPFCNPJ(NomeCPFCNPJ);
end;

function TControllerClientes.GetDataSet(Objecto: TGenericEntidade;Condicao: string;  Fields: string= ''): TDataset;
begin
  result:= inherited;
end;

function TControllerClientes.GetSelect(Tabela, Condicao,
  Fields: string): TDataset;
begin
  result:= inherited;
end;



end.
