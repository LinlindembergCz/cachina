unit pnfsNFSeG;

interface

uses
  SysUtils, Classes, Forms,
{$IFNDEF VER130}
  Variants,
{$ENDIF}
  pnfsNFSe, pnfsConversao, ACBrUtil, ACBrDFeUtil;

type

  TNFSeG = class
   private

   protected

   public
     class function Gera_DadosMsgEnviarLote(Prefixo3, Prefixo4, Identificador,
                                    NameSpaceDad, VersaoDados, VersaoXML,
                                    NumeroLote, CNPJ, IM, QtdeNotas: String;
                                    Notas, TagI, TagF: AnsiString; AProvedor: TnfseProvedor = proNenhum): AnsiString;

     class function Gera_DadosMsgConsSitLote(Prefixo3, Prefixo4, NameSpaceDad,
                                     VersaoXML, Protocolo, CNPJ, IM: String;
                                     TagI, TagF: AnsiString; AProvedor: TnfseProvedor = proNenhum): AnsiString;

     class function Gera_DadosMsgConsLote(Prefixo3, Prefixo4, NameSpaceDad,
                                  VersaoXML, Protocolo, CNPJ, IM, senha, frase_secreta: String;
                                  TagI, TagF: AnsiString; AProvedor: TnfseProvedor = proNenhum): AnsiString;

     class function Gera_DadosMsgConsNFSeRPS(Prefixo3, Prefixo4, NameSpaceDad, VersaoXML,
                                     NumeroRps, SerieRps, TipoRps, CNPJ, IM, senha, frase_secreta: String;
                                     TagI, TagF: AnsiString; AProvedor: TnfseProvedor = proNenhum): AnsiString;

     class function Gera_DadosMsgConsNFSe(Prefixo3, Prefixo4, NameSpaceDad, VersaoXML,
                                  CNPJ, IM: String;
                                  DataInicial, DataFinal: TDateTime;
                                  TagI, TagF: AnsiString; NumeroNFSe: string = '';
                                  Senha : string = ''; FraseSecreta : string = '';
                                  AProvedor: TnfseProvedor = proNenhum;
                                  APagina: Integer = 1): AnsiString;

     class function Gera_DadosMsgCancelarNFSe(Prefixo4, NameSpaceDad, NumeroNFSe, CNPJ, IM,
                                      CodMunicipio, CodCancelamento: String;
                                      TagI, TagF: AnsiString; AProvedor: TnfseProvedor = proNenhum): AnsiString;

     class function Gera_DadosMsgGerarNFSe(Prefixo3, Prefixo4, Identificador,
                                   NameSpaceDad, VersaoDados, VersaoXML,
                                   NumeroLote, CNPJ, IM, QtdeNotas: String;
                                   Notas, TagI, TagF: AnsiString; AProvedor: TnfseProvedor = proNenhum): AnsiString;

     class function Gera_DadosMsgEnviarSincrono(Prefixo3, Prefixo4, Identificador,
                                        NameSpaceDad, VersaoDados, VersaoXML,
                                        NumeroLote, CNPJ, IM, QtdeNotas: String;
                                        Notas, TagI, TagF: AnsiString; AProvedor: TnfseProvedor = proNenhum): AnsiString;

     //-------------------------------------------------------------------------
     // As classes abaixo são exclusivas para o provedor DSF
     //-------------------------------------------------------------------------
     class function Gera_DadosMsgEnviarLoteDSF(Prefixo3, Prefixo4,Identificador, NameSpaceDad, VersaoXML,
                                               NumeroLote, CodCidade, CNPJ, IM, RazaoSocial, Transacao,
                                               QtdeNotas, ValorTotalServicos, ValorTotalDeducoes: String;
                                               DataInicial, DataFinal: TDateTime;
                                               Notas, TagI, TagF: AnsiString): AnsiString;

     class function Gera_DadosMsgConsLoteDSF(Prefixo3, Prefixo4, NameSpaceDad,
                                             VersaoXML, CodCidade, CNPJ, NumeroLote: String;
                                             TagI, TagF: AnsiString): AnsiString;

     class function Gera_DadosMsgConsNFSeRPSDSF(Prefixo3, Prefixo4, NameSpaceDad,VersaoXML,
                                                CodCidade, CNPJ, Transacao, NumeroLote: String;
                                                Notas, TagI, TagF: AnsiString): AnsiString;

     class function Gera_DadosMsgConsNFSeDSF(Prefixo3, Prefixo4, NameSpaceDad, VersaoXML, CodCidade,
                                             CNPJ, IM, NotaInicial: String; DataInicial, DataFinal: TDateTime;
                                             TagI, TagF: AnsiString): AnsiString;

     class function Gera_DadosMsgCancelarNFSeDSF(Prefixo3, Prefixo4, NameSpaceDad, VersaoXML,
                                                 CNPJ, Transacao, CodMunicipio, NumeroLote: String;
                                                 Notas, TagI, TagF: AnsiString): AnsiString;

     class function Gera_DadosMsgConsSeqRPSDSF(TagI, TagF: AnsiString; VersaoXML, CodCidade,
                                               IM, CNPJ, SeriePrestacao: String): AnsiString;

   published

   end;

