unit pnfsNFSeW;

interface

uses
{$IFDEF FPC}
  LResources, Controls, Graphics, Dialogs,
{$ELSE}
  StrUtils,
{$ENDIF}
  SysUtils, Classes,
  pcnAuxiliar, pcnConversao, pcnGerador,
  pnfsNFSe, pnfsConversao,
  ACBrNFSeConfiguracoes, synacode;

type

 TGeradorOpcoes   = class;

 TNFSeW = class(TPersistent)
  private
    FGerador: TGerador;
    FNFSe: TNFSe;
    FProvedor: TnfseProvedor;
    FOpcoes: TGeradorOpcoes;
    FAtributo: String;
    FPrefixo4: String;
    FIdentificador: String;
    FURL: String;
    FVersaoXML: String;
    FDefTipos: String;
    FServicoEnviar: String;

    procedure GerarIdentificacaoRPS;
    procedure GerarRPSSubstituido;

    procedure GerarServicoValores_V1;
    procedure GerarServicoValores_V2;
    procedure GerarListaServicos;
    procedure GerarValoresServico;

    procedure GerarPrestador;
    procedure GerarTomador;
    procedure GerarIntermediarioServico;
    procedure GerarConstrucaoCivil;

    procedure GerarXML_ABRASF_V1;
    procedure GerarXML_ABRASF_V2;

    procedure GerarServico_Provedor_IssDsf;
    procedure GerarXML_Provedor_IssDsf;

  public
    constructor Create(AOwner: TNFSe);
    destructor Destroy; override;
    function GerarXml: boolean;
    function ObterNomeArquivo: string;
  published
    property Gerador: TGerador read FGerador write FGerador;
    property NFSe: TNFSe read FNFSe write FNFSe;
    property Provedor: TnfseProvedor read FProvedor write FProvedor;
    property Opcoes: TGeradorOpcoes read FOpcoes write FOpcoes;
    property Atributo: String read FAtributo write FAtributo;
    property Prefixo4: String read FPrefixo4 write FPrefixo4;
    property Identificador: String read FIdentificador write FIdentificador;
    property URL: String read FURL write FURL;
    property VersaoXML: String read FVersaoXML write FVersaoXML;
    property DefTipos: String read FDefTipos write FDefTipos;
    property ServicoEnviar: String read FServicoEnviar write FServicoEnviar;
  end;

 TGeradorOpcoes = class(TPersistent)
  private
    FAjustarTagNro: boolean;
    FNormatizarMunicipios: boolean;
    FGerarTagAssinatura: TnfseTagAssinatura;
    FPathArquivoMunicipios: string;
    FValidarInscricoes: boolean;
    FValidarListaServicos: boolean;
  published
    property AjustarTagNro: boolean read FAjustarTagNro write FAjustarTagNro;
    property NormatizarMunicipios: boolean read FNormatizarMunicipios write FNormatizarMunicipios;
    property GerarTagAssinatura: TnfseTagAssinatura read FGerarTagAssinatura write FGerarTagAssinatura;
    property PathArquivoMunicipios: string read FPathArquivoMunicipios write FPathArquivoMunicipios;
    property ValidarInscricoes: boolean read FValidarInscricoes write FValidarInscricoes;
    property ValidarListaServicos: boolean read FValidarListaServicos write FValidarListaServicos;
  end;

  ////////////////////////////////////////////////////////////////////////////////

implementation

uses
 ACBrUtil, ACBrNFSe, ACBrNFSeUtil;

{ TNFSeW }

constructor TNFSeW.Create(AOwner: TNFSe);
begin
 FNFSe                         := AOwner;
 FGerador                      := TGerador.Create;
 FGerador.FIgnorarTagNivel     := '|?xml version|NFSe xmlns|infNFSe versao|obsCont|obsFisco|';
 FOpcoes                       := TGeradorOpcoes.Create;
 FOpcoes.FAjustarTagNro        := True;
 FOpcoes.FNormatizarMunicipios := False;
 FOpcoes.FGerarTagAssinatura   := taSomenteSeAssinada;
 FOpcoes.FValidarInscricoes    := False;
 FOpcoes.FValidarListaServicos := False;
end;

destructor TNFSeW.Destroy;
begin
 FGerador.Free;
 FOpcoes.Free;

 inherited Destroy;
end;

////////////////////////////////////////////////////////////////////////////////

function TNFSeW.ObterNomeArquivo: string;
begin
 Result := SomenteNumeros(NFSe.infID.ID) + '.xml';
end;

function TNFSeW.GerarXml: boolean;
var
 Gerar : boolean;
begin
 Gerador.ArquivoFormatoXML := '';
 Gerador.Prefixo           := FPrefixo4;

 if (FProvedor in [pro4R, proAgili, proBHISS, proCoplan, proDigifred,
                   profintelISS, proFiorilli, proGoiania, proGovBR,
                   proISSDigital, proNatal, proProdata, proProdemge, proPVH,
                   proSaatri, proVirtual])
   then FDefTipos := FServicoEnviar;

 if (RightStr(FURL, 1) <> '/') and (FDefTipos <> '')
   then FDefTipos := '/' + FDefTipos;

 if Trim(FPrefixo4) <> ''
   then Atributo := ' xmlns:' + stringReplace(Prefixo4, ':', '', []) + '="' + FURL + FDefTipos + '"'
   else Atributo := ' xmlns="' + FURL + FDefTipos + '"';

 // Jonatan ISS Nova Lima
 if (FProvedor = proISSDigital) and (NFSe.NumeroLote <> '')
   then Atributo := ' Id="' +  (NFSe.IdentificacaoRps.Numero) + '"';

 if FProvedor <> proIssDsf then
   // Alterado Por Cleiver em 01/02/2013
   if (FProvedor in [proGoiania, proProdata])
     then begin
      Gerador.wGrupo('GerarNfseEnvio' + Atributo);
	    Gerador.wGrupo('Rps');
     end
     else Gerador.wGrupo('Rps' + Atributo);

 case FProvedor of
  proISSDigital: FNFSe.InfID.ID := NotaUtil.ChaveAcesso(FNFSe.Prestador.cUF,
                         FNFSe.DataEmissao,
                         FNFSe.Prestador.Cnpj,
                         0, // Serie
                         StrToInt(SomenteNumeros(FNFSe.IdentificacaoRps.Numero)),
                         StrToInt(SomenteNumeros(FNFSe.IdentificacaoRps.Numero)));

  proIssDsf: FNFSe.InfID.ID := FNFSe.IdentificacaoRps.Numero;
  proSalvador: FNFSe.InfID.ID := SomenteNumeros(FNFSe.IdentificacaoRps.Numero);
  else FNFSe.InfID.ID := SomenteNumeros(FNFSe.IdentificacaoRps.Numero) + FNFSe.IdentificacaoRps.Serie;
 end;

 case FProvedor of
  proAbaco,
  proBetha,
  proBetim,
  proBHISS,
  proFISSLex,
  proGinfes,
  proGovBR,
  proISSCuritiba,
  proISSIntel,
  proISSNet,
  proNatal,
  proProdemge,
  proPublica,
  proRecife,
  proRJ,
  proSimplISS,
  proThema,
  proTiplan,
  proWebISS,
  proSalvador: GerarXML_ABRASF_V1;

  pro4R,
  proAgili,
  proCoplan,
  proDigifred,
  proFIntelISS,
  proFiorilli,
  proGoiania,
  proGovDigital,
  proISSDigital,
  proISSe,
  proProdata,
  proPVH,
  proSaatri,
  proVirtual: GerarXML_ABRASF_V2;

  proIssDsf:     GerarXML_Provedor_IssDsf;
 end;

 if FOpcoes.GerarTagAssinatura <> taNunca
   then begin
    Gerar := true;
    if FOpcoes.GerarTagAssinatura = taSomenteSeAssinada
      then Gerar := ((NFSe.signature.DigestValue <> '') and
                     (NFSe.signature.SignatureValue <> '') and
                     (NFSe.signature.X509Certificate <> ''));
    if FOpcoes.GerarTagAssinatura = taSomenteParaNaoAssinada
      then Gerar := ((NFSe.signature.DigestValue = '') and
                     (NFSe.signature.SignatureValue = '') and
                     (NFSe.signature.X509Certificate = ''));
    if Gerar
      then begin
       FNFSe.signature.URI := FNFSe.InfID.ID;
       FNFSe.signature.Gerador.Opcoes.IdentarXML := Gerador.Opcoes.IdentarXML;
       FNFSe.signature.GerarXMLNFSe;
       Gerador.ArquivoFormatoXML := Gerador.ArquivoFormatoXML + FNFSe.signature.Gerador.ArquivoFormatoXML;
      end;
   end;

 if FProvedor <> proIssDsf then
   // Alterado por Cleiver em 01/02/2013
   if (FProvedor in [proGoiania, proProdata])
     then begin
      Gerador.wGrupo('/Rps');
      Gerador.wGrupo('/GerarNfseEnvio');
     end
     else Gerador.wGrupo('/Rps');

 Gerador.gtAjustarRegistros(NFSe.InfID.ID);
 Result := (Gerador.ListaDeAlertas.Count = 0);
