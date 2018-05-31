unit RelMapaDaObra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QuickRpt, QRCtrls, Vcl.ExtCtrls;

type
  TFormRelMapaDaObra = class(TForm)
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    QRImage1: TQRImage;
    PageHeaderBand1: TQRBand;
    lbAtividade: TQRLabel;
    QRSysData1: TQRSysData;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelMapaDaObra: TFormRelMapaDaObra;

implementation

{$R *.dfm}

procedure TFormRelMapaDaObra.FormCreate(Sender: TObject);
begin
  QRImage1.Picture.LoadFromFile(ExtractFilepath(application.exename) + '\mapa.jpg');
end;

end.