implementation

//uses
// IniFiles, Variants, ACBrConsts;

class function TNFSeG.Gera_DadosMsgEnviarLote(Prefixo3, Prefixo4,
  Identificador, NameSpaceDad, VersaoDados, VersaoXML, NumeroLote, CNPJ,
  IM, QtdeNotas: String; Notas, TagI, TagF: AnsiString; AProvedor: TnfseProvedor = proNenhum): AnsiString;
var
 DadosMsg: AnsiString;
 strId : String;
begin
 if AProvedor = proBetha then Prefixo3 := '';
 if AProvedor = proGovBR then Identificador := '';
 if AProvedor = proNatal then
   strId := 'lote'
 else
   strId := NumeroLote;

 DadosMsg := '<' + Prefixo3 + 'LoteRps'+
               DFeUtil.SeSenao(AProvedor = proISSDigital, '',
                               DFeUtil.SeSenao(Identificador <> '', ' ' + Identificador + '="' + strId + '"', '')) +
               DFeUtil.SeSenao(AProvedor = proSimplISS, NameSpaceDad, '') +
               DFeUtil.SeSenao(AProvedor in [proAbaco, proBetha, proGinfes, proGoiania, proGovBR,
                                             {proISSDigital, }proIssCuritiba, proISSNET, proNatal,
                                             proRecife, proRJ, proSimplISS, proThema, proTiplan,
                                             proAgili, proFISSLex, proSalvador], '',
                DFeUtil.SeSenao(VersaoDados <> '', ' versao="' + VersaoDados + '"', '')) + '>' +
              '<' + Prefixo4 + 'NumeroLote>' +
                NumeroLote +
              '</' + Prefixo4 + 'NumeroLote>' +

              DFeUtil.SeSenao((VersaoXML = '2') or (AProvedor = proISSNet),

                '<' + Prefixo4 + 'CpfCnpj>' +
                DFeUtil.SeSenao(Length(OnlyNumber(Cnpj)) <= 11,
                 '<' + Prefixo4 + 'Cpf>' +
                   Cnpj +
                 '</' + Prefixo4 + 'Cpf>',
                 '<' + Prefixo4 + 'Cnpj>' +
                   Cnpj +
                 '</' + Prefixo4 + 'Cnpj>') +
                '</' + Prefixo4 + 'CpfCnpj>',

                '<' + Prefixo4 + 'Cnpj>' +
                  Cnpj +
                '</' + Prefixo4 + 'Cnpj>') +

              '<' + Prefixo4 + 'InscricaoMunicipal>' +
                IM +
              '</' + Prefixo4 + 'InscricaoMunicipal>' +
              '<' + Prefixo4 + 'QuantidadeRps>' +
                QtdeNotas +
              '</' + Prefixo4 + 'QuantidadeRps>' +
              '<' + Prefixo4 + 'ListaRps>' +
               Notas +
              '</' + Prefixo4 + 'ListaRps>' +
             '</' + Prefixo3 + 'LoteRps>';

 Result := TagI + DadosMsg + TagF;

 if AProvedor = proNenhum then Result := '';
