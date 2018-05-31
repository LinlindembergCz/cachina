unit EntradaDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TemplateDetalhesBase, Vcl.StdCtrls,
  Data.DB, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Grids, strutils,
  Vcl.DBGrids, GenericEntidade, EntidadeFactory, Mapper, ItensEntrada, ControllerProdutos;

type
  TFormEntradaDetalhes = class(TTemplateFormBaseDetalhes)
    dateData: TDateTimePicker;
    cboCodigoFornecedor: TDBLookupComboBox;
    edtNumeroDocumento: TEdit;
    cboTipoFrete: TComboBox;
    edtValorFrete: TEdit;
    edtValorDocumento: TEdit;
    dateDataEmissao: TDateTimePicker;
    grdItens: TDBGrid;
    gpbItens: TGroupBox;
    Label6: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label9: TLabel;
    edtCodigoItem: TEdit;
    edtQuantidade: TEdit;
    edtValor: TEdit;
    BitBtn1: TSpeedButton;
    CornerButton1: TSpeedButton;
    edtOrdem: TEdit;
    cboProduto: TDBLookupComboBox;
    srcItens: TDataSource;
    edtCodigo: TEdit;
    Label1: TLabel;
    edtValorDesconto: TEdit;
    srcProdutos: TDataSource;
    Label2: TLabel;
    cboEstoque: TDBLookupComboBox;
    srcEstoque: TDataSource;
    CornerButton2: TSpeedButton;
    Label3: TLabel;
    cboUnidadeMedida: TComboBox;
    Label4: TLabel;
    edtFator: TEdit;
    edtCFOP: TEdit;
    Label14: TLabel;
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    SpeedButton2: TSpeedButton;
    Label20: TLabel;
    edtChaveAcesso: TEdit;
    SpeedButton3: TSpeedButton;
    srcPagamentos: TDataSource;
    edtEspecie: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    edtSerie: TEdit;
    Label23: TLabel;
    cboSituacao: TComboBox;
    GroupBox1: TGroupBox;
    cboCST: TComboBox;
    Label5: TLabel;
    Label7: TLabel;
    edtBaseICMS: TEdit;
    Label8: TLabel;
    edtValorICMS: TEdit;
    Label24: TLabel;
    edtPercentualICMS: TEdit;
    GroupBox2: TGroupBox;
    Label25: TLabel;
    cboCSTIPI: TComboBox;
    Label17: TLabel;
    edtBaseIPI: TEdit;
    Label13: TLabel;
    edtValorIPI: TEdit;
    Label26: TLabel;
    edtPercentualIPI: TEdit;
    GroupBox3: TGroupBox;
    Label29: TLabel;
    cboCSTCOFINS: TComboBox;
    Label19: TLabel;
    edtBaseCofins: TEdit;
    Label16: TLabel;
    edtValorCofins: TEdit;
    Label30: TLabel;
    edtPercentualCOFINS: TEdit;
    GroupBox4: TGroupBox;
    Label27: TLabel;
    cboCSTPIS: TComboBox;
    Label18: TLabel;
    edtBasePIS: TEdit;
    Label15: TLabel;
    edtValorPIS: TEdit;
    Label28: TLabel;
    edtPercentualPIS: TEdit;
    SpeedButton4: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure cboProdutoCloseUp(Sender: TObject);
    procedure grdItensCellClick(Column: TColumn);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure CornerButton2Click(Sender: TObject);
    procedure edtCodigoItemChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure CornerButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
    ItemEntrada            : TGenericEntidade;
    MapperItemEntrada      : TMapper;
    ControllerProdutos     : TControllerProdutos;
    procedure MapearCamposItemEntrada;
    procedure PersistirItemEntrada;
    procedure ConsultarDataSetItemEntrada(Codigo: string ='');
    procedure ConsultarDataSetPagamento(Codigo: string ='');
    procedure GetEntrada(CodigoEntrada: string);
    procedure AjustaTamanhoGrid;
    procedure CarregarProdutos;
    procedure GetItemEntrada;
    procedure CarregarEstoques;
    procedure SalvarItens(CodigoEntrada: string);
    procedure MapearCamposEntrada;
  public
    { Public declarations }
  end;

