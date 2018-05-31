unit TabelaNFSeDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TemplateDetalhesComTabGrid,
  Vcl.StdCtrls, Data.DB, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TFormTabelaNFSeDetalhes = class(TTemplateFormComTabGridDetalhes)
    Label1: TLabel;
    edtCodigoNCM: TEdit;
    Label2: TLabel;
    memoDescricao: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTabelaNFSeDetalhes: TFormTabelaNFSeDetalhes;

implementation

{$R *.dfm}

uses ControllerTabelas, EntidadeFactory;

procedure TFormTabelaNFSeDetalhes.FormCreate(Sender: TObject);
begin
  Controller      := TControllerTabelas.Create;
  Entidade        := TEntidadeFactory.Criar(tpTabelaNFSe);
  inherited;
  with MapperEntidade do
  begin
    associar('Codigo', nil);
    associar('CodigoFilial', nil);
    associar('Descricao', memoDescricao);
    associar('CodigoNFSe', edtCodigoNCM);
  end;
end;

end.
