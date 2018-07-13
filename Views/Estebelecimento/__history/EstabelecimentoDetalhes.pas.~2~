unit EstabelecimentoDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TemplateDetalhesComTabGrid, Data.DB,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TFormEstabelecimentoDetalhes = class(TTemplateFormComTabGridDetalhes)
    lbDescricao: TLabel;
    edtDescricao: TEdit;
    lbEndereco: TLabel;
    edtEndereco: TEdit;
    lbBairro: TLabel;
    edtBairro: TEdit;
    lbMunicipio: TLabel;
    edtMunicipio: TEdit;
    lbUF: TLabel;
    edtUF: TEdit;
    lbNumero: TLabel;
    edtNumero: TEdit;
    lbCNPJ: TLabel;
    edtCNPJ: TEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEstabelecimentoDetalhes: TFormEstabelecimentoDetalhes;

implementation

{$R *.dfm}

uses ControllerTabelas, EntidadeFactory;

procedure TFormEstabelecimentoDetalhes.FormCreate(Sender: TObject);
begin
  Controller := TcontrollerTabelas.create;
  Entidade   := TEntidadeFactory.Criar(tpEstabelecimento);

  inherited;
  with MapperEntidade do
  begin
    associar('Codigo', nil);
    associar('Descricao', edtDescricao);
    associar('Endereco', edtEndereco);
    associar('Bairro', edtBairro);
    associar('Municipio', edtMunicipio);
    associar('UF', edtUF);
    associar('Numero', edtNumero);
    associar('CNPJ', edtCNPJ);
  end;

end;

end.
