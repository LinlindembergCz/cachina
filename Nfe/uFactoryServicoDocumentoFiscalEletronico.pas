unit uFactoryServicoDocumentoFiscalEletronico;

interface

uses
Forms, Dialogs, Sysutils,strUtils,TypInfo, Math, pcnNFe, pcnCFe, DB,ACBrNFe, pcnConversao,Variants,
ACBrUtil, ACBrNFeDANFEClass, ACBrNFeDANFeESCPOS, ACBrBase, ACBrDFe, XMLIntf,
XMLDoc, zlib, ACBrMail, pcnConversaoNFe,
ACBrDFeSSL, ACBrNFeConfiguracoes, uServicoDocumentoFiscalEletronico, pcnAuxiliar,
  Venda, ItemVenda, Empresa,Recebimento, uServicoBase, uServicoBaseGuid, uClassLogger;

type
  TFactoryServicoDocumentoFiscalEletronico = class
  strict private
    class var ConfiguracoesDFe: TConfiguracoesNFe;
    class function LoadConfiguracoesDFe(ACBR:TACBrNFe; prsPathNFE: string; prbVisualizar:boolean): TConfiguracoesNFe; static;
  private
    class var gsPath : String;
    class var loEmpresa : TEmpresa;
    class function RetornarCST(prsSitB: String): TpcnCSTIcms;
    class function RetornarCSOSN(prsSitB: String): TpcnCSOSNIcms;

    class procedure PreencherIde(Servico: TServicoDocumentoFiscalEletronico; proVenda: TVenda);static;
    class procedure PreencherEmitente(Servico: TServicoDocumentoFiscalEletronico;  proVenda: TVenda);static;
    class procedure PreencherDest(Servico: TServicoDocumentoFiscalEletronico; proVenda: TVenda); static;
    class procedure PreencherItens(Servico: TServicoDocumentoFiscalEletronico;  proVenda: TVenda);static;
    class procedure PreencherTotal(Servico: TServicoDocumentoFiscalEletronico; proVenda: TVenda); static;
    class procedure PreencherPag(Servico: TServicoDocumentoFiscalEletronico; proVenda: TVenda); static;
    class procedure PreencherInfAdic(Servico: TServicoDocumentoFiscalEletronico; proVenda: TVenda); static;
    class function GetFormaPagamento( prsFormaPagamento: string): TpcnFormaPagamento; static;
    class function GetBandeira(prsBandeira: string): TpcnBandeiraCartao; static;
    class function PreencherDescricaoDoProduto(Servico: TServicoDocumentoFiscalEletronico; proItemVenda: TItemVenda): String; static;
    class procedure PreencherSATMFEIde(
      Servico: TServicoDocumentoFiscalEletronico; proVenda: TVenda); static;
    class procedure PreencherItensSATMFEIde(
      Servico: TServicoDocumentoFiscalEletronico; proVenda: TVenda); static;
    class procedure PreencherSATMFEPag(
      Servico: TServicoDocumentoFiscalEletronico; proVenda: TVenda); static;
  public
    constructor Create;
    class function FactoryServicoNFC( proVenda: TVenda; prsPathNFE: string; prbVisualizar:boolean = true; proLogger: TLogger = nil ):TServicoDocumentoFiscalEletronico;
    class function FactoryServicoNFE( proVenda: TVenda; prsPathNFE: string; prbVisualizar:boolean = true):TServicoDocumentoFiscalEletronico;
    class function FactoryServicoSATMFE( proVenda: TVenda; prsPathNFE: string; prbVisualizar:boolean = true):TServicoDocumentoFiscalSATMFE;
  end;

implementation

uses
  uGlobais, uDispositivoSingleton, uTabelaDePrecoPadraoSingleton, Pessoa;

{ TFactoryDocumentoFiscal }

class function TFactoryServicoDocumentoFiscalEletronico.FactoryServicoNFE( proVenda: TVenda;
                                                                           prsPathNFE: string;
                                                                           prbVisualizar:boolean = true  ): TServicoDocumentoFiscalEletronico;
var
  Servico : TServicoDocumentoFiscalNFE;
