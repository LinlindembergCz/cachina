unit uClassConsultaCNPJ;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  HttpApp, IdHTTP, StrUtils, ActiveX, PNGImage,  ACBrSocket, ACBrUtil;

  type
    TConsultaCNPJ = Class
    private
      FHtml: string;
      FFantasia: string;
      FBairro: string;
      FEndEletronico: string;
      FUF: string;
      FCEP: string;
      FEFR: string;
      FNumero: string;
      FEmpresaTipo: string;
      FAbertura: TDatetime;
      FDataSituacao: TDatetime;
      FRazaoSocial: string;
      FSituacao: string;
      FComplemento: string;
      FMotivoSituacaoCad: string;
      FCidade: string;
      FNaturezaJuridica: string;
      FEndereco: string;
      FCNAE1: string;
      FTelefone: string;
      procedure SetAbertura(const Value: TDatetime);
      procedure SetBairro(const Value: string);
      procedure SetCEP(const Value: string);
      procedure SetCidade(const Value: string);
      procedure SetCNAE1(const Value: string);
      procedure SetCNPJ(const Value: string);
      procedure SetComplemento(const Value: string);
      procedure SetDataSituacao(const Value: TDatetime);
      procedure SetEFR(const Value: string);
      procedure SetEmpresaTipo(const Value: string);
      procedure SetEndEletronico(const Value: string);
      procedure SetEndereco(const Value: string);
      procedure SetFantasia(const Value: string);
      procedure SetMotivoSituacaoCad(const Value: string);
      procedure SetNaturezaJuridica(const Value: string);
      procedure SetNumero(const Value: string);
      procedure SetRazaoSocial(const Value: string);
      procedure SetSituacao(const Value: string);
      procedure SetTelefone(const Value: string);
      procedure SetUF(const Value: string);
      function GetAtividadeEconomica(Item: string): string;
      function GetContato(Item: string): string;
      function GetDataAbertura(Item: string): string;
      function GetEndereco(Item: string): string;
      function GetLocalizacao(Item: string): string;
      function GetNaturezaJuridica(Item: string): string;
      function GetNomeFantasia(Item: string): string;
      function GetRazaoSocial: string;
      function GetSituacaoCadastral(Item: string): string;
    function StrEntreStr(Texto, Delimitador1, Delimitador2: String;
      CaseSensitive: boolean=false): string;
    protected
      IdHttp1: TIdHttp;
      FCNPJ: String;
      fdata: string;
      Token: string;
      function Consultar(CNPJ: String): Boolean;
    published
      property CNPJ: string read FCNPJ write SetCNPJ;
      property Tipo: string read FEmpresaTipo write SetEmpresaTipo;
      property Abertura: TDatetime read FAbertura write SetAbertura;
      property RazaoSocial: string read FRazaoSocial write SetRazaoSocial;
      property Fantasia: string read FFantasia write SetFantasia;
      property CNAE1: string read FCNAE1 write SetCNAE1;
      property Endereco: string read FEndereco write SetEndereco;
      property Numero: string read FNumero write SetNumero;
      property Complemento: string read FComplemento write SetComplemento;
      property CEP: string read FCEP write SetCEP;
      property Bairro: string read FBairro write SetBairro;
      property Cidade: string read FCidade write SetCidade;
      property UF: string read FUF write SetUF;
      property Situacao: string read FSituacao write SetSituacao;
      property DataSituacao: TDatetime read FDataSituacao write SetDataSituacao;
      property NaturezaJuridica: string read FNaturezaJuridica write SetNaturezaJuridica;
      property EndEletronico: string read FEndEletronico write SetEndEletronico;
      property Telefone: string read FTelefone write SetTelefone;
      property EFR: string read FEFR write SetEFR;
      property MotivoSituacaoCad: string read FMotivoSituacaoCad write SetMotivoSituacaoCad;
    public
      constructor Create(CNPJ: String);
      destructor Destroy; override;
    End;

    function  RemoverEspacos(texto: string): string;
    function StrEntreStr(Str , StrInicial, StrFinal: String; ComecarDe: boolean  = false): String;

implementation

uses uConsultaCNPJReceita;

constructor TConsultaCNPJ.Create(CNPJ: String);
begin
   Consultar( CNPJ );
end;

destructor TConsultaCNPJ.Destroy;
begin
  inherited;
end;

