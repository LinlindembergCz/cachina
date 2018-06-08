unit TabelasProdutos;

interface

uses
   CAtribEntity,  GenericEntidade;

Type
  [TableName('FamiliaProdutos')]
  TFamiliaProdutos = class(TGenericEntidade)
  private
    FCodigoFiliar: integer;
    FDescricao: string;
    FCodigo: integer;
  published
    [KeyField('Codigo')]
    property Codigo:integer read FCodigo write FCodigo;
    [FieldName('CodigoFilial')]
    property CodigoFiliar:integer read FCodigoFiliar write FCodigoFiliar;
    [FieldName('Descricao')]
    property Descricao: string read FDescricao write FDescricao;
  end;

  [TableName('GrupoProdutos')]
  TGrupoProdutos = class(TGenericEntidade)
  private
    FCodigoFiliar: integer;
    FDescricao: string;
    FCodigo: integer;
    FCodigoFamilia: integer;
  published
    [KeyField('Codigo')]
    property Codigo:integer read FCodigo write FCodigo;
    [FieldName('CodigoFilial')]
    property CodigoFiliar:integer read FCodigoFiliar write FCodigoFiliar;
    [FieldName('CodigoFamilia')]
    property CodigoFamilia:integer read FCodigoFamilia write FCodigoFamilia;
    [FieldName('Descricao')]
    property Descricao: string read FDescricao write FDescricao;
  end;

  [TableName('SubGrupoProdutos')]
  TSubGrupoProdutos = class(TGenericEntidade)
  private
    FCodigoFiliar: integer;
    FDescricao: string;
    FCodigo: integer;
    FCodigoGrupo: integer;
  published
    [KeyField('Codigo')]
    property Codigo:integer read FCodigo write FCodigo;
    [FieldName('CodigoFilial')]
    property CodigoFiliar:integer read FCodigoFiliar write FCodigoFiliar;
    [FieldName('CodigoGrupo')]
    property CodigoGrupo:integer read FCodigoGrupo write FCodigoGrupo;
    [FieldName('Descricao')]
    property Descricao: string read FDescricao write FDescricao;
  end;

implementation

{ TFamilia }


end.
