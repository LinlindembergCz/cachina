unit RelFaturmento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, QRPDFFilt, QRExport;

type
  TFormRelFaturamento = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRBand1: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRImage1: TQRImage;
    QRPDFFilter1: TQRPDFFilter;
    QRExpr1: TQRExpr;
    QRGroup2: TQRGroup;
    QRDBText4: TQRDBText;
    QRDBText10: TQRDBText;
    QRExcelFilter1: TQRExcelFilter;
    QRExpr2: TQRExpr;
    QRDBText11: TQRDBText;
    QRExpr3: TQRExpr;
    QRDBText2: TQRDBText;
    QRDBText8: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelFaturamento: TFormRelFaturamento;

implementation

uses ModuloAgenda;

{$R *.dfm}

end.
