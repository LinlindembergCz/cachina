unit TabelaPrecoDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TemplateDetalhesBase, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB, Vcl.Buttons,
  Vcl.ExtCtrls, GenericEntidade, Mapper, StrUtils, ControllerProdutos;

type
  TFormTabelaPrecoDetalhes = class(TTemplateFormBaseDetalhes)
    grdItens: TDBGrid;
    edtDescricao: TEdit;
    lbDataEmissao: TLabel;
    dateValidade: TDateTimePicker;
    Label4: TLabel;
    cboFormaPagamento: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    edtCodigo: TEdit;
    srcItens: TDataSource;
    btnAdicionaProduto: TSpeedButton;
    CornerButton1: TSpeedButton;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    cboProduto: TDBLookupComboBox;
    SpeedButton3: TSpeedButton;
    Label12: TLabel;
    edtPreco: TEdit;
    edtCodigoProduto: TEdit;
    Label3: TLabel;
    edtDesconto: TEdit;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionaProdutoClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure cboProdutoCloseUp(Sender: TObject);
    procedure edtCodigoProdutoChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    ItemTabelaPreco            : TGenericEntidade;
    MapperItemTabelaPreco      : TMapper;
    ControllerProduto       : TControllerProdutos;
    procedure MapearCamposTabelaPreco;
    procedure MapearCamposItemEntrada;
    procedure PersistirItemTabelaPreco;
    procedure SalvarItens(CodigoTabelaPreco: string);
    procedure ConsultarDataSetItemTabelaPreco(Codigo: string = '');
  public
    { Public declarations }
  end;

var
  FormTabelaPrecoDetalhes: TFormTabelaPrecoDetalhes;

implementation

{$R *.dfm}

uses DBUtils, EntidadeFactory, ControllerTabelas;

procedure TFormTabelaPrecoDetalhes.btnAdicionaProdutoClick(Sender: TObject);
begin
  if cboProduto.Text<> '' then
  begin
    inherited;
    PersistirItemTabelaPreco;
    cboProduto.KeyValue  := Null;
    edtPreco.Text        := '0';
  end;
end;

procedure TFormTabelaPrecoDetalhes.btnConfirmarClick(Sender: TObject);
var
  i:integer;
  CodigoTabelaPreco: string;
begin
  if Operacao = 'Insert' then
     edtCodigo.Text := Controller.GetSelect('TabelaPreco','0=0',
                       'isNull( Max("Codigo"),0)+1 as Max').FieldByName('Max').AsString;
  CodigoTabelaPreco:=  edtCodigo.Text;
  inherited;
  SalvarItens(CodigoTabelaPreco);
  //GetEntrada(CodigoTabelaPreco);
end;



procedure TFormTabelaPrecoDetalhes.SalvarItens(CodigoTabelaPreco: string);
begin
  //TControllerEntrada(Controller).ExcluirItens(CodigoEntrada);

  if MapperItemTabelaPreco.Entidade = nil then
     MapperItemTabelaPreco.Entidade := TEntidadeFactory.Criar(tpItemTabelaPreco);

  srcItens.dataSet.first;
  while not srcItens.dataSet.eof do
  begin
    MapperItemTabelaPreco.SendDataSetToEntidade;
    MapperItemTabelaPreco.SendValueToFieldEntidade('CodigoTabelaPreco', CodigoTabelaPreco);
    Controller.Inserir(MapperItemTabelaPreco.Entidade);
    srcItens.dataSet.next;
  end;
 //ConsultarDataSetItemEntrada(CodigoEntrada);
end;

procedure TFormTabelaPrecoDetalhes.SpeedButton1Click(Sender: TObject);
var
DatasetProduto: Tdataset;
begin
  inherited;
  try
     DatasetProduto := cboProduto.ListSource.DataSet;
     DatasetProduto.DisableControls;
     DatasetProduto.first;
     while not DatasetProduto.Eof do
     begin
        if DatasetProduto.FieldByName('Descricao').AsString <> '' then
        begin
           edtCodigoProduto.Text:= DatasetProduto.FieldByName('Codigo').AsString;
           if edtPreco.text <> '0' then
           begin
              btnAdicionaProduto.Click;
           end;
        end;
        DatasetProduto.next;
     end;
  finally
      DatasetProduto.first;
      DatasetProduto.enableControls;
  end;
end;

