unit ImovelDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TemplateDetalhesComTabGrid,
  Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.FileCtrl;

type
  TFormImoveisDetalhes = class(TTemplateFormComTabGridDetalhes)
    PageControl1: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    edtTitulo: TEdit;
    Label1: TLabel;
    Label18: TLabel;
    edtAreaTotal: TEdit;
    edtAreaConstruida: TEdit;
    Label19: TLabel;
    edtGaragens: TEdit;
    Label20: TLabel;
    Label21: TLabel;
    edtQuartos: TEdit;
    edtAno: TEdit;
    Label22: TLabel;
    edtBanheiros: TEdit;
    edtSuites: TEdit;
    Label24: TLabel;
    Label25: TLabel;
    memoObservacao: TMemo;
    Label29: TLabel;
    TabSheet6: TTabSheet;
    FileListBoxfoto: TFileListBox;
    Image2: TImage;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Edit1: TEdit;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    Edit2: TEdit;
    Label8: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edtBairro: TEdit;
    edtEndereco: TEdit;
    Label14: TLabel;
    edtCidade: TEdit;
    cboUF: TComboBox;
    Label15: TLabel;
    Label16: TLabel;
    edtCEP: TEdit;
    edtComplemento: TEdit;
    Label17: TLabel;
    Label2: TLabel;
    cboCodigoResponsavel: TComboBox;
    Label3: TLabel;
    cboCodigoProprietario: TComboBox;
    Label9: TLabel;
    cboCodigoCliente: TComboBox;
    Label4: TLabel;
    cboCodigoSituacao: TComboBox;
    Label5: TLabel;
    cboFinalidade: TComboBox;
    Label6: TLabel;
    cboCodigoTipo: TComboBox;
    Label10: TLabel;
    dateDataCadastro: TDateTimePicker;
    Label11: TLabel;
    edtReferencia: TEdit;
    SpeedButton5: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label23: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    edtValorEntrada: TEdit;
    edtValorCondominio: TEdit;
    edtComissaoCorretor: TEdit;
    edtValorVenda: TEdit;
    chkPublicado: TCheckBox;
    chkEmplacado: TCheckBox;
    chkPermuta: TCheckBox;
    chkSuspenso: TCheckBox;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure TabSheet6Show(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    function RetornarPastaPadraoImovel: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormImoveisDetalhes: TFormImoveisDetalhes;

implementation

{$R *.dfm}

uses EntidadeFactory, ControllerTabelas, DBUtils, Principal;

procedure TFormImoveisDetalhes.Button1Click(Sender: TObject);
begin
  inherited;
  FormPrincipal.ShowUnidadeImovel(srcEntidade.DataSet.fieldbyname('Codigo').AsString);
end;

procedure TFormImoveisDetalhes.FormCreate(Sender: TObject);
begin
  Entidade:= TEntidadeFactory.criar(tpimovel);
  Controller := TControllerTabelas.create;
  inherited;
  with MapperEntidade do
  begin
    associar('Codigo', nil);
    associar('CodigoFilial', nil);
    associar('Referencia', edtReferencia);
    associar('CodigoResponsavel',  cboCodigoResponsavel);
    associar('CodigoCliente',  cboCodigoCliente);
    associar('CodigoClienteProprietario',  cboCodigoProprietario);
    associar('Endereco', edtEndereco);
    associar('Bairro', edtBairro);
    associar('Cidade', edtCidade);
    associar('Estado', cboUF);
    associar('Quartos', edtQuartos);
    associar('Suites', edtSuites);
    associar('Balheiros', edtBanheiros);
    associar('AreaTotal', edtAreaTotal);
    associar('AreaContruida', edtAreaConstruida);
    associar('ValorVenda', edtValorVenda);
    //associar('ValorAluguel', edtValorAluguel);
    associar('ValorCondominio', edtValorCondominio);
    associar('Complemento', edtComplemento);
    associar('Titulo', edtTitulo);
    associar('DataCadastro', dateDataCadastro);
    associar('CodigoTipo',  cboCodigoTipo);
    associar('CodigoSituacao',  cboCodigoSituacao);
    associar('Finalidade', cboFinalidade);
    associar('Observacao', memoObservacao);
    associar('ComissaoCorretor', edtComissaoCorretor);
    associar('Garagens', edtGaragens);
    associar('ValorEntrada', edtValorEntrada);
    //associar('DataVencimento', dateDataVencimento);
    associar('Publicado', chkPublicado);
    associar('Emplacado', chkEmplacado);
    associar('EstudaPermuta', chkPermuta);
    //associar('TextoAnuncio', edtTextoAnuncio);
    //associar('TextoVistoria', edtTextoVistoria);
    //associar('TextoCondicoesComerciais', edtTextoCondicoesComerciais);
    associar('Suspenso',chkSuspenso);
  end;
  {
  FillCombobox(tpImovelSituacao, cboCodigoSituacao);
  FillCombobox(tpImovelTipo, cboCodigoTipo);
  FillCombobox(tpFuncionarios, cboCodigoResponsavel,'0=0','"Codigo"','"Nome"');
  FillCombobox(tpPessoa, cboCodigoProprietario,' "Tipo"=''CLIENTE''','"Codigo"','"Nome"');
  FillCombobox(tpPessoa, cboCodigoCliente,' "Tipo"=''CLIENTE''','"Codigo"','"Nome"');
  }

end;

procedure TFormImoveisDetalhes.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  FormPrincipal.ActFuncionarios.execute;
end;

procedure TFormImoveisDetalhes.SpeedButton2Click(Sender: TObject);
begin
  inherited;
    FormPrincipal.ActClientes.execute;
end;

procedure TFormImoveisDetalhes.SpeedButton3Click(Sender: TObject);
begin
  inherited;
    FormPrincipal.ActSituacao.execute;
end;

procedure TFormImoveisDetalhes.SpeedButton4Click(Sender: TObject);
begin
  inherited;
    FormPrincipal.ActClientes.execute;
end;

procedure TFormImoveisDetalhes.SpeedButton5Click(Sender: TObject);
begin
  inherited;
    FormPrincipal.ActTipo.execute;
end;

procedure TFormImoveisDetalhes.TabSheet6Show(Sender: TObject);
begin
  inherited;
  FileListBoxFoto.Directory := RetornarPastaPadraoImovel;
  FileListBoxFoto.Update;
end;

function TFormImoveisDetalhes.RetornarPastaPadraoImovel:string;
begin
  {
  if directoryExists(BDPrincipal.ConfiguracaoconfPastaVirtual.asstring+'\'+
  BDImobiliaria.ImovelimovReferencia.asstring) then
     result:= BDPrincipal.ConfiguracaoconfPastaVirtual.asstring+'\'+
     BDImobiliaria.ImovelimovReferencia.asstring
  else
  if directoryExists(BDPrincipal.ConfiguracaoconfPastaVirtual.asstring) then
     result:= BDPrincipal.ConfiguracaoconfPastaVirtual.asstring;
  }
end;

end.
