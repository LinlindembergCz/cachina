unit Modulo;

interface

uses
   CAtribEntity,  GenericEntidade;

Type
  [TableName('Modulo')]
  TModulo = class(TGenericEntidade)
  private
    FDescricao: string;
    FCodigo: integer;
    procedure SetCodigo(const Value: integer);
    procedure SetDescricao(const Value: string);
  public
    [KeyField('Codigo')]
    property Codigo: integer read FCodigo write SetCodigo;
    [FieldName('Descricao')]
    property Descricao: string read FDescricao write SetDescricao;
  end;


implementation

{ TModulo }

procedure TModulo.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TModulo.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

end.

