unit uGuiaSADT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  Datasnap.DBClient, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, IdHashMessageDigest, Xml.xmldom,
  Xml.XMLIntf, Xml.XMLDoc, System.Win.ComObj, Datasnap.Provider, Vcl.Menus;

type
  TFormSADT = class(TForm)
    DataSource1: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TDBEdit;
    Edit2: TDBEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit3: TDBEdit;
    Edit4: TDBEdit;
    Edit5: TDBEdit;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtNumerocarteira: TDBEdit;
    Edit7: TDBEdit;
    Edit8: TDBEdit;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    Label31: TLabel;
    Edit9: TDBEdit;
    Edit31: TDBEdit;
    GroupBox6: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Edit11: TDBEdit;
    Edit13: TDBEdit;
    Edit15: TDBEdit;
    GroupBox7: TGroupBox;
    Label16: TLabel;
    GroupBox8: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Edit17: TDBEdit;
    Edit18: TDBEdit;
    Edit19: TDBEdit;
    GroupBox9: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    GroupBox10: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    Edit22: TDBEdit;
    Edit23: TDBEdit;
    Edit24: TDBEdit;
    Edit25: TDBEdit;
    Edit26: TDBEdit;
    Edit29: TDBEdit;
    Edit30: TDBEdit;
    Edit32: TDBEdit;
    GroupBox11: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Edit33: TDBEdit;
    Edit34: TDBEdit;
    Edit35: TDBEdit;
    Edit36: TDBEdit;
    Edit37: TDBEdit;
    Edit38: TDBEdit;
    Edit39: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    cdsTISS: TClientDataSet;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn3: TBitBtn;
    DBEdit1: TDBEdit;
    Label10: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Button1: TButton;
    Button2: TButton;
    XMLDocument1: TXMLDocument;
    BitBtn4: TBitBtn;
    FileOpenDialog1: TFileOpenDialog;
    Label40: TLabel;
    DBEdit2: TDBEdit;
    Label41: TLabel;
    DataSetProvider1: TDataSetProvider;
    cdsTISScodigoPrestadorNaOperadora: TStringField;
    cdsTISSRegistroANS: TStringField;
    cdsTISSNumeroLote: TStringField;
    cdsTISSnumeroGuiaPrestador: TStringField;
    cdsTISSdataAutorizacao: TDateField;
    cdsTISSsenha: TStringField;
    cdsTISSdataValidadeSenha: TDateField;
    cdsTISSnumeroCarteira: TStringField;
    cdsTISSatendimentoRN: TStringField;
    cdsTISSnomeBeneficiario: TStringField;
    cdsTISScodigoPrestadorNaOperadora_SOLI: TStringField;
    cdsTISSnomeContratado: TStringField;
    cdsTISSnomeProfissional: TStringField;
    cdsTISSconselhoProfissional: TStringField;
    cdsTISSnumeroConselhoProfissional: TStringField;
    cdsTISSUF_SOLICITANTE: TSmallintField;
    cdsTISSCBOS_SOLICITANTE: TStringField;
    cdsTISSdataSolicitacao: TDateField;
    cdsTISScaraterAtendimento: TStringField;
    cdsTISScodigoPrestadorNaOperadora_EXEC: TStringField;
    cdsTISSnomeContratado_EXEC: TStringField;
    cdsTISSCNES: TStringField;
    cdsTISStipoAtendimento: TStringField;
    cdsTISSindicacaoAcidente: TStringField;
    cdsTISStipoConsulta: TStringField;
    cdsTISSdataExecucao: TDateField;
    cdsTISScodigoTabela: TIntegerField;
    cdsTISScodigoProcedimento: TStringField;
    cdsTISSdescricaoProcedimento: TStringField;
    cdsTISSquantidadeExecutada: TIntegerField;
    cdsTISSreducaoAcrescimo: TSingleField;
    cdsTISSvalorUnitario: TSingleField;
    cdsTISSvalorTotal: TSingleField;
    cdsTISSvalorProcedimentos: TSingleField;
    cdsTISSvalorTotalGeral: TSingleField;
    cdsTISSCODIGO: TIntegerField;
    cdsTISSviaAcesso: TStringField;
    cdsTISStecnicaUtilizada: TStringField;
    cdsTISSgrauPart: TSingleField;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBComboBox3: TDBComboBox;
    DBComboBox4: TDBComboBox;
    DBComboBox5: TDBComboBox;
    DBComboBox6: TDBComboBox;
    DBComboBox7: TDBComboBox;
    DBComboBox8: TDBComboBox;
    edtNomeExecutante: TEdit;
    Label42: TLabel;
    edtLote: TEdit;
    Label43: TLabel;
    cdsTISScodigoPrestadorNaOperadora_EQUI: TStringField;
    cdsTISSnomeProfissional_EQUI: TStringField;
    cdsTISSconselhoProfissional_EQUI: TStringField;
    cdsTISSnumeroConselhoProfissional_EQUI: TStringField;
    cdsTISSUF_EQUI: TSmallintField;
    cdsTISSCBOS_EQUI: TStringField;
    PopupMenu1: TPopupMenu;
    GravarLote1: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function DataSetProvider1DataRequest(Sender: TObject;
      Input: OleVariant): OleVariant;
    procedure edtNumerocarteiraExit(Sender: TObject);
    procedure cdsTISSBeforePost(DataSet: TDataSet);
    procedure GravarLote1Click(Sender: TObject);
    procedure cdsTISSNewRecord(DataSet: TDataSet);
  private
    Conteudo: string;
    procedure ValidarXML(caminho: string);
    function GetHashMD5String(AStr: String; AMinusculo: Boolean= true): String;
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FormSADT: TFormSADT;