end;

class function TNFSeG.Gera_DadosMsgConsSitLote(Prefixo3, Prefixo4,
  NameSpaceDad, VersaoXML, Protocolo, CNPJ, IM: String; TagI,
  TagF: AnsiString; AProvedor: TnfseProvedor = proNenhum): AnsiString;
var
 DadosMsg: AnsiString;
begin
 if AProvedor = proBetha then Prefixo3 := '';

 DadosMsg := '<' + Prefixo3 + 'Prestador' +
               DFeUtil.SeSenao(AProvedor = proSimplISS, ' ' + NameSpaceDad, '>') +
               DFeUtil.SeSenao(VersaoXML = '2',

                 '<' + Prefixo4 + 'CpfCnpj>' +
                  DFeUtil.SeSenao(Length(OnlyNumber(Cnpj)) <= 11,
                  '<' + Prefixo4 + 'Cpf>' +
                    Cnpj +
                  '</' + Prefixo4 + 'Cpf>',
                  '<' + Prefixo4 + 'Cnpj>' +
                    Cnpj +
                  '</' + Prefixo4 + 'Cnpj>') +
                 '</' + Prefixo4 + 'CpfCnpj>',

                 '<' + Prefixo4 + 'Cnpj>' +
                   Cnpj +
                 '</' + Prefixo4 + 'Cnpj>') +

               '<' + Prefixo4 + 'InscricaoMunicipal>' +
                 IM +
               '</' + Prefixo4 + 'InscricaoMunicipal>' +
              '</' + Prefixo3 + 'Prestador>' +
              '<' + Prefixo3 + 'Protocolo' +
               DFeUtil.SeSenao(AProvedor = proSimplISS, ' ' + NameSpaceDad, '>') +
                Protocolo +
              '</' + Prefixo3 + 'Protocolo>';

 Result := TagI + DadosMsg + TagF;

 if AProvedor in [proNenhum, pro4R, proAgili, proCoplan, profintelISS, proFiorilli,
                  proGoiania, proGovDigital, proISSDigital, proISSe, proProdata, proVirtual,
                  proSaatri, proPVH] then Result := '';
end;

class function TNFSeG.Gera_DadosMsgConsLote(Prefixo3, Prefixo4,
  NameSpaceDad, VersaoXML, Protocolo, CNPJ, IM, senha, frase_secreta: String; TagI,
  TagF: AnsiString; AProvedor: TnfseProvedor = proNenhum): AnsiString;
var
 DadosMsg: AnsiString;
begin
 if AProvedor = proBetha then Prefixo3 := '';

 DadosMsg := '<' + Prefixo3 + 'Prestador' +
               DFeUtil.SeSenao(AProvedor = proSimplISS, ' ' + NameSpaceDad, '>') +

               DFeUtil.SeSenao(VersaoXML = '2',

                 '<' + Prefixo4 + 'CpfCnpj>' +
                  DFeUtil.SeSenao(Length(OnlyNumber(Cnpj)) <= 11,
                  '<' + Prefixo4 + 'Cpf>' +
                    Cnpj +
                  '</' + Prefixo4 + 'Cpf>',
                  '<' + Prefixo4 + 'Cnpj>' +
                    Cnpj +
                  '</' + Prefixo4 + 'Cnpj>') +
                 '</' + Prefixo4 + 'CpfCnpj>',

                 '<' + Prefixo4 + 'Cnpj>' +
                   Cnpj +
                 '</' + Prefixo4 + 'Cnpj>') +

               '<' + Prefixo4 + 'InscricaoMunicipal>' +
                 IM +
               '</' + Prefixo4 + 'InscricaoMunicipal>' +

              DFeUtil.SeSenao(AProvedor = proISSDigital,
               '<' + Prefixo4 + 'Senha>' +
                 Senha +
               '</' + Prefixo4 + 'Senha>' +
               '<' + Prefixo4 + 'FraseSecreta>' +
                 frase_secreta +
               '</' + Prefixo4 + 'FraseSecreta>', '') +

              '</' + Prefixo3 + 'Prestador>' +
              '<' + Prefixo3 + 'Protocolo' +
               DFeUtil.SeSenao(AProvedor = proSimplISS, ' ' + NameSpaceDad, '>') +
                Protocolo +
              '</' + Prefixo3 + 'Protocolo>';

 Result := TagI + DadosMsg + TagF;

 if AProvedor = proNenhum then Result := '';