begin
  //showmessage('Recurso ainda não implementado para NFE!');
  //Criar um serviço NFE
  Servico  := TServicoDocumentoFiscalNFE.create( LoadConfiguracoesDFe(TACBrNFe.create(application), prsPathNFE, prbVisualizar), nil);
  //Preencher os Objetos do ABCBR conforme as diretrizes do serviço NFE
  If proVenda <> nil then
  begin
      PreencherIde( Servico, proVenda);
      PreencherEmitente( Servico, proVenda);
      PreencherDest( Servico, proVenda);
      PreencherItens( Servico, proVenda);
      PreencherTotal( Servico, proVenda);
      //PreencherFatu( Servico, proVenda);
      //PreencherPag( Servico, proVenda);
      //PreencherTransp( Servico, proVenda);
      PreencherInfAdic( Servico, proVenda);
  end;

  result      := Servico;
end;

class function TFactoryServicoDocumentoFiscalEletronico.FactoryServicoSATMFE( proVenda: TVenda;
                                                                              prsPathNFE: string;
                                                                              prbVisualizar: boolean): TServicoDocumentoFiscalSATMFE;
var
  Servico : TServicoDocumentoFiscalSATMFE;
  loServicoBase : TServicoBaseGuid;
begin
  loServicoBase := TServicoBaseGuid.Create;
  try
     loEmpresa := loServicoBase.GetAll<TEmpresa>.First();
      Servico  := TServicoDocumentoFiscalSATMFE.create( getAmbiente, prsPathNFE, nil);
      If proVenda <> nil then
      begin
          PreencherSATMFEIde( Servico, proVenda);
          PreencherItensSATMFEIde( Servico, proVenda);
          PreencherSATMFEPag( Servico, proVenda);
      end;

      result      := Servico;
  finally
    loServicoBase.Free;
  end;

end;

constructor TFactoryServicoDocumentoFiscalEletronico.Create;
begin
  inherited;
  gsPath := Trim( ExtractFilePath( ParamStr( 0 ) ) );
  If Copy( gsPath, Length( gsPath ), 1 ) <> '\' Then
     gsPath := gsPath + '\';

  //  loServicoBase := TServicoBase.Create;
  //loEmpresa := loServicoBase.GetAll<TEmpresa>.First();
end;

class function TFactoryServicoDocumentoFiscalEletronico.FactoryServicoNFC( proVenda: TVenda;
                                                                           prsPathNFE: string;
                                                                           prbVisualizar:boolean = true;
                                                                           proLogger: TLogger = nil ):TServicoDocumentoFiscalEletronico;
var
  Servico : TServicoDocumentoFiscalNFC;
begin
//Criar um serviço NFC
  Servico  := TServicoDocumentoFiscalNFC.create( LoadConfiguracoesDFe( TACBrNFe.create(application), prsPathNFE, prbVisualizar ), proLogger );
  if proVenda <> nil then
  begin
  //Preencher os Objetos do ABCBR conforme as diretrizes do serviço NFC
    PreencherIde( Servico, proVenda);
    PreencherEmitente( Servico, proVenda);
    PreencherDest( Servico, proVenda);
    PreencherItens( Servico, proVenda);
    PreencherTotal( Servico, proVenda);
    PreencherPag( Servico, proVenda);
    PreencherInfAdic( Servico, proVenda);
  end;
//Retornar o serviço NFE já preparado para ser enviar a NotaFiscal
  result      := Servico;
end;

class function TFactoryServicoDocumentoFiscalEletronico.LoadConfiguracoesDFe(ACBR:TACBrNFe; prsPathNFE : string; prbVisualizar:boolean ): TConfiguracoesNFe;
var
  pastaSchemas: string;
  loServicoBase : TServicoBaseGuid;
begin
   loServicoBase := TServicoBaseGuid.Create;
   loEmpresa := loServicoBase.GetAll<TEmpresa>.First();
   ConfiguracoesDFe := TConfiguracoesNFe.create( ACBR );
   with ConfiguracoesDFe do
   begin
      Geral.FormaEmissao         := teNormal;
      Geral.VersaoDF             := ve310;
      Geral.Salvar               := true;
      Geral.ExibirErroSchema     := true;
      Geral.RetirarAcentos       := true;
      Geral.IncluirQRCodeXMLNFCe := true;
      Geral.FormatoAlerta        := 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.';
      Geral.SSLLib               := libCapicom;//(libNone, libOpenSSL, libCapicom, libCapicomDelphiSoap);
      Geral.IdCSC                := '000001';
      Geral.CSC                  := loEmpresa.Token;
      //Certificados.ArquivoPFX    := goEmpresa.CertificadoDFe;
      //Certificados.Senha         := goEmpresa.SenhaDFe;
      Certificados.NumeroSerie   := loEmpresa.NumeroSerieDFe;

      if not DirectoryExists( prsPathNFE ) then
         CreateDir( prsPathNFE );
      Arquivos.PathSalvar        := prsPathNFE;

      gsPath := Trim( ExtractFilePath( ParamStr( 0 ) ) );
      If Copy( gsPath, Length( gsPath ), 1 ) <> '\' Then
        gsPath := gsPath + '\';

      // TODO: Ver o preenchimento da varifavel gsPath
      pastaSchemas := gsPath+ 'SchemasXML\NFe';
      if not DirectoryExists( pastaSchemas ) then
      Begin
         CreateDir( gsPath+ 'SchemasXML' );
         CreateDir( pastaSchemas );
      End;
      Arquivos.PathSchemas       := pastaSchemas;
      Arquivos.SalvarApenasNFeProcessadas  := True;

      WebServices.Salvar         := true;
      WebServices.UF             := loEmpresa.Pessoa.Enderecos.First.UF;
      WebServices.Ambiente       := getAmbiente;
