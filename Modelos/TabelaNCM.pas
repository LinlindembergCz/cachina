unit TabelaNCM;

interface

uses
 CAtribEntity,  GenericEntidade;

type
  [TableName('TabelaNCM')]
  TTabelaNCM = class(TGenericEntidade)
  private
    FDescricao: string;
    FCodigo: Integer;
    FCodigoFilial: Integer;
    FCodigoNCM: string;
    procedure SetCodigo(const Value: Integer);
    procedure SetCodigoFilial(const Value: Integer);
    procedure SetCodigoNCM(const Value: string);
    procedure SetDescricao(const Value: string);
  public
    [KeyField('Codigo')]
    property Codigo: Integer read FCodigo write SetCodigo;
    [FieldName('CodigoFilial')]
    property CodigoFilial: Integer read FCodigoFilial write SetCodigoFilial;
    [FieldName('Descricao')]
    property Descricao: string read FDescricao write SetDescricao;
    [FieldName('CodigoNCM')]
    property CodigoNCM: string read FCodigoNCM write SetCodigoNCM;
  end;

implementation

{ TTabelaNCM }

procedure TTabelaNCM.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TTabelaNCM.SetCodigoFilial(const Value: Integer);
begin
  FCodigoFilial := Value;
end;

procedure TTabelaNCM.SetCodigoNCM(const Value: string);
begin
  FCodigoNCM := Value;
end;

procedure TTabelaNCM.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

end.
