unit Especialista;

interface

uses
 CAtribEntity,  GenericEntidade;

type
  [TableName('Especialista')]
  TEspecialista = class(TGenericEntidade)
  private
    FCodigo: Integer;
    FNumero: string;
    FDescricao: string;
    FNumeroOperadora: string;
    FConselho: string;
    FAdministrador: string;
    FSenha: string;
    FLogin: string;
    procedure SetCodigo(const Value: Integer);
    procedure SetDescricao(const Value: string);
    procedure SetNumero(const Value: string);
    procedure SetNumeroOperadora(const Value: string);
    procedure SetConselho(const Value: string);
    procedure SetAdministrador(const Value: string);
    procedure SetLogin(const Value: string);
    procedure SetSenha(const Value: string);
  public
    [KeyField('Codigo')]
    property Codigo: Integer read FCodigo write SetCodigo;
    [FieldName('Descricao')]
    property Descricao: string read FDescricao write SetDescricao;
    [FieldName('Numero')]
    property Numero: string read FNumero write SetNumero;
    [FieldName('NumeroOperadora')]
    property NumeroOperadora: string read FNumeroOperadora write SetNumeroOperadora;
    [FieldName('Conselho')]
    property Conselho: string read FConselho write SetConselho;
    [FieldName('Login')]
    property Login: string read FLogin write SetLogin;
    [FieldName('Senha')]
    property Senha: string read FSenha write SetSenha;
    [FieldName('Administrador')]
    property Administrador: string read FAdministrador write SetAdministrador;
  end;

  [TableName('EspecialistaConvenio')]
  TEspecialistaConvenio = class(TGenericEntidade)
  private
    FCodigo: integer;
    FCodigoConvenio: integer;
    FMatricula: string;
    FCodigoEspecialista: integer;
    procedure SetCodigo(const Value: integer);
    procedure SetCodigoConvenio(const Value: integer);
    procedure SetCodigoEspecialista(const Value: integer);
    procedure SetMatricula(const Value: string);
  public
    [KeyField('Codigo')]
    property Codigo:integer read FCodigo write SetCodigo;
    [FieldName('CodigoEspecialista')]
    property CodigoEspecialista: integer read FCodigoEspecialista write SetCodigoEspecialista;
    [FieldName('CodigoConvenio')]
    property CodigoConvenio : integer read FCodigoConvenio write SetCodigoConvenio;
    [FieldName('Matricula')]
    property Matricula: string read FMatricula write SetMatricula;
  end;

implementation

{ TEspcialista }

procedure TEspecialista.SetAdministrador(const Value: string);
begin
  FAdministrador := Value;
end;

procedure TEspecialista.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TEspecialista.SetConselho(const Value: string);
begin
  FConselho := Value;
end;

procedure TEspecialista.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TEspecialista.SetLogin(const Value: string);
begin
  FLogin := Value;
end;

procedure TEspecialista.SetNumero(const Value: string);
begin
  FNumero := Value;
end;

procedure TEspecialista.SetNumeroOperadora(const Value: string);
begin
  FNumeroOperadora := Value;
end;

procedure TEspecialista.SetSenha(const Value: string);
begin
  FSenha := Value;
end;

{ TEspecialistaConvenio }

procedure TEspecialistaConvenio.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TEspecialistaConvenio.SetCodigoConvenio(const Value: integer);
begin
  FCodigoConvenio := Value;
end;

procedure TEspecialistaConvenio.SetCodigoEspecialista(const Value: integer);
begin
  FCodigoEspecialista := Value;
end;

procedure TEspecialistaConvenio.SetMatricula(const Value: string);
begin
  FMatricula := Value;
end;

End.


