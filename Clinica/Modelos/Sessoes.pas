unit Sessoes;

interface

uses
   CAtribEntity,  GenericEntidade;

Type
  [TableName('Sessoes')]
  TSessoes = class(TGenericEntidade)
  private
    FCodigoAgendamento: integer;
    FHora: string;
    FCodigo: integer;
    FData: TDatetime;
    FNumeroAutorizacao: string;
    procedure SetCodigo(const Value: integer);
    procedure SetCodigoAgendamento(const Value: integer);
    procedure SetData(const Value: TDatetime);
    procedure SetHora(const Value: string);
    procedure SetNumeroAutorizacao(const Value: string);
  public
    [KeyField('Codigo')]
   	property Codigo: integer read FCodigo write SetCodigo;
    [FieldName('CodigoAgendamento')]
    property CodigoAgendamento: integer read FCodigoAgendamento write SetCodigoAgendamento;
    [FieldName('Data')]
    property Data: TDatetime read FData write SetData;
    [FieldName('Hora')]
    property Hora: string read FHora write SetHora;
    [FieldName('NumeroAutorizacao')]
    property NumeroAutorizacao: string read FNumeroAutorizacao write SetNumeroAutorizacao;
  end;


implementation

{ TSessoes }

procedure TSessoes.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TSessoes.SetCodigoAgendamento(const Value: integer);
begin
  FCodigoAgendamento := Value;
end;

procedure TSessoes.SetData(const Value: TDatetime);
begin
  FData := Value;
end;

procedure TSessoes.SetHora(const Value: string);
begin
  FHora := Value;
end;

procedure TSessoes.SetNumeroAutorizacao(const Value: string);
begin
  FNumeroAutorizacao := Value;
end;

end.
