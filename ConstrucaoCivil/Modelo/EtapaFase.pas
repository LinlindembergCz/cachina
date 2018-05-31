unit EtapaFase;

interface

uses
   CAtribEntity,  GenericEntidade;

Type
  [TableName('Etapa')]
  [Modulo('100')]
  TEtapa = class(TGenericEntidade)
  private
    FDescricao: string;
    FCodigo: integer;
    FCodigoFilial: integer;
    FCodificacao: string;
    FCodigoBaseDados: integer;
    procedure SetCodigo(const Value: integer);
    procedure SetCodigoFilial(const Value: integer);
    procedure SetDescricao(const Value: string);
    procedure SetCodificacao(const Value: string);
    procedure SetCodigoBaseDados(const Value: integer);
  public
    [KeyField('Codigo')]
    property  Codigo: integer read FCodigo write SetCodigo;
    [FieldName('CodigoFilial')]
    property  CodigoFilial: integer read FCodigoFilial write SetCodigoFilial;
    [FieldName('Descricao')]
    property  Descricao: string read FDescricao write SetDescricao;
    [FieldName('Codificacao')]
    property  Codificacao: string read FCodificacao write SetCodificacao;
    [FieldName('CodigoBaseDados')]
    property  CodigoBaseDados: integer read FCodigoBaseDados write SetCodigoBaseDados;


  end;

  [TableName('Fase')]
  [Modulo('100')]
  TFase = class(TGenericEntidade)
  private
    FCodigoEtapa: integer;
    FDescricao: string;
    FCodigo: integer;
    FCodigoFilial: integer;
    FCodificacao: string;
    procedure SetCodigo(const Value: integer);
    procedure SetCodigoEtapa(const Value: integer);
    procedure SetCodigoFilial(const Value: integer);
    procedure SetDescricao(const Value: string);
    procedure SetCodificacao(const Value: string);

  public
    [KeyField('Codigo')]
    property  Codigo: integer read FCodigo write SetCodigo;
    [FieldName('CodigoFilial')]
    property  CodigoFilial: integer read FCodigoFilial write SetCodigoFilial;
    [FieldName('Descricao')]
    property  Descricao: string read FDescricao write SetDescricao;
    [FieldName('CodigoEtapa')]
    property  CodigoEtapa: integer read FCodigoEtapa write SetCodigoEtapa;
        [FieldName('Codificacao')]
    property  Codificacao: string read FCodificacao write SetCodificacao;
  end;

  [TableName('SubFase')]
  [Modulo('100')]
  TSubFase = class(TGenericEntidade)
  private
    FCodigoFase: integer;
    FDescricao: string;
    FCodigo: integer;
    FCodigoFilial: integer;
    FCodificacao: string;
    FValor: double;
    FCodigoUnidade: Integer;
    FPredecessora: string;
    FStatus: string;
    procedure SetCodigo(const Value: integer);
    procedure SetCodigoFase(const Value: integer);
    procedure SetCodigoFilial(const Value: integer);
    procedure SetDescricao(const Value: string);
    procedure SetCodificacao(const Value: string);
    procedure SetValor(const Value: double);
    procedure SetCodigoUnidade(const Value: Integer);
    procedure SetPredecessora(const Value: string);
    procedure SetStatus(const Value: string);
  public
    [KeyField('Codigo')]
    property  Codigo: integer read FCodigo write SetCodigo;
    [FieldName('CodigoFilial')]
    property  CodigoFilial: integer read FCodigoFilial write SetCodigoFilial;
    [FieldName('Descricao')]
    property  Descricao: string read FDescricao write SetDescricao;
    [FieldName('CodigoFase')]
    property  CodigoFase: integer read FCodigoFase write SetCodigoFase;
    [FieldName('Codificacao')]
    property  Codificacao: string read FCodificacao write SetCodificacao;
    [FieldName('Valor')]
    property Valor: double read FValor write SetValor;
    [FieldName('CodigoUnidade')]
    property CodigoUnidade: Integer read FCodigoUnidade write SetCodigoUnidade;
    [FieldName('Predecessora')]
    property Predecessora: string read FPredecessora write SetPredecessora;

    [FieldName('Status')]
    property Status: string read FStatus write SetStatus;
  end;

implementation

{ TEtapa }

procedure TEtapa.SetCodificacao(const Value: string);
begin
  FCodificacao := Value;
end;

procedure TEtapa.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TEtapa.SetCodigoBaseDados(const Value: integer);
begin
  FCodigoBaseDados := Value;
end;

procedure TEtapa.SetCodigoFilial(const Value: integer);
begin
  FCodigoFilial := Value;
end;

procedure TEtapa.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

{ TFase }

procedure TFase.SetCodificacao(const Value: string);
begin
  FCodificacao := Value;
end;

procedure TFase.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TFase.SetCodigoEtapa(const Value: integer);
begin
  FCodigoEtapa := Value;
end;

procedure TFase.SetCodigoFilial(const Value: integer);
begin
  FCodigoFilial := Value;
end;

procedure TFase.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

{ TSubFase }

procedure TSubFase.SetCodificacao(const Value: string);
begin
  FCodificacao := Value;
end;

procedure TSubFase.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TSubFase.SetCodigoFase(const Value: integer);
begin
  FCodigoFase := Value;
end;

procedure TSubFase.SetCodigoFilial(const Value: integer);
begin
  FCodigoFilial := Value;
end;

procedure TSubFase.SetCodigoUnidade(const Value: Integer);
begin
  FCodigoUnidade := Value;
end;

procedure TSubFase.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TSubFase.SetPredecessora(const Value: string);
begin
  FPredecessora := Value;
end;

procedure TSubFase.SetStatus(const Value: string);
begin
  FStatus := Value;
end;

procedure TSubFase.SetValor(const Value: double);
begin
  FValor := Value;
end;

end.
