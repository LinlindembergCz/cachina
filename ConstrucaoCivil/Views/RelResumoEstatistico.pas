unit RelResumoEstatistico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QRCtrls, QuickRpt, Vcl.ExtCtrls,
  QRPDFFilt, Data.DB, QRExport, Datasnap.DBClient, qrpctrls;

type
  TFormRelResumoEstatistico = class(TForm)
    cdsEstatistica: TClientDataSet;
    QRExcelFilter1: TQRExcelFilter;
    DataSource1: TDataSource;
    QRPDFFilter1: TQRPDFFilter;
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRPLabel1: TQRPLabel;
    ChildBand1: TQRChildBand;
    QRPLabel2: TQRPLabel;
    lbPosicao: TQRLabel;
    procedure SummaryBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    QtdUnidade: integer;
    QtdAtvidades: integer;
  end;

var
  FormRelResumoEstatistico: TFormRelResumoEstatistico;

implementation

{$R *.dfm}

procedure TFormRelResumoEstatistico.SummaryBand1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  lbPosicao.caption :=  formatFloat( ',0.00;',( QRExpr1.Value.intResult * 100) /
                                              ( QtdUnidade * QtdAtvidades ) );
end;

end.

