unit RelProducaoAcumuladaDetalhada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QRPDFFilt, QRExport, Data.DB,
  Datasnap.DBClient, QRCtrls, QuickRpt, Vcl.ExtCtrls;

type
  TFormRelProducaoAcumuladaDetalhada = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    DetailBand1: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText1: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    QRLabel2: TQRLabel;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    SummaryBand1: TQRBand;
    QRExpr2: TQRExpr;
    cdsProducao: TClientDataSet;
    QRExcelFilter1: TQRExcelFilter;
    QRPDFFilter1: TQRPDFFilter;
    lbFiltro: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelProducaoAcumuladaDetalhada: TFormRelProducaoAcumuladaDetalhada;

implementation

{$R *.dfm}

end.
