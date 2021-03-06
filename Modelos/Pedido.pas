unit Pedido;

interface

uses
 CAtribEntity,  GenericEntidade;

type
  [TableName('Pedido')]
  TPedido = class(TGenericEntidade)
  private
    FCodigoFornecedor: Integer;
    FPrevisao: TDatetime;
    FDesconto: Double;
    FObservacao: string;
    FEnderecoEntrega: string;
    FCodigo: Integer;
    FCodigoFilial: Integer;
    FCodigoFuncionario: Integer;
    FCodigoFormaPagamento: Integer;
    FSituacao: string;
    FContato: string;
    FTipoFrete: string;
    FFrete: Double;
    FData: TDatetime;
    procedure SetCodigo(const Value: Integer);
    procedure SetCodigoFilial(const Value: Integer);
    procedure SetCodigoFormaPagamento(const Value: Integer);
    procedure SetCodigoFornecedor(const Value: Integer);
    procedure SetCodigoFuncionario(const Value: Integer);
    procedure SetContato(const Value: string);
    procedure SetData(const Value: TDatetime);
    procedure SetDesconto(const Value: Double);
    procedure SetEnderecoEntrega(const Value: string);
    procedure SetFrete(const Value: Double);
    procedure SetObservacao(const Value: string);
    procedure SetPrevisao(const Value: TDatetime);
    procedure SetSituacao(const Value: string);
    procedure SetTipoFrete(const Value: string);
public
  [KeyField('Codigo')]
  [FieldName('Codigo')]
  property Codigo: Integer read FCodigo write SetCodigo;
  [FieldName('CodigoFilial')]
  property CodigoFilial: Integer read FCodigoFilial write SetCodigoFilial;
  [FieldName('CodigoFornecedor')]
  property CodigoFornecedor: Integer read FCodigoFornecedor write SetCodigoFornecedor;
  [FieldName('Data')]
  property Data: TDatetime read FData write SetData;
  [FieldName('CodigoFuncionario')]
  property CodigoFuncionario: Integer read FCodigoFuncionario write SetCodigoFuncionario;
  [FieldName('Situacao')]
  property Situacao: string read FSituacao write SetSituacao;
  [FieldName('Observacao')]
  property Observacao: string read FObservacao write SetObservacao;
  [FieldName('Desconto')]
  property Desconto: Double read FDesconto write SetDesconto;
  [FieldName('Frete')]
  property Frete: Double read FFrete write SetFrete;
  [FieldName('TipoFrete')]
  property TipoFrete: string read FTipoFrete write SetTipoFrete;
  [FieldName('CodigoFormaPagamento')]
  property CodigoFormaPagamento: Integer read FCodigoFormaPagamento write SetCodigoFormaPagamento;
  [FieldName('Previsao')]
  property Previsao: TDatetime read FPrevisao write SetPrevisao;
  [FieldName('EnderecoEntrega')]
  property EnderecoEntrega: string read FEnderecoEntrega write SetEnderecoEntrega;
  [FieldName('Contato')]
  property Contato: string read FContato write SetContato;
end;

implementation

{ TPedido }

procedure TPedido.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TPedido.SetCodigoFilial(const Value: Integer);
begin
  FCodigoFilial := Value;
end;

procedure TPedido.SetCodigoFormaPagamento(const Value: Integer);
begin
  FCodigoFormaPagamento := Value;
end;

procedure TPedido.SetCodigoFornecedor(const Value: Integer);
begin
  FCodigoFornecedor := Value;
end;

procedure TPedido.SetCodigoFuncionario(const Value: Integer);
begin
  FCodigoFuncionario := Value;
end;

procedure TPedido.SetContato(const Value: string);
begin
  FContato := Value;
end;

procedure TPedido.SetData(const Value: TDatetime);
begin
  FData := Value;
end;

procedure TPedido.SetDesconto(const Value: Double);
begin
  FDesconto := Value;
end;

procedure TPedido.SetEnderecoEntrega(const Value: string);
begin
  FEnderecoEntrega := Value;
end;

procedure TPedido.SetFrete(const Value: Double);
begin
  FFrete := Value;
end;

procedure TPedido.SetObservacao(const Value: string);
begin
  FObservacao := Value;
end;

procedure TPedido.SetPrevisao(const Value: TDatetime);
begin
  FPrevisao := Value;
end;

procedure TPedido.SetSituacao(const Value: string);
begin
  FSituacao := Value;
end;

procedure TPedido.SetTipoFrete(const Value: string);
begin
  FTipoFrete := Value;
end;

End.

