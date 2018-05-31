unit FiltroPeriodo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  TFormFiltroPeriodo = class(TForm)
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DataInicial: TDatetime;
    DataFinal: TDatetime;
    class function Show(fdata1, fdata2:TDatetime): TFormFiltroPeriodo;
  end;

var
  FormFiltroPeriodo: TFormFiltroPeriodo;

implementation

{$R *.dfm}

{ TFormFiltroPeriodo }

procedure TFormFiltroPeriodo.FormCreate(Sender: TObject);
begin
  DateTimePicker1.Date:= DataInicial;
  DateTimePicker2.Date:= DataFinal;
end;

class function TFormFiltroPeriodo.Show(fdata1, fdata2:TDatetime): TFormFiltroPeriodo;
begin
   application.Createform( TFormFiltroPeriodo, FormFiltroPeriodo);
   FormFiltroPeriodo.DataInicial := fdata1;
   FormFiltroPeriodo.DataFinal  := fdata2;
   if FormFiltroPeriodo.ShowModal = mrOk then
       result := FormFiltroPeriodo
   else
       result := nil;
end;

end.