end;

class function TNFSeG.Gera_DadosMsgConsNFSeRPS(Prefixo3, Prefixo4,
  NameSpaceDad, VersaoXML, NumeroRps, SerieRps, TipoRps, CNPJ, IM,
  senha, frase_secreta: String;
  TagI, TagF: AnsiString; AProvedor: TnfseProvedor = proNenhum): AnsiString;
var
 DadosMsg: AnsiString;
begin
 if AProvedor = proBetha then Prefixo3 := '';

 DadosMsg := '<' + Prefixo3 + 'IdentificacaoRps' +
               DFeUtil.SeSenao(AProvedor = proSimplISS, ' ' + NameSpaceDad, '>') +
              '<' + Prefixo4 + 'Numero>' +
                NumeroRps +
              '</' + Prefixo4 + 'Numero>' +
              '<' + Prefixo4 + 'Serie>' +
                SerieRps +
              '</' + Prefixo4 + 'Serie>' +
              '<' + Prefixo4 + 'Tipo>' +
                TipoRps +
              '</' + Prefixo4 + 'Tipo>' +
             '</' + Prefixo3 + 'IdentificacaoRps>' +
             '<' + Prefixo3 + 'Prestador' +
               DFeUtil.SeSenao(AProvedor = proSimplISS, ' ' + NameSpaceDad, '>') +

              DFeUtil.SeSenao(VersaoXML = '2',

                '<' + Prefixo4 + 'CpfCnpj>' +
                  DFeUtil.SeSenao(Length(OnlyNumber(Cnpj)) <= 11,
                  '<' + Prefixo4 + 'Cpf>' +
                    Cnpj +
                  '</' + Prefixo4 + 'Cpf>',
                  '<' + Prefixo4 + 'Cnpj>' +
                    Cnpj +
                  '</' + Prefixo4 + 'Cnpj>') +
                '</' + Prefixo4 + 'CpfCnpj>',

                '<' + Prefixo4 + 'Cnpj>' +
                  Cnpj +
                '</' + Prefixo4 + 'Cnpj>') +

              '<' + Prefixo4 + 'InscricaoMunicipal>' +
                IM +
              '</' + Prefixo4 + 'InscricaoMunicipal>' +

              DFeUtil.SeSenao(AProvedor = proISSDigital,
               '<' + Prefixo4 + 'Senha>' +
                 Senha +
               '</' + Prefixo4 + 'Senha>' +
               '<' + Prefixo4 + 'FraseSecreta>' +
                 frase_secreta +
               '</' + Prefixo4 + 'FraseSecreta>', '') +

             '</' + Prefixo3 + 'Prestador>';

 Result := TagI + DadosMsg + TagF;

 if AProvedor = proNenhum then Result := '';
end;

class function TNFSeG.Gera_DadosMsgConsNFSe(Prefixo3, Prefixo4,
  NameSpaceDad, VersaoXML, CNPJ, IM: String; DataInicial, DataFinal: TDateTime; TagI,
  TagF: AnsiString; NumeroNFSe: string = ''; Senha : string = '';
  FraseSecreta : string = ''; AProvedor: TnfseProvedor = proNenhum;
  APagina: Integer = 1): AnsiString;
var
 DadosMsg: AnsiString;
