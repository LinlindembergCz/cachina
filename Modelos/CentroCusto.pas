unit CentroCusto;

interface

uses
 CAtribEntity,  GenericEntidade;

type
  [TableName('CentroCusto')]
    TCentroCusto = class(TGenericEntidade)
  private
    FDescricao: string;
    FCodigo: Integer;
    FCodigoFilial: Integer;
  public
    [KeyField('Codigo')]
    property Codigo: Integer read FCodigo write FCodigo;
    [FieldName('CodigoFilial')]
    property CodigoFilial: Integer read FCodigoFilial write FCodigoFilial;
    [FieldName('Descricao')]
    property Descricao: string read FDescricao write FDescricao;
  end;

implementation

{ TCentroCusto }

End.

