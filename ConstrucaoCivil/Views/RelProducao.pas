unit RelProducao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QRCtrls, QuickRpt, QRPDFFilt, QRExport,
  Data.DB, Datasnap.DBClient, Vcl.ExtCtrls;

type
  TFormRelProducao = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    cdsProducao: TClientDataSet;
    QRExcelFilter1: TQRExcelFilter;
    QRPDFFilter1: TQRPDFFilter;
    DetailBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    SummaryBand1: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel2: TQRLabel;
    lbFiltro: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelProducao: TFormRelProducao;

implementation

{$R *.dfm}

end.

{
 Select
func.Nome,
T1.Data,
un.Descricao as DescricaoUH,
eq.Descricao as DescricaoEquipe,
sub.Descricao as DescricaoServico,
Apontamento ,
cast( sub.Valor as Numeric(10,2)) as ValorServico,
sub.Valor * ( Select Participacao from ItemEquipe
              where
              Codigo = ieq.Codigo ) / 100
from
ItemDiarioAtividade T2
inner join DiarioAtividade T1 on CodigoDiarioAtividade = T1.Codigo
inner join Equipe eq on eq.Codigo = T2.CodigoEquipe
inner join ItemEquipe ieq on  ieq.CodigoEquipe = eq.Codigo
inner join Funcionarios func on func.Codigo = ieq.CodigoFuncionario
inner join SubFase sub on sub.Codigo = T2.CodigoSubFase
inner join Fase on fase.Codigo = sub.CodigoFase
inner join ImovelUnidade un on un.Codigo = T2.CodigoUnidade
inner join UnidadeMedida unid on unid.Codigo = sub.CodigoUnidade
where
MONTH(T1.Data) = 7 and Apontamento = 100 and T2.Status= 'Aprovado' and eq.Status = 'S'
order by
func.Nome, T1.Data, un.Descricao,eq.Descricao

}
