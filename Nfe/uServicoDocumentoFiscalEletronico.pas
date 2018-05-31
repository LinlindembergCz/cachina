unit uServicoDocumentoFiscalEletronico;

interface

uses IniFiles, ShellAPI,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, OleCtrls, SHDocVw,
  pcnAuxiliar, pcnRetConsReciNFe, pcnNFe, ACBrNFe, pcnConversao, ACBrUtil,
  ACBrNFeDANFeESCPOS, ACBrNFeDANFEClass,
  ACBrBase, ACBrDFe, XMLIntf, XMLDoc, zlib, ACBrMail,
  pcnConversaoNFe, ACBrDFeSSL, ACBrNFeConfiguracoes,
  ACBrNFeDANFEFR, ACBrNFeWebServices, pcnProcNFe, Venda, uClassLogger,
  Aurelius.Types.Blob, ACBrSAT, ACBrSATExtratoFortesFr,ACBrSATClass,
  Dispositivo;

type
  // Não coloque regra de negocio aqui!
  TServicoDocumentoFiscalEletronico = class
  private
    FErros: string;
    FDocumentoFiscal: TNFE;
    FDispositivo: TDispositivo;
    FLogger: TLogger;
    FACBrSAT: TACBrSAT;
    procedure IncializarComponenteACBR(ConfiguracoesNFe: TConfiguracoesNFe);
    procedure InicializarDocumentoFiscal;
  protected
    FACBrNFeDANFEFR: TACBrNFeDANFEFR;
    FACBrSATExtrato: TACBrSATExtratoFortes;
    FACBrNFe: TACBrNFe;
    procedure GravarLog(prsTexto: String);
    procedure GerarDFe(var Erros: string);
  public
    destructor Destroy; override;
    property Erros: string read FErros;
    property DocumentoFiscal: TNFE read FDocumentoFiscal write FDocumentoFiscal;
    property DocumentoSATMFE: TACBrSAT read FACBrSAT write FACBrSAT;

    constructor Create(ConfiguracoesNFe: TConfiguracoesNFe; proLogger: TLogger = nil); virtual;

    procedure Gerar(var Erros: string); virtual; abstract;
    function Enviar(Lote: string): boolean; virtual; abstract;
    procedure Validar;virtual;abstract;
    function GetQrCode: string;virtual;abstract;
    function GetRetorno: TProcNFe;
    function Inutilizar(psCNPJEmit, psModelo, psSerie, psAno, psNumeroInicial,
        psNumeroFinal, psJustificativa: String): boolean;
    function EnviarEmailNF(prsEmailDestinatario: String): boolean; overload;
    function EnviarEmailNF(prsEmailDestinatario, prsChaveDeAcesso: String)
        : boolean; overload;
    procedure LoadFromFile(Arquivo: string);
    procedure LoadFromXml(XmlFile: TBlob);
    function ExtractPathNFe: string;
    function GetChaveAcesso: string;
    function GetFileNameXML(prsChaveAcesso, prsPathXML: string)
        : string; overload;
    function GetFileNameXML(prsChaveAcesso: string): string; overload;
    function GetFileNamePDF(prsChaveAcesso: string): string;
    function VerificarStatusServico: boolean;
    function VerificarDataVencimentoCertificado(numSerie: String): String;
    procedure ConfigurarContingencia(Data: TDatetime);
    function Cancelar(LoteNFe , prsChaveAcesso, Justificativa, Protocolo: String): boolean;
    procedure Imprimir(prsChaveAcesso: String; proVenda: TVenda;
        prbSenhaMaster: boolean = True);
    procedure ImprimirDanfeSimplificado(prsChaveAcesso: String;
              proVenda: TVenda; prbSenhaMaster: boolean = True);
    procedure ImprimirPDFDanfeNFE(prsChaveAcesso: String;
    proVenda: TVenda; prbSenhaMaster: boolean = True);
    function AmbienteHomologacao: boolean;
    function AmbienteProducao: boolean;
    function GetURLConsultaNFCe(ArquivoXML: string): string;
    function GetRetornoRecibo: string;
    function GetDataReciboInutilizacao:TDatetime;
    function GetProtocoloInutilizacao: string;
    function ConsultarNFeNaSefaz(prsChaveAcesso: string;
                                 var pdtDhRecbto:TDateTime;
                                 var prsProtocolo: string;
                                 var prsStatus: string): Boolean;

  end;

  TServicoDocumentoFiscalNFE = class(TServicoDocumentoFiscalEletronico)
  public
    constructor Create(ConfiguracoesNFe: TConfiguracoesNFe; proLogger: TLogger); override;
    procedure Gerar(var Erros: string);
    function Enviar(Lote: string): boolean; override;
    procedure Validar;override;
  end;

  TServicoDocumentoFiscalNFC = class(TServicoDocumentoFiscalEletronico)
  public
    constructor Create(ConfiguracoesNFe: TConfiguracoesNFe; proLogger: TLogger); override;
    procedure Gerar(var Erros: string);
    function Enviar(Lote: string): boolean; override;
    procedure Validar;override;
    function GetQrCode: string;override;
  end;

  TServicoDocumentoFiscalSATMFE = class(TServicoDocumentoFiscalEletronico)
  private
    procedure AjustarCodigoDeAtivacao(var Chave: AnsiString);
    procedure AjustarSignAC(var Chave: AnsiString);
    procedure CriarExtrato;
  public
    constructor Create(prbAmbiente: TpcnTipoAmbiente; prsPath: string; proLogger: TLogger);
    procedure Gerar(var Erros: string);
    function Enviar(proVenda: TVenda): boolean;
    function Cancelar(prsChaveAcesso: string):boolean;
  end;

  TCFeModelo = (cfemSAT, cfemMFE);
  TTipoCertificado = (tceNone, tceOK, tceErro, tceVencido, tceAtencao);