end;

////////////////////////////////////////////////////////////////////////////////

procedure TNFSeW.GerarIdentificacaoRPS;
begin
 Gerador.wGrupoNFSe('IdentificacaoRps');
  Gerador.wCampoNFSe(tcStr, '#1', 'Numero', 01, 15, 1, SomenteNumeros(NFSe.IdentificacaoRps.Numero), '');
  Gerador.wCampoNFSe(tcStr, '#2', 'Serie ', 01, 05, 1, NFSe.IdentificacaoRps.Serie, '');
  Gerador.wCampoNFSe(tcStr, '#3', 'Tipo  ', 01, 01, 1, TipoRPSToStr(NFSe.IdentificacaoRps.Tipo), '');
 Gerador.wGrupoNFSe('/IdentificacaoRps');
end;

procedure TNFSeW.GerarRPSSubstituido;
begin
 if NFSe.RpsSubstituido.Numero<>''
  then begin
   Gerador.wGrupoNFSe('RpsSubstituido');
    Gerador.wCampoNFSe(tcStr, '#10', 'Numero', 01, 15, 1, SomenteNumeros(NFSe.RpsSubstituido.Numero), '');
    Gerador.wCampoNFSe(tcStr, '#11', 'Serie ', 01, 05, 1, NFSe.RpsSubstituido.Serie, '');
    Gerador.wCampoNFSe(tcStr, '#12', 'Tipo  ', 01, 01, 1, TipoRPSToStr(NFSe.RpsSubstituido.Tipo), '');
   Gerador.wGrupoNFSe('/RpsSubstituido');
  end;
end;

procedure TNFSeW.GerarServicoValores_V1;
var
 i: Integer;
begin
  Gerador.wGrupoNFSe('Servico');            
   Gerador.wGrupoNFSe('Valores');
    Gerador.wCampoNFSe(tcDe2, '#13', 'ValorServicos', 01, 15, 1, NFSe.Servico.Valores.ValorServicos, '');
    if FProvedor in [proGinfes, proRecife]
      then begin
        Gerador.wCampoNFSe(tcDe2, '#14', 'ValorDeducoes', 01, 15, 1, NFSe.Servico.Valores.ValorDeducoes, '');
        Gerador.wCampoNFSe(tcDe2, '#15', 'ValorPis     ', 01, 15, 1, NFSe.Servico.Valores.ValorPis, '');
        Gerador.wCampoNFSe(tcDe2, '#16', 'ValorCofins  ', 01, 15, 1, NFSe.Servico.Valores.ValorCofins, '');
        Gerador.wCampoNFSe(tcDe2, '#17', 'ValorInss    ', 01, 15, 1, NFSe.Servico.Valores.ValorInss, '');
        Gerador.wCampoNFSe(tcDe2, '#18', 'ValorIr      ', 01, 15, 1, NFSe.Servico.Valores.ValorIr, '');
        Gerador.wCampoNFSe(tcDe2, '#19', 'ValorCsll    ', 01, 15, 1, NFSe.Servico.Valores.ValorCsll, '');
        Gerador.wCampoNFSe(tcStr, '#20', 'IssRetido    ', 01, 01, 1, SituacaoTributariaToStr(NFSe.Servico.Valores.IssRetido), '');
        Gerador.wCampoNFSe(tcDe2, '#21', 'ValorIss     ', 01, 15, 1, NFSe.Servico.Valores.ValorIss, '');
      end
      else begin
        Gerador.wCampoNFSe(tcDe2, '#14', 'ValorDeducoes', 01, 15, 0, NFSe.Servico.Valores.ValorDeducoes, '');
        Gerador.wCampoNFSe(tcDe2, '#15', 'ValorPis     ', 01, 15, 0, NFSe.Servico.Valores.ValorPis, '');
        Gerador.wCampoNFSe(tcDe2, '#16', 'ValorCofins  ', 01, 15, 0, NFSe.Servico.Valores.ValorCofins, '');
        Gerador.wCampoNFSe(tcDe2, '#17', 'ValorInss    ', 01, 15, 0, NFSe.Servico.Valores.ValorInss, '');
        Gerador.wCampoNFSe(tcDe2, '#18', 'ValorIr      ', 01, 15, 0, NFSe.Servico.Valores.ValorIr, '');
        Gerador.wCampoNFSe(tcDe2, '#19', 'ValorCsll    ', 01, 15, 0, NFSe.Servico.Valores.ValorCsll, '');
        Gerador.wCampoNFSe(tcStr, '#20', 'IssRetido    ', 01, 01, 1, SituacaoTributariaToStr(NFSe.Servico.Valores.IssRetido), '');
        Gerador.wCampoNFSe(tcDe2, '#21', 'ValorIss     ', 01, 15, 0, NFSe.Servico.Valores.ValorIss, '');
      end;

    if FProvedor <> proGovBR then
        Gerador.wCampoNFSe(tcDe2, '#22', 'ValorIssRetido', 01, 15, 0, NFSe.Servico.Valores.ValorIssRetido, '');

    Gerador.wCampoNFSe(tcDe2, '#23', 'OutrasRetencoes', 01, 15, 0, NFSe.Servico.Valores.OutrasRetencoes, '');
    Gerador.wCampoNFSe(tcDe2, '#24', 'BaseCalculo    ', 01, 15, 0, NFSe.Servico.Valores.BaseCalculo, '');

    case FProvedor of
     proISSNet:   Gerador.wCampoNFSe(tcDe4, '#25', 'Aliquota', 01, 05, 1, NFSe.Servico.Valores.Aliquota, '');
     proRecife:   if NFSe.OptanteSimplesNacional = snSim
                    then Gerador.wCampoNFSe(tcDe2, '#25', 'Aliquota', 01, 05, 0, NFSe.Servico.Valores.Aliquota, '')
                    else Gerador.wCampoNFSe(tcDe2, '#25', 'Aliquota', 01, 05, 1, NFSe.Servico.Valores.Aliquota, '');
     proSimplISS: Gerador.wCampoNFSe(tcDe2, '#25', 'Aliquota', 01, 05, 0, NFSe.Servico.Valores.Aliquota, '');
     else         Gerador.wCampoNFSe(tcDe4, '#25', 'Aliquota', 01, 05, 0, NFSe.Servico.Valores.Aliquota, '');
    end;

    Gerador.wCampoNFSe(tcDe2, '#26', 'ValorLiquidoNfse', 01, 15, 0, NFSe.Servico.Valores.ValorLiquidoNfse, '');

    if FProvedor = proGovBR
      then Gerador.wCampoNFSe(tcDe2, '#22', 'ValorIssRetido', 01, 15, 0, NFSe.Servico.Valores.ValorIssRetido, '');


    Gerador.wCampoNFSe(tcDe2, '#27', 'DescontoIncondicionado', 01, 15, 0, NFSe.Servico.Valores.DescontoIncondicionado, '');
    Gerador.wCampoNFSe(tcDe2, '#28', 'DescontoCondicionado  ', 01, 15, 0, NFSe.Servico.Valores.DescontoCondicionado, '');
   Gerador.wGrupoNFSe('/Valores');

   if FProvedor in [proISSNet, proWebISS]
     then Gerador.wCampoNFSe(tcStr, '#29', 'ItemListaServico', 01, 05, 1, SomenteNumeros(NFSe.Servico.ItemListaServico), '')
     else Gerador.wCampoNFSe(tcStr, '#29', 'ItemListaServico', 01, 05, 1, NFSe.Servico.ItemListaServico, '');

   Gerador.wCampoNFSe(tcStr, '#30', 'CodigoCnae', 01, 0007, 0, SomenteNumeros(NFSe.Servico.CodigoCnae), '');

   if FProvedor <> proPublica
     then Gerador.wCampoNFSe(tcStr, '#31', 'CodigoTributacaoMunicipio', 01, 0020, 0, NFSe.Servico.CodigoTributacaoMunicipio, '');

   Gerador.wCampoNFSe(tcStr, '#32', 'Discriminacao', 01, 2000, 1, NFSe.Servico.Discriminacao, '');

   // Provedor Ginfes
   // Schema: tipos_v02 o nome da tag é MunicipioPrestacaoServico *** essa versão não esta em uso
   // Schema: tipos_v03 o nome da tag é CodigoMunicipio

   // No provedor ISSNet o nome da tag é MunicipioPrestacaoServico e os demais é CodigoMunicipio
   if FProvedor = proISSNet
     then Gerador.wCampoNFSe(tcStr, '#33', 'MunicipioPrestacaoServico', 01, 0007, 1, SomenteNumeros(NFSe.Servico.CodigoMunicipio), '')
     else Gerador.wCampoNFSe(tcStr, '#33', 'CodigoMunicipio          ', 01, 0007, 1, SomenteNumeros(NFSe.Servico.CodigoMunicipio), '');

   if FProvedor = proSimplISS
     then begin
      for i := 0 to NFSe.Servico.ItemServico.Count - 1 do
         begin
          Gerador.wGrupo('ItensServico');
           Gerador.wCampo(tcStr, '#33a', 'Descricao    ', 01, 100, 1, NFSe.Servico.ItemServico[i].Descricao, '');
           Gerador.wCampo(tcInt, '#33b', 'Quantidade   ', 01, 015, 1, NFSe.Servico.ItemServico[i].Quantidade, '');
           Gerador.wCampo(tcDe2, '#33c', 'ValorUnitario', 01, 015, 1, NFSe.Servico.ItemServico[i].ValorUnitario, '');
          Gerador.wGrupo('/ItensServico');
         end;
      if NFSe.Servico.ItemServico.Count > 10
        then Gerador.wAlerta('#33a', 'ItensServico', 'Itens de Servico', ERR_MSG_MAIOR_MAXIMO + '10');
     end;

  Gerador.wGrupoNFSe('/Servico');
