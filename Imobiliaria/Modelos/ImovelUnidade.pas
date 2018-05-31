unit ImovelUnidade;

interface

uses
   CAtribEntity,  GenericEntidade;

Type
  [TableName('ImovelUnidade')]
  TImovelUnidade = class(TGenericEntidade)
  private
    FCodigoImovel: string;
    FDescricao: string;
    FCodigo: integer;
    FCodigoFilial: integer;
    FCodigoProjeto: integer;
    procedure SetCodigo(const Value: integer);
    procedure SetCodigoFilial(const Value: integer);
    procedure SetCodigoImovel(const Value: string);
    procedure SetDescricao(const Value: string);
    procedure SetCodigoProjeto(const Value: integer);
  public
    [KeyField('Codigo')]
    property  Codigo: integer read FCodigo write SetCodigo;
    [FieldName('CodigoFilial')]
    property  CodigoFilial: integer read FCodigoFilial write SetCodigoFilial;
    [FieldName('Descricao')]
    property  Descricao: string read FDescricao write SetDescricao;
    [FieldName('CodigoImovel')]
    property  CodigoImovel: string read FCodigoImovel write SetCodigoImovel;
    [FieldName('CodigoProjeto')]
    property CodigoProjeto: integer read FCodigoProjeto write SetCodigoProjeto;
  end;


implementation

{ TImovelUnidade }

procedure TImovelUnidade.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TImovelUnidade.SetCodigoFilial(const Value: integer);
begin
  FCodigoFilial := Value;
end;

procedure TImovelUnidade.SetCodigoImovel(const Value: string);
begin
  FCodigoImovel := Value;
end;

procedure TImovelUnidade.SetCodigoProjeto(const Value: integer);
begin
  FCodigoProjeto := Value;
end;

procedure TImovelUnidade.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

end.
