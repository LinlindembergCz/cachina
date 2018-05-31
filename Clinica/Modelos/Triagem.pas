unit Triagem;

interface

uses
   CAtribEntity,  GenericEntidade;

Type
  [TableName('Triagem')]
  TTriagem = class(TGenericEntidade)
  private
    FNacionalidade: string;
    FNaturalidade: string;
    FQueixaInicial: string;
    FNome: string;
    FDataNascimento: TDatetime;
    FNumeroCarteira: string;
    FReligiao: string;
    FPsicologo: string;
    FEncaminhado: string;
    FAntecedentes: string;
    FTelefones: string;
    FCID: string;
    FEndereco: string;
    FMedicacoes: string;
    FProfissao: string;
    FCodigo: integer;
    FNomePai: string;
    FRG: string;
    FBairro: string;
    FUF: string;
    FDataEmissao: TDatetime;
    FOE: string;
    FMunicipio: string;
    FNomeMae: string;
    FCodigoConvenio: integer;
    FEmail: string;
    FCodigoEspecialista: integer;
    procedure SetAntecedentes(const Value: string);
    procedure SetCID(const Value: string);
    procedure SetDataNascimento(const Value: TDatetime);
    procedure SetEncaminhado(const Value: string);
    procedure SetEndereco(const Value: string);
    procedure SetMedicacoes(const Value: string);
    procedure SetNacionalidade(const Value: string);
    procedure SetNaturalidade(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetNumeroCarteira(const Value: string);
    procedure SetPiscolo(const Value: string);
    procedure SetProfissao(const Value: string);
    procedure SetQueixaInicial(const Value: string);
    procedure SetReligiao(const Value: string);
    procedure SetTelefones(const Value: string);
    procedure SetCodigo(const Value: integer);
    procedure SetBairro(const Value: string);
    procedure SetDataEmissao(const Value: TDatetime);
    procedure SetMunicipio(const Value: string);
    procedure SetNomeMae(const Value: string);
    procedure SetNomePai(const Value: string);
    procedure SetOE(const Value: string);
    procedure SetRG(const Value: string);
    procedure SetUF(const Value: string);
    procedure SetCodigoConvenio(const Value: integer);
    procedure SetEmail(const Value: string);
    procedure SetCodigoEspecialista(const Value: integer);
  public
    [KeyField('Codigo')]
    property Codigo: integer read FCodigo write SetCodigo;
    [FieldName('Nome')]
    property Nome: string read FNome write SetNome;
    [FieldName('Endereco')]
    property Endereco: string read FEndereco write SetEndereco;
    [FieldName('Telefones')]
    property Telefones: string read FTelefones write SetTelefones;
    [FieldName('DataNascimento')]
    property DataNascimento: TDatetime read FDataNascimento write SetDataNascimento;
    [FieldName('Naturalidade')]
    property Naturalidade: string read FNaturalidade write SetNaturalidade;
    [FieldName('Nacionalidade')]
    property Nacionalidade: string read FNacionalidade write SetNacionalidade;
    [FieldName('Religiao')]
    property Religiao: string read FReligiao write SetReligiao;
    [FieldName('Profissao')]
    property Profissao: string read FProfissao write SetProfissao;
    [FieldName('CodigoConvenio')]
    property CodigoConvenio: integer read FCodigoConvenio write SetCodigoConvenio;
    [FieldName('NumeroCarteira')]
    property NumeroCarteira: string read FNumeroCarteira write SetNumeroCarteira;
    [FieldName('CID')]
    property CID: string read FCID write SetCID;
    [FieldName('Encaminhado')]
    property Encaminhado: string read FEncaminhado write SetEncaminhado;
    [FieldName('QueixaInicial')]
    property QueixaInicial: string read FQueixaInicial write SetQueixaInicial;
    [FieldName('Antecedentes')]
    property Antecedentes: string read FAntecedentes write SetAntecedentes;
    [FieldName('Medicacoes')]
    property Medicacoes: string read FMedicacoes write SetMedicacoes;
    [FieldName('UF')]
    property UF :string read FUF write SetUF;
    [FieldName('Municipio')]
    property Municipio:string read FMunicipio write SetMunicipio;
    [FieldName('Bairro')]
    property Bairro:string read FBairro write SetBairro;
    [FieldName('RG')]
    property RG :string read FRG write SetRG;
    [FieldName('OE')]
    property OE :string read FOE write SetOE;
    [FieldName('DataEmissao')]
    property DataEmissao :TDatetime read FDataEmissao write SetDataEmissao;
    [FieldName('NomePai')]
    property NomePai:string read FNomePai write SetNomePai;
    [FieldName('NomeMae')]
    property NomeMae:string read FNomeMae write SetNomeMae;
    [FieldName('Email')]
    property Email:string read FEmail write SetEmail;
    [FieldName('CodigoEspecialista')]
    property CodigoEspecialista: integer read FCodigoEspecialista write SetCodigoEspecialista;
  end;

implementation

{ TTriagem }

procedure TTriagem.SetAntecedentes(const Value: string);
begin
  FAntecedentes := Value;
end;

procedure TTriagem.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TTriagem.SetCID(const Value: string);
begin
  FCID := Value;
end;

procedure TTriagem.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TTriagem.SetCodigoConvenio(const Value: integer);
begin
  FCodigoConvenio := Value;
end;

procedure TTriagem.SetCodigoEspecialista(const Value: integer);
begin
  FCodigoEspecialista := Value;
end;

procedure TTriagem.SetDataEmissao(const Value: TDatetime);
begin
  FDataEmissao := Value;
end;

procedure TTriagem.SetDataNascimento(const Value: TDatetime);
begin
  FDataNascimento := Value;
end;

procedure TTriagem.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TTriagem.SetEncaminhado(const Value: string);
begin
  FEncaminhado := Value;
end;

procedure TTriagem.SetEndereco(const Value: string);
begin
  FEndereco := Value;
end;

procedure TTriagem.SetMedicacoes(const Value: string);
begin
  FMedicacoes := Value;
end;

procedure TTriagem.SetMunicipio(const Value: string);
begin
  FMunicipio := Value;
end;

procedure TTriagem.SetNacionalidade(const Value: string);
begin
  FNacionalidade := Value;
end;

procedure TTriagem.SetNaturalidade(const Value: string);
begin
  FNaturalidade := Value;
end;

procedure TTriagem.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TTriagem.SetNomeMae(const Value: string);
begin
  FNomeMae := Value;
end;

procedure TTriagem.SetNomePai(const Value: string);
begin
  FNomePai := Value;
end;

procedure TTriagem.SetNumeroCarteira(const Value: string);
begin
  FNumeroCarteira := Value;
end;

procedure TTriagem.SetOE(const Value: string);
begin
  FOE := Value;
end;

procedure TTriagem.SetPiscolo(const Value: string);
begin
  FPsicologo := Value;
end;

procedure TTriagem.SetProfissao(const Value: string);
begin
  FProfissao := Value;
end;

procedure TTriagem.SetQueixaInicial(const Value: string);
begin
  FQueixaInicial := Value;
end;

procedure TTriagem.SetReligiao(const Value: string);
begin
  FReligiao := Value;
end;

procedure TTriagem.SetRG(const Value: string);
begin
  FRG := Value;
end;

procedure TTriagem.SetTelefones(const Value: string);
begin
  FTelefones := Value;
end;

procedure TTriagem.SetUF(const Value: string);
begin
  FUF := Value;
end;

end.
