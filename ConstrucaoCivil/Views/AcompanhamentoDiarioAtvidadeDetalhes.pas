unit AcompanhamentoDiarioAtvidadeDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFormAcompanhamentoDiarioAtvidadeDetalhes = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAcompanhamentoDiarioAtvidadeDetalhes: TFormAcompanhamentoDiarioAtvidadeDetalhes;

implementation

{$R *.dfm}

uses ControllerTabelas;

procedure TFormAcompanhamentoDiarioAtvidadeDetalhes.FormCreate(Sender: TObject);
var
  Controller : TControllerTabelas;
  I: Integer;
begin
  Controller := TControllerTabelas.create;

  DataSource1.Dataset := Controller.GetSelect('Select * from vwAcompanhamentoObra');

  for I := 1 to DBGrid1.Columns.Count - 1 do
  begin
    DBGrid1.Columns.Items[i].Width := 40;
  end;

end;

end.
