unit DiarioAtvidadeDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TemplateDetalhesComTabGrid, GenericEntidade,
  Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Mapper, strUtils, DBClient, dateUtils, Vcl.Menus;

type
  TFormDiarioAtividadeDetalhes = class(TTemplateFormComTabGridDetalhes)
    gpbItens: TGroupBox;
    Label11: TLabel;
    btnAdicionar: TSpeedButton;
    CornerButton1: TSpeedButton;
    grdItens: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    cboCodigoEquipe: TComboBox;
    cboCodigoSubfase: TComboBox;
    srcItens: TDataSource;
    cboCodigoUnidadeImovel: TComboBox;
    edtObservacao: TEdit;
    Label9: TLabel;
    GroupBox1: TGroupBox;
    memoObservacao: TMemo;
    GroupBox2: TGroupBox;
    trServico: TTreeView;
    Label8: TLabel;
    dateInicio: TDateTimePicker;
    dateFim: TDateTimePicker;
    Label12: TLabel;
    cboObraPesquisa: TComboBox;
    Label14: TLabel;
    cboUnidadePesquisa: TComboBox;
    cboEquipePesquisa: TComboBox;
    Label10: TLabel;
    cboResponsavelPesquisa: TComboBox;
    Label16: TLabel;
    Label15: TLabel;
    Label13: TLabel;
    cboSubfasePesquisa: TComboBox;
    Button1: TButton;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    cboCodigoObra: TComboBox;
    Label4: TLabel;
    dateData: TDateTimePicker;
    Label5: TLabel;
    cboTempo: TComboBox;
    Label7: TLabel;
    cboCodigoFuncionario: TComboBox;
    PopupMenu1: TPopupMenu;
    DiariodeObra1: TMenuItem;
    Produo1: TMenuItem;
    ProduoResumido1: TMenuItem;
    Produo2: TMenuItem;
    ProduoAcumulada1: TMenuItem;
    Resumido1: TMenuItem;
    Detalhadao1: TMenuItem;
    Equipe1: TMenuItem;
    Equipe2: TMenuItem;
    Aprovado1: TMenuItem;
    Indiferente1: TMenuItem;
    Resumido2: TMenuItem;
    Detalhado1: TMenuItem;
    Equipe3: TMenuItem;
    PopupMenu2: TPopupMenu;
    Aprovartodasasatividaderelat1: TMenuItem;
    Reprovado1: TMenuItem;
    Resumido3: TMenuItem;
    Detalhado2: TMenuItem;
    porEquipe1: TMenuItem;
    ResumoEstatstico1: TMenuItem;
    Label6: TLabel;
    cboFuncionarioPesquisa: TComboBox;
    Acompanhamento1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure cboCodigoObraChange(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure trServicoDblClick(Sender: TObject);
    procedure CornerButton1Click(Sender: TObject);
    procedure grdItensCellClick(Column: TColumn);
    procedure btnPesquisarClick(Sender: TObject);
    procedure cboObraPesquisaChange(Sender: TObject);
    procedure DiariodeObra1Click(Sender: TObject);
    procedure Produo1Click(Sender: TObject);
    procedure ProduoResumido1Click(Sender: TObject);
    procedure Resumido1Click(Sender: TObject);
    procedure Detalhadao1Click(Sender: TObject);
    procedure Equipe2Click(Sender: TObject);
    procedure Aprovartodasasatividaderelat1Click(Sender: TObject);
    procedure ResumoEstatstico1Click(Sender: TObject);
    procedure Acompanhamento1Click(Sender: TObject);
  private
    { Private declarations }
    Filtro: string;
    ItemDiarioAtividade:TGenericEntidade;
    MapperItemDiarioAtividade   : TMapper;
    TabelaItem: string;
    procedure MapearItemDiarioAtividade;
    procedure SalvarItens(Codigo: string);
    procedure PersistirItemDiarioAtividade;
    procedure RefreshDataSetItem(Codigo: string ='');
    procedure AjustaTamanhoGrid;
    procedure AtualizarTreeView;
    function GetServico: String;
    procedure GetItemDiario;
    procedure VerificarApontamentos(CodigoDiarioAtividade: string);
    function MontaCondicaoAcumulada: string;
    procedure CarregarUnidades;
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


Const
 CamposItemDiarioObra = ' ite.*, eq.Descricao as DescricaoEquipe,'+
                        ' sub.Descricao as DescricaoServico,'+
                        ' un.Descricao as DescricaoUnidade, '+
                        ' unid.Descricao as DescricaoUnidadeMedida,'+
                        ' fase.Descricao as DescricaoFase';

var
  FormDiarioAtividadeDetalhes: TFormDiarioAtividadeDetalhes;
  CodigoEtapa   : string;
  CodigoFase    : string;
  CodigoSubFase : string;

implementation

{$R *.dfm}

uses ControllerTabelas, EntidadeFactory, DBUtils, Principal, RelDiarioObra,
  RelProducao, RelProducaoResumido, ControllerDiarioAtividade,
  RelProducaoAcumuladaDetalhada, RelProducaoAcumuladaResumido,
  RelProducaoAcumuladoPorEquipe, RelResumoEstatistico,
  AcompanhamentoDiarioAtvidadeDetalhes, Constantes;

procedure TFormDiarioAtividadeDetalhes.btnAdicionarClick(Sender: TObject);
begin
  inherited;
  PersistirItemDiarioAtividade;
end;

procedure TFormDiarioAtividadeDetalhes.PersistirItemDiarioAtividade;
var
  Count: Integer;
  Predecessora: string;
  LancouPredecessora:string;
begin
  with MapperItemDiarioAtividade do
  begin
    //MapperItemDiarioAtividade.GetValueEntidade('CodigoSubFase')
    //if edtOrdem.text = '' then
    begin
      if ItemDiarioAtividade  = nil  then
         Entidade := TEntidadeFactory.Criar(tpItemDiarioAtividade)
      else
         Entidade := ItemDiarioAtividade;
      DataSet := srcItens.DataSet;
    end;

    ComponentToEntidade;

    Predecessora := TControllerTabelas(Controller).GetValue('SubFase T1',
                    ' Codigo = '+ MapperItemDiarioAtividade.GetValueEntidade('CodigoSubFase')+' and Predecessora <> '''' ' ,
                    '(select top 1 Codigo from SubFase where Codificacao = T1.Predecessora ) as Predecessora' );
    if Predecessora  <> '' then
    begin
       Predecessora := TControllerTabelas(Controller).GetValue('ItemDiarioAtividade Item '+
                                                               ' inner join SubFase on Item.CodigoSubfase = SubFase.Codigo',
                                                               ' SubFase.Codigo = '+ Predecessora+
                                                               ' and Item.CodigoUnidade='+ MapperItemDiarioAtividade.GetValueEntidade('CodigoUnidade')
                                                              ,'SubFase.descricao' );
       if (Predecessora = '') and ( not srcItens.dataset.locate('DescricaoFase', Predecessora ,[]) ) then
       begin
         showmessage('Atividade predecessora pendente ('+
          TControllerTabelas(Controller).GetValue('SubFase T1',
                    ' Codigo = '+ MapperItemDiarioAtividade.GetValueEntidade('CodigoSubFase') ,
                    '(select top 1 Descricao from SubFase where Codificacao = T1.Predecessora) as Predecessora')+')' );
         abort;
       end;
    end;

    if srcItens.DataSet.locate('DescricaoUnidade;DescricaoEquipe;DescricaoServico',
                      varArrayOf( [cboCodigoUnidadeImovel.text,
                                   cboCodigoEquipe.text,
                                   cboCodigoSubfase.text ] ), [] ) then
       srcItens.DataSet.edit
    else
    begin
      srcItens.DataSet.append;
    end;

    SendEntidadeToDataSet;

    if srcItens.DataSet.state in [dsInsert] then
    begin
      Count := (srcItens.DataSet.RecordCount + 1) * (-1);
      SendValueToFieldEntidade('CodigoDiarioAtividade', '0');
      SendValueToFieldEntidade('Codigo', inttostr(Count));
    end;


    SendValueToFieldDataSet('DescricaoUnidade', cboCodigoUnidadeImovel.text );
    SendValueToFieldDataSet('DescricaoServico', cboCodigoSubfase.text );
    SendValueToFieldDataSet('DescricaoEquipe' , cboCodigoEquipe.text );
    SendValueToFieldDataSet('CodigoFilial' , '1' );

    srcItens.DataSet.fieldbyname('DescricaoFase').asstring :=
    TControllerTabelas(Controller).GetValue('Fase inner join SubFase on '+
                                            ' Fase.Codigo = CodigoFase',
                                            'SubFase.Codigo='+ MapperItemDiarioAtividade.GetValueEntidade('CodigoSubFase') ,
                                            'Fase.Descricao' );

    srcItens.DataSet.Post;


  end;
end;

procedure TFormDiarioAtividadeDetalhes.Produo1Click(Sender: TObject);
var
  DataSetProducao:TDataset;
begin
  inherited;
  application.CreateForm(TFormRelProducao,FormRelProducao );

  DataSetProducao := TControllerDiarioAtividade(Controller).GetProducao100(Condicao);

  FormRelProducao.cdsProducao.CloneCursor(
  TClientDataSet( DataSetProducao ), true);
  FormRelProducao.lbfiltro.caption:= Filtro;
  FormRelProducao.QuickRep1.PreviewModal;
  FormRelProducao.Free;

end;

procedure TFormDiarioAtividadeDetalhes.ProduoResumido1Click(Sender: TObject);
var
  DataSetProducao:TDataset;
begin
  inherited;
  application.CreateForm(TFormRelProducaoResumido,FormRelProducaoResumido );
  DataSetProducao := TControllerDiarioAtividade(Controller).GetProducao100(Condicao);
  FormRelProducaoResumido.cdsProducao.CloneCursor(
  TClientDataSet( DataSetProducao ), true);
  FormRelProducaoResumido.lbfiltro.caption:= Filtro;
  FormRelProducaoResumido.QuickRep1.PreviewModal;
  FormRelProducaoResumido.Free;

end;

procedure TFormDiarioAtividadeDetalhes.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if cboCodigoObra.text <> '' then
  begin
    CarregarUnidades;
  end;
  AjustaTamanhoGrid;
end;

procedure TFormDiarioAtividadeDetalhes.Acompanhamento1Click(Sender: TObject);
begin
  inherited;
  FormPrincipal.ShowForm(TFormAcompanhamentoDiarioAtvidadeDetalhes, nil, true);
end;

procedure TFormDiarioAtividadeDetalhes.AjustaTamanhoGrid;
begin
  if (Operacao = 'Update') or (Operacao = 'Insert') then
  begin
     grdItens.Height:= grdItens.Height - gpbItens.Height - 5;
     grdItens.top := grdItens.top + gpbItens.Height + 5;
     //if (Operacao = 'Insert') then
     //pnlEstrutura.visible:= true;
     srcItens.AutoEdit:= true;
  end
  else
  begin
     grdItens.Height:= grdItens.Height + gpbItens.Height + 5;
     grdItens.top :=  grdItens.top - gpbItens.Height - 5;
     //pnlEstrutura.visible:= false;
     srcItens.AutoEdit:= false;
  end;
end;

procedure TFormDiarioAtividadeDetalhes.btnCancelarClick(Sender: TObject);
begin
  inherited;
  AjustaTamanhoGrid;
end;

procedure TFormDiarioAtividadeDetalhes.btnConfirmarClick(Sender: TObject);
var
  Codigo: string;
begin
  if Operacao = opeInsert then
  begin
     Codigo := TControllerTabelas(Controller).GetMaxEntidade('DiarioAtividade');
     MapperEntidade.SendValueToFieldEntidade('Codigo', Codigo );
  end;
  Codigo := MapperEntidade.GetValueEntidade('Codigo');

  if Codigo = '' then
  begin
     showmessage('Valor do código do diario inconsistente, '+
     ' por favor entrar em contato com o desenvolvimento!');
     abort;
  end;

  VerificarApontamentos(Codigo);
  inherited;
  SalvarItens(Codigo);
  AjustaTamanhoGrid;
end;

procedure TFormDiarioAtividadeDetalhes.VerificarApontamentos(CodigoDiarioAtividade: string);
var
  Apontamento:Double;
begin
  srcItens.dataSet.first;
  while not srcItens.dataSet.eof do
  begin
    Apontamento := strtofloatDef( TControllerTabelas(Controller).GetValue('ItemDiarioAtividade',
                                  ' CodigoUnidade = '+ srcItens.dataSet.fieldbyname('CodigoUnidade').asstring +
                                  ' and '+
                                  ' CodigoSubFase = '+srcItens.dataSet.fieldbyname('CodigoSubFase').asstring+
                                  ' and '+
                                  ' CodigoDiarioAtividade <> '+CodigoDiarioAtividade,
                                  ' SUM(Apontamento) as Apontamento ') , 0);

    if Apontamento + srcItens.dataSet.fieldbyname('Apontamento').asfloat > 100 then
    begin
      showmessage('Valor apontado excedeu acima de 100%. Verificar '+
      srcItens.dataSet.fieldbyname('DescricaoUnidade').asstring +' - '+
      srcItens.dataSet.fieldbyname('DescricaoServico').asstring +' +'+
      floattostr( Apontamento +
      srcItens.dataSet.fieldbyname('Apontamento').asfloat - 100 )+'%' );
      abort;
    end;
    srcItens.dataSet.next;
  end;
end;

procedure TFormDiarioAtividadeDetalhes.btnInserirClick(Sender: TObject);
begin
  inherited;
  AjustaTamanhoGrid;
  dateData.date:= date;
  if FormPrincipal.CodigoPessoa <> '' then
  cboCodigoFuncionario.ItemIndex:= cboCodigoFuncionario.Items.IndexOfObject(
                             TObject(strtoInt(FormPrincipal.CodigoPessoa)));

  RefreshDataSetItem('0');

end;

procedure TFormDiarioAtividadeDetalhes.btnPesquisarClick(Sender: TObject);
begin
  Condicao := ' T1.Data >='+ quotedstr(Formatdatetime('DD/MM/YYYY', dateInicio.date))+'  and '+
              ' T1.Data <='+ quotedstr(Formatdatetime('DD/MM/YYYY', dateFim.date));

  Filtro:= 'Período de '+Formatdatetime('DD/MM/YYYY', dateInicio.date)+' até '+Formatdatetime('DD/MM/YYYY', dateFim.date)+#13;



  if cboObraPesquisa.text <> '' then
  begin
     Condicao :=  Condicao + ' and T1.CodigoObra ='+ quotedstr(inttostr( Integer(cboObraPesquisa.Items.Objects[cboObraPesquisa.ItemIndex]) ));
     Filtro:= Filtro+ 'Obra : '+ cboObraPesquisa.text+#13;
  end;

  if cboResponsavelPesquisa.text <> '' then
  begin
     Condicao :=  Condicao + ' and T1.CodigoFuncionario ='+ quotedstr(inttostr( Integer(cboResponsavelPesquisa.Items.Objects[cboResponsavelPesquisa.ItemIndex]) ));
     Filtro:= Filtro+ 'Responsável : '+ cboResponsavelPesquisa.text+#13;
  end;

  if cboUnidadePesquisa.text <> '' then
  begin
     Condicao :=   Condicao + ' and T1.Codigo IN (Select CodigoDiarioAtividade from ItemDiarioAtividade where CodigoUnidade='+ quotedstr(inttostr(
     Integer(cboUnidadePesquisa.Items.Objects[cboUnidadePesquisa.ItemIndex]) ))+')';
     Filtro:= Filtro+ 'Unidade : '+ cboUnidadePesquisa.text+#13;
  end;

  if cboEquipePesquisa.text <> '' then
  begin
     Condicao :=  Condicao + ' and T1.Codigo IN (Select CodigoDiarioAtividade from ItemDiarioAtividade where CodigoEquipe='+ quotedstr(inttostr(
     Integer(cboEquipePesquisa.Items.Objects[cboEquipePesquisa.ItemIndex]) ))+')';
     Filtro:= Filtro+ 'Equipe : '+ cboEquipePesquisa.text+#13;
  end;

    if cboSubfasePesquisa.text <> '' then
  begin
     Condicao :=  Condicao + ' and T1.Codigo IN (Select CodigoDiarioAtividade from ItemDiarioAtividade where CodigoSubFase='+ quotedstr(inttostr(
     Integer(cboSubfasePesquisa.Items.Objects[cboSubfasePesquisa.ItemIndex]) ))+')';
     Filtro:= Filtro+ 'Serviço: '+ cboSubfasePesquisa.text+#13;
  end;

  if cboFuncionarioPesquisa.text <> '' then
  begin
     Condicao :=  Condicao + ' and T1.Codigo IN (Select CodigoDiarioAtividade from ItemDiarioAtividade itve '+
                             ' inner join ItemEquipe iteq on iteq.CodigoEquipe = itve.CodigoEquipe where iteq.CodigoFuncionario='+
                             quotedstr(inttostr( Integer(cboFuncionarioPesquisa.Items.Objects[cboFuncionarioPesquisa.ItemIndex]) ))+')';
     Filtro:= Filtro+ 'Funcionário: '+ cboFuncionarioPesquisa.text+#13;
  end;



  if edtValorPesquisa.text <> '' then
  begin
     Condicao :=  Condicao + ' and ( T1.Observacao COLLATE COLLATE Latin1_General_CI_AI LIKE  '+ quotedstr('%'+edtValorPesquisa.text+'%')+' OR '+
     ' T1.Codigo IN (Select CodigoDiarioAtividade from ItemDiarioAtividade where Observacao COLLATE Latin1_General_CI_AI LIKE'+ quotedstr('%'+edtValorPesquisa.text+'%')+ ')';

     Filtro:= Filtro+ 'Contendo obs.: '+ edtValorPesquisa.text+#13
  end;

 srcPesquisa.Dataset := Controller.GetSelect( Tabela,ifthen(Condicao <> '', Condicao+' and ', '')+'0=0' , Campos);
 MapperEntidade.Dataset := srcPesquisa.DataSet;
 lbregistros.caption:= inttostr(srcPesquisa.DataSet.recordcount)+' linhas';
 //inherited;

end;

procedure TFormDiarioAtividadeDetalhes.cboCodigoObraChange(Sender: TObject);
begin
  inherited;
  CarregarUnidades;
end;

procedure TFormDiarioAtividadeDetalhes.cboObraPesquisaChange(Sender: TObject);
begin
  inherited;
  cboUnidadePesquisa.items.clear;
  FillCombobox( tpImovelUnidade, cboUnidadePesquisa,
     ' "CodigoImovel"='+ quotedstr(inttostr(
     Integer(cboObraPesquisa.Items.Objects[cboObraPesquisa.ItemIndex]) )),'Codigo','Descricao','Codigo' );
end;

procedure TFormDiarioAtividadeDetalhes.CornerButton1Click(Sender: TObject);
begin
  inherited;
  if not srcItens.Dataset.isEmpty then
  begin
     if srcItens.dataset.fieldbyname('CodigoDiarioAtividade').asstring <> '0' then
     begin
       TControllertabelas(Controller).DeleteSQL('ItemDiarioAtividade',
                                                ' CodigoDiarioAtividade = '+
                                                srcItens.dataset.fieldbyname('CodigoDiarioAtividade').asstring +
                                                ' and Codigo='+
                                                srcItens.dataset.fieldbyname('Codigo').asstring );
       srcItens.Dataset.delete;
     end
     else
       srcItens.Dataset.delete;
  end;
end;



procedure TFormDiarioAtividadeDetalhes.DiariodeObra1Click(Sender: TObject);
var
  DataSetItemDiarioObra:TDataset;
  DataSetResumo : TDataset;
  resumo:string;
begin
  inherited;
  application.CreateForm(TFormRelDiarioObra,FormRelDiarioObra );

  FormRelDiarioObra.cdsDiarioObra.CloneCursor( TClientDataSet(srcPesquisa.DataSet), true );

  DataSetItemDiarioObra := Controller.GetSelect( TabelaItem , MontaCondicaoAcumulada , CamposItemDiarioObra);

  FormRelDiarioObra.cdsItemDiarioObra.CloneCursor(
  TClientDataSet( DataSetItemDiarioObra ), true);
  FormRelDiarioObra.lbFiltro.caption := Filtro;

  DataSetResumo := TControllerDiarioAtividade(Controller).GetResumoDiariodeObra( MontaCondicaoAcumulada );
  resumo:= '';
  DataSetResumo.first;
  while not DataSetResumo.eof  do
  begin
    resumo := resumo  + DataSetResumo.fieldbyname('Descricao').asstring +': '+
              DataSetResumo.fieldbyname('Quantidade').asstring+#13;
    DataSetResumo.next;
  end;

  FormRelDiarioObra.memoResumoCargos.caption := resumo;

  FormRelDiarioObra.QuickRep1.PreviewModal;
  FormRelDiarioObra.Free;
end;

procedure TFormDiarioAtividadeDetalhes.Resumido1Click(Sender: TObject);
var
  DataSetProducao:TDataset;
begin
  inherited;
  application.CreateForm(TFormRelProducaoAcumuladaResumido,
                          FormRelProducaoAcumuladaResumido );

  DataSetProducao := TControllerDiarioAtividade(Controller).GetProducaoAcumulada( TMenuItem(Sender).Tag,
                                                                                  MontaCondicaoAcumulada ,
                                                                                  datetostr(dateInicio.Date),
                                                                                  datetostr(dateFim.Date),
                                                                                  'NomeFuncionario' );

  FormRelProducaoAcumuladaResumido.cdsProducao.CloneCursor(
  TClientDataSet( DataSetProducao ), true);
  FormRelProducaoAcumuladaResumido.lbFiltro.caption:= filtro;

  FormRelProducaoAcumuladaResumido.QuickRep1.PreviewModal;
  FormRelProducaoAcumuladaResumido.Free;
end;

procedure TFormDiarioAtividadeDetalhes.ResumoEstatstico1Click(Sender: TObject);
var
  DataSetEstatistica:TDataset;
begin
  inherited;
  application.CreateForm(TFormRelResumoEstatistico,
                          FormRelResumoEstatistico );

  DataSetEstatistica := TControllerDiarioAtividade(Controller).GetEstatistica( MontaCondicaoAcumulada );


  FormRelResumoEstatistico.cdsEstatistica.CloneCursor(
  TClientDataSet( DataSetEstatistica ), true);

  FormRelResumoEstatistico.QtdUnidade   := strtoint(TControllerDiarioAtividade(Controller).GetValue('ImovelUnidade','0=0','COUNT(*)'));
  FormRelResumoEstatistico.QtdAtvidades := strtoint(TControllerDiarioAtividade(Controller).GetValue('SubFase','Status = ''Ativo''','COUNT(*)'));

  //FormRelResumoEstatistico.lbFiltro.caption:= filtro;

  FormRelResumoEstatistico.QuickRep1.PreviewModal;
  FormRelResumoEstatistico.Free;

