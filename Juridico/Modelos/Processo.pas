unit Processo;

interface

uses
 CAtribEntity,  GenericEntidade;

type
  [TableName('Processo')]
  TProcesso = class(TGenericEntidade)
  private
    FCodigoResultado: Integer;
    FObservacao: string;
    FValorFinal: Double;
    FCodigoObjeto: Integer;
    FCodigoDistribuicao: Integer;
    FCodigoTipoAcao: Integer;
    FCodigoAdvogado: Integer;
    FCodigo: Integer;
    FValorPedido: Double;
    FCodigoFilial: Integer;
    FNumero: string;
    FRiscoPerda: Double;
    FValorProvisionado: Double;
    FDataInicio: TDatetime;
    FDataEncerramento: TDatetime;
    FCodigoContrario: Integer;
    FCodigoCliente: Integer;
    FValorCausa: Double;
    FCodigoFaseAtual: Integer;
    FCodigoAreaJuridica: Integer;
    FParticipacao: Double;
    procedure SetCodigo(const Value: Integer);
    procedure SetCodigoAdvogado(const Value: Integer);
    procedure SetCodigoAreaJuridica(const Value: Integer);
    procedure SetCodigoCliente(const Value: Integer);
    procedure SetCodigoContrario(const Value: Integer);
    procedure SetCodigoDistribuicao(const Value: Integer);
    procedure SetCodigoFaseAtual(const Value: Integer);
    procedure SetCodigoFilial(const Value: Integer);
    procedure SetCodigoObjeto(const Value: Integer);
    procedure SetCodigoResultado(const Value: Integer);
    procedure SetCodigoTipoAcao(const Value: Integer);
    procedure SetDataEncerramento(const Value: TDatetime);
    procedure SetDataInicio(const Value: TDatetime);
    procedure SetNumero(const Value: string);
    procedure SetObservacao(const Value: string);
    procedure SetParticipacao(const Value: Double);
    procedure SetRiscoPerda(const Value: Double);
    procedure SetValorCausa(const Value: Double);
    procedure SetValorFinal(const Value: Double);
    procedure SetValorPedido(const Value: Double);
    procedure SetValorProvisionado(const Value: Double);
public
  [KeyField('Codigo')]
  property Codigo: Integer read FCodigo write SetCodigo;
  [FieldName('CodigoFilial')]
  property CodigoFilial: Integer read FCodigoFilial write SetCodigoFilial;
  [FieldName('Numero')]
  property Numero: string read FNumero write SetNumero;
  [FieldName('CodigoCliente')]
  property CodigoCliente: Integer read FCodigoCliente write SetCodigoCliente;
  [FieldName('CodigoAdvogado')]
  property CodigoAdvogado: Integer read FCodigoAdvogado write SetCodigoAdvogado;
  [FieldName('CodigoContrario')]
  property CodigoContrario: Integer read FCodigoContrario write SetCodigoContrario;
  [FieldName('CodigoObjeto')]
  property CodigoObjeto: Integer read FCodigoObjeto write SetCodigoObjeto;
  [FieldName('CodigoTipoAcao')]
  property CodigoTipoAcao: Integer read FCodigoTipoAcao write SetCodigoTipoAcao;
  [FieldName('CodigoFaseAtual')]
  property CodigoFaseAtual: Integer read FCodigoFaseAtual write SetCodigoFaseAtual;
  [FieldName('CodigoDistribuicao')]
  property CodigoDistribuicao: Integer read FCodigoDistribuicao write SetCodigoDistribuicao;
  [FieldName('CodigoAreaJuridica')]
  property CodigoAreaJuridica: Integer read FCodigoAreaJuridica write SetCodigoAreaJuridica;
  [FieldName('DataInicio')]
  property DataInicio: TDatetime read FDataInicio write SetDataInicio;
  [FieldName('Observacao')]
  property Observacao: string read FObservacao write SetObservacao;
  [FieldName('Participacao')]
  property Participacao: Double read FParticipacao write SetParticipacao;
  [FieldName('CodigoResultado')]
  property CodigoResultado: Integer read FCodigoResultado write SetCodigoResultado;
  [FieldName('DataEncerramento')]
  property DataEncerramento: TDatetime read FDataEncerramento write SetDataEncerramento;
  [FieldName('ValorCausa')]
  property ValorCausa: Double read FValorCausa write SetValorCausa;
  [FieldName('ValorPedido')]
  property ValorPedido: Double read FValorPedido write SetValorPedido;
  [FieldName('ValorProvisionado')]
  property ValorProvisionado: Double read FValorProvisionado write SetValorProvisionado;
  [FieldName('ValorFinal')]
  property ValorFinal: Double read FValorFinal write SetValorFinal;
  [FieldName('RiscoPerda')]
  property RiscoPerda: Double read FRiscoPerda write SetRiscoPerda;
end;

implementation

{ TProcesso }

procedure TProcesso.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TProcesso.SetCodigoAdvogado(const Value: Integer);
begin
  FCodigoAdvogado := Value;
end;

procedure TProcesso.SetCodigoAreaJuridica(const Value: Integer);
begin
  FCodigoAreaJuridica := Value;
end;

procedure TProcesso.SetCodigoCliente(const Value: Integer);
begin
  FCodigoCliente := Value;
end;

procedure TProcesso.SetCodigoContrario(const Value: Integer);
begin
  FCodigoContrario := Value;
end;

procedure TProcesso.SetCodigoDistribuicao(const Value: Integer);
begin
  FCodigoDistribuicao := Value;
end;

procedure TProcesso.SetCodigoFaseAtual(const Value: Integer);
begin
  FCodigoFaseAtual := Value;
end;

procedure TProcesso.SetCodigoFilial(const Value: Integer);
begin
  FCodigoFilial := Value;
end;

procedure TProcesso.SetCodigoObjeto(const Value: Integer);
begin
  FCodigoObjeto := Value;
end;

procedure TProcesso.SetCodigoResultado(const Value: Integer);
begin
  FCodigoResultado := Value;
end;

procedure TProcesso.SetCodigoTipoAcao(const Value: Integer);
begin
  FCodigoTipoAcao := Value;
end;

procedure TProcesso.SetDataEncerramento(const Value: TDatetime);
begin
  FDataEncerramento := Value;
end;

procedure TProcesso.SetDataInicio(const Value: TDatetime);
begin
  FDataInicio := Value;
end;

procedure TProcesso.SetNumero(const Value: string);
begin
  FNumero := Value;
end;

procedure TProcesso.SetObservacao(const Value: string);
begin
  FObservacao := Value;
end;

procedure TProcesso.SetParticipacao(const Value: Double);
begin
  FParticipacao := Value;
end;

procedure TProcesso.SetRiscoPerda(const Value: Double);
begin
  FRiscoPerda := Value;
end;

procedure TProcesso.SetValorCausa(const Value: Double);
begin
  FValorCausa := Value;
end;

procedure TProcesso.SetValorFinal(const Value: Double);
begin
  FValorFinal := Value;
end;

procedure TProcesso.SetValorPedido(const Value: Double);
begin
  FValorPedido := Value;
end;

procedure TProcesso.SetValorProvisionado(const Value: Double);
begin
  FValorProvisionado := Value;
end;

End.