end;

procedure TNFSeW.GerarServicoValores_V2;
begin
  Gerador.wGrupoNFSe('Servico');
   Gerador.wGrupoNFSe('Valores');
    Gerador.wCampoNFSe(tcDe2, '#13', 'ValorServicos  ', 01, 15, 1, NFSe.Servico.Valores.ValorServicos, '');

    if FProvedor in [profintelISS]
      then begin
       Gerador.wCampoNFSe(tcDe2, '#14', 'ValorDeducoes  ', 01, 15, 1, NFSe.Servico.Valores.ValorDeducoes, '');
       Gerador.wCampoNFSe(tcDe2, '#21', 'ValorIss       ', 01, 15, 1, NFSe.Servico.Valores.ValorIss, '');
      end
      else begin
       Gerador.wCampoNFSe(tcDe2, '#14', 'ValorDeducoes  ', 01, 15, 0, NFSe.Servico.Valores.ValorDeducoes, '');

       if FProvedor in [proGoiania, proISSe, proProdata]
         then begin
           Gerador.wCampoNFSe(tcDe2, '#15', 'ValorPis       ', 01, 15, 1, NFSe.Servico.Valores.ValorPis, '');
           Gerador.wCampoNFSe(tcDe2, '#16', 'ValorCofins    ', 01, 15, 1, NFSe.Servico.Valores.ValorCofins, '');
           Gerador.wCampoNFSe(tcDe2, '#17', 'ValorInss      ', 01, 15, 1, NFSe.Servico.Valores.ValorInss, '');
           Gerador.wCampoNFSe(tcDe2, '#18', 'ValorIr        ', 01, 15, 1, NFSe.Servico.Valores.ValorIr, '');
           Gerador.wCampoNFSe(tcDe2, '#19', 'ValorCsll      ', 01, 15, 1, NFSe.Servico.Valores.ValorCsll, '');
           Gerador.wCampoNFSe(tcDe2, '#23', 'OutrasRetencoes', 01, 15, 0, NFSe.Servico.Valores.OutrasRetencoes, '');
         end
         else begin
           Gerador.wCampoNFSe(tcDe2, '#15', 'ValorPis       ', 01, 15, 0, NFSe.Servico.Valores.ValorPis, '');
           Gerador.wCampoNFSe(tcDe2, '#16', 'ValorCofins    ', 01, 15, 0, NFSe.Servico.Valores.ValorCofins, '');
           Gerador.wCampoNFSe(tcDe2, '#17', 'ValorInss      ', 01, 15, 0, NFSe.Servico.Valores.ValorInss, '');
           Gerador.wCampoNFSe(tcDe2, '#18', 'ValorIr        ', 01, 15, 0, NFSe.Servico.Valores.ValorIr, '');
           Gerador.wCampoNFSe(tcDe2, '#19', 'ValorCsll      ', 01, 15, 0, NFSe.Servico.Valores.ValorCsll, '');
           Gerador.wCampoNFSe(tcDe2, '#23', 'OutrasRetencoes', 01, 15, 0, NFSe.Servico.Valores.OutrasRetencoes, '');
         end;

       if FProvedor in [pro4R, proISSDigital, proISSe, proFiorilli, proSaatri]
         then Gerador.wCampoNFSe(tcDe2, '#21', 'ValorIss', 01, 15, 1, NFSe.Servico.Valores.ValorIss, '')
         else Gerador.wCampoNFSe(tcDe2, '#21', 'ValorIss', 01, 15, 0, NFSe.Servico.Valores.ValorIss, '');
      end;

    if not (FProvedor in [pro4R, profinteliSS, proFiorilli, proGoiania, proISSDigital, proISSe, proProdata, proPVH, proSaatri])
      then Gerador.wCampoNFSe(tcDe2, '#24', 'BaseCalculo', 01, 15, 0, NFSe.Servico.Valores.BaseCalculo, '');

    if FProvedor in [pro4R, profintelISS, proISSDigital, proISSe, proFiorilli, proSaatri]
      then Gerador.wCampoNFSe(tcDe4, '#25', 'Aliquota', 01, 05, 1, NFSe.Servico.Valores.Aliquota, '')
      else begin
        if FProvedor = proGoiania
          then begin
            if NFSe.OptanteSimplesNacional = snSim
              then Gerador.wCampoNFSe(tcDe4, '#25', 'Aliquota', 01, 05, 0, NFSe.Servico.Valores.Aliquota, '');
          end
          else Gerador.wCampoNFSe(tcDe4, '#25', 'Aliquota', 01, 05, 0, NFSe.Servico.Valores.Aliquota, '');
      end;

    if FProvedor in [profintelISS]
      then Gerador.wCampoNFSe(tcDe2, '#24', 'BaseCalculo', 01, 15, 1, NFSe.Servico.Valores.BaseCalculo, '');

    if FProvedor in [pro4R, proFiorilli, proGoiania, proISSDigital, proISSe, proProdata, proPVH, proSaatri]
      then begin
       Gerador.wCampoNFSe(tcDe2, '#27', 'DescontoIncondicionado', 01, 15, 0, NFSe.Servico.Valores.DescontoIncondicionado, '');
       Gerador.wCampoNFSe(tcDe2, '#28', 'DescontoCondicionado  ', 01, 15, 0, NFSe.Servico.Valores.DescontoCondicionado, '');
      end
      else begin
       Gerador.wCampoNFSe(tcDe2, '#27', 'DescontoCondicionado  ', 01, 15, 0, NFSe.Servico.Valores.DescontoCondicionado, '');
       Gerador.wCampoNFSe(tcDe2, '#28', 'DescontoIncondicionado', 01, 15, 0, NFSe.Servico.Valores.DescontoIncondicionado, '');
      end;

   Gerador.wGrupoNFSe('/Valores');

   if FProvedor <> proGoiania
     then Gerador.wCampoNFSe(tcStr, '#20', 'IssRetido', 01, 01, 1, SituacaoTributariaToStr(NFSe.Servico.Valores.IssRetido), '');

   if (NFSe.Servico.Valores.IssRetido <> stNormal) and (FProvedor <> proGoiania)
     then Gerador.wCampoNFSe(tcStr, '#21', 'ResponsavelRetencao', 01, 01, 1, ResponsavelRetencaoToStr(NFSe.Servico.ResponsavelRetencao), '');

   if FProvedor <> proGoiania then
     Gerador.wCampoNFSe(tcStr, '#29', 'ItemListaServico         ', 01, 05,   0, NFSe.Servico.ItemListaServico, '');
   Gerador.wCampoNFSe(tcStr, '#30', 'CodigoCnae               ', 01, 0007, 0, SomenteNumeros(NFSe.Servico.CodigoCnae), '');
   Gerador.wCampoNFSe(tcStr, '#31', 'CodigoTributacaoMunicipio', 01, 0020, 0, SomenteNumeros(NFSe.Servico.CodigoTributacaoMunicipio), '');
   Gerador.wCampoNFSe(tcStr, '#32', 'Discriminacao            ', 01, 2000, 1, NFSe.Servico.Discriminacao, '');

   if FProvedor = proGoiania then
     NFSe.Servico.CodigoMunicipio := '025300';
   Gerador.wCampoNFSe(tcStr, '#33', 'CodigoMunicipio          ', 01, 0007, 1, SomenteNumeros(NFSe.Servico.CodigoMunicipio), '');

