{$I ACBr.inc}
unit ACBrProvedorNatal;

interface

uses
  Classes, SysUtils,
  pnfsConversao, pcnAuxiliar,
  ACBrNFSeConfiguracoes, ACBrNFSeUtil, ACBrUtil, ACBrDFeUtil,
  {$IFDEF COMPILER6_UP} DateUtils {$ELSE} ACBrD5, FileCtrl {$ENDIF};

type
  { TACBrProvedorNatal }
  
 TProvedorNatal = class(TProvedorClass)
  protected
   { protected }
  private
   { private }
  public
   { public }
   Constructor Create;

   function GetConfigCidade(ACodCidade, AAmbiente: Integer): TConfigCidade; OverRide;
   function GetConfigSchema(ACodCidade: Integer): TConfigSchema; OverRide;
   function GetConfigURL(ACodCidade: Integer): TConfigURL; OverRide;
   function GetURI(URI: String): String; OverRide;
   function GetAssinarXML(Acao: TnfseAcao): Boolean; OverRide;
   function GetValidarLote: Boolean; OverRide;

   function Gera_TagI(Acao: TnfseAcao; Prefixo3, Prefixo4, NameSpaceDad, Identificador, URI: String): AnsiString; OverRide;
   function Gera_CabMsg(Prefixo2, VersaoLayOut, VersaoDados, NameSpaceCab: String; ACodCidade: Integer): AnsiString; OverRide;
   function Gera_DadosSenha(CNPJ, Senha: String): AnsiString; OverRide;
   function Gera_TagF(Acao: TnfseAcao; Prefixo3: String): AnsiString; OverRide;

   function GeraEnvelopeRecepcionarLoteRPS(URLNS: String; CabMsg, DadosMsg, DadosSenha: AnsiString): AnsiString; OverRide;
   function GeraEnvelopeConsultarSituacaoLoteRPS(URLNS: String; CabMsg, DadosMsg, DadosSenha: AnsiString): AnsiString; OverRide;
   function GeraEnvelopeConsultarLoteRPS(URLNS: String; CabMsg, DadosMsg, DadosSenha: AnsiString): AnsiString; OverRide;
   function GeraEnvelopeConsultarNFSeporRPS(URLNS: String; CabMsg, DadosMsg, DadosSenha: AnsiString): AnsiString; OverRide;
   function GeraEnvelopeConsultarNFSe(URLNS: String; CabMsg, DadosMsg, DadosSenha: AnsiString): AnsiString; OverRide;
   function GeraEnvelopeCancelarNFSe(URLNS: String; CabMsg, DadosMsg, DadosSenha: AnsiString): AnsiString; OverRide;
   function GeraEnvelopeGerarNFSe(URLNS: String; CabMsg, DadosMsg, DadosSenha: AnsiString): AnsiString; OverRide;
   function GeraEnvelopeRecepcionarSincrono(URLNS: String; CabMsg, DadosMsg, DadosSenha: AnsiString): AnsiString; OverRide;

   function GetSoapAction(Acao: TnfseAcao; NomeCidade: String): String; OverRide;
   function GetRetornoWS(Acao: TnfseAcao; RetornoWS: AnsiString): AnsiString; OverRide;

   function GeraRetornoNFSe(Prefixo: String; RetNFSe: AnsiString; NomeCidade: String): AnsiString; OverRide;
   function GetLinkNFSe(ACodMunicipio, ANumeroNFSe: Integer; ACodVerificacao, AInscricaoM: String; AAmbiente: Integer): String; OverRide;
  end;

implementation


{ TProvedorNatal }


constructor TProvedorNatal.Create;
begin
 {----}
end;

function TProvedorNatal.GetConfigCidade(ACodCidade,
  AAmbiente: Integer): TConfigCidade;
var
 ConfigCidade: TConfigCidade;
