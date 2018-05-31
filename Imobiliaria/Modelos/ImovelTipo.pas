unit ImovelTipo;

interface

uses
 CAtribEntity,  GenericEntidade;

type
  [TableName('ImovelTipo')]
  TImovelTipo = class(TGenericEntidade)
  private
    FDescricao: string;
    FCodigo: Integer;
    FCodigoFilial: Integer;
    procedure SetCodigo(const Value: Integer);
    procedure SetCodigoFilial(const Value: Integer);
    procedure SetDescricao(const Value: string);
public
  [FieldName('Codigo')]
  property Codigo: Integer read FCodigo write SetCodigo;
  [FieldName('CodigoFilial')]
  property CodigoFilial: Integer read FCodigoFilial write SetCodigoFilial;
  [FieldName('Descricao')]
  property Descricao: string read FDescricao write SetDescricao;
end;

implementation

{ TImovelTipo }

procedure TImovelTipo.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TImovelTipo.SetCodigoFilial(const Value: Integer);
begin
  FCodigoFilial := Value;
end;

procedure TImovelTipo.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

End.