end;

procedure TFormDiarioAtividadeDetalhes.Detalhadao1Click(Sender: TObject);
var
  DataSetProducao:TDataset;
begin
  inherited;
  application.CreateForm(TFormRelProducaoAcumuladaDetalhada,
                          FormRelProducaoAcumuladaDetalhada );

  DataSetProducao := TControllerDiarioAtividade(Controller).GetProducaoAcumulada( TMenuItem(Sender).Tag,
                                                                                  MontaCondicaoAcumulada,
                                                                                  datetostr(dateInicio.Date),
                                                                                  datetostr(dateFim.Date),
                                                                                  'NomeFuncionario' );


  FormRelProducaoAcumuladaDetalhada.cdsProducao.CloneCursor(
  TClientDataSet( DataSetProducao ), true);
  FormRelProducaoAcumuladaDetalhada.lbFiltro.caption:= filtro;

  FormRelProducaoAcumuladaDetalhada.QuickRep1.PreviewModal;
  FormRelProducaoAcumuladaDetalhada.Free;

end;

procedure TFormDiarioAtividadeDetalhes.Equipe2Click(Sender: TObject);
var
  DataSetProducao:TDataset;
begin
  inherited;
  application.CreateForm(TFormResumoProducaoAmuladoPorEquipe,
                          FormResumoProducaoAmuladoPorEquipe );

  DataSetProducao := TControllerDiarioAtividade(Controller).GetProducaoAcumulada( TMenuItem(Sender).Tag ,
                                                                                  MontaCondicaoAcumulada ,
                                                                                  datetostr(dateInicio.Date),
                                                                                  datetostr(dateFim.Date) ,
                                                                                  'DescricaoEquipe');

  FormResumoProducaoAmuladoPorEquipe.cdsProducao.CloneCursor(
  TClientDataSet( DataSetProducao ), true);

  FormResumoProducaoAmuladoPorEquipe.QuickRep1.PreviewModal;
  FormResumoProducaoAmuladoPorEquipe.Free;

