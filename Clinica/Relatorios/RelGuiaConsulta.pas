unit RelGuiaConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, Vcl.Imaging.pngimage;

type
  TFormRelGuiaConsulta = class(TForm)
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    QRImage1: TQRImage;
    QRExpr1: TQRDBText;
    QRExpr3: TQRDBText;
    QRExpr11: TQRDBText;
    QRExpr17: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelGuiaConsulta: TFormRelGuiaConsulta;

implementation

uses ModuloAgenda;

{$R *.dfm}

end.