implementation

{$R *.dfm}

uses srvModBaseDados, IdGlobal ;

procedure TFormSADT.BitBtn1Click(Sender: TObject);
begin
  if cdsTISS.State in [dsedit,dsinsert] then
     cdsTISS.Post;
  if cdsTISS.ChangeCount > 0 then
     cdsTISS.ApplyUpdates(0);
end;

procedure TFormSADT.BitBtn2Click(Sender: TObject);

  procedure CopyRecord;
  var varCopyData: Variant;
      i: Integer;
  begin
    with cdsTiss do
    begin
      varCopyData := VarArrayCreate([0, FieldCount-1], varVariant);
      for i := 0 to FieldCount-1 do
        varCopyData[i] := Fields[i].Value;

      Insert;

      for i := 0 to FieldCount-1 do
        Fields[i].Value := varCopyData[i];
    end;
  end;

begin
  CopyRecord;

  cdsTISSsenha.value := '';
  cdsTISSnumeroCarteira.value := '';
  cdsTISSnumeroGuiaPrestador.asstring:= '';
  cdsTISSnomeBeneficiario.AsString:= '';
end;

function MD5String(const Value: string): string;
var
  xMD5: TIdHashMessageDigest5;
begin
  xMD5 := TIdHashMessageDigest5.Create;
  try
    Result := xMD5.HashStringAsHex(Value);
  finally
    xMD5.Free;
  end;
end;

function MD5Arquivo(const Value: string): string;
var
  xMD5: TIdHashMessageDigest5;
  xArquivo: TFileStream;
begin
  xMD5 := TIdHashMessageDigest5.Create;
  xArquivo := TFileStream.Create(Value, fmOpenRead OR fmShareDenyWrite);
  try
    Result := xMD5.HashStreamAsHex(xArquivo);
  finally
    xArquivo.Free;
    xMD5.Free;
  end;
end;

procedure TFormSADT.BitBtn3Click(Sender: TObject);

  function formatarValor(texto: string): string;
  begin
    result:= stringReplace( formatFloat(',0.00;', strtofloat(texto) ) , ',' , '.' , [] );
  end;


var


  RegistroANS: String;
  numeroLote: String;
  numeroGuiaPrestador: String;
  dataAutorizacao: String;
  senha: String;
  dataValidadeSenha: String;
  numeroCarteira: String;
  atendimentoRN: String;
  nomeBeneficiario: String;
  codigoPrestadorNaOperadora: String;
  nomeContratado: String;
  nomeProfissional: String;
  conselhoProfissional: String;
  numeroConselhoProfissional: String;
  UF: String;
  CBOS: String;
  caraterAtendimento: String;
  CNES: String;
  tipoAtendimento: String;
  indicacaoAcidente: String;
  dataExecucao: String;
  codigoTabela: String;
  codigoProcedimento: String;
  descricaoProcedimento: String;
  quantidadeExecutada: String;
  viaAcesso: String;
  tecnicaUtilizada: String;
  reducaoAcrescimo: String;
  valorUnitario: String;
  valorTotal: String;
  grauPart: String;
  codigoPrestadorNaOperadora2: String;
  nomeProf: String;
  conselho: String;
  dataSolicitacao: string;
  tipoConsulta: string;
  codigoPrestadorNaOperadora_Equi : string;
  nomeProf_Equi                   : string;
  conselho_Equi                   : string;
  numeroConselhoProfissional_Equi : string;
  UF_Equi                         : string;
  CBOS_Equi                       : string;

  XML: TStringList;

  function formatarData(Data: Tdatetime): string;
  begin
     result:= Formatdatetime('YYYY-MM-DD', Data );
  end;

  procedure AdicionarTag(texto: string; valor: string = '');
  begin
     if valor = '' then
        XML.Add( texto )
     else
     begin
       if (valor <> '1899-12-30') and (valor <> '') then
       begin
         XML.Add( Format(texto ,[valor] ));
         Conteudo:= Conteudo + valor;
       end;
     end;
  end;