//      if loEmpresa.AmbienteDFe = 1 then
//         WebServices.Ambiente       :=  taProducao;

      WebServices.Visualizar     :=  prbVisualizar;
   end;
   result := ConfiguracoesDFe;
end;

class procedure TFactoryServicoDocumentoFiscalEletronico.PreencherIde(Servico: TServicoDocumentoFiscalEletronico;
                                                                      proVenda: TVenda);
begin
   with Servico.DocumentoFiscal.Ide do
   begin
      cNF       := StrToIntDef( proVenda.SequenciaNotaFiscal,0 );
      indPag    := ipVista;
      modelo    := ifthen( proVenda.Especie = 'NFE',55,65); //<<---
      serie     := strtointDef(proVenda.Serie,0);//<<-- Não pode ser 1 caracter
      nNF       := StrToIntDef( proVenda.SequenciaNotaFiscal,0 );
      dEmi      := StrToDatetime( FormatDatetime('DD/MM/YYYY ',proVenda.DataHoraEmissao)+ FormatDatetime('HH:MM:SS ', Time) );
      //Atribuir valores ao Atributos abaixo ocasionará rejeição Conforme a validação do ACBR:
      //if (NFe.Ide.dSaiEnt <> 0) then  //B10-10
      //   AdicionaErro('705-Rejeição: NFC-e com data de entrada/saída');
      //dSaiEnt := StrToDatetime( FormatDatetime('DD/MM/YYYY ', proVenda.Data_Emissao)+ FormatDatetime('HH:MM:SS ', Time) );
      //hSaiEnt := Time;
      //É por isso que esses dois atributos estão desabilitados!
      natOp     := 'VENDAS';//<<---
      tpNF      := pcnConversaoNFe.tnSaida;
      tpEmis    := pcnConversao.teNormal;
      tpAmb     := getAmbiente;
//      if loEmpresa.AmbienteDFe = 1 then
//         tpAmb     :=  taProducao;
      cUF       := UFtoCUF(loEmpresa.Pessoa.Enderecos.First.UF);
      cMunFG    := StrToInt(loEmpresa.Pessoa.Enderecos.First.CodigoMunicipioIbge);
      finNFe    := fnNormal;
      if proVenda.Especie='NFE' then
         tpImp     := tiRetrato
      else
         tpImp     := tiNFCe;

      indFinal  := cfConsumidorFinal;
      indPres   := pcPresencial;
   end;
end;


class procedure TFactoryServicoDocumentoFiscalEletronico.PreencherEmitente(Servico: TServicoDocumentoFiscalEletronico; proVenda: TVenda);
var OptanteSimples : String;
begin
   OptanteSimples := 'N';
   with Servico.DocumentoFiscal.Emit do
   begin
      CNPJCPF           := loEmpresa.Pessoa.CNPJCPF;
      IE                := loEmpresa.Pessoa.InscricaoEstadual;
      xNome             := loEmpresa.Pessoa.RazaoSocial;
      xFant             := loEmpresa.Pessoa.NomeFantasia;
      IEST              := '';
      //if loEmpresa.OptanteSimples = 'S' then
      if OptanteSimples = 'S' then
         CRT  := crtSimplesNacional
      else
         CRT  := crtRegimeNormal;
      EnderEmit.fone    := loEmpresa.Telefone;
      EnderEmit.CEP     := StrToInt(StringReplace(loEmpresa.Pessoa.Enderecos.First.Cep, '-', EmptyStr, [rfReplaceAll]));
      EnderEmit.xLgr    := loEmpresa.Pessoa.Enderecos.First.Logradouro;
      EnderEmit.nro     := ifthen( loEmpresa.Pessoa.Enderecos.First.Numero <> '',loEmpresa.Pessoa.Enderecos.First.Numero ,'0');
      EnderEmit.xCpl    := loEmpresa.Pessoa.Enderecos.First.Complemento;
      EnderEmit.xBairro := loEmpresa.Pessoa.Enderecos.First.Bairro;
      EnderEmit.cMun    := StrToInt(loEmpresa.Pessoa.Enderecos.First.CodigoMunicipioIbge);
      EnderEmit.xMun    := loEmpresa.Pessoa.Enderecos.First.DescricaoMunicipioIBGE;
      EnderEmit.UF      := loEmpresa.Pessoa.Enderecos.First.UF;
      enderEmit.cPais   := 1058;
      enderEmit.xPais   := 'BRASIL';
    end;