begin
 ConfigCidade.VersaoSoap    := '1.1';
 ConfigCidade.Prefixo2      := '';
 ConfigCidade.Prefixo3      := '';
 ConfigCidade.Prefixo4      := '';
 ConfigCidade.Identificador := 'Id';

 if AAmbiente = 1
  then ConfigCidade.NameSpaceEnvelope := 'https://wsnfsev1.natal.rn.gov.br:8444'
  else ConfigCidade.NameSpaceEnvelope := 'https://wsnfsev1homologacao.natal.rn.gov.br:8443';


 ConfigCidade.AssinaRPS  := True;
 ConfigCidade.AssinaLote := True;

 Result := ConfigCidade;
end;

function TProvedorNatal.GetConfigSchema(ACodCidade: Integer): TConfigSchema;
var
 ConfigSchema: TConfigSchema;
begin
 ConfigSchema.VersaoCabecalho := '1';
 ConfigSchema.VersaoDados     := '1';
 ConfigSchema.VersaoXML       := '1';
 ConfigSchema.NameSpaceXML    := 'http://www.abrasf.org.br/ABRASF/arquivos/';
 ConfigSchema.Cabecalho       := 'nfse.xsd';
 ConfigSchema.ServicoEnviar   := 'nfse.xsd';
 ConfigSchema.ServicoConSit   := 'nfse.xsd';
 ConfigSchema.ServicoConLot   := 'nfse.xsd';
 ConfigSchema.ServicoConRps   := 'nfse.xsd';
 ConfigSchema.ServicoConNfse  := 'nfse.xsd';
 ConfigSchema.ServicoCancelar := 'nfse.xsd';
 ConfigSchema.DefTipos        := '';

 Result := ConfigSchema;
end;

function TProvedorNatal.GetConfigURL(ACodCidade: Integer): TConfigURL;
var
 ConfigURL: TConfigURL;
begin
 ConfigURL.HomNomeCidade         := '';
 ConfigURL.HomRecepcaoLoteRPS    := 'https://wsnfsev1homologacao.natal.rn.gov.br:8443/axis2/services/NfseWSServiceV1/';
 ConfigURL.HomConsultaLoteRPS    := 'https://wsnfsev1homologacao.natal.rn.gov.br:8443/axis2/services/NfseWSServiceV1/';
 ConfigURL.HomConsultaNFSeRPS    := 'https://wsnfsev1homologacao.natal.rn.gov.br:8443/axis2/services/NfseWSServiceV1/';
 ConfigURL.HomConsultaSitLoteRPS := 'https://wsnfsev1homologacao.natal.rn.gov.br:8443/axis2/services/NfseWSServiceV1/';
 ConfigURL.HomConsultaNFSe       := 'https://wsnfsev1homologacao.natal.rn.gov.br:8443/axis2/services/NfseWSServiceV1/';
 ConfigURL.HomCancelaNFSe        := 'https://wsnfsev1homologacao.natal.rn.gov.br:8443/axis2/services/NfseWSServiceV1/';

 ConfigURL.ProNomeCidade         := 'https://wsnfsev1.natal.rn.gov.br:8444/axis2/services/NfseWSServiceV1/';
 ConfigURL.ProRecepcaoLoteRPS    := 'https://wsnfsev1.natal.rn.gov.br:8444/axis2/services/NfseWSServiceV1/';
 ConfigURL.ProConsultaLoteRPS    := 'https://wsnfsev1.natal.rn.gov.br:8444/axis2/services/NfseWSServiceV1/';
 ConfigURL.ProConsultaNFSeRPS    := 'https://wsnfsev1.natal.rn.gov.br:8444/axis2/services/NfseWSServiceV1/';
 ConfigURL.ProConsultaSitLoteRPS := 'https://wsnfsev1.natal.rn.gov.br:8444/axis2/services/NfseWSServiceV1/';
 ConfigURL.ProConsultaNFSe       := 'https://wsnfsev1.natal.rn.gov.br:8444/axis2/services/NfseWSServiceV1/';
 ConfigURL.ProCancelaNFSe        := 'https://wsnfsev1.natal.rn.gov.br:8444/axis2/services/NfseWSServiceV1/';

 Result := ConfigURL;
