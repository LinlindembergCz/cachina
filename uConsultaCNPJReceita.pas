unit uConsultaCNPJReceita;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, StdCtrls, aCTIVEX, strUtils;

type
  TfrmConsultaCNPJReceita = class(TForm)
    WebBrowser1: TWebBrowser;
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
    procedure WebBrowser1DownloadComplete(Sender: TObject);
  private
    FCNPJ: string;
    procedure SetCNPJ(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    Html: string;
    property CNPJ: string read FCNPJ write SetCNPJ;
  end;

   function GetWebBrowserHTML(const WebBrowser: TWebBrowser): String;

var
  frmConsultaCNPJReceita: TfrmConsultaCNPJReceita;

implementation


{$R *.dfm}

function GetWebBrowserHTML(const WebBrowser: TWebBrowser): String;
var
  LStream: TStringStream;
  Stream : IStream;
  LPersistStreamInit : IPersistStreamInit;
begin
  if not Assigned(WebBrowser.Document) then exit;
  LStream := TStringStream.Create('');
  try
    LPersistStreamInit := WebBrowser.Document as IPersistStreamInit;
    Stream := TStreamAdapter.Create(LStream,soReference);
    LPersistStreamInit.Save(Stream,true);
    result := LStream.DataString;
  finally
    LStream.Free();
  end;
end;

procedure TfrmConsultaCNPJReceita.SetCNPJ(const Value: string);
begin
  FCNPJ := Value;
end;

procedure TfrmConsultaCNPJReceita.WebBrowser1DownloadComplete(Sender: TObject);
begin
  Memo1.lines.clear;
  Memo1.lines.add(trim( GetWebBrowserHTML ( WebBrowser1 ) ) );
  if Pos('Confira os dados de Identificação da Pessoa Jurídica', Memo1.text) <> 0 then
    close;
end;

procedure TfrmConsultaCNPJReceita.FormShow(Sender: TObject);
begin
   WebBrowser1.Navigate( 'www.receita.fazenda.gov.br/'+
                         'pessoajuridica/cnpj/cnpjreva/cnpjreva_solicitacao2.asp?cnpj='+FCNPJ );
end;

end.
