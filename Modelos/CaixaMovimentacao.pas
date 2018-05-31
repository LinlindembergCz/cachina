unit CaixaMovimentacao;

interface

uses
 CAtribEntity,  GenericEntidade;

type
  [TableName('CaixaMovimentacao')]
  [Modulo('8')]
  TCaixaMovimentacao = class(TGenericEntidade)
  private
    FCodigoConta: Integer;
    FObservacao: string;
    FDataHora: TDatetime;
    FValor: Double;
    FCodigo: Integer;
    FCodigoFilial: Integer;
    FCodigoCaixa: Integer;
    FCodigoCategoria: Integer;
    FTipo: string;
    procedure SetCodigo(const Value: Integer);
    procedure SetCodigoCaixa(const Value: Integer);
    procedure SetCodigoCategoria(const Value: Integer);
    procedure SetCodigoConta(const Value: Integer);
    procedure SetCodigoFilial(const Value: Integer);
    procedure SetDataHora(const Value: TDatetime);
    procedure SetObservacao(const Value: string);
    procedure SetTipo(const Value: string);
    procedure SetValor(const Value: Double);
  public
    [KeyField('Codigo')]
    property Codigo: Integer read FCodigo write SetCodigo;
    [FieldName('CodigoFilial')]
    property CodigoFilial: Integer read FCodigoFilial write SetCodigoFilial;
    [FieldName('CodigoCaixa')]
    property CodigoCaixa: Integer read FCodigoCaixa write SetCodigoCaixa;
    [FieldName('DataHora')]
    property DataHora: TDatetime read FDataHora write SetDataHora;
    [FieldName('Valor')]
    property Valor: Double read FValor write SetValor;
    [FieldName('CodigoCategoria')]
    property CodigoCategoria: Integer read FCodigoCategoria write SetCodigoCategoria;
    [FieldName('Observacao')]
    property Observacao: string read FObservacao write SetObservacao;
    [FieldName('Tipo')]
    property Tipo: string read FTipo write SetTipo;
    [FieldName('CodigoConta')]
    property CodigoConta: Integer read FCodigoConta write SetCodigoConta;
  end;

implementation

{ TCaixaMovimentacao }

procedure TCaixaMovimentacao.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TCaixaMovimentacao.SetCodigoCaixa(const Value: Integer);
begin
  FCodigoCaixa := Value;
end;

procedure TCaixaMovimentacao.SetCodigoCategoria(const Value: Integer);
begin
  FCodigoCategoria := Value;
end;

procedure TCaixaMovimentacao.SetCodigoConta(const Value: Integer);
begin
  FCodigoConta := Value;
end;

procedure TCaixaMovimentacao.SetCodigoFilial(const Value: Integer);
begin
  FCodigoFilial := Value;
end;

procedure TCaixaMovimentacao.SetDataHora(const Value: TDatetime);
begin
  FDataHora := Value;
end;

procedure TCaixaMovimentacao.SetObservacao(const Value: string);
begin
  FObservacao := Value;
end;

procedure TCaixaMovimentacao.SetTipo(const Value: string);
begin
  FTipo := Value;
end;

procedure TCaixaMovimentacao.SetValor(const Value: Double);
begin
  FValor := Value;
end;

End.
