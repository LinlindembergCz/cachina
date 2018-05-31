unit TipoAgendamento;

interface

uses
 CAtribEntity,  GenericEntidade;

type
  [TableName('TipoAgendamento')]
  TTipoAgendamento = class(TGenericEntidade)
  private
    FDescricao: string;
    FCodigo: Integer;
    FQuantidadeSessoes: integer;
    FValor: double;
    FCodigoConvenio: integer;
    FCodificacaoAMB: string;
    FCodificacaoTUSS: string;
    procedure SetCodigo(const Value: Integer);
    procedure SetDescricao(const Value: string);
    procedure SetQuantidadeSessoes(const Value: integer);
    procedure SetCodigoConvenio(const Value: integer);
    procedure SetValor(const Value: double);
    procedure SetCodificacaoAMB(const Value: string);
    procedure SetCodificacaoTUSS(const Value: string);
  public
    [KeyField('Codigo')]
    property Codigo: Integer read FCodigo write SetCodigo;
    [FieldName('Descricao')]
    property Descricao: string read FDescricao write SetDescricao;
    [FieldName('QuantidadeSessoes')]
    property QuantidadeSessoes: integer read FQuantidadeSessoes write SetQuantidadeSessoes;
    [FieldName('Valor')]
    property Valor: double read FValor write SetValor;
    [FieldName('CodigoConvenio')]
    property CodigoConvenio: integer read FCodigoConvenio write SetCodigoConvenio;
    [FieldName('CodificacaoTUSS')]
    property CodificacaoTUSS: string read FCodificacaoTUSS write SetCodificacaoTUSS;
    [FieldName('CodificacaoAMB')]
    property  CodificacaoAMB: string read FCodificacaoAMB write SetCodificacaoAMB;
  end;

implementation

{ TTipoAgendamento }

procedure TTipoAgendamento.SetCodificacaoAMB(const Value: string);
begin
  FCodificacaoAMB := Value;
end;

procedure TTipoAgendamento.SetCodificacaoTUSS(const Value: string);
begin
  FCodificacaoTUSS := Value;
end;

procedure TTipoAgendamento.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TTipoAgendamento.SetCodigoConvenio(const Value: integer);
begin
  FCodigoConvenio := Value;
end;

procedure TTipoAgendamento.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TTipoAgendamento.SetQuantidadeSessoes(const Value: integer);
begin
  FQuantidadeSessoes := Value;
end;

procedure TTipoAgendamento.SetValor(const Value: double);
begin
  FValor := Value;
end;

end.
