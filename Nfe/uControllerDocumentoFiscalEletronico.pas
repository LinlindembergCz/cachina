unit uControllerDocumentoFiscalEletronico;

interface

uses
  Classes, DBClient, Windows, ACBrUtil, uDialog, Xml.XMLDoc, DB, Dialogs,
  SysUtils, pcnNFe,
  DateUtils, strUtils, pcnAuxiliar, System.Generics.Collections, pcnProcNFe,
  uServicoDocumentoFiscalEletronico, WiniNet, Venda, uServicoVenda,
  pcnConversao, ItemVenda, uServicoParametro, uAbastecimentoController,
  uClassLogger;

type
  TControllerDocumentoFiscalEletronico = class
  private
    FCodigoEmpresa: string;
    FCNPJCPFEmp: string;
    FSeqNotaFiscal: string;
    FSerie: string;
    FEspecie: string;
    FDataEmissao: TDatetime;
    FEmailArquivoXML: string;
    FSenhaMaster: Boolean;
    FDataHoraContingencia: TDatetime;
    FPastaXML: string;
    // gACBrNFe : TACBrNFe;
    FServicoDFE: TServicoDocumentoFiscalEletronico;
    FServicoSATMFE: TServicoDocumentoFiscalSATMFE;
    FSempreImprimirNFCE: Boolean;
    // -> Pegar o caminho da aplicação
    gsPath: String;
    // <- Pegar o caminho da aplicação
    _ServicoVenda: TServicoVenda;
    FLogger: TLogger;
    function Enviar(prsSeqNotaFiscal, prsEspecie, prsSerie: string;
      var prbContingencia: Boolean; proVenda: TVenda = nil): Boolean; overload;
    function Enviar(proVenda: TVenda): Boolean; overload;
    function Inutilizar(prsSeqnotafiscal1, prsSeqnotafiscal2, prsEspecie,
      prsSerie, Mensagem: string; proVenda: TVenda;
      UpdateStatus: Boolean = true): Boolean;
    procedure CriarXmlContingencia(proVenda: TVenda);
    procedure GravarLog(prsTexto: String);

  public
    constructor Create(prsCodigoEmpresa: string;
      prsCNPJCPFEmp: string); overload;
    constructor Create(prsCodigoEmpresa: string; prsCNPJCPFEmp: string;
      prsSeqNotaFiscal: string; prsSerie: string; prsEspecie: string;
      prdDataEmissao: TDatetime; prsEmailArquivoXML: string;
      prbSenhaMaster: Boolean; proLogger: TLogger); overload;
    constructor Create; overload;
    destructor Destroy; override;
    class function GetSeqLoteNFe(prsSequenciaNotaFiscal, prsSerieNotaFiscal,
      prsEspecie: string): string;
    function ImprimirDanfe(proVenda: TVenda;
      pbSalvarPDF: Boolean = false): Boolean;
    procedure ReImprimirDanfe(prsChaveNFe: string);
    function EnviarDanfeEmail(prsChaveNFe: string): Boolean;
    procedure GerarNFC(proVenda: TVenda; var prbContingencia: Boolean;
      prbVendaAdd: Boolean = true);
    procedure GerarNFE(proVenda: TVenda; var prbContingencia: Boolean;
      prbVendaAdd: Boolean = true);
    procedure GerarSATMFE(proVenda: TVenda; var prbContingencia: Boolean;
      prbVendaAdd: Boolean = true);
    function EnviarContingencia(proVenda : TVenda): Boolean;
    function RetornarNotasFiscaisContingencia(): Integer;
    procedure Cancelar(prsSeqNotaFiscal, prsEspecie, prsSerie, prsChaveAcesso,
      prsProtocolo: String; prsDataProtocolo: TDatetime; proVenda: TVenda);
    procedure CancelarSATMFE(prsChaveAcesso: String; proVenda: TVenda);
    function InutilizarSequenciaFaixa(prsSeqnotafiscal1, prsSeqnotafiscal2,
      prsEspecie, prsSerie, Mensagem: string; proVenda: TVenda;
      UpdateStatus: Boolean): Boolean;
    property SempreImprimirNFCE: Boolean read FSempreImprimirNFCE
      write FSempreImprimirNFCE;
    property ServicoVenda: TServicoVenda read _ServicoVenda write _ServicoVenda;
    function ImprimirDanfeNFESimplificado(proVenda: TVenda): Boolean;
    function ConsultarNFeNaSefaz(  proVenda : TVenda; var pdtDhRecbto: TDateTime; var prsProtocolo, prsStatus: string): Boolean;
  end;

  // Pra não sobrecarregar o controller criei a classe de helper
  TDocumentoFiscalEletronicoHelper = class helper For
    TControllerDocumentoFiscalEletronico
  private
    procedure AtualizarVenda(Retorno: TProcNFe; proVenda: TVenda;
      prsSeqNotaFiscal, prsEspecie, prsSerie, lsURLQrCode, prsRecibo: string);
    procedure AlterarNFE_Status(penumStatus: TStatusEnum; proVenda: TVenda;
      prsURLQRCode, prsChaveAcesso: string);
    procedure PreencherChaveAcesso(proVenda: TVenda );


  public
    procedure AdicionarVenda(proVenda: TVenda = nil);
    function VerificaConexaoInternet: Boolean;
    function GetStatusCertificado(var prsdata: string): TTipoCertificado;
    Function Modulo11(Valor: String; Base: Integer = 9;
      Resto: Boolean = false): string;
  end;