end;

function TProvedorNatal.GetURI(URI: String): String;
begin
 Result := URI;
end;

function TProvedorNatal.GetAssinarXML(Acao: TnfseAcao): Boolean;
begin
 case Acao of
   acRecepcionar: Result := True;
   acConsSit:     Result := False;
   acConsLote:    Result := False;
   acConsNFSeRps: Result := False;
   acConsNFSe:    Result := False;
   acCancelar:    Result := True;
   acGerar:       Result := False;
   else           Result := False;
 end;
end;

function TProvedorNatal.GetValidarLote: Boolean;
begin
 Result := True;
end;

function TProvedorNatal.Gera_TagI(Acao: TnfseAcao; Prefixo3, Prefixo4,
  NameSpaceDad, Identificador, URI: String): AnsiString;
begin
 case Acao of
   acRecepcionar: Result := '<' + Prefixo3 + 'EnviarLoteRpsEnvio' + NameSpaceDad;
   acConsSit:     Result := '<' + Prefixo3 + 'ConsultarSituacaoLoteRpsEnvio' + NameSpaceDad;
   acConsLote:    Result := '<' + Prefixo3 + 'ConsultarLoteRpsEnvio' + NameSpaceDad;
   acConsNFSeRps: Result := '<' + Prefixo3 + 'ConsultarNfseRpsEnvio' + NameSpaceDad;
   acConsNFSe:    Result := '<' + Prefixo3 + 'ConsultarNfseEnvio' + NameSpaceDad;
   acCancelar:    Result := '<' + Prefixo3 + 'CancelarNfseEnvio' + NameSpaceDad +
                             '<' + Prefixo3 + 'Pedido>' +
                              '<' + Prefixo4 + 'InfPedidoCancelamento' +
                                 DFeUtil.SeSenao(Identificador <> '', ' ' + Identificador + '="' + URI + '"', '') + '>';
   acGerar:       Result := '';
 end;
end;

function TProvedorNatal.Gera_CabMsg(Prefixo2, VersaoLayOut, VersaoDados,
  NameSpaceCab: String; ACodCidade: Integer): AnsiString;
begin
 Result := '<' + Prefixo2 + 'cabecalho '+'xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"'+' versao="'  + VersaoLayOut + '"' + NameSpaceCab +
            '<versaoDados>' + VersaoDados + '</versaoDados>'+
           '</' + Prefixo2 + 'cabecalho>';
end;

function TProvedorNatal.Gera_DadosSenha(CNPJ, Senha: String): AnsiString;
begin
 Result := '';
end;

function TProvedorNatal.Gera_TagF(Acao: TnfseAcao; Prefixo3: String): AnsiString;
begin
 case Acao of
   acRecepcionar: Result := '</' + Prefixo3 + 'EnviarLoteRpsEnvio>';
   acConsSit:     Result := '</' + Prefixo3 + 'ConsultarSituacaoLoteRpsEnvio>';
   acConsLote:    Result := '</' + Prefixo3 + 'ConsultarLoteRpsEnvio>';
   acConsNFSeRps: Result := '</' + Prefixo3 + 'ConsultarNfseRpsEnvio>';
   acConsNFSe:    Result := '</' + Prefixo3 + 'ConsultarNfseEnvio>';
   acCancelar:    Result := '</' + Prefixo3 + 'Pedido>' +
                            '</' + Prefixo3 + 'CancelarNfseEnvio>';
   acGerar:       Result := '';
 end;
end;

function TProvedorNatal.GeraEnvelopeRecepcionarLoteRPS(URLNS: String;
  CabMsg, DadosMsg, DadosSenha: AnsiString): AnsiString;
