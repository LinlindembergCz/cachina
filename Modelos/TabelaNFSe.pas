unit TabelaNFSe;

interface

uses
 CAtribEntity,  GenericEntidade;

type
  [TableName('TabelaNFSe')]
  TTabelaNFSe= class(TGenericEntidade)
  private
    FDescricao: string;
    FCodigo: Integer;
    FCodigoFilial: Integer;
    FCodigoNFSe: string;
    procedure SetCodigo(const Value: Integer);
    procedure SetCodigoFilial(const Value: Integer);
    procedure SetCodigoNFSe(const Value: string);
    procedure SetDescricao(const Value: string);
  public
    [KeyField('Codigo')]
    property Codigo: Integer read FCodigo write SetCodigo;
    [FieldName('CodigoFilial')]
    property CodigoFilial: Integer read FCodigoFilial write SetCodigoFilial;
    [FieldName('Descricao')]
    property Descricao: string read FDescricao write SetDescricao;
    [FieldName('CodigoNFSe')]
    property CodigoNFSe: string read FCodigoNFSe write SetCodigoNFSe;
  end;

implementation

{ TTabelaNFSe }

procedure TTabelaNFSe.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TTabelaNFSe.SetCodigoFilial(const Value: Integer);
begin
  FCodigoFilial := Value;
end;

procedure TTabelaNFSe.SetCodigoNFSe(const Value: string);
begin
  FCodigoNFSe := Value;
end;

procedure TTabelaNFSe.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

end.
