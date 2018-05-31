{$I ACBr.inc}

unit EmissorNFSe;

interface

uses IniFiles, ShellAPI,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, OleCtrls, SHDocVw, StdCtrls, Buttons, ExtCtrls,
  pcnConversao, pnfsConversao,  DB,
  ACBrNFSe, ACBrNFSeDANFSeClass, ACBrNFSeDANFSeQRClass, pnfsNFSe;

type
  TFormEmissorNFSe = class(TForm)
    Panel1: TPanel;
    lblColaborador: TLabel;
    lblPatrocinador: TLabel;
    lblDoar1: TLabel;
    lblDoar2: TLabel;
    gbConfiguracoes: TGroupBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    gbCertificado: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    sbtnCaminhoCert: TSpeedButton;
    Label25: TLabel;
    sbtnGetCert: TSpeedButton;
    edtCaminho: TEdit;
    edtSenha: TEdit;
    edtNumSerie: TEdit;
    TabSheet2: TTabSheet;
    gbGeral: TGroupBox;
    Label7: TLabel;
    sbtnLogoMarca: TSpeedButton;
    sbtnPathSalvar: TSpeedButton;
    edtLogoMarca: TEdit;
    edtPathLogs: TEdit;
    ckSalvar: TCheckBox;
    TabSheet3: TTabSheet;
    gbWebService: TGroupBox;
    ckVisualizar: TCheckBox;
    rgTipoAmb: TRadioGroup;
    gbProxy: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtProxyHost: TEdit;
    edtProxyPorta: TEdit;
    edtProxyUser: TEdit;
    edtProxySenha: TEdit;
    TabSheet4: TTabSheet;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    edtEmitCNPJ: TEdit;
    edtEmitIM: TEdit;
    edtEmitRazao: TEdit;
    edtEmitFantasia: TEdit;
    edtEmitFone: TEdit;
    edtEmitCEP: TEdit;
    edtEmitLogradouro: TEdit;
    edtEmitNumero: TEdit;
    edtEmitComp: TEdit;
    edtEmitBairro: TEdit;
    edtEmitCidade: TEdit;
    edtEmitUF: TEdit;
    TabSheet7: TTabSheet;
    gbEmail: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    edtSmtpHost: TEdit;
    edtSmtpPort: TEdit;
    edtSmtpUser: TEdit;
    edtSmtpPass: TEdit;
    edtEmailAssunto: TEdit;
    cbEmailSSL: TCheckBox;
    mmEmailMsg: TMemo;
    btnSalvarConfig: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    btnImprimir: TButton;
    btnConsultarLote: TButton;
    btnCancNFSe: TButton;
    btnGerarEnviarLote: TButton;
    btnGerarRPS: TButton;
    btnConsultarSitLote: TButton;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    MemoResp: TMemo;
    TabSheet6: TTabSheet;
    WBResposta: TWebBrowser;
    TabSheet8: TTabSheet;
    memoLog: TMemo;
    TabSheet9: TTabSheet;
    trvwNFSe: TTreeView;
    TabSheet10: TTabSheet;
    memoRespWS: TMemo;
    Dados: TTabSheet;
    MemoDados: TMemo;
    OpenDialog1: TOpenDialog;
    lblSchemas: TLabel;
    edtSchemas: TEdit;
    sbtSchemas: TSpeedButton;
    Label32: TLabel;
    edtPrestLogo: TEdit;
    sbtnPrestLogo: TSpeedButton;
    Label33: TLabel;
    edtPrefeitura: TEdit;
    btnConsultarNFSeRPS: TButton;
    btnConsultarNFSePeriodo: TButton;
    cbCidades: TComboBox;
    Label6: TLabel;
    edtSenhaWeb: TEdit;
    edtCodCidade: TEdit;
    Label29: TLabel;
    ACBrNFSe1: TACBrNFSe;
    ACBrNFSeDANFSeQR1: TACBrNFSeDANFSeQR;
    Label20: TLabel;
    edtUserWeb: TEdit;
    btnGerarEnviarNFSe: TButton;
    btnEnviaremail: TButton;
    Label31: TLabel;
    edtEmailRemetente: TEdit;
    Label30: TLabel;
    btnLinkNFSe: TButton;
    btnGerarLoteRPS: TButton;
    btnGerarEnviarSincrono: TButton;
    Button1: TButton;
    procedure sbtnCaminhoCertClick(Sender: TObject);
    procedure sbtnGetCertClick(Sender: TObject);
    procedure sbtnLogoMarcaClick(Sender: TObject);
    procedure sbtnPathSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarConfigClick(Sender: TObject);
    procedure lblColaboradorClick(Sender: TObject);
    procedure lblPatrocinadorClick(Sender: TObject);
    procedure lblDoar1Click(Sender: TObject);
    procedure btnGerarEnviarLoteClick(Sender: TObject);
    procedure btnConsultarLoteClick(Sender: TObject);
    procedure btnCancNFSeClick(Sender: TObject);
    procedure btnConsultarSitLoteClick(Sender: TObject);
    procedure btnGerarRPSClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure ACBrNFSe1StatusChange(Sender: TObject);
    procedure ACBrNFSe1GerarLog(const Mensagem: String);
    procedure sbtSchemasClick(Sender: TObject);
    procedure sbtnPrestLogoClick(Sender: TObject);
    procedure btnConsultarNFSeRPSClick(Sender: TObject);
    procedure btnConsultarNFSePeriodoClick(Sender: TObject);
    procedure cbCidadesChange(Sender: TObject);
    function RoundTo5(Valor: Double; Casas: Integer): Double;
    procedure btnGerarEnviarNFSeClick(Sender: TObject);
    procedure btnEnviaremailClick(Sender: TObject);
    procedure btnLinkNFSeClick(Sender: TObject);
    procedure btnGerarLoteRPSClick(Sender: TObject);
    procedure btnGerarEnviarSincronoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    {
    procedure lblMouseEnter(Sender: TObject);
    procedure lblMouseLeave(Sender: TObject);
    }
  private
    { Private declarations }
    Ok : Boolean;
    FDataSetVenda: TDataSet;
    FDataSetCobranca: TDataSet;
    FDataSetProdutos: TDataSet;
    procedure GravarConfiguracao;
    procedure LerConfiguracao;
    procedure ConfiguraComponente;
    procedure LoadXML(MyMemo: TMemo; MyWebBrowser: TWebBrowser);
    procedure GerarNFSe(NumNFSe : String);
    procedure SetDataSetCobranca(const Value: TDataSet);
    procedure SetDataSetProdutos(const Value: TDataSet);
    procedure SetDataSetVenda(const Value: TDataSet);
  public
    { Public declarations }
    property DataSetVenda:TDataSet read FDataSetVenda write SetDataSetVenda;
    property DataSetProdutos: TDataSet read FDataSetProdutos write SetDataSetProdutos;
    property DataSetCobranca: TDataSet read FDataSetCobranca write SetDataSetCobranca;
  end;

