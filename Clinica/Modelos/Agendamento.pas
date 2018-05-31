unit Agendamento;

interface

uses
 CAtribEntity,  GenericEntidade;

type
  [TableName('Agendamento')]
  TAgendamento = class(TGenericEntidade)
  private
    FNomePaciente: string;
    FHora: string;
    FCodigo: Integer;
    FCodigoTipoAgendamento: Integer;
    FData: TDatetime;
    FTelefone: string;
    FCodigoEspecialista: integer;
    FSituacao: string;
    FCodigoEncaminhado: integer;
    FCodigoPaciente: integer;
    FCodigoConvenio: integer;
    FQuantidadeSessoes: integer;
    FCodigoTabelaCID: integer;
    FAutorizacao: string;
    FCodigoHospital: integer;
    procedure SetCodigo(const Value: Integer);
    procedure SetCodigoTipoAgendamento(const Value: Integer);
    procedure SetData(const Value: TDatetime);
    procedure SetHora(const Value: string);
    procedure SetNomePaciente(const Value: string);
    procedure SetTelefone(const Value: string);
    procedure SetCodigoEspecialista(const Value: integer);
    procedure SetSituacao(const Value: string);
    procedure SetCodigoEncaminhado(const Value: integer);
    procedure SetCodigoPaciente(const Value: integer);
    procedure SetCodigoConvenio(const Value: integer);
    procedure SetQuantidadeSessoes(const Value: integer);
    procedure SetCodigoTabelaCID(const Value: integer);
    procedure SetAutorizacao(const Value: string);
    procedure SetCodigoHospital(const Value: integer);
  public
    [KeyField('Codigo')]
    [FieldName('Codigo')]
    property Codigo: Integer read FCodigo write SetCodigo;
    [FieldName('CodigoTipoAgendamento')]
    [Required('CodigoTipoAgendamento')]
    property CodigoTipoAgendamento: Integer read FCodigoTipoAgendamento write SetCodigoTipoAgendamento;
    [FieldName('NomePaciente')]
    [Required('NomePaciente')]
    property NomePaciente: string read FNomePaciente write SetNomePaciente;
    [FieldName('Telefone')]
    property Telefone: string read FTelefone write SetTelefone;
    [FieldName('Data')]
    property Data: TDatetime read FData write SetData;
    [FieldName('Hora')]
    [Required('Hora')]
    property Hora: string read FHora write SetHora;
    [FieldName('CodigoEspecialista')]
    [Required('CodigoEspecialista')]
    property CodigoEspecialista: integer read FCodigoEspecialista write SetCodigoEspecialista;
    [FieldName('Situacao')]//Agendado , Concluido , Cancelado
    property Situacao: string read FSituacao write SetSituacao;
    [FieldName('CodigoEncaminhado')]
    property CodigoEncaminhado: integer read FCodigoEncaminhado write SetCodigoEncaminhado;
    [FieldName('CodigoPaciente')]
    property CodigoPaciente: integer read FCodigoPaciente write SetCodigoPaciente;
    [FieldName('CodigoConvenio')]
    [Required('CodigoConvenio')]
    property CodigoConvenio: integer read FCodigoConvenio write SetCodigoConvenio;
    [FieldName('QuantidadeSessoes')]
    property QuantidadeSessoes: integer read FQuantidadeSessoes write SetQuantidadeSessoes;
    [FieldName('CodigoCID')]
    property CodigoCID: integer read FCodigoTabelaCID write SetCodigoTabelaCID;
    [FieldName('Autorizacao')]
    property Autorizacao:  string read FAutorizacao write SetAutorizacao;
    [FieldName('CodigoHospital')]
    property CodigoHospital: integer read FCodigoHospital write SetCodigoHospital;
  end;

implementation

{ TAgendamento }

procedure TAgendamento.SetAutorizacao(const Value: string);
begin
  FAutorizacao := Value;
end;

procedure TAgendamento.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TAgendamento.SetCodigoEspecialista(const Value: integer);
begin
  FCodigoEspecialista := Value;
end;

procedure TAgendamento.SetCodigoHospital(const Value: integer);
begin
  FCodigoHospital := Value;
end;

procedure TAgendamento.SetCodigoPaciente(const Value: integer);
begin
  FCodigoPaciente := Value;
end;

procedure TAgendamento.SetCodigoConvenio(const Value: integer);
begin
  FCodigoConvenio := Value;
end;

procedure TAgendamento.SetCodigoEncaminhado(const Value: integer);
begin
  FCodigoEncaminhado := Value;
end;

procedure TAgendamento.SetCodigoTabelaCID(const Value: integer);
begin
  FCodigoTabelaCID := Value;
end;

procedure TAgendamento.SetCodigoTipoAgendamento(const Value: Integer);
begin
  FCodigoTipoAgendamento := Value;
end;

procedure TAgendamento.SetData(const Value: TDatetime);
begin
  FData := Value;
end;

procedure TAgendamento.SetHora(const Value: string);
begin
  FHora := Value;
end;

procedure TAgendamento.SetNomePaciente(const Value: string);
begin
  FNomePaciente := Value;
end;

procedure TAgendamento.SetQuantidadeSessoes(const Value: integer);
begin
  FQuantidadeSessoes := Value;
end;

procedure TAgendamento.SetSituacao(const Value: string);
begin
  FSituacao := Value;
end;

procedure TAgendamento.SetTelefone(const Value: string);
begin
  FTelefone := Value;
end;

End.