procedure TConsultaCNPJ.SetAbertura(const Value: TDatetime);
begin
  FAbertura := Value;
end;

procedure TConsultaCNPJ.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TConsultaCNPJ.SetCEP(const Value: string);
begin
  FCEP := Value;
end;

procedure TConsultaCNPJ.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TConsultaCNPJ.SetCNAE1(const Value: string);
begin
  FCNAE1 := Value;
end;

procedure TConsultaCNPJ.SetCNPJ(const Value: string);
begin
  FCNPJ := Value;
end;

procedure TConsultaCNPJ.SetComplemento(const Value: string);
begin
  FComplemento := Value;
end;

procedure TConsultaCNPJ.SetDataSituacao(const Value: TDatetime);
begin
  FDataSituacao := Value;
end;

procedure TConsultaCNPJ.SetEFR(const Value: string);
begin
  FEFR := Value;
end;

procedure TConsultaCNPJ.SetEmpresaTipo(const Value: string);
begin
  FEmpresaTipo := Value;
end;

procedure TConsultaCNPJ.SetEndEletronico(const Value: string);
begin
  FEndEletronico := Value;
end;

procedure TConsultaCNPJ.SetEndereco(const Value: string);
begin
  FEndereco := Value;
end;

procedure TConsultaCNPJ.SetFantasia(const Value: string);
begin
  FFantasia := Value;
end;

procedure TConsultaCNPJ.SetMotivoSituacaoCad(const Value: string);
begin
  FMotivoSituacaoCad := Value;
end;

procedure TConsultaCNPJ.SetNaturezaJuridica(const Value: string);
begin
  FNaturezaJuridica := Value;
end;

procedure TConsultaCNPJ.SetNumero(const Value: string);
begin
  FNumero := Value;
end;

procedure TConsultaCNPJ.SetRazaoSocial(const Value: string);
begin
  FRazaoSocial := Value;
end;

procedure TConsultaCNPJ.SetSituacao(const Value: string);
begin
  FSituacao := Value;
end;

procedure TConsultaCNPJ.SetTelefone(const Value: string);
begin
  FTelefone := Value;
end;

procedure TConsultaCNPJ.SetUF(const Value: string);
begin
  FUF := Value;
end;

function TConsultaCNPJ.Consultar(CNPJ: String): Boolean;
var
  Res: Boolean;
  S: String;
  HtmlLista: TStringList;
begin
  Res:= False;
  try
    application.createform(TfrmConsultaCNPJReceita, frmConsultaCNPJReceita);
    frmConsultaCNPJReceita.CNPJ:= CNPJ;
    frmConsultaCNPJReceita.showmodal;

    FHtml:= frmConsultaCNPJReceita.Memo1.Lines.text;

    if Pos('<div id="idMensagemErro">', FHtml ) = 0 then
    begin
        with frmConsultaCNPJReceita do
        begin
          FEmpresaTipo       := '';
          FAbertura          := StrToDateDef(GetDataAbertura('DATA DE ABERTURA'),0);
          FRazaoSocial       := GetRazaoSocial;
          FFantasia          := GetNomeFantasia('TÍTULO DO ESTABELECIMENTO (NOME DE FANTASIA)');
          FEndereco          := GetEndereco('LOGRADOURO');
          FNumero            := GetEndereco('NÚMERO');
          FComplemento       := GetEndereco('COMPLEMENTO');
         FCEP                := GetLocalizacao('CEP');
          if FCEP <> '' then
            FCEP             := copy(FCEP,1,5)+'-'+copy(FCEP,6,3) ;
          FBairro            := GetLocalizacao('BAIRRO/DISTRITO');
          FCidade            := GetLocalizacao('MUNICÍPIO');
          FUF                := GetLocalizacao('UF');
          FSituacao          := GetSituacaoCadastral('SITUAÇÃO CADASTRAL');
        end;
        Res:= True;
    end
    else
    begin
      Res:= False;
      S:= StrEntreStr( FHtml , '<div id="idMensagemErro">', '</div>', false);
      S:= StrEntreStr(S, '>', '<', false);
      ShowMessage(Trim(S));
    end;
  finally
    frmConsultaCNPJReceita.free;
    Result:= Res;               
  end;
end;          

function  TConsultaCNPJ.GetRazaoSocial: string;
var
  texto: string;