begin
 if AProvedor = proBetha then Prefixo3 := '';

 DadosMsg := '<' + Prefixo3 + 'Prestador' +
               DFeUtil.SeSenao(AProvedor = proSimplISS, ' ' + NameSpaceDad, '>') +
               DFeUtil.SeSenao(VersaoXML = '2',

                 '<' + Prefixo4 + 'CpfCnpj>' +
                  DFeUtil.SeSenao(Length(OnlyNumber(Cnpj)) <= 11,
                  '<' + Prefixo4 + 'Cpf>' +
                    Cnpj +
                  '</' + Prefixo4 + 'Cpf>',
                  '<' + Prefixo4 + 'Cnpj>' +
                    Cnpj +
                  '</' + Prefixo4 + 'Cnpj>') +
                 '</' + Prefixo4 + 'CpfCnpj>',

                 '<' + Prefixo4 + 'Cnpj>' +
                  Cnpj +
                 '</' + Prefixo4 + 'Cnpj>') +

               '<' + Prefixo4 + 'InscricaoMunicipal>' +
                IM +
               '</' + Prefixo4 + 'InscricaoMunicipal>' +

              DFeUtil.SeSenao(AProvedor = proISSDigital,
               '<' + Prefixo4 + 'Senha>' +
                 Senha +
               '</' + Prefixo4 + 'Senha>' +
               '<' + Prefixo4 + 'FraseSecreta>' +
                 FraseSecreta +
               '</' + Prefixo4 + 'FraseSecreta>', '') +

              '</' + Prefixo3 + 'Prestador>';

 if NumeroNFSe <> ''
  then DadosMsg := DadosMsg + '<' + Prefixo3 + 'NumeroNfse' +
                               NumeroNFSe +
                              '</' + Prefixo3 + 'NumeroNfse>';

 if (DataInicial>0) and (DataFinal>0)
  then DadosMsg := DadosMsg + '<' + Prefixo3 + 'PeriodoEmissao>' +
                               '<' + Prefixo3 + 'DataInicial>' +
                                 FormatDateTime('yyyy-mm-dd', DataInicial) +
                               '</' + Prefixo3 + 'DataInicial>' +
                               '<' + Prefixo3 + 'DataFinal>' +
                                 FormatDateTime('yyyy-mm-dd', DataFinal) +
                               '</' + Prefixo3 + 'DataFinal>' +
                              '</' + Prefixo3 + 'PeriodoEmissao>';

 if AProvedor in [proFiorilli, profintelISS]
  then DadosMsg := DadosMsg + '<' + Prefixo3 + 'Pagina>' +
                                IntToStr(APagina) +
                              '</' + Prefixo3 + 'Pagina>';

 Result := TagI + DadosMsg + TagF;

 if AProvedor = proNenhum then Result := '';
end;

class function TNFSeG.Gera_DadosMsgCancelarNFSe(Prefixo4, NameSpaceDad, NumeroNFSe,
  CNPJ, IM, CodMunicipio, CodCancelamento: String; TagI,
  TagF: AnsiString; AProvedor: TnfseProvedor = proNenhum): AnsiString;
var
 DadosMsg: AnsiString;