var
  FormEmissorNFSe: TFormEmissorNFSe;

implementation

uses
 FileCtrl, DateUtils, Math,
 ufrmStatus,
 ACBrNFSeNotasFiscais, ACBrDFeUtil, ACBrNFSeUtil, Pessoa, ControllerClientes,
  Mapper, UtilsString;

const
  SELDIRHELP = 1000;

{$R *.dfm}

(*
procedure TForm1.lblMouseEnter(Sender: TObject);
begin
 TLabel(Sender).Font.Style := [fsBold,fsUnderline];
end;

procedure TForm1.lblMouseLeave(Sender: TObject);
begin
 TLabel(Sender).Font.Style := [fsBold];
end;
*)

procedure TFormEmissorNFSe.GravarConfiguracao;
var
 IniFile    : String;
 Ini        : TIniFile;
 StreamMemo : TMemoryStream;
begin
 IniFile := ChangeFileExt( Application.ExeName, '.ini');

 Ini := TIniFile.Create( IniFile );
 try
  Ini.WriteString( 'Emitente', 'CNPJ'       , edtEmitCNPJ.Text);
  Ini.WriteString( 'Emitente', 'IM'         , edtEmitIM.Text);
  Ini.WriteString( 'Emitente', 'RazaoSocial', edtEmitRazao.Text);
  Ini.WriteString( 'Emitente', 'Fantasia'   , edtEmitFantasia.Text);
  Ini.WriteString( 'Emitente', 'Fone'       , edtEmitFone.Text);
  Ini.WriteString( 'Emitente', 'CEP'        , edtEmitCEP.Text);
  Ini.WriteString( 'Emitente', 'Logradouro' , edtEmitLogradouro.Text);
  Ini.WriteString( 'Emitente', 'Numero'     , edtEmitNumero.Text);
  Ini.WriteString( 'Emitente', 'Complemento', edtEmitComp.Text);
  Ini.WriteString( 'Emitente', 'Bairro'     , edtEmitBairro.Text);
  Ini.WriteString( 'Emitente', 'CodCidade'  , edtCodCidade.Text);
  Ini.WriteString( 'Emitente', 'Cidade'     , edtEmitCidade.Text);
  Ini.WriteString( 'Emitente', 'UF'         , edtEmitUF.Text);

  Ini.WriteString( 'Certificado', 'Caminho'    , edtCaminho.Text);
  Ini.WriteString( 'Certificado', 'Senha'      , edtSenha.Text);
  Ini.WriteString( 'Certificado', 'NumSerie'   , edtNumSerie.Text);

  Ini.WriteString( 'Geral', 'Schemas'   , edtSchemas.Text);
  Ini.WriteString( 'Geral', 'LogoMarca' , edtLogoMarca.Text);
  Ini.WriteString( 'Geral', 'PrestLogo' , edtPrestLogo.Text);
  Ini.WriteBool(   'Geral', 'Salvar'    , ckSalvar.Checked);
  Ini.WriteString( 'Geral', 'PathSalvar', edtPathLogs.Text);
  Ini.WriteString( 'Geral', 'Prefeitura', edtPrefeitura.Text);

  Ini.WriteInteger( 'WebService', 'Ambiente'  , rgTipoAmb.ItemIndex);
  Ini.WriteBool(    'WebService', 'Visualizar', ckVisualizar.Checked);
  Ini.WriteString(  'WebService', 'SenhaWeb'  , edtSenhaWeb.Text);
  Ini.WriteString(  'WebService', 'UserWeb'   , edtUserWeb.Text);

  Ini.WriteString( 'Proxy', 'Host' , edtProxyHost.Text);
  Ini.WriteString( 'Proxy', 'Porta', edtProxyPorta.Text);
  Ini.WriteString( 'Proxy', 'User' , edtProxyUser.Text);
  Ini.WriteString( 'Proxy', 'Pass' , edtProxySenha.Text);

  Ini.WriteString( 'Email', 'Host'     , edtSmtpHost.Text);
  Ini.WriteString( 'Email', 'Port'     , edtSmtpPort.Text);
  Ini.WriteString( 'Email', 'User'     , edtSmtpUser.Text);
  Ini.WriteString( 'Email', 'Pass'     , edtSmtpPass.Text);
  Ini.WriteString( 'Email', 'Assunto'  , edtEmailAssunto.Text);
  Ini.WriteBool(   'Email', 'SSL'      , cbEmailSSL.Checked );
  Ini.WriteString( 'Email', 'Remetente', edtEmailRemetente.Text);

  StreamMemo := TMemoryStream.Create;
  mmEmailMsg.Lines.SaveToStream(StreamMemo);
  StreamMemo.Seek(0, soFromBeginning);
  Ini.WriteBinaryStream( 'Email', 'Mensagem', StreamMemo);

  StreamMemo.Free;
 finally
  Ini.Free;
 end;
end;

procedure TFormEmissorNFSe.LerConfiguracao;
var
 IniFile    : String;
 Ini        : TIniFile;
 StreamMemo : TMemoryStream;
