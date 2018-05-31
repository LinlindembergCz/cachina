unit Empresa;

interface

uses
 CAtribEntity,  GenericEntidade;

type
  [TableName('Empresa')]
  [Modulo('0')]
  TEmpresa = class(TGenericEntidade)
  private
    FCNPJ: string;
    FSite: string;
    FEmail: string;
    FBairro: string;
    FUF: string;
    FCodigo: Integer;
    FCEP: string;
    FRazaoSocial: string;
    FComplemento: string;
    FIncricaoMunicipal: string;
    FInscricaoEstadual: string;
    FNome: string;
    FCidade: string;
    FEndereco: string;
    FTelefone: string;
    FCodigoIBGECidade: string;
    FCertificadoDigital: string;
    FNumero: string;
    FCertificadoSenha: string;
    FCertificadoNumeroSerie: string;
    FCertificado: string;
    FCodigoMunicipio: integer;
    procedure SetBairro(const Value: string);
    procedure SetCEP(const Value: string);
    procedure SetCidade(const Value: string);
    procedure SetCNPJ(const Value: string);
    procedure SetCodigo(const Value: Integer);
    procedure SetComplemento(const Value: string);
    procedure SetEmail(const Value: string);
    procedure SetEndereco(const Value: string);
    procedure SetIncricaoMunicipal(const Value: string);
    procedure SetInscricaoEstadual(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetRazaoSocial(const Value: string);
    procedure SetSite(const Value: string);
    procedure SetTelefone(const Value: string);
    procedure SetUF(const Value: string);
    procedure SetCodigoIBGECidade(const Value: string);
    procedure SetCertificadoDigital(const Value: string);
    procedure SetCertificado(const Value: string);
    procedure SetCertificadoNumeroSerie(const Value: string);
    procedure SetCertificadoSenha(const Value: string);
    procedure SetCodigoMunicipio(const Value: integer);
    procedure SetNumero(const Value: string);
public
  [KeyField('Codigo')]
  property Codigo: Integer read FCodigo write SetCodigo;
  [FieldName('RazaoSocial')]
  property RazaoSocial: string read FRazaoSocial write SetRazaoSocial;
  [FieldName('Nome')]
  property Nome: string read FNome write SetNome;
  [FieldName('CNPJ')]
  property CNPJ: string read FCNPJ write SetCNPJ;
  [FieldName('InscricaoEstadual')]
  property InscricaoEstadual: string read FInscricaoEstadual write SetInscricaoEstadual;
  [FieldName('IncricaoMunicipal')]
  property IncricaoMunicipal: string read FIncricaoMunicipal write SetIncricaoMunicipal;
  [FieldName('Endereco')]
  property Endereco: string read FEndereco write SetEndereco;
  [FieldName('Bairro')]
  property Bairro: string read FBairro write SetBairro;
  [FieldName('Cidade')]
  property Cidade: string read FCidade write SetCidade;
  [FieldName('UF')]
  property UF: string read FUF write SetUF;
  [FieldName('Complemento')]
  property Complemento: string read FComplemento write SetComplemento;
  [FieldName('CEP')]
  property CEP: string read FCEP write SetCEP;
  [FieldName('Telefone')]
  property Telefone: string read FTelefone write SetTelefone;
  [FieldName('Email')]
  property Email: string read FEmail write SetEmail;
  [FieldName('Site')]
  property Site: string read FSite write SetSite;
  [FieldName('Certificado')]
	property Certificado : string read FCertificado write SetCertificado;
  [FieldName('CertificadoSenha')]
	property CertificadoSenha : string read FCertificadoSenha write SetCertificadoSenha;
  [FieldName('CertificadoNumeroSerie')]
	property CertificadoNumeroSerie : string read FCertificadoNumeroSerie write SetCertificadoNumeroSerie;
  [FieldName('CodigoMunicipio')]
	property CodigoMunicipio: integer read FCodigoMunicipio write SetCodigoMunicipio;
  [FieldName('Numero')]
  property 	Numero: string read FNumero write SetNumero;
end;

implementation

{ TEmpresa }

procedure TEmpresa.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TEmpresa.SetCEP(const Value: string);
begin
  FCEP := Value;
end;

procedure TEmpresa.SetCertificado(const Value: string);
begin
  FCertificado := Value;
end;

procedure TEmpresa.SetCertificadoDigital(const Value: string);
begin
  FCertificadoDigital := Value;
end;

procedure TEmpresa.SetCertificadoNumeroSerie(const Value: string);
begin
  FCertificadoNumeroSerie := Value;
end;

procedure TEmpresa.SetCertificadoSenha(const Value: string);
begin
  FCertificadoSenha := Value;
end;

procedure TEmpresa.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TEmpresa.SetCNPJ(const Value: string);
begin
  FCNPJ := Value;
end;

procedure TEmpresa.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TEmpresa.SetCodigoIBGECidade(const Value: string);
begin
  FCodigoIBGECidade := Value;
end;

procedure TEmpresa.SetCodigoMunicipio(const Value: integer);
begin
  FCodigoMunicipio := Value;
end;

procedure TEmpresa.SetComplemento(const Value: string);
begin
  FComplemento := Value;
end;

procedure TEmpresa.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TEmpresa.SetEndereco(const Value: string);
begin
  FEndereco := Value;
end;

procedure TEmpresa.SetIncricaoMunicipal(const Value: string);
begin
  FIncricaoMunicipal := Value;
end;

procedure TEmpresa.SetInscricaoEstadual(const Value: string);
begin
  FInscricaoEstadual := Value;
end;

procedure TEmpresa.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TEmpresa.SetNumero(const Value: string);
begin
  FNumero := Value;
end;

procedure TEmpresa.SetRazaoSocial(const Value: string);
begin
  FRazaoSocial := Value;
end;

procedure TEmpresa.SetSite(const Value: string);
begin
  FSite := Value;
end;

procedure TEmpresa.SetTelefone(const Value: string);
begin
  FTelefone := Value;
end;

procedure TEmpresa.SetUF(const Value: string);
begin
  FUF := Value;
end;

End.

