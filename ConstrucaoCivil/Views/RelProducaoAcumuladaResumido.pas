unit RelProducaoAcumuladaResumido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QRPDFFilt, QRExport, Data.DB,
  Datasnap.DBClient, QRCtrls, QuickRpt, Vcl.ExtCtrls;

type
  TFormRelProducaoAcumuladaResumido = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    DetailBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    ExprProducao: TQRExpr;
    QRDBText3: TQRDBText;
    SummaryBand1: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel1: TQRLabel;
    cdsProducao: TClientDataSet;
    QRExcelFilter1: TQRExcelFilter;
    QRPDFFilter1: TQRPDFFilter;
    lbFiltro: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    lbTotalLiquido: TQRLabel;
    lbProducaoLiquida: TQRLabel;
    QRLabel8: TQRLabel;
    lbFaltas: TQRDBText;
    QRLabel9: TQRLabel;
    lbDesconto: TQRExpr;
    QRLabel10: TQRLabel;
    ExprProducaoReal: TQRExpr;
    QRExpr1: TQRExpr;
    procedure QRBand1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    TotalSalario:Double;
    TotalLiquido:Double;
    TotalDescontado:Double;

  end;

var
  FormRelProducaoAcumuladaResumido: TFormRelProducaoAcumuladaResumido;

implementation

{$R *.dfm}

procedure TFormRelProducaoAcumuladaResumido.QRBand1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
   TotalSalario := TotalSalario + cdsProducao.fieldbyname('SalarioBase').asFloat;
   TotalLiquido := TotalLiquido + strtofloat( stringReplace( lbProducaoLiquida.caption,'.','',[]) );
   //if StrToIntDef( lbFaltas.Caption,0 ) > 0 then

end;

procedure TFormRelProducaoAcumuladaResumido.QRBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  Var
  producao:double;
begin
  if ExprProducao.Value.dblResult > 0 then
  begin
     producao:= ExprProducaoReal.Value.dblResult -
        ( cdsProducao.fieldbyname('SalarioBase').asFloat / cdsProducao.fieldbyname('Dias').asInteger ) ;

     if producao > 0 then
        lbProducaoLiquida.caption := FormatFloat( ',0.00;', producao)
     else
        lbProducaoLiquida.caption := '0,00';
  end
  else
     lbProducaoLiquida.caption := '0,00';

  TotalDescontado := TotalDescontado +  lbDesconto.Value.dblResult;
end;

procedure TFormRelProducaoAcumuladaResumido.QuickRep1BeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  TotalSalario    := 0;
  //TotalLiquido    := 0;
  TotalDescontado := 0;
end;

procedure TFormRelProducaoAcumuladaResumido.SummaryBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  //lbTotalSalario.caption := formatFloat(',0.00;', TotalSalario );
  lbTotalLiquido.caption := formatFloat(',0.00;', TotalLiquido );
  //lbTotalDescontado.caption := formatFloat(',0.00;', TotalDescontado );
end;

end.