begin
 case AProvedor of
  proGinfes: DadosMsg := '<Prestador>' +
                          '<' + Prefixo4 + 'Cnpj>' +
                            Cnpj +
                          '</' + Prefixo4 + 'Cnpj>' +
                          '<' + Prefixo4 + 'InscricaoMunicipal>' +
                            IM +
                          '</' + Prefixo4 + 'InscricaoMunicipal>' +
                         '</Prestador>' +
                         '<NumeroNfse>' +
                           NumeroNFSe +
                         '</NumeroNfse>';

  else DadosMsg := '<' + Prefixo4 + 'IdentificacaoNfse>' +
                    '<' + Prefixo4 + 'Numero>' +
                      NumeroNFse +
                    '</' + Prefixo4 + 'Numero>' +

                    // alterado por joel takei 05/07/2013
                   DFeUtil.SeSenao(AProvedor in [pro4R, proISSe, profintelISS,
                                                 proFiorilli, proVirtual, proISSDigital],

                    '<' + Prefixo4 + 'CpfCnpj>' +
                     '<' + Prefixo4 + 'Cnpj>' +
                      Cnpj +
                     '</' + Prefixo4 + 'Cnpj>' +
                    '</' + Prefixo4 + 'CpfCnpj>',

                    '<' + Prefixo4 + 'Cnpj>' +
                      Cnpj +
                    '</' + Prefixo4 + 'Cnpj>') +

                    '<' + Prefixo4 + 'InscricaoMunicipal>' +
                      IM +
                    '</' + Prefixo4 + 'InscricaoMunicipal>' +
                    '<' + Prefixo4 + 'CodigoMunicipio>' +
                      CodMunicipio +
                    '</' + Prefixo4 + 'CodigoMunicipio>' +
                   '</' + Prefixo4 + 'IdentificacaoNfse>' +
                   '<' + Prefixo4 + 'CodigoCancelamento>' +

                     // Codigo de Cancelamento
                     // 1 - Erro de emissão
                     // 2 - Serviço não concluido
                     // 3 - RPS Cancelado na Emissão

                     CodCancelamento +

                   '</' + Prefixo4 + 'CodigoCancelamento>' +
                  '</' + Prefixo4 + 'InfPedidoCancelamento>';
 end;

 Result := TagI + DadosMsg + TagF;

 if AProvedor = proNenhum then Result := '';
end;

class function TNFSeG.Gera_DadosMsgGerarNFSe(Prefixo3, Prefixo4,
  Identificador, NameSpaceDad, VersaoDados, VersaoXML, NumeroLote, CNPJ,
  IM, QtdeNotas: String; Notas, TagI, TagF: AnsiString; AProvedor: TnfseProvedor = proNenhum): AnsiString;
var
 DadosMsg: AnsiString;
begin
 if AProvedor = proBetha then Prefixo3 := '';

 case AProvedor of
  pro4R,
  profintelIss,
  proGoiania,
  proGovDigital,
  proIssDigital,
  proISSe,
  proProdata,
  proPVH,
  proAgili,
  proVirtual,
  proSaatri: Result := TagI + Notas + TagF;
  else begin // proWebISS
   DadosMsg := '<' + Prefixo3 + 'LoteRps'+
                 DFeUtil.SeSenao(Identificador <> '', ' ' + Identificador + '="' + NumeroLote + '"', '') +
                 DFeUtil.SeSenao(VersaoDados <> '', ' versao="' + VersaoDados + '"', '') + '>' +
                '<' + Prefixo4 + 'NumeroLote>' +
                  NumeroLote +
                '</' + Prefixo4 + 'NumeroLote>' +

                DFeUtil.SeSenao(VersaoXML = '2',

                  '<' + Prefixo4 + 'CpfCnpj>' +
                   DFeUtil.SeSenao(Length(OnlyNumber(Cnpj)) <= 11,
                   '<' + Prefixo4 + 'Cpf>' +
                     Cnpj +
                   '</' + Prefixo4 + 'Cpf>',
                   '<' + Prefixo4 + 'Cnpj>' +
                     Cnpj +
                   '</' + Prefixo4 + 'Cnpj>') +
                  '</' + Prefixo4 + 'CpfCnpj>',

                  '<' + Prefixo4 + 'Cnpj>' +
                    Cnpj +
                  '</' + Prefixo4 + 'Cnpj>') +

                '<' + Prefixo4 + 'InscricaoMunicipal>' +
                  IM +
                '</' + Prefixo4 + 'InscricaoMunicipal>' +
                '<' + Prefixo4 + 'QuantidadeRps>' +
                  QtdeNotas +
                '</' + Prefixo4 + 'QuantidadeRps>' +
                '<' + Prefixo4 + 'ListaRps>' +
                 Notas +
                '</' + Prefixo4 + 'ListaRps>' +
               '</' + Prefixo3 + 'LoteRps>';

   Result := TagI + DadosMsg + TagF;
  end;
 end;

 if AProvedor in [proNenhum, proAbaco, proBetha, proBetim, proBHIss, proDigifred,
  proEquiplano, proFiorilli, proFIssLex, proGinfes, proGovBR, proIssCuritiba,
  proIssIntel, proIssNet, proNatal, proProdemge, proPublica, proRecife, proRJ,
  proSimplIss, proThema, proTiplan, proCoplan, proIssDSF, proAgili, proSalvador] then Result := '';
