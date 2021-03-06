unit Contatos;

interface

uses
   CAtribEntity,  GenericEntidade;

Type
  [TableName('Contatos')]
  TContatos = class(TGenericEntidade)
  private
    FCodigo: integer;
    FAutorizado: string;
    FCodigofilial: integer;
    FNome: string;
    FTelefone: string;
    FCodigoCliente: integer;
    FCPF: string;
    procedure SetAutorizado(const Value: string);
    procedure SetCodigo(const Value: integer);
    procedure SetCodigofilial(const Value: integer);
    procedure SetCodigoCliente(const Value: integer);
    procedure SetNome(const Value: string);
    procedure SetTelefone(const Value: string);
    procedure SetCPF(const Value: string);
  public
    [KeyField('Codigo')]
   	property Codigo: integer read FCodigo write SetCodigo;
    [FieldName('CodigoFilial')]
	  property Codigofilial:integer read FCodigofilial write SetCodigofilial;
    [FieldName('CodigoCliente')]
    property CodigoCliente: integer read FCodigoCliente write SetCodigoCliente;
    [FieldName('Nome')]
	  property Nome: string read FNome write SetNome;
    [FieldName('Telefone')]
	  property Telefone: string read FTelefone write SetTelefone;
    [FieldName('Autorizado')]
	  property Autorizado: string read FAutorizado write SetAutorizado;
    [FieldName('CPF')]
    property CPF:string read FCPF write SetCPF;
  end;


implementation

{ TContatos }

procedure TContatos.SetAutorizado(const Value: string);
begin
  FAutorizado := Value;
end;

procedure TContatos.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TContatos.SetCodigoCliente(const Value: integer);
begin
  FCodigoCliente := Value;
end;

procedure TContatos.SetCodigofilial(const Value: integer);
begin
  FCodigofilial := Value;
end;

procedure TContatos.SetCPF(const Value: string);
begin
  FCPF := Value;
end;

procedure TContatos.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TContatos.SetTelefone(const Value: string);
begin
  FTelefone := Value;
end;

end.