end;

class procedure TFactoryServicoDocumentoFiscalEletronico.PreencherDest(Servico: TServicoDocumentoFiscalEletronico; proVenda: TVenda);
var enderecoDest : TEndereco;
begin
   with Servico.DocumentoFiscal.Dest do
   begin
      if Assigned(proVenda.Cliente) then
      begin
         CNPJCPF           := proVenda.Cliente.Pessoa.CnpjCpf;
         xNome             := proVenda.Cliente.Pessoa.NomeFantasia;
         ISUF              := '';
         if (proVenda.Cliente.Pessoa.Enderecos.Count > 0) then
         begin
            {Todo : Estamos assumindo que o endereço comercial é sempre o primeiro.
                    Mas nem sempre isso acontecerá. O devido tratamento deve ser realizado.
                    Sugiro se basear em Pessoa.TTipoEndereco }
            enderecoDest := proVenda.Cliente.Pessoa.Enderecos.Items[0];
//          EnderDest.Fone    := enderecoDest.;
            EnderDest.CEP     := strtointDef( IfThen( enderecoDest.Cep <> '', enderecoDest.Cep, '0' ),0);
            EnderDest.xLgr    := enderecoDest.Logradouro;
            EnderDest.nro     := ifthen( enderecoDest.Numero <> '', enderecoDest.Numero ,'0');
            EnderDest.xCpl    := enderecoDest.Complemento;
            EnderDest.xBairro := enderecoDest.Bairro;
            EnderDest.cMun    := strtointDef( IfThen(enderecoDest.CodigoMunicipioIBGE <> '', enderecoDest.CodigoMunicipioIBGE, '0'),0);
            EnderDest.xMun    := enderecoDest.DescricaoMunicipioIBGE;
            EnderDest.UF      := enderecoDest.UF;
            EnderDest.cPais   := 1058;
            EnderDest.xPais   := 'BRASIL';
         end
         else
            EnderDest := Nil;
      end
      else
      begin
         CNPJCPF           := proVenda.CpfCnpjCliente;
         xNome             := proVenda.NomeCliente;
      end;
      indIEDest         := inNaoContribuinte;
   end;
end;

class procedure TFactoryServicoDocumentoFiscalEletronico.PreencherPag(Servico: TServicoDocumentoFiscalEletronico; proVenda: TVenda);
var I : Integer;
    VrlNegativo : Real;
    lbTefOK:boolean;
begin
   for I := 0 to proVenda.Recebimentos.Count - 1 do
   begin
      if proVenda.Recebimentos.Items[I].Valor > 0 then
      begin
         with Servico.DocumentoFiscal.Pag.Add do
         begin
            tPag := GetFormaPagamento(proVenda.Recebimentos.Items[I].FormaPagamento.CodigoTipoPagamentoNFC );
               vPag := proVenda.Recebimentos.Items[I].Valor - proVenda.Recebimentos.Items[I].ValorTroco;

            if ( tPag = fpCartaoCredito ) or ( tPag = fpCartaoDebito ) then
            begin
               if ( proVenda.Recebimentos[I].FormaPagamento.TipoComunicacaoTEF = 1 ) then
                  tpIntegra := tiPagNaoIntegrado
               else
               begin
                  tpIntegra := tiPagIntegrado;
                  CNPJ := proVenda.Recebimentos.Items[I].CnpjOperadora;
                  tBand := pcnConversao.StrToBandeiraCartao( lbTefOK , proVenda.Recebimentos.Items[I].CodigoBandeiraTEF);
                  cAut := proVenda.Recebimentos.Items[I].NsuTef;
               end;
            end;

         end;
      end;
   end;
end;

