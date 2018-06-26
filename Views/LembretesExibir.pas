unit LembretesExibir;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Data.DB,
  Vcl.DBCGrids, ControllerTabelas, DBClient;

type
  TFormLembretesExibir = class(TForm)
    DBCtrlGrid1: TDBCtrlGrid;
    DBMemo1: TDBMemo;
    srcLembretes: TDataSource;
    DBText1: TDBText;
    procedure DBMemo1DblClick(Sender: TObject);
  private
    FClientDataSet: TClientDataset;
    procedure SetClientDataSet(const Value: TClientDataset);
    { Private declarations }
  public
    { Public declarations }
    Controller: TControllerTabelas;
    property ClientDataSet:TClientDataset read FClientDataSet write SetClientDataSet;
  end;

var
  FormLembretesExibir: TFormLembretesExibir;

implementation

{$R *.dfm}

uses EntidadeFactory, srvModBaseDados;

procedure TFormLembretesExibir.DBMemo1DblClick(Sender: TObject);
begin
  DSServerModuleBaseDados.ExecSQL('Update Lembrete Set encerrado=''S'' '+
   ' where Codigo = '+  srcLembretes.DataSet.FieldByName('Codigo').AsString );
  srcLembretes.DataSet.delete;
  if srcLembretes.DataSet.isempty then
     close;
end;

procedure TFormLembretesExibir.SetClientDataSet(const Value: TClientDataset);
begin
  FClientDataSet := Value;
end;

end.
