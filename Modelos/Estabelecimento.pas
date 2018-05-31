unit Estabelecimento;

interface

uses
 CAtribEntity,  GenericEntidade;

type
  [TableName('Estabelecimento')]
  TEstabelecimento = class(TGenericEntidade)
  private
    FCNPJ: string;
    FBairro: string;
    FUF: string;
    FDescricao: string;
    FCodigo: integer;
    FNumero: string;
    FMunicipio: string;
    FEndereco: string;
    procedure SetBairro(const Value: string);
    procedure SetCNPJ(const Value: string);
    procedure SetCodigo(const Value: integer);
    procedure SetDescricao(const Value: string);
    procedure SetEndereco(const Value: string);
    procedure SetMunicipio(const Value: string);
    procedure SetNumero(const Value: string);
    procedure SetUF(const Value: string);
  public
    [KeyField('Codigo')]
    property Codigo: integer read FCodigo write SetCodigo;
    [FieldName('Descricao')]
    property Descricao: string read FDescricao write SetDescricao;
    [FieldName('Endereco')]
    property Endereco: string read FEndereco write SetEndereco;
    [FieldName('Bairro')]
    property Bairro : string read FBairro write SetBairro;
    [FieldName('Municipio')]
    property Municipio: string read FMunicipio write SetMunicipio;
    [FieldName('UF')]
    property UF     : string read FUF write SetUF;
    [FieldName('Numero')]
    property Numero : string read FNumero write SetNumero;
    [FieldName('CNPJ')]
    property CNPJ   : string read FCNPJ write SetCNPJ;
  end;

implementation

{ TEstabelecimento }

procedure TEstabelecimento.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TEstabelecimento.SetCNPJ(const Value: string);
begin
  FCNPJ := Value;
end;

procedure TEstabelecimento.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TEstabelecimento.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TEstabelecimento.SetEndereco(const Value: string);
begin
  FEndereco := Value;
end;

procedure TEstabelecimento.SetMunicipio(const Value: string);
begin
  FMunicipio := Value;
end;

procedure TEstabelecimento.SetNumero(const Value: string);
begin
  FNumero := Value;
end;

procedure TEstabelecimento.SetUF(const Value: string);
begin
  FUF := Value;
end;

end.