implementation

{ TControllerNFCe }

uses uDialog, uGlobais, uComponentUtils, Empresa, uEmpresaSingleton, System.IOUtils,
     uDispositivoSingleton;

constructor TServicoDocumentoFiscalEletronico.Create(ConfiguracoesNFe
    : TConfiguracoesNFe; proLogger: TLogger = nil);
begin
  IncializarComponenteACBR(ConfiguracoesNFe);
  FLogger:= proLogger;
end;

procedure TServicoDocumentoFiscalEletronico.Imprimir(prsChaveAcesso: String;
    proVenda: TVenda; prbSenhaMaster: boolean = True);
var
  liCont: Integer;
begin
  //FACBrNFe.NotasFiscais.LoadFromFile(GetFileNameXML(prsChaveAcesso), false);
  FACBrNFeDANFEFR.FastFile := ExtractFilePath(Application.ExeName) +
      'Relatorios\DANFeNFCe.fr3';
  FACBrNFe.DANFE := FACBrNFeDANFEFR;
  if (prbSenhaMaster) then
    FACBrNFe.DANFE.MostrarPreview := True
  else
    FACBrNFe.DANFE.MostrarPreview := false;

  FACBrNFe.DANFE.ImprimirTotalLiquido := false;

  for liCont := 0 to FACBrNFe.NotasFiscais[0].NFe.pag.Count - 1 do
  begin
    FACBrNFe.NotasFiscais[0].NFe.pag[liCont].vPag := proVenda.Recebimentos
        [liCont].Valor;
  end;

  if proVenda.Troco > 0 then
    FACBrNFe.DANFE.vTroco := proVenda.Troco;

  FACBrNFe.DANFE.ImprimirDANFE(FACBrNFe.NotasFiscais[0].NFe);
end;

procedure TServicoDocumentoFiscalEletronico.ImprimirDanfeSimplificado(prsChaveAcesso: String;
    proVenda: TVenda; prbSenhaMaster: boolean = True);
var
  liCont: Integer;
begin
  FACBrNFe.NotasFiscais.Clear;
  FACBrNFe.NotasFiscais.LoadFromFile(GetFileNameXML(prsChaveAcesso), false);

  FACBrNFeDANFEFR.FastFile := ExtractFilePath(Application.ExeName) +
      'Relatorios\DANFeSimplificado.fr3';
  FACBrNFe.DANFE := FACBrNFeDANFEFR;
  if (prbSenhaMaster) then
    FACBrNFe.DANFE.MostrarPreview := True
  else
    FACBrNFe.DANFE.MostrarPreview := False;

    FACBrNFe.NotasFiscais.Imprimir;
end;

procedure TServicoDocumentoFiscalEletronico.ImprimirPDFDanfeNFE(prsChaveAcesso: String;
    proVenda: TVenda; prbSenhaMaster: boolean = True);
var
  liCont: Integer;
begin
  FACBrNFe.NotasFiscais.Clear;
  FACBrNFe.NotasFiscais.LoadFromFile(GetFileNameXML(prsChaveAcesso), false);

  FACBrNFeDANFEFR.FastFile := ExtractFilePath(Application.ExeName) + 'Relatorios\DANFeRetratoNovo.fr3';
  FACBrNFe.DANFE := FACBrNFeDANFEFR;
  FACBrNFe.DANFE.PathPDF:=ExtractPathNFe;
  FACBrNFe.NotasFiscais.ImprimirPDF;
end;

procedure TServicoDocumentoFiscalEletronico.IncializarComponenteACBR
    (ConfiguracoesNFe: TConfiguracoesNFe);