var
  FormEntradaDetalhes: TFormEntradaDetalhes;

implementation

{$R *.dfm}

uses ControllerEntrada,  ControllerFornecedores, DBUtils, Principal,
  ControllerNFE, ControllerPagamento;

procedure TFormEntradaDetalhes.BitBtn1Click(Sender: TObject);
begin
  if cboProduto.Text<> '' then
  begin
    inherited;
    PersistirItemEntrada;
    edtOrdem.Text        := '';
    edtCodigoItem.Text   := '';
    cboProduto.KeyValue  := Null;
    edtQuantidade.Text   := '1';
    edtValor.Text        := '0';
    edtValor.Text        := '1';
  end;
end;

procedure TFormEntradaDetalhes.PersistirItemEntrada;
var
  DescricaoProduto: string;
  Update: Boolean;
  Count: Integer;
begin
  with MapperItemEntrada do
  begin
    if edtOrdem.text = '' then
    begin
      Entidade := TEntidadeFactory.Criar(tpItemEntrada);
      DataSet := srcItens.DataSet;
    end;

    ComponentToEntidade;

    if edtOrdem.text = '' then
    begin
      srcItens.DataSet.append;
      Count := srcItens.DataSet.RecordCount + 1;
      DescricaoProduto := cboProduto.text;
      SendValueToFieldEntidade('Ordem', inttostr(Count));
      SendValueToFieldEntidade('Codigo', inttostr(Count));
      SendValueToFieldDataSet('Descricao', DescricaoProduto);
      SendEntidadeToDataSet;
      srcItens.DataSet.Post;
    end
    else
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
    end;
  end;
end;

procedure TFormEntradaDetalhes.ConsultarDataSetItemEntrada(Codigo: string ='');
var
  CodigoEntrada: string;
begin
  CodigoEntrada:= ifthen( Codigo <> '',
                            Codigo ,
                            MapperEntidade.DataSet.FieldByName('Codigo').AsString);

  srcItens.Dataset := Controller.GetSelect( ConsultaItemEntrada,
                      '"CodigoEntrada"=' +
                      ifthen(CodigoEntrada <> '',CodigoEntrada,'0') ,
                      CamposItemEntrada);

  MapperItemEntrada.Dataset:= srcItens.Dataset;
end;

procedure TFormEntradaDetalhes.ConsultarDataSetPagamento(Codigo: string);
var
  CodigoEntrada: string;
