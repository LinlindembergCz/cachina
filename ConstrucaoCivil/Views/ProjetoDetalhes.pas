unit ProjetoDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TemplateDetalhesComTabGrid,
  Vcl.StdCtrls, Data.DB, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TFormProjetoDetalhes = class(TTemplateFormComTabGridDetalhes)
    edtDescricao: TEdit;
    Label1: TLabel;
    memoDescritivo: TMemo;
    Label2: TLabel;
    DBMemo1: TDBMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProjetoDetalhes: TFormProjetoDetalhes;

implementation

{$R *.dfm}

uses ControllerTabelas, EntidadeFactory;

procedure TFormProjetoDetalhes.FormCreate(Sender: TObject);
begin
  Controller:= TControllerTabelas.create;
  Entidade  := TEntidadeFactory.criar(tpProjeto);
  inherited;
  with MapperEntidade do
  begin
    associar('Codigo', nil);
    associar('CodigoFilial', nil);
    associar('Descricao', edtDescricao);
    associar('Descritivo', memoDescritivo);
  end;

end;

end.
