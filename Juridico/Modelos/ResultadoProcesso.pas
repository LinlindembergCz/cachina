unit ResultadoProcesso;

interface

uses
   CAtribEntity,  GenericEntidade;

Type
  [TableName('ResultadoProcesso')]
  TResultadoProcesso = class(TGenericEntidade)
  private
    FDescricao: string;
    FCodigo: integer;
    FCodigoFilial: integer;
    procedure SetCodigo(const Value: integer);
    procedure SetCodigoFilial(const Value: integer);
    procedure SetDescricao(const Value: string);

  public
    [KeyField('Codigo')]
    property  Codigo: integer read FCodigo write SetCodigo;
    [FieldName('CodigoFilial')]
    property  CodigoFilial: integer read FCodigoFilial write SetCodigoFilial;
    [FieldName('Descricao')]
    property  Descricao: string read FDescricao write SetDescricao;

  end;

implementation

{ TResultadoProcesso }

procedure TResultadoProcesso.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TResultadoProcesso.SetCodigoFilial(const Value: integer);
begin
  FCodigoFilial := Value;
end;

procedure TResultadoProcesso.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

end.