//   if FProvedor <> proISSDigital
//     then Gerador.wCampoNFSe(tcInt, '#34', 'CodigoPais', 04, 04,   0, NFSe.Servico.CodigoPais, '');

   Gerador.wCampoNFSe(tcInt, '#34', 'CodigoPais         ', 04, 04,   0, NFSe.Servico.CodigoPais, '');

   if FProvedor <> proGoiania then
   begin
     Gerador.wCampoNFSe(tcStr, '#35', 'ExigibilidadeISS   ', 01, 01, 1, ExigibilidadeISSToStr(NFSe.Servico.ExigibilidadeISS), '');
     Gerador.wCampoNFSe(tcInt, '#36', 'MunicipioIncidencia', 07, 07,   0, NFSe.Servico.MunicipioIncidencia, '');
   end;
   Gerador.wCampoNFSe(tcStr, '#37', 'NumeroProcesso     ', 01, 30,   0, NFSe.Servico.NumeroProcesso, '');
   Gerador.wGrupoNFSe('/Servico');
end;

procedure TNFSeW.GerarListaServicos;
var
 i: Integer;
begin
  Gerador.wGrupoNFSe('ListaServicos');
   for i := 0 to NFSe.Servico.ItemServico.Count - 1 do
    begin
     Gerador.wGrupoNFSe('Servico');
      Gerador.wGrupoNFSe('Valores');
       Gerador.wCampoNFSe(tcDe2, '#13', 'ValorServicos         ', 01, 15, 1, NFSe.Servico.ItemServico[i].ValorServicos, '');
       Gerador.wCampoNFSe(tcDe2, '#14', 'ValorDeducoes         ', 01, 15, 1, NFSe.Servico.ItemServico[i].ValorDeducoes, '');
       Gerador.wCampoNFSe(tcDe2, '#21', 'ValorIss              ', 01, 15, 1, NFSe.Servico.ItemServico[i].ValorIss, '');
       Gerador.wCampoNFSe(tcDe2, '#25', 'Aliquota              ', 01, 05, 1, NFSe.Servico.ItemServico[i].Aliquota, '');
       Gerador.wCampoNFSe(tcDe2, '#24', 'BaseCalculo           ', 01, 15, 1, NFSe.Servico.ItemServico[i].BaseCalculo, '');
       Gerador.wCampoNFSe(tcDe2, '#27', 'DescontoIncondicionado', 01, 15, 0, NFSe.Servico.ItemServico[i].DescontoIncondicionado, '');
       Gerador.wCampoNFSe(tcDe2, '#28', 'DescontoCondicionado  ', 01, 15, 0, NFSe.Servico.ItemServico[i].DescontoCondicionado, '');
      Gerador.wGrupoNFSe('/Valores');
      Gerador.wCampoNFSe(tcStr, '#20', 'IssRetido                ', 01, 01,   1, SituacaoTributariaToStr(NFSe.Servico.Valores.IssRetido), '');
      Gerador.wCampoNFSe(tcStr, '#29', 'ItemListaServico         ', 01, 0005, 1, NFSe.Servico.ItemListaServico, '');
      Gerador.wCampoNFSe(tcStr, '#30', 'CodigoCnae               ', 01, 0007, 0, SomenteNumeros(NFSe.Servico.CodigoCnae), '');
      Gerador.wCampoNFSe(tcStr, '#31', 'CodigoTributacaoMunicipio', 01, 0020, 0, SomenteNumeros(NFSe.Servico.CodigoTributacaoMunicipio), '');
      Gerador.wCampoNFSe(tcStr, '#32', 'Discriminacao            ', 01, 2000, 1, NFSe.Servico.ItemServico[i].Discriminacao, '');
     if FProvedor = proGoiania then
       NFSe.Servico.CodigoMunicipio := '025300';
      Gerador.wCampoNFSe(tcStr, '#33', 'CodigoMunicipio          ', 01, 0007, 1, SomenteNumeros(NFSe.Servico.CodigoMunicipio), '');
      Gerador.wCampoNFSe(tcInt, '#34', 'CodigoPais               ', 04, 04,   0, NFSe.Servico.CodigoPais, '');
      Gerador.wCampoNFSe(tcStr, '#35', 'ExigibilidadeISS         ', 01, 01,   1, ExigibilidadeISSToStr(NFSe.Servico.ExigibilidadeISS), '');
      Gerador.wCampoNFSe(tcInt, '#36', 'MunicipioIncidencia      ', 07, 07,   0, NFSe.Servico.MunicipioIncidencia, '');
      Gerador.wCampoNFSe(tcStr, '#37', 'NumeroProcesso           ', 01, 30,   0, NFSe.Servico.NumeroProcesso, '');
     Gerador.wGrupoNFSe('/Servico');
    end;
  Gerador.wGrupoNFSe('/ListaServicos');
end;

procedure TNFSeW.GerarValoresServico;
begin
 Gerador.wGrupoNFSe('ValoresServico');
  Gerador.wCampoNFSe(tcDe2, '#15', 'ValorPis        ', 01, 15, 0, NFSe.Servico.Valores.ValorPis, '');
  Gerador.wCampoNFSe(tcDe2, '#16', 'ValorCofins     ', 01, 15, 0, NFSe.Servico.Valores.ValorCofins, '');
  Gerador.wCampoNFSe(tcDe2, '#17', 'ValorInss       ', 01, 15, 0, NFSe.Servico.Valores.ValorInss, '');
  Gerador.wCampoNFSe(tcDe2, '#18', 'ValorIr         ', 01, 15, 0, NFSe.Servico.Valores.ValorIr, '');
  Gerador.wCampoNFSe(tcDe2, '#19', 'ValorCsll       ', 01, 15, 0, NFSe.Servico.Valores.ValorCsll, '');
  Gerador.wCampoNFSe(tcDe2, '#21', 'ValorIss        ', 01, 15, 1, NFSe.Servico.Valores.ValorIss, '');
  Gerador.wCampoNFSe(tcDe2, '#13', 'ValorLiquidoNfse', 01, 15, 1, NFSe.Servico.Valores.ValorLiquidoNfse, '');
  Gerador.wCampoNFSe(tcDe2, '#13', 'ValorServicos   ', 01, 15, 1, NFSe.Servico.Valores.ValorServicos, '');
 Gerador.wGrupoNFSe('/ValoresServico');
end;

procedure TNFSeW.GerarPrestador;
begin
 Gerador.wGrupoNFSe('Prestador');

 if (VersaoXML = '1') and (FProvedor <> proISSNet)
  then Gerador.wCampoNFSe(tcStr, '#34', 'Cnpj', 14, 14, 1, SomenteNumeros(NFSe.Prestador.Cnpj), '')
  else begin
   Gerador.wGrupoNFSe('CpfCnpj');
   if length(SomenteNumeros(NFSe.Prestador.Cnpj)) <= 11
    then Gerador.wCampoNFSe(tcStr, '#34', 'Cpf ', 11, 11, 1, SomenteNumeros(NFSe.Prestador.Cnpj), '')
    else Gerador.wCampoNFSe(tcStr, '#34', 'Cnpj', 14, 14, 1, SomenteNumeros(NFSe.Prestador.Cnpj), '');
   Gerador.wGrupoNFSe('/CpfCnpj');
  end;

 if FProvedor = proSalvador then
   Gerador.wCampoNFSe(tcStr, '#35', 'InscricaoMunicipal', 01, 15, 1, NFSe.Prestador.InscricaoMunicipal, '')
 else
   Gerador.wCampoNFSe(tcStr, '#35', 'InscricaoMunicipal', 01, 15, 0, NFSe.Prestador.InscricaoMunicipal, '');

 if (FProvedor in [proISSDigital, proAgili])
  then begin
   Gerador.wCampoNFSe(tcStr, '#36', 'Senha       ', 01, 255, 1, NFSe.Prestador.Senha, '');
   Gerador.wCampoNFSe(tcStr, '#37', 'FraseSecreta', 01, 255, 1, NFSe.Prestador.FraseSecreta, '');
  end;

 Gerador.wGrupoNFSe('/Prestador');
