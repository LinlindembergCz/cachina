unit SubFaseDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TemplateDetalhesComTabGrid, Data.DB, DBClient,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Menus;

type
  TFormSubFaseDetalhes = class(TTemplateFormComTabGridDetalhes)
    lbDescriacao: TLabel;
    edtDescricao: TEdit;
    edtCodificacao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    cboCodigoFase: TComboBox;
    trServico: TTreeView;
    PopupMenu1: TPopupMenu;
    NovaEtapa1: TMenuItem;
    NovaFase1: TMenuItem;
    NovoServio1: TMenuItem;
    Label3: TLabel;
    edtValor: TEdit;
    Label5: TLabel;
    cboUnidadeMedida: TComboBox;
    Label4: TLabel;
    edtPredecessora: TEdit;
    SpeedButton1: TSpeedButton;
    Label6: TLabel;
    Label7: TLabel;
    cboEstatus: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure trServicoClick(Sender: TObject);
    procedure NovaEtapa1Click(Sender: TObject);
    procedure NovaFase1Click(Sender: TObject);
    procedure NovoServio1Click(Sender: TObject);
    procedure trServicoDblClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
  private
    procedure AtualizarTreeView;
    procedure AtualizarCodigos;
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
  FormSubFaseDetalhes: TFormSubFaseDetalhes;
  CodigoEtapa   : string;
  CodigoFase    : string;
  CodigoSubFase : string;

implementation

{$R *.dfm}

uses ControllerTabelas, EntidadeFactory, DBUtils, GenericEntidade, Mapper;

procedure TFormSubFaseDetalhes.FormCreate(Sender: TObject);
begin
  Controller := TControllerTabelas.Create;
  Entidade   := TEntidadeFactory.Criar(tpSubFase);

  Tabela:= ' SubFase T1 '+
           ' left join Fase on T1.CodigoFase = Fase.Codigo '+
           ' left join Etapa Etapa  on Fase.CodigoEtapa = Etapa.Codigo';

  Campos := ' Etapa.Codificacao as CodificacaoEtapa, '+
            ' Etapa.Descricao as DescricaoEtapa, '+
            ' Etapa.Codigo as CodigoEtapa,'+
            ' Fase.Codificacao as CodificacaoFase, '+
            ' Fase.Descricao as DescricaoFase, '+
            ' Fase.Codigo as CodigoFase,'+
            ' T1.Codigo, '+
            ' T1.Codificacao ,'+
            ' T1.Descricao ,'+
            ' T1.CodigoFase, '+
            ' T1.Valor,'+
            ' T1.status,'+
            ' T1.CodigoUnidade,'+
            ' T1.Predecessora';

  Condicao := 'Etapa.Descricao = ''MEDITERRANEO'' ';


  //Condicao := ' 0=0 order by Etapa.Codigo, Fase.Codigo, T1.Codigo';
  inherited;
  //OrderBy := ' Etapa.Codigo, Fase.Codigo';
  TClientDataset(srcPesquisa.DataSet).IndexFieldNames:= 'CodigoFase';
  with MapperEntidade do
  begin
    Associar('Codigo',nil);
    Associar('Descricao', edtDescricao);
    Associar('Codificacao', edtCodificacao);
    Associar('CodigoFase', cboCodigoFase);
    Associar('Valor', edtValor);
    Associar('CodigoUnidade', cboUnidadeMedida);
    Associar('Predecessora', edtPredecessora);
    Associar('Status', cboEstatus);
  end;
  FillCombobox(tpFase,cboCodigoFase);
  FillCombobox( tpUnidadeMedida  , cboUnidadeMedida );
  AtualizarTreeView;
end;


procedure TFormSubFaseDetalhes.NovaEtapa1Click(Sender: TObject);
var
  Descricao: string;
  EntidadeEtapa : TGenericEntidade;
  ControllerEtapa : TControllerTabelas;
  MapperEntidadeEtapa:TMapper;
begin
  inherited;
  AtualizarCodigos;
  ControllerEtapa := TControllerTabelas.Create;
  EntidadeEtapa   := TEntidadeFactory.Criar(tpEtapa);
  MapperEntidadeEtapa := TMapper.create(EntidadeEtapa);
  Descricao :=  Inputbox('Nova etapa','Descrição','');
  with MapperEntidadeEtapa do
  begin
    Associar('Codigo',nil);
    Associar('Descricao', nil, Descricao);
    Associar('Codificacao', nil);
  end;
  ControllerEtapa.Inserir( EntidadeEtapa );
  RefreshDataSet;
  AtualizarTreeView;

end;

procedure TFormSubFaseDetalhes.NovaFase1Click(Sender: TObject);
var
  Descricao: string;
  EntidadeFase : TGenericEntidade;
  ControllerFase : TControllerTabelas;
  MapperEntidadeFase:TMapper;
begin
  inherited;
  AtualizarCodigos;
  ControllerFase := TControllerTabelas.Create;
  EntidadeFase   := TEntidadeFactory.Criar(tpFase);
  MapperEntidadeFase := TMapper.create(EntidadeFase);
  Descricao :=  Inputbox('Nova fase','Descrição','');
  with MapperEntidadeFase do
  begin
    Associar('Codigo',nil);
    Associar('Descricao', nil, Descricao);
    Associar('Codificacao', nil);
    Associar('CodigoEtapa', nil, CodigoEtapa);
  end;
  ControllerFase.Inserir( EntidadeFase );
  RefreshDataSet;
  AtualizarTreeView;