end;

class function TNFSeG.Gera_DadosMsgEnviarSincrono(Prefixo3, Prefixo4,
  Identificador, NameSpaceDad, VersaoDados, VersaoXML, NumeroLote, CNPJ,
  IM, QtdeNotas: String; Notas, TagI, TagF: AnsiString; AProvedor: TnfseProvedor = proNenhum): AnsiString;
begin
 Result := Gera_DadosMsgEnviarLote(Prefixo3, Prefixo4, Identificador, NameSpaceDad,
                                   VersaoDados, VersaoXML, NumeroLote, CNPJ, IM,
                                   QtdeNotas, Notas, TagI, TagF, AProvedor);

 if AProvedor in [proNenhum, proAbaco, proBetha, proBetim, proBHISS, proDigifred,
     proEquiplano, profintelISS, proFISSLex, proGinfes, proGoiania, proGovBR,
     proGovDigital, proIssCuritiba, proISSDigital, proISSIntel, proISSNet, proNatal,
     proProdemge, proPublica, proRecife, proRJ, proSaatri, proSimplISS, proThema,
     proTiplan, proWebISS, proCoplan, proProdata, proAgili, proSalvador] then Result := '';
end;

//-------------------------------------------------------------------------
// As classes abaixo são exclusivas para o provedor DSF
//-------------------------------------------------------------------------
class function TNFSeG.Gera_DadosMsgEnviarLoteDSF(Prefixo3, Prefixo4,
  Identificador, NameSpaceDad, VersaoXML, NumeroLote, CodCidade, CNPJ, IM,
  RazaoSocial, Transacao, QtdeNotas, ValorTotalServicos,
  ValorTotalDeducoes: String; DataInicial, DataFinal: TDateTime; Notas,
  TagI, TagF: AnsiString): AnsiString;
var
 DadosMsg: AnsiString;
begin
 DadosMsg := '<Cabecalho>' +
               '<CodCidade>'            + CodCidade   + '</CodCidade>' +
               '<CPFCNPJRemetente>'     + Cnpj        + '</CPFCNPJRemetente>' +
               '<RazaoSocialRemetente>' + RazaoSocial + '</RazaoSocialRemetente>' +
               '<transacao>'            + Transacao   + '</transacao>' +
               '<dtInicio>' + FormatDateTime('yyyy-mm-dd', DataInicial) + '</dtInicio>' +
               '<dtFim>'    + FormatDateTime('yyyy-mm-dd', DataFinal) + '</dtFim>' +
               '<QtdRPS>'               + QtdeNotas               + '</QtdRPS>' +
               '<ValorTotalServicos>'   + ValorTotalServicos + '</ValorTotalServicos>' +
               '<ValorTotalDeducoes>'   + ValorTotalDeducoes + '</ValorTotalDeducoes>' +
               '<Versao>'               + VersaoXML          + '</Versao>' +
               '<MetodoEnvio>'          + 'WS'               + '</MetodoEnvio>' +
             '</Cabecalho>' +
             '<Lote ' + Identificador + '="Lote:' + NumeroLote + '">' +
                Notas +
             '</Lote>';

  Result := TagI + DadosMsg + TagF;
end;

class function TNFSeG.Gera_DadosMsgConsLoteDSF(Prefixo3, Prefixo4,
  NameSpaceDad, VersaoXML, CodCidade, CNPJ, NumeroLote: String; TagI,
  TagF: AnsiString): AnsiString;
var
 DadosMsg: AnsiString;
begin
 DadosMsg := '<Cabecalho>' +
               '<CodCidade>' + CodCidade + '</CodCidade>' +
               '<CPFCNPJRemetente>' + Cnpj + '</CPFCNPJRemetente>' +
               '<Versao>' + VersaoXML + '</Versao>' +
               '<NumeroLote>' + NumeroLote + '</NumeroLote>' +
             '</Cabecalho>';

 Result := TagI + DadosMsg + TagF;
