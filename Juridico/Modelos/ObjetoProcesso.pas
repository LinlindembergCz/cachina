unit ObjetoProcesso;

interface

uses
   CAtribEntity,  GenericEntidade;

Type
  [TableName('ObjetoProcesso')]
  TObjetoProcesso = class(TGenericEntidade)
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

{ TObjetoProcesso }

procedure TObjetoProcesso.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TObjetoProcesso.SetCodigoFilial(const Value: integer);
begin
  FCodigoFilial := Value;
end;

procedure TObjetoProcesso.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

end.