begin
 IniFile := ChangeFileExt( Application.ExeName, '.ini');

 Ini := TIniFile.Create( IniFile );
 try
  {$IFDEF ACBrNFSeOpenSSL}
   edtCaminho.Text  := Ini.ReadString( 'Certificado', 'Caminho' , '');
   edtSenha.Text    := Ini.ReadString( 'Certificado', 'Senha'   , '');
   edtNumSerie.Visible := False;
   Label25.Visible     := False;
   sbtnGetCert.Visible := False;
  {$ELSE}
   edtNumSerie.Text := Ini.ReadString( 'Certificado', 'NumSerie', '');
   Label1.Caption := 'Informe o n�mero de s�rie do certificado'#13+
                     'Dispon�vel no Internet Explorer no menu'#13+
                     'Ferramentas - Op��es da Internet - Conte�do '#13+
                     'Certificados - Exibir - Detalhes - '#13+
                     'N�mero do certificado';
   Label2.Visible     := False;
   edtCaminho.Visible := False;
   edtSenha.Visible   := False;
   sbtnCaminhoCert.Visible := False;
  {$ENDIF}

  edtEmitCNPJ.Text       := Ini.ReadString( 'Emitente', 'CNPJ'       , '');
  edtEmitIM.Text         := Ini.ReadString( 'Emitente', 'IM'         , '');
  edtEmitRazao.Text      := Ini.ReadString( 'Emitente', 'RazaoSocial', '');
  edtEmitFantasia.Text   := Ini.ReadString( 'Emitente', 'Fantasia'   , '');
  edtEmitFone.Text       := Ini.ReadString( 'Emitente', 'Fone'       , '');
  edtEmitCEP.Text        := Ini.ReadString( 'Emitente', 'CEP'        , '');
  edtEmitLogradouro.Text := Ini.ReadString( 'Emitente', 'Logradouro' , '');
  edtEmitNumero.Text     := Ini.ReadString( 'Emitente', 'Numero'     , '');
  edtEmitComp.Text       := Ini.ReadString( 'Emitente', 'Complemento', '');
  edtEmitBairro.Text     := Ini.ReadString( 'Emitente', 'Bairro'     , '');
  edtEmitCidade.Text     := Ini.ReadString( 'Emitente', 'Cidade'     , '');
  edtEmitUF.Text         := Ini.ReadString( 'Emitente', 'UF'         , '');
  edtCodCidade.Text      := Ini.ReadString( 'Emitente', 'CodCidade'  , '');
  cbCidades.ItemIndex    := cbCidades.Items.IndexOf(edtEmitCidade.Text + '/' +
                                                    edtCodCidade.Text + '/' +
                                                    edtEmitUF.Text);

  edtSchemas.Text       := Ini.ReadString( 'Geral', 'Schemas'   , '');
  edtLogoMarca.Text     := Ini.ReadString( 'Geral', 'LogoMarca' , '');
  edtPrestLogo.Text     := Ini.ReadString( 'Geral', 'PrestLogo' , '');
  ckSalvar.Checked      := Ini.ReadBool(   'Geral', 'Salvar'    , True);
  edtPathLogs.Text      := Ini.ReadString( 'Geral', 'PathSalvar', '');
  edtPrefeitura.Text    := Ini.ReadString( 'Geral', 'Prefeitura', '');

  rgTipoAmb.ItemIndex  := Ini.ReadInteger( 'WebService', 'Ambiente'  , 0);
  ckVisualizar.Checked := Ini.ReadBool(    'WebService', 'Visualizar', False);
  edtSenhaWeb.Text     := Ini.ReadString(  'WebService', 'SenhaWeb'  , '');
  edtUserWeb.Text      := Ini.ReadString(  'WebService', 'UserWeb'  , '');

  edtProxyHost.Text  := Ini.ReadString( 'Proxy', 'Host' , '');
  edtProxyPorta.Text := Ini.ReadString( 'Proxy', 'Porta', '');
  edtProxyUser.Text  := Ini.ReadString( 'Proxy', 'User' , '');
  edtProxySenha.Text := Ini.ReadString( 'Proxy', 'Pass' , '');

  edtSmtpHost.Text       := Ini.ReadString( 'Email', 'Host'   , '');
  edtSmtpPort.Text       := Ini.ReadString( 'Email', 'Port'   , '');
  edtSmtpUser.Text       := Ini.ReadString( 'Email', 'User'   , '');
  edtSmtpPass.Text       := Ini.ReadString( 'Email', 'Pass'   , '');
  edtEmailAssunto.Text   := Ini.ReadString( 'Email', 'Assunto', '');
  cbEmailSSL.Checked     := Ini.ReadBool(   'Email', 'SSL'    , False);
  edtEmailRemetente.Text := Ini.ReadString( 'Email', 'Remetente', '');

  StreamMemo := TMemoryStream.Create;
  Ini.ReadBinaryStream( 'Email', 'Mensagem', StreamMemo);
  mmEmailMsg.Lines.LoadFromStream(StreamMemo);
  StreamMemo.Free;
 finally
  Ini.Free;
 end;
end;

procedure TFormEmissorNFSe.ConfiguraComponente;
var
 PathMensal: String;
begin
 {$IFDEF ACBrNFSeOpenSSL}
   ACBrNFSe1.Configuracoes.Certificados.Certificado := edtCaminho.Text;
   ACBrNFSe1.Configuracoes.Certificados.Senha       := edtSenha.Text;
 {$ELSE}
   ACBrNFSe1.Configuracoes.Certificados.NumeroSerie := edtNumSerie.Text;
 {$ENDIF}

 ACBrNFSe1.Configuracoes.Arquivos.AdicionarLiteral:=True;
 ACBrNFSe1.Configuracoes.Arquivos.EmissaoPathNFSe:=True;
 ACBrNFSe1.Configuracoes.Arquivos.PastaMensal:=True;
 ACBrNFSe1.Configuracoes.Arquivos.PathCan:=edtPathLogs.Text;
 ACBrNFSe1.Configuracoes.Arquivos.PathNFSe:=edtPathLogs.Text;
 ACBrNFSe1.Configuracoes.Arquivos.Salvar:=True;

 PathMensal:=ACBrNFSe1.Configuracoes.Arquivos.GetPathNFSe(0);

 ACBrNFSe1.Configuracoes.Geral.PathSchemas := edtSchemas.Text;
 ACBrNFSe1.Configuracoes.Geral.Salvar      := ckSalvar.Checked;
 ACBrNFSe1.Configuracoes.Geral.PathSalvar  := edtPathLogs.Text;

 ACBrNFSe1.Configuracoes.WebServices.CodigoMunicipio := StrToIntDef(edtCodCidade.Text, 0);
 ACBrNFSe1.Configuracoes.WebServices.Ambiente        := StrToTpAmb(Ok, IntToStr(rgTipoAmb.ItemIndex+1));
 ACBrNFSe1.Configuracoes.WebServices.Visualizar      := ckVisualizar.Checked;
 ACBrNFSe1.Configuracoes.WebServices.SenhaWeb        := edtSenhaWeb.Text;
 ACBrNFSe1.Configuracoes.WebServices.UserWeb         := edtUserWeb.Text;

 ACBrNFSe1.Configuracoes.WebServices.ProxyHost := edtProxyHost.Text;
 ACBrNFSe1.Configuracoes.WebServices.ProxyPort := edtProxyPorta.Text;
 ACBrNFSe1.Configuracoes.WebServices.ProxyUser := edtProxyUser.Text;
 ACBrNFSe1.Configuracoes.WebServices.ProxyPass := edtProxySenha.Text;

 ACBrNFSe1.Configuracoes.WebServices.SetConfigMunicipio(ACBrNFSe1.Configuracoes.Geral.PathSchemas);

 if ACBrNFSe1.DANFSe <> nil then
  begin
   ACBrNFSe1.DANFSe.Logo       := edtLogoMarca.Text;
   ACBrNFSe1.DANFSe.PrestLogo  := edtPrestLogo.Text;
   ACBrNFSe1.DANFSe.Prefeitura := edtPrefeitura.Text;
  end;

 lblSchemas.Caption := ACBrNFSe1.Configuracoes.WebServices.xProvedor;
end;

procedure TFormEmissorNFSe.LoadXML(MyMemo: TMemo;
  MyWebBrowser: TWebBrowser);
begin
 MyMemo.Lines.SaveToFile(ExtractFileDir(application.ExeName)+'temp.xml');
 MyWebBrowser.Navigate(ExtractFileDir(application.ExeName)+'temp.xml');
end;

procedure TFormEmissorNFSe.GerarNFSe(NumNFSe: String);
var
 ValorISS: Double;
  Cliente: TPessoa;
  ControllerCliente: TControllerClientes;
  MapperCliente: TMapper;
  Total: Double;
