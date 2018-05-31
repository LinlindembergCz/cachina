unit ItemQuantitativo;

interface

uses
 CAtribEntity,  GenericEntidade;

type
  [TableName('ItemQuantitativo')]
  TItemQuantitativo = class(TGenericEntidade)
  private
    FCodigo: Integer;
    FCodigoFilial: Integer;
    FCodigoSubFase: Integer;
    FCodigoQuantitativo: Integer;
    FQuantidade: Double;
    FOrdem: Integer;
    FDescritivo: string;
    procedure SetCodigo(const Value: Integer);
    procedure SetCodigoFilial(const Value: Integer);
    procedure SetCodigoQuantitativo(const Value: Integer);
    procedure SetCodigoSubFase(const Value: Integer);
    procedure SetOrdem(const Value: Integer);
    procedure SetQuantidade(const Value: Double);
    procedure SetDescritivo(const Value: string);
public
  [KeyField('Codigo')]
  property Codigo: Integer read FCodigo write SetCodigo;
  [FieldName('CodigoFilial')]
  property CodigoFilial: Integer read FCodigoFilial write SetCodigoFilial;
  [FieldName('Ordem')]
  property Ordem: Integer read FOrdem write SetOrdem;
  [FieldName('CodigoQuantitativo')]
  property CodigoQuantitativo: Integer read FCodigoQuantitativo write SetCodigoQuantitativo;
  [FieldName('CodigoSubFase')]
  property CodigoSubFase: Integer read FCodigoSubFase write SetCodigoSubFase;
  [FieldName('Quantidade')]
  property Quantidade: Double read FQuantidade write SetQuantidade;
  [FieldName('Descritivo')]
  property Descritivo: string read FDescritivo write SetDescritivo;
end;

implementation

{ TItemQuantitativo }

procedure TItemQuantitativo.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TItemQuantitativo.SetCodigoFilial(const Value: Integer);
begin
  FCodigoFilial := Value;
end;

procedure TItemQuantitativo.SetCodigoQuantitativo(const Value: Integer);
begin
  FCodigoQuantitativo := Value;
end;

procedure TItemQuantitativo.SetCodigoSubFase(const Value: Integer);
begin
  FCodigoSubFase := Value;
end;

procedure TItemQuantitativo.SetDescritivo(const Value: string);
begin
  FDescritivo := Value;
end;

procedure TItemQuantitativo.SetOrdem(const Value: Integer);
begin
  FOrdem := Value;
end;

procedure TItemQuantitativo.SetQuantidade(const Value: Double);
begin
  FQuantidade := Value;
end;

End.

