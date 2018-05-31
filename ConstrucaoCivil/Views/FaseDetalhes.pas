unit FaseDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TemplateDetalhesComTabGrid,
  Vcl.StdCtrls, Data.DB, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TFormFaseDetalhes = class(TTemplateFormComTabGridDetalhes)
    lbDescriacao: TLabel;
    edtDescricao: TEdit;
    edtCodificacao: TEdit;
    Label1: TLabel;
    cboCodigoEtapa: TComboBox;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFaseDetalhes: TFormFaseDetalhes;

implementation

{$R *.dfm}

uses ControllerTabelas, EntidadeFactory, DBUtils;

procedure TFormFaseDetalhes.FormCreate(Sender: TObject);
begin
  Controller := TControllerTabelas.Create;
  Entidade   := TEntidadeFactory.Criar(tpFase);
  inherited;
  with MapperEntidade do
  begin
    Associar('Codigo',nil);
    Associar('Descricao', edtDescricao);
    Associar('Codificacao', edtCodificacao);
    Associar('CodigoEtapa', cboCodigoEtapa);
  end;
  FillCombobox( 'Etapa' , cboCodigoEtapa,'0=0');

end;

end.
