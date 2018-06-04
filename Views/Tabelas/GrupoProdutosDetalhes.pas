unit GrupoProdutosDetalhes;

interface

uses
    System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  Graphics, Controls, Forms, Dialogs, StdCtrls,
  TemplateDetalhesComTabGrid, System.Rtti,   Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls,  Vcl.ExtCtrls, Vcl.Buttons, Data.DB, Vcl.Menus;

type
  TFormGrupoProdutosDetalhes = class(TTemplateFormComTabGridDetalhes)
    edtDescriacao: TEdit;
    cboCodigoFamilia: TComboBox;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGrupoProdutosDetalhes: TFormGrupoProdutosDetalhes;

implementation

{$R *.dfm}

uses ControllerTabelas, EntidadeFactory, DBUtils;

procedure TFormGrupoProdutosDetalhes.FormCreate(Sender: TObject);
begin
  Controller := TControllerTabelas.Create;
  Entidade   := TEntidadeFactory.Criar(tpGrupo);
  inherited;
  with MapperEntidade do
  begin
    associar('Codigo', nil);
    associar('Descricao', edtDescriacao);
    associar('CodigoFamilia',  cboCodigoFamilia);
  end;

  FillCombobox( tpFamilia, cboCodigoFamilia );
end;

end.