begin
   result := 
         '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" '+
                             'xmlns:wsn="https://wsnfsev1.natal.rn.gov.br:8444"'+
                             '>'+
           '<soapenv:Header/>' +
             '<soapenv:Body>' +
               '<wsn:RecepcionarLoteRpsRequest>' +
                 '<nfseCabecMsg>'+
                   StringReplace(StringReplace(CabMsg, '<', '&lt;', [rfReplaceAll]), '>', '&gt;', [rfReplaceAll]) +
                 '</nfseCabecMsg>' +
                 '<nfseDadosMsg>'+
                   StringReplace(StringReplace(DadosMsg, '<', '&lt;', [rfReplaceAll]), '>', '&gt;', [rfReplaceAll]) +
                 '</nfseDadosMsg>' +
               '</wsn:RecepcionarLoteRpsRequest>' +
             '</soapenv:Body>' +
         '</soapenv:Envelope>';
end;

function TProvedorNatal.GeraEnvelopeConsultarSituacaoLoteRPS(
  URLNS: String; CabMsg, DadosMsg, DadosSenha: AnsiString): AnsiString;
begin
 result :=
           '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" '+
                             'xmlns:wsn="https://wsnfsev1.natal.rn.gov.br:8444"'+
                             '>'+
           '<soapenv:Header/>' +
              '<soapenv:Body>' +
                '<wsn:ConsultarSituacaoLoteRpsRequest>' +
                  '<nfseCabecMsg>'+
                     StringReplace(StringReplace(CabMsg, '<', '&lt;', [rfReplaceAll]), '>', '&gt;', [rfReplaceAll]) +
                  '</nfseCabecMsg>' +
                  '<nfseDadosMsg>'+
                     StringReplace(StringReplace(DadosMsg, '<', '&lt;', [rfReplaceAll]), '>', '&gt;', [rfReplaceAll]) +
                  '</nfseDadosMsg>' +
                '</wsn:ConsultarSituacaoLoteRpsRequest>' +
              '</soapenv:Body>' +
           '</soapenv:Envelope>';
end;

function TProvedorNatal.GeraEnvelopeConsultarLoteRPS(URLNS: String;
  CabMsg, DadosMsg, DadosSenha: AnsiString): AnsiString;
begin
 result :=
           '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" '+
                             'xmlns:wsn="https://wsnfsev1.natal.rn.gov.br:8444"'+
                             '>'+
           '<soapenv:Header/>' +
              '<soapenv:Body>' +
                '<wsn:ConsultarLoteRpsRequest>' +
                  '<nfseCabecMsg>'+
                     StringReplace(StringReplace(CabMsg, '<', '&lt;', [rfReplaceAll]), '>', '&gt;', [rfReplaceAll]) +
                   '</nfseCabecMsg>' +
                   '<nfseDadosMsg>'+
                     StringReplace(StringReplace(DadosMsg, '<', '&lt;', [rfReplaceAll]), '>', '&gt;', [rfReplaceAll]) +
                   '</nfseDadosMsg>' +
                '</wsn:ConsultarLoteRpsRequest>' +
              '</soapenv:Body>' +
           '</soapenv:Envelope>';
end;

function TProvedorNatal.GeraEnvelopeConsultarNFSeporRPS(URLNS: String;
  CabMsg, DadosMsg, DadosSenha: AnsiString): AnsiString;
begin
 result :=
           '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" '+
                             'xmlns:wsn="https://wsnfsev1.natal.rn.gov.br:8444"'+
                             '>'+
           '<soapenv:Header/>' +
              '<soapenv:Body>' +
                '<wsn:ConsultarNfsePorRpsRequest>' +
                  '<nfseCabecMsg>'+
                     StringReplace(StringReplace(CabMsg, '<', '&lt;', [rfReplaceAll]), '>', '&gt;', [rfReplaceAll]) +
                 '</nfseCabecMsg>' +
                 '<nfseDadosMsg>'+
                   StringReplace(StringReplace(DadosMsg, '<', '&lt;', [rfReplaceAll]), '>', '&gt;', [rfReplaceAll]) +
                 '</nfseDadosMsg>' +
                 '</wsn:ConsultarNfsePorRpsRequest>' +
              '</soapenv:Body>' +
           '</soapenv:Envelope>';
