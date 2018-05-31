unit RelGuiaFaturamentoAmil1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QRCtrls, QuickRpt, qrpctrls,
  Vcl.ExtCtrls, DBClient;

type
  TFormRelGuiaFaturamentoAmil1 = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRPDBText4: TQRPDBText;
    QRPDBText5: TQRPDBText;
    QRLabel2: TQRPDBText;
    QRLabel1: TQRPDBText;
    QRLabel3: TQRPDBText;
    QRLabel4: TQRPDBText;
    QRLabel5: TQRPDBText;
    QRLabel7: TQRPDBText;
    QRLabel8: TQRLabel;
    QRLabel10: TQRPDBText;
    QRLabel11: TQRPDBText;
    QRLabel12: TQRLabel;
    QRLabel15: TQRPDBText;
    QRLabel14: TQRPDBText;
    QRLabel16: TQRPDBText;
    QRLabel17: TQRPDBText;
    QRLabel18: TQRPDBText;
    QRLabel27: TQRLabel;
    QRPDBText1: TQRPDBText;
    QRPDBText2: TQRPDBText;
    QRLabel9: TQRLabel;
    QRLabel25: TQRPDBText;
    QRLabel22: TQRPDBText;
    QRLabel23: TQRPDBText;
    QRLabel24: TQRPDBText;
    QRLabel13: TQRLabel;
    QRLabel19: TQRLabel;
    QRExpr3: TQRPDBText;
    QRPDBText3: TQRPDBText;
    QRMemo1: TQRMemo;
    QRPDBText6: TQRPDBText;
    QRPDBText7: TQRPDBText;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    QRMemo4: TQRMemo;
    QRPDBText8: TQRPDBText;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelGuiaFaturamentoAmil1: TFormRelGuiaFaturamentoAmil1;

implementation

uses ModuloAgenda;

{$R *.dfm}

procedure TFormRelGuiaFaturamentoAmil1.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  Data: string;
  ClientDataSet: TClientDataSet;
  Datas:TStringList;
   I:integer;
begin
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

end.