end;

procedure TNFSeW.GerarTomador;
begin
 if (NFSe.Tomador.IdentificacaoTomador.CpfCnpj <> '') or
    (NFSe.Tomador.RazaoSocial <> '') or
    (NFSe.Tomador.Endereco.Endereco <> '') or
    (NFSe.Tomador.Contato.Telefone <> '') or
    (NFSe.Tomador.Contato.Email <>'')
   then begin
    if (VersaoXML = '1') or
       (FProvedor in [pro4R, proAgili, proCoplan, proDigifred, proFiorilli,
                      proGoiania, proGovDigital, proISSDigital, proISSe,
                      proProdata, proPVH, proSaatri, proVirtual])
      then Gerador.wGrupoNFSe('Tomador')
      else Gerador.wGrupoNFSe('TomadorServico');

    if NFSe.Tomador.Endereco.UF <> 'EX'
      then begin
        Gerador.wGrupoNFSe('IdentificacaoTomador');
         Gerador.wGrupoNFSe('CpfCnpj');
         if Length(SomenteNumeros(NFSe.Tomador.IdentificacaoTomador.CpfCnpj)) <= 11
           then Gerador.wCampoNFSe(tcStr, '#36', 'Cpf ', 11, 11, 1, SomenteNumeros(NFSe.Tomador.IdentificacaoTomador.CpfCnpj), '')
           else Gerador.wCampoNFSe(tcStr, '#36', 'Cnpj', 14, 14, 1, SomenteNumeros(NFSe.Tomador.IdentificacaoTomador.CpfCnpj), '');
         Gerador.wGrupoNFSe('/CpfCnpj');
         Gerador.wCampoNFSe(tcStr, '#37', 'InscricaoMunicipal', 01, 15, 0, NFSe.Tomador.IdentificacaoTomador.InscricaoMunicipal, '');
         if FProvedor = proSimplISS
           then Gerador.wCampoNFSe(tcStr, '#38', 'InscricaoEstadual', 01, 20, 0, NFSe.Tomador.IdentificacaoTomador.InscricaoEstadual, '');
       Gerador.wGrupoNFSe('/IdentificacaoTomador');
      end;

    if FProvedor = proSalvador then
      Gerador.wCampoNFSe(tcStr, '#38', 'RazaoSocial', 001, 115, 1, NFSe.Tomador.RazaoSocial, '')
    else
      Gerador.wCampoNFSe(tcStr, '#38', 'RazaoSocial', 001, 115, 0, NFSe.Tomador.RazaoSocial, '');
    Gerador.wGrupoNFSe('Endereco');
     Gerador.wCampoNFSe(tcStr, '#39', 'Endereco   ', 001, 125, 0, NFSe.Tomador.Endereco.Endereco, '');
     Gerador.wCampoNFSe(tcStr, '#40', 'Numero     ', 001, 010, 0, NFSe.Tomador.Endereco.Numero, '');
     Gerador.wCampoNFSe(tcStr, '#41', 'Complemento', 001, 060, 0, NFSe.Tomador.Endereco.Complemento, '');
     Gerador.wCampoNFSe(tcStr, '#42', 'Bairro     ', 001, 060, 0, NFSe.Tomador.Endereco.Bairro, '');

     if FProvedor in [proCoplan, proDigifred, proEquiplano, proGovDigital, proISSNet, proVirtual]
      then begin
        Gerador.wCampoNFSe(tcStr, '#43', 'Cidade', 007, 007, 0, SomenteNumeros(NFSe.Tomador.Endereco.CodigoMunicipio), '');
        Gerador.wCampoNFSe(tcStr, '#44', 'Estado', 002, 002, 0, NFSe.Tomador.Endereco.UF, '');
      end
      else begin
       if FProvedor = proGoiania then
          NFSe.Tomador.Endereco.CodigoMunicipio := '025300';

        Gerador.wCampoNFSe(tcStr, '#43', 'CodigoMunicipio', 7, 7, 0, SomenteNumeros(NFSe.Tomador.Endereco.CodigoMunicipio), '');
        Gerador.wCampoNFSe(tcStr, '#44', 'Uf             ', 2, 2, 0, NFSe.Tomador.Endereco.UF, '');
      end;

     if VersaoXML = '2'
       then Gerador.wCampoNFSe(tcInt, '#34', 'CodigoPais ', 04, 04, 0, NFSe.Servico.CodigoPais, '');

     Gerador.wCampoNFSe(tcStr, '#45', 'Cep', 008, 008, 0, SomenteNumeros(NFSe.Tomador.Endereco.CEP), '');
    Gerador.wGrupoNFSe('/Endereco');

    Gerador.wGrupoNFSe('Contato');
     Gerador.wCampoNFSe(tcStr, '#46', 'Telefone', 01, 11, 0, SomenteNumeros(NFSe.Tomador.Contato.Telefone), '');
     Gerador.wCampoNFSe(tcStr, '#47', 'Email   ', 01, 80, 0, NFSe.Tomador.Contato.Email, '');
    Gerador.wGrupoNFSe('/Contato');

    if (VersaoXML = '1') or
       (FProvedor in [pro4R, proAgili, proCoplan, proDigifred, proFiorilli,
                      proGoiania, proGovDigital, proISSDigital, proISSe,
                      proProdata, proPVH, proSaatri, proVirtual])
      then Gerador.wGrupoNFSe('/Tomador')
      else Gerador.wGrupoNFSe('/TomadorServico');
   end;
end;

procedure TNFSeW.GerarIntermediarioServico;
begin
 if (NFSe.IntermediarioServico.RazaoSocial<>'') or (NFSe.IntermediarioServico.CpfCnpj <> '')
   then begin
    if VersaoXML = '1'
      then begin
       Gerador.wGrupoNFSe('IntermediarioServico');
        Gerador.wCampoNFSe(tcStr, '#48', 'RazaoSocial', 001, 115, 0, NFSe.IntermediarioServico.RazaoSocial, '');
        Gerador.wGrupoNFSe('CpfCnpj');
        if Length(SomenteNumeros(NFSe.IntermediarioServico.CpfCnpj)) <= 11
          then Gerador.wCampoNFSe(tcStr, '#49', 'Cpf ', 11, 11, 1, SomenteNumeros(NFSe.IntermediarioServico.CpfCnpj), '')
          else Gerador.wCampoNFSe(tcStr, '#49', 'Cnpj', 14, 14, 1, SomenteNumeros(NFSe.IntermediarioServico.CpfCnpj), '');
        Gerador.wGrupoNFSe('/CpfCnpj');
        Gerador.wCampoNFSe(tcStr, '#50', 'InscricaoMunicipal', 01, 15, 0, NFSe.IntermediarioServico.InscricaoMunicipal, '');
       Gerador.wGrupoNFSe('/IntermediarioServico');
      end
      else begin
       Gerador.wGrupoNFSe('Intermediario');
        Gerador.wGrupoNFSe('IdentificacaoIntermediario');
         Gerador.wGrupoNFSe('CpfCnpj');
         if Length(SomenteNumeros(NFSe.IntermediarioServico.CpfCnpj))<=11
           then Gerador.wCampoNFSe(tcStr, '#49', 'Cpf ', 11, 11, 1, SomenteNumeros(NFSe.IntermediarioServico.CpfCnpj), '')
           else Gerador.wCampoNFSe(tcStr, '#49', 'Cnpj', 14, 14, 1, SomenteNumeros(NFSe.IntermediarioServico.CpfCnpj), '');
         Gerador.wGrupoNFSe('/CpfCnpj');
         Gerador.wCampoNFSe(tcStr, '#50', 'InscricaoMunicipal', 01, 15, 0, NFSe.IntermediarioServico.InscricaoMunicipal, '');
        Gerador.wGrupoNFSe('/IdentificacaoIntermediario');
        Gerador.wCampoNFSe(tcStr, '#48', 'RazaoSocial', 001, 115, 0, NFSe.IntermediarioServico.RazaoSocial, '');
       Gerador.wGrupoNFSe('/Intermediario');
      end;
   end;
end;

