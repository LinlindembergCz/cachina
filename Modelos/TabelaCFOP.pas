unit TabelaCFOP;

interface

uses
 CAtribEntity,  GenericEntidade;

type
  [TableName('TabelaCFOP')]
  TTabelaCFOP = class(TGenericEntidade)
  private
    FCFOP     : string;
    FDescricao: string;
    FGrupo    : string;
    FSubGrupo:  string;
  public
    [FieldName('CFOP')]
    property CFOP     : string read FCFOP write FCFOP;
    [FieldName('Descricao')]
    property Descricao: string read FDescricao write FDescricao;
    [FieldName('Grupo')]
    property Grupo    : string read FGrupo write FGrupo;
    [FieldName('SubGrupo')]
    property SubGrupo:  string read FSubGrupo write FSubGrupo;
  end;

implementation

end.