begin
 ACBrNFSe1.NotasFiscais.Clear;

 with ACBrNFSe1 do
 begin
   NotasFiscais.NumeroLote:='1';
   NotasFiscais.Transacao := True;
   with NotasFiscais.Add.NFSe do
   begin
     IdentificacaoRps.Numero := FormatFloat('#########0', StrToInt(NumNFSe));
   //Para o provedor ISS.NET em ambiente de Homologa��o mudar a s�rie para '8'
     IdentificacaoRps.Serie := 'UNICA';
   //TnfseTipoRPS = ( trRPS, trNFConjugada, trCupom );
     IdentificacaoRps.Tipo := trRPS;
     DataEmissao := Date;
   //TnfseNaturezaOperacao = ( noTributacaoNoMunicipio, noTributacaoForaMunicipio, noIsencao, noImune, noSuspensaDecisaoJudicial, noSuspensaProcedimentoAdministrativo );
     NaturezaOperacao := noIsencao;
     //NaturezaOperacao := noTributacaoNoMunicipio51;
   //TnfseRegimeEspecialTributacao = ( retNenhum, retMicroempresaMunicipal, retEstimativa, retSociedadeProfissionais, retCooperativa, retMicroempresarioIndividual, retMicroempresarioEmpresaPP );
   //RegimeEspecialTributacao := retNenhum;
     RegimeEspecialTributacao := retMicroempresaMunicipal;
   //TnfseSimNao = ( snSim, snNao );
     OptanteSimplesNacional := snSim;
   //TnfseSimNao = ( snSim, snNao );
     IncentivadorCultural := snNao;
   //TnfseSimNao = ( snSim, snNao );
   //snSim = Ambiente de Produ��o
   //snNao = Ambiente de Homologa��o
     Producao := snNao;
   //TnfseStatusRPS = ( srNormal, srCancelado );
     Status := srNormal;
   //Somente Os provedores Betha, FISSLex e SimplISS permitem incluir no RPS
   //a TAG: OutrasInformacoes os demais essa TAG � gerada e preenchida pelo
   //WebService do provedor.
     OutrasInformacoes := 'Pagamento a Vista';
     (*
     Usando quando o RPS for substituir outro
     RpsSubstituido.Numero := FormatFloat('#########0', i);
     RpsSubstituido.Serie  := 'UNICA';
     // TnfseTipoRPS = ( trRPS, trNFConjugada, trCupom );
     RpsSubstituido.Tipo   := trRPS;
     *)
     Servico.Valores.ValorServicos          := FDataSetVenda.fieldByname('TotalOrcamento').asFloat;
     Servico.Valores.ValorDeducoes          := 0.00;
     Servico.Valores.ValorPis               := 0.00;
     Servico.Valores.ValorCofins            := 0.00;
     Servico.Valores.ValorInss              := 0.00;
     Servico.Valores.ValorIr                := 0.00;
     Servico.Valores.ValorCsll              := 0.00;

     Servico.MunicipioIncidencia            := 2408102;
   //TnfseSituacaoTributaria = ( stRetencao, stNormal, stSubstituicao );
   //stRetencao = snSim
   //stNormal   = snNao
   //Neste exemplo n�o temos ISS Retido ( stNormal = N�o )
   //Logo o valor do ISS Retido � igual a zero.
     Servico.Valores.IssRetido              := stNormal;
     Servico.Valores.ValorIssRetido         := 0.00;
     Servico.Valores.OutrasRetencoes        := 0.00;
     Servico.Valores.DescontoIncondicionado := 0.00;
     Servico.Valores.DescontoCondicionado   := 0.00;

     Servico.Valores.BaseCalculo := Servico.Valores.ValorServicos -
                                    Servico.Valores.ValorDeducoes -
                                    Servico.Valores.DescontoIncondicionado;
   //No caso do provedor Ginfes devemos informar a aliquota j� dividida por 100
   //para outros provedores devemos informar por exemplo 3, mas ao fazer o calculo
   //do valor do ISS devemos dividir por 100
     Servico.Valores.Aliquota    := 0.00;
   //Valor do ISS calculado multiplicando-se a base de calculo pela aliquota
     ValorISS := Servico.Valores.BaseCalculo * Servico.Valores.Aliquota;
   //A fun��o RoundTo5 � usada para arredondar valores, sendo que o segundo
   //parametro se refere ao numero de casas decimais.
   //exemplos: RoundTo5(50.532, -2) ==> 50.53
   //exemplos: RoundTo5(50.535, -2) ==> 50.54
   //exemplos: RoundTo5(50.536, -2) ==> 50.54
     Servico.Valores.ValorIss         := RoundTo5(ValorISS, -2);
     Servico.Valores.ValorLiquidoNfse := Servico.Valores.ValorServicos -
                                         Servico.Valores.ValorPis -
                                         Servico.Valores.ValorCofins -
                                         Servico.Valores.ValorInss -
                                         Servico.Valores.ValorIr -
                                         Servico.Valores.ValorCsll -
                                         Servico.Valores.OutrasRetencoes -
                                         Servico.Valores.ValorIssRetido -
                                         Servico.Valores.DescontoIncondicionado -
                                         Servico.Valores.DescontoCondicionado;

     Servico.ItemListaServico         := FDataSetProdutos.fieldByname('Ordem').asstring;

   //Para o provedor ISS.NET em ambiente de Homologa��o
   //o Codigo CNAE tem que ser '6511102'
     Servico.CodigoCnae                := '4520003'; // Informa��o Opcional
     //Servico.CodigoTributacaoMunicipio := '118879';
     Servico.Discriminacao             := FDataSetProdutos.fieldByname('CodigoNFSe').asstring+' - '+
                                          FDataSetProdutos.fieldByname('DescricaoServicoNFSe').asstring;
   //Para o provedor ISS.NET em ambiente de Homologa��o
   //o Codigo do Municipio tem que ser '999'
     Servico.CodigoMunicipio := edtCodCidade.Text;
   //Informar A Exigibilidade ISS para fintelISS [1/2/3/4/5/6/7]
     Servico.ExigibilidadeISS := exiExigivel;
   //Informar para Saatri
     Servico.CodigoPais := 1058; // Brasil
     Servico.MunicipioIncidencia := StrToIntDef(edtCodCidade.Text, 0);

     // Somente o provedor SimplISS permite infomar mais de 1 servi�o

     Servico.ItemServico.Add;

    { with Servico.ItemServico do
     begin
       Total                  := FDataSetProdutos.fieldByname('Valor').asFloat *
                                 FDataSetProdutos.fieldByname('Quantidade').asInteger;
       Items[0].BaseCalculo   := Total;
       Items[0].Descricao     := FDataSetProdutos.fieldByname('Descricao').AsString;
       Items[0].Quantidade    := FDataSetProdutos.fieldByname('Quantidade').asInteger;
       Items[0].ValorUnitario := FDataSetProdutos.fieldByname('Valor').asFloat;
       Items[0].ValorTotal    := Total;
       Items[0].Tributavel    := snNao;
     end;
     }


     Prestador.Cnpj               := edtEmitCNPJ.Text;
     Prestador.InscricaoMunicipal := edtEmitIM.Text;
     // Para o provedor ISSDigital deve-se informar tamb�m:
     //Prestador.Senha        := 'senha';
     //Prestador.FraseSecreta := 'frase secreta';
     Prestador.cUF  := 24;


     PrestadorServico.RazaoSocial                 := edtEmitRazao.Text;
     PrestadorServico.NomeFantasia                := edtEmitFantasia.text;
     PrestadorServico.IdentificacaoPrestador.Cnpj := edtEmitCNPJ.text;
     PrestadorServico.IdentificacaoPrestador.InscricaoMunicipal := edtEmitIM.text;
     PrestadorServico.Contato.Email               := 'lindemberg.cortez@gmail.com';
     PrestadorServico.Contato.Telefone            := edtEmitFone.text;
     PrestadorServico.Endereco.Endereco           := edtEmitLogradouro.text;
     PrestadorServico.Endereco.UF                 := edtEmitUF.text;
     PrestadorServico.Endereco.Bairro             := edtEmitBairro.text;
     PrestadorServico.Endereco.CEP                := edtEmitCEP.text;
     PrestadorServico.Endereco.Complemento        := edtEmitComp.text;
     PrestadorServico.Endereco.CodigoMunicipio    := edtCodCidade.Text;


     Cliente           := TPessoa.create;
     ControllerCliente := TControllerClientes.create;
     MapperCliente     := TMapper.Create( Cliente,
                          ControllerCliente.GetCliente(
                          DataSetVenda.fieldbyName('CodigoCliente').asstring) );
     with MapperCliente do
     begin
       Associar('Codigo'     , nil);
       Associar('CPFCNPJ'    , nil);
       Associar('CodigoClassificacao', nil);
       Associar('Telefone'   , nil);
       Associar('Email'      , nil);
       Associar('Observacao' , nil);
       Associar('Endereco'   , nil);
       Associar('Bairro'     , nil);
       Associar('Municipio'  , nil);
       Associar('UF'         , nil);
       Associar('CEP'        , nil);
       Associar('Nome'       , nil);
       Associar('Complemento', nil);
       Associar('RazaoSocial', nil);
       Associar('Faturar'    , nil);
     end;

     MapperCliente.SendDataSetToEntidade;

     Tomador.IdentificacaoTomador.CpfCnpj := Cliente.CpfCnpj;
   //Tomador.IdentificacaoTomador.InscricaoMunicipal := Cliente;
     Tomador.RazaoSocial                  := Cliente.Nome;
     Tomador.Endereco.Endereco            := Cliente.Endereco;
   //Tomador.Endereco.Numero              := '100';
     Tomador.Endereco.Complemento         := Cliente.Complemento;
     Tomador.Endereco.Bairro              := Cliente.Bairro;
     Tomador.Endereco.CodigoMunicipio     := edtCodCidade.Text;
     Tomador.Endereco.UF                  := Cliente.UF;
     Tomador.Endereco.CEP                 := UtilsString.SoNumeros(Cliente.CEP);
   //Provedor Equiplano � obrigat�rio o pais e IE
     Tomador.Endereco.xPais               := 'BRASIL';
     Tomador.IdentificacaoTomador.InscricaoEstadual := Cliente.InscricaoEstadual;
     Tomador.Contato.Telefone             := Cliente.Telefone;
     Tomador.Contato.Email                := Cliente.Email;

     (* Usando quando houver um intermediario na presta��o do servi�o
     IntermediarioServico.RazaoSocial        := 'razao';
     IntermediarioServico.CpfCnpj            := '00000000000';
     IntermediarioServico.InscricaoMunicipal := '12547478';
     *)
     (* Usando quando o servi�o for uma obra
     ConstrucaoCivil.CodigoObra := '88888';
     ConstrucaoCivil.Art        := '433';
     *)
    end;

  end;