end;

function TFormDiarioAtividadeDetalhes.MontaCondicaoAcumulada:string;
var
  texto: string;
begin
  texto := ' T1.Data >= '+ quotedstr(Formatdatetime('DD/MM/YYYY', dateInicio.date))+'  and '+
           ' T1.Data <= '+ quotedstr(Formatdatetime('DD/MM/YYYY', dateFim.date));

  Filtro:= 'Período de '+Formatdatetime('DD/MM/YYYY', dateInicio.date)+' até '+
                         Formatdatetime('DD/MM/YYYY', dateFim.date)+#13;

  if cboObraPesquisa.text <> '' then
  begin
     texto :=  texto + ' and T1.CodigoObra ='+ quotedstr(inttostr(
     Integer(cboObraPesquisa.Items.Objects[cboObraPesquisa.ItemIndex]) ));
     Filtro:= Filtro+ 'Obra : '+ cboObraPesquisa.text+#13;
  end;

  if cboResponsavelPesquisa.text <> '' then
  begin
     texto :=  texto + ' and T1.CodigoFuncionario ='+ quotedstr(inttostr(
     Integer(cboResponsavelPesquisa.Items.Objects[cboResponsavelPesquisa.ItemIndex]) ));
     Filtro:= Filtro+ 'Responsável : '+ cboResponsavelPesquisa.text+#13;
  end;

  if cboUnidadePesquisa.text <> '' then
  begin
     texto :=   texto + ' and ite.CodigoUnidade ='+ quotedstr(inttostr(
     Integer(cboUnidadePesquisa.Items.Objects[cboUnidadePesquisa.ItemIndex]) ));
     Filtro:= Filtro+ 'Unidade : '+ cboUnidadePesquisa.text+#13;
  end;

  if cboEquipePesquisa.text <> '' then
  begin
     texto :=  texto + ' and ite.CodigoEquipe ='+ quotedstr(inttostr(
     Integer(cboEquipePesquisa.Items.Objects[cboEquipePesquisa.ItemIndex]) ));
     Filtro:= Filtro+ 'Equipe : '+ cboEquipePesquisa.text+#13;
  end;

  if cboSubfasePesquisa.text <> '' then
  begin
     texto :=  texto + ' and ite.CodigoSubFase ='+ quotedstr(inttostr(
     Integer(cboSubfasePesquisa.Items.Objects[cboSubfasePesquisa.ItemIndex]) ));
     Filtro:= Filtro+ 'Serviço: '+ cboSubfasePesquisa.text+#13;
  end;

  if cboFuncionarioPesquisa.text <> '' then
  begin
     texto :=  texto + ' and func.Codigo ='+
                             quotedstr(inttostr( Integer(
                             cboFuncionarioPesquisa.Items.Objects[cboFuncionarioPesquisa.ItemIndex])));
     Filtro:= Filtro+ 'Funcionário: '+ cboFuncionarioPesquisa.text+#13;

  end;

  if edtValorPesquisa.text <> '' then
  begin
     texto :=  texto + ' and ( T1.Observacao COLLATE COLLATE Latin1_General_CI_AI LIKE  '+
     quotedstr('%'+edtValorPesquisa.text+'%')+' OR '+
     ' ite.Observacao COLLATE Latin1_General_CI_AI LIKE'+ quotedstr('%'+edtValorPesquisa.text+'%');
     Filtro:= Filtro+ 'Contendo obs.: '+ edtValorPesquisa.text+#13
  end;

  result:= texto;
