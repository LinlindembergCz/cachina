(*******************************************************************)
(* FreeBOLETO                                                      *)
(*******************************************************************)
(* Autor original: Carlos H. Cantu                                 *)
(*                                                                 *)
(* LICENÇA                                                         *)
(*                                                                 *)
(*    1. O FreeBoleto pode ser distribuído e utilizado livremente  *)
(*       com qualquer tipo de projeto, comercial ou não.           *)
(*    2. Componentes derivados do código do FreeBoleto não podem   *)
(*       ser vendidos e devem manter os créditos originais, e devem*)
(*       estar compatíveis com essa licença.                       *)
(*    3. Qualquer alteração ou melhoria no código do FreeBoleto    *)
(*       deve ser enviada ao autor para ser avaliada e, se         *)
(*       possível, incorporada ao código oficial do componente.    *)
(*    4. A inclusão do suporte de novos bancos ao FreeBoleto deve  *)
(*       ser notificada ao autor, enviando juntamente o código da  *)
(*       unit do banco em questão. A criação de uma nova unit de   *)
(*       suporte a um novo banco deverá ser feita em conjunto com  *)
(*       a criação dos testes unitários (DUNITs) necessários para  *)
(*       garantir o correto funcionamento das rotinas.             *)
(*    5. O autor não se responsabiliza por qualquer dano ou        *)
(*       qualquer outro tipo de problema originado pela utilização *)
(*       desse componente, se isentando de qualquer                *)
(*       responsabilidade sobre a utilização do mesmo.             *)
(*                                                                 *)
(* Mais informações sobre a licença e utilização estão no arquivo  *)
(* Leiame.html, que deve ser distribuído com todas as versões      *)
(* componente.                                                     *)
(*                                                                 *)
(*******************************************************************)
unit Boleto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, uFreeBoleto, uFreeBoletoImage, ExtCtrls;

type
  TFormBoleto = class(TForm)
    Label1: TLabel;
    edBanco: TEdit;
    Label2: TLabel;
    edCodCedente: TEdit;
    Agencia: TLabel;
    edAgencia: TEdit;
    Label3: TLabel;
    dtpVencimento: TDateTimePicker;
    Label4: TLabel;
    edValor: TEdit;
    Label5: TLabel;
    edNNum: TEdit;
    Memo1: TMemo;
    Label6: TLabel;
    edContaCorrente: TEdit;
    edDigitoCC: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    edCarteira: TEdit;
    Label9: TLabel;
    edModeloCarteira: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    edNomeCede: TEdit;
    Label12: TLabel;
    dtpEmissao: TDateTimePicker;
    Label13: TLabel;
    edDocumento: TEdit;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    edSacado: TEdit;
    edEndereco: TEdit;
    edUF: TEdit;
    edBairro: TEdit;
    edCidade: TEdit;
    edCep: TEdit;
    Label20: TLabel;
    edCNPJ: TEdit;
    GroupBox2: TGroupBox;
    Button3: TButton;
    Button2: TButton;
    Button4: TButton;
    Button5: TButton;
    Button1: TButton;
    Label21: TLabel;
    edConvenio: TEdit;
    Label22: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBoleto: TFormBoleto;

implementation

{$R *.dfm}

uses TypInfo;

var B: TFreeBoleto;
    Img: TFreeBoletoImagem;