procedure TNFSeW.GerarConstrucaoCivil;
begin
 if NFSe.ConstrucaoCivil.CodigoObra<>''
  then begin
   Gerador.wGrupoNFSe('ConstrucaoCivil');
    Gerador.wCampoNFSe(tcStr, '#51', 'CodigoObra', 01, 15, 1, NFSe.ConstrucaoCivil.CodigoObra, '');
    Gerador.wCampoNFSe(tcStr, '#52', 'Art       ', 01, 15, 1, NFSe.ConstrucaoCivil.Art, '');
   Gerador.wGrupoNFSe('/ConstrucaoCivil');
  end;
end;

////////////////////////////////////////////////////////////////////////////////

procedure TNFSeW.GerarXML_ABRASF_V1;
begin
  if FIdentificador = ''
    then Gerador.wGrupoNFSe('InfRps')
    else if FProvedor = proSalvador then Gerador.wGrupoNFSe('InfRps ' + FIdentificador + '="' + NFSe.InfID.ID + '"')
    else if FProvedor = proNatal then  Gerador.wGrupoNFSe('InfRps ' + FIdentificador + '="rps:' + NFSe.InfID.ID + '"')
    else  Gerador.wGrupoNFSe('InfRps ' + FIdentificador + '="rps' + NFSe.InfID.ID + '"');

   GerarIdentificacaoRPS;

   Gerador.wCampoNFSe(tcDatHor, '#4', 'DataEmissao     ', 19, 19, 1, NFSe.DataEmissao, DSC_DEMI);
   Gerador.wCampoNFSe(tcStr,    '#5', 'NaturezaOperacao', 01, 01, 1, NaturezaOperacaoToStr(NFSe.NaturezaOperacao), '');

   if FProvedor <> proPublica
     then begin
       if (NFSe.RegimeEspecialTributacao <> retNenhum)
         then Gerador.wCampoNFSe(tcStr, '#6', 'RegimeEspecialTributacao', 01, 01, 0, RegimeEspecialTributacaoToStr(NFSe.RegimeEspecialTributacao), '');
     end;

   Gerador.wCampoNFSe(tcStr, '#7', 'OptanteSimplesNacional', 01, 01, 1, SimNaoToStr(NFSe.OptanteSimplesNacional), '');
   Gerador.wCampoNFSe(tcStr, '#8', 'IncentivadorCultural  ', 01, 01, 1, SimNaoToStr(NFSe.IncentivadorCultural), '');
   Gerador.wCampoNFSe(tcStr, '#9', 'Status                ', 01, 01, 1, StatusRPSToStr(NFSe.Status), '');

   if FProvedor in [proBetha, proFISSLex, proSimplISS]
    then Gerador.wCampoNFSe(tcStr, '#11', 'OutrasInformacoes', 001, 255, 0, NFSe.OutrasInformacoes, '');

   GerarRPSSubstituido;

   GerarServicoValores_V1;
   GerarPrestador;
   GerarTomador;
   GerarIntermediarioServico;
   GerarConstrucaoCivil;

  Gerador.wGrupoNFSe('/InfRps');
end;

////////////////////////////////////////////////////////////////////////////////

procedure TNFSeW.GerarXML_ABRASF_V2;
var
  CompetenciaAux : TDateTime;
begin
  if FProvedor in [proCoplan, proDigifred, proFiorilli, proISSe, proISSDigital, proPVH]
    then begin
      Gerador.wGrupoNFSe('InfDeclaracaoPrestacaoServico ' + FIdentificador + '="rps' + NFSe.InfID.ID + '"');
       Gerador.wGrupoNFSe('Rps');
    end
    else begin
      Gerador.wGrupoNFSe('InfDeclaracaoPrestacaoServico');
       if FIdentificador = ''
         then Gerador.wGrupoNFSe('Rps')
         else Gerador.wGrupoNFSe('Rps ' + FIdentificador + '="rps' + NFSe.InfID.ID + '"');
    end;

    GerarIdentificacaoRPS;

    if FProvedor in [proAgili, proCoplan, proDigifred, proFiorilli, proISSe, proISSDigital, proProdata, proPVH, proSaatri]
      then Gerador.wCampoNFSe(tcDat,    '#4', 'DataEmissao', 10, 10, 1, NFSe.DataEmissao, DSC_DEMI)
      else Gerador.wCampoNFSe(tcDatHor, '#4', 'DataEmissao', 19, 19, 1, NFSe.DataEmissao, DSC_DEMI);

    Gerador.wCampoNFSe(tcStr,    '#9', 'Status     ', 01, 01, 1, StatusRPSToStr(NFSe.Status), '');

    GerarRPSSubstituido;

   Gerador.wGrupoNFSe('/Rps');




   if FProvedor = profintelISS
     then begin
      GerarListaServicos;

      if NFSe.Competencia <> ''
        then Gerador.wCampoNFSe(tcStr,    '#4', 'Competencia', 10, 19, 1, NFSe.Competencia, DSC_DEMI)
        else Gerador.wCampoNFSe(tcDatHor, '#4', 'Competencia', 19, 19, 1, NFSe.DataEmissao, DSC_DEMI);
     end
     else begin
      if NFSe.Competencia <> ''
        then begin
         case FProvedor of
          proPVH:     Gerador.wCampoNFSe(tcDat,    '#4', 'Competencia', 10, 10, 1, NFSe.Competencia, DSC_DEMI);
          proGoiania: begin
//            CompetenciaAux := StrToDateTimeDef(NFSe.Competencia,0);
//            Gerador.wCampoNFSe(tcDatHor, '#4', 'Competencia', 19, 19, 0, CompetenciaAux, DSC_DEMI);
          end;
          else        Gerador.wCampoNFSe(tcStr,    '#4', 'Competencia', 19, 19, 1, NFSe.Competencia, DSC_DEMI);
         end
        end
        else begin
         if FProvedor in [proPVH]
          then Gerador.wCampoNFSe(tcDat,    '#4', 'Competencia', 10, 10, 1, NFSe.DataEmissao, DSC_DEMI)
          else if FProvedor <> proGoiania then Gerador.wCampoNFSe(tcDatHor, '#4', 'Competencia', 19, 19, 0, NFSe.DataEmissao, DSC_DEMI);
        end;

      GerarServicoValores_V2;
     end;

   GerarPrestador;
   GerarTomador;
   GerarIntermediarioServico;
   GerarConstrucaoCivil;

   if (NFSe.RegimeEspecialTributacao <> retNenhum)
     then Gerador.wCampoNFSe(tcStr, '#6', 'RegimeEspecialTributacao', 01, 01, 0, RegimeEspecialTributacaoToStr(NFSe.RegimeEspecialTributacao), '');

   if FProvedor <> proGoiania
    then begin
     Gerador.wCampoNFSe(tcStr, '#7', 'OptanteSimplesNacional', 01, 01, 1, SimNaoToStr(NFSe.OptanteSimplesNacional), '');
     Gerador.wCampoNFSe(tcStr, '#8', 'IncentivoFiscal       ', 01, 01, 1, SimNaoToStr(NFSe.IncentivadorCultural), '');
    end;

   if FProvedor = profintelISS
     then GerarValoresServico;

   if FProvedor in [proAgili, proISSDigital]
     then Gerador.wCampoNFSe(tcStr, '#9', 'Producao', 01, 01, 1, SimNaoToStr(NFSe.Producao), '');

  Gerador.wGrupoNFSe('/InfDeclaracaoPrestacaoServico');
end;

////////////////////////////////////////////////////////////////////////////////

procedure TNFSeW.GerarServico_Provedor_IssDsf;
var
   i: integer;
   sDeducaoPor, sTipoDeducao: string;