begin
  texto:= StrEntreStr( FHtml , '<!-- Início Linha NOME EMPRESARIAL -->',
                                         '<!-- Fim Linha NOME EMPRESARIAL -->', false );
  texto:= StrEntreStr( texto , '<font face="Arial" style="font-size: 8pt">', '</font>', false);
  texto:= StrEntreStr( texto , '<b>', '</b>', false);
  result:= trim( Texto );
end;

function  TConsultaCNPJ.GetEndereco(Item: string): string;
var
   texto: string;
begin
  texto:= StrEntreStr( FHtml  , '<!-- Início Linha LOGRADOURO -->',
                                          '<!-- Fim Linha LOGRADOURO -->', true );
  texto:= StrEntreStr( RemoverEspacos( texto ) ,
                                  '<font face="Arial" style="font-size: 6pt">'+Item+'</font>',
                                  '<!-- Fim Linha LOGRADOURO -->', false );
  texto:= StrEntreStr( texto , '<font face="Arial" style="font-size: 8pt">', '</font>', false);
  texto:= StrEntreStr( texto , '<b>', '</b>', false);
  result:= trim( Texto );
end;

function  TConsultaCNPJ.GetLocalizacao(Item: string): string;
var
   texto: string;
begin
  texto:= StrEntreStr( FHtml  , '<!-- Início Linha CEP -->',
                                          '<!-- Fim Linha CEP -->', true );
  texto:= StrEntreStr( RemoverEspacos( texto ) ,
                                  '<font face="Arial" style="font-size: 6pt">'+Item+'</font>',
                                  '<!-- Fim Linha CEP -->' , false);
  texto:= StrEntreStr( texto , '<font face="Arial" style="font-size: 8pt">', '</font>', false);
  texto:= StrEntreStr( texto , '<b>', '</b>', false);
  result:= trim( Texto );
end;

function  TConsultaCNPJ.GetContato(Item: string): string;
var
   texto: string;
begin
  texto:= StrEntreStr( FHtml  , '<!-- Início de Linha de Contato -->',
                                          '<!-- Fim de Linha de Contato -->', true );
  texto:= StrEntreStr( RemoverEspacos( texto ) ,
                                  '<font face="Arial" style="font-size: 6pt">'+Item+'</font>',
                                  '<!-- Fim de Linha de Contato -->' , false);
  texto:= StrEntreStr( texto , '<font face="Arial" style="font-size: 8pt">', '</font>', false);
  texto:= StrEntreStr( texto , '<b>', '</b>', false);
  result:= trim( Texto );
  //TELEFONE
	//ENDEREÇO ELETRÔNICO
end;

function  TConsultaCNPJ.GetAtividadeEconomica(Item: string): string;
var
   texto: string;
begin
  texto:= StrEntreStr( FHtml  , '<!-- Início Linha ATIVIDADE ECONOMICA SECUNDARIA-->',
                                          '<!-- Fim Linha ATIVIDADE ECONOMICA SECUNDARIA -->', true );
  texto:= StrEntreStr( RemoverEspacos( texto ) ,
                                  '<font face="Arial" style="font-size: 6pt">'+Item+'</font>',
                                  '<!-- Fim Linha ATIVIDADE ECONOMICA SECUNDARIA -->', false );
  texto:= StrEntreStr( texto , '<font face="Arial" style="font-size: 8pt">', '</font>', false);
  texto:= StrEntreStr( texto , '<b>', '</b>', false);
  result:= trim( Texto );
  //CÓDIGO E DESCRIÇÃO DAS ATIVIDADES ECONÔMICAS SECUNDÁRIAS
end;

function  TConsultaCNPJ.GetNaturezaJuridica(Item: string): string;
var
   texto: string;
begin
  texto:= StrEntreStr( FHtml  , '<!-- Início Linha NATUREZA JURÍDICA -->',
                                          '<!-- Fim Linha NATUREZA JURÍDICA -->', true );
  texto:= StrEntreStr( RemoverEspacos( texto ) ,
                                  '<font face="Arial" style="font-size: 6pt">'+Item+'</font>',
                                  '<!-- Fim Linha NATUREZA JURÍDICA -->' , false);
  texto:= StrEntreStr( texto , '<font face="Arial" style="font-size: 8pt">', '</font>', false);
  texto:= StrEntreStr( texto , '<b>', '</b>', false);
  result:= trim( Texto );
  //CÓDIGO E DESCRIÇÃO DA NATUREZA JURÍDICA
end;