begin
  CodigoEntrada:= ifthen( Codigo <> '',
                            Codigo ,
                            MapperEntidade.DataSet.FieldByName('Codigo').AsString);

   srcPagamentos.Dataset :=  Controller.GetSelect(
                            ' Pagamento T1 '+
                            ' left join Pessoa pess on pess."Codigo" = T1."CodigoPessoa" '+
                            ' left join FormaPagamento form on form."Codigo" = T1."CodigoFormaPagamento"' ,
                            ' T1."CodigoEntrada" = '+ ifthen(CodigoEntrada <> '',CodigoEntrada,'0'),
                            ' T1.*,form."Descricao" as FormaPagamento, Valor as ValorLiquido,  '''' as Selecionado '  );
end;

procedure TFormEntradaDetalhes.GetEntrada(CodigoEntrada: string);
begin
  Condicao := 'T1.Codigo=' + CodigoEntrada;
  srcEntidade.Dataset := Controller.GetSelect(ControllerEntrada.ConsultaTabela, Condicao, CamposEntrada);
  MapperEntidade.Dataset := srcEntidade.Dataset;
end;


procedure TFormEntradaDetalhes.grdItensCellClick(Column: TColumn);
begin
  inherited;
  if (Operacao = 'Update') or (Operacao = 'Insert') then
  begin
    GetItemEntrada;
  end;
end;

procedure TFormEntradaDetalhes.GetItemEntrada;
begin
  if ItemEntrada <> nil then
    FreeandNil(ItemEntrada);
  ItemEntrada := TEntidadeFactory.Criar(tpItemEntrada);
  MapperItemEntrada.Entidade := ItemEntrada;
  MapperItemEntrada.Dataset := srcItens.DataSet;
  MapperItemEntrada.SendDataSetToEntidade;
  MapperItemEntrada.EntidadeToComponent;
end;

procedure TFormEntradaDetalhes.btnAlterarClick(Sender: TObject);
begin
  inherited;
  //AjustaTamanhoGrid;
end;

procedure TFormEntradaDetalhes.btnCancelarClick(Sender: TObject);
begin
  inherited;
  AjustaTamanhoGrid;
end;

procedure TFormEntradaDetalhes.btnConfirmarClick(Sender: TObject);
var
  i:integer;
  CodigoEntrada: string;
begin
  if Operacao = 'Insert' then
     edtCodigo.Text := TControllerEntrada(Controller).GetMaxEntrada;
  CodigoEntrada:=  edtCodigo.Text;
  inherited;
  SalvarItens(CodigoEntrada);
  GetEntrada(CodigoEntrada);
  AjustaTamanhoGrid;
end;

procedure TFormEntradaDetalhes.SalvarItens(CodigoEntrada: string);
begin
  TControllerEntrada(Controller).ExcluirItens(CodigoEntrada);

  if MapperItemEntrada.Entidade = nil then
     MapperItemEntrada.Entidade := TEntidadeFactory.Criar(tpItemEntrada);

  srcItens.dataSet.first;
  while not srcItens.dataSet.eof do
  begin
    MapperItemEntrada.SendDataSetToEntidade;
    MapperItemEntrada.SendValueToFieldEntidade('CodigoEntrada', CodigoEntrada);
    Controller.Inserir(MapperItemEntrada.Entidade);
    srcItens.dataSet.next;
  end;
  ConsultarDataSetItemEntrada(CodigoEntrada);
end;


procedure TFormEntradaDetalhes.SpeedButton1Click(Sender: TObject);
var
  Arquivo, CodigoFonecedor: string;
begin
  inherited;
  OpenDialog1.FileName   :=  '';
  OpenDialog1.Title      := 'Selecione a NFE';
  OpenDialog1.DefaultExt := '*.XML';
  OpenDialog1.Filter     := 'Arquivos NFE (Arquivos XML (*.XML)|*.XML';
  OpenDialog1.InitialDir := extractfilePath(application.exename);
  if OpenDialog1.Execute then
  begin
     Arquivo := OpenDialog1.FileName;
     TControllerEntrada(Controller).DataSetitems := srcItens.DataSet;

     TControllerEntrada(Controller).ImportarNFe(Arquivo);

     edtValorDesconto.Text  := floattostr(TControllerEntrada(Controller).GetValorDesconto);
     edtValorDocumento.Text := floattostr(TControllerEntrada(Controller).GetValorDocumento);
     edtValorFrete.Text     := floattostr(TControllerEntrada(Controller).GetValorFrete);
     edtChaveAcesso.text    := TControllerEntrada(Controller).GetChaveAcesso;
     edtEspecie.text        := TControllerEntrada(Controller).GetEspecie;
     edtSerie.text          := TControllerEntrada(Controller).GetSerie;
     edtNumeroDocumento.text:= TControllerEntrada(Controller).GetNumeroDocumento;
     dateDataEmissao.Date   := TControllerEntrada(Controller).GetDataEmissao;
     cboTipoFrete.itemindex := TControllerEntrada(Controller).GetTipoFrete;

     CodigoFonecedor        := TControllerEntrada(Controller).GetCodigoFornecedor;

     if CodigoFonecedor <> '' then
        cboCodigoFornecedor.KeyValue := CodigoFonecedor
     else
        showmessage('Fornecedor nao cadastrado');
  end;
  CarregarProdutos;
end;

procedure TFormEntradaDetalhes.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if edtCodigo.Text <> '' then
  begin
    if TControllerEntrada(Controller).GeraPagamento( cboCodigoFornecedor.keyvalue,
                                                     edtNumeroDocumento.text,
                                                     srcEntidade.dataset.fieldbyname('CodigoFormaPagamento').asstring,
                                                     edtValorDocumento.text,
                                                     '1',
                                                     edtCodigo.Text ) then
       TControllerEntrada(Controller).AlterarCompraParaBaixada( edtCodigo.Text );

  end;
end;

procedure TFormEntradaDetalhes.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if ( edtCodigo.Text<> '') and (edtChaveAcesso.Text <> '') then
  begin
     if TContollerNFE.CriarNFE( DEVOLUCAO_FORNECEDOR ,
                              srcEntidade.DataSet,
                              srcItens.DataSet,
                              srcPagamentos.DataSet ) then
      TControllerEntrada(Controller).AlterarCompraParaDevolvida( edtCodigo.Text );
  end;
end;

procedure TFormEntradaDetalhes.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  FormPrincipal.ActFornecedores.Execute;

  FillLookUpCombobox( tpPessoa, cboCodigoFornecedor,'Codigo','Nome',
   'Tipo=''FORNECEDOR''' );