end;

procedure TFormEmissorNFSe.sbtnCaminhoCertClick(Sender: TObject);
begin
 OpenDialog1.Title := 'Selecione o Certificado';
 OpenDialog1.DefaultExt := '*.pfx';
 OpenDialog1.Filter := 'Arquivos PFX (*.pfx)|*.pfx|Todos os Arquivos (*.*)|*.*';
 OpenDialog1.InitialDir := ExtractFileDir(application.ExeName);

 if OpenDialog1.Execute then
  begin
   edtCaminho.Text := OpenDialog1.FileName;
  end;
end;

procedure TFormEmissorNFSe.sbtnGetCertClick(Sender: TObject);
begin
 {$IFNDEF ACBrNFSeOpenSSL}
  edtNumSerie.Text := ACBrNFSe1.Configuracoes.Certificados.SelecionarCertificado;
 {$ENDIF}
end;

procedure TFormEmissorNFSe.sbtnLogoMarcaClick(Sender: TObject);
begin
 OpenDialog1.Title := 'Selecione o Logo';
 OpenDialog1.DefaultExt := '*.bmp';
 OpenDialog1.Filter := 'Arquivos BMP (*.bmp)|*.bmp|Todos os Arquivos (*.*)|*.*';
 OpenDialog1.InitialDir := ExtractFileDir(application.ExeName);

 if OpenDialog1.Execute then
 begin
  edtLogoMarca.Text := OpenDialog1.FileName;
 end;
end;

procedure TFormEmissorNFSe.sbtnPathSalvarClick(Sender: TObject);
var
 Dir : string;
begin
 if Length(edtPathLogs.Text) <= 0
  then Dir := ExtractFileDir(application.ExeName)
  else Dir := edtPathLogs.Text;

 if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt],SELDIRHELP)
  then edtPathLogs.Text := Dir;
end;

procedure TFormEmissorNFSe.FormCreate(Sender: TObject);
begin
 PageControl1.ActivePageIndex:=0;

 LerConfiguracao;
 ConfiguraComponente;
end;

procedure TFormEmissorNFSe.btnSalvarConfigClick(Sender: TObject);
begin
 GravarConfiguracao;
 LerConfiguracao;
 ConfiguraComponente;
end;

procedure TFormEmissorNFSe.lblColaboradorClick(Sender: TObject);
begin
 ShellExecute(0, Nil, 'http://acbr.sourceforge.net/drupal/?q=node/5', Nil, Nil, SW_NORMAL);
end;

procedure TFormEmissorNFSe.lblPatrocinadorClick(Sender: TObject);
begin
 ShellExecute(0, Nil, 'http://acbr.sourceforge.net/drupal/?q=node/35', Nil, Nil, SW_NORMAL);
end;

procedure TFormEmissorNFSe.lblDoar1Click(Sender: TObject);
begin
 ShellExecute(0, Nil, 'http://acbr.sourceforge.net/drupal/?q=node/14', Nil, Nil, SW_NORMAL);
end;

procedure TFormEmissorNFSe.btnGerarEnviarLoteClick(Sender: TObject);
var
 vAux, vNumLote : String;