class function TFactoryServicoDocumentoFiscalEletronico.PreencherDescricaoDoProduto(Servico: TServicoDocumentoFiscalEletronico; proItemVenda: TItemVenda): String;
const COMBUSTIVEL ='C';
const LIQUIDO = 'LIQ';
const GLP = 'GLP';
const GLP_P13 = 'P13';
const GNV = 'GNV';
const PARAIBA = 25;
const ALCOOL = 1;
const DIESEL_COMUN = 2;
const DIESEL_S10 = 3;
const GASOLINA_COMUM = 4;
const GASOLINA_ADITIVADA = 5;
Begin
   result:= proItemVenda.Produto.Descricao;
   if(Servico.DocumentoFiscal.Ide.cUF = PARAIBA)Then
   Begin
      If((proItemVenda.Produto.TipoItem = COMBUSTIVEL) And (proItemVenda.Produto.TipoCombustivel = LIQUIDO))Then
      Begin
         if proItemVenda.Produto.Combustivel = ALCOOL Then
            result:= '#ETN#';
         if proItemVenda.Produto.Combustivel = DIESEL_COMUN Then
            result:= '#DC#';
         if proItemVenda.Produto.Combustivel = DIESEL_S10 Then
            result:= '#DS10#';
         if proItemVenda.Produto.Combustivel = GASOLINA_COMUM Then
            result:= '#GC#';
         if proItemVenda.Produto.Combustivel = GASOLINA_ADITIVADA Then
            result:= '#GA#';
         end;
   End
   Else if ((proItemVenda.Produto.TipoItem = COMBUSTIVEL) And (proItemVenda.Produto.TipoCombustivel = GNV)) Then
      result:= '#GNV#'
   Else if ((proItemVenda.Produto.TipoItem = COMBUSTIVEL) And (proItemVenda.Produto.TipoItem = GLP)) then
      result:= '#GLP#'
   Else if ((proItemVenda.Produto.TipoItem = COMBUSTIVEL) And (proItemVenda.Produto.TipoItem = GLP_P13)) then
      result:= '#G13#';
End;

class procedure TFactoryServicoDocumentoFiscalEletronico.PreencherItens(Servico: TServicoDocumentoFiscalEletronico; proVenda: TVenda);
var
  I:integer;
  Item: TItemVenda;
  OptanteSimples : String;
