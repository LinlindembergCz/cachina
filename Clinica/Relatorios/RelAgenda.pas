unit RelAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QRExport, QRPDFFilt, QuickRpt, ExtCtrls;

type
  TFormRelAgenda = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRImage1: TQRImage;
    QRPDFFilter1: TQRPDFFilter;
    QRExcelFilter1: TQRExcelFilter;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRExcelFilter2: TQRExcelFilter;
    QRPDFFilter2: TQRPDFFilter;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRDBText5: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelAgenda: TFormRelAgenda;

implementation

uses ModuloAgenda;

{$R *.dfm}

end.