begin
  FACBrNFe := (ConfiguracoesNFe.Owner as TACBrNFe);

  with FACBrNFe.Configuracoes do
  begin
    Geral.FormaEmissao := ConfiguracoesNFe.Geral.FormaEmissao; // teNormal;
    Geral.VersaoDF := ConfiguracoesNFe.Geral.VersaoDF; // ve310;
    Geral.Salvar := ConfiguracoesNFe.Geral.Salvar; // true;
    Geral.ExibirErroSchema := ConfiguracoesNFe.Geral.ExibirErroSchema; // true;
    Geral.RetirarAcentos := ConfiguracoesNFe.Geral.RetirarAcentos; // true;
    Geral.FormatoAlerta := ConfiguracoesNFe.Geral.FormatoAlerta;
    // 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.';
    Geral.SSLLib := libCapicom;
    // (libNone, libOpenSSL, libCapicom, libCapicomDelphiSoap);
    Geral.ModeloDF := ConfiguracoesNFe.Geral.ModeloDF; // moNFCe;
    Geral.IncluirQRCodeXMLNFCe := ConfiguracoesNFe.Geral.IncluirQRCodeXMLNFCe;
    // true;
    Arquivos.PathSalvar := ConfiguracoesNFe.Arquivos.PathSalvar;
    // 'D:\Lindemberg\Delphi\NFCe\';
    Arquivos.PathSchemas := ConfiguracoesNFe.Arquivos.PathSchemas;
    // 'D:\Producao\Componentes\D2007\ACBR\Exemplos\ACBrDFe\Schemas\NFe\';
    Certificados.ArquivoPFX := ConfiguracoesNFe.Certificados.ArquivoPFX;
    // 'D:\Producao\Postos\Programa\certificado\Posto Santa Rita BA = SENHA 123mudar - Expira em 19-05-2016.pfx';
    Geral.CSC := ConfiguracoesNFe.Geral.CSC;
    Geral.IdCSC := ConfiguracoesNFe.Geral.IdCSC;
    Certificados.NumeroSerie := ConfiguracoesNFe.Certificados.NumeroSerie;
    // '32144a65a088464ba8861893c72082f9';

    WebServices.Tentativas := 2;
    WebServices.Salvar := ConfiguracoesNFe.WebServices.Salvar; // true;
    WebServices.UF := ConfiguracoesNFe.WebServices.UF; // 'BA';
    WebServices.Ambiente := ConfiguracoesNFe.WebServices.Ambiente;
    WebServices.AguardarConsultaRet := 2000;
    // aguardar 2 segundos antes de consultar
    WebServices.Visualizar := ConfiguracoesNFe.WebServices.Visualizar;

  end;
end;

constructor TServicoDocumentoFiscalNFC.Create(ConfiguracoesNFe
    : TConfiguracoesNFe; proLogger: TLogger);
begin
  ConfiguracoesNFe.Geral.ModeloDF := moNFCe;
  inherited Create(ConfiguracoesNFe, proLogger);
  InicializarDocumentoFiscal;
end;

constructor TServicoDocumentoFiscalNFE.Create(ConfiguracoesNFe
    : TConfiguracoesNFe; proLogger: TLogger);
begin
  ConfiguracoesNFe.Geral.ModeloDF := moNFe;
  ConfiguracoesNFe.Geral.IncluirQRCodeXMLNFCe := false;
  inherited Create(ConfiguracoesNFe, proLogger);
  InicializarDocumentoFiscal;
end;

procedure TServicoDocumentoFiscalEletronico.GerarDFe(var Erros: string);
begin
  //FACBrNFe.NotasFiscais.Validar;
  // FACBrNFe.NotasFiscais.ValidarRegrasdeNegocios( Erros );
  if Erros = '' then
  begin
    FACBrNFe.NotasFiscais.Assinar;
    FACBrNFe.NotasFiscais.GerarNFe;
  end;
end;

function TServicoDocumentoFiscalEletronico.GetChaveAcesso: string;
begin
  result := Copy(stringReplace(DocumentoFiscal.infNFE.ID, 'NFe', '',
      [rfReplaceAll]), 1, 44);
end;

function TServicoDocumentoFiscalEletronico.GetDataReciboInutilizacao: TDatetime;
begin
   result:= FACBrNFe.WebServices.Inutilizacao.dhRecbto;
end;

function TServicoDocumentoFiscalEletronico.GetProtocoloInutilizacao: string;
begin
   result:= FACBrNFe.WebServices.Inutilizacao.Protocolo;
end;

function TServicoDocumentoFiscalEletronico.GetRetorno: TProcNFe;
begin
  result := FACBrNFe.NotasFiscais.Items[0].NFe.procNFe;

end;

function TServicoDocumentoFiscalEletronico.GetFileNameXML(prsChaveAcesso
    : string): string;
var
  digito: Integer;
begin
  GerarDigito(digito, prsChaveAcesso);
  result := ExtractPathNFe + prsChaveAcesso { + inttostr( digito ) } +
      '-nfe.xml';
end;

function TServicoDocumentoFiscalEletronico.GetFileNamePDF(prsChaveAcesso
    : string): string;
var
  digito: Integer;
begin
  GerarDigito(digito, prsChaveAcesso);
  result := ExtractPathNFe + prsChaveAcesso + '-nfe.pdf'
end;

function TServicoDocumentoFiscalEletronico.GetFileNameXML(prsChaveAcesso,
    prsPathXML: string): string;
begin
  FACBrNFe.Configuracoes.Arquivos.PathSalvar := prsPathXML;
  result := GetFileNameXML(prsChaveAcesso);
end;

procedure TServicoDocumentoFiscalEletronico.InicializarDocumentoFiscal;
begin
  GravarLog('-> Inicializando Documento fiscal...');
  try
    GravarLog('-> Limpando objetos de notas fiscais...');
    FACBrNFe.NotasFiscais.Clear;
    DocumentoFiscal := nil;
    DocumentoFiscal := FACBrNFe.NotasFiscais.Add.NFe;
    GravarLog('-> Criando danfe fast report...');
    FACBrNFeDANFEFR := TACBrNFeDANFEFR.Create(Nil);
    GravarLog('-> Danfe fast report criado com sucesso...');
  Except
     On E: Exception Do
     Begin
       GravarLog(E.Message);
       raise Exception.Create(E.Message);
     End;
  End;
  GravarLog('-> Documento fiscal inicializado com sucesso...');
end;

function TServicoDocumentoFiscalEletronico.Inutilizar(psCNPJEmit, psModelo,
    psSerie, psAno, psNumeroInicial, psNumeroFinal, psJustificativa
    : String): boolean;