procedure TFormBoleto.Button1Click(Sender: TObject);
begin
  B.LimparTudo;
  B.Cedente.Agencia := edAgencia.text;
  B.Cedente.CodigoBanco := edBanco.text;
  B.Moeda := '9';
  B.Cedente.Nome := edNomeCede.text;
  B.DataDocumento := trunc(dtpEmissao.date);
  B.Documento := edDocumento.text;
  B.Vencimento := dtpVencimento.date;
  b.Cedente.CodigoCedente := edCodCedente.text;
  b.Valor := StrToFloat(edValor.Text);
  b.NossoNumero := edNNum.text;
  B.Cedente.ContaCorrente := edContaCorrente.text;
  if edDigitoCC.text <> '' then
    B.Cedente.DigitoContaCorrente := edDigitoCC.text[1];
  B.carteira := edCarteira.text;
  B.Cedente.Banco151.ModalidadeConta := edModeloCarteira.text;
  B.Cedente.Banco001.Convenio := edConvenio.text;
  with B.sacado do
  begin
    Nome := edSacado.text;
    Endereco := edEndereco.text;
    Bairro := edBairro.text;
    Cep := edCep.text;
    Estado := edUF.text;
    Cidade := edCidade.text;
    CNPJ_CPF := edCNPJ.text;
  end;
  b.preparar;
  memo1.Lines.clear;
  with memo1.lines do
  begin
    Add('AgenCodCedente:' + b.DadosGerados.AgencCodigoCedente);
    Add('Nome Banco:' + b.DadosGerados.NomeDoBanco);
    Add('Num. bancario:' + b.DadosGerados.NumeroBancario);
    Add('Digitavel:' + b.DadosGerados.LinhaDigitavel);
    Add('Barras:' + b.DadosGerados.CodigoBarras);
  end;
end;


procedure TFormBoleto.Button2Click(Sender: TObject);
begin
//Img.BoletoAtual:= B;
  Img.ShowPreview;
end;

procedure TFormBoleto.FormCreate(Sender: TObject);
begin
  B := TFreeBoleto.create(application);
  Img := TFreeBoletoImagem.create(self);

end;

procedure TFormBoleto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //B.free;
  //Img.free;
end;

procedure CloneProperties(SourceComp, DestComp: TObject);
var
  Propinfo: PPropInfo;
  Properties: PPropList;
  FCount: Integer;
  FSize: Integer;
  i: Integer;
  PropName: String;
  SourcePropObject: TObject;
  DestPropObject: TObject;
begin
  FCount := GetPropList(SourceComp.ClassInfo, tkAny, nil);
  FSize := FCount * SizeOf(Pointer);
  GetMem(Properties, FSize);
  GetPropList(SourceComp.ClassInfo, tkAny, Properties);
  for i := 0 to FCount-1 do
  begin
    PropName := Properties^[i].Name;
    PropInfo := GetPropInfo(DestComp.ClassInfo, PropName);
    if (PropInfo = nil) or (UpperCase(PropName) = 'NAME') then
      Continue;
    case PropType(SourceComp, PropName) of
      tkInteger,
      tkWChar,
      tkSet,
      tkChar        : SetOrdProp(DestComp,PropName,GetOrdProp(SourceComp,PropName));
      tkString,
      tkLString,
      tkWString     : SetStrProp(DestComp,PropName,GetStrProp(SourceComp,PropName));
      tkEnumeration : SetEnumProp(DestComp,PropName,GetEnumProp(SourceComp,PropName));
      tkFloat       : SetFloatProp(DestComp,PropName,GetFloatProp(SourceComp,PropName));
      tkClass       : begin
                        SourcePropObject := GetObjectProp(SourceComp,PropName);
                        DestPropObject := GetObjectProp(DestComp,PropName);
                        if (SourcePropObject<>nil) and (DestPropObject<>nil)
                        and (SourcePropObject.ClassType.ClassParent.ClassName='TPersistent') then
                          CloneProperties(SourcePropObject,DestPropObject)
                        else
                          SetObjectProp(DestComp,PropName,GetObjectProp(SourceComp,PropName));
                      end;
    end;
  end;
  if Properties <> nil then
    FreeMem(Properties, FSize);
end;

procedure TFormBoleto.Button3Click(Sender: TObject);
var x:TFreeBoleto;
begin
  //CloneProperties(b,x);
  Img.ListaBoletos.Add(B);
end;

procedure TFormBoleto.Button4Click(Sender: TObject);
begin
  Img.ListaBoletos.Clear;
end;

procedure TFormBoleto.Button5Click(Sender: TObject);
begin
  Button1Click(Sender);
  Button3Click(Sender);
end;

end.