begin
   OptanteSimples := 'N';
   for I := 0 to proVenda.ItensVenda.Count - 1 do
   begin
      with Servico.DocumentoFiscal.Det.Add do
      begin
         Item := TItemVenda( proVenda.ItensVenda[ I ] );

         Prod.nItem     := i + 1; // Número sequencial, para cada item deve ser incrementado
         Prod.cProd     := ifthen( Item.CodigoBarras <> '', Item.CodigoBarras, Item.Produto.CodigoReferencia );
         Prod.xProd     := PreencherDescricaoDoProduto(Servico, Item);
         if Servico.DocumentoFiscal.Ide.tpAmb = taHomologacao then
            Prod.xProd    := 'NOTA FISCAL EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL';
         Prod.NCM       := Item.Produto.CodigoNCM;
         Prod.CFOP      := Item.CFOP.CFOPId;

         if (Item.Produto.CodigoBarras.Count > 0) then
            Prod.cEAN      := Item.Produto.CodigoBarras.First.Codigo;
         Prod.uCom      := Item.Produto.UnidadeVenda.DescricaoReduzido;
         Prod.qCom      := Item.Quantidade;
         Prod.vUnCom    := Item.Preco;

         if (Item.Produto.CodigoBarras.Count > 0) then
            Prod.cEANTrib  := Item.Produto.CodigoBarras.First.Codigo;
         Prod.uTrib     := Item.Produto.UnidadeVenda.DescricaoReduzido;

         Prod.qTrib     := Item.Quantidade;
         Prod.vUnTrib   := Item.Preco;

         Prod.vProd     := Item.ValorTotal;

         Prod.vOutro    := 0;
         Prod.vFrete    := 0;
         Prod.vSeg      := 0;
         Prod.vDesc     := Item.ValorDesconto;
         Prod.CEST      := Item.Produto.CodigoCest;
         Prod.EXTIPI    := '';

         with Imposto do
         begin
           // lei da transparencia nos impostos
           vTotTrib := 0;
           with ICMS do
           begin
              {goEmpresa.OptanteSimples}
              if OptanteSimples = 'N' then
                 CST   := RetornarCST(Item.SitB)
              else
                CSOSN := RetornarCSOSN(Item.SitB);
              orig        := oeNacional;
              modBC       := dbiValorOperacao;
              vBC         := Item.ValorBaseICMS;
              pICMS       := Item.PercentualICMS;
              vICMS       := Item.ValorICMS;
              pMVAST      := Item.PercentualICMSSubs;
              pRedBCST    := Item.PercentualReducaoBase;
              vBCST       := Item.ValorBaseICMSSubs;
              pICMSST     := Item.PercentualICMSSubs;
              vICMSST     := Item.ValorICMSSubs;
              pRedBC      := 0; // Não existe a propriedade Reducao Base Calculo

              // TODO: Vlr_BaseICMSSubsRet, Vlr_ICMSSubsRet, CreditoSN e CreditoICMSSN não sei o que é

              vICMSSTRet  := 0; //Item.Vlr_BaseICMSSubsRet;
              vBCSTRet    := 0; //Item.Vlr_ICMSSubsRet;
              pCredSN     := 0; //Item.CreditoSN;
              vCredICMSSN := 0; //Item.CreditoICMSSN;
           end;
           With PIS do
           begin
             vBC := Item.ValorBaseCalcPISCOFINS;
             pPIS := item.PercentalPis;
             vPIS := Item.ValorPis;
           end;
           With COFINS do
           begin
             vBC := Item.ValorBaseCalcPISCOFINS;
             pCOFINS := item.PercetualCofins;
             vCOFINS := Item.ValorCofins;
           end;
           //Atenção! CFOPId é o ID do CFOP e nao o codigo do CFOP...REFATORAR!
           if Item.CFOP.CFOPId = '5933'  then
           Begin
              with ISSQN do
              begin
                 cSitTrib := ISSQNcSitTribISENTA;
                 vBC := Prod.vProd;
                 vAliq := 0;
                 vISSQN := 0;
                 cMunFG := 0;
                 cListServ := '';
                 vDeducao := 0;
                 vOutro := 0;
                 vDescIncond := 0;
                 vDescCond  := 0;
                 vISSRet := 0;
                 indISS  :=  TpcnindISS.iiNaoIncidencia;
                 cServico  := '';
                 cMun  := 0;
                 cPais := 0;
                 nProcesso  := '';
              end;
           End;

         end;

         if Item.Produto.CodigoANP <> '' then
         begin
            with Prod.comb do
            begin
               cProdANP  := strtointdef(Item.Produto.CodigoANP,0);
               if Item.Produto.CodigoANP = '210203001' then
                  pMixGN := 0; //Item.Produto.PercentualGasNatural;
               UFcons    := loEmpresa.Pessoa.Enderecos.First.UF; //goEmpresa.Endereco.Uf.Descricao;
            end;

            if Assigned(Item.Bico) and ( Item.Bico.Codigo <> ''   ) and ( Item.CFOP.CFOPId <> '5929' ) and ( Item.CFOP.CFOPId <> '6929' )
            then
            begin
               with Prod.comb do
               begin
                  encerrante.nBico   := strtointdef(Item.Bico.Codigo, 0);
                  encerrante.nBomba  := strtointdef(Item.Bico.Bomba.Codigo, 0);
                  encerrante.nTanque := strtointdef(Item.Bico.Tanque.Codigo, 0);
                  encerrante.vEncIni := Item.EncerranteInicial;
                  encerrante.vEncFin := Item.EncerranteFinal;
               end;
            end;
         end;
      end;
   end;
end;

class procedure TFactoryServicoDocumentoFiscalEletronico.PreencherTotal(Servico: TServicoDocumentoFiscalEletronico; proVenda: TVenda);
begin
   with Servico.DocumentoFiscal.Total do
   begin
      ICMSTot.vBC          := proVenda.ValorBaseCalcICMS;
      ICMSTot.vICMS        := proVenda.ValorICMS;
      ICMSTot.vBCST        := proVenda.ValorBaseCalcICMSF;
      ICMSTot.vST          := proVenda.ValorICMSF;
      ICMSTot.vProd        := proVenda.getTotalProdutos;
      ICMSTot.vFrete       := proVenda.ValorFrete;
      ICMSTot.vSeg         := proVenda.ValorSeguro;
      ICMSTot.vDesc        := proVenda.DescontoTotal;
      ICMSTot.vII          := 0;
      ICMSTot.vIPI         := proVenda.ValorIPI;
      ICMSTot.vPIS         := proVenda.PIS;
      ICMSTot.vCOFINS      := proVenda.COFINS;
      ICMSTot.vOutro       := proVenda.ValorDespesas;
      ICMSTot.vNF          := proVenda.ValorNota;
      ICMSTot.vFCPUFDest   := 0.00;
      ICMSTot.vICMSUFDest  := 0.00;
      ICMSTot.vICMSUFRemet := 0.00;
    //ICMSTot.vTotTrib     :=
   end;
