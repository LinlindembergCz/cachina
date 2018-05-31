unit FuncionarioComissao;

interface

uses
 CAtribEntity,  GenericEntidade;

type
  [TableName('FuncionarioComissao')]
  TFuncionarioComissao = class(TGenericEntidade)
  private
    FCodigoProduto: Integer;
    FCodigoFuncionario: Integer;
    FPercentualComissao: Double;
    FCodigoFilial: Integer;
    FValor: Double;
    procedure SetCodigoFuncionario(const Value: Integer);
    procedure SetCodigoProduto(const Value: Integer);
    procedure SetPercentualComissao(const Value: Double);
    procedure SetCodigoFilial(const Value: Integer);
    procedure SetValor(const Value: Double);
  public
    [KeyField('CodigoProduto')]
    [FieldName('CodigoProduto')]
    property CodigoProduto: Integer read FCodigoProduto write SetCodigoProduto;
    [FieldName('CodigoFilial')]
    property CodigoFilial: Integer read FCodigoFilial write SetCodigoFilial;
    [FieldName('PercentualComissao')]
    property PercentualComissao: Double read FPercentualComissao write SetPercentualComissao;
    [FieldName('CodigoFuncionario')]
    property CodigoFuncionario: Integer read FCodigoFuncionario write SetCodigoFuncionario;
    [FieldName('Valor')]
    property Valor:Double read FValor write SetValor;
  end;

implementation

{ TFuncionarioComissao }

procedure TFuncionarioComissao.SetCodigoFilial(const Value: Integer);
begin
  FCodigoFilial := Value;
end;

procedure TFuncionarioComissao.SetCodigoFuncionario(const Value: Integer);
begin
  FCodigoFuncionario := Value;
end;

procedure TFuncionarioComissao.SetCodigoProduto(const Value: Integer);
begin
  FCodigoProduto := Value;
end;

procedure TFuncionarioComissao.SetPercentualComissao(const Value: Double);
begin
  FPercentualComissao := Value;
end;

procedure TFuncionarioComissao.SetValor(const Value: Double);
begin
  FValor := Value;
end;

End.
