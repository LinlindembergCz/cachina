unit MapaObraAgora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.DBCtrls,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.DBCGrids, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, ControllerTabelas, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.ComCtrls, strUtils, ControllerDiarioAtividade;

type
  TFormMapaDaObra = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBCtrlGrid1: TDBCtrlGrid;
    img2: TImage;
    DBText1: TDBText;
    DBCtrlGrid3: TDBCtrlGrid;
    img3: TImage;
    DBText3: TDBText;
    DBCtrlGrid4: TDBCtrlGrid;
    img4: TImage;
    DBText4: TDBText;
    DBCtrlGrid5: TDBCtrlGrid;
    img5: TImage;
    DBText5: TDBText;
    DBCtrlGrid6: TDBCtrlGrid;
    img6: TImage;
    DBText6: TDBText;
    DBCtrlGrid7: TDBCtrlGrid;
    img7: TImage;
    DBText7: TDBText;
    DBCtrlGrid8: TDBCtrlGrid;
    img8: TImage;
    DBText8: TDBText;
    DBCtrlGrid9: TDBCtrlGrid;
    img9: TImage;
    DBText9: TDBText;
    DBCtrlGrid10: TDBCtrlGrid;
    img10: TImage;
    DBText10: TDBText;
    DBCtrlGrid11: TDBCtrlGrid;
    img11: TImage;
    DBText11: TDBText;
    DBCtrlGrid12: TDBCtrlGrid;
    img12: TImage;
    DBText12: TDBText;
    DBCtrlGrid13: TDBCtrlGrid;
    img13: TImage;
    DBText13: TDBText;
    DataSource1: TDataSource;
    Fila2: TClientDataSet;
    Fila2Unidade: TStringField;
    Fila2Numero: TIntegerField;
    DataSource2: TDataSource;
    Fila3: TClientDataSet;
    Fila3Unidade: TStringField;
    Fila3Numero: TIntegerField;
    DataSource3: TDataSource;
    Fila6: TClientDataSet;
    Fila6Unidade: TStringField;
    Fila6Numero: TIntegerField;
    DataSource6: TDataSource;
    DataSource7: TDataSource;
    Fila7: TClientDataSet;
    Fila7Unidade: TStringField;
    Fila7Numero: TIntegerField;
    Fila8: TClientDataSet;
    Fila8Unidade: TStringField;
    Fila8Numero: TIntegerField;
    DataSource8: TDataSource;
    DataSource9: TDataSource;
    Fila9: TClientDataSet;
    Fila9Unidade: TStringField;
    Fila9Numero: TIntegerField;
    DataSource10: TDataSource;
    Fila10: TClientDataSet;
    Fila10Unidade: TStringField;
    Fila10Numero: TIntegerField;
    Fila11: TClientDataSet;
    Fila11Unidade: TStringField;
    Fila11Numero: TIntegerField;
    DataSource11: TDataSource;
    DataSource12: TDataSource;
    Fila12: TClientDataSet;
    Fila12Unidade: TStringField;
    Fila12Numero: TIntegerField;
    DataSource5: TDataSource;
    DataSource4: TDataSource;
    Fila4: TClientDataSet;
    Fila4Unidade: TStringField;
    Fila4Numero: TIntegerField;
    Fila5: TClientDataSet;
    Fila5Unidade: TStringField;
    Fila5Numero: TIntegerField;
    DataSource13: TDataSource;
    Fila13: TClientDataSet;
    Fila13Unidade: TStringField;
    Fila13Numero: TIntegerField;
    pnlDetalhes: TPanel;
    DBGrid1: TDBGrid;
    srcAtividades: TDataSource;
    imgLivre: TImage;
    imgOcupada: TImage;
    imgPronta: TImage;
    SpeedButton1: TSpeedButton;
    Shape1: TShape;
    Shape3: TShape;
    Shape6: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape2: TShape;
    Fila1: TClientDataSet;
    Fila1Unidade: TStringField;
    Fila1Numero: TIntegerField;
    Fila1Atividades: TIntegerField;
    Panel2: TPanel;
    cboCodigoSubfase: TComboBox;
    Label9: TLabel;
    BitBtn1: TBitBtn;
    ImgAndamento: TImage;
    grpEstrutura: TGroupBox;
    trServico: TTreeView;
    SpeedButton2: TSpeedButton;
    BitBtn2: TBitBtn;
    DBCtrlGrid2: TDBCtrlGrid;
    img1: TImage;
    DBText2: TDBText;
    procedure DBCtrlGrid2PaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBCtrlGrid2Enter(Sender: TObject);
    procedure DBCtrlGrid2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure trServicoDblClick(Sender: TObject);
    procedure cboCodigoSubfaseMouseEnter(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    Controller  : TControllerTabelas;
    DataSetUnidades:TDataset;
    ControllerDiarioAtividade: TControllerDiarioAtividade;
    procedure CarregarMapaDaObra(CodigoAtividade: string = '');
    procedure AtualizarTreeView;
    function GetServico: String;
    procedure CAPTURATELA(SALVAR_JPG: boolean; ONDE_SALVAR: STRING);

    { Private declarations }
  public
    { Public declarations }
  end;

   PEtapa = ^TEtapa;
  TEtapa = Record
    Codigo: string;
  end;

  PFase = ^TFase;
  TFase = Record
    Codigo: string;
    CodigoEtapa: string;
  end;

  PSubFase = ^TSubFase;
  TSubFase = Record
    Codigo : string;
    CodigoEtapa: string;
    CodigoFase: string;
  end;

var
  FormMapaDaObra: TFormMapaDaObra;
    CodigoEtapa   : string;
  CodigoFase    : string;
  CodigoSubFase : string;
implementation

{$R *.dfm}

uses DBUtils, RelMapaDaObra;

procedure TFormMapaDaObra.FormActivate(Sender: TObject);
begin
  application.processmessages;
  Controller := TControllerTabelas.Create;
  ControllerDiarioAtividade:= TControllerDiarioAtividade.create;
  //CarregarMapaDaObra;
end;

procedure TFormMapaDaObra.FormCreate(Sender: TObject);
begin
 FillCombobox('SubFase T1 inner join Fase on fase.Codigo = CodigoFase  inner join Etapa on Etapa.Codigo = CodigoEtapa',
              cboCodigoSubfase,
              'Etapa.Descricao = ''MEDITERRANEO''',
              'Codigo', 'Descricao');
 AtualizarTreeView;
end;

procedure TFormMapaDaObra.SpeedButton1Click(Sender: TObject);
begin
  pnlDetalhes.visible := false;
end;

procedure TFormMapaDaObra.SpeedButton2Click(Sender: TObject);
begin
  grpEstrutura.visible:= false
end;

procedure TFormMapaDaObra.trServicoDblClick(Sender: TObject);
var
  CodigoServico: string;
begin
  CodigoServico := GetServico;
  if strtoint(CodigoServico) > 0  then
     cboCodigoSubfase.ItemIndex:= cboCodigoSubfase.Items.IndexOfObject(TObject(strtoint(CodigoServico)));
  grpEstrutura.visible:= false
end;

function TFormMapaDaObra.GetServico:String;
var
  Data: Pointer;
  Level: Integer;
begin
  if trServico.Items.Count > 0 then
  begin
    Data := trServico.Selected.Data;
    if Data <> nil then
    begin
      Level := trServico.Selected.Level;
      case Level of
        0:
          CodigoEtapa := PEtapa(Data).Codigo;
        1:
          begin
            CodigoFase := PFase(Data).Codigo;
            CodigoEtapa := PFase(Data).CodigoEtapa;
          end;
        2:
          begin
            CodigoSubFase := PSubFase(Data).Codigo;
            CodigoFase := PSubFase(Data).CodigoFase;
            CodigoEtapa := PSubFase(Data).CodigoEtapa;
            result := CodigoSubFase;
          end;
      end;
    end;
  end;
end;

procedure TFormMapaDaObra.BitBtn1Click(Sender: TObject);
begin
  CarregarMapaDaObra( inttostr(
     Integer(cboCodigoSubfase.Items.Objects[cboCodigoSubfase.ItemIndex]) ) );
end;



procedure TFormMapaDaObra.CarregarMapaDaObra(CodigoAtividade: string = '');

var
  DataSetUnidade: TDataset;

  procedure Popular(DataSet: TDataset;
                    Inicio ,
                    Count  : integer;
                    Crescente: boolean = false );
  var
    I: Integer;
  begin
    TClientDataSet(DataSet).close;
    TClientDataSet(DataSet).CreateDataSet;

    DataSet.disablecontrols;
    for I := 0 to Count do
    begin
      DataSet.append;
      if Crescente  then
        DataSet.fieldbyname('Unidade').asstring := 'UH '+ ifthen( Inicio+i < 10 ,
                                                          Formatfloat('00', Inicio+i), inttostr(Inicio+i) )
      else
        DataSet.fieldbyname('Unidade').asstring := 'UH '+ ifthen( Inicio-i < 10 ,
                                                          Formatfloat('00', Inicio-i), inttostr(Inicio-i) );

      DataSet.fieldbyname('Numero').asstring:= '0';
      if DataSetUnidade.locate('Descricao', DataSet.fieldbyname('Unidade').asstring,[] ) then
      begin
         DataSet.fieldbyname('Numero').asstring      := DataSetUnidade.fieldbyname('Codigo').asstring;
         DataSet.fieldbyname('Atividades').asstring  := DataSetUnidade.FieldByName('Atividades').asstring;
         DataSet.fieldbyname('Apontamento').asstring := DataSetUnidade.FieldByName('Apontamento').asstring;
      end;
      DataSet.post;

    end;
    DataSet.enablecontrols;
  end;
begin
  DataSetUnidade:= Controller.GetSelect('ImovelUnidade T1 ',
                                        '0=0',
                                        ' T1.*, ( Select Count(Distinct CodigoSubFase) from ItemDiarioAtividade where '+
                                        ' CodigoUnidade = T1.Codigo '+ ifthen(CodigoAtividade <> '',
                                        ' and CodigoSubFase='+ CodigoAtividade , '') +' ) as Atividades , '+
                                        ' (select SUM(ISNULL(Apontamento,0)) From ItemDiarioAtividade where '+
                                        ' CodigoUnidade = T1.Codigo'+ ifthen(CodigoAtividade <> '',
                                        ' and CodigoSubFase='+ CodigoAtividade , '') +' ) as Apontamento');

  Popular( Fila1,  115, 26);
  Popular( Fila2,  88, 12);
  Popular( Fila3,  63, 12);
  Popular( Fila4,  75, 11);
  Popular( Fila5,  50, 11);

  Popular( Fila6,  1, 3, true);
  Popular( Fila7,  5, 4, true);
  Popular( Fila8,  14, 4);
  Popular( Fila9,  19, 4);
  Popular( Fila10,  20, 4,true);
  Popular( Fila11,  25, 4, true);
  Popular( Fila12,  34, 4);
  Popular( Fila13,  38, 3);
end;

procedure TFormMapaDaObra.cboCodigoSubfaseMouseEnter(Sender: TObject);
begin
   grpEstrutura.visible:= true;
end;

procedure TFormMapaDaObra.DBCtrlGrid2Click(Sender: TObject);

  procedure ConsultarUnidade(Numero: string);
  var
    CodigoAtividade: string;
  begin
    if cboCodigoSubfase.ItemIndex > -1 then
       CodigoAtividade := inttostr(Integer(cboCodigoSubfase.Items.Objects[cboCodigoSubfase.ItemIndex]));

    srcAtividades.dataset:= ControllerDiarioAtividade.GetSelect ('ImovelUnidade T1 '+
                         ' inner join ItemDiarioAtividade ite on  T1.Codigo = ite.CodigoUnidade '+
                         ' inner join DiarioAtividade dia on dia.Codigo = ite.CodigoDiarioAtividade '+
                         ' inner join SubFase sub on ite.CodigoSubFase = sub.Codigo'+
                         ' inner join Equipe eq on eq.Codigo = ite.CodigoEquipe',
                         ' ite.CodigoUnidade='+ quotedstr( Numero)+
                         ' order by dia.Data, eq.Descricao, ite.CodigoSubFase, sub.Descricao' ,
                         ' T1.Codigo as CodigoUnidade, eq.Descricao as Equipe,'+
                         ' dia.Data , sub.Descricao as Atividade, ite.CodigoSubFase, ISNULL(ite.Apontamento,0) as Apontamento' );

  end;
var
  DataSet:TDataSet;
begin
  application.processmessages;
  pnlDetalhes.visible:= true;
  case TImage(Sender).tag of
    1:  ConsultarUnidade(DataSource1.DataSet.fieldbyname('Numero').asstring);
    2:  ConsultarUnidade(DataSource2.DataSet.fieldbyname('Numero').asstring);
    3:  ConsultarUnidade(DataSource3.DataSet.fieldbyname('Numero').asstring);
    4:  ConsultarUnidade(DataSource4.DataSet.fieldbyname('Numero').asstring);
    5:  ConsultarUnidade(DataSource5.DataSet.fieldbyname('Numero').asstring);
    6:  ConsultarUnidade(DataSource6.DataSet.fieldbyname('Numero').asstring);
    7:  ConsultarUnidade(DataSource7.DataSet.fieldbyname('Numero').asstring);
    8:  ConsultarUnidade(DataSource8.DataSet.fieldbyname('Numero').asstring);
    9:  ConsultarUnidade(DataSource9.DataSet.fieldbyname('Numero').asstring);
    10: ConsultarUnidade(DataSource10.DataSet.fieldbyname('Numero').asstring);
    11: ConsultarUnidade(DataSource11.DataSet.fieldbyname('Numero').asstring);
    12: ConsultarUnidade(DataSource12.DataSet.fieldbyname('Numero').asstring);
    13: ConsultarUnidade(DataSource13.DataSet.fieldbyname('Numero').asstring);
  end;
  SetScrollRange(TDBCtrlGrid(Sender).Handle, SB_HORZ, 0, 0, False);
  SetScrollRange(TDBCtrlGrid(Sender).Handle, SB_VERT, 0, 0, False);

end;

procedure TFormMapaDaObra.DBCtrlGrid2Enter(Sender: TObject);
begin
  case TImage(Sender).tag of
      1..5 :
      begin
         pnlDetalhes.left := TDBCtrlGrid(Sender).left+TDBCtrlGrid(Sender).height;
         pnlDetalhes.top := TDBCtrlGrid(Sender).top+TDBCtrlGrid(Sender).height;
      end;
      6..9 :
      begin
         pnlDetalhes.left :=  TDBCtrlGrid(Sender).left+TDBCtrlGrid(Sender).width;
         pnlDetalhes.top := TDBCtrlGrid(Sender).top+TDBCtrlGrid(Sender).width;
      end
      else
      begin
         pnlDetalhes.left :=  TDBCtrlGrid(Sender).left - pnlDetalhes.width;
         pnlDetalhes.top := TDBCtrlGrid(Sender).top+TDBCtrlGrid(Sender).width;
      end

  end;
  SetScrollRange(TDBCtrlGrid(Sender).Handle, SB_HORZ, 0, 0, False);
  SetScrollRange(TDBCtrlGrid(Sender).Handle, SB_VERT, 0, 0, False);
end;

procedure TFormMapaDaObra.DBCtrlGrid2PaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
  procedure CarregarCasa(Image:TImage);
  begin
      if (DBCtrlGrid.DataSource.DataSet.FieldByName('Atividades').AsInteger > 0)  and
         (DBCtrlGrid.DataSource.DataSet.FieldByName('Apontamento').AsInteger >= 100)  then
         Image.Picture:= imgOcupada.Picture
      else
      if (DBCtrlGrid.DataSource.DataSet.FieldByName('Atividades').AsInteger > 0) and
         (DBCtrlGrid.DataSource.DataSet.FieldByName('Apontamento').AsInteger < 100) then
      begin
          Image.Picture:= ImgAndamento.Picture
      end
      else
          Image.Picture := imgLivre.Picture;

      DBCtrlGrid.Canvas.Draw(Image.left,Image.top ,Image.Picture.Graphic);
    end;
begin
  //Oculta a barra de rolagem
  case DBCtrlGrid.tag of
    1: CarregarCasa(img1);
    2: CarregarCasa(img2);
    3: CarregarCasa(img3);
    4: CarregarCasa(img4);
    5: CarregarCasa(img5);
    6: CarregarCasa(img6);
    7: CarregarCasa(img7);
    8: CarregarCasa(img8);
    9: CarregarCasa(img9);
    10: CarregarCasa(img10);
    11: CarregarCasa(img11);
    12: CarregarCasa(img12);
    13: CarregarCasa(img13);
  end;
  SetScrollRange(DBCtrlGrid.Handle, SB_HORZ, 0, 0, False);
  SetScrollRange(DBCtrlGrid.Handle, SB_VERT, 0, 0, False);
end;

procedure TFormMapaDaObra.AtualizarTreeView;
var
  DescricaoEtapa   ,
  DescricaoFase    ,
  DescricaoSubFase : string;

  ListaEtapa    ,
  ListaFase     : TStringList;
  NoEtapa       : TTreeNode;
  NoFase        : TTreeNode;

  ObjectEtapa   : PEtapa;
  ObjectFase    : PFase;
  ObjectSubFase : PSubFase;

  DataSetSubFase: TDataSet;

const
  TabelaSubFase = ' SubFase T1 '+
           ' left join Fase on T1.CodigoFase = Fase.Codigo '+
           ' left join Etapa Etapa  on Fase.CodigoEtapa = Etapa.Codigo';

  CamposSubFase = ' Etapa.Codificacao as CodificacaoEtapa, '+
                  ' Etapa.Descricao as DescricaoEtapa, '+
                  ' Etapa.Codigo as CodigoEtapa,'+
                  ' Fase.Codificacao as CodificacaoFase, '+
                  ' Fase.Descricao as DescricaoFase, '+
                  ' Fase.Codigo as CodigoFase,'+
                  ' T1.Codigo, T1.Codificacao , T1.Descricao , T1.CodigoFase';

  CondicaoSubFase = 'Etapa.Descricao = ''MEDITERRANEO'' order by Etapa.Codigo, Fase.Codigo, T1.Codigo';
begin
  try
     DataSetSubFase := Controller.GetSelect(TabelaSubFase, CondicaoSubFase , CamposSubFase);

     TClientDataset(DataSetSubFase).IndexFieldNames:= 'CodigoEtapa;CodigoFase;Codigo';


     trServico.Items.clear;
     ListaEtapa := TStringList.create;
     ListaFase  := TStringList.create;

     DataSetSubFase.first;

     while not DataSetSubFase.eof do
     begin
       DescricaoEtapa   := trim(DataSetSubFase.fieldByName('DescricaoEtapa').AsString);
       DescricaoFase    := DataSetSubFase.fieldByName('DescricaoFase').AsString;
       DescricaoSubFase := DataSetSubFase.fieldByName('Descricao').AsString;

       if (ListaEtapa.IndexOf(DescricaoEtapa) = -1) and (DescricaoEtapa <> '') then
       begin
         NEW(ObjectEtapa);
         ObjectEtapa^.Codigo := DataSetSubFase.fieldByName('CodigoEtapa').AsString;

         NoEtapa := trServico.Items.AddObject( nil, DescricaoEtapa, ObjectEtapa);
         ListaEtapa.add(DescricaoEtapa);
         NoEtapa.Collapse(false);
       end;

       if (ListaFase.IndexOf(DescricaoFase) = -1) and (DescricaoFase <> '') then
       begin
         NEW(ObjectFase);
         ObjectFase^.Codigo := DataSetSubFase.fieldByName('CodigoFase').AsString;
         ObjectFase^.CodigoEtapa := DataSetSubFase.fieldByName('CodigoEtapa').AsString;

         NoFase := trServico.Items.AddChildObject(NoEtapa, DescricaoFase , ObjectFase );
         ListaFase.add(DescricaoFase);
         NoFase.Collapse(false);
       end;

       if DescricaoSubFase <> '' then
       begin
         NEW(ObjectSubFase);
         ObjectSubFase^.Codigo      := DataSetSubFase.fieldByName('Codigo').AsString;
         ObjectSubFase^.CodigoEtapa := DataSetSubFase.fieldByName('CodigoEtapa').AsString;
         ObjectSubFase^.CodigoFase  := DataSetSubFase.fieldByName('CodigoFase').AsString;
         trServico.Items.AddChildObject(NoFase, DescricaoSubFase , ObjectSubFase );
       end;
       DataSetSubFase.next;
     end;
     CodigoEtapa   := '';
     CodigoFase    := '';
     CodigoSubFase := '';
  finally
     ListaEtapa.free;
  end;
end;

procedure TFormMapaDaObra.BitBtn2Click(Sender: TObject);
begin
  grpEstrutura.visible := false;
  pnlDetalhes.visible := false;
  application.processmessages;
  CAPTURATELA(true, ExtractFilepath(application.exename) + '\mapa.jpg' );
  application.CreateForm(TFormRelMapaDaObra, FormRelMapaDaObra);
  FormRelMapaDaObra.lbAtividade.caption := cboCodigoSubfase.text;
  FormRelMapaDaObra.QuickRep1.PreviewModal;
  FormRelMapaDaObra.free;
end;

PROCEDURE TFormMapaDaObra.CAPTURATELA(SALVAR_JPG: boolean; ONDE_SALVAR: STRING);
VAR
   DC: HDC;
   TelaBitmap: Tbitmap;
   TELAJPG: TJPEGImage;
BEGIN
   DC:= GetDC (getDesktopWindow);
   TelaBitmap:= TBitmap.Create;
   try
      TelaBitmap.width  := shape1.Width;
      TelaBitmap.Height := shape1.height;
      BitBlt(TelaBitmap.Canvas.Handle,
             0,
             0,
             shape1.Width,
             shape1.height,
             DC,
             shape1.Left,
             shape1.top + 60 ,SRCCOPY);
   finally
      ReleaseDC (GetDeskTopWindow,DC);
   end;

   if SALVAR_JPG then
   begin
      TELAJPG := TJpegImage.Create;
      TELAJPG.Assign(TelaBitmap);
      TELAJPG.CompressionQuality := 90;
      TELAJPG.JpegNeeded;
      TELAJPG.SavetoFile(ONDE_SALVAR);
      TELAJPG.Destroy;
   end
   else
      TelaBitmap.SaveToFile(ONDE_SALVAR);
END;




end.

{
Quantitativos
Cronograma
QUADRO RESUMO
Relatorio de indicativo de produtividade

}