end;

class procedure TFactoryServicoDocumentoFiscalEletronico.PreencherInfAdic(Servico: TServicoDocumentoFiscalEletronico; proVenda: TVenda);
begin
   with Servico.DocumentoFiscal.InfAdic do
   begin
      infCpl     := proVenda.InfoComplementarNota +
      iif(Trim(proVenda.Placa)='', '', ' Placa:' + proVenda.Placa) + iif(proVenda.Km=0,'', ' KM:'+IntToStr(proVenda.Km));
      infAdFisco := '';
   end;
end;

class function TFactoryServicoDocumentoFiscalEletronico.RetornarCST( prsSitB :String ) : TpcnCSTIcms;
var lIcms : TpcnCSTIcms;
begin
   if prsSitB = '00' then
      lIcms := cst00
   Else if prsSitB = '10' then
      lIcms := cst10
   Else if prsSitB = '20' then
      lIcms := cst20
   Else if prsSitB = '30' then
      lIcms := cst30
   Else if prsSitB = '40' then
      lIcms := cst40
   Else if prsSitB = '41' then
      lIcms := cst41
   Else if prsSitB = '45' then
      lIcms := cst45
   Else if prsSitB = '50' then
      lIcms := cst50
   Else if prsSitB = '51' then
      lIcms := cst51
   Else if prsSitB = '60' then
      lIcms := cst60
   Else if prsSitB = '70' then
      lIcms := cst70
   Else if prsSitB = '80' then
      lIcms := cst80
   Else if prsSitB = '81' then
      lIcms := cst81
   Else 
      lIcms := cst90;

   Result := lIcms;

end;

class function TFactoryServicoDocumentoFiscalEletronico.RetornarCSOSN( prsSitB :String ) : TpcnCSOSNIcms;
var lIcms : TpcnCSOSNIcms;
begin
   if prsSitB = '101' then
      lIcms := csosn101
   Else if prsSitB = '102' then
      lIcms := csosn102
   Else if prsSitB = '103' then
      lIcms := csosn103
   Else if prsSitB = '201' then
      lIcms := csosn201
   Else if prsSitB = '202' then
      lIcms := csosn202
   Else if prsSitB = '300' then
      lIcms := csosn300
   Else if prsSitB = '400' then
      lIcms := csosn400
   Else if prsSitB = '500' then
      lIcms := csosn500
   Else 
      lIcms := csosn900;

   Result := lIcms;
end;

class function TFactoryServicoDocumentoFiscalEletronico.GetFormaPagamento( prsFormaPagamento : string ) : TpcnFormaPagamento;
begin
   if prsFormaPagamento = '01' then
      Result := fpDinheiro
   else if prsFormaPagamento = '02' then
      Result := fpCheque
   else if prsFormaPagamento = '03' then
      Result := fpCartaoCredito
   else if prsFormaPagamento = '04' then
      Result := fpCartaoDebito
   else if prsFormaPagamento = '05' then
      Result := fpCreditoLoja
   else if prsFormaPagamento = '10' then
      Result := fpValeAlimentacao
   else if prsFormaPagamento = '11' then
      Result := fpValeRefeicao
   else if prsFormaPagamento = '12' then
      Result := fpValePresente
   else if prsFormaPagamento = '13' then
      Result := fpValeCombustivel
   else
      Result := fpOutro;
end;

class function TFactoryServicoDocumentoFiscalEletronico.GetBandeira( prsBandeira : string ) : TpcnBandeiraCartao;
begin
   if prsBandeira = '01' then
      Result := bcVisa
   else if prsBandeira = '02' then
      Result := bcMasterCard
   else if prsBandeira = '03' then
      Result := bcAmericanExpress
   else if prsBandeira = '04' then
      Result := bcSorocred
   else
      Result := bcOutros;
end;

class procedure TFactoryServicoDocumentoFiscalEletronico.PreencherSATMFEIde(Servico: TServicoDocumentoFiscalEletronico;
                                                                      proVenda: TVenda);
begin
   with Servico.DocumentoSATMFE do
   begin
      InicializaCFe;
      if (proVenda.Cliente <> nil) and (proVenda.Cliente.Pessoa <> nil) then
      Begin
         CFe.Dest.CNPJCPF := proVenda.Cliente.Pessoa.CnpjCpf;
         CFe.Dest.xNome := proVenda.Cliente.Pessoa.RazaoSocial;
      End;
      CFe.Total.vCFeLei12741 := 0;
   end;