begin
 if not(InputQuery('Gerar e Enviar Lote', 'Numero do RPS', vAux))
  then exit;

 if not(InputQuery('Gerar e Enviar Lote', 'Numero do Lote', vNumLote))
  then exit;

 ACBrNFSe1.NotasFiscais.Clear;
 GerarNFSe(vAux);
 ACBrNFSe1.Enviar(vNumLote);

 ACBrNFSe1.NotasFiscais.Clear;
end;

procedure TFormEmissorNFSe.btnConsultarLoteClick(Sender: TObject);
var
 Lote, Protocolo : String;
begin
 if not(InputQuery('Consultar Lote', 'N�mero do Lote', Lote))
  then exit;
 if not(InputQuery('Consultar Lote', 'N�mero do Protocolo', Protocolo))
  then exit;

 ACBrNFSe1.ConsultarLoteRps(Lote, Protocolo);

 MemoResp.Lines.Text   := UTF8Encode(ACBrNFSe1.WebServices.ConsLote.RetWS);
 memoRespWS.Lines.Text := UTF8Encode(ACBrNFSe1.WebServices.ConsLote.RetWS);
 LoadXML(MemoResp, WBResposta);
end;

procedure TFormEmissorNFSe.btnCancNFSeClick(Sender: TObject);
var
 Codigo, Motivo : String; 
begin

 OpenDialog1.Title := 'Selecione a NFSe';
 OpenDialog1.DefaultExt := '*-NFSe.xml';
 OpenDialog1.Filter := 'Arquivos NFSe (*-NFSe.xml)|*-NFSe.xml|Arquivos XML (*.xml)|*.xml|Todos os Arquivos (*.*)|*.*';
 OpenDialog1.InitialDir := ACBrNFSe1.Configuracoes.Geral.PathSalvar;

 if OpenDialog1.Execute then
  begin
   ACBrNFSe1.NotasFiscais.Clear;
   ACBrNFSe1.NotasFiscais.LoadFromFile(OpenDialog1.FileName);

   // Codigo de Cancelamento
   // 1 - Erro de emiss�o
   // 2 - Servi�o n�o concluido
   // 3 - RPS Cancelado na Emiss�o

   if not(InputQuery('Cancelar NFSe', 'C�digo de Cancelamento', Codigo))
    then exit;
	
   //Provedor Equiplano � obrigat�rio o motivo de cancelamento
   //if not(InputQuery('Cancelar NFSe', 'Motivo de Cancelamento', Motivo))
   // then exit;
   //ACBrNFSe1.NotasFiscais.Items[0].NFSe.MotivoCancelamento:= Motivo;

//   ACBrNFSe1.WebServices.CancelaNFSe(Codigo, '1', '03310700000170', '0306223', '0');
   ACBrNFSe1.CancelarNFSe(Codigo);

   MemoDados.Lines.Add('Arquivo Carregado de: '+ACBrNFSe1.NotasFiscais.Items[0].NomeArq);
   MemoResp.Lines.LoadFromFile(ACBrNFSe1.NotasFiscais.Items[0].NomeArq);
   MemoDados.Lines.Add('Retorno do Cancelamento:');
   MemoDados.Lines.Add('C�d. Cancelamento: ' + ACBrNFSe1.WebServices.CancNfse.CodigoCancelamento);
   MemoDados.Lines.Add('Data / Hora      : ' +
    DFeUtil.SeSenao(ACBrNFSe1.WebServices.CancNfse.DataHora = 0, '',
                      DateTimeToStr(ACBrNFSe1.WebServices.CancNfse.DataHora)));
   LoadXML(MemoResp, WBResposta);
   PageControl2.ActivePageIndex := 1;
  end;

end;

procedure TFormEmissorNFSe.btnConsultarSitLoteClick(Sender: TObject);
var
 Protocolo : String;
begin
 if not(InputQuery('Consultar Situa��o do Lote', 'N�mero do Protocolo', Protocolo))
  then exit;

 ACBrNFSe1.ConsultarSituacao(edtEmitCNPJ.Text, edtEmitIM.Text, Protocolo);

 MemoResp.Lines.Text   := UTF8Encode(ACBrNFSe1.WebServices.ConsSitLote.RetWS);
 memoRespWS.Lines.Text := UTF8Encode(ACBrNFSe1.WebServices.ConsSitLote.RetWS);
 LoadXML(MemoResp, WBResposta);
end;

procedure TFormEmissorNFSe.btnGerarRPSClick(Sender: TObject);
var
 vAux : String;
begin
   vAux :=  FDataSetVenda.fieldbyname('Codigo').value ;

   ACBrNFSe1.NotasFiscais.Clear;
   GerarNFSe(vAux);
   ACBrNFSe1.NotasFiscais.Items[0].SaveToFile;

   ShowMessage('Arquivo gerado em: '+ACBrNFSe1.NotasFiscais.Items[0].NomeArq);
   MemoDados.Lines.Add('Arquivo gerado em: '+ACBrNFSe1.NotasFiscais.Items[0].NomeArq);
   MemoResp.Lines.LoadFromFile(ACBrNFSe1.NotasFiscais.Items[0].NomeArq);
   LoadXML(MemoResp, WBResposta);
   PageControl2.ActivePageIndex := 1;
end;

procedure TFormEmissorNFSe.btnImprimirClick(Sender: TObject);
begin
 OpenDialog1.Title := 'Selecione a NFSe';
 OpenDialog1.DefaultExt := '*-NFSe.xml';
 OpenDialog1.Filter := 'Arquivos NFSe (*-NFSe.xml)|*-NFSe.xml|Arquivos XML (*.xml)|*.xml|Todos os Arquivos (*.*)|*.*';
 OpenDialog1.InitialDir := ACBrNFSe1.Configuracoes.Geral.PathSalvar;

 if OpenDialog1.Execute then
  begin
   ACBrNFSe1.NotasFiscais.Clear;
   ACBrNFSe1.NotasFiscais.LoadFromFile(OpenDialog1.FileName);
   ACBrNFSe1.NotasFiscais.Imprimir;

   MemoDados.Lines.Add('Arquivo Carregado de: '+ACBrNFSe1.NotasFiscais.Items[0].NomeArq);
   MemoDados.Lines.Add('Nota Numero: '+ACBrNFSe1.NotasFiscais.Items[0].NFSe.Numero);
   MemoDados.Lines.Add('C�digo de Verifica��o: '+ACBrNFSe1.NotasFiscais.Items[0].NFSe.CodigoVerificacao);
   MemoDados.Lines.Add('Data de Emiss�o: '+DateToStr(ACBrNFSe1.NotasFiscais.Items[0].NFSe.DataEmissao));
   MemoResp.Lines.LoadFromFile(ACBrNFSe1.NotasFiscais.Items[0].NomeArq);
   LoadXML(MemoResp, WBResposta);
   PageControl2.ActivePageIndex := 1;
  end;
end;