begin

   for i:=0 to NFSe.Servico.ItemServico.Count -1 do begin
       Gerador.wCampoNFSe(tcStr, '', 'DiscriminacaoServico', 01, 80, 1, NFSe.Servico.ItemServico.Items[i].Descricao , '');
       Gerador.wCampoNFSe(tcDe4, '', 'Quantidade'          , 01, 15, 1, NFSe.Servico.ItemServico.Items[i].Quantidade , '');
       Gerador.wCampoNFSe(tcDe4, '', 'ValorUnitario'       , 01, 20, 1, NFSe.Servico.ItemServico.Items[i].ValorUnitario , '');
       Gerador.wCampoNFSe(tcDe2, '', 'ValorTotal'          , 01, 18, 1, NFSe.Servico.ItemServico.Items[i].ValorTotal , '');
       Gerador.wCampoNFSe(tcStr, '', 'Tributavel'          , 01, 01, 0, NFSe.Servico.ItemServico.Items[i].Descricao , '');
   end;

   for i:=0 to NFSe.Servico.Deducao.Count -1 do begin
      Gerador.wGrupoNFSe('Deducoes');
         Gerador.wGrupoNFSe('Deducao');

            sDeducaoPor := EnumeradoToStr( NFSe.Servico.Deducao.Items[i].DeducaoPor,
                                           ['Percentual', 'Valor'], [dpPercentual, dpValor]);
            Gerador.wCampoNFSe(tcStr, '', 'DeducaoPor', 01, 20, 1, sDeducaoPor , '');

            sTipoDeducao := EnumeradoToStr( NFSe.Servico.Deducao.Items[i].DeducaoPor,
                                            ['', 'Despesas com Materiais', 'Despesas com Sub-empreitada'],
                                            [tdNenhum, tdMateriais, tdSubEmpreitada]);
            Gerador.wCampoNFSe(tcStr, '', 'TipoDeducao', 00, 255, 1, sTipoDeducao , '');

            Gerador.wCampoNFSe(tcStr, '', 'CPFCNPJReferencia'   , 00, 14, 1, NFSe.Servico.Deducao.Items[i].CpfCnpjReferencia , '');
            Gerador.wCampoNFSe(tcStr, '', 'NumeroNFReferencia'  , 00, 10, 1, NFSe.Servico.Deducao.Items[i].NumeroNFReferencia, '');
            Gerador.wCampoNFSe(tcDe2, '', 'ValorTotalReferencia', 00, 18, 1, NFSe.Servico.Deducao.Items[i].ValorTotalReferencia, '');
            Gerador.wCampoNFSe(tcDe2, '', 'PercentualDeduzir'   , 00, 08, 1, NFSe.Servico.Deducao.Items[i].PercentualDeduzir, '');

         Gerador.wGrupoNFSe('/Deducao');
      Gerador.wGrupoNFSe('/Deducoes');
   end;
end;

////////////////////////////////////////////////////////////////////////////////

procedure TNFSeW.GerarXML_Provedor_IssDsf;
var
   sAssinatura, sSituacao, sTipoRecolhimento, sValorServico_Assinatura: string;