implementation

uses uFactoryServicoDocumentoFiscalEletronico, uGlobais, uUsuarioSingleton,
  uDispositivoSingleton, uTabelaDePrecoPadraoSingleton;

{ TControllerDocumentoFiscalEletronico }

constructor TControllerDocumentoFiscalEletronico.Create(prsCodigoEmpresa
  : string; prsCNPJCPFEmp: string; prsSeqNotaFiscal: string; prsSerie: string;
  prsEspecie: string; prdDataEmissao: TDatetime; prsEmailArquivoXML: string;
  prbSenhaMaster: Boolean; proLogger: TLogger);
begin
  gsPath := Trim(ExtractFilePath(ParamStr(0)));
  If Copy(gsPath, Length(gsPath), 1) <> '\' Then
    gsPath := gsPath + '\';

  FCodigoEmpresa := prsCodigoEmpresa;
  FCNPJCPFEmp := prsCNPJCPFEmp;
  FSeqNotaFiscal := prsSeqNotaFiscal;
  FSerie := prsSerie;
  FEspecie := prsEspecie;
  FDataEmissao := prdDataEmissao;
  FEmailArquivoXML := prsEmailArquivoXML;
  FSenhaMaster := prbSenhaMaster;
  FSempreImprimirNFCE := true;
  FPastaXML := gsPath + 'Enviar\'+ prsEspecie +'\Individuais\' + FCNPJCPFEmp + '\' + FormatDatetime('MM-YYYY', date);


  FLogger:= proLogger;

  if Not Assigned(_ServicoVenda) then
    _ServicoVenda := TServicoVenda.Create;
end;

constructor TControllerDocumentoFiscalEletronico.Create(prsCodigoEmpresa
  : string; prsCNPJCPFEmp: string);
begin
  gsPath := Trim(ExtractFilePath(ParamStr(0)));
  If Copy(gsPath, Length(gsPath), 1) <> '\' Then
    gsPath := gsPath + '\';

  FCodigoEmpresa := prsCodigoEmpresa;
  FCNPJCPFEmp := prsCNPJCPFEmp;
  FPastaXML := gsPath + 'Enviar\NFe\Individuais\' + FCNPJCPFEmp + '\' +
    FormatDatetime('MM-YYYY', date);
  FSempreImprimirNFCE := true;

  if Not Assigned(_ServicoVenda) then
    _ServicoVenda := TServicoVenda.Create;
end;

destructor TControllerDocumentoFiscalEletronico.Destroy;
begin
  // if FServicoDFE <> nil then FServicoDFE.free;
  // if pvoDAONfe <> nil then pvoDAONfe.free;
  // if gACBrNFe <> nil then
  // gACBrNFe.Free;
  if FServicoDFE <> nil then
     FreeAndNil(FServicoDFE);


end;

procedure TControllerDocumentoFiscalEletronico.GerarNFC(proVenda: TVenda;
  var prbContingencia: Boolean; prbVendaAdd: Boolean = true);
var
  lsErros: string;
  lbContingencia: Boolean;
  lsPathXmlGerado: string;