end;

class function TNFSeG.Gera_DadosMsgConsNFSeRPSDSF(Prefixo3, Prefixo4,
  NameSpaceDad, VersaoXML, CodCidade, CNPJ, Transacao, NumeroLote: String;
  Notas, TagI, TagF: AnsiString): AnsiString;
var
 DadosMsg: AnsiString;
begin
  DadosMsg := '<Cabecalho>' +
               '<CodCidade>' + CodCidade + '</CodCidade>' +
               '<CPFCNPJRemetente>' + Cnpj + '</CPFCNPJRemetente>' +
               '<transacao>' + Transacao + '</transacao>' +
               '<Versao>' + VersaoXML + '</Versao>' +
             '</Cabecalho>' +
             '<Lote  Id="Lote:' + NumeroLote + '">' +
                Notas +
             '</Lote>';

 Result := TagI + DadosMsg + TagF;
end;

class function TNFSeG.Gera_DadosMsgConsNFSeDSF(Prefixo3, Prefixo4,
  NameSpaceDad, VersaoXML, CodCidade, CNPJ, IM, NotaInicial: String;
  DataInicial, DataFinal: TDateTime; TagI, TagF: AnsiString): AnsiString;
var
 DadosMsg: AnsiString;
begin
 DadosMsg := '<Cabecalho Id="Consulta:notas">' +
               '<CodCidade>'         + CodCidade    + '</CodCidade>' +
               '<CPFCNPJRemetente>'  + CNPJ         + '</CPFCNPJRemetente>' +
               '<InscricaoMunicipalPrestador>' + IM + '</InscricaoMunicipalPrestador>' +

               '<dtInicio>' +
                 FormatDateTime('yyyy-mm-dd', DataInicial) +
               '</dtInicio>' +

               '<dtFim>' +
                 FormatDateTime('yyyy-mm-dd', DataFinal) +
               '</dtFim>' +

               '<NotaInicial>' + NotaInicial + '</NotaInicial>' +
               '<Versao>'      + VersaoXML   + '</Versao>' +
             '</Cabecalho>';

 Result := TagI + DadosMsg + TagF;
end;

class function TNFSeG.Gera_DadosMsgCancelarNFSeDSF(Prefixo3, Prefixo4,
  NameSpaceDad, VersaoXML, CNPJ, Transacao, CodMunicipio,
  NumeroLote: String; Notas, TagI, TagF: AnsiString): AnsiString;
var
 DadosMsg: AnsiString;
begin

 DadosMsg := '<Cabecalho>' +
		         '<CodCidade>'        + CodMunicipio + '</CodCidade>' +
		         '<CPFCNPJRemetente>' + CNPJ      + '</CPFCNPJRemetente> ' +
		         '<transacao>'        + Transacao + '</transacao>' +
		         '<Versao>'           + VersaoXML + '</Versao>' +
	          '</Cabecalho>' +
             '<Lote Id="Lote:' + NumeroLote + '">' +
                Notas +
             '</Lote>';

 Result := TagI + DadosMsg + TagF;
end;

class function TNFSeG.Gera_DadosMsgConsSeqRPSDSF(TagI, TagF: AnsiString;
  VersaoXML, CodCidade, IM, CNPJ, SeriePrestacao: String): AnsiString;
var
 DadosMsg: AnsiString;
begin
 //consultar sequencial RPS
 DadosMsg := '<Cabecalho>' +
               '<CodCid>' + CodCidade + '</CodCid>' +
               '<IMPrestador>' + IM + '</IMPrestador>' +
               '<CPFCNPJRemetente>' + CNPJ + '</CPFCNPJRemetente>' +
               '<SeriePrestacao>' + SeriePrestacao + '</SeriePrestacao>' +
               '<Versao>' + VersaoXML + '</Versao>' +
             '</Cabecalho>';

 Result := TagI + DadosMsg + TagF;
end;

end.
