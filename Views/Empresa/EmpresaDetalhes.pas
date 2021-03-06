unit EmpresaDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TemplateDetalhesComTabGrid, Data.DB,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TFormEmpresaDetalhes = class(TTemplateFormComTabGridDetalhes)
    lbRazaoSocial: TLabel;
    edtRazaoSocial: TEdit;
    lbNome: TLabel;
    edtNome: TEdit;
    lbCNPJ: TLabel;
    edtCNPJ: TEdit;
    lbInscricaoEstadual: TLabel;
    edtInscricaoEstadual: TEdit;
    lbIncricaoMunicipal: TLabel;
    edtIncricaoMunicipal: TEdit;
    edtEndereco: TEdit;
    edtBairro: TEdit;
    edtCidade: TEdit;
    edtUF: TEdit;
    edtComplemento: TEdit;
    edtCEP: TEdit;
    edtTelefone: TEdit;
    edtEmail: TEdit;
    edtSite: TEdit;
    lbSite: TLabel;
    lbEmail: TLabel;
    lbTelefone: TLabel;
    lbCEP: TLabel;
    lbComplemento: TLabel;
    lbUF: TLabel;
    lbCidade: TLabel;
    lbBairro: TLabel;
    lbEndereco: TLabel;
    edtCodigoMunicipio: TEdit;
    Label1: TLabel;
    TabSheet3: TTabSheet;
    Label2: TLabel;
    edtCertificado: TEdit;
    edtCertificadoSenha: TEdit;
    Label3: TLabel;
    edtCertificadoNumeroSerie: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtNumero: TEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEmpresaDetalhes: TFormEmpresaDetalhes;

implementation

{$R *.dfm}

uses ControllerTabelas, EntidadeFactory;

procedure TFormEmpresaDetalhes.FormCreate(Sender: TObject);
begin
  Controller := TControllerTabelas.create;
  Entidade   :=  TEntidadeFactory.Criar(tpEmpresa);
  inherited;
  with MapperEntidade do
  begin
    associar('Codigo', nil);
    associar('RazaoSocial', edtRazaoSocial);
    associar('Nome', edtNome);
    associar('CNPJ', edtCNPJ);
    associar('InscricaoEstadual', edtInscricaoEstadual);
    associar('IncricaoMunicipal', edtIncricaoMunicipal);
    associar('Endereco', edtEndereco);
    associar('Bairro', edtBairro);
    associar('Cidade', edtCidade);
    associar('UF', edtUF);
    associar('Complemento', edtComplemento);
    associar('CEP', edtCEP);
    associar('Telefone', edtTelefone);
    associar('Email', edtEmail);
    associar('Site', edtSite);
    associar('Numero', edtNumero);
    associar('CodigoMunicipio', edtCodigoMunicipio);
    associar('CertificadoNumeroSerie', edtCertificadoNumeroSerie);
    associar('CertificadoSenha', edtCertificadoSenha);
    associar('Certificado', edtCertificado);
  end;
end;

end.
