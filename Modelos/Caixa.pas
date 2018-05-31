unit Caixa;

interface

uses
 CAtribEntity,  GenericEntidade;

type
  [TableName('Caixa')]
  [Modulo('8')]
  TCaixa = class(TGenericEntidade)
  private
    FDescricao: string;
    FCodigo: Integer;
    FCodigoFilial: Integer;
    FStatus: string;
    FValorSaldo: Double;
    FTaxa: Double;
    FCendente: string;
    FNossoNumero: string;
    FCodigoBanco: string;
    FConta: string;
    FCarteira: string;
    FAgencia: string;
    FDigito: string;
    FConvenio: string;
  public
    [KeyField('Codigo')]
    property Codigo: Integer read FCodigo write FCodigo;
    [FieldName('CodigoFilial')]
    property CodigoFilial: Integer read FCodigoFilial write FCodigoFilial;
    [FieldName('Descricao')]
    property Descricao: string read FDescricao write FDescricao;
    [FieldName('ValorSaldo')]
    property ValorSaldo: Double read FValorSaldo write FValorSaldo;
    [FieldName('Status')]
    property Status: string read FStatus write FStatus;
    [FieldName('CodigoBanco')]
    property CodigoBanco : string read FCodigoBanco write FCodigoBanco;
    [FieldName('Cendente')]
    property Cendente  : string read FCendente write FCendente;
    [FieldName('Carteira')]
    property Carteira  : string read FCarteira write FCarteira;
    [FieldName('NossoNumero')]
    property NossoNumero   : string read FNossoNumero write FNossoNumero;
    [FieldName('Agencia')]
    property Agencia  : string read FAgencia write FAgencia;
    [FieldName('Conta')]
    property Conta  : string read FConta write FConta;
    [FieldName('Digito')]
    property Digito : string read FDigito write FDigito;
    [FieldName('Taxa')]
    property Taxa : Double read FTaxa write FTaxa;
    [FieldName('Convenio')]
    property Convenio : string read FConvenio write FConvenio;

  end;

implementation

{ TCaixa }



End.