end;

function TProvedorNatal.GeraEnvelopeConsultarNFSe(URLNS: String; CabMsg,
  DadosMsg, DadosSenha: AnsiString): AnsiString;
begin
 result :=
           '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" '+
                             'xmlns:wsn="https://wsnfsev1.natal.rn.gov.br:8444"'+
                             '>'+
           '<soapenv:Header/>' +
              '<soapenv:Body>' +
                '<wsn:ConsultarNfseServicoPrestadoRequest>' +
                  '<nfseCabecMsg>'+
                     StringReplace(StringReplace(CabMsg, '<', '&lt;', [rfReplaceAll]), '>', '&gt;', [rfReplaceAll]) +
                 '</nfseCabecMsg>' +
                 '<nfseDadosMsg>'+
                   StringReplace(StringReplace(DadosMsg, '<', '&lt;', [rfReplaceAll]), '>', '&gt;', [rfReplaceAll]) +
                 '</nfseDadosMsg>' +
                 '</wsn:ConsultarNfseServicoPrestadoRequest>' +
              '</soapenv:Body>' +
           '</soapenv:Envelope>';

end;

function TProvedorNatal.GeraEnvelopeCancelarNFSe(URLNS: String; CabMsg,
  DadosMsg, DadosSenha: AnsiString): AnsiString;
begin
 result :=
           '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" '+
                             'xmlns:wsn="https://wsnfsev1.natal.rn.gov.br:8444"'+
                             '>'+
           '<soapenv:Header/>' +
              '<soapenv:Body>' +
                '<wsn:CancelarNfseRequest>' +
                  '<nfseCabecMsg>'+
                     StringReplace(StringReplace(CabMsg, '<', '&lt;', [rfReplaceAll]), '>', '&gt;', [rfReplaceAll]) +
                 '</nfseCabecMsg>' +
                 '<nfseDadosMsg>'+
                   StringReplace(StringReplace(DadosMsg, '<', '&lt;', [rfReplaceAll]), '>', '&gt;', [rfReplaceAll]) +
                 '</nfseDadosMsg>' +
                '</wsn:CancelarNfseRequest>' +
              '</soapenv:Body>' +
           '</soapenv:Envelope>';
end;

function TProvedorNatal.GeraEnvelopeGerarNFSe(URLNS: String; CabMsg,
  DadosMsg, DadosSenha: AnsiString): AnsiString;
begin
 result :=
           '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" '+
                             'xmlns:wsn="https://wsnfsev1.natal.rn.gov.br:8444"'+
                             '>'+
           '<soapenv:Header/>' +
              '<soapenv:Body>' +
                '<wsn:GerarNfseRequest>' +
                  '<nfseCabecMsg>'+
                     StringReplace(StringReplace(CabMsg, '<', '&lt;', [rfReplaceAll]), '>', '&gt;', [rfReplaceAll]) +
                 '</nfseCabecMsg>' +
                 '<nfseDadosMsg>'+
                   StringReplace(StringReplace(DadosMsg, '<', '&lt;', [rfReplaceAll]), '>', '&gt;', [rfReplaceAll]) +
                 '</nfseDadosMsg>' +
                '</wsn:GerarNfseRequest>' +
              '</soapenv:Body>' +
           '</soapenv:Envelope>';
end;

function TProvedorNatal.GeraEnvelopeRecepcionarSincrono(URLNS: String;
  CabMsg, DadosMsg, DadosSenha: AnsiString): AnsiString;