end;

procedure TFormEntradaDetalhes.btnExcluirClick(Sender: TObject);
begin
  inherited;
  AjustaTamanhoGrid;
end;

procedure TFormEntradaDetalhes.btnInserirClick(Sender: TObject);
begin
  ConsultarDataSetItemEntrada('0');
  inherited;
  AjustaTamanhoGrid;
  MapperEntidade.EntidadeToComponent;
  edtQuantidade.Text  := '1';
  edtFator.Text       := '1';
  dateData.Date       := date;
  dateDataEmissao.Date:= date;
  cboSituacao.ItemIndex := 0;
end;

procedure  TFormEntradaDetalhes.CarregarProdutos;
begin
   srcProdutos.DataSet := ControllerProdutos.GetSelect( TEntidadeFactory.GetNameEntidade(tpProduto)+
                                                       ' T1 ','0=0','"Codigo", "Descricao"');
end;

procedure  TFormEntradaDetalhes.CarregarEstoques;
begin
   srcEstoque.DataSet := ControllerProdutos.GetSelect('Estoque T1 ','0=0','"Codigo", "Descricao"');
end;

procedure TFormEntradaDetalhes.cboProdutoCloseUp(Sender: TObject);
begin
  inherited;
  if cboProduto.text <>  '' then
     edtCodigoItem.text := inttostr( Integer(cboProduto.KeyValue ));
end;

procedure TFormEntradaDetalhes.CornerButton1Click(Sender: TObject);
begin
  inherited;
  srcItens.DataSet.Delete;
end;

procedure TFormEntradaDetalhes.CornerButton2Click(Sender: TObject);
var
  CodigoEntrada: string;
begin
  CodigoEntrada := FormPrincipal.ShowEntradaListagem;
  if CodigoEntrada <> '' then
  begin
    GetEntrada(CodigoEntrada);
    MapperEntidade.SendValueToFieldEntidade('CodigoFornecedor',
    MapperEntidade.DataSet.FieldByName('CodigoFornecedor').AsString);
    MapperEntidade.EntidadeToComponent;
    ConsultarDataSetItemEntrada(CodigoEntrada);
    ConsultarDataSetPagamento(CodigoEntrada);
    Alterar;
  end;
end;

procedure TFormEntradaDetalhes.edtCodigoItemChange(Sender: TObject);
begin
  inherited;
  cboProduto.KeyValue := edtCodigoItem.Text;
end;

procedure TFormEntradaDetalhes.AjustaTamanhoGrid;
begin

end;

procedure TFormEntradaDetalhes.FormCreate(Sender: TObject);
var
  ItemEntrada:TGenericEntidade;
  CodigEntrada: string;
