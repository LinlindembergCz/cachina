unit QuantitativoDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TemplateDetalhesComTabGrid, Data.DB, Mapper, Dateutils, StrUtils,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls, GenericEntidade,
  Vcl.Menus;

type
  TFormQuantitativoDetalhes = class(TTemplateFormComTabGridDetalhes)
    grdItens: TDBGrid;
    cboObra: TComboBox;
    cboProjeto: TComboBox;
    edtQuantidadeUnidade: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    trServico: TTreeView;
    srcItens: TDataSource;
    gpbItens: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    cboCodigoSubfase: TComboBox;
    memoDescritivo: TMemo;
    btnAdicionar: TSpeedButton;
    CornerButton1: TSpeedButton;
    PopupMenu1: TPopupMenu;
    Adicionartodos1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure trServicoDblClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure CornerButton1Click(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure Adicionartodos1Click(Sender: TObject);
  private
    { Private declarations }
    ItemQuantitativo: TGenericEntidade;
    MapperItemQuantitativo:TMapper;

    procedure AtualizarTreeView;
    procedure RefreshDataSetItem(Codigo: string = '');
    procedure PersistirItem;
    procedure AjustaTamanhoGrid;
    procedure SalvarItens(Codigo: string);
    function GetServico: String;
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
  FormQuantitativoDetalhes: TFormQuantitativoDetalhes;
  CodigoEtapa   : string;
  CodigoFase    : string;
  CodigoSubFase : string;

Const
 CamposItemQuantitativo = ' T2.*,'+
                          ' sub.Descricao as DescricaoServico,'+
                          ' fase.Descricao as DescricaoFase,'+
                          ' unid.Descricao as DescricaoUnidadeMedida';

implementation

{$R *.dfm}

uses EntidadeFactory, ControllerTabelas, DBUtils, Controller;


procedure TFormQuantitativoDetalhes.AtualizarTreeView;
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

procedure TFormQuantitativoDetalhes.btnAdicionarClick(Sender: TObject);
begin
  inherited;
  PersistirItem;
end;

procedure TFormQuantitativoDetalhes.btnAlterarClick(Sender: TObject);
begin
  inherited;
  AjustaTamanhoGrid;
end;

procedure TFormQuantitativoDetalhes.btnCancelarClick(Sender: TObject);
begin
  inherited;
  AjustaTamanhoGrid;
end;

procedure TFormQuantitativoDetalhes.Adicionartodos1Click(Sender: TObject);
var
  Data: Pointer;
  Level: Integer;
  DataSetSubFase:TDataset;
  CodigoServico: string;
begin
  if trServico.Items.Count > 0 then
  begin
    Data := trServico.Selected.Data;
    if Data <> nil then
    begin
      Level := trServico.Selected.Level;
      case Level of
        0:
          begin
            DataSetSubFase := TControllerTabelas(Controller).GetSelect(
                              'Select SubFase.* from '+
                              ' SubFase inner join Fase on CodigoFase = Fase.Codigo'+
                              ' where fase.CodigoEtapa='+ PEtapa(Data).Codigo );
          end;
        1:
          begin
            DataSetSubFase := TControllerTabelas(Controller).GetSelect(
                              'Select SubFase.*  from SubFase '+
                              ' where CodigoFase='+  PFase(Data).Codigo );

          end;
      end;

      if DataSetSubFase <> nil then
      begin
        DataSetSubFase.first;
        while not DataSetSubFase.eof do
        begin
           CodigoServico := DataSetSubFase.fieldbyname('Codigo').asstring;
           cboCodigoSubfase.ItemIndex:=
           cboCodigoSubfase.Items.IndexOfObject(TObject(strtoint(CodigoServico)));

           PersistirItem;

           DataSetSubFase.next;
        end;
      end;
    end;
  end;
end;


procedure TFormQuantitativoDetalhes.AjustaTamanhoGrid;
begin
  if (Operacao = 'Update') or (Operacao = 'Insert') then
  begin
     grdItens.Height:= grdItens.Height - gpbItens.Height - 5;
     grdItens.top := grdItens.top + gpbItens.Height + 5;
     //if (Operacao = 'Insert') then
     //pnlEstrutura.visible:= true;
  end
  else
  begin
     grdItens.Height:= grdItens.Height + gpbItens.Height + 5;
     grdItens.top :=  grdItens.top - gpbItens.Height - 5;
     //pnlEstrutura.visible:= false;
  end;
end;

procedure TFormQuantitativoDetalhes.btnConfirmarClick(Sender: TObject);
var
  Codigo: string;
begin
  if Operacao = 'Insert' then
  begin
     Codigo := TControllerTabelas(Controller).GetMaxEntidade('Quantitativo');
     MapperEntidade.SendValueToFieldEntidade('Codigo', Codigo );
  end;
  inherited;
  SalvarItens(MapperEntidade.GetValueEntidade('Codigo'));
  AjustaTamanhoGrid;
end;

procedure TFormQuantitativoDetalhes.SalvarItens(Codigo: string);
begin
  TControllerTabelas(Controller).DeleteSQL('ItemQuantitativo','CodigoQuantitativo='+ Codigo);

  if MapperItemQuantitativo.Entidade = nil then
     MapperItemQuantitativo.Entidade := TEntidadeFactory.Criar(tpItemQuantitativo);

  MapperItemQuantitativo.dataset := srcItens.dataSet;

  srcItens.dataSet.first;
  while not srcItens.dataSet.eof do
  begin
    MapperItemQuantitativo.SendValueToFieldEntidade('CodigoDiarioAtividade', Codigo);
    MapperItemQuantitativo.SendValueToFieldEntidade('CodigoSubFase', srcItens.dataSet.fieldbyname('CodigoSubFase').asstring);
    Controller.Inserir(MapperItemQuantitativo.Entidade);
    srcItens.dataSet.next;
  end;
  //RefreshDataSetItemPedido(CodigoPedido);
end;

procedure TFormQuantitativoDetalhes.btnInserirClick(Sender: TObject);
begin
  inherited;
  AjustaTamanhoGrid;
  RefreshDataSetItem('0');
end;

procedure TFormQuantitativoDetalhes.CornerButton1Click(Sender: TObject);
begin
  inherited;
  if not srcItens.Dataset.isEmpty then
  begin
     if srcItens.dataset.fieldbyname('CodigoQuantitativo').asstring <> '0' then
     begin
       TControllertabelas(Controller).Excluir( MapperItemQuantitativo.Entidade );
       srcItens.Dataset.delete;
     end
     else
       srcItens.Dataset.delete;
  end;
end;

procedure TFormQuantitativoDetalhes.PersistirItem;
var
  Count: Integer;
  DescricaoUnidadeMedida: string;
begin
  with MapperItemQuantitativo do
  begin
    //if edtOrdem.text = '' then
    begin
      if ItemQuantitativo  = nil  then
         Entidade := TEntidadeFactory.Criar(tpItemQuantitativo)
      else
         Entidade := ItemQuantitativo;
      DataSet := srcItens.DataSet;
    end;

    ComponentToEntidade;

    if srcItens.DataSet.locate('DescricaoServico',
                      varArrayOf( [cboCodigoSubfase.text ] ), [] ) then
       srcItens.DataSet.edit
    else
       srcItens.DataSet.append;

    SendEntidadeToDataSet;

    Count := srcItens.DataSet.RecordCount + 1;

    SendValueToFieldEntidade('CodigoQuantitativo', '0');
    SendValueToFieldEntidade('Codigo', inttostr(Count));
    SendValueToFieldDataSet('DescricaoServico', cboCodigoSubfase.text );
    SendValueToFieldDataSet('CodigoFilial' , '1' );

    DescricaoUnidadeMedida := TControllerTabelas(Controller).GetValue('UnidadeMedida',
    'Codigo in (select CodigoUnidade From SubFase where Codigo = '+
    MapperItemQuantitativo.GetValueEntidade('CodigoSubFase')+')' ,
    'Descricao' );

    srcItens.DataSet.fieldbyname('DescricaoFase').asstring :=
    TControllerTabelas(Controller).GetValue('Fase inner join SubFase on '+
                                            ' Fase.Codigo = CodigoFase',
                                            'SubFase.Codigo='+ MapperItemQuantitativo.GetValueEntidade('CodigoSubFase') ,
                                            'Fase.Descricao' );

    srcItens.DataSet.fieldbyname('DescricaoUnidadeMedida').asstring := DescricaoUnidadeMedida;

    srcItens.DataSet.Post;
  end;
end;

procedure TFormQuantitativoDetalhes.FormCreate(Sender: TObject);
var
  TabelaSubFase: string;
begin
  Controller := TControllerTabelas.create;
  Entidade := TEntidadeFactory.Criar(tpQuantitativo);
  ItemQuantitativo   := TEntidadeFactory.Criar(tpItemQuantitativo);
  Tabela := 'Quantitativo T1 '+
            ' left join Imovel imo on imo.Codigo = T1.CodigoObra '+
            ' left join Projeto  on Projeto.Codigo = T1.CodigoProjetoUnidade';

  Campos := 'T1.*, imo.Titulo as DescricaoObra , Projeto.Descricao as DescricaoProjeto';

  inherited;
  with MapperEntidade do
  begin
    associar('Codigo',nil);
    associar('CodigoFilial',nil);
    associar('CodigoObra',cboObra);
    associar('CodigoProjetoUnidade', cboProjeto);
    associar('Quantidade', edtQuantidadeUnidade);
  end;

  MapperItemQuantitativo := TMapper.create(nil, srcItens.DataSet );

  with MapperItemQuantitativo do
  begin
    associar('Codigo', nil);
    associar('CodigoFilial', nil);
    associar('Ordem', nil);
    associar('CodigoQuantitativo', nil);
    associar('CodigoSubFase',  cboCodigoSubfase);
    associar('Quantidade', nil);
    associar('Descritivo',  memoDescritivo);
  end;

  TabelaSubFase := 'SubFase T1';

  FillCombobox( tpImovel, cboObra,'0=0','Codigo', 'Titulo', 'Titulo');
  FillCombobox( 'Projeto T1', cboProjeto,'0=0');
  FillCombobox(TabelaSubFase, cboCodigoSubfase,'0=0');

  RefreshDataSetItem('0');
  AtualizarTreeView;

end;

procedure TFormQuantitativoDetalhes.RefreshDataSetItem(Codigo: string ='');
var
  CodigoQuantitativo : string;
begin
  CodigoQuantitativo:= ifthen( Codigo <> '',
                            Codigo ,
                            MapperEntidade.DataSet.FieldByName('Codigo').AsString);

  srcItens.Dataset := Controller.GetSelect( TMapper.GetTableNameClasse(
                      TEntidadeFactory.GetClassInfo(tpItemQuantitativo) )+' T2 '+
                      ' left join SubFase sub on sub.Codigo = T2.CodigoSubFase '+
                      ' left join Fase on fase.codigo = sub.CodigoFase'+
                      ' left join UnidadeMedida unid on unid.Codigo = sub.CodigoUnidade',
                      '"CodigoQuantitativo"=' + ifthen(CodigoQuantitativo <> '',CodigoQuantitativo,'0') ,
                      CamposItemQuantitativo);


  MapperItemQuantitativo.Dataset:= srcItens.Dataset;
end;

procedure TFormQuantitativoDetalhes.trServicoDblClick(Sender: TObject);
var
  CodigoServico, DescricaoEquipe,DescricaoUnidade : string;
begin
  inherited;
  if (Operacao = 'Insert') or (Operacao= 'Update') then
  begin
     CodigoServico := GetServico;
     if ( CodigoServico <> '') and
        ( not srcItens.dataset.locate('CodigoSubfase',
          VarArrayOf([CodigoServico] ),[]) ) then
     begin
       cboCodigoSubfase.ItemIndex:=
       cboCodigoSubfase.Items.IndexOfObject(TObject(strtoint(CodigoServico)));
       if cboCodigoSubfase.text <> '' then
          btnAdicionar.click;
     end;

  end
  else
    showmessage('O Quantitativo não está em modo edição!');

end;

function TFormQuantitativoDetalhes.GetServico:String;
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

end.