end;

procedure TFormDiarioAtividadeDetalhes.CarregarUnidades;
begin
  cboCodigoUnidadeImovel.items.clear;
  FillCombobox(tpImovelUnidade, cboCodigoUnidadeImovel, ' "CodigoImovel"=' + quotedstr(inttostr(Integer(cboCodigoObra.Items.Objects[cboCodigoObra.ItemIndex]))), 'Codigo', 'Descricao', 'Codigo');
end;



procedure TFormDiarioAtividadeDetalhes.grdItensCellClick(Column: TColumn);
begin
  inherited;
  if (Operacao = 'Update') or (Operacao = 'Insert') then
  begin
    GetItemDiario;
  end;
end;

procedure TFormDiarioAtividadeDetalhes.GetItemDiario;
begin
  if ItemDiarioAtividade <> nil then
    FreeandNil(ItemDiarioAtividade);
  ItemDiarioAtividade := TEntidadeFactory.Criar(tpItemDiarioAtividade);
  MapperItemDiarioAtividade.Entidade := ItemDiarioAtividade;
  MapperItemDiarioAtividade.Dataset := srcItens.DataSet;
  MapperItemDiarioAtividade.SendDataSetToEntidade;
  MapperItemDiarioAtividade.EntidadeToComponent;
end;

