unit TemplateListagemBase;

interface

uses  Vcl.Controls, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.Forms,
  Vcl.DBGrids, Vcl.ComCtrls, System.Classes, Vcl.ExtCtrls,
  Vcl.Buttons, DBClient;


type
  TTemplateFormListagemBase = class(TForm)
    srcEntidade: TDataSource;
    Panel1: TPanel;
    SpeedButton2: TSpeedButton;
    btnSelecionar: TSpeedButton;
    Grid1: TDBGrid;
    procedure Grid1DblClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Grid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TemplateFormListagemBase: TTemplateFormListagemBase;

implementation

{$R *.dfm}

procedure TTemplateFormListagemBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   //Action:=  TCloseAction.caFree;
end;

procedure TTemplateFormListagemBase.Grid1DblClick(Sender: TObject);
begin
  close;
end;

procedure TTemplateFormListagemBase.Grid1TitleClick(Column: TColumn);
begin
  TClientDataSet(srcEntidade.Dataset).IndexFieldNames:=  Column.fieldname;
end;

procedure TTemplateFormListagemBase.SpeedButton2Click(Sender: TObject);
begin
  close;
end;

end.
