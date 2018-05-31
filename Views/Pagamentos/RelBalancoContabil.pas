unit RelBalancoContabil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, QRCtrls,
  QuickRpt, Vcl.ExtCtrls;

type
  TFormRelBalancoContabil = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRImage1: TQRImage;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    lbTitulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRDBImage1: TQRDBImage;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    lbCondicao: TQRLabel;
    cdsBalanco: TClientDataSet;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelBalancoContabil: TFormRelBalancoContabil;

implementation

{$R *.dfm}

uses ControllerPagamento;

procedure TFormRelBalancoContabil.FormCreate(Sender: TObject);
var
  Controller:TControllerPagamento;
begin
    Controller:= TControllerPagamento.create;
    cdsBalanco.CloneCursor( TClientDataSet( Controller.GetBalancoContabil('0=0') )
                            ,true);
    Controller.free;
end;

end.