procedure TFormDiarioAtividadeDetalhes.SalvarItens(Codigo: string);
begin
  {
  if MapperItemDiarioAtividade.Entidade = nil then
     MapperItemDiarioAtividade.Entidade := TEntidadeFactory.Criar(tpItemDiarioAtividade);


  MapperItemDiarioAtividade.dataset := srcItens.dataSet;

  srcItens.dataSet.first;
  while not srcItens.dataSet.eof do
  begin
    with MapperItemDiarioAtividade do
    begin
      SendValueToFieldEntidade('CodigoDiarioAtividade', Codigo);
      SendValueToFieldEntidade('CodigoEquipe',  srcItens.dataSet.fieldbyname('CodigoEquipe').asstring  );
      SendValueToFieldEntidade('CodigoSubFase', srcItens.dataSet.fieldbyname('CodigoSubFase').asstring );
      SendValueToFieldEntidade('CodigoUnidade', srcItens.dataSet.fieldbyname('CodigoUnidade').asstring );
      SendValueToFieldEntidade('HoraInicio', srcItens.dataSet.fieldbyname('HoraInicio').asstring);
      SendValueToFieldEntidade('HoraFim', srcItens.dataSet.fieldbyname('HoraInicio').asstring);
      SendValueToFieldEntidade('Apontamento', srcItens.dataSet.fieldbyname('Apontamento').asstring);
      SendValueToFieldEntidade('Status', srcItens.dataSet.fieldbyname('Status').asstring);

      SendValueToFieldEntidade('DescricaoUnidade', srcItens.dataSet.fieldbyname('DescricaoUnidade').asstring);
      SendValueToFieldEntidade('DescricaoEquipe', srcItens.dataSet.fieldbyname('DescricaoEquipe').asstring);
      SendValueToFieldEntidade('DescricaoServico', srcItens.dataSet.fieldbyname('DescricaoServico').asstring);

      if  srcItens.dataSet.fieldbyname('Codigo').asInteger > 0 then
      begin
        SendValueToFieldEntidade('Codigo', srcItens.dataSet.fieldbyname('Codigo').asstring);
        Controller.Atualizar(MapperItemDiarioAtividade.Entidade);
      end
      else
        Controller.Inserir(MapperItemDiarioAtividade.Entidade);
    end;

    srcItens.dataSet.next;
  end;
  }

  srcItens.dataSet.first;
  while not srcItens.dataSet.eof do
  begin
    MapperItemDiarioAtividade.Entidade := TEntidadeFactory.Criar(tpItemDiarioAtividade);
    MapperItemDiarioAtividade.DataSet  := srcItens.dataSet;

    MapperItemDiarioAtividade.SendDataSetToEntidade;

    MapperItemDiarioAtividade.SendValueToFieldEntidade('CodigoDiarioAtividade', Codigo );

    MapperItemDiarioAtividade.SendValueToFieldEntidade('DescricaoUnidade',
    srcItens.dataSet.fieldbyname('DescricaoUnidade').asstring);

    MapperItemDiarioAtividade.SendValueToFieldEntidade('DescricaoEquipe',
    srcItens.dataSet.fieldbyname('DescricaoEquipe').asstring);

    MapperItemDiarioAtividade.SendValueToFieldEntidade('DescricaoServico',
    srcItens.dataSet.fieldbyname('DescricaoServico').asstring);

    //usUnmodified, usModified, usInserted, usDeleted
    if TClientDataset(srcItens.dataSet).UpdateStatus = usInserted then
       Controller.Inserir(MapperItemDiarioAtividade.Entidade)
    else
    if TClientDataset(srcItens.dataSet).UpdateStatus = usModified then
       Controller.Atualizar(MapperItemDiarioAtividade.Entidade);

    srcItens.dataSet.next;

    MapperItemDiarioAtividade.Entidade.free;

  end;
  RefreshDataSetItem(Codigo);

