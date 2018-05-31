unit Quantitativo;

interface

uses
 CAtribEntity,  GenericEntidade;

type
  [TableName('Quantitativo')]
  [Modulo('101')]
  TQuantitativo = class(TGenericEntidade)
  private
    FCodigoProjetoUnidade: Integer;
    FCodigo: Integer;
    FCodigoFilial: Integer;
    FQuantidade: Integer;
    FCodigoObra: Integer;
    procedure SetCodigo(const Value: Integer);
    procedure SetCodigoFilial(const Value: Integer);
    procedure SetCodigoObra(const Value: Integer);
    procedure SetCodigoProjetoUnidade(const Value: Integer);
    procedure SetQuantidade(const Value: Integer);
public
  [KeyField('Codigo')]
  [FieldName('Codigo')]
  property Codigo: Integer read FCodigo write SetCodigo;
  [FieldName('CodigoFilial')]
  property CodigoFilial: Integer read FCodigoFilial write SetCodigoFilial;
  [FieldName('CodigoObra')]
  property CodigoObra: Integer read FCodigoObra write SetCodigoObra;
  [FieldName('CodigoProjetoUnidade')]
  property CodigoProjetoUnidade: Integer read FCodigoProjetoUnidade write SetCodigoProjetoUnidade;
  [FieldName('Quantidade')]
  property Quantidade: Integer read FQuantidade write SetQuantidade;
end;

implementation

{ TQuantitativo }

procedure TQuantitativo.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TQuantitativo.SetCodigoFilial(const Value: Integer);
begin
  FCodigoFilial := Value;
end;

procedure TQuantitativo.SetCodigoObra(const Value: Integer);
begin
  FCodigoObra := Value;
end;

procedure TQuantitativo.SetCodigoProjetoUnidade(const Value: Integer);
begin
  FCodigoProjetoUnidade := Value;
end;

procedure TQuantitativo.SetQuantidade(const Value: Integer);
begin
  FQuantidade := Value;
end;

End.
