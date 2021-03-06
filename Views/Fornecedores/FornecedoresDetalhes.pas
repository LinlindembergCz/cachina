unit FornecedoresDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TemplateDetalhesComTabGrid, GenericEntidade,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls, Mapper,
  Vcl.Buttons, Vcl.Menus, ACBrBase, ACBrSocket, ACBrCEP;

type
  TFormFornecedoresDetalhes = class(TTemplateFormComTabGridDetalhes)
    tabProdutoDetalhes: TPageControl;
    TabSheet7: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label22: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Nome: TEdit;
    RazaoSocial: TEdit;
    CPFCNPJ: TEdit;
    Telefone: TEdit;
    Email: TEdit;
    TabSheet3: TTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Endereco: TEdit;
    Bairro: TEdit;
    Municipio: TEdit;
    UF: TComboBox;
    CEP: TEdit;
    Complemento: TEdit;
    TabSheet4: TTabSheet;
    Label14: TLabel;
    Label15: TLabel;
    Label21: TLabel;
    edtNomeContato: TEdit;
    edtTelefoneContato: TEdit;
    edtCPFContato: TEdit;
    btnInserirContato: TButton;
    btnConfirmarContato: TButton;
    btnRemoverContato: TButton;
    DBGrid2: TDBGrid;
    TabSheet6: TTabSheet;
    Observacao: TMemo;
    srcContatos: TDataSource;
    SpeedButton1: TSpeedButton;
    SpeedButton6: TSpeedButton;
    ACBrCEP1: TACBrCEP;
    Label11: TLabel;
    InscricaoEstadual: TEdit;
    Label45: TLabel;
    CodigoIBGE: TEdit;
    procedure btnConfirmarContatoClick(Sender: TObject);
    procedure btnInserirContatoClick(Sender: TObject);
    procedure btnRemoverContatoClick(Sender: TObject);
    procedure ConsultarContatos;
    procedure DBGrid2CellClick(Column: TColumn);
    procedure edtCPFCNPJExit(Sender: TObject);
    procedure TabSheet4Enter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ACBrCEP1BuscaEfetuada(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  private
    Contatos: TGenericEntidade;
    //ContatosFieldMapList  : TStringList;
    MapperContatos:TMapper;
    procedure MapearCampoContatos;
    { Private declarations }
  public
    { Public declarations }
  end;

const
  CondicaoTipo = ' "Tipo" LIKE ''%FORNECEDOR%'' ';
var
  FormFornecedoresDetalhes: TFormFornecedoresDetalhes;

implementation

{$R *.dfm}


uses
  ControllerFornecedores, EntidadeFactory, DBUtils, DialogsUtils,
  Principal;

{$R *.dfm}

procedure TFormFornecedoresDetalhes.FormCreate(Sender: TObject);
begin
  Controller := TControllerfornecedores.Create;
  Entidade   := TEntidadeFactory.Criar(tpPessoa);
  Contatos   := TEntidadeFactory.Criar(tpContatos);
  Condicao   := CondicaoTipo;
  inherited;
  MapearComponentes;
  MapearCampoContatos;
  CampoPesquisa := 'Nome';
end;


procedure TFormFornecedoresDetalhes.SpeedButton1Click(Sender: TObject);
//var
  //Form:TFormConsultaCNPJ;
begin
  inherited;
   {
  Form := TFormConsultaCNPJ( FormPrincipal.ShowForm(TFormConsultaCNPJ, nil, true ) );
  if Form.ModalResult = mrOk  then
  begin
     Nome.Text        := Form.EditFantasia.Text;
     CPFCNPJ.Text     := Form.EditCNPJ.Text;
     RazaoSocial.Text := Form.EditRazaoSocial.Text;
     Endereco.Text    := Form.EditEndereco.Text +' '+Form.EditNumero.Text;
     Bairro.Text      := Form.EditBairro.Text;
     Municipio.Text   := Form.EditCidade.Text;
     UF.Text          := Form.EditUF.Text;
     CEP.Text         := Form.EditCEP.Text;
     Complemento.Text := Form.EditComplemento.Text;
  end;
  Form.Free;
  }
end;

procedure TFormFornecedoresDetalhes.SpeedButton6Click(Sender: TObject);
var
buscacep: TACBrCEP;
begin
  inherited;
   ACBrCEP1.WebService := TACBrCEPWebService( wsViaCep ) ;
   ACBrCEP1.ChaveAcesso := '1STa9eKhhfKvc7Ljh6W6CO5Kr/bFOl.';
   ACBrCEP1.BuscarPorCEP(CEP.Text);

end;

procedure  TFormFornecedoresDetalhes.ConsultarContatos;
begin
  if (Operacao <> 'Insert') then
     srcContatos.Dataset:= Controller.GetDataset(Contatos,
                           '"CodigoCliente"='+quotedstr(srcEntidade.DataSet.FieldByName('Codigo').AsString))
  else
     srcContatos.Dataset:= Controller.GetDataset(Contatos,'"CodigoCliente"=0');

  if MapperContatos <> nil then
     MapperContatos.Dataset := srcContatos.Dataset;
end;

procedure TFormFornecedoresDetalhes.MapearCampoContatos;
begin
  ConsultarContatos;

  MapperContatos := TMapper.Create(Contatos,srcContatos.DataSet);
  MapperContatos.Dataset := srcContatos.Dataset;
  with MapperContatos do
  begin
    Associar('CodigoCliente', nil);
    Associar('Nome', edtNomeContato);
    Associar('Telefone', edtTelefoneContato);
    Associar('CPF', edtCPFContato);
  end;
end;

procedure TFormFornecedoresDetalhes.TabSheet4Enter(Sender: TObject);
begin
  inherited;
  ConsultarContatos;
end;

procedure TFormFornecedoresDetalhes.ACBrCEP1BuscaEfetuada(Sender: TObject);
begin
  inherited;
  Endereco.Text := ACBrCEP1.Enderecos.Objects[0].Logradouro;
  bairro.Text := ACBrCEP1.Enderecos.Objects[0].bairro;
  UF.Text := ACBrCEP1.Enderecos.Objects[0].UF;
  Municipio.Text := ACBrCEP1.Enderecos.Objects[0].Municipio;
  Complemento.Text := ACBrCEP1.Enderecos.Objects[0].Complemento;
  CodigoIBGE.Text := ACBrCEP1.Enderecos.Objects[0].IBGE_Municipio;
end;

procedure TFormFornecedoresDetalhes.btnConfirmarClick(Sender: TObject);
begin
  MapperEntidade.Associar('Tipo', nil,'FORNCEDOR');
  inherited;
end;

procedure TFormFornecedoresDetalhes.btnConfirmarContatoClick(Sender: TObject);
var
  CodigoCliente: string;
begin
  inherited;
  if  srcEntidade.DataSet.FieldByName('Codigo').AsString <> '' then
  begin
     MapperContatos.ComponentToEntidade;
     CodigoCliente:= srcEntidade.DataSet.FieldByName('Codigo').AsString;
     MapperContatos.SendValueToFieldEntidade('Codigo', srcContatos.DataSet.FieldByName('Codigo').AsString);
     MapperContatos.SendValueToFieldEntidade( 'CodigoCliente', CodigoCliente);

     if not srcContatos.Dataset.Locate('CPF',edtCPFContato.Text,[]) then
        Controller.Inserir(Contatos)
     else
        Controller.Atualizar(Contatos);

     ConsultarContatos;
  end
  else
     showmessage('N�o existe cliente confirmado!');
end;

procedure TFormFornecedoresDetalhes.btnRemoverContatoClick(Sender: TObject);
begin
  inherited;
  if not srcContatos.DataSet.IsEmpty then
  begin
     MapperContatos.SendValueToFieldEntidade('Codigo',
     srcContatos.DataSet.FieldByName('Codigo').AsString);

     if TDialogs.ConfirmarExclusao then
     begin
       Controller.Excluir(Contatos);
       srcContatos.DataSet.delete;
     end;
  end;
end;

procedure TFormFornecedoresDetalhes.DBGrid2CellClick(Column: TColumn);
begin
  inherited;
  if Contatos <> nil then
    FreeandNil(Contatos);
  Contatos := TEntidadeFactory.Criar(tpContatos);
  MapperContatos.Entidade := Contatos;
  MapperContatos.Dataset := srcContatos.DataSet;
  MapperContatos.SendDataSetToEntidade;
  MapperContatos.EntidadeToComponent;
end;

procedure TFormFornecedoresDetalhes.btnInserirContatoClick(Sender: TObject);
begin
  MapperContatos.SendNullToComponent;
  inherited;
end;

procedure TFormFornecedoresDetalhes.btnPesquisarClick(Sender: TObject);
begin
  Condicao := CondicaoTipo;
  inherited;
end;

procedure TFormFornecedoresDetalhes.edtCPFCNPJExit(Sender: TObject);
var
  DataSet: TDataset;
  _cpfcnpj: string;
begin
  inherited;
  _cpfcnpj := CPFCNPJ.text;
  if CPFCNPJ.text <> '' then
  begin
     if length(_cpfcnpj) = 11 then
     begin
        CPFCNPJ.text :=copy(_cpfcnpj,0,3)+'.'+copy(_cpfcnpj,4,3)+'.'+copy(_cpfcnpj,7,3)+'-'+copy(_cpfcnpj,10,2);
     end
     else
     if length(_cpfcnpj) = 14 then
     begin
        CPFCNPJ.text:=copy(_cpfcnpj,0,2)+'.'+copy(_cpfcnpj,3,3)+'.'+copy(_cpfcnpj,6,3)+'/'+copy(_cpfcnpj,9,4)+'-'+copy(_cpfcnpj,13,2);
     end;
  end;
  
end;

end.
