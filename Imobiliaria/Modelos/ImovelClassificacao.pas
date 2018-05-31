unit ImovelClassificacao;

interface

uses
 CAtribEntity,  GenericEntidade;

type
  [TableName('ImovelClassificacao')]
  TImovelClassificacao = class(TGenericEntidade)
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

{ TImovelCaracteristica }

procedure TImovelClassificacao.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TImovelClassificacao.SetCodigoFilial(const Value: Integer);
begin
  FCodigoFilial := Value;
end;

procedure TImovelClassificacao.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

End.

