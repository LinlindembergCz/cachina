unit Projeto;

interface

uses
 CAtribEntity,  GenericEntidade;

type
  [TableName('Projeto')]
  TProjeto = class(TGenericEntidade)
  private
    FDescricao: string;
    FCodigo: Integer;
    FCodigoFilial: Integer;
    FDescritivo: string;
    procedure SetCodigo(const Value: Integer);
    procedure SetCodigoFilial(const Value: Integer);
    procedure SetDescricao(const Value: string);
    procedure SetDescritivo(const Value: string);
  public
    [KeyField('Codigo')]
    property Codigo: Integer read FCodigo write SetCodigo;
    [FieldName('CodigoFilial')]
    property CodigoFilial: Integer read FCodigoFilial write SetCodigoFilial;
    [FieldName('Descricao')]
    property Descricao: string read FDescricao write SetDescricao;
    [FieldName('Descritivo')]
    property Descritivo: string read FDescritivo write SetDescritivo;
  end;

implementation

{ TProjeto }

procedure TProjeto.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TProjeto.SetCodigoFilial(const Value: Integer);
begin
  FCodigoFilial := Value;
end;

procedure TProjeto.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TProjeto.SetDescritivo(const Value: string);
begin
  FDescritivo := Value;
end;

end.
