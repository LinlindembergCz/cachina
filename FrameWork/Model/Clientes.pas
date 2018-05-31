unit Clientes;

interface

uses
  GenericEntidade, AtributoEntidade;

type
  [TableName('Clientes')]
  TCliente = class(TGenericEntidade)
  private
    FNome: string;
    FCPF: string;
    FEndereco: string;
    FCodigo: string;
    FDescricaoClassificacao: string;
    FCodigoClassificacao: string;
    procedure SetNome(const Value: string);
    procedure SetCPF(const Value: string);
    procedure SetEndereco(const Value: string);
    procedure SetCodigo(const Value: string);
    procedure SetCodigoClassificacao(const Value: string);
    procedure SetDescricaoClassificacao(const Value: string);
  public
    [KeyField('Codigo')]
    [FieldName('Codigo')]
    property Codigo: string read FCodigo write SetCodigo;
    [FieldName('Nome')]
    property Nome: string read FNome write SetNome;
    [FieldName('CPF')]
    property CPF: string read FCPF write SetCPF;
    [FieldName('Endereco')]
    property Endereco: string read FEndereco write SetEndereco;
    [Join('left join Classificacao cla on CodigoClassificacao = cla.Codigo')]
        [FieldName('CodigoClassificacao')]
        property CodigoClassificacao: string read FCodigoClassificacao write SetCodigoClassificacao;
        [ReadOnly('Descricao')]
        property DescricaoClassificacao: string read FDescricaoClassificacao write SetDescricaoClassificacao;
  end;

implementation

procedure TCliente.SetCodigo(const Value: string);
begin
  FCodigo := Value;
end;

procedure TCliente.SetCodigoClassificacao(const Value: string);
begin
  FCodigoClassificacao := Value;
end;

procedure TCliente.SetCPF(const Value: string);
begin
  FCPF := Value;
end;

procedure TCliente.SetDescricaoClassificacao(const Value: string);
begin
  FDescricaoClassificacao := Value;
end;

procedure TCliente.SetEndereco(const Value: string);
begin
  FEndereco := Value;
end;

procedure TCliente.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