procedure TFormTabelaPrecoDetalhes.FormCreate(Sender: TObject);
begin
  Controller         := TControllerTabelas.Create;
  Entidade           := TEntidadeFactory.Criar(tpTabelaPreco);
  ItemTabelaPreco    := TEntidadeFactory.Criar(tpItemTabelaPreco);
  Condicao           := '0=1';
  inherited;
  MapearCamposTabelaPreco;
  MapearCamposItemEntrada;

  FillCombobox( tpFormaPagamento , cboFormaPagamento);
  FillLookUpCombobox( tpProduto, cboProduto,'Codigo','descricao','Tipo=''MATERIAL'' ' );

  Controller       := TControllerProdutos.Create;
end;

procedure TFormTabelaPrecoDetalhes.MapearCamposTabelaPreco;
begin
  with MapperEntidade do
  begin
    associar('Codigo', edtCodigo);
    associar('Validade', dateValidade);
    associar('Descricao', edtDescricao);
    associar('CodigoFormaPagamento', cboFormaPagamento);
  end;
end;

procedure TFormTabelaPrecoDetalhes.MapearCamposItemEntrada;
begin
  MapperItemTabelaPreco   := TMapper.create(nil, srcItens.DataSet );
  with MapperItemTabelaPreco do
  begin
     Associar('Codigo', nil);
     Associar('CodigoFilial', nil);
     Associar('CodigoTabelaPreco', nil);
     Associar('CodigoProduto', edtCodigoProduto);
     //Associar('CodigoProduto', cboProduto);
     Associar('Preco', edtPreco);
  end;
end;

procedure TFormTabelaPrecoDetalhes.PersistirItemTabelaPreco;
var
  DescricaoProduto: string;
begin
  with MapperItemTabelaPreco do
  begin
     Entidade := TEntidadeFactory.Criar(tpItemTabelaPreco);

     DataSet := srcItens.DataSet;

     ComponentToEntidade;

     if not srcItens.DataSet.Locate('CodigoProduto',edtCodigoProduto.Text,[] ) then
        srcItens.DataSet.append
     else
        srcItens.DataSet.edit;

     SendValueToFieldDataSet('Descricao', cboProduto.text);
     SendEntidadeToDataSet;
     srcItens.DataSet.Post;
  end;
 {else
  begin
    srcItens.DataSet.edit;
    DescricaoProduto := cboProduto.text;
    SendValueToFieldDataSet('Descricao', DescricaoProduto);
    SendEntidadeToDataSet;
    srcItens.DataSet.Post;
  end;

  if (Operacao = 'Update') and (srcEntidade.DataSet.state in [dsedit]) then
  begin
    if srcEntidade.DataSet.FieldByName('Codigo').AsString <> '' then
    begin
      Controller.Atualizar(Entidade);
      srcItens.Dataset := TControllerEntrada(Controller).GetDataSet(MapperItemEntrada.Entidade,
                          'CodigoEntrada=' + srcEntidade.DataSet.FieldByName('Codigo').AsString,
                          CamposItemEntrada);
    end;
  end;}

end;

procedure TFormTabelaPrecoDetalhes.btnInserirClick(Sender: TObject);
begin
  ConsultarDataSetItemTabelaPreco('0');
  inherited;
end;


procedure TFormTabelaPrecoDetalhes.cboProdutoCloseUp(Sender: TObject);
begin
  inherited;
   edtCodigoProduto.Text:= cboProduto.keyvalue;
end;

procedure TFormTabelaPrecoDetalhes.ConsultarDataSetItemTabelaPreco(Codigo: string ='');
var
  CodigoTabelaPreco: string;
begin
  CodigoTabelaPreco:= ifthen( Codigo <> '',
                            Codigo ,
                            MapperEntidade.DataSet.FieldByName('Codigo').AsString);

  srcItens.Dataset := Controller.GetSelect( 'ItemTabelaPreco T1 '+
                        ' inner join Produtos prod on prod.codigo = T1.CodigoProduto',
                      '"CodigoTabelaPreco"=' +
                      ifthen(CodigoTabelaPreco <> '',CodigoTabelaPreco,'0') ,
                      'T1.*, prod."Descricao"');

  MapperItemTabelaPreco.Dataset:= srcItens.Dataset;

end;
procedure TFormTabelaPrecoDetalhes.edtCodigoProdutoChange(Sender: TObject);
var
  valordesconto: double;
  desconto: double;
  Preco:Double;
begin
  inherited;
  if edtCodigoProduto.text <> '' then
  begin
    cboProduto.KeyValue := edtCodigoProduto.Text;
    if cboProduto.Text <> '' then
    begin
        Preco:= ControllerProduto.GetPrecoVenda(edtCodigoProduto.text,'', '' );
        desconto:= strtofloatDef(edtDesconto.Text,0);
        valordesconto       :=  Preco * desconto / 100;
        edtPreco.text       := FormatFloat('0.00;', Preco -  valordesconto );
    end;
  end;
end;

end.