begin
  try
    // prepara um serviço que implmenta o ACBR
    FServicoDFE := TFactoryServicoDocumentoFiscalEletronico.FactoryServicoNFC
      (proVenda, FPastaXML, false);
    TFormDialog.GravarLogErro('Salvando VENDA');
    if prbVendaAdd then
      AdicionarVenda(proVenda);
    TFormDialog.GravarLogErro('Salvo VENDA');

    // Se não houver conexao com a internet ou o serviço da sefaz não responder gerar NFC em modo contingencia
    lbContingencia := (not VerificaConexaoInternet) or (prbContingencia);
    if lbContingencia then
    begin
      if FDataHoraContingencia = 0 then
        FDataHoraContingencia := now;
      FServicoDFE.ConfigurarContingencia(FDataHoraContingencia);
    end
    else
    begin
      FDataHoraContingencia := 0;
    end;
    // Geração do XML na pasta Enviar
    try
      // FServicoDFE.Validar;
      (FServicoDFE as TServicoDocumentoFiscalNFC).Gerar(lsErros);
      if lsErros <> '' then
        raise Exception.Create('Problema(s) na Pre-Validação: ' + lsErros);

      if (not lbContingencia) then
      // Só envia a nota se não estiver em contigencia, ou seja, on-line.
      begin // Enviar a Nota Fiscal
        try
          if Enviar(proVenda) then
          begin
            proVenda.UrlConsultaQRCode := (FServicoDFE as TServicoDocumentoFiscalNFC).GetQrCode;
            lsPathXmlGerado := FPastaXML + '\' + FServicoDFE.GetChaveAcesso + '-nfe.xml';
            proVenda.UrlConsultaSefaz := FServicoDFE.GetURLConsultaNFCe
              (lsPathXmlGerado);
            proVenda.SetXmlNota(lsPathXmlGerado);
            _ServicoVenda.Update(proVenda);
            if FServicoDFE.DocumentoFiscal.InfAdic <> Nil then
              proVenda.InfoComplementarNota :=
                FServicoDFE.DocumentoFiscal.InfAdic.infCpl;
            ImprimirDanfe(proVenda, true);
            if (FEmailArquivoXML <> '') then
            begin
              FServicoDFE.EnviarEmailNF(FEmailArquivoXML);
            end;
          end;
        except
          on E: Exception do
          begin
            Sleep(1000);
            if (Pos('conexão com o servidor', E.message) > 0) or
              (Pos('I/O', E.message) > 0) or
              (Pos('Erro geral de rede', E.message) > 0) or
              (not VerificaConexaoInternet) or
              (Pos('limite da operação', E.message) > 0) then
            begin
              if FDataHoraContingencia = 0 then
                FDataHoraContingencia := now;
              FServicoDFE.ConfigurarContingencia(FDataHoraContingencia);
              CriarXmlContingencia(proVenda);
            end
            else
            begin
              raise Exception.Create(E.message);
            end;
          end;
        end;
      end
      else
      begin
        CriarXmlContingencia(proVenda);
      end;
    Except
      On E: Exception Do
      Begin
        raise Exception.Create(E.message);
      end;
    end;
  finally
    // if FServicoDFE <> nil then FServicoDFE.free;
  end;
end;

function TControllerDocumentoFiscalEletronico.ConsultarNFeNaSefaz(
  proVenda : TVenda;
  var pdtDhRecbto: TDateTime;
  var prsProtocolo,  prsStatus: string): Boolean;
begin
   if Not Assigned(FServicoDFE) then
     FServicoDFE := TFactoryServicoDocumentoFiscalEletronico.FactoryServicoNFC( proVenda, FPastaXML, false, FLogger );

   Result := FServicoDFE.ConsultarNFeNaSefaz(Copy(proVenda.ChaveNFE, 1, 43), pdtDhRecbto, prsProtocolo, prsStatus);
end;

constructor TControllerDocumentoFiscalEletronico.Create;
begin
  inherited;
  FServicoDFE := TFactoryServicoDocumentoFiscalEletronico.FactoryServicoNFC(nil,
    FPastaXML, false);
end;

procedure TControllerDocumentoFiscalEletronico.CriarXmlContingencia
  (proVenda: TVenda);
var
  lsURLQrCode: string;
  XMLNFCe: TXMLDocument;