end;

procedure TFormDiarioAtividadeDetalhes.TabSheet2Show(Sender: TObject);
begin
  inherited;
  if srcEntidade.dataset.fieldbyname('Codigo').asstring <> '' then
     RefreshDataSetItem(srcEntidade.dataset.fieldbyname('Codigo').asstring);
end;

procedure TFormDiarioAtividadeDetalhes.trServicoDblClick(Sender: TObject);
var
  CodigoServico, DescricaoEquipe,DescricaoUnidade : string;
begin
  inherited;
  if (Operacao = 'Insert') or (Operacao= 'Update') then
  begin
      DescricaoEquipe  := cboCodigoEquipe.text;
      DescricaoUnidade := cboCodigoUnidadeImovel.text;
      if (DescricaoEquipe <> '') and (DescricaoUnidade <> '')  then
      begin
        CodigoServico := GetServico;
        if ( CodigoServico <> '') and
           ( not srcItens.dataset.locate('DescricaoEquipe;DescricaoUnidade;CodigoSubfase',
             VarArrayOf([DescricaoEquipe,DescricaoUnidade,CodigoServico] ),[]) ) then
        begin
          cboCodigoSubfase.ItemIndex:=
          cboCodigoSubfase.Items.IndexOfObject(TObject(strtoint(CodigoServico)));
          if cboCodigoSubfase.text <> '' then
             btnAdicionar.click;
        end
        else
        showmessage('Este serviço já está lançado para a respectiva equipe e unidade!');
      end
      else
       showmessage('Informe a equipe e a unidade!');
  end
  else
    showmessage('O Diario não está em modo edição! Clique no botões Novo ou Altarar.');