begin
  result := false;
  if (TComponentUtils.IsStrANumber(psSerie)) then
  begin
    Try
      FACBrNFe.Configuracoes.WebServices.Visualizar := false;

      FACBrNFe.WebServices.Inutiliza(psCNPJEmit, psJustificativa,
          StrToInt(psAno), StrToInt(psModelo), StrToInt(psSerie),
          StrToInt(psNumeroInicial), StrToInt(psNumeroFinal));

      result := True;
    Except
      On E: Exception Do
      Begin
        raise Exception.Create(E.Message);
      End;
    End;
  end
  else
  begin
    raise Exception.Create('A Série da NFC-e é inválida!');
  end;

end;

procedure TServicoDocumentoFiscalEletronico.LoadFromFile(Arquivo: string);
begin
  FACBrNFe.NotasFiscais.Clear;
  FACBrNFe.NotasFiscais.LoadFromFile(Arquivo, false);
end;

procedure TServicoDocumentoFiscalEletronico.LoadFromXml(XmlFile: TBlob);
var loTempFile: TFileStream;
    loTempFileName, XmlContent: String;
begin
  loTempFileName := TPath.GetTempFileName;
  loTempFile := TFile.Create(loTempFileName);
  XmlFile.SaveToStream(loTempFile);
  loTempFile.Free;
  loTempFile := Nil;
  XmlContent := TFile.ReadAllText(loTempFileName);
  TFile.Delete(loTempFileName);
  FACBrNFe.NotasFiscais.Clear;
  FACBrNFe.NotasFiscais.LoadFromString(XmlContent, false);
end;

function TServicoDocumentoFiscalNFC.GetQrCode: string;
begin
  result := FACBrNFe.GetURLQRCode(DocumentoFiscal.Ide.cUF,
      DocumentoFiscal.Ide.tpAmb, DocumentoFiscal.infNFE.ID,
      DocumentoFiscal.Dest.CNPJCPF, DocumentoFiscal.Ide.dEmi,
      DocumentoFiscal.Total.ICMSTot.vNF, DocumentoFiscal.Total.ICMSTot.vBC,
      DocumentoFiscal.signature.DigestValue,
      DocumentoFiscal.infNFe.Versao);
end;

procedure TServicoDocumentoFiscalNFC.Validar;
begin
  try
    FACBrNFe.NotasFiscais.Validar;
  Except
    On E: Exception Do
    Begin
      TFormDialog.showErro(E.Message);
    End;
  End;
end;

procedure TServicoDocumentoFiscalNFC.Gerar(var Erros: string);
begin
  DocumentoFiscal.Transp.modFrete := mfSemFrete; // NFC-e não tem FRETE
  DocumentoFiscal.infNFeSupl.qrCode := GetQrCode;
  GerarDFe(Erros);
end;

function TServicoDocumentoFiscalNFC.Enviar(Lote: string): boolean;
begin
  Result:= FACBrNFe.Enviar( Lote, false, true);
  //FACBrNFe.Enviar(Lote, false );
  //result := FACBrNFe.Consultar;
end;

procedure TServicoDocumentoFiscalNFE.Gerar(var Erros: string);
begin
  GerarDFe(Erros)
end;



procedure TServicoDocumentoFiscalNFE.Validar;
begin
  inherited;

end;

function TServicoDocumentoFiscalNFE.Enviar(Lote: string): boolean;
begin
  result := FACBrNFe.Enviar(Lote);
end;

function TServicoDocumentoFiscalEletronico.EnviarEmailNF(prsEmailDestinatario
    : String): boolean;

  function HTMLTag(prsTag, prsConteudo: String): String;
  Begin
    if LowerCase(prsTag) = 'br' then
    Begin
      result := '<br>';
      Exit;
    End;
    result := Format('<%s>%s</%s>', [prsTag, prsConteudo, prsTag]);
  end;

Var
  lslMensagens: TStringList;
  lstAnexos: TStringList;
  lsArquivo: string;
  lsArquivoPDF: string;
  loMAIL: TACBrMail;
  loEmpresa : TEmpresa;
