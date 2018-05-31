unit SaidaListagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TemplateListagemBase, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFormSaidaListagem = class(TTemplateFormListagemBase)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    SpeedButton3: TSpeedButton;
    dateInicio: TDateTimePicker;
    dateFim: TDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
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
  FormSaidaListagem: TFormSaidaListagem;

implementation

uses
EntidadeFactory, ControllerSaida;

{$R *.dfm}

{ TTemplateFormListagemBase1 }

procedure TFormSaidaListagem.FormCreate(Sender: TObject);
var
  Controller: TControllerSaida;
begin
  inherited;
  Controller:= TControllerSaida.Create;
  srcEntidade.DataSet:= Controller.GetSelect(
                        ControllerSaida.ConsultaTabela,
                       '0=0',
                        ControllerSaida.CamposSaida);
  Controller.Free;

  dateInicio.date := date;
  dateFim.date    := date;
end;

procedure TFormSaidaListagem.Setcodigo(const Value: string);
begin
  Fcodigo := Value;
end;

procedure TFormSaidaListagem.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  Codigo   := srcEntidade.DataSet.FieldByName('Codigo').AsString;
  Operacao := '';
  close;
end;

procedure TFormSaidaListagem.SpeedButton3Click(Sender: TObject);
var
  Condicao: string;
  Controller: TControllerSaida;
begin
  Controller:= TControllerSaida.Create;
  inherited;
  Condicao:= '0=0';

  if datetostr(dateInicio.Date) <> '' then
     Condicao:= Condicao + ' and Data >='+ quotedstr( formatDatetime('DD/MM/YYYY', dateInicio.date) );

  if datetostr(dateFim.Date) <> '' then
     Condicao:= Condicao + ' and Data <='+ quotedstr( formatDatetime('DD/MM/YYYY', dateFim.date) );

  srcEntidade.DataSet:= Controller.GetSelect(
                        ControllerSaida.ConsultaTabela,
                        Condicao,
                        CamposSaida);
  Controller.Free;

end;

end.
