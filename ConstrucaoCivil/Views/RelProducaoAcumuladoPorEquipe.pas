unit RelProducaoAcumuladoPorEquipe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QRPDFFilt, QRExport, Data.DB,
  Datasnap.DBClient, QRCtrls, QuickRpt, Vcl.ExtCtrls;

type
  TFormResumoProducaoAmuladoPorEquipe = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    DetailBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRDBText3: TQRDBText;
    SummaryBand1: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel1: TQRLabel;
    cdsProducao: TClientDataSet;
    QRExcelFilter1: TQRExcelFilter;
    QRPDFFilter1: TQRPDFFilter;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormResumoProducaoAmuladoPorEquipe: TFormResumoProducaoAmuladoPorEquipe;

implementation

{$R *.dfm}

end.