begin
 result := '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" '+
                             'xmlns:wsn="https://wsnfsev1.natal.rn.gov.br:8444"'+
                             '>'+
           '<soapenv:Header/>' +
              '<soapenv:Body>' +
                '<wsn:RecepcionarLoteRpsSincronoRequest>' +
                  '<nfseCabecMsg>'+
                     StringReplace(StringReplace(CabMsg, '<', '&lt;', [rfReplaceAll]), '>', '&gt;', [rfReplaceAll]) +
                 '</nfseCabecMsg>' +
                 '<nfseDadosMsg>'+
                   StringReplace(StringReplace(DadosMsg, '<', '&lt;', [rfReplaceAll]), '>', '&gt;', [rfReplaceAll]) +
                 '</nfseDadosMsg>' +
                '</wsn:RecepcionarLoteRpsSincronoRequest>' +
              '</soapenv:Body>' +
           '</soapenv:Envelope>';
end;

function TProvedorNatal.GetSoapAction(Acao: TnfseAcao; NomeCidade: String): String;
begin
  {
 case Acao of
   acRecepcionar: Result := 'https://wsnfsev1homologacao.natal.rn.gov.br:8443/axis2/services/RecepcionarLoteRps';
   acConsSit:     Result := 'https://wsnfsev1homologacao.natal.rn.gov.br:8443/axis2/services/ConsultarSituacaoLoteRps';
   acConsLote:    Result := 'https://wsnfsev1homologacao.natal.rn.gov.br:8443/axis2/services/ConsultarLoteRps';
   acConsNFSeRps: Result := 'https://wsnfsev1homologacao.natal.rn.gov.br:8443/axis2/services/ConsultarNfsePorRps';
   acConsNFSe:    Result := 'https://wsnfsev1homologacao.natal.rn.gov.br:8443/axis2/services/ConsultarNfse';
   acCancelar:    Result := 'https://wsnfsev1homologacao.natal.rn.gov.br:8443/axis2/services/CancelarNfse';
   acGerar:       Result := '';
 end;
 }
 case Acao of
   acRecepcionar: Result := 'https://wsnfsev1.natal.rn.gov.br:8443/axis2/services/RecepcionarLoteRps';
   acConsSit:     Result := 'https://wsnfsev1.natal.rn.gov.br:8443/axis2/services/ConsultarSituacaoLoteRps';
   acConsLote:    Result := 'https://wsnfsev1.natal.rn.gov.br:8443/axis2/services/ConsultarLoteRps';
   acConsNFSeRps: Result := 'https://wsnfsev1.natal.rn.gov.br:8443/axis2/services/ConsultarNfsePorRps';
   acConsNFSe:    Result := 'https://wsnfsev1.natal.rn.gov.br:8443/axis2/services/ConsultarNfse';
   acCancelar:    Result := 'https://wsnfsev1.natal.rn.gov.br:8443/axis2/services/CancelarNfse';
   acGerar:       Result := 'https://wsnfsev1.natal.rn.gov.br:8443/axis2/services/GerarNfse';
 end;
end;

function TProvedorNatal.GetRetornoWS(Acao: TnfseAcao; RetornoWS: AnsiString): AnsiString;
var
 RetWS: AnsiString;
begin
 case Acao of
   acRecepcionar: Result := SeparaDados( RetornoWS, 'outputXML' );
   acConsSit:     Result := SeparaDados( RetornoWS, 'outputXML' );
   acConsLote:    Result := SeparaDados( RetornoWS, 'outputXML' );
   acConsNFSeRps: Result := SeparaDados( RetornoWS, 'outputXML' );
   acConsNFSe:    Result := SeparaDados( RetornoWS, 'outputXML' );
   acCancelar:    Result := SeparaDados( RetornoWS, 'outputXML' );
   acGerar:       Result := '';
 end;
end;

function TProvedorNatal.GeraRetornoNFSe(Prefixo: String;
  RetNFSe: AnsiString; NomeCidade: String): AnsiString;
begin
 Result := 
           '<' + Prefixo + 'CompNfse xmlns="http://www.abrasf.org.br/nfse">' +
             RetNfse +
           '</' + Prefixo + 'CompNfse>';
end;

function TProvedorNatal.GetLinkNFSe(ACodMunicipio, ANumeroNFSe: Integer;
  ACodVerificacao, AInscricaoM: String; AAmbiente: Integer): String;
begin
 Result := '';
end;

end.