function  TConsultaCNPJ.GetSituacaoCadastral(Item: string): string;
var
   texto: string;
begin
  texto:= StrEntreStr( FHtml  , '<!-- Início Linha SITUAÇÃO CADASTRAL -->',
                                          '<!-- Fim Linha SITUACAO CADASTRAL -->', true );
  texto:= StrEntreStr( RemoverEspacos( texto ) ,
                                  '<font face="Arial" style="font-size: 6pt">'+Item+'</font>',
                                  '<!-- Fim Linha SITUACAO CADASTRAL -->' , false);
  texto:= StrEntreStr( texto , '<font face="Arial" style="font-size: 8pt">', '</font>', false);
  texto:= StrEntreStr( texto , '<b>', '</b>', false);
  result:= trim( Texto );
	//MOTIVO DE SITUAÇÃO CADASTRAL
end;

function  TConsultaCNPJ.GetNomeFantasia(Item: string): string;
var
   texto: string;
begin
  texto:= StrEntreStr( FHtml  , '<!-- Início Linha ESTABELECIMENTO -->',
                                          '<!-- Fim Linha ESTABELECIMENTO -->', true );
  texto:= StrEntreStr( RemoverEspacos( texto ) ,
                                  '<font face="Arial" style="font-size: 6pt">'+Item+'</font>',
                                  '<!-- Fim Linha ESTABELECIMENTO -->', false );
  texto:= StrEntreStr( texto , '<font face="Arial" style="font-size: 8pt">', '</font>', false);
  texto:= StrEntreStr( texto , '<b>', '</b>', false);
  result:= trim( Texto );
//TÍTULO DO ESTABELECIMENTO (NOME DE FANTASIA)
end;

function  TConsultaCNPJ.GetDataAbertura(Item: string): string;
var
   texto: string;
begin
  texto:= StrEntreStr( FHtml  , '<!-- Início Linha NÚMERO DE INSCRIÇÃO -->',
                                          '<!-- Fim Linha NÚMERO DE INSCRIÇÃO -->', true );
  texto:= StrEntreStr( RemoverEspacos( texto ) ,
                                  '<font face="Arial" style="font-size: 6pt">'+Item+'</font>',
                                  '<!-- Fim Linha NÚMERO DE INSCRIÇÃO -->' , false);
  texto:= StrEntreStr( texto , '<font face="Arial" style="font-size: 8pt">', '</font>', false);
  texto:= StrEntreStr( texto , '<b>', '</b>', false);
  result:= trim( Texto );
end;

function TConsultaCNPJ.StrEntreStr(Texto, Delimitador1,
  Delimitador2: String; CaseSensitive : boolean = false): string;
  var Inicio, Fim : Integer;
      Saida : string;
begin
  // Passar o texto para variável temporária
  Saida := Texto;
  // Verificar se é sensível ao caso
  // Pegar o início
  if CaseSensitive then
    Inicio := Pos(Delimitador1, Saida)
  else
    Inicio := Pos(ansiUpperCase(Delimitador1), ansiLowerCase(Saida));
  // Verificar se localizou
  if Inicio > 0 then
    Saida := Copy(Saida, Inicio + Length(Delimitador1), Length(Saida));

  // Pegar o fim
  if CaseSensitive then
    Fim := Pos(Delimitador2, Saida)
  else
    Fim := Pos(ansiUpperCase(Delimitador2), ansiUpperCase(Saida));

  // Verificar se localizou
  if Fim > 0 then
    Saida := Copy(Saida, 1, Fim - 1);

  // retornar o resultado
  Result := Saida;
end;

function StrEntreStr(Str , StrInicial, StrFinal: String; ComecarDe: boolean  = false): String;
var
  i: Integer;
begin
  i := Pos(StrInicial,Str);
  if not ComecarDe then
     Result := copy(Str,i + length( StrInicial ), PosEx(StrFinal , Str , i) - i - length( StrFinal ) + 1 )
  else
     Result := copy(Str,i + length( StrInicial ), PosEx(StrFinal , Str , i) - i + length( StrFinal ) + 1 )
end;

function  RemoverEspacos(texto: string): string;
begin
  texto  := stringReplace( texto ,#9,'' ,[rfReplaceAll]);
  texto  := stringReplace( texto ,#13,'' ,[rfReplaceAll]);
  result := stringReplace( texto ,#$A ,'' ,[rfReplaceAll]);
end;

end.