end;

class procedure TFactoryServicoDocumentoFiscalEletronico.PreencherItensSATMFEIde(Servico: TServicoDocumentoFiscalEletronico;
                                                                      proVenda: TVenda);
var liContador: integer;
    Item: TItemVenda;
begin
   for liContador := 0 to proVenda.ItensVenda.Count - 1 do
   begin
      with Servico.DocumentoSATMFE.CFe.Det.Add do
      begin
        Item := proVenda.ItensVenda[ liContador ];
        nItem := liContador + 1;
        Prod.cProd := Item.Produto.CodigoReferencia;

        if (Item.Produto.CodigoBarras.Count > 0) then
            Prod.cEAN      := Item.Produto.CodigoBarras.First.Codigo;
        Prod.xProd := Item.Produto.Descricao;
        Prod.NCM := Item.Produto.CodigoNCM;
        Prod.uCom      := Item.Produto.UnidadeVenda.DescricaoReduzido;
        Prod.qCom      := Item.Quantidade;
        Prod.vUnCom    := Item.Preco;
        Prod.CFOP      := Item.CFOP.CFOPId;
        Prod.EhCombustivel :=  Item.Produto.TipoItem = 'C';
        Prod.indRegra := irTruncamento;
        Prod.vDesc := 0;

         with Imposto do
         begin
           vItem12741 := 0;

           with ICMS do
           begin
              orig        := oeNacional;
              if Length(Trim(Item.SitB)) = 3 then
                 CSOSN := TpcnCSOSNIcms(GetEnumValue(TypeInfo(TpcnCSOSNIcms), 'csosn' + Item.SitB) )
              else
                 CST := TpcnCSTIcms(GetEnumValue(TypeInfo(TpcnCSTIcms), 'cst' + Item.SitB) );
              pICMS       := Item.PercentualICMS;
              vICMS       := Item.ValorICMS;
           end;
           With PIS do
           Begin
             CST := TpcnCstPis(GetEnumValue(TypeInfo(TpcnCstPis), 'pis' + Item.Produto.SituacaoTributaria.SaidaCst) );
             vBC := Item.ValorBaseICMS;
             pPIS := item.PercentalPis;
             vPIS := Item.ValorPis;
           End;
           With COFINS do
           begin
             CST := TpcnCstCofins(GetEnumValue(TypeInfo(TpcnCstPis), 'pis' + Item.Produto.SituacaoTributaria.SaidaCst) );
             vBC := Item.ValorBaseICMS;
             pCOFINS := item.PercetualCofins;
             vCOFINS := Item.ValorCofins;
           end;
         end;
      end;
   end;
end;

class procedure TFactoryServicoDocumentoFiscalEletronico.PreencherSATMFEPag(Servico: TServicoDocumentoFiscalEletronico;
                                                                      proVenda: TVenda);
var liContador: integer;
    loRecebimento: TRecebimento;
begin
   try
      for liContador := 0 to proVenda.Recebimentos.Count - 1 do
      begin
          with Servico.DocumentoSATMFE.CFe.Pagto.Add do
          begin
              loRecebimento := proVenda.Recebimentos[ liContador ];
              if loRecebimento.FormaPagamento.CodigoTipoPagamentoNFC = '01' then
                 cMP := mpDinheiro
              else if ( loRecebimento.FormaPagamento.CodigoTipoPagamentoNFC = '02' ) or
                      ( loRecebimento.FormaPagamento.CodigoTipoPagamentoNFC = '03' ) then
                 cMP := mpCheque
              else if ( loRecebimento.FormaPagamento.CodigoTipoPagamentoNFC = '12' ) then
                 cMP := mpValeCombustivel
              else if ( loRecebimento.FormaPagamento.CodigoTipoPagamentoNFC = '06' ) then
                 cMP := mpCreditoLoja
              else if ( loRecebimento.FormaPagamento.CodigoTipoPagamentoNFC = '04' ) then
                 cMP := mpCartaodeCredito
              else if ( loRecebimento.FormaPagamento.CodigoTipoPagamentoNFC = '05' ) then
                 cMP := mpCartaodeDebito
              else
                 cMP := mpOutros;

              vMP := loRecebimento.Valor;
          end;
      end;
   finally
      //if Assigned( loRecebimento ) then
       //  FreeAndNil( loRecebimento );
   end;
end;

end.