begin
  If prsEmailDestinatario = '' Then
  Begin
    result := True;
    Exit;
  End;

  Try
    Try
      loEmpresa := TEmpresaSingleton.GetInstancia;

      loMAIL := TACBrMail.Create(Application);
      loMAIL.from := loEmpresa.Email;
      loMAIL.host := loEmpresa.UrlSmtp;
      loMAIL.AddAddress(prsEmailDestinatario);
      loMAIL.Username := loEmpresa.Email;
      loMAIL.Password := loEmpresa.Senha;
      loMAIL.port := loEmpresa.PortaSmtp;
      loMAIL.IsHTML := True;
      loMAIL.SetSSL := False;
      loMAIL.SetTLS := False;

      FACBrNFe.MAIL := loMAIL;

      if (FACBrNFe.MAIL.host <> '') and (prsEmailDestinatario <> '') then
      begin
        lslMensagens := TStringList.Create;
        lslMensagens.Add(Format('URI da nota fiscal: %s%s',
            [DocumentoFiscal.signature.URI, HTMLTag('br', '')]));
        lslMensagens.Add(Format('Empresa: %s%s', [DocumentoFiscal.Emit.xNome,
            HTMLTag('br', '')]));
        lslMensagens.Add(Format('CNPJ: %s', [DocumentoFiscal.Emit.CNPJCPF]));
        lsArquivo := GetFileNameXML(stringReplace(DocumentoFiscal.infNFE.ID,
            'NFe', '', []));
        lsArquivoPDF := GetFileNamePDF( stringReplace( DocumentoFiscal.infNFE.ID ,'NFe','',[]) );

        if FileExists(lsArquivo) then
        begin
          lstAnexos := TStringList.Create;
          lstAnexos.Add(GetFileNameXML(stringReplace(DocumentoFiscal.infNFE.ID,
              'NFe', '', [])));
          if FileExists(lsArquivoPDF) then
             lstAnexos.Add( GetFileNamePDF( stringReplace( DocumentoFiscal.infNFE.ID ,'NFe','',[]) ) );
        end;

        Try
          FACBrNFe.EnviarEmail(prsEmailDestinatario,
              Format('NFE - %s', [DocumentoFiscal.Emit.xNome]), lslMensagens,
              nil, lstAnexos, nil);
        Except
          On E: Exception Do
          Begin
            TFormDialog.showErro('Erro ao enviar o e-mail. ' +
                'Por favor verifique se as suas configurações de e-mail estão corretas. '
                + E.Message);
            Exit;
          End;
        End;
      end;
      result := True;
    Except
      on E: Exception do
      begin
        TFormDialog.showErro(E.Message);
        result := false;
      end;
    End;
  Finally
    FreeAndNil(lslMensagens);
    if lstAnexos <> nil then
      lstAnexos.free;
  End;
end;

function TServicoDocumentoFiscalEletronico.EnviarEmailNF(prsEmailDestinatario,
    prsChaveDeAcesso: String): boolean;

  function HTMLTag(prsTag, prsConteudo: String): String;
  Begin
    if LowerCase(prsTag) = 'br' then
    Begin
      result := '<br>';
      Exit;
    End;
    result := Format('<%s>%s</%s>', [prsTag, prsConteudo, prsTag]);
  end;

Var
  lslMensagens: TStringList;
  lstAnexos: TStringList;
  lsArquivo: string;
  loMAIL: TACBrMail;
begin
  If prsEmailDestinatario = '' Then
  Begin
    result := True;
    Exit;
  End;

  Try
    Try
      loMAIL := TACBrMail.Create(Application);
      loMAIL.from := '';
      loMAIL.host := 'smtp.tecsoft.info';
      loMAIL.Username := '';
      loMAIL.Password := '';
      loMAIL.IsHTML := True;
      loMAIL.port := '587';
      loMAIL.SetSSL := false;
      loMAIL.SetTLS := false;

      FACBrNFe.MAIL := loMAIL;

      if (FACBrNFe.MAIL.host <> '') and (prsEmailDestinatario <> '') then
      begin
        lslMensagens := TStringList.Create;
        lslMensagens.Add(Format('URI da nota fiscal: %s%s', [prsChaveDeAcesso,
            HTMLTag('br', '')]));
        lslMensagens.Add(Format('Empresa: %s%s', [DocumentoFiscal.Emit.xNome,
            HTMLTag('br', '')]));
        lslMensagens.Add(Format('CNPJ: %s', [DocumentoFiscal.Emit.CNPJCPF]));
        lsArquivo := GetFileNameXML(prsChaveDeAcesso);

        if FileExists(lsArquivo) then
        begin
          lstAnexos := TStringList.Create;
          lstAnexos.Add(GetFileNameXML(prsChaveDeAcesso));
          // lstAnexos.Add( GetFileNamePDF( prsChaveDeAcesso ) );
        end;

        Try
          FACBrNFe.EnviarEmail(prsEmailDestinatario,
              Format('NFE - %s', [DocumentoFiscal.Emit.xNome]), lslMensagens,
              nil, lstAnexos, nil);
        Except
          On E: Exception Do
          Begin
            TFormDialog.showErro('Erro ao enviar o e-mail. ' +
                'Por favor verifique se as suas configurações de e-mail estão corretas. '
                + E.Message);

            Exit;
          End;
        End;
      end;
      result := True;
    Except
      on E: Exception do
      begin
        TFormDialog.showErro(E.Message);
        result := false;
      end;
    End;
  Finally
    FreeAndNil(lslMensagens);
    if lstAnexos <> nil then
      lstAnexos.free;
  End;
end;

function TServicoDocumentoFiscalEletronico.ExtractPathNFe: string;
begin
  result := FACBrNFe.Configuracoes.Arquivos.PathSalvar;
end;

function TServicoDocumentoFiscalEletronico.VerificarStatusServico: boolean;
begin
  result := false;
  try
    FACBrNFe.Configuracoes.WebServices.Visualizar := false;
    result := FACBrNFe.WebServices.StatusServico.Executar;
  except
  end;
end;

function TServicoDocumentoFiscalEletronico.VerificarDataVencimentoCertificado
    (numSerie: String): String;
begin
  try
    {if TRIM(numSerie) <> '' then
    begin
      numSerie := UpperCase(numSerie);
      numSerie := stringReplace(numSerie, '?', '', []);
      FACBrNFe.Configuracoes.Certificados.NumeroSerie := numSerie;
    end;}
    result := FormatDateBr(FACBrNFe.SSL.CertDataVenc);
  except
    result := '';
  end;
end;

procedure TServicoDocumentoFiscalEletronico.ConfigurarContingencia
    (Data: TDatetime);
