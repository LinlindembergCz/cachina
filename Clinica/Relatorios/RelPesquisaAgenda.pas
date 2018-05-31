unit RelPesquisaAgenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QRExport, QuickRpt, QRCtrls,
  Vcl.ExtCtrls, qrpctrls;

type
  TFormRelPesquisaAgenda = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRExcelFilter1: TQRExcelFilter;
    TitleBand1: TQRBand;
    QRPLabel1: TQRPLabel;
    QRPLabel2: TQRPLabel;
    QRPLabel3: TQRPLabel;
    QRPLabel4: TQRPLabel;
    QRPLabel5: TQRPLabel;
    QRPLabel6: TQRPLabel;
    QRPLabel7: TQRPLabel;
    QRPLabel8: TQRPLabel;
    QRPLabel9: TQRPLabel;
    QRPLabel10: TQRPLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelPesquisaAgenda: TFormRelPesquisaAgenda;

implementation

{$R *.dfm}

uses ModuloAgenda;

end.
