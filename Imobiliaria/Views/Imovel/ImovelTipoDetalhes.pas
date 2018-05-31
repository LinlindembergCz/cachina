unit ImovelTipoDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TemplateDetalhesComTabGrid, Data.DB,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TFormImovelTipoDetalhes = class(TTemplateFormComTabGridDetalhes)
    lbDescricao: TLabel;
    edtDescricao: TEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormImovelTipoDetalhes: TFormImovelTipoDetalhes;

implementation

{$R *.dfm}

uses ControllerTabelas, EntidadeFactory;

procedure TFormImovelTipoDetalhes.FormCreate(Sender: TObject);
begin
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
