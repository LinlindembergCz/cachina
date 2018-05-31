unit Cargo;

interface

uses
   CAtribEntity,  GenericEntidade;

Type
  [TableName('Cargos')]
  TCargo = class(TGenericEntidade)
  private
    FDescricao: string;
    FCodigo: integer;
    FCodigoFilial: integer;
    FTemProducao: string;
    procedure SetCodigo(const Value: integer);
    procedure SetCodigoFilial(const Value: integer);
    procedure SetDescricao(const Value: string);
    procedure SetTemProducao(const Value: string);
  public
    [KeyField('Codigo')]
    property Codigo: integer read FCodigo write SetCodigo;
    [FieldName('CodigoFilial')]
    property CodigoFilial: integer read FCodigoFilial write SetCodigoFilial;
    [FieldName('Descricao')]
    property Descricao: string read FDescricao write SetDescricao;
    [FieldName('TemProducao')]
    property TemProducao: string read FTemProducao write SetTemProducao;
  end;


implementation


{ TCargo }

procedure TCargo.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TCargo.SetCodigoFilial(const Value: integer);
begin
  FCodigoFilial := Value;
end;

procedure TCargo.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TCargo.SetTemProducao(const Value: string);
begin
  FTemProducao := Value;
end;

end.

