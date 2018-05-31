unit Equipe;

interface

uses
   CAtribEntity,  GenericEntidade;

Type
  [TableName('Equipe')]
  TEquipe = class(TGenericEntidade)
  private
    FDescricao: string;
    FCodigo: integer;
    FCodigoFilial: integer;
    FCodigoFuncionario: integer;
    FStatus: string;
    procedure SetCodigo(const Value: integer);
    procedure SetDescricao(const Value: string);
    procedure SetCodigoFilial(const Value: integer);
    procedure SetCodigoFuncionario(const Value: integer);
    procedure SetStatus(const Value: string);
  public
    [KeyField('Codigo')]
    [FieldName('Codigo')]
    property Codigo: integer read FCodigo write SetCodigo;
    [FieldName('CodigoFilial')]
    property CodigoFilial: integer read FCodigoFilial write SetCodigoFilial;
    [FieldName('Descricao')]
    property Descricao: string read FDescricao write SetDescricao;
    [FieldName('CodigoFuncionario')]
    property CodigoFuncionario: integer read FCodigoFuncionario write SetCodigoFuncionario;
    [FieldName('Status')]
    property Status: string read FStatus write SetStatus;
  end;

 [TableName('ItemEquipe')]
  TItemEquipe = class(TGenericEntidade)
  private
    FCodigoFilial: integer;
    FCodigoFuncionario: integer;
    FCodigoEquipe: integer;
    FParticipacao: double;
    FCodigo: integer;
    FGratificacao: double;
    FTipoGratificacao: string;
    FParticipacaoReal: Double;
    procedure SetCodigoEquipe(const Value: integer);
    procedure SetCodigoFuncionario(const Value: integer);
    procedure SetCodigoFilial(const Value: integer);
    procedure SetParticipacao(const Value: double);
    procedure SetCodigo(const Value: integer);
    procedure SetGratificacao(const Value: double);
    procedure SetTipoGratificacao(const Value: string);
    procedure SetParticipacaoReal(const Value: Double);
  public
    [KeyField('Codigo')]
    property Codigo: integer read FCodigo write SetCodigo;
    [FieldName('CodigoFilial')]
    property CodigoFilial: integer read FCodigoFilial write SetCodigoFilial;
    [FieldName('CodigoFuncionario')]
    property CodigoFuncionario: integer read FCodigoFuncionario write SetCodigoFuncionario;
    [FieldName('CodigoEquipe')]
    property CodigoEquipe: integer read FCodigoEquipe write SetCodigoEquipe;
    [FieldName('Participacao')]
    property Participacao: double read FParticipacao write SetParticipacao;
    [FieldName('Gratificacao')]
    property Gratificacao: double read FGratificacao write SetGratificacao;
    [FieldName('TipoGratificacao')]
    property TipoGratificacao: string read FTipoGratificacao write SetTipoGratificacao;
    [FieldName('ParticipacaoReal')]
    property ParticipacaoReal:Double read FParticipacaoReal write SetParticipacaoReal;

  end;


implementation

{ TModulo }

procedure TEquipe.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TEquipe.SetCodigoFilial(const Value: integer);
begin
  FCodigoFilial := Value;
end;

procedure TEquipe.SetCodigoFuncionario(const Value: integer);
begin
  FCodigoFuncionario := Value;
end;

procedure TEquipe.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TEquipe.SetStatus(const Value: string);
begin
  FStatus := Value;
end;

{ TItemEquipe }

procedure TItemEquipe.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TItemEquipe.SetCodigoEquipe(const Value: integer);
begin
  FCodigoEquipe := Value;
end;

procedure TItemEquipe.SetCodigoFilial(const Value: integer);
begin
  FCodigoFilial := Value;
end;

procedure TItemEquipe.SetCodigoFuncionario(const Value: integer);
begin
  FCodigoFuncionario := Value;
end;

procedure TItemEquipe.SetGratificacao(const Value: double);
begin
  FGratificacao := Value;
end;

procedure TItemEquipe.SetParticipacao(const Value: double);
begin
  FParticipacao := Value;
end;

procedure TItemEquipe.SetParticipacaoReal(const Value: Double);
begin
  FParticipacaoReal := Value;
end;

procedure TItemEquipe.SetTipoGratificacao(const Value: string);
begin
  FTipoGratificacao := Value;
end;

end.

