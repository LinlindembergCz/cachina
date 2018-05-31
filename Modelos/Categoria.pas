unit Categoria;

interface

uses
 CAtribEntity,  GenericEntidade;

type
  [TableName('Categorias')]
  [Modulo('9')]
  TCategoria = class(TGenericEntidade)
  private
    FDescricao: string;
    FCodigo: Integer;
    FCodigoFilial: Integer;
    FCodificacao: string;
    FTipo: string;
  public
    [KeyField('Codigo')]
    property Codigo: Integer read FCodigo write FCodigo;
    [FieldName('CodigoFilial')]
    property CodigoFilial: Integer read FCodigoFilial write FCodigoFilial;
    [FieldName('Descricao')]
    property Descricao: string read FDescricao write FDescricao;
    [FieldName('Codificacao')]
    property Codificacao: string read FCodificacao write FCodificacao;
    [FieldName('Tipo')]
    property Tipo: string read FTipo write FTipo;
  end;

implementation

{ TCategoria }



End.