begin
  lsURLQrCode := FServicoDFE.GetURLConsultaNFCe
    (FPastaXML + '\' + FServicoDFE.GetChaveAcesso + '-nfe.xml');
  AlterarNFE_Status( tsContingencia , proVenda, lsURLQrCode, FServicoDFE.GetChaveAcesso);
  ImprimirDanfe(proVenda, true);
end;

function TControllerDocumentoFiscalEletronico.Enviar(proVenda: TVenda): Boolean;
var
  lbContingencia: Boolean;
begin
  result := false;
  lbContingencia := false;
  try
    if Enviar(FSeqNotaFiscal, FEspecie, FSerie, lbContingencia, proVenda) then
    begin
      result := true;
      if (lbContingencia) and (FEspecie = 'NFC') then
      begin
        FServicoDFE.Free;
        GerarNFC(proVenda, lbContingencia, false);
        // <<--A venda ja foi gravada entao nao precisa gravar denovo
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(E.message);
  end;
end;

function TControllerDocumentoFiscalEletronico.Enviar(prsSeqNotaFiscal,
  prsEspecie, prsSerie: string; var prbContingencia: Boolean;
  proVenda: TVenda = nil): Boolean;
var
  Retorno: TProcNFe;
  lsErros: string;
  lsArquivoXML: string;
  lsURLQrCode: string;
  lbEnviou:boolean;
begin
  result := false;
  try
    if prsEspecie = 'NFC' then
    begin
       lbEnviou:= (FServicoDFE as TServicoDocumentoFiscalNFC).Enviar(GetSeqLoteNFe(prsSeqNotaFiscal, prsSerie, prsEspecie));
       Retorno := FServicoDFE.GetRetorno;
       lsURLQrCode := FServicoDFE.GetURLConsultaNFCe(FPastaXML + '\' + Retorno.chNFe + '-nfe.xml');
    end
    else
    if prsEspecie = 'NFE' then
    begin
       lbEnviou:= (FServicoDFE as TServicoDocumentoFiscalNFE).Enviar(GetSeqLoteNFe(prsSeqNotaFiscal, prsSerie, prsEspecie));
       Retorno := FServicoDFE.GetRetorno;
    end;

    if lbEnviou then
    begin
      result := true;
      if proVenda <> nil then
        AtualizarVenda(Retorno, proVenda, prsSeqNotaFiscal, prsEspecie,
          prsSerie, lsURLQrCode, FServicoDFE.GetRetornoRecibo);
    end;
  Except
    On E: Exception Do
    Begin
      if (Pos('Inativo ou Inoperante', E.message) > 0) or
        (Pos('Requisição não enviada', E.message) > 0) then
      begin
        TFormDialog.ShowInformacao('A NFE entrará em contingência! Motivo: '+ E.Message);
        // Apaga o XML gerado e retornará True para gerar o XML em modo contingencia (9)
        lsArquivoXML := FServicoDFE.GetFileNameXML(FServicoDFE.GetChaveAcesso);
        if FileExists(lsArquivoXML) then
          DeleteFile(Pchar(lsArquivoXML));
        prbContingencia := true;
        result := true;
      end
      else
      begin
        Retorno := FServicoDFE.GetRetorno;
        if (Pos('Rejeicao', E.message) > 0) or (Not(Retorno.cStat in [100, 150]))
        then
        begin
          raise Exception.Create(E.message + '. Status: ' + IntToStr(Retorno.cStat));
          { try
            TFormDialog.ShowErro(E.Message);
            try
            Inutilizar(prsSeqNotaFiscal, prsSeqNotaFiscal, prsEspecie, prsSerie,E.Message, proVenda);
            Except
            on E:exception do
            TFormDialog.ShowErro(E.Message);
            end;
            finally
            //Levantar excessão para desfazer a transação de venda
            raise Exception.Create(E.Message);
            end; }
        end
        else
          raise Exception.Create(E.message);
      end;
    end;
  end;
end;

function TControllerDocumentoFiscalEletronico.ImprimirDanfe(proVenda: TVenda;
  pbSalvarPDF: Boolean = false): Boolean;
Var
  lsChaveNfe: string;
begin
  result := false;
  try
    if proVenda = nil then
    begin
      TFormDialog.ShowErro('Não encontrada nota fiscal');
      Exit;
    end;
    lsChaveNfe := FServicoDFE.GetChaveAcesso;
    // + Modulo11(FServicoDFE.GetChaveAcesso);
    // Aqui será necessário pegar a chave NFE quando se Imprime o danfe
    // pela reimpressão
//    if Length(lsChaveNfe) < 44 then
//      lsChaveNfe := proVenda.ChaveNFE;
//    if FServicoDFE = nil then
//      FServicoDFE := TFactoryServicoDocumentoFiscalEletronico.FactoryServicoNFC
//        (nil, FPastaXML, false);
    {$IFDEF DESKTOP}
    FServicoDFE.Imprimir(lsChaveNfe, proVenda, False);
    {$ENDIF}
    result := true;
  except
    on E: Exception do
    begin
      TFormDialog.ShowErro(Format('Falha ao imprimir o DANFe: %s',
        [E.message]));
    end;
  end;
end;

function TControllerDocumentoFiscalEletronico.Inutilizar(prsSeqnotafiscal1,
  prsSeqnotafiscal2, prsEspecie, prsSerie, Mensagem: string; proVenda: TVenda;
  UpdateStatus: Boolean = true): Boolean;
begin
  Try // Inutilizar a nota fiscal
    if FServicoDFE = nil then
      FServicoDFE := TFactoryServicoDocumentoFiscalEletronico.FactoryServicoNFC
        (nil, FPastaXML, true);

    if FServicoDFE.Inutilizar(FCNPJCPFEmp, ifthen(prsEspecie = 'NFC', '65',
      '55'), prsSerie, inttostr(yearOf(date)), prsSeqnotafiscal1,
      prsSeqnotafiscal2, Mensagem) then
    begin
      result := true;
      if proVenda <> nil then
      begin
        proVenda.ProtocoloNFE := FServicoDFE.GetProtocoloInutilizacao;
        proVenda.DataProtocoloNFE := FServicoDFE.GetDataReciboInutilizacao;
        _ServicoVenda.InutilizarVenda(proVenda);
      end;
    end;
  except
    On E: Exception Do
    Begin
      raise Exception.Create(E.message);
    End;
  End;
end;

function TControllerDocumentoFiscalEletronico.InutilizarSequenciaFaixa
  (prsSeqnotafiscal1, prsSeqnotafiscal2, prsEspecie, prsSerie, Mensagem: string;
  proVenda: TVenda; UpdateStatus: Boolean): Boolean;
var
  licont: Integer;
begin
  try
    ServicoVenda.BeginTrans;
    if Inutilizar(prsSeqnotafiscal1, prsSeqnotafiscal2, prsEspecie, prsSerie,
      'Inutilizacao de Faixa de Nota ' + prsSeqnotafiscal1 + ' a ' +
      prsSeqnotafiscal2, nil, false) then
    begin
      for licont := StrToInt(prsSeqnotafiscal1)
        to StrToInt(prsSeqnotafiscal2) do
      begin
        ServicoVenda.Venda := TVenda.Create;
        with ServicoVenda.Venda do
        begin
          Operador := TUsuarioSingleton.GetInstancia;
          Ativo := false;
          DataVenda := date;
          SequenciaNotaFiscal := FormatFloat('000000000', licont);
          Especie := prsEspecie;
          serie := prsSerie;
          Status := TStatusEnum.tsInutilizada;
          DataHoraEmissao := now;
          ProtocoloNFE := FServicoDFE.GetProtocoloInutilizacao;
          DataProtocoloNFE := FServicoDFE.GetDataReciboInutilizacao;
        end;
        ServicoVenda.SetDadosClienteAvulso('', '', '');
        AdicionarVenda;
      end;
      ServicoVenda.CommitTrans;
      result := true;
    end
    else
    begin
      ServicoVenda.RollBackTrans;
    end;
  except
    on E: Exception do
    begin
      ServicoVenda.RollBackTrans;
      raise Exception.Create(E.message);
    end;
  end;
end;

procedure TControllerDocumentoFiscalEletronico.ReImprimirDanfe
  (prsChaveNFe: string);
var
  loVenda: TVenda;
begin
  loVenda := _ServicoVenda.FindByChaveAcesso_(prsChaveNFe).Items[0];
  _ServicoVenda.Evict(loVenda);
  try
     if(loVenda.Especie = 'NFC')Then
     begin
        FServicoDFE := TFactoryServicoDocumentoFiscalEletronico.FactoryServicoNFC
          (loVenda, FPastaXML, false);
        try
           FServicoDFE.LoadFromXML(loVenda.XmlNota);
           ImprimirDanfe(loVenda, true);
        finally
           FreeAndNil(FServicoDFE);
        end;
     end
     else
     Begin
        FServicoDFE := TFactoryServicoDocumentoFiscalEletronico.FactoryServicoNFE
          (loVenda, FPastaXML, false);
        try
           FServicoDFE.LoadFromFile(FPastaXML + '\' + prsChaveNFe + '-nfe.xml');
           ImprimirDanfeNFESimplificado(loVenda);
        finally
           FreeAndNil(FServicoDFE);
        end;
     End;
  finally
     FreeAndNil( loVenda );
  end;
end;

function TControllerDocumentoFiscalEletronico.EnviarDanfeEmail
  (prsChaveNFe: string): Boolean;
var
  loVenda: TVenda;
begin
  loVenda := _ServicoVenda.FindByChaveAcesso(prsChaveNFe).Items[0];
  FServicoDFE := TFactoryServicoDocumentoFiscalEletronico.FactoryServicoNFC
    (loVenda, FPastaXML, false);
  FServicoDFE.LoadFromFile(FPastaXML + '\' + prsChaveNFe + '-nfe.xml');
  if (FEmailArquivoXML <> '') then
  begin
    result := FServicoDFE.EnviarEmailNF(FEmailArquivoXML);
  end;
end;

function TControllerDocumentoFiscalEletronico.RetornarNotasFiscaisContingencia
  (): Integer;
begin
  // TODO: Criar metodo para retornar a quantidade de notas em contingencia.
  result := 0;
  // pvoDAONfe.RetornarNotasFiscaisContingencia(FCodigoEmpresa).RecordCount;
end;

function TControllerDocumentoFiscalEletronico.EnviarContingencia(proVenda : TVenda): Boolean;
var lcdsNotasFiscaisContingencia : TDataSet;
    lsSequencia, lsEspecieNF , lsSerieNF, lsNFEChaveAcesso: String;
    lsArquivo  : string;
    lbContingencia:boolean;
begin
  Result := False;
  lbContingencia := False;
  try
     GravarLog('-> Instanciando "TFactoryServicoDocumentoFiscalEletronico"...');
     FServicoDFE := TFactoryServicoDocumentoFiscalEletronico.FactoryServicoNFC( proVenda, FPastaXML, false, FLogger );
     GravarLog('<- Criado instância da "TFactoryServicoDocumentoFiscalEletronico"...');
     FDataEmissao     := proVenda.DataVenda;

     FSeqNotaFiscal   := proVenda.SequenciaNotaFiscal;
     FEspecie         := proVenda.Especie;
     FSerie           := proVenda.Serie;
     lsNFEChaveAcesso := proVenda.ChaveNFE;

     lsArquivo        := FServicoDFE.GetFileNameXML(lsNFEChaveAcesso);
     if (not proVenda.XmlNota.IsNull) and (proVenda.XmlNota.AsString <> EmptyStr) then
        FServicoDFE.LoadFromXml(proVenda.XmlNota)
     else if FileExists( lsArquivo ) then
        FServicoDFE.LoadFromFile(lsArquivo)
     else
        Raise Exception.Create('Arquivo de Contingência não existe: '+ lsArquivo);
     result := Enviar( proVenda );
  except
    On E: Exception Do
    Begin
      GravarLog(E.Message);
      raise Exception.Create( E.Message );
    End;
  end;
end;

procedure TControllerDocumentoFiscalEletronico.Cancelar(prsSeqNotaFiscal,
  prsEspecie, prsSerie, prsChaveAcesso, prsProtocolo: String;
  prsDataProtocolo: TDatetime; proVenda: TVenda);
var
  lsLoteNFe, Justificativa: string;
begin

  if prsEspecie = 'NFE' then
  begin
     FServicoDFE := TFactoryServicoDocumentoFiscalEletronico.FactoryServicoNFE(nil,FPastaXML, true);
     Justificativa := 'Cancelamento de Nota Fiscal Eletronica';
  end
  else
  begin
     FServicoDFE := TFactoryServicoDocumentoFiscalEletronico.FactoryServicoNFC(nil,FPastaXML, true);
     Justificativa := 'Cancelamento de Nota Fiscal Eletronica ao consumidor';
  end;

  // TODO: Criar função para retornar sequencia do lote
  lsLoteNFe := GetSeqLoteNFe(prsSeqNotaFiscal, prsSerie, prsEspecie);

  try
    if FServicoDFE.Cancelar( lsLoteNFe, //prsSeqNotaFiscal, prsEspecie, prsSerie,
      prsChaveAcesso, Justificativa, prsProtocolo//, proVenda.Id.ToString
      ) then
    begin
      _ServicoVenda.CancelarVenda(proVenda);
    end;
  except
    On E: Exception Do
    Begin
      raise Exception.Create(E.message);
    End;
  end;
end;

procedure TControllerDocumentoFiscalEletronico.GerarNFE(proVenda: TVenda;
  var prbContingencia: Boolean; prbVendaAdd: Boolean = true);
var
  lsErros: string;
  lsPathXmlGerado: string;
  Retorno: TProcNFe;
begin
   try
      FServicoDFE := TFactoryServicoDocumentoFiscalEletronico.FactoryServicoNFE( proVenda, FPastaXML, true );

      TFormDialog.GravarLogErro('Salvando VENDA NFE');
      if prbVendaAdd then
        AdicionarVenda(proVenda);
      TFormDialog.GravarLogErro('Salvo VENDA NFE');

      if (not VerificaConexaoInternet) then
         raise Exception.Create('Há um problema com a conexão de internet. Não foi possivel gerar a NFE ')
      else
         FDataHoraContingencia := 0;

      (FServicoDFE as TServicoDocumentoFiscalNFE).Gerar(lsErros);
      if lsErros <> '' then
          raise Exception.Create('Problema(s) na Geração: ' + lsErros);

       try
          FSeqNotaFiscal := proVenda.SequenciaNotaFiscal;
          FEspecie :=  proVenda.Especie;
          FSerie := proVenda.Serie;
          FEmailArquivoXML := proVenda.Cliente.Pessoa.Email;
          if (FServicoDFE as TServicoDocumentoFiscalNFE).Enviar(GetSeqLoteNFe(proVenda.SequenciaNotaFiscal, proVenda.Serie, proVenda.Especie)) then
          begin
            Retorno := FServicoDFE.GetRetorno;

            AtualizarVenda(Retorno, proVenda, proVenda.SequenciaNotaFiscal, proVenda.Especie,
                            proVenda.Serie, '', FServicoDFE.GetRetornoRecibo);

            lsPathXmlGerado := FPastaXML + '\' + FServicoDFE.GetChaveAcesso + '-nfe.xml';

            lsPathXmlGerado := FServicoDFE.GetFileNameXML(stringReplace(FServicoDFE.DocumentoFiscal.infNFE.ID,
            'NFe', '', []));

            proVenda.SetXmlNota(lsPathXmlGerado);
            _ServicoVenda.Update(proVenda);

            if FServicoDFE.DocumentoFiscal.InfAdic <> Nil then
              proVenda.InfoComplementarNota := FServicoDFE.DocumentoFiscal.InfAdic.infCpl;

            ImprimirDanfeNFESimplificado(proVenda);

            if (FEmailArquivoXML <> '') then
            begin
              FServicoDFE.EnviarEmailNF(FEmailArquivoXML);
            end;
          end;
       except
          on E: Exception do
          begin
            raise Exception.Create(E.message);
          end;
       end;
   finally
      FServicoDFE.free;
   end;
end;

procedure TControllerDocumentoFiscalEletronico.GerarSATMFE(proVenda: TVenda; var prbContingencia: Boolean; prbVendaAdd: Boolean);
var
  lsPathXmlGerado: string;
  Retorno: TProcNFe;
  AbastecimentoController: TAbastecimentoController;
  loServicoParametro : TServicoParametro;
begin
   try
       try
          TFormDialog.GravarLogErro('Salvando VENDA SAT');
          proVenda.Especie := 'SAT';
          if prbVendaAdd then
             AdicionarVenda(proVenda);
          TFormDialog.GravarLogErro('Salvo VENDA SAT');

          FServicoSATMFE := TFactoryServicoDocumentoFiscalEletronico.FactoryServicoSATMFE( proVenda, FPastaXML, true );
          if FServicoSATMFE.Enviar(proVenda) then
          begin

             proVenda.SequenciaNotaFiscal := IntToStr( FServicoSATMFE.DocumentoSATMFE.CFe.ide.nCFe );
             proVenda.Serie := '001';
             proVenda.DataHoraEmissao := now;
             proVenda.ChaveNFE := FServicoSATMFE.DocumentoSATMFE.CFe.infCFe.ID;
             proVenda.Status := TStatusEnum.tsEnviada;
             proVenda.Sincronizado := False;
             proVenda.DataProtocoloNFE := now;
             proVenda.ProtocoloNFE := IntToStr( FServicoSATMFE.DocumentoSATMFE.CFe.ide.cNF );
             proVenda.ReciboNFE := IntToStr( FServicoSATMFE.DocumentoSATMFE.numeroSessao );

             lsPathXmlGerado := FServicoSATMFE.DocumentoSATMFE.ConfigArquivos.PastaCFeVenda +'\AD' + proVenda.ChaveNFE + '.xml';

             proVenda.SetXmlNota(lsPathXmlGerado);

              _ServicoVenda.AtualizarVendaSATMFE(proVenda);
          end
          else
          Begin
             _ServicoVenda.CancelarVenda(proVenda);
             loServicoParametro := TServicoParametro.Create;
             AbastecimentoController:= TAbastecimentoController.Create(loServicoParametro.ConcentradoraAtiva);
             AbastecimentoController.EstornarAbastecimentos(GUIDToString( proVenda.Id ));
          End;

       except
          on E: Exception do
          begin
            _ServicoVenda.CancelarVenda(proVenda);

            loServicoParametro := TServicoParametro.Create;
            AbastecimentoController:= TAbastecimentoController.Create(loServicoParametro.ConcentradoraAtiva);
            AbastecimentoController.EstornarAbastecimentos(GUIDToString( proVenda.Id ));

            FServicoSATMFE.free;
            raise Exception.Create(E.message);
          end;
       end;
   finally
      FServicoSATMFE.free;

   end;

end;

procedure TControllerDocumentoFiscalEletronico.CancelarSATMFE(prsChaveAcesso: String; proVenda: TVenda);
begin
  FServicoSATMFE := TFactoryServicoDocumentoFiscalEletronico.FactoryServicoSATMFE( proVenda, FPastaXML, true );

  try
    if FServicoSATMFE.Cancelar(prsChaveAcesso) then
    begin
      _ServicoVenda.CancelarVendaSATMFE(proVenda);
    end;
  except
    On E: Exception Do
    Begin
      raise Exception.Create(E.message);
    End;
  end;
end;

class function TControllerDocumentoFiscalEletronico.GetSeqLoteNFe
  (prsSequenciaNotaFiscal, prsSerieNotaFiscal, prsEspecie: string): string;
begin
  try
    Result  :=  IIF(prsEspecie = 'NFC', '65', '55') + prsSerieNotaFiscal +  prsSequenciaNotaFiscal;
  finally

  end;
end;

procedure TControllerDocumentoFiscalEletronico.GravarLog(prsTexto: String);
begin
   if Assigned(FLogger) then
      FLogger.RegistrarLog(prsTexto);
end;

/// /////////////////////////////////////////////////////////////////////////////
procedure TDocumentoFiscalEletronicoHelper.PreencherChaveAcesso(proVenda: TVenda );
var
  lsChave: AnsiString;
  loDocumentoFiscal: TNFE;
begin
  if proVenda <> nil then
  begin
    if (proVenda.Especie = 'NFC') and (FServicoDFE <> nil) then
      loDocumentoFiscal:= FServicoDFE.DocumentoFiscal
    else
    if (proVenda.Especie = 'NFE') and (FServicoDFE <> nil) then
       loDocumentoFiscal:= FServicoDFE.DocumentoFiscal;

    if loDocumentoFiscal <> nil then
    begin
      with loDocumentoFiscal do
      begin
        if (GerarChave(lsChave, ide.cUF, ide.cNF, ide.modelo, ide.serie, ide.nNF,
          StrToInt(TpEmisToStr(ide.tpEmis)), ide.dEmi, emit.CNPJCPF)) and
          (proVenda <> nil) then
          proVenda.ChaveNFE := StringReplace(lsChave, 'NFe', '', []);
      end;
    end;
  end;
end;

procedure TDocumentoFiscalEletronicoHelper.AdicionarVenda
  (proVenda: TVenda = nil);
begin
  if proVenda.Especie <> 'SAT' then
       PreencherChaveAcesso( proVenda );

  _ServicoVenda.Add;
end;

Function TDocumentoFiscalEletronicoHelper.Modulo11(Valor: String;
  Base: Integer = 9; Resto: Boolean = false): string;
{
  Rotina muito usada para calcular dígitos verificadores
  Pega-se cada um dos dígitos contidos no parâmetro VALOR, da direita para a
  esquerda e multiplica-se pela seqüência de pesos 2, 3, 4 ... até BASE.
  Por exemplo: se a base for 9, os pesos serão 2,3,4,5,6,7,8,9,2,3,4,5...
  Se a base for 7, os pesos serão 2,3,4,5,6,7,2,3,4...
  Soma-se cada um dos subprodutos.
  Divide-se a soma por 11.
  Faz-se a operação 11-Resto da divisão e devolve-se o resultado dessa operação
  como resultado da função Modulo11.
  Obs.: Caso o resultado seja maior que 9, deverá ser substituído por 0 (ZERO).
}
var
  Soma: Integer;
  Contador, Peso, Digito: Integer;
begin
  Soma := 0;
  Peso := 2;
  for Contador := Length(Valor) downto 1 do
  begin
    Soma := Soma + (StrToIntDef(Valor[Contador], 0) * Peso);
    if Peso < Base then
      Peso := Peso + 1
    else
      Peso := 2;
  end;

  if Resto then
    result := inttostr(Soma mod 11)
  else
  begin
    Digito := 11 - (Soma mod 11);
    if (Digito > 9) then
      Digito := 0;
    result := inttostr(Digito);
  end
end;

procedure TDocumentoFiscalEletronicoHelper.AtualizarVenda(Retorno: TProcNFe;
  proVenda: TVenda; prsSeqNotaFiscal, prsEspecie, prsSerie, lsURLQrCode,
  prsRecibo: string);
begin
  proVenda := _ServicoVenda.GetById<TVenda>(proVenda.Id);
  proVenda.SequenciaNotaFiscal := prsSeqNotaFiscal;
  proVenda.Especie := prsEspecie;
  proVenda.serie := prsSerie;
  proVenda.DataHoraEmissao := now;
  proVenda.ProtocoloNFE := Retorno.nProt;
  proVenda.DataProtocoloNFE := Retorno.dhRecbto;
  proVenda.ChaveNFE := Retorno.chNFe;
  proVenda.UrlConsultaQRCode := lsURLQrCode;
  proVenda.DigValNFE := Retorno.digVal;
  proVenda.ReciboNFE := prsRecibo;
  proVenda.Status := TStatusEnum.tsEnviada;
  proVenda.Sincronizado := False;
  _ServicoVenda.Update(proVenda);
end;



procedure TDocumentoFiscalEletronicoHelper.AlterarNFE_Status(penumStatus: TStatusEnum; proVenda: TVenda;
  prsURLQRCode, prsChaveAcesso: string);
begin
  proVenda.Status := penumStatus;
  proVenda.ChaveNFE := prsChaveAcesso;
  proVenda.UrlConsultaQRCode := prsURLQRCode;
  _ServicoVenda.Update(proVenda);
end;

function TDocumentoFiscalEletronicoHelper.VerificaConexaoInternet: Boolean;
var
  flags: DWORD;
begin
  result := InternetGetConnectedState(@flags, 0);
end;

function TDocumentoFiscalEletronicoHelper.GetStatusCertificado
  (var prsdata: string): TTipoCertificado;
var
  tipoCertificado: TTipoCertificado;
  DataVctoCertificado: TDatetime;
begin
  prsdata := FServicoDFE.VerificarDataVencimentoCertificado('');
  result := tceNone;
  try
    DataVctoCertificado := StrToDateTime(prsdata);
  except
    result := tceErro;
  end;

  if result <> tceErro then
  begin
    if (DataVctoCertificado > date + 60) then // cert. valido
      result := tceOK
    else if (DataVctoCertificado < date) then
      // cert. vencido
      result := tceVencido
    else if (DataVctoCertificado <= date + 60) then
      // cert. prox. de se vencer (30dias) 14/10 -
      result := tceAtencao;
  end;

end;

function TControllerDocumentoFiscalEletronico.ImprimirDanfeNFESimplificado(proVenda: TVenda): Boolean;
Var
  lsChaveNfe: string;
begin
  result := false;
  try
    if proVenda = nil then
    begin
      TFormDialog.ShowErro('Nota fiscal NFE não encontrada');
      Exit;
    end;
    lsChaveNfe := FServicoDFE.GetChaveAcesso;
    if Length(lsChaveNfe) < 44 then
      lsChaveNfe := proVenda.ChaveNFE;
    if FServicoDFE = nil then
      FServicoDFE := TFactoryServicoDocumentoFiscalEletronico.FactoryServicoNFE(nil, FPastaXML, false);
    {$IFDEF DESKTOP}
     FServicoDFE.ImprimirPDFDanfeNFE(lsChaveNfe, proVenda, False);
     FServicoDFE.ImprimirDanfeSimplificado(lsChaveNfe, proVenda, False);
    {$ENDIF}
    result := true;
  except
    on E: Exception do
    begin
      TFormDialog.ShowErro(Format('Falha ao imprimir o DANFe: %s',
        [E.message]));
    end;
  end;
end;
end.
