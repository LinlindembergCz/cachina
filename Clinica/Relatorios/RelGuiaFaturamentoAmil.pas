unit RelGuiaFaturamentoAmil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, QuickRpt, QRCtrls, ExtCtrls, WideStrings, DBXFirebird, FMTBcd,
  QRWebFilt, QRExport, QRPDFFilt, DB, SqlExpr, DBClient, Provider, qrpctrls,
  Vcl.Imaging.pngimage;

type
  TFormRelGuiaFaturamento = class(TForm)
    QuickRep1: TQuickRep;
    QRPDFFilter1: TQRPDFFilter;
    DetailBand1: TQRBand;
    QRLabel3: TQRPDBText;
    QRLabel4: TQRPDBText;
    QRLabel10: TQRPDBText;
    QRLabel11: TQRPDBText;
    QRLabel12: TQRLabel;
    QRLabel15: TQRPDBText;
    QRLabel14: TQRPDBText;
    QRLabel18: TQRPDBText;
    QRLabel27: TQRLabel;
    QRPDBText1: TQRPDBText;
    QRLabel9: TQRLabel;
    QRLabel25: TQRPDBText;
    QRLabel22: TQRPDBText;
    QRLabel23: TQRPDBText;
    QRLabel24: TQRPDBText;
    QRLabel13: TQRLabel;
    QRLabel19: TQRLabel;
    QRMemo1: TQRMemo;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    QRMemo4: TQRMemo;
    QRLabel6: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel16: TQRLabel;
    QRPDBText8: TQRPDBText;
    QRLabel2: TQRPDBText;
    QRLabel1: TQRPDBText;
    QRPDBText2: TQRPDBText;
    QRLabel5: TQRPDBText;
    QRLabel17: TQRPDBText;
    QRLabel21: TQRLabel;
    QRLabel7: TQRPDBText;
    QRLabel8: TQRLabel;
    QRLabel26: TQRLabel;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelGuiaFaturamento: TFormRelGuiaFaturamento;


implementation

uses ModuloAgenda;

{$R *.dfm}

procedure TFormRelGuiaFaturamento.DetailBand1BeforePrint(Sender: TQRCustomBand;
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
