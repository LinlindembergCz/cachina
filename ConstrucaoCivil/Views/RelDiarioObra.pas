unit RelDiarioObra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QRPDFFilt, Data.DB, QRExport,
  Datasnap.DBClient, QuickRpt, QRCtrls, Vcl.ExtCtrls;

type
  TFormRelDiarioObra = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel2: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand1: TQRBand;
    cdsDiarioObra: TClientDataSet;
    QRExcelFilter1: TQRExcelFilter;
    DataSource1: TDataSource;
    QRPDFFilter1: TQRPDFFilter;
    cdsItemDiarioObra: TClientDataSet;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    lbFiltro: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText12: TQRDBText;
    memoResumoCargos: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText11: TQRDBText;
    QRShape1: TQRShape;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelDiarioObra: TFormRelDiarioObra;

implementation

{$R *.dfm}

procedure TFormRelDiarioObra.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  cdsItemDiarioObra.filtered:= false;
  cdsItemDiarioObra.filter := 'CodigoDiarioAtividade='+ cdsDiarioObra.fieldbyname('Codigo').asstring;
  cdsItemDiarioObra.filtered:= true;
end;

end.
