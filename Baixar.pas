unit Baixar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, ControllerTabelas,
  Vcl.Buttons;

type
  TFormBaixar = class(TForm)
    edtValorPago: TEdit;
    dateDataPagamento: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FValor: Double;
    FData: TDatetime;
    procedure SetData(const Value: TDatetime);
    procedure SetValor(const Value: Double);
    { Private declarations }
  public
    { Public declarations }
    property Data : TDatetime read FData write SetData;
    property Valor: Double read FValor write SetValor;
  end;

var
  FormBaixar: TFormBaixar;

implementation

{$R *.dfm}

{ TFormBaixar }

procedure TFormBaixar.BitBtn1Click(Sender: TObject);
begin
  Data  := dateDataPagamento.DateTime;
  Valor := strtofloat(edtValorPago.text);
end;

procedure TFormBaixar.FormCreate(Sender: TObject);
begin
  dateDataPagamento.Date := date;
end;

procedure TFormBaixar.SetData(const Value: TDatetime);
begin
  FData := Value;
end;

procedure TFormBaixar.SetValor(const Value: Double);
begin
  FValor := Value;
end;

end.