begin
   Conteudo:= '';

   XML:= TStringList.Create;

   AdicionarTag('<?xml version="1.0" encoding="iso-8859-1"?>');
   AdicionarTag('<ansTISS:mensagemTISS xmlns:ansTISS="http://www.ans.gov.br/padroes/tiss/schemas">');

   AdicionarTag('<ansTISS:cabecalho>');
   AdicionarTag('   <ansTISS:identificacaoTransacao>');
   AdicionarTag('       <ansTISS:tipoTransacao>%s</ansTISS:tipoTransacao>','ENVIO_LOTE_GUIAS');
   AdicionarTag('       <ansTISS:sequencialTransacao>%s</ansTISS:sequencialTransacao>','1');
   AdicionarTag('       <ansTISS:dataRegistroTransacao>%s</ansTISS:dataRegistroTransacao>',FormatDatetime('YYYY-MM-DD',date) );
   AdicionarTag('       <ansTISS:horaRegistroTransacao>%s</ansTISS:horaRegistroTransacao>',timetostr(time) );
   AdicionarTag('   </ansTISS:identificacaoTransacao>');

   AdicionarTag('   <ansTISS:origem> ');
   AdicionarTag('       <ansTISS:identificacaoPrestador> ');
   AdicionarTag('           <ansTISS:codigoPrestadorNaOperadora>%s</ansTISS:codigoPrestadorNaOperadora>',cdsTISScodigoPrestadorNaOperadora.Asstring);
   AdicionarTag('       </ansTISS:identificacaoPrestador> ');
   AdicionarTag('   </ansTISS:origem>');

   AdicionarTag('<ansTISS:destino>');
   AdicionarTag('  <ansTISS:registroANS>%s</ansTISS:registroANS>',cdsTISSRegistroANS.Asstring);
   AdicionarTag('</ansTISS:destino>');

   AdicionarTag(' <ansTISS:Padrao>%s</ansTISS:Padrao> ','3.03.03');
   AdicionarTag('</ansTISS:cabecalho>');

   AdicionarTag('		<ansTISS:prestadorParaOperadora> ');
	 AdicionarTag('		  <ansTISS:loteGuias>  ');
	 AdicionarTag('		  	<ansTISS:numeroLote>%s</ansTISS:numeroLote>  ', cdsTISSnumeroLote.Asstring);
	 AdicionarTag('		      <ansTISS:guiasTISS>  ');

   cdsTISS.First;
   while not cdsTISS.Eof do
   begin
      RegistroANS                 := cdsTISSRegistroANS.Asstring;
      numeroGuiaPrestador         := cdsTISSnumeroGuiaPrestador.Asstring;
      dataAutorizacao             := formatarData(cdsTISSdataAutorizacao.AsDatetime);
      senha                       := cdsTISSsenha.Asstring;
      dataValidadeSenha           := formatarData(cdsTISSdataValidadeSenha.AsDatetime);
      numeroCarteira              := cdsTISSnumeroCarteira.Asstring;
      atendimentoRN               := cdsTISSatendimentoRN.Asstring;
      nomeBeneficiario            := cdsTISSnomeBeneficiario.Asstring;
      codigoPrestadorNaOperadora  := cdsTISScodigoPrestadorNaOperadora.Asstring;
      nomeContratado              := cdsTISSnomeContratado.Asstring;
      nomeProfissional            := cdsTISSnomeProfissional.Asstring;
      conselhoProfissional        := cdsTISSconselhoProfissional.Asstring;
      numeroConselhoProfissional  := cdsTISSnumeroConselhoProfissional.Asstring;
      UF                          := Copy(cdsTISSUF_SOLICITANTE.Asstring,1,2);
      CBOS                        := cdsTISSCBOS_SOLICITANTE.Asstring;
      if cdsTISScaraterAtendimento.Asstring <> '' then
         caraterAtendimento          := cdsTISScaraterAtendimento.Asstring[1];
      CNES                        := cdsTISSCNES.Asstring;
      tipoAtendimento             := Copy(cdsTISStipoAtendimento.Asstring,1,2);
      if cdsTISSindicacaoAcidente.Asstring <> '' then
         indicacaoAcidente           := cdsTISSindicacaoAcidente.Asstring[1];
      dataExecucao                := formatarData(cdsTISSdataExecucao.AsDatetime);
      codigoTabela                := cdsTISScodigoTabela.Asstring;
      codigoProcedimento          := cdsTISScodigoProcedimento.Asstring;
      descricaoProcedimento       := cdsTISSdescricaoProcedimento.Asstring;
      quantidadeExecutada         := cdsTISSquantidadeExecutada.Asstring;
      if cdsTISSviaAcesso.Asstring <> '' then
         viaAcesso                   := cdsTISSviaAcesso.Asstring[1];
      tecnicaUtilizada            := cdsTISStecnicaUtilizada.Asstring[1];
      reducaoAcrescimo            := cdsTISSreducaoAcrescimo.Asstring;
      valorUnitario               := cdsTISSvalorUnitario.Asstring;
      valorTotal                  := cdsTISSvalorTotal.Asstring;
      nomeProf                    := cdsTISSnomeProfissional.Asstring;
      conselho                    := cdsTISSconselhoProfissional.Asstring;
      dataSolicitacao             := formatarData(cdsTISSdataSolicitacao.AsDatetime);
      if cdsTISStipoConsulta.AsString <> '' then
         tipoConsulta                := cdsTISStipoConsulta.AsString[1];

      grauPart                        := cdsTISSgrauPart.Asstring;
      codigoPrestadorNaOperadora_Equi := cdsTISScodigoPrestadorNaOperadora_EQUI.AsString;
      nomeProf_Equi                   := cdsTISSnomeProfissional_EQUI.AsString;
      conselho_Equi                   := cdsTISSconselhoProfissional_EQUI.AsString;
      numeroConselhoProfissional_Equi := cdsTISSnumeroConselhoProfissional_EQUI.AsString;
      UF_Equi                         := cdsTISSUF_EQUI.AsString;
      CBOS_Equi                       := cdsTISSCBOS_EQUI.AsString;

      AdicionarTag('<ansTISS:guiaSP-SADT>');
      AdicionarTag('<ansTISS:cabecalhoGuia>');
      AdicionarTag('<ansTISS:registroANS>%s</ansTISS:registroANS>',registroANS);
      AdicionarTag('<ansTISS:numeroGuiaPrestador>%s</ansTISS:numeroGuiaPrestador>',numeroGuiaPrestador);
      AdicionarTag('</ansTISS:cabecalhoGuia>');

      AdicionarTag('<ansTISS:dadosAutorizacao> ');
      AdicionarTag('<ansTISS:dataAutorizacao>%s</ansTISS:dataAutorizacao>',dataAutorizacao);
      AdicionarTag('<ansTISS:senha>%s</ansTISS:senha>',senha);
      AdicionarTag('<ansTISS:dataValidadeSenha>%s</ansTISS:dataValidadeSenha>',dataValidadeSenha);
      AdicionarTag('</ansTISS:dadosAutorizacao>');

      AdicionarTag('<ansTISS:dadosBeneficiario>');
      AdicionarTag('<ansTISS:numeroCarteira>%s</ansTISS:numeroCarteira>',numeroCarteira);
      AdicionarTag('<ansTISS:atendimentoRN>%s</ansTISS:atendimentoRN>',atendimentoRN);
      AdicionarTag('<ansTISS:nomeBeneficiario>%s</ansTISS:nomeBeneficiario>',nomeBeneficiario);
      AdicionarTag('</ansTISS:dadosBeneficiario>');

      AdicionarTag('<ansTISS:dadosSolicitante>');
      AdicionarTag('	<ansTISS:contratadoSolicitante> ');
      AdicionarTag('<ansTISS:codigoPrestadorNaOperadora>%s</ansTISS:codigoPrestadorNaOperadora>',codigoPrestadorNaOperadora);
      AdicionarTag('<ansTISS:nomeContratado>%s</ansTISS:nomeContratado>',nomeContratado);
      AdicionarTag('	</ansTISS:contratadoSolicitante>');

      AdicionarTag('	<ansTISS:profissionalSolicitante>');
      AdicionarTag('<ansTISS:nomeProfissional>%s</ansTISS:nomeProfissional>',nomeProfissional);
      AdicionarTag('<ansTISS:conselhoProfissional>%s</ansTISS:conselhoProfissional>',conselhoProfissional);
      AdicionarTag('<ansTISS:numeroConselhoProfissional>%s</ansTISS:numeroConselhoProfissional>',numeroConselhoProfissional);
      AdicionarTag('<ansTISS:UF>%s</ansTISS:UF>',UF);
      AdicionarTag('<ansTISS:CBOS>%s</ansTISS:CBOS>',CBOS);
      AdicionarTag('	</ansTISS:profissionalSolicitante> ');
      AdicionarTag('</ansTISS:dadosSolicitante> ');

      AdicionarTag('<ansTISS:dadosSolicitacao>');
      AdicionarTag('<ansTISS:dataSolicitacao>%s</ansTISS:dataSolicitacao>',dataSolicitacao);
      AdicionarTag('<ansTISS:caraterAtendimento>%s</ansTISS:caraterAtendimento>',caraterAtendimento);
      AdicionarTag('</ansTISS:dadosSolicitacao> ');

      AdicionarTag('<ansTISS:dadosExecutante>');
      AdicionarTag('	<ansTISS:contratadoExecutante>');
      AdicionarTag('<ansTISS:codigoPrestadorNaOperadora>%s</ansTISS:codigoPrestadorNaOperadora>',codigoPrestadorNaOperadora);
      AdicionarTag('<ansTISS:nomeContratado>%s</ansTISS:nomeContratado>',nomeContratado);
      AdicionarTag('	</ansTISS:contratadoExecutante>');
      AdicionarTag('<ansTISS:CNES>%s</ansTISS:CNES>',CNES);
      AdicionarTag('</ansTISS:dadosExecutante> ');

      AdicionarTag('<ansTISS:dadosAtendimento> ');
      AdicionarTag('<ansTISS:tipoAtendimento>%s</ansTISS:tipoAtendimento>',tipoAtendimento);
      AdicionarTag('<ansTISS:indicacaoAcidente>%s</ansTISS:indicacaoAcidente>',indicacaoAcidente);
      if tipoConsulta <> '' then
         AdicionarTag('<ansTISS:tipoConsulta>%s</ansTISS:tipoConsulta>',tipoConsulta);
      AdicionarTag('</ansTISS:dadosAtendimento> ');

      AdicionarTag('<ansTISS:procedimentosExecutados>');
      AdicionarTag('	<ansTISS:procedimentoExecutado>');
      AdicionarTag('<ansTISS:dataExecucao>%s</ansTISS:dataExecucao>',dataExecucao);
      AdicionarTag('		<ansTISS:procedimento>');
      AdicionarTag('<ansTISS:codigoTabela>%s</ansTISS:codigoTabela>',codigoTabela);
      AdicionarTag('<ansTISS:codigoProcedimento>%s</ansTISS:codigoProcedimento>',codigoProcedimento);
      AdicionarTag('<ansTISS:descricaoProcedimento>%s</ansTISS:descricaoProcedimento>',descricaoProcedimento);
      AdicionarTag('		</ansTISS:procedimento>');

      AdicionarTag('<ansTISS:quantidadeExecutada>%s</ansTISS:quantidadeExecutada>',quantidadeExecutada);

      if viaAcesso <> '' then
      AdicionarTag('<ansTISS:viaAcesso>%s</ansTISS:viaAcesso>',viaAcesso);
       if tecnicaUtilizada <> '' then
      AdicionarTag('<ansTISS:tecnicaUtilizada>%s</ansTISS:tecnicaUtilizada>',tecnicaUtilizada);
       if reducaoAcrescimo <> '' then
      AdicionarTag('<ansTISS:reducaoAcrescimo>%s</ansTISS:reducaoAcrescimo>',formatarValor(reducaoAcrescimo));

      AdicionarTag('<ansTISS:valorUnitario>%s</ansTISS:valorUnitario>',formatarValor(valorUnitario));
      AdicionarTag('<ansTISS:valorTotal>%s</ansTISS:valorTotal>',formatarValor(valorTotal));

      if grauPart <> '' then
      begin
         AdicionarTag('		<ansTISS:equipeSadt>');
         AdicionarTag('			<ansTISS:grauPart>%s</ansTISS:grauPart>',grauPart);

         AdicionarTag('			<ansTISS:codProfissional>');
         AdicionarTag('				<ansTISS:codigoPrestadorNaOperadora>%s</ansTISS:codigoPrestadorNaOperadora>',codigoPrestadorNaOperadora_Equi);
         AdicionarTag('			</ansTISS:codProfissional>');

         AdicionarTag('			<ansTISS:nomeProf>%s</ansTISS:nomeProf>',nomeProf_Equi);
         AdicionarTag('			<ansTISS:conselho>%s</ansTISS:conselho>',conselho_Equi);
         AdicionarTag('			<ansTISS:numeroConselhoProfissional>%s</ansTISS:numeroConselhoProfissional>',numeroConselhoProfissional_Equi);
         AdicionarTag('			<ansTISS:UF>%s</ansTISS:UF>',UF_Equi);
         AdicionarTag('			<ansTISS:CBOS>%s</ansTISS:CBOS>',CBOS_Equi);
         AdicionarTag('		</ansTISS:equipeSadt>');
      end;

      AdicionarTag('	</ansTISS:procedimentoExecutado>');
      AdicionarTag('</ansTISS:procedimentosExecutados>');

      AdicionarTag('<ansTISS:valorTotal>');
      AdicionarTag('<ansTISS:valorProcedimentos>%s</ansTISS:valorProcedimentos>', formatarValor(valorTotal));
      AdicionarTag('<ansTISS:valorTotalGeral>%s</ansTISS:valorTotalGeral>', formatarValor(valorTotal));
      AdicionarTag('</ansTISS:valorTotal>');

      AdicionarTag('</ansTISS:guiaSP-SADT>');

      cdsTISS.Next;
   end;

	 AdicionarTag('			</ansTISS:guiasTISS> ');
	 AdicionarTag('		</ansTISS:loteGuias> ');
	 AdicionarTag('	</ansTISS:prestadorParaOperadora>');

	 AdicionarTag('	    <ansTISS:epilogo>');
	 AdicionarTag('		<ansTISS:hash>%s</ansTISS:hash> ', GetHashMD5String(Conteudo) );
	 AdicionarTag('	</ansTISS:epilogo>');

   AdicionarTag('</ansTISS:mensagemTISS> ');

   XML.SaveToFile( Extractfilepath(application.ExeName)+'Lote_Envio_GuiasSADT.xml');

   ValidarXML( Extractfilepath(application.ExeName)+'Lote_Envio_GuiasSADT.xml' );