procedure TFormEmissorNFSe.ACBrNFSe1StatusChange(Sender: TObject);
begin
 case ACBrNFSe1.Status of
  stNFSeIdle : begin
            if ( frmStatus <> nil ) then frmStatus.Hide;
           end;
  stNFSeRecepcao : begin
                   if ( frmStatus = nil )
                    then frmStatus := TfrmStatus.Create(Application);
                   frmStatus.lblStatus.Caption := 'Enviando dados da NFSe...';
                   frmStatus.Show;
                   frmStatus.BringToFront;
                  end;
  stNFSeConsulta : begin
                   if ( frmStatus = nil )
                    then frmStatus := TfrmStatus.Create(Application);
                   frmStatus.lblStatus.Caption := 'Consultando...';
                   frmStatus.Show;
                   frmStatus.BringToFront;
                  end;
  stNFSeCancelamento : begin
                       if ( frmStatus = nil )
                        then frmStatus := TfrmStatus.Create(Application);
                       frmStatus.lblStatus.Caption := 'Enviando cancelamento de NFSe...';
                       frmStatus.Show;
                       frmStatus.BringToFront;
                      end;
  stNFSeEmail : begin
                if ( frmStatus = nil )
                 then frmStatus := TfrmStatus.Create(Application);
                frmStatus.lblStatus.Caption := 'Enviando Email...';
                frmStatus.Show;
                frmStatus.BringToFront;
               end;
 end;
 Application.ProcessMessages;
end;

procedure TFormEmissorNFSe.ACBrNFSe1GerarLog(const Mensagem: String);
begin
 memoLog.Lines.Add(Mensagem);
end;

procedure TFormEmissorNFSe.sbtSchemasClick(Sender: TObject);
var
 Dir : string;
begin
 if Length(edtSchemas.Text) <= 0
  then Dir := ExtractFileDir(application.ExeName)
  else Dir := edtSchemas.Text;

 if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt],SELDIRHELP)
  then edtSchemas.Text := Dir;
end;

procedure TFormEmissorNFSe.SetDataSetCobranca(const Value: TDataSet);
begin
  FDataSetCobranca := Value;
end;

procedure TFormEmissorNFSe.SetDataSetProdutos(const Value: TDataSet);
begin
  FDataSetProdutos := Value;
end;

procedure TFormEmissorNFSe.SetDataSetVenda(const Value: TDataSet);
begin
  FDataSetVenda := Value;
end;

procedure TFormEmissorNFSe.sbtnPrestLogoClick(Sender: TObject);
begin
 OpenDialog1.Title := 'Selecione o Logo';
 OpenDialog1.DefaultExt := '*.bmp';
 OpenDialog1.Filter := 'Arquivos BMP (*.bmp)|*.bmp|Todos os Arquivos (*.*)|*.*';
 OpenDialog1.InitialDir := ExtractFileDir(application.ExeName);

 if OpenDialog1.Execute then
 begin
  edtPrestLogo.Text := OpenDialog1.FileName;
 end;
end;

procedure TFormEmissorNFSe.btnConsultarNFSeRPSClick(Sender: TObject);
begin
 OpenDialog1.Title := 'Selecione o Rps';
 OpenDialog1.DefaultExt := '*-Rps.xml';
 OpenDialog1.Filter := 'Arquivos Rps (*-Rps.xml)|*-Rps.xml|Arquivos XML (*.xml)|*.xml|Todos os Arquivos (*.*)|*.*';
 OpenDialog1.InitialDir := ACBrNFSe1.Configuracoes.Geral.PathSalvar;

 if OpenDialog1.Execute then
  begin
   ACBrNFSe1.NotasFiscais.Clear;
   ACBrNFSe1.NotasFiscais.LoadFromFile(OpenDialog1.FileName);

   ACBrNFSe1.ConsultarNFSeporRps(ACBrNFSe1.NotasFiscais.Items[0].NFSe.IdentificacaoRps.Numero,
                                ACBrNFSe1.NotasFiscais.Items[0].NFSe.IdentificacaoRps.Serie,
                                TipoRPSToStr(ACBrNFSe1.NotasFiscais.Items[0].NFSe.IdentificacaoRps.Tipo),
                                ACBrNFSe1.NotasFiscais.Items[0].NFSe.Prestador.Cnpj,
                                ACBrNFSe1.NotasFiscais.Items[0].NFSe.Prestador.InscricaoMunicipal);

   MemoResp.Lines.Text   := UTF8Encode(ACBrNFSe1.WebServices.ConsNfseRps.RetWS);
   memoRespWS.Lines.Text := UTF8Encode(ACBrNFSe1.WebServices.ConsNfseRps.RetWS);
   LoadXML(MemoResp, WBResposta);
  end;
end;

procedure TFormEmissorNFSe.btnConsultarNFSePeriodoClick(Sender: TObject);
var
 DataInicial, DataFinal : String;
begin
 if not(InputQuery('Consultar NFSe por Per�odo', 'Data Inicial (DD/MM/AAAA):', DataInicial))
  then exit;
 if not(InputQuery('Consultar NFSe por Per�odo', 'Data Final (DD/MM/AAAA):', DataFinal))
  then exit;

 ACBrNFSe1.ConsultarNFSe(edtEmitCNPJ.Text, edtEmitIM.Text, StrToDate(DataInicial), StrToDate(DataFinal));

 MemoResp.Lines.Text   := UTF8Encode(ACBrNFSe1.WebServices.ConsNfse.RetWS);
 memoRespWS.Lines.Text := UTF8Encode(ACBrNFSe1.WebServices.ConsNfse.RetWS);
 LoadXML(MemoResp, WBResposta);
end;

procedure TFormEmissorNFSe.cbCidadesChange(Sender: TObject);
var
 Tamanho: Integer;
begin
 Tamanho   := Length(Trim(cbCidades.Text));

 edtEmitCidade.Text := Copy(cbCidades.Text, 1, Tamanho - 11);
 edtEmitUF.Text     := Copy(cbCidades.Text, Tamanho - 1, 2);
 edtCodCidade.Text  := Copy(cbCidades.Text, Tamanho - 9, 7);
end;

// Fun��o criada para arredondar valores quando a n Casa for maior ou igual a 5
// pois a fun��o RoundTo arredonda quando a n Casa for maior ou igual a 6
function TFormEmissorNFSe.RoundTo5(Valor: Double; Casas: Integer): Double;
var
 xValor, xDecimais: String;
 p, nCasas: Integer;
 nValor: Double;
begin
 nValor := Valor;
 xValor := Trim(FloatToStr(Valor));
 p      := pos(',', xValor);
 if Casas < 0
  then nCasas := - Casas
  else nCasas := Casas;
 if p > 0
  then begin
   xDecimais := Copy(xValor, p + 1, length(xValor));
   if length(xDecimais) > nCasas
    then begin
     if xDecimais[nCasas + 1] >= '5'
      then SetRoundMode(rmUP)
      else SetRoundMode(rmNearest);
    end;
   nValor := RoundTo(Valor, Casas);
  end;
 Result := nValor;
