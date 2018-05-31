unit RelRecebimento2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, QRPDFFilt,
  QRExport, QRCtrls, QuickRpt, Vcl.ExtCtrls;

type
  TFormRelRecebimento2 = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    imgLogo: TQRImage;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRExcelFilter1: TQRExcelFilter;
    QRPDFFilter1: TQRPDFFilter;
    cdsRecebimento: TClientDataSet;
    QRLabel5: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelRecebimento2: TFormRelRecebimento2;

implementation

{$R *.dfm}

end.
