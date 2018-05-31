unit RelProducaoResumido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QRCtrls, QRPDFFilt, QRExport, Data.DB,
  Datasnap.DBClient, QuickRpt, Vcl.ExtCtrls;

type
  TFormRelProducaoResumido = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    DetailBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    SummaryBand1: TQRBand;
    QRExpr2: TQRExpr;
    cdsProducao: TClientDataSet;
    QRExcelFilter1: TQRExcelFilter;
    QRPDFFilter1: TQRPDFFilter;
    QRDBText3: TQRDBText;
    QRLabel1: TQRLabel;
    lbFiltro: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelProducaoResumido: TFormRelProducaoResumido;

implementation

{$R *.dfm}

end.
