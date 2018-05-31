unit DiarioAtividade;

interface

uses
 CAtribEntity,  GenericEntidade;

type
  [TableName('DiarioAtividade')]
  [Modulo('102')]
  TDiarioAtividade = class(TGenericEntidade)
  private
    FObservacao: string;
    FCodigo: Integer;
    FCodigoFilial: Integer;
    FCodigoObra: Integer;
    FData: TDatetime;
    FCodigoFuncionario: integer;
    FTempo: string;
    procedure SetCodigo(const Value: Integer);
    procedure SetCodigoFilial(const Value: Integer);
    procedure SetCodigoObra(const Value: Integer);
    procedure SetData(const Value: TDatetime);
    procedure SetObservacao(const Value: string);
    procedure SetCodigoFuncionario(const Value: integer);
    procedure SetTempo(const Value: string);
public
  [KeyField('Codigo')]
  [FieldName('Codigo')]
  property Codigo: Integer read FCodigo write SetCodigo;
  [FieldName('CodigoFilial')]
  property CodigoFilial: Integer read FCodigoFilial write SetCodigoFilial;
  [FieldName('Data')]
  property Data: TDatetime read FData write SetData;
  [FieldName('CodigoObra')]
  property CodigoObra: Integer read FCodigoObra write SetCodigoObra;
  [FieldName('Observacao')]
  property Observacao: string read FObservacao write SetObservacao;
  [FieldName('CodigoFuncionario')]
  property CodigoFuncionario: integer read FCodigoFuncionario write SetCodigoFuncionario;
  [FieldName('Tempo')]
  property Tempo : string read FTempo write SetTempo;
end;

implementation

{ TDiarioAtividade }

procedure TDiarioAtividade.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TDiarioAtividade.SetCodigoFilial(const Value: Integer);
begin
  FCodigoFilial := Value;
end;


procedure TDiarioAtividade.SetCodigoFuncionario(const Value: integer);
begin
  FCodigoFuncionario := Value;
end;

procedure TDiarioAtividade.SetCodigoObra(const Value: Integer);
begin
  FCodigoObra := Value;
end;

procedure TDiarioAtividade.SetData(const Value: TDatetime);
begin
  FData := Value;
end;

procedure TDiarioAtividade.SetObservacao(const Value: string);
begin
  FObservacao := Value;
end;

procedure TDiarioAtividade.SetTempo(const Value: string);
begin
  FTempo := Value;
end;

End.