end;

function TFormSADT.GetHashMD5String(AStr: String; AMinusculo: Boolean = True): String;
begin

  with TIdHashMessageDigest5.Create do
  begin                                 //
      Result := HashStringAsHex(AStr, IndyTextEncoding(28591));
      Free;
  end;
  if AMinusculo then
     Result := LowerCase(Result);
end;

procedure TFormSADT.GravarLote1Click(Sender: TObject);
var
  NumeroLote: string;
begin
   NumeroLote:=   InputBox('Informe o Numero do Lote','Numero Lote','');
   cdsTISS.first;
   while not cdsTISS.eof do
   begin
      DSServerModuleBaseDados.execSql( format('Update GUISADT Set NumeroLote = ''%s'' where Codigo=%s ', [NumeroLote,cdsTISSCodigo.AsString] ) );
      cdsTISS.Next;
   end;
end;

procedure TFormSADT.ValidarXML(caminho: string );
var
  path: string;
  XSDL:OleVariant;
  XML: OleVariant;
begin
    path:=ExtractFilePath(caminho);
    XSDL := CreateOLEObject('MSXML2.XMLSchemaCache.4.0');

    TRY
       XSDL.add('http://www.ans.gov.br/padroes/tiss/schemas', (path + '\schemas\tissV3_03_03.xsd'))
    EXCEPT
       showmessage('Schema tissV3.03.03 não encontrado!');
       exit;
    END;

   XML := CreateOLEObject('MSXML2.DOMDocument.4.0');
   XML.validateOnParse := True;
   XML.resolveExternals := True;
   XML.schemas := XSDL;
   XML.load(caminho);

   if (XML.parseError.errorCode <> 0) then
   begin
      showmessage('Descrição: ' +  StringReplace(trim(XML.parseError.Reason),
      '{http://www.ans.gov.br/padroes/tiss/schemas}','',[rfReplaceAll])+
      'Tag inválida: ' + trim(XML.parseError.srcText) + 'Linha ' +
      intToStr(XML.parseError.Line));
   end
   else
      showmessage('XML Válido!');