end;

procedure TFormSubFaseDetalhes.NovoServio1Click(Sender: TObject);
var
  Descricao: string;
  EntidadeSubFase : TGenericEntidade;
  ControllerSubFase : TControllerTabelas;
  MapperEntidadeSubFase:TMapper;
begin
  inherited;
  AtualizarCodigos;
  ControllerSubFase := TControllerTabelas.Create;
  EntidadeSubFase   := TEntidadeFactory.Criar(tpSubFase);
  MapperEntidadeSubFase := TMapper.create(EntidadeSubFase);
  Descricao :=  Inputbox('Nova serviço','Descrição','');
  with MapperEntidadeSubFase do
  begin
    Associar('Codigo',nil);
    Associar('Descricao', nil, Descricao);
    Associar('Codificacao', nil);
    Associar('CodigoFase', nil, CodigoFase);
    Associar('Status', nil, 'Ativo');
  end;
  ControllerSubFase.Inserir( EntidadeSubFase );
  RefreshDataSet;
  AtualizarTreeView;
end;

procedure TFormSubFaseDetalhes.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  trServico.visible:= not trServico.visible;
end;

procedure TFormSubFaseDetalhes.trServicoClick(Sender: TObject);
begin
  inherited;
  try
  AtualizarCodigos;
  except end;
end;

procedure TFormSubFaseDetalhes.trServicoDblClick(Sender: TObject);
begin
  inherited;
  try
  AtualizarCodigos;
  btnAlterar.click;
  except end;
end;

procedure TFormSubFaseDetalhes.AtualizarTreeView;
var
  DescricaoEtapa   ,
  DescricaoFase    ,
  DescricaoSubFase : string;

  codEtapa   ,
  codFase    ,
  codSubFase : string;

  ListaEtapa, ListaFase : TStringList;
  NoEtapa: TTreeNode;
  NoFase: TTreeNode;

  ObjectEtapa  : PEtapa;
  ObjectFase   : PFase;
  ObjectSubFase: PSubFase;
begin
  try
     trServico.Items.clear;
     ListaEtapa := TStringList.create;
     ListaFase  := TStringList.create;

     srcPesquisa.DataSet.first;
     TClientDataset(srcPesquisa.DataSet).IndexFieldNames:= 'CodigoFase';

     while not srcPesquisa.DataSet.eof do
     begin
       DescricaoEtapa   := trim(srcPesquisa.DataSet.fieldByName('DescricaoEtapa').AsString);
       DescricaoFase    := srcPesquisa.DataSet.fieldByName('DescricaoFase').AsString;
       DescricaoSubFase := srcPesquisa.DataSet.fieldByName('Descricao').AsString;

       codEtapa   := trim(srcPesquisa.DataSet.fieldByName('CodigoEtapa').AsString);
       codFase    := srcPesquisa.DataSet.fieldByName('CodigoFase').AsString;
       codSubFase := srcPesquisa.DataSet.fieldByName('Codigo').AsString;

       if (ListaEtapa.IndexOf(codEtapa) = -1) and (DescricaoEtapa <> '') then
       begin
         NEW(ObjectEtapa);
         ObjectEtapa^.Codigo := codEtapa;

         NoEtapa := trServico.Items.AddObject( nil, DescricaoEtapa, ObjectEtapa);
         ListaEtapa.add(codEtapa);
         NoEtapa.Collapse(false);
       end;

       if (ListaFase.IndexOf(codFase) = -1) and (DescricaoFase <> '') then
       begin
         NEW(ObjectFase);
         ObjectFase^.Codigo := codFase;
         ObjectFase^.CodigoEtapa := codEtapa;

         NoFase := trServico.Items.AddChildObject(NoEtapa, DescricaoFase , ObjectFase );
         ListaFase.add(codFase);
         NoFase.Collapse(false);
       end;

       if DescricaoSubFase <> '' then
       begin
         NEW(ObjectSubFase);
         ObjectSubFase^.Codigo      := codSubFase;
         ObjectSubFase^.CodigoEtapa := codEtapa;
         ObjectSubFase^.CodigoFase  := codFase;
         trServico.Items.AddChildObject(NoFase, DescricaoSubFase , ObjectSubFase );
       end;
       srcPesquisa.DataSet.next;
     end;
     CodigoEtapa   := '';
     CodigoFase    := '';
     CodigoSubFase := '';
  finally
     ListaEtapa.free;
  end;
end;

procedure TFormSubFaseDetalhes.btnInserirClick(Sender: TObject);
begin
  inherited;
  cboEstatus.itemindex := 0;
end;

procedure TFormSubFaseDetalhes.btnPesquisarClick(Sender: TObject);
begin
  CampoPesquisa:= 'T1.Descricao';
  inherited;
  AtualizarTreeView;
end;

procedure TFormSubFaseDetalhes.AtualizarCodigos;
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
            srcPesquisa.DataSet.Locate('Codigo', CodigoSubFase, []);
          end;
      end;
    end;
  end;
end;

end.



