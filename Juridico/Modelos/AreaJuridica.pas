unit AreaJuridica;

interface

uses
   CAtribEntity,  GenericEntidade;

Type
  [TableName('AreaJuridicaProcesso')]
  TAreaJuridica = class(TGenericEntidade)
  private
    FDescricao: string;
    FCodigo: integer;
    FCodigoFilial: integer;
    procedure SetCodigo(const Value: integer);
    procedure SetCodigoFilial(const Value: integer);
    procedure SetDescricao(const Value: string);

  public
    [KeyField('Codigo')]
    property  Codigo: integer read FCodigo write SetCodigo;
    [FieldName('CodigoFilial')]
    property  CodigoFilial: integer read FCodigoFilial write SetCodigoFilial;
    [FieldName('Descricao')]
    property  Descricao: string read FDescricao write SetDescricao;

  end;

implementation

{ TAreaJuridica }

procedure TAreaJuridica.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TAreaJuridica.SetCodigoFilial(const Value: integer);
begin
  FCodigoFilial := Value;
end;

procedure TAreaJuridica.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

end.