end;

function TFormDiarioAtividadeDetalhes.GetServico:String;
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



procedure TFormDiarioAtividadeDetalhes.FormCreate(Sender: TObject);
var
  TabelaSubFase: string;
begin
  Controller   := TControllerDiarioAtividade.Create;
  Entidade     := TEntidadeFactory.Criar(tpDiarioAtividade);
  ItemDiarioAtividade   := TEntidadeFactory.Criar(tpItemDiarioAtividade);
  Tabela       := TabelaDiarioAtividade;
  TabelaItem   := TabelaItemDiarioAtividade;

  Campos := 'T1.*, imo.Titulo as DescricaoObra , func.Nome as NomeFuncionario';
  inherited;
  with MapperEntidade do
  begin
    associar('Codigo', nil);
    associar('CodigoFilial', nil);
    associar('Data', dateData);
    associar('CodigoObra',  cboCodigoObra);
    associar('Observacao', memoObservacao);
    associar('CodigoFuncionario', cboCodigoFuncionario);
    associar('Tempo', cboTempo);
  end;
  MapearItemDiarioAtividade;

  FillCombobox( tpImovel, cboCodigoObra,'0=0','Codigo', 'Titulo', 'Titulo');
  FillCombobox( tpFuncionarios, cboCodigoFuncionario,
  'Login is not null','Codigo','Nome','Nome' );

  FillCombobox( tpEquipe, cboCodigoEquipe,'0=0');

  TabelaSubFase := 'SubFase T1';

  FillCombobox(TabelaSubFase, cboCodigoSubfase,'Status = ''Ativo''',
  'Codigo','Descricao','Descricao');
  FillCombobox(TabelaSubFase, cboSubfasePesquisa,'Status = ''Ativo''',
  'Codigo','Descricao','Descricao');

  FillCombobox( tpEquipe, cboEquipePesquisa,'0=0');
  FillCombobox( tpImovel, cboObraPesquisa,'0=0','Codigo', 'Titulo', 'Titulo');

  FillCombobox( tpFuncionarios, cboResponsavelPesquisa,
  'Login is not null','Codigo','Nome','Nome' );

  FillCombobox( tpFuncionarios, cboFuncionarioPesquisa,
  '0=0','Codigo','Nome','Nome' );

  RefreshDataSetItem('0');
  AtualizarTreeView;

  dateInicio.date:= StartOfTheWeek(date) ;
  dateFim.date:= date;

  cboResponsavelPesquisa.ItemIndex:= cboResponsavelPesquisa.Items.IndexOfObject(
                                     TObject(strtoInt(FormPrincipal.CodigoPessoa)));
  btnPesquisar.click;

