unit TabelaPrecoListagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TemplateListagemBase, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFormTabelaPrecoListagem = class(TTemplateFormListagemBase)
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    Fcodigo: string;
    procedure Setcodigo(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    Operacao: string;
    property codigo:string read Fcodigo write Setcodigo;
  end;

var
  FormTabelaPrecoListagem: TFormTabelaPrecoListagem;

implementation

{$R *.dfm}

uses ControllerTabelas;

{ TFormTabelaPrecoListagem }

procedure TFormTabelaPrecoListagem.FormCreate(Sender: TObject);
var
  Controller: TControllerTabelas;
begin
  inherited;
  Controller:= TControllerTabelas.Create;
  srcEntidade.DataSet:= Controller.GetSelect('TabelaPreco','0=0','*');
  Controller.Free;
end;

procedure TFormTabelaPrecoListagem.Setcodigo(const Value: string);
begin
  Fcodigo := Value;
end;

procedure TFormTabelaPrecoListagem.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  Codigo   := srcEntidade.DataSet.FieldByName('Codigo').AsString;
  Operacao := '';
  close;
end;

end.
