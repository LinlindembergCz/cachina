unit EtapaDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TemplateDetalhesComTabGrid,
  Vcl.StdCtrls, Data.DB, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TFormEtapaDetalhes = class(TTemplateFormComTabGridDetalhes)
    lbDescriacao: TLabel;
    edtDescricao: TEdit;
    Label1: TLabel;
    edtCodificacao: TEdit;
    Label2: TLabel;
    cboCodigoBaseDados: TComboBox;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEtapaDetalhes: TFormEtapaDetalhes;

implementation

{$R *.dfm}

uses Controller, ControllerTabelas, EntidadeFactory, Mapper, DBUtils;

procedure TFormEtapaDetalhes.FormCreate(Sender: TObject);
begin
  Controller := TControllerTabelas.Create;
  Entidade   := TEntidadeFactory.Criar(tpEtapa);
  inherited;
  with MapperEntidade do
  begin
    Associar('Codigo',nil);
    Associar('Descricao', edtDescricao);
    Associar('Codificacao', edtCodificacao);
    Associar('CodigoBaseDados', cboCodigoBaseDados);
  end;
  FillCombobox( 'Basedados',cboCodigoBaseDados,'0=0','Codigo','Descricao' );

end;

end.
{

select
Etapa.Codificacao, Etapa.Descricao,
Fase.Codificacao, Fase.Descricao,
SubFase.Codificacao, SubFase.Descricao
from Etapa
inner join Fase on CodigoEtapa = Etapa.Codigo
inner join SubFase on CodigoFase = Fase.Codigo
order by cast( Etapa.Codificacao as int)

}