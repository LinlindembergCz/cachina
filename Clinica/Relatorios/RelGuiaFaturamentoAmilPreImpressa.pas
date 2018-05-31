unit RelGuiaFaturamentoAmilPreImpressa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QRCtrls, qrpctrls, Vcl.Imaging.pngimage,
  QuickRpt, Vcl.ExtCtrls, QRPDFFilt,DBClient;

type
  TFormRelGuiaFaturamentoAmilPreImpressa = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel2: TQRPDBText;
    QRLabel3: TQRPDBText;
    QRLabel5: TQRPDBText;
    QRLabel16: TQRPDBText;
    QRLabel17: TQRPDBText;
    QRLabel10: TQRPDBText;
    QRLabel11: TQRPDBText;
    QRPDBText5: TQRPDBText;
    QRLabel4: TQRPDBText;
    QRLabel1: TQRPDBText;
    QRLabel7: TQRPDBText;
    QRLabel8: TQRLabel;
    QRLabel14: TQRPDBText;
    QRMemo1: TQRMemo;
    QRLabel13: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel25: TQRPDBText;
    QRLabel22: TQRPDBText;
    QRLabel23: TQRPDBText;
    QRLabel24: TQRPDBText;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    QRPDFFilter1: TQRPDFFilter;
    lbNumeroRegistroANS: TQRLabel;
    QRMemo4: TQRMemo;
    QRPDBText1: TQRPDBText;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    FRegistroANS: string;
    procedure SetRegistroANS(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property RegistroANS : string read FRegistroANS write SetRegistroANS;
  end;

var
  FormRelGuiaFaturamentoAmilPreImpressa: TFormRelGuiaFaturamentoAmilPreImpressa;

implementation

uses ModuloAgenda;

{$R *.dfm}

procedure TFormRelGuiaFaturamentoAmilPreImpressa.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  Data: string;
  Datas:TStringList;
   I:integer;
begin
  lbNumeroRegistroANS.Caption := RegistroANS;

  Datas:=TStringList.Create;
  with DataModuleConsultaAgenda do
  begin
     QRMemo1.Lines.Clear;
     QRMemo2.Lines.Clear;
     QRMemo3.Lines.Clear;
     QRMemo4.Lines.Clear;

     if not ClientDataSet2.IsEmpty then
     begin
       ClientDataSet2.First;
       while not ClientDataSet2.Eof do
       begin
         data := ClientDataSet2.FieldByName('Data').asstring;
         Datas.Add(Data);
         ClientDataSet2.Next;
       end;

       Datas.Sort;

       for I := 0 to datas.count-1 do
       begin
          data := datas.Strings[i];
          QRMemo1.Lines.Add(data);
          if QRMemo2.Lines.Count < 2 then
             QRMemo2.Lines.Add(data)
          else
          if QRMemo3.Lines.Count < 2 then
             QRMemo3.Lines.Add(data)
          else
             QRMemo4.Lines.Add(data);
       end;
     end
     else
     begin
       QRMemo1.Lines.Add(ClientDataSet1Data.AsString);
       QRMemo2.Lines.Add(ClientDataSet1Data.AsString);
       QRMemo3.Lines.Clear;
       QRMemo4.Lines.Clear;
     end;
  end;
  Datas.Free;

end;

procedure TFormRelGuiaFaturamentoAmilPreImpressa.SetRegistroANS(
  const Value: string);
begin
  FRegistroANS := Value;
end;

end.