begin
   Gerador.Prefixo := '';
   Gerador.wGrupoNFSe('Rps ' + FIdentificador + '="rps:' + NFSe.InfID.ID + '"');

      sSituacao := EnumeradoToStr( NFSe.Status,
                                   ['N','C'],
                                   [srNormal, srCancelado]);

      sTipoRecolhimento := EnumeradoToStr( NFSe.Servico.Valores.IssRetido,
                                           ['A','R'],
                                           [stNormal, stRetencao]);

      sValorServico_Assinatura := Poem_Zeros( SomenteNumeros( FormatFloat('#0.00', (NFSe.Servico.Valores.ValorServicos - NFSe.Servico.Valores.ValorDeducoes) ) ), 15);

      sAssinatura := Poem_Zeros(NFSe.Prestador.InscricaoMunicipal, 11) +
                     padL( NFSe.IdentificacaoRps.Serie, 5 , ' ') +
                     Poem_Zeros(NFSe.IdentificacaoRps.Numero, 12) +
                     FormatDateTime('yyyymmdd',NFse.DataEmissaoRps) +
                     sSituacao +
                     sTipoRecolhimento +
                     sValorServico_Assinatura +
                     Poem_Zeros( SomenteNumeros( FormatFloat('#0.00',NFSe.Servico.Valores.ValorDeducoes)), 15 ) +
                     Poem_Zeros( SomenteNumeros( NFSe.Servico.CodigoCnae ), 10 );
                     Poem_Zeros( SomenteNumeros( NFSe.Tomador.IdentificacaoTomador.CpfCnpj), 14);

      sAssinatura := SHA1(sAssinatura);

      Gerador.wCampoNFSe(tcStr, '', 'Assinatura', 01, 2000, 1, sAssinatura, '');

      //Formatar segundo Cidade
      Gerador.wCampoNFSe(tcStr, '', 'InscricaoMunicipalPrestador', 01, 11,  1, NFSe.Prestador.InscricaoMunicipal, '');
      Gerador.wCampoNFSe(tcStr, '', 'RazaoSocialPrestador',        01, 120, 1, NFSe.PrestadorServico.RazaoSocial, '');
      Gerador.wCampoNFSe(tcStr, '', 'TipoRPS',                     01, 20,  1, 'RPS', '');

      if NFSe.IdentificacaoRps.Serie = '' then
         Gerador.wCampoNFSe(tcStr, '', 'Serie', 01, 02,  1, 'NF', '')
      else
         Gerador.wCampoNFSe(tcStr, '', 'Serie', 01, 02,  1, NFSe.IdentificacaoRps.Serie, '');

      Gerador.wCampoNFSe(tcStr,    '', 'NumeroRps',      01, 12,  1, NFSe.IdentificacaoRps.Numero, '');
      Gerador.wCampoNFSe(tcDatHor, '', 'DataEmissaoRPS', 01, 21,  1, NFse.DataEmissaoRps, '');

      Gerador.wCampoNFSe(tcStr, '', 'SituacaoRPS', 01, 01, 1, sSituacao, '');

      if NFSe.RpsSubstituido.Numero <> '' then begin
         if NFSe.RpsSubstituido.Serie = '' then
            Gerador.wCampoNFSe(tcStr, '', 'SerieRPSSubstituido', 00, 02, 1, 'NF', '')
         else
            Gerador.wCampoNFSe(tcStr, '', 'SerieRPSSubstituido', 00, 02, 1, NFSe.RpsSubstituido.Serie, '');

         Gerador.wCampoNFSe(tcStr, '', 'NumeroNFSeSubstituida', 00, 02, 1, NFSe.RpsSubstituido.Numero, '');
         Gerador.wCampoNFSe(tcStr, '', 'NumeroRPSSubstituido',  00, 02, 1, NFSe.RpsSubstituido.Numero, '');
      end;

      if (NFSe.SeriePrestacao = '') then
         Gerador.wCampoNFSe(tcInt, '', 'SeriePrestacao', 01, 02, 1, '99', '')
      else
         Gerador.wCampoNFSe(tcInt, '', 'SeriePrestacao', 01, 02, 1, NFSe.SeriePrestacao, '');

      //TO DO - formatar segundo padrao da cidade
      Gerador.wCampoNFSe(tcStr, '', 'InscricaoMunicipalTomador', 01, 11,  1, '', '');

      Gerador.wCampoNFSe(tcStr, '', 'CPFCNPJTomador',             01, 14,  1, NFSe.Tomador.IdentificacaoTomador.CpfCnpj, '');
      Gerador.wCampoNFSe(tcStr, '', 'RazaoSocialTomador',         01, 120, 1, NFSe.Tomador.RazaoSocial, '');
      Gerador.wCampoNFSe(tcStr, '', 'DocTomadorEstrangeiro',      00, 20,  1, NFSe.Tomador.IdentificacaoTomador.DocTomadorEstrangeiro, '');

      Gerador.wCampoNFSe(tcStr, '', 'TipoLogradouroTomador',      00, 10,  1, NFSe.Tomador.Endereco.TipoLogradouro, '');

      Gerador.wCampoNFSe(tcStr, '', 'LogradouroTomador',          01, 50,  1, NFSe.Tomador.Endereco.Endereco, '');
      Gerador.wCampoNFSe(tcStr, '', 'NumeroEnderecoTomador',      01, 09,  1, NFSe.Tomador.Endereco.Numero, '');
      Gerador.wCampoNFSe(tcStr, '', 'ComplementoEnderecoTomador', 01, 30,  0, NFSe.Tomador.Endereco.Complemento, '');

      Gerador.wCampoNFSe(tcStr, '', 'TipoBairroTomador',      00, 10,  1, NFSe.Tomador.Endereco.TipoBairro, '');

      Gerador.wCampoNFSe(tcStr, '', 'BairroTomador',          01, 50,  1, NFSe.Tomador.Endereco.Bairro, '');

       if FProvedor = proGoiania then
          NFSe.Tomador.Endereco.CodigoMunicipio := '025300';
      Gerador.wCampoNFSe(tcStr, '', 'CidadeTomador',          01, 10,  1, CodCidadeToCodSiafi(strtoint64(NFSe.Tomador.Endereco.CodigoMunicipio)), '');
      Gerador.wCampoNFSe(tcStr, '', 'CidadeTomadorDescricao', 01, 50,  1, CodCidadeToCidade(strtoint64(NFSe.Tomador.Endereco.CodigoMunicipio)), '');
      Gerador.wCampoNFSe(tcStr, '', 'CEPTomador',             01, 08,  1, NFSe.Tomador.Endereco.CEP, '');
      Gerador.wCampoNFSe(tcStr, '', 'EmailTomador',           01, 60,  1, NFSe.Tomador.Contato.Email, '');

      Gerador.wCampoNFSe(tcStr, '', 'CodigoAtividade',        01, 09,  1, NFSe.Servico.CodigoCnae, '');
      Gerador.wCampoNFSe(tcDe4, '', 'AliquotaAtividade',      01, 11,  1, NFSe.Servico.Valores.Aliquota, '');

      // "A" a receber; "R" retido na Fonte
      Gerador.wCampoNFSe(tcStr, '', 'TipoRecolhimento',01, 01,  1, sTipoRecolhimento, '');

      if FProvedor = proGoiania then
        NFSe.Servico.CodigoMunicipio := '025300';
      Gerador.wCampoNFSe(tcStr, '', 'MunicipioPrestacao',          01, 10,  1, CodCidadeToCodSiafi(strtoint64(NFSe.Servico.CodigoMunicipio)), '');
      Gerador.wCampoNFSe(tcStr, '', 'MunicipioPrestacaoDescricao', 01, 30,  1, CodCidadeToCidade(strtoint64(NFSe.Servico.CodigoMunicipio)), '');

      if (NFSe.NaturezaOperacao in [noTributacaoNoMunicipio, noTributacaoForaMunicipio]) then begin

         Gerador.wCampoNFSe(tcStr, '', 'Operacao', 01, 01, 1, EnumeradoToStr( NFSe.DeducaoMateriais, ['B','A'], [snSim, snNao]), '');

         Gerador.wCampoNFSe(tcStr, '', 'Tributacao', 01, 01, 1, EnumeradoToStr( NFSe.OptanteSimplesNacional, ['H','T'], [snSim, snNao]), '');

      end
      else if(NFSe.NaturezaOperacao = noTributacaoForaMunicipio) then begin

         Gerador.wCampoNFSe(tcStr, '', 'Operacao', 01, 01, 1, EnumeradoToStr( NFSe.DeducaoMateriais, ['B','A'], [snSim, snNao]), '');

         Gerador.wCampoNFSe(tcStr, '', 'Tributacao', 01, 01, 1, EnumeradoToStr( NFSe.OptanteSimplesNacional, ['H','G'], [snSim, snNao]), '');

      end
      else if (NFSe.NaturezaOperacao = noIsencao) then begin
         Gerador.wCampoNFSe(tcStr, '', 'Operacao',   01, 01, 1, 'C', '');
         Gerador.wCampoNFSe(tcStr, '', 'Tributacao', 01, 01, 1, 'C', '');
      end
      else if (NFSe.NaturezaOperacao = noImune) then begin
         Gerador.wCampoNFSe(tcStr, '', 'Operacao',   01, 01, 1, 'C', '');
         Gerador.wCampoNFSe(tcStr, '', 'Tributacao', 01, 01, 1, 'F', '');
      end
      else if ( NFSe.NaturezaOperacao in [noSuspensaDecisaoJudicial, noSuspensaProcedimentoAdministrativo] ) then begin
         if NFSe.DeducaoMateriais = snSim then
            Gerador.wCampoNFSe(tcStr, '', 'Operacao', 01, 01, 1, 'B', '')
         else
            Gerador.wCampoNFSe(tcStr, '', 'Operacao', 01, 01, 1, 'A', '');

         Gerador.wCampoNFSe(tcStr, '', 'Tributacao', 01, 01, 1, 'K', '');
      end
      else if ( NFSe.NaturezaOperacao = noNaoIncidencia) then begin
         Gerador.wCampoNFSe(tcStr, '', 'Operacao', 01, 01,  1, 'A', '');
         Gerador.wCampoNFSe(tcStr, '', 'Tributacao',01, 01,  1, 'N', '');
      end;

      if ( NFse.RegimeEspecialTributacao = retMicroempresarioIndividual ) then begin
         Gerador.wCampoNFSe(tcStr, '', 'Tributacao',01, 01,  1, 'M', '');
      end;

      //Valores
      Gerador.wCampoNFSe(tcDe2, '', 'ValorPIS',    01, 02, 1, NFSe.Servico.Valores.ValorPis, '');
      Gerador.wCampoNFSe(tcDe2, '', 'ValorCOFINS', 01, 02, 1, NFSe.Servico.Valores.ValorCofins, '');
      Gerador.wCampoNFSe(tcDe2, '', 'ValorINSS',   01, 02, 1, NFSe.Servico.Valores.ValorInss, '');
      Gerador.wCampoNFSe(tcDe2, '', 'ValorIR',     01, 02, 1, NFSe.Servico.Valores.ValorIr, '');
      Gerador.wCampoNFSe(tcDe2, '', 'ValorCSLL',   01, 02, 1, NFSe.Servico.Valores.ValorCsll, '');

      //Aliquotas criar propriedades
      Gerador.wCampoNFSe(tcDe4, '', 'AliquotaPIS',    01, 02, 1, NFSe.Servico.Valores.AliquotaPIS, '');
      Gerador.wCampoNFSe(tcDe4, '', 'AliquotaCOFINS', 01, 02, 1, NFSe.Servico.Valores.AliquotaCOFINS, '');
      Gerador.wCampoNFSe(tcDe4, '', 'AliquotaINSS',   01, 02, 1, NFSe.Servico.Valores.AliquotaINSS, '');
      Gerador.wCampoNFSe(tcDe4, '', 'AliquotaIR',     01, 02, 1, NFSe.Servico.Valores.AliquotaIR, '');
      Gerador.wCampoNFSe(tcDe4, '', 'AliquotaCSLL',   01, 02, 1, NFSe.Servico.Valores.AliquotaCSLL, '');

      Gerador.wCampoNFSe(tcStr, '', 'DescricaoRPS',      01, 1500, 1, NFSe.OutrasInformacoes, '');

      if Length(SomenteNumeros(NFSe.Tomador.Contato.Telefone)) = 11 then begin
         Gerador.wCampoNFSe(tcStr, '', 'DDDPrestador', 00, 03, 1, LeftStr(SomenteNumeros(NFSe.PrestadorServico.Contato.Telefone),3), '');
      end else
      if Length(SomenteNumeros(NFSe.Tomador.Contato.Telefone)) = 10 then begin
         Gerador.wCampoNFSe(tcStr, '', 'DDDPrestador', 00, 03, 1, LeftStr(SomenteNumeros(NFSe.PrestadorServico.Contato.Telefone),2), '');
      end else
         Gerador.wCampoNFSe(tcStr, '', 'DDDPrestador', 00, 03, 1, '', '');
      Gerador.wCampoNFSe(tcStr, '', 'TelefonePrestador', 00, 08, 1, RightStr(SomenteNumeros(NFSe.PrestadorServico.Contato.Telefone),8), '');

      if Length(SomenteNumeros(NFSe.Tomador.Contato.Telefone)) = 11 then begin
         Gerador.wCampoNFSe(tcStr, '', 'DDDTomador', 00, 03, 1, LeftStr(SomenteNumeros(NFSe.Tomador.Contato.Telefone),3), '');
      end else
      if Length(SomenteNumeros(NFSe.Tomador.Contato.Telefone)) = 10 then begin
         Gerador.wCampoNFSe(tcStr, '', 'DDDTomador', 00, 03, 1, LeftStr(SomenteNumeros(NFSe.Tomador.Contato.Telefone),2), '');
      end else
         Gerador.wCampoNFSe(tcStr, '', 'DDDTomador', 00, 03, 1, '', '');

      Gerador.wCampoNFSe(tcStr, '', 'TelefoneTomador', 00, 08, 1, RightStr(SomenteNumeros(NFSe.Tomador.Contato.Telefone),8), '');

      if (NFSe.Status = srCancelado) then
         Gerador.wCampoNFSe(tcStr, '', 'MotCancelamento',01, 80, 1, NFSE.MotivoCancelamento, '')
      else
         Gerador.wCampoNFSe(tcStr, '', 'MotCancelamento',00, 80, 0, NFSE.MotivoCancelamento, '');

      Gerador.wCampoNFSe(tcStr, '', 'CpfCnpjIntermediario', 00, 14, 0, NFSe.IntermediarioServico.CpfCnpj, '');

      GerarServico_Provedor_IssDsf;

   Gerador.wGrupoNFSe('/Rps');
end;

end.

