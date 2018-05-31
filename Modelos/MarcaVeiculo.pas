unit MarcaVeiculo;

interface

uses
   CAtribEntity,  GenericEntidade;

type
  [TableName('MarcaVeiculo')]
  TMarcaVeiculo = class(TGenericEntidade)
  private
    FDescricao: string;
    FCodigo: Integer;
    FCodigoFilial: integer;
    procedure SetCodigo(const Value: Integer);
    procedure SetCodigoFilial(const Value: integer);
    procedure SetDescricao(const Value: string);
  public
    [KeyField('Codigo')]
    property Codigo: Integer read FCodigo write SetCodigo;
    [FieldName('CodigoFilial')]
    property CodigoFilial:integer read FCodigoFilial write SetCodigoFilial;
    [FieldName('Descricao')]
    property Descricao: string read FDescricao write SetDescricao;
  end;

implementation

{ TMarcaVeiculo }

procedure TMarcaVeiculo.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TMarcaVeiculo.SetCodigoFilial(const Value: integer);
begin
  FCodigoFilial := Value;
end;

procedure TMarcaVeiculo.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

end.
