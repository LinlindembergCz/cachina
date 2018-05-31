unit RelFichaPaciente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QRCtrls, qrpctrls, QuickRpt,
  Vcl.ExtCtrls, DB;

type
  TFormRelFichaPacinte = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRPShape1: TQRPShape;
    QRPShape2: TQRPShape;
    QRPShape3: TQRPShape;
    QRPShape4: TQRPShape;
    QRPShape7: TQRPShape;
    QRPShape8: TQRPShape;
    QRPShape9: TQRPShape;
    QRPShape10: TQRPShape;
    QRPShape13: TQRPShape;
    QRPShape14: TQRPShape;
    QRPShape15: TQRPShape;
    QRPShape16: TQRPShape;
    QRDBText6: TQRDBText;
    QRDBText17: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel8: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRPShape5: TQRPShape;
    QRLabel20: TQRLabel;
    QRPShape6: TQRPShape;
    QRDBText20: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel6: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    FDataSet: TDataSet;
    procedure SetDataSet(const Value: TDataSet);
    procedure ConfigurarDataSet( Value: TDataSet );
    { Private declarations }
  public
    { Public declarations }
    property DataSet:TDataSet read FDataSet write SetDataSet;
  end;

var
  FormRelFichaPacinte: TFormRelFichaPacinte;

implementation

{$R *.dfm}

procedure TFormRelFichaPacinte.ConfigurarDataSet(Value: TDataSet);
var
  I: Integer;
begin
  for I := 0 to Componentcount - 1 do
  begin
    if Components[i] is TQuickRep then
    begin
         ( Components[i] as TQuickRep).DataSet:= FDataSet;
    end
    else
    if Components[i] is TQrDBText then
    begin
         ( Components[i] as TQrDBText).DataSet:= FDataSet;
    end;
  end;
end;

procedure TFormRelFichaPacinte.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  ConfigurarDataSet(FDataSet);
end;

procedure TFormRelFichaPacinte.SetDataSet(const Value: TDataSet);
begin
  FDataSet := Value;
end;

end.
