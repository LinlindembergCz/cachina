unit TipoAgendamentoDetalhes;

interface

uses TemplateDetalhesComTabGrid, Vcl.Controls, Vcl.StdCtrls, Data.DB, Vcl.Grids, VCL.Dialogs,VCL.Forms,
  Vcl.DBGrids, Vcl.ComCtrls, System.Classes, Vcl.ExtCtrls,Vcl.Buttons, Sysutils;


type
  TFormTipoAgendamentoDetalhes = class(TTemplateFormComTabGridDetalhes)
    lbDescricao: TLabel;
    edtDescricao: TEdit;
    Label2: TLabel;
    cboCodigoConvenio: TComboBox;
    Label3: TLabel;
    edtValor: TEdit;
    Label1: TLabel;
    edtCodificacaoTUSS: TEdit;
    Label4: TLabel;
    edtCodificacaoAMB: TEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTipoAgendamentoDetalhes: TFormTipoAgendamentoDetalhes;

implementation

{$R *.dfm}

uses ControllerTabelas, EntidadeFactory, DBUtils;

procedure TFormTipoAgendamentoDetalhes.FormCreate(Sender: TObject);
begin
  Controller := TControllertabelas.Create;
  Entidade   := TEntidadeFactory.Criar(tpTipoAgendamento);
  Campos     := 'T1.*, (Select "Descricao" from Convenio where "Codigo"= T1."CodigoConvenio") as Convenio';
  inherited;
  CampoCodigo:= 'Codigo';
  with MapperEntidade do
  begin
    associar('Codigo', nil);
    associar('Descricao', edtDescricao);
    associar('QuantidadeSessoes', nil);
    associar('Valor', edtValor);
    associar('CodigoConvenio', cboCodigoConvenio);
    associar('CodificacaoTUSS', edtCodificacaoTUSS);
    associar('CodificacaoAMB',  edtCodificacaoAMB);
  end;
  FillCombobox(tpConvenio,cboCodigoConvenio);
end;

end.
