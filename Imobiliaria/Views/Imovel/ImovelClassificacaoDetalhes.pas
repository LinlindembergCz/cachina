unit ImovelClassificacaoDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TemplateDetalhesComTabGrid,
  Vcl.StdCtrls, Data.DB, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TFormImovelClassificacaoDetalhes = class(TTemplateFormComTabGridDetalhes)
    edtDescricao: TEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormImovelClassificacaoDetalhes: TFormImovelClassificacaoDetalhes;

implementation

{$R *.dfm}

uses ControllerTabelas, EntidadeFactory;

procedure TFormImovelClassificacaoDetalhes.FormCreate(Sender: TObject);
begin
  inherited;
  Controller := TControllerTabelas.create;
  Entidade   := TEntidadeFactory.criar(tpImovelTipo);

  inherited;
  with MapperEntidade do
  begin
      associar('Codigo',nil);
      associar('CodigoFilial',nil);
      associar('Descricao',edtDescricao);
  end;
end;

end.
