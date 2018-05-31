unit ItemSaida;

interface

uses
 CAtribEntity,  GenericEntidade;

type
  [TableName('ItemSaida')]
  [Modulo('7')]
  TItemSaida = class(TGenericEntidade)
  private
    FValor: Double;
    FCodigoProduto: Integer;
    FCodigo: Integer;
    FCodigoFilial: Integer;
    FQuantidade: Double;
    FCodigoEstoque: integer;
    FOrdem: Integer;
    FCodigoSaida: integer;
    FFator: double;
    FCodigoUnidade: integer;
    procedure SetCodigo(const Value: Integer);
    procedure SetCodigoEstoque(const Value: integer);
    procedure SetCodigoFilial(const Value: Integer);
    procedure SetCodigoProduto(const Value: Integer);
    procedure SetOrdem(const Value: Integer);
    procedure SetQuantidade(const Value: Double);
    procedure SetValor(const Value: Double);
    procedure SetCodigoSaida(const Value: integer);
    procedure SetFator(const Value: double);
    procedure SetCodigoUnidade(const Value: integer);
  public
    [KeyField('Codigo')]
    property Codigo: Integer read FCodigo write SetCodigo;
    [FieldName('CodigoFilial')]
    property CodigoFilial: Integer read FCodigoFilial write SetCodigoFilial;
    [FieldName('CodigoProduto')]
    property CodigoProduto: Integer read FCodigoProduto write SetCodigoProduto;
    [FieldName('Ordem')]
    property Ordem: Integer read FOrdem write SetOrdem;
    [FieldName('Quantidade')]
    property Quantidade: Double read FQuantidade write SetQuantidade;
    [FieldName('Valor')]
    property Valor: Double read FValor write SetValor;
    [FieldName('CodigoEstoque')]
    property CodigoEstoque: integer read FCodigoEstoque write SetCodigoEstoque;
    [FieldName('CodigoSaida')]
    property CodigoSaida: integer read FCodigoSaida write SetCodigoSaida;
    [FieldName('Fator')]
    property Fator: double read FFator write SetFator;
    [FieldName('CodigoUnidade')]
    property CodigoUnidade: integer read FCodigoUnidade write SetCodigoUnidade;
  end;

implementation

{ TItemSaida }

procedure TItemSaida.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TItemSaida.SetCodigoEstoque(const Value: integer);
begin
  FCodigoEstoque := Value;
end;

procedure TItemSaida.SetCodigoFilial(const Value: Integer);
begin
  FCodigoFilial := Value;
end;

procedure TItemSaida.SetCodigoProduto(const Value: Integer);
begin
  FCodigoProduto := Value;
end;

procedure TItemSaida.SetCodigoSaida(const Value: integer);
begin
  FCodigoSaida := Value;
end;

procedure TItemSaida.SetCodigoUnidade(const Value: integer);
begin
  FCodigoUnidade := Value;
end;

procedure TItemSaida.SetFator(const Value: double);
begin
  FFator := Value;
end;

procedure TItemSaida.SetOrdem(const Value: Integer);
begin
  FOrdem := Value;
end;

procedure TItemSaida.SetQuantidade(const Value: Double);
begin
  FQuantidade := Value;
end;

procedure TItemSaida.SetValor(const Value: Double);
begin
  FValor := Value;
end;

End.

