unit Funcionarios;

interface

uses
   CAtribEntity,  GenericEntidade;

Type
  [TableName('Funcionarios')]
  [Modulo('5')]
  TFuncionarios = class(TGenericEntidade)
  private
    FEmail: string;
    FCodigo: integer;
    FCPF: string;
    FCodigoFilial: integer;
    FSenha: string;
    FCodigoCargo: integer;
    FTelefone: string;
    FData: TDatetime;
    FComissao: Double;
    FLogin: string;
    FNome: string;
    FBanco: string;
    FConta: string;
    FAgencia: string;
    FSituacao: string;
    FGratificacao: Double;
    FTipoGratificacao: string;
    FSalarioBase: Double;
    procedure SetCodigoCargo(const Value: integer);
    procedure SetCodigo(const Value: integer);
    procedure SetCodigoFilial(const Value: integer);
    procedure SetCPF(const Value: string);
    procedure SetData(const Value: TDatetime);
    procedure SetEmail(const Value: string);
    procedure SetSenha(const Value: string);
    procedure SetTelefone(const Value: string);
    procedure SetComissao(const Value: Double);
    procedure SetLogin(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetAgencia(const Value: string);
    procedure SetBanco(const Value: string);
    procedure SetConta(const Value: string);
    procedure SetSituacao(const Value: string);
    procedure SetGratificacao(const Value: Double);
    procedure SetTipoGratificacao(const Value: string);
    procedure SetSalarioBase(const Value: Double);
  public
    [KeyField('Codigo')]
    property Codigo: integer read FCodigo write SetCodigo;
    [FieldName('CodigoFilial')]
    property CodigoFilial: integer read FCodigoFilial write SetCodigoFilial;
    [FieldName('Nome')]
    property Nome : string read FNome write SetNome;
    [FieldName('Data')]
    property Data :TDatetime read FData write SetData;
    [FieldName('Comissao')]
    property Comissao : Double read FComissao write SetComissao;
    [FieldName('Login')]
    property Login : string read FLogin write SetLogin;
    [FieldName('Senha')]
    property Senha : string read FSenha write SetSenha;
    [FieldName('Telefone')]
    property Telefone : string read FTelefone write SetTelefone;
    [FieldName('Email')]
    property Email: string read FEmail write SetEmail;
    [FieldName('CPF')]
    property CPF: string read FCPF write SetCPF;
    [FieldName('Banco')]
    property Banco: string read FBanco write SetBanco;
    [FieldName('Agencia')]
    property Agencia: string read FAgencia write SetAgencia;
    [FieldName('Conta')]
    property Conta: string read FConta write SetConta;
    [FieldName('CodigoCargo')]
    property CodigoCargo:integer read FCodigoCargo write SetCodigoCargo;
    [FieldName('Situacao')]
    property Situacao: string read FSituacao write SetSituacao;
    [FieldName('Gratificacao')]
    property Gratificacao: Double read FGratificacao write SetGratificacao;
    [FieldName('TipoGratificacao')]
    property TipoGratificacao: string read FTipoGratificacao write SetTipoGratificacao;
    [FieldName('SalarioBase')]
    property SalarioBase:Double read FSalarioBase write SetSalarioBase;
  end;

  [TableName('FuncionarioFaltas')]
  [Modulo('5')]
  TFuncionarioFaltas = class(TGenericEntidade)
  private
    FObservacao: string;
    FCodigoFuncionario: integer;
    FTipo: string;
    FData: TDatetime;
    FDias: integer;
    procedure SetCodigoFuncionario(const Value: integer);
    procedure SetData(const Value: TDatetime);
    procedure SetObservacao(const Value: string);
    procedure SetTipo(const Value: string);
    procedure SetDias(const Value: integer);
  public
    [KeyField('CodigoFuncionario')]
    [FieldName('CodigoFuncionario')]
    property CodigoFuncionario: integer read FCodigoFuncionario write SetCodigoFuncionario;
    [KeyField('Data')]
    [FieldName('Data')]
    property Data:TDatetime read FData write SetData;
    [FieldName('Observacao')]
    property Observacao: string read FObservacao write SetObservacao;
    [FieldName('Tipo')]
    property Tipo : string read FTipo write SetTipo;
    [FieldName('Dias')]
    property Dias : integer read FDias write SetDias;

  end;

implementation

{ TFuncionarios }

procedure TFuncionarios.SetAgencia(const Value: string);
begin
  FAgencia := Value;
end;

procedure TFuncionarios.SetBanco(const Value: string);
begin
  FBanco := Value;
end;

procedure TFuncionarios.SetCodigoCargo(const Value: integer);
begin
  FCodigoCargo := Value;
end;

procedure TFuncionarios.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TFuncionarios.SetCodigoFilial(const Value: integer);
begin
  FCodigoFilial := Value;
end;

procedure TFuncionarios.SetComissao(const Value: Double);
begin
  FComissao := Value;
end;

procedure TFuncionarios.SetConta(const Value: string);
begin
  FConta := Value;
end;

procedure TFuncionarios.SetCPF(const Value: string);
begin
  FCPF := Value;
end;

procedure TFuncionarios.SetData(const Value: TDatetime);
begin
  FData := Value;
end;

procedure TFuncionarios.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TFuncionarios.SetGratificacao(const Value: Double);
begin
  FGratificacao := Value;
end;

procedure TFuncionarios.SetLogin(const Value: string);
begin
  FLogin := Value;
end;

procedure TFuncionarios.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TFuncionarios.SetSalarioBase(const Value: Double);
begin
  FSalarioBase := Value;
end;

procedure TFuncionarios.SetSenha(const Value: string);
begin
  FSenha := Value;
end;

procedure TFuncionarios.SetSituacao(const Value: string);
begin
  FSituacao := Value;
end;

procedure TFuncionarios.SetTelefone(const Value: string);
begin
  FTelefone := Value;
end;

procedure TFuncionarios.SetTipoGratificacao(const Value: string);
begin
  FTipoGratificacao := Value;
end;

{ TFuncionarioFaltas }

procedure TFuncionarioFaltas.SetCodigoFuncionario(const Value: integer);
begin
  FCodigoFuncionario := Value;
end;

procedure TFuncionarioFaltas.SetData(const Value: TDatetime);
begin
  FData := Value;
end;

procedure TFuncionarioFaltas.SetDias(const Value: integer);
begin
  FDias := Value;
end;

procedure TFuncionarioFaltas.SetObservacao(const Value: string);
begin
  FObservacao := Value;
end;

procedure TFuncionarioFaltas.SetTipo(const Value: string);
begin
  FTipo := Value;
end;

end.