begin
  with DocumentoFiscal.Ide do
  begin
    tpEmis := teOffLine;
    dhCont := StrToDatetime(FormatDatetime('DD/MM/YYYY ', Data) +
        FormatDatetime('HH:MM:SS ', Time));
    xJust := 'COMUNICAÇÃO INDISPONIVEL COM SERVIDOR DO SEFAZ';
  end;
  DocumentoFiscal.InfAdic.infAdFisco := 'EMITIDA EM CONTINGÊNCIA';
end;

function TServicoDocumentoFiscalEletronico.ConsultarNFeNaSefaz(
  prsChaveAcesso: string; var pdtDhRecbto: TDateTime; var prsProtocolo,  prsStatus: string): Boolean;
var
  lstStatusList: TStringList;
  liDigito:Integer;
begin
   Sleep(1000);
   GerarDigito( liDigito, prsChaveAcesso );
   FACBrNFe.WebServices.Consulta.NFeChave := prsChaveAcesso+inttostr(liDigito);
   FACBrNFe.WebServices.Consulta.Executar;
   try
     lstStatusList:= TStringList.create;
     lstStatusList.add('100');//Autorizado o uso da NF-e
     lstStatusList.add('103');//Lote recebido com sucesso
     lstStatusList.add('104');//Lote processado
     lstStatusList.add('105');//Lote em processamento

     pdtDhRecbto  := FACBrNFe.WebServices.Consulta.DhRecbto;
     prsProtocolo := FACBrNFe.WebServices.Consulta.Protocolo;
     prsStatus    := IntToStr(FACBrNFe.WebServices.Consulta.cStat);

     result:= lstStatusList.IndexOf(IntToStr(FACBrNFe.WebServices.Consulta.cStat)) > -1;
   finally
     lstStatusList.Free;
   end;
end;

function TServicoDocumentoFiscalEletronico.AmbienteHomologacao: boolean;
begin
  result := FACBrNFe.Configuracoes.WebServices.AmbienteCodigo = 2;
end;

function TServicoDocumentoFiscalEletronico.AmbienteProducao: boolean;
begin
  result := FACBrNFe.Configuracoes.WebServices.AmbienteCodigo = 1;
end;

function TServicoDocumentoFiscalEletronico.Cancelar(LoteNFe , prsChaveAcesso, Justificativa, Protocolo: String): boolean;
var
  digito: Integer;
  lsArquivo: string;
begin
  result := false;
  try
    lsArquivo := GetFileNameXML(prsChaveAcesso);
    if FileExists(lsArquivo) then
      LoadFromFile(lsArquivo)
    else
    begin
      raise Exception.Create('O Arquivo XML não foi localizado ' + lsArquivo);
    end;

    GerarDigito(digito, prsChaveAcesso);
    FACBrNFe.EventoNFe.Evento.Clear;

    with FACBrNFe.EventoNFe.Evento.Add do
    begin
      infEvento.chNFe := prsChaveAcesso; // +inttostr(digito);
      infEvento.CNPJ := Copy(prsChaveAcesso, 7, 14);
      infEvento.dhEvento := now;
      infEvento.tpAmb := FACBrNFe.Configuracoes.WebServices.Ambiente;
      infEvento.cOrgao := StrToInt(Copy(prsChaveAcesso, 1, 2));
      infEvento.tpEvento := teCancelamento;
      infEvento.detEvento.xJust := Justificativa;
      infEvento.detEvento.nProt := Protocolo;
      infEvento.versaoEvento:= '1.00';
    end;

    if FACBrNFe.EnviarEvento(StrToInt(LoteNFe) ) then
    begin
      with FACBrNFe.WebServices.EnvEvento do
      begin
        if EventoRetorno.retEvento.Items[0].RetInfEvento.cStat <> 135 then
        begin
          raise Exception.CreateFmt
              ('Ocorreu o seguinte erro ao cancelar a NFE:' + sLineBreak +
              'Código:%d' + sLineBreak + 'Motivo: %s',
              [EventoRetorno.retEvento.Items[0].RetInfEvento.cStat,
              EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo]);
        end;
      end;
      result := True;
    end
    else
    begin
      with FACBrNFe.WebServices.EnvEvento do
      begin
        raise Exception.Create
            ('Ocorreram erros ao tentar efetuar o cancelamento da NFE:' +
            sLineBreak + 'Lote: ' + inttostr(EventoRetorno.idLote) + sLineBreak
            + 'Ambiente: ' + TpAmbToStr(EventoRetorno.tpAmb) + sLineBreak +
            'Orgao: ' + inttostr(EventoRetorno.cOrgao) + sLineBreak + sLineBreak
            + 'Status: ' + inttostr(EventoRetorno.cStat) + sLineBreak +
            'Motivo: ' + EventoRetorno.xMotivo);
      end;
    end;
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro: ' + E.Message);
      Exit;
    end;
  end;
end;

destructor TServicoDocumentoFiscalEletronico.Destroy;
begin
  if FACBrNFe <> nil then
    FACBrNFe.free;
  if FACBrNFeDANFEFR <> nil then
    FACBrNFeDANFEFR.free;
  // if FDocumentoFiscal <> nil then
  // FDocumentoFiscal.free;
end;

function TServicoDocumentoFiscalEletronico.GetURLConsultaNFCe
    (ArquivoXML: string): string;
