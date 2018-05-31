unit PedidoListagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TemplateListagemBase, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFormPedidoListagem = class(TTemplateFormListagemBase)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    SpeedButton3: TSpeedButton;
    Label4: TLabel;
    dateInicio: TDateTimePicker;
    dateFim: TDateTimePicker;
    edtFornecedor: TEdit;
    btnInserir: TButton;
    btnAlterar: TButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  FormPedidoListagem: TFormPedidoListagem;

implementation

uses   EntidadeFactory, Mapper, GenericEntidade, strutils, ControllerPedido;

{$R *.dfm}

procedure TFormPedidoListagem.btnAlterarClick(Sender: TObject);
begin
  inherited;
  Codigo := srcEntidade.DataSet.FieldByName('Codigo').AsString;
  Operacao := 'Update';
  close;
end;

procedure TFormPedidoListagem.btnInserirClick(Sender: TObject);
begin
  inherited;
  Codigo   := '';
  Operacao := 'Insert';
  close;
end;

procedure TFormPedidoListagem.btnSelecionarClick(Sender: TObject);
begin
  inherited;
  Codigo   := srcEntidade.DataSet.FieldByName('Codigo').AsString;
  Operacao := '';
  close;
end;

procedure TFormPedidoListagem.FormCreate(Sender: TObject);
var
  Controller: TControllerPedido;
begin
  inherited;
  Controller:= TControllerPedido.Create;
  srcEntidade.DataSet:= Controller.GetSelect(
                        ControllerPedido.ConsultaTabela,
                       '0=0',
                        ControllerPedido.CamposPedido);
  Controller.Free;

  dateInicio.date := date-1;
  dateFim.date    := date;
end;

procedure TFormPedidoListagem.Setcodigo(const Value: string);
begin
  Fcodigo := Value;
end;

procedure TFormPedidoListagem.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFormPedidoListagem.SpeedButton3Click(Sender: TObject);
var
  Condicao: string;
  Controller: TControllerPedido;
begin
  Controller:= TControllerPedido.Create;
  inherited;
  Condicao:= '0=0';
  if datetostr(dateInicio.Date) <> '' then
     Condicao:= Condicao + ' and T1.Data >='+ quotedstr( formatDatetime('DD/MM/YYYY', dateInicio.date) );

  if datetostr(dateFim.Date) <> '' then
     Condicao:= Condicao + ' and T1.Data <='+ quotedstr( formatDatetime('DD/MM/YYYY', dateFim.date) );

  if edtFornecedor.Text <> ''  then
     Condicao:= Condicao + ' and forn.Nome Like '+ quotedstr( '%'+ edtFornecedor.Text +'%' );

  srcEntidade.DataSet:= Controller.GetSelect(
                        ControllerPedido.ConsultaTabela,
                        Condicao,
                        CamposPedido);
  Controller.Free;
end;

end.