end;

procedure TFormEmissorNFSe.btnGerarEnviarNFSeClick(Sender: TObject);
var
 vNumRPS, sNomeArq : String;
begin

 vNumRPS := DataSetVenda.fieldbyname('Codigo').asstring;

 ACBrNFSe1.NotasFiscais.Clear;
 GerarNFSe(vNumRPS);

 ACBrNFSe1.Gerar(StrToInt(vNumRPS));

 sNomeArq := ACBrNFSe1.NotasFiscais.Items[0].NomeArq;

 ACBrNFSe1.NotasFiscais.Clear;
 ACBrNFSe1.NotasFiscais.LoadFromFile(sNomeArq);
 ACBrNFSe1.NotasFiscais.Imprimir;

 MemoDados.Lines.Add('Arquivo Carregado de: '+ACBrNFSe1.NotasFiscais.Items[0].NomeArq);
 MemoResp.Lines.LoadFromFile(ACBrNFSe1.NotasFiscais.Items[0].NomeArq);
 LoadXML(MemoResp, WBResposta);
 PageControl2.ActivePageIndex := 1;
end;

procedure TFormEmissorNFSe.btnEnviaremailClick(Sender: TObject);
var
 vAux: String;
 sCC: TStrings;
begin
 OpenDialog1.Title := 'Selecione a NFSe';
 OpenDialog1.DefaultExt := '*-NFSe.xml';
 OpenDialog1.Filter := 'Arquivos NFSe (*-NFSe.xml)|*-NFSe.xml|Arquivos XML (*.xml)|*.xml|Todos os Arquivos (*.*)|*.*';
 OpenDialog1.InitialDir := ACBrNFSe1.Configuracoes.Geral.PathSalvar;

 if OpenDialog1.Execute then
  begin
   ACBrNFSe1.NotasFiscais.Clear;
   ACBrNFSe1.NotasFiscais.LoadFromFile(OpenDialog1.FileName);

   if not(InputQuery('Enviar e-mail', 'Destinat�rio', vAux))
    then exit;

   sCC:=TStringList.Create;
   sCC.Clear;  // Usando para add outros e-mail como Com-C�pia

   ACBrNFSe1.NotasFiscais.Items[0].EnviarEmail(edtSmtpHost.Text,
                                               edtSmtpPort.Text,
                                               edtSmtpUser.Text,
                                               edtSmtpPass.Text,
                                               edtEmailRemetente.Text,
                                               vAux,                 // e-mail do destinat�rio
                                               edtEmailAssunto.Text, // Assunto
                                               mmEmailMsg.Lines,     // Mensagem
                                               cbEmailSSL.Checked,   // SSL
                                               True,                 // Enviar em PDF
                                               sCC,                  // sCC
                                               nil,                  // Anexos
                                               True,                 // Pede Confirma��o de Recebimento
                                               True,                 // Aguarda o Envio
                                               edtEmitRazao.Text,    // Nome do remetente
                                               True,                 // TLS
                                               True);                // Usar Thread

   sCC.Free;

   MemoDados.Lines.Add('Arquivo Carregado de: '+ACBrNFSe1.NotasFiscais.Items[0].NomeArq);
   MemoResp.Lines.LoadFromFile(ACBrNFSe1.NotasFiscais.Items[0].NomeArq);
   LoadXML(MemoResp, WBResposta);
   PageControl2.ActivePageIndex := 1;
  end;
end;

procedure TFormEmissorNFSe.btnLinkNFSeClick(Sender: TObject);
var
 vNumNFSe, sCodVerif, sIM, sLink : String;
begin
 if not(InputQuery('Gerar o Link da NFSe', 'Numero da NFSe', vNumNFSe))
  then exit;
 if not(InputQuery('Gerar o Link da NFSe', 'Codigo de Verificacao', sCodVerif))
  then exit;
 if not(InputQuery('Gerar o Link da NFSe', 'Inscri��o Municipal', sIM))
  then exit;

 sLink := ACBrNFSe1.LinkNFSe(StrToIntDef(vNumNFSe, 0), sCodVerif, sIM);

 MemoResp.Lines.Add('Link Gerado: ' + sLink);
 PageControl2.ActivePageIndex := 0;
end;

procedure TFormEmissorNFSe.btnGerarLoteRPSClick(Sender: TObject);
var
 vAux, vNumLote : String;
begin
 //**************************************************************************
 //
 // A function GerarLote apenas gera o XML do lote, assina se necess�rio
 // e valida, salvando o arquivo com o nome: <lote>-lot-rps.xml na pasta Ger
 // N�o ocorre o envio para nenhum webservice.
 //
 //**************************************************************************

 if not(InputQuery('Gerar e Enviar Lote', 'Numero do RPS', vAux))
  then exit;

 if not(InputQuery('Gerar e Enviar Lote', 'Numero do Lote', vNumLote))
  then exit;

 ACBrNFSe1.NotasFiscais.Clear;
 GerarNFSe(vAux);
 ACBrNFSe1.GerarLote(vNumLote);

 ShowMessage('Arquivo gerado em: '+ACBrNFSe1.NotasFiscais.Items[0].NomeArq);

 ACBrNFSe1.NotasFiscais.Clear;
end;

procedure TFormEmissorNFSe.btnGerarEnviarSincronoClick(Sender: TObject);
var
 vAux, vNumLote : String;
begin
 //**************************************************************************
 //
 // A function EnviarSincrono s� esta disponivel para alguns provedores.
 //
 //**************************************************************************

 if not(InputQuery('Gerar e Enviar Lote - Sincrono', 'Numero do RPS', vAux))
  then exit;

 if not(InputQuery('Gerar e Enviar Lote - Sincrono', 'Numero do Lote', vNumLote))
  then exit;

 ACBrNFSe1.NotasFiscais.Clear;
 GerarNFSe(vAux);
 ACBrNFSe1.EnviarSincrono(vNumLote);

 ACBrNFSe1.NotasFiscais.Clear;
end;

procedure TFormEmissorNFSe.Button1Click(Sender: TObject);
var
 vAux, provedor : String;
begin
 if not(InputQuery('Informe o c�digo IBGE da cidade com 7 digitos', 'C�digo:', vAux))
  then exit;

 provedor := CodCidadeToProvedor(StrToIntDef(vAux, 0));

 ShowMessage('Provedor: ' + provedor);
end;

end.

{

Bom dia,

Fiz umas adapta��es nos componentes da ACBR para poder funcionar aqui para Natal.

Veja os m�todos:
ACBrNFSe1.NotasFiscais.AssinarRps; Usar no final de cada rps gerada.
ACBrNFSe1.GerarLote(NumLote); Usar quando for gerar o lote.

Estou usando Capicom e a assinatura por um Token.

Abra�os,

Danilo Junior
Arquivo(s) anexado(s)
Arquivo anexado  ACBrNFSe.rar   207.14K   50 Downloads
Arquivo anexado  ACBr_NFSe.rar   3.23K   35 Downloads
}
