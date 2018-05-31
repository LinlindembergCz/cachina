unit ItemDiarioAtividade;

interface

uses
 CAtribEntity,  GenericEntidade, Dialogs;

type
  [TableName('ItemDiarioAtividade')]
  [Modulo('102')]
  TItemDiarioAtividade = class(TGenericEntidade)
  private
    FCodigoSubFase: Integer;
    FCodigo: Integer;
    FCodigoFilial: Integer;
    FCodigoDiarioAtividade: Integer;
    FCodigoEquipe: Integer;
    FCodigoUnidade: integer;
    FCodigoFuncionario: integer;
    FApontamento: Double;
    FHoraFim: string;
    FHoraInicio: string;
    FStatus: string;
    FObservacao: string;
    FDescricaoServico: string;
    FDescricaoEquipe: string;
    FDescricaoUnidade: string;
    procedure SetCodigo(const Value: Integer);
    procedure SetCodigoDiarioAtividade(const Value: Integer);
    procedure SetCodigoEquipe(const Value: Integer);
    procedure SetCodigoFilial(const Value: Integer);
    procedure SetCodigoSubFase(const Value: Integer);
    procedure SetCodigoFuncionario(const Value: integer);
    procedure SetCodigoUnidade(const Value: integer);
    procedure SetApontamento(const Value: Double);
    procedure SetHoraFim(const Value: string);
    procedure SetHoraInicio(const Value: string);
    procedure SetStatus(const Value: string);
    procedure SetObservacao(const Value: string);
    procedure SetDescricaoEquipe(const Value: string);
    procedure SetDescricaoServico(const Value: string);
    procedure SetDescricaoUnidade(const Value: string);
public
  [KeyField('Codigo')]
  property Codigo: Integer read FCodigo write SetCodigo;

  [FieldName('CodigoFilial')]
  property CodigoFilial: Integer read FCodigoFilial write SetCodigoFilial;
  [FieldName('CodigoDiarioAtividade')]
  property CodigoDiarioAtividade: Integer read FCodigoDiarioAtividade write SetCodigoDiarioAtividade;


  [FieldName('CodigoSubFase')]
  property CodigoSubFase: Integer read FCodigoSubFase write SetCodigoSubFase;
  [LogAuditoria('DescricaoServico')]
  property DescricaoServico : string read FDescricaoServico write SetDescricaoServico;
  [FieldName('CodigoEquipe')]
  property CodigoEquipe: Integer read FCodigoEquipe write SetCodigoEquipe;
  [LogAuditoria('DescricaoEquipe')]
  property DescricaoEquipe  : string read FDescricaoEquipe write SetDescricaoEquipe;
  [FieldName('CodigoUnidade')]
  property CodigoUnidade: integer read FCodigoUnidade write SetCodigoUnidade;
  [LogAuditoria('DescricaoUnidade')]
  property DescricaoUnidade : string read FDescricaoUnidade write SetDescricaoUnidade;

  [FieldName('CodigoFuncionario')]
  property CodigoFuncionario: integer read FCodigoFuncionario write SetCodigoFuncionario;
  [FieldName('Apontamento')]
  property Apontamento: Double read FApontamento write SetApontamento;
  [FieldName('HoraInicio')]
  property HoraInicio: string read FHoraInicio write SetHoraInicio;
  [FieldName('HoraFim')]
  property HoraFim: string read FHoraFim write SetHoraFim;
  [FieldName('Status')]
  property Status: string read FStatus write SetStatus;
  [FieldName('Observacao')]
  property Observacao: string read FObservacao write SetObservacao;



end;

implementation

{ TItemDiarioAtividade }

procedure TItemDiarioAtividade.SetApontamento(const Value: Double);
begin
  if (Value >= 0) and (Value <= 100) then
  begin
    FApontamento := Value;
  end
  else
  begin
    FApontamento := 0;
    showmessage('Apontamento fora do intervalo!');
  end;
end;

procedure TItemDiarioAtividade.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TItemDiarioAtividade.SetCodigoDiarioAtividade(const Value: Integer);
begin
  FCodigoDiarioAtividade := Value;
end;

procedure TItemDiarioAtividade.SetCodigoEquipe(const Value: Integer);
begin
  FCodigoEquipe := Value;
end;

procedure TItemDiarioAtividade.SetCodigoFilial(const Value: Integer);
begin
  FCodigoFilial := Value;
end;

procedure TItemDiarioAtividade.SetCodigoFuncionario(const Value: integer);
begin
  FCodigoFuncionario := Value;
end;

procedure TItemDiarioAtividade.SetCodigoSubFase(const Value: Integer);
begin
  FCodigoSubFase := Value;
end;

procedure TItemDiarioAtividade.SetCodigoUnidade(const Value: integer);
begin
  FCodigoUnidade := Value;
end;

procedure TItemDiarioAtividade.SetDescricaoEquipe(const Value: string);
begin
  FDescricaoEquipe := Value;
end;

procedure TItemDiarioAtividade.SetDescricaoServico(const Value: string);
begin
  FDescricaoServico := Value;
end;

procedure TItemDiarioAtividade.SetDescricaoUnidade(const Value: string);
begin
  FDescricaoUnidade := Value;
end;

procedure TItemDiarioAtividade.SetHoraFim(const Value: string);
begin
  FHoraFim := Value;
end;

procedure TItemDiarioAtividade.SetHoraInicio(const Value: string);
begin
  FHoraInicio := Value;
end;


procedure TItemDiarioAtividade.SetObservacao(const Value: string);
begin
  FObservacao := Value;
end;

procedure TItemDiarioAtividade.SetStatus(const Value: string);
begin
  FStatus := Value;
end;

End.