end;


procedure TFormSADT.BitBtn4Click(Sender: TObject);
begin
  if FileOpenDialog1.Execute then
  begin
    ValidarXML( FileOpenDialog1.FileName )
  end
  else
    exit;

end;

procedure TFormSADT.Button1Click(Sender: TObject);
var
   executante, NumeroLote : string;
begin
   if edtNomeExecutante.Text <> '' then
      executante:= ' AND nomeContratado_EXEC LIKE ('+quotedstr(edtNomeExecutante.Text+'%')+')';

   if edtLote.Text <> '' then
     NumeroLote:= ' AND GUITISS."NumeroLote" = '+ quotedstr(edtLote.Text);

   cdsTISS.close;
   cdsTISS.DataRequest( 'Select * from GUITISS where '+
                      ' dataAutorizacao >= '''+ datetostr(DateTimePicker1.Date)+
                       ''' and dataAutorizacao <= '''+ datetostr(DateTimePicker2.Date)+''' '+
                        executante + NumeroLote);
   cdsTISS.open;
end;

procedure TFormSADT.Button2Click(Sender: TObject);

var
  Node, NodeChild: IXMLNode;
  i:integer;
  NumeroLote: string;
  count: integer;

  function formatarData(texto: string): string;
  begin
    result:= '';
    if texto <> '' then
       result:= copy(texto,9,2)+'/'+ copy(texto,6,2) +'/'+copy(texto,1,4)
  end;

  function GetNodevalue( NodeChild: IXMLNode; texto: string): string;
  var
    node: IXMLNode;
  begin
    node :=  NodeChild.ChildNodes.FindNode(texto);
    if node <> nil then
       result:= node.text;
  end;

  function formatarValor(texto: string): string;
  begin
    result:=  stringreplace( texto, '.',',',[]);
  end;


begin
  try
      cdsTISS.DisableControls;
      if FileOpenDialog1.Execute then
      begin
        count := FileOpenDialog1.Files.Count -1;

        for I := 0 to count  do
        begin
           XMLDocument1.LoadFromFile(FileOpenDialog1.Files[i]);
           XMLDocument1.Active := true;

           NumeroLote:= XMLDocument1.DocumentElement.
                        childNodes.FindNode('prestadorParaOperadora').
                        childNodes.FindNode('loteGuias').
                        ChildNodes.FindNode('numeroLote').Text;

           Node :=  XMLDocument1.DocumentElement.
                    childNodes.FindNode('prestadorParaOperadora').
                    childNodes.FindNode('loteGuias').
                    childNodes.FindNode('guiasTISS').
                    childNodes.FindNode('guiaSP-SADT');

          while (Node <> nil) do
          begin
             cdsTISS.append;

             cdsTISSNumeroLote.AsString := NumeroLote;

             NodeChild := Node.childNodes.FindNode('cabecalhoGuia');

             cdsTISSRegistroANS.AsString         := GetNodevalue(NodeChild,'registroANS');

             cdsTISSnumeroGuiaPrestador.AsString := GetNodevalue(NodeChild,'numeroGuiaPrestador');

             NodeChild := Node.childNodes.FindNode('dadosAutorizacao');
             cdsTISSdataAutorizacao.AsString:= formatarData(GetNodevalue(NodeChild,'dataAutorizacao'));
             cdsTISSsenha.AsString:= GetNodevalue(NodeChild,'senha');
             cdsTISSdataValidadeSenha.AsString:= formatarData(GetNodevalue(NodeChild,'dataValidadeSenha'));

             NodeChild := Node.childNodes.FindNode('dadosBeneficiario');
             cdsTISSnumeroCarteira.AsString:= GetNodevalue(NodeChild,'numeroCarteira');
             cdsTISSatendimentoRN.AsString:= GetNodevalue(NodeChild,'atendimentoRN');
             cdsTISSnomeBeneficiario.AsString:= GetNodevalue(NodeChild,'nomeBeneficiario');

             NodeChild := Node.childNodes.FindNode('dadosSolicitante').childNodes.FindNode('contratadoSolicitante');
             cdsTISScodigoPrestadorNaOperadora.AsString:= GetNodevalue(NodeChild,'codigoPrestadorNaOperadora');

             cdsTISSnomeContratado.AsString:= GetNodevalue(NodeChild,'nomeContratado');

             NodeChild := Node.childNodes.FindNode('dadosSolicitante').childNodes.FindNode('profissionalSolicitante');

             cdsTISSnomeProfissional.AsString:= GetNodevalue(NodeChild,'nomeProfissional');
             cdsTISSconselhoProfissional.AsString:= GetNodevalue(NodeChild,'conselhoProfissional');
             cdsTISSnumeroConselhoProfissional.AsString:= GetNodevalue(NodeChild,'numeroConselhoProfissional');
             cdsTISSUF_SOLICITANTE.AsString:= GetNodevalue(NodeChild,'UF');
             cdsTISSCBOS_SOLICITANTE.AsString:= GetNodevalue(NodeChild,'CBOS');

             NodeChild := Node.childNodes.FindNode('dadosSolicitacao');
             cdsTISSdataSolicitacao.AsString:= formatarData(GetNodevalue(NodeChild,'dataSolicitacao'));
             cdsTISScaraterAtendimento.AsString:= GetNodevalue(NodeChild,'caraterAtendimento');

             NodeChild := Node.childNodes.FindNode('dadosExecutante').childNodes.FindNode('contratadoExecutante');
             cdsTISScodigoPrestadorNaOperadora_EXEC.AsString:=  GetNodevalue(NodeChild,'codigoPrestadorNaOperadora');
             cdsTISSnomeContratado_EXEC.AsString := GetNodevalue(NodeChild,'nomeContratado');

             NodeChild := Node.childNodes.FindNode('dadosExecutante');
             cdsTISSCNES.AsString:= GetNodevalue(NodeChild,'CNES');

             NodeChild := Node.childNodes.FindNode('dadosAtendimento');
             cdsTISStipoAtendimento.AsString:= GetNodevalue(NodeChild,'tipoAtendimento');
             cdsTISSindicacaoAcidente.AsString:= GetNodevalue(NodeChild,'indicacaoAcidente');
             cdsTISStipoConsulta.AsString:= GetNodevalue(NodeChild,'tipoConsulta');

             NodeChild := Node.childNodes.FindNode('procedimentosExecutados').childNodes.FindNode('procedimentoExecutado');
             cdsTISSdataExecucao.AsString:= formatarData(GetNodevalue(NodeChild,'dataExecucao'));
             cdsTISSquantidadeExecutada.AsString:= GetNodevalue(NodeChild,'quantidadeExecutada');

             cdsTISSviaAcesso.AsString:= GetNodevalue(NodeChild,'viaAcesso');
             cdsTISStecnicaUtilizada.AsString:= GetNodevalue(NodeChild,'tecnicaUtilizada');
             cdsTISSreducaoAcrescimo.AsString:= formatarValor(GetNodevalue(NodeChild,'reducaoAcrescimo'));

             cdsTISSvalorUnitario.AsString:= formatarValor(GetNodevalue(NodeChild,'valorUnitario'));
             cdsTISSvalorTotal.AsString:= formatarValor(GetNodevalue(NodeChild,'valorTotal'));

             NodeChild := Node.childNodes.FindNode('procedimentosExecutados').
                               childNodes.FindNode('procedimentoExecutado').
                               childNodes.FindNode('equipeSadt');

             cdsTISSgrauPart.AsString                        := GetNodevalue(NodeChild,'grauPart');
             cdsTISSnomeProfissional_EQUI.AsString           := GetNodevalue(NodeChild,'nomeProf');
             cdsTISSconselhoProfissional_EQUI.AsString       := GetNodevalue(NodeChild,'conselho');
             cdsTISSnumeroConselhoProfissional_EQUI.AsString := GetNodevalue(NodeChild,'numeroConselhoProfissional');
             cdsTISSUF_EQUI.AsString                         := GetNodevalue(NodeChild,'UF');
             cdsTISSCBOS_EQUI.AsString                       := GetNodevalue(NodeChild,'CBOS');
             cdsTISScodigoPrestadorNaOperadora_EQUI.AsString := GetNodevalue(NodeChild.
                                                                ChildNodes.FindNode('codProfissional'),
                                                                'codigoPrestadorNaOperadora');

             NodeChild := NodeChild.childNodes.FindNode('procedimento');

             cdsTISScodigoTabela.AsString:= GetNodevalue(NodeChild,'codigoTabela');
             cdsTISScodigoProcedimento.AsString:= GetNodevalue(NodeChild,'codigoProcedimento');
             cdsTISSdescricaoProcedimento.AsString:= GetNodevalue(NodeChild,'descricaoProcedimento');

             cdsTISSCODIGO.value:= cdsTISS.RecordCount;

             cdsTISS.Post;

             Node := Node.NextSibling;
          end;

          cdsTISS.applyupdates(0);
        end;
      end;
  finally
    cdsTISS.EnableControls;
  end
end;

procedure TFormSADT.cdsTISSBeforePost(DataSet: TDataSet);
var
   MaxDataSet: TDataSet;
begin
   try
      MaxDataSet := DSServerModuleBaseDados.getDataSet(
       'Select (Cast(Max("numeroGuiaPrestador") as INTEGER) + 1) as numeroGuia From GUITISS' );
      cdsTISSnumeroGuiaPrestador.Value:=  DataSet.FieldByName('numeroGuia').Value;
   finally
      MaxDataSet.Free;
   end;
end;

procedure TFormSADT.cdsTISSNewRecord(DataSet: TDataSet);
begin
  cdsTISSatendimentoRN.Value:= 'N';
end;

function TFormSADT.DataSetProvider1DataRequest(Sender: TObject;
  Input: OleVariant): OleVariant;
begin
   DSServerModuleBaseDados.SQLGUIATISS.CommandText:= Input;
end;

procedure TFormSADT.edtNumerocarteiraExit(Sender: TObject);
var
   DataSet: TDataSet;
begin
  try
     DataSet := DSServerModuleBaseDados.getDataSet(
     Format( 'Select First 1 "nomeBeneficiario" From GUITISS where "numeroCarteira"=''%s''' ,
     [edtNumerocarteira.Text] ) );

     if not (cdsTISS.State in[dsedit, dsinsert]) then
       cdsTISS.Edit;
     cdsTISSnomeBeneficiario.AsString:= DataSet.FieldByName('nomeBeneficiario').AsString;
  finally
     DataSet.Free;
  end;
end;

procedure TFormSADT.FormShow(Sender: TObject);
begin
  cdsTISS.close;
  cdsTISS.DataRequest( 'Select * from GUITISS where 0=1');
  cdsTISS.open;
end;

end.