begin
  FACBrNFe.NotasFiscais.LoadFromFile(ArquivoXML, false);
  if AmbienteHomologacao then
    result := FACBrNFe.GetURLConsultaNFCe(FDocumentoFiscal.Ide.cUF,
        getAmbiente, FDocumentoFiscal.infNFe.Versao)
  else
    result := FACBrNFe.GetURLConsultaNFCe(FDocumentoFiscal.Ide.cUF,
        taProducao, FDocumentoFiscal.infNFe.Versao);
end;

procedure TServicoDocumentoFiscalEletronico.GravarLog(prsTexto: String);
begin
   if Assigned(FLogger)Then
      FLogger.RegistrarLog(prsTexto);
end;

function TServicoDocumentoFiscalEletronico.GetRetornoRecibo: string;
begin
  result := FACBrNFe.WebServices.Retorno.Recibo;
end;

{ TServicoDocumentoFiscalSATMFE }

procedure TServicoDocumentoFiscalSATMFE.AjustarCodigoDeAtivacao(
  var Chave: AnsiString);
begin
 Chave := FDispositivo.CodigoAtivacaoSATMFE//'123456789';
end;

procedure TServicoDocumentoFiscalSATMFE.AjustarSignAC(var Chave: AnsiString);
begin
   Chave := FDispositivo.SignACSATMFE;//'SGR-SAT SISTEMA DE GESTAO E RETAGUARDA DO SAT';
end;

function TServicoDocumentoFiscalSATMFE.Cancelar(prsChaveAcesso: string): boolean;
var lsXML    : string;
    lsChave : string;
    lsErrorMessage: String;
begin
  try
     DocumentoSATMFE.CFe.LoadFromFile(DocumentoSATMFE.ConfigArquivos.PastaCFeVenda +'\AD' + prsChaveAcesso + '.xml' );
     DocumentoSATMFE.CFe2CFeCanc;

     lsXML := DocumentoSATMFE.CFeCanc.GerarXML( True ) ;
     lsChave := DocumentoSATMFE.CFeCanc.infCFe.chCanc;

     DocumentoSATMFE.CancelarUltimaVenda(lsChave, lsXML);
     DocumentoSATMFE.CFeCanc.SaveToFile(DocumentoSATMFE.ConfigArquivos.PastaCFeCancelamento+ '\cancel_' + prsChaveAcesso + '.xml');

     If DocumentoSATMFE.Resposta.codigoDeRetorno <> 7000 then
     begin
        lsErrorMessage := DocumentoSATMFE.Resposta.mensagemRetorno + ' - ' +
                          DocumentoSATMFE.Resposta.mensagemSEFAZ + '(' + IntToStr(DocumentoSATMFE.Resposta.codigoDeRetorno) + ' - ' +
                                                                   IntToStr(DocumentoSATMFE.Resposta.codigoSEFAZ) + ')';
        raise Exception.Create(lsErrorMessage);
     end
     else
        Result := True;

   finally
   end;

end;

constructor TServicoDocumentoFiscalSATMFE.Create(prbAmbiente: TpcnTipoAmbiente; prsPath: string; proLogger: TLogger);
const VERSAO_LEIAUTE: real = 0.07;
      CNPJ_SOFTHOUSE: string = '35643899000145';
var
  loEmpresa: TEmpresa;

