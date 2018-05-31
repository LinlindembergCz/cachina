unit ClassificacaoDetalhes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  Graphics, Controls, Forms, Dialogs, StdCtrls,
  TemplateDetalhesComTabGrid, System.Rtti,  Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls,  Vcl.ExtCtrls, Vcl.Buttons, Data.DB;

type
  TFormClassificacaoDetalhes = class(TTemplateFormComTabGridDetalhes)
    Label1: TLabel;
    edtDescricao: TEdit;
    Label2: TLabel;
    edtDesconto: TEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormClassificacaoDetalhes: TFormClassificacaoDetalhes;

implementation

{$R *.dfm}

uses ControllerTabelas, EntidadeFactory;

procedure TFormClassificacaoDetalhes.FormCreate(Sender: TObject);
begin
  Controller := TControllerTabelas.Create;
  Entidade   := TEntidadeFactory.Criar(tpClassificacaoCliente);
  inherited;
  with MapperEntidade do
  begin
    Associar('Codigo', nil);
    Associar('Descricao', edtDescricao);
    Associar('Desconto', edtDesconto);
  end;
end;

end.
