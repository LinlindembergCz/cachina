unit Log;

interface

uses
   CAtribEntity,  GenericEntidade;

Type
  [TableName('Log')]
  TLog = class(TGenericEntidade)
  private
    FDesconto: Double;
    FDescricao: string;
    FCodigo: integer;
    FCodigoFilial: integer;
    FCodigoModulo: integer;
    FCodigoChavePrimaria: integer;
    FCodigoFuncionario: integer;
    FData: Tdatetime;
    FOperacao: string;
    procedure SetCodigo(const Value: integer);
    procedure SetCodigoChavePrimaria(const Value: integer);
    procedure SetCodigoFuncionario(const Value: integer);
    procedure SetCodigoModulo(const Value: integer);
    procedure SetData(const Value: Tdatetime);
    procedure SetDescricao(const Value: string);
    procedure SetOperacao(const Value: string);
  public
    [KeyField('Codigo')]
    property Codigo: integer read FCodigo write SetCodigo;
    [FieldName('Data')]
    property Data:Tdatetime read FData write SetData;
    [FieldName('Descricao')]
    property Descricao: string read FDescricao write SetDescricao;
    [FieldName('CodigoModulo')]
    property CodigoModulo: integer read FCodigoModulo write SetCodigoModulo;
    [FieldName('CodigoFuncionario')]
    property CodigoFuncionario: integer read FCodigoFuncionario write SetCodigoFuncionario;
    [FieldName('CodigoChavePrimaria')]
    property CodigoChavePrimaria: integer read FCodigoChavePrimaria write SetCodigoChavePrimaria;
    [FieldName('Operacao')]
    property Operacao: string read FOperacao write SetOperacao;
  end;


implementation

{ TLog }

procedure TLog.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TLog.SetCodigoChavePrimaria(const Value: integer);
begin
  FCodigoChavePrimaria := Value;
end;

procedure TLog.SetCodigoFuncionario(const Value: integer);
begin
  FCodigoFuncionario := Value;
end;

procedure TLog.SetCodigoModulo(const Value: integer);
begin
  FCodigoModulo := Value;
end;

procedure TLog.SetData(const Value: Tdatetime);
begin
  FData := Value;
end;

procedure TLog.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TLog.SetOperacao(const Value: string);
begin
  FOperacao := Value;
end;

end.
