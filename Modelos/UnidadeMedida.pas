unit UnidadeMedida;

interface

uses
   CAtribEntity,  GenericEntidade;

Type
  [TableName('UnidadeMedida')]
  TUnidadeMedida = class(TGenericEntidade)
  private
    FDescricao: string;
    FCodigo: integer;
    FCodigoFilial: integer;
    procedure SetCodigo(const Value: integer);
    procedure SetDescricao(const Value: string);
    procedure SetCodigoFilial(const Value: integer);
  public
    [KeyField('Codigo')]
    property Codigo: integer read FCodigo write SetCodigo;
    [FieldName('CodigoFilial')]
    property CodigoFilial: integer read FCodigoFilial write SetCodigoFilial;
    [FieldName('Descricao')]
    property Descricao: string read FDescricao write SetDescricao;
  end;

implementation

{ TClassificacaoCliente }

procedure TUnidadeMedida.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TUnidadeMedida.SetCodigoFilial(const Value: integer);
begin
  FCodigoFilial := Value;
end;

procedure TUnidadeMedida.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

end.