begin
  Controller         := TControllerEntrada.Create;
  ControllerProdutos := TControllerProdutos.Create;
  Entidade           := TEntidadeFactory.Criar(tpEntrada);
  Tabela             := ControllerEntrada.ConsultaTabela;
  Campos             := ControllerEntrada.CamposEntrada;
  ItemEntrada        := TEntidadeFactory.Criar(tpItemEntrada);
  Condicao           := '0=1';

  inherited;
  MapearCamposEntrada;
  MapearCamposItemEntrada;

  //FillCombobox( tpFormaPagamento , cboCodigoFormaPagamento);
  FillCombobox( tpUnidadeMedida, cboUnidadeMedida );
  FillLookUpCombobox( tpPessoa, cboCodigoFornecedor,'Codigo','Nome',
   'Tipo=''FORNECEDOR''' );
  CarregarProdutos;
  CarregarEstoques;


end;

procedure TFormEntradaDetalhes.MapearCamposItemEntrada;
begin
  MapperItemEntrada   := TMapper.create(nil, srcItens.DataSet );

  with MapperItemEntrada do
  begin
    Associar('Codigo', nil);
    Associar('Ordem', edtOrdem);
    Associar('CodigoFilial', nil);
    Associar('CodigoEntrada', nil);
    Associar('Total', nil);
    Associar('Desconto', nil);
    Associar('CodigoProduto', edtCodigoItem);
    Associar('Quantidade', edtQuantidade);
    Associar('Valor', edtValor);
    Associar('CodigoProduto', cboProduto);
    Associar('CodigoEstoque', cboEstoque);
    Associar('Fator', edtFator);


    Associar('BaseICMS', edtBaseICMS);
    Associar('BaseIPI', edtBaseIPI);
    Associar('BasePIS', edtBasePIS);
    Associar('BaseCOFINS', edtBaseCOFINS);

    Associar('ValorICMS', edtValorICMS);
    Associar('ValorIPI', edtValorIPI);
    Associar('ValorPIS', edtValorPIS);
    Associar('ValorCOFINS', edtValorCOFINS);

    Associar('PercentualICMS', edtPercentualICMS);
    Associar('PercentualIPI', edtPercentualIPI);
    Associar('PercentualPIS', edtPercentualPIS);
    Associar('PercentualCOFINS', edtPercentualCOFINS);

    Associar('CST', cboCST);
    Associar('CSTIPI', cboCSTIPI);
    Associar('CSTPIS', cboCSTPIS);
    Associar('CSTCOFINS', cboCSTCOFINS);

    Associar('CFOP', edtCFOP);
  end;

end;


procedure TFormEntradaDetalhes.MapearCamposEntrada;
begin
  with MapperEntidade do
  begin
    associar('Codigo', edtCodigo);
    associar('Data', dateData);
    associar('CodigoFornecedor', cboCodigoFornecedor);
    associar('NumeroDocumento', edtNumeroDocumento);
    //associar('CodigoFormaPagamento', cboCodigoFormaPagamento);
    associar('ValorFrete', edtValorFrete);
    //associar('ValorCustofinanceiro', edtValorCustofinanceiro);
    //associar('ValorDespesas', edtValorDespesas);
    associar('TipoFrete', cboTipoFrete);
    associar('DataEmissao', dateDataEmissao);
    associar('ValorDocumento', edtValorDocumento);
    associar('ChaveAcesso', edtChaveAcesso);
    //associar('ValorSeguro', edtValorSeguro);
    //associar('ValorIPI', edtValorIPI);
    //associar('ValorPIS', edtValorPIS);
    //associar('ValorCONFINS', edtValorCONFINS);
    //associar('ValorICMS', edtValorICMS);
    //associar('ValorICMSSubstituto', edtValorICMSSubstituto);
    associar('ValorDesconto', edtValorDesconto);
    associar('Situacao', cboSituacao);
    associar('Especie', edtEspecie);
    associar('Serie', edtSerie);
  end;
end;

end.