end;

procedure TFormDiarioAtividadeDetalhes.RefreshDataSetItem(Codigo: string ='');
var
  CodigoDiarioAtividade: string;
begin
  CodigoDiarioAtividade:= ifthen( Codigo <> '',
                            Codigo ,
                            MapperEntidade.DataSet.FieldByName('Codigo').AsString);

  srcItens.Dataset := Controller.GetSelect(
                      TabelaItem,
                      '"CodigoDiarioAtividade"=' + ifthen(CodigoDiarioAtividade <> '',CodigoDiarioAtividade,'0')+
                      ' Order by DescricaoUnidade, DescricaoEquipe, DescricaoFase'
                      , CamposItemDiarioObra);

  TStringField(srcItens.Dataset.FieldByName('HoraInicio')).EditMask := '00:00;';
  TStringField(srcItens.Dataset.FieldByName('HoraFim')).EditMask := '00:00;';

  MapperItemDiarioAtividade.Dataset:= srcItens.Dataset;
end;



procedure TFormDiarioAtividadeDetalhes.MapearItemDiarioAtividade;
begin
  MapperItemDiarioAtividade   := TMapper.create(nil, srcItens.DataSet );
  with MapperItemDiarioAtividade do
  begin
    associar('Codigo',nil);
    associar('CodigoFilial',nil);
    associar('CodigoDiarioAtividade',nil);
    associar('CodigoSubFase', cboCodigoSubfase);
    associar('DescricaoServico',edtObservacao);
    associar('CodigoEquipe' , cboCodigoEquipe);
    associar('DescricaoEquipe',edtObservacao);
    associar('CodigoUnidade', cboCodigoUnidadeImovel);
    associar('DescricaoUnidade',edtObservacao);
    associar('HoraInicio',nil);
    associar('HoraFim',nil);
    associar('Status',nil);
    associar('Apontamento',nil);
    associar('Observacao',edtObservacao);

  end;
end;

procedure TFormDiarioAtividadeDetalhes.Aprovartodasasatividaderelat1Click(
  Sender: TObject);
begin
  inherited;
  if Operacao <> '' then
  begin
    showmessage('Para esta operação primeiramente confirme as alterações do diário!');
    abort;
  end;

    if application.messagebox('Deseja aprovar a Atividade e seu respectivo histórico',
    'Confirmar', mb_iconquestion+mb_yesno) = id_yes then

    if (srcItens.dataset.fieldbyname('CodigoUnidade').asstring <> '') and
        (srcItens.dataset.fieldbyname('CodigoEquipe').asstring  <> '') and
        (srcItens.dataset.fieldbyname('CodigoSubFase').asstring <> '') then
    begin
       TControllerDiarioAtividade(Controller).AprovarTodoHistorico(
       srcItens.dataset.fieldbyname('CodigoUnidade').asstring,
       srcItens.dataset.fieldbyname('CodigoEquipe').asstring,
       srcItens.dataset.fieldbyname('CodigoSubFase').asstring);

       RefreshDataSetItem(srcItens.dataset.fieldbyname('CodigoDiarioAtividade').asstring);
    end;
end;

procedure TFormDiarioAtividadeDetalhes.AtualizarTreeView;
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
                  ' T1.Codigo, '+
                  ' T1.Codificacao  , '+
                  ' T1.Descricao ,'+
                  ' T1.CodigoFase';

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

end.