begin
   loEmpresa := TEmpresaSingleton.GetInstancia;
   FDispositivo := TDispositivoSingleton.GetInstancia;
   try

    if not DirectoryExists(prsPath + '\Logs\') then
       ForceDirectories(prsPath + '\Logs\');
    if not DirectoryExists(prsPath + '\Enviar\CF-e-SAT\Cancelamentos\') then
       ForceDirectories(prsPath + '\Enviar\CF-e-SAT\Cancelamentos\');
    if not DirectoryExists(prsPath + '\Enviar\CF-e-SAT\Individuais\') then
       ForceDirectories(prsPath + '\Enviar\CF-e-SAT\Individuais\');

    FLogger:= proLogger;
    CriarExtrato;
    FACBrSAT := TACBrSAT.Create( nil );
    FACBrSAT.OnGetcodigoDeAtivacao := AjustarCodigoDeAtivacao;
    FACBrSAT.OnGetsignAC           := AjustarSignAC;
    FACBrSAT.Modelo                := satDinamico_stdcall;//Se( loModeloCFe = cfemSAT, satDinamico_stdcall, mfe_Integrador_XML);
    FACBrSAT.NomeDLL               := 'dllsat.dll'; //Se( loModeloCFe = cfemSAT, 'dllsat.dll', 'integrador.dll' );
    FACBrSATExtrato.ACBrSAT        := FACBrSAT;
    FACBrSAT.Extrato               := FACBrSATExtrato;
    FACBrSAT.ArqLOG                := prsPath + '\Logs\SAT_' + FormatDateTime( 'yyyymmdd', Now ) + '.log';
    FACBrSAT.ConfigArquivos.PastaCFeVenda         := prsPath + '\Enviar\CF-e-SAT\Individuais';
    FACBrSAT.ConfigArquivos.SalvarCFe             := True;
    FACBrSAT.ConfigArquivos.PastaCFeCancelamento  := prsPath + '\Enviar\CF-e-SAT\Cancelamentos';
    FACBrSAT.CFe.ide.numeroCaixa    := 1;
    FACBrSAT.Config.ide_numeroCaixa := 1;
    FACBrSAT.Config.ide_tpAmb       := prbAmbiente;
    FACBrSAT.Config.ide_CNPJ   := CNPJ_SOFTHOUSE;
    FACBrSAT.Config.emit_CNPJ  := loEmpresa.Pessoa.CnpjCpf;
    FACBrSAT.Config.emit_IE    := loEmpresa.Pessoa.InscricaoEstadual;
    //loACBrSAT.Config.emit_IM   := proEmpresa.;

    if FACBrSAT.Config.ide_tpAmb = taHomologacao then
    begin
       {FACBrSAT.Config.ide_CNPJ  := '11111111111111';
       FACBrSAT.Config.emit_CNPJ := '11111111111111';
       FACBrSAT.Config.emit_IE   := '111111111111';
       FACBrSAT.Config.emit_IM   := '111111'; }

       FACBrSAT.Config.ide_CNPJ  := '16716114000172';
       FACBrSAT.Config.emit_CNPJ := '10261693000120';
       FACBrSAT.Config.emit_IE   := '111111111111';
       FACBrSAT.Config.emit_IM   := '123123';
    end;

    FACBrSAT.Config.emit_cRegTrib      := RTRegimeNormal;
    if loEmpresa.OptanteSimples = 'S' then
       FACBrSAT.Config.emit_cRegTrib   := RTSimplesNacional;
    FACBrSAT.Config.emit_indRatISSQN   := irNao;
    FACBrSAT.Config.PaginaDeCodigo     := 0;
    FACBrSAT.Config.EhUTF8             := True;
    FACBrSAT.Config.infCFe_versaoDadosEnt := VERSAO_LEIAUTE;
    FACBrSAT.CFe.IdentarXML               := True;
    FACBrSAT.CFe.TamanhoIdentacao         := 3;
    FACBrSAT.Inicializado                 := True;

    DocumentoSATMFE := FACBrSAT;
  except
    on E: Exception do
    begin
       GravarLog('Ocorreu um erro ao iniciar uma instância do TAcbrSAT, erro ao %s: %s'+  E.Message);
    end;
  end;

end;

function TServicoDocumentoFiscalSATMFE.Enviar(proVenda: TVenda): boolean;
const APENAS_TAGS_APLICACAO: boolean = true;
var loACBrSAT: TACBrSAT;
    lsXML: string;
    lsRetorno: string;
begin
  try
     try
        lsXML := DocumentoSATMFE.CFe.GerarXML( APENAS_TAGS_APLICACAO );

        try
           lsRetorno := DocumentoSATMFE.EnviarDadosVenda( lsXML );

           if pos('Erro', lsRetorno) = 0 then
           Begin
             DocumentoSATMFE.Extrato.ACBrSAT := DocumentoSATMFE;
             DocumentoSATMFE.Extrato.MostrarPreview := True;
             DocumentoSATMFE.ImprimirExtrato;
           End
           else
           Begin
             raise Exception.Create(lsRetorno);
           End;

        except
           on e : Exception do
           begin
             if AnsiPos('Sem Resposta do Integrador', e.Message) > 0 then
             begin
               e.Message := 'A aplicação está sem comunicação com o Integrador. '+
                            'Por favor, verifique se a aplicação Integrador Fiscal está aberta';
             end;
             raise;
           end;
        end;

        if DocumentoSATMFE.Resposta.codigoDeRetorno <> 6000 then
        begin
           raise Exception.Create(loACBrSAT.Resposta.mensagemRetorno + ' - ' +
                                  loACBrSAT.Resposta.mensagemSEFAZ + '(' + IntToStr(loACBrSAT.Resposta.codigoDeRetorno) + ' - ' +
                                                                           IntToStr(loACBrSAT.Resposta.codigoSEFAZ) + ')');
        end
        else
          Result := True;
     Except
        On E : Exception Do
        Begin
           try
              //if Assigned(FACBrSAT) then
              //   FreeAndNil(FACBrSAT);
           except
              on Ex: Exception do
              begin

              end;
           end;
           E.Message := 'Processo da venda Sat Interrompido. ' + E.Message;
           raise;
        End;
     End;
  finally
     if Assigned(FACBrSAT) then
        FACBrSAT.Inicializado := False;
  end;

end;

procedure TServicoDocumentoFiscalSATMFE.CriarExtrato;
begin
   FACBrSATExtrato := TACBrSATExtratoFortes.Create( nil );
   FACBrSATExtrato.LarguraBobina    := 302;
   FACBrSATExtrato.Margens.Topo     := 5;
   FACBrSATExtrato.Margens.Fundo    := 5;
   FACBrSATExtrato.Margens.Esquerda := 4;
   FACBrSATExtrato.Margens.Direita  := 8;
   FACBrSATExtrato.MostrarPreview   := True;
   FACBrSATExtrato.Mask_qCom := '0.000';
   FACBrSATExtrato.Mask_vUnCom := '0.00';
   FACBrSATExtrato.NomeArquivo := 'satcfe.pdf';
   FACBrSATExtrato.SoftwareHouse := 'TecSoft - www.tecsoft.info';
   //if gsUFEmp <> 'SP' then
   //   FACBrSATExtrato.MsgAppQRCode := '';
end;

procedure TServicoDocumentoFiscalSATMFE.Gerar(var Erros: string);
begin

end;

end.
