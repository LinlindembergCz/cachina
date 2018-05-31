unit PacienteDetalhes;

interface

uses
  TemplateDetalhesBase, Vcl.Controls, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  VCL.Dialogs,VCL.Forms,Vcl.DBGrids, Vcl.ComCtrls, System.Classes,
  Vcl.ExtCtrls,Vcl.Buttons, Sysutils, Dateutils;

type
  TFormPacienteDetalhes = class(TTemplateFormBaseDetalhes)
    Label2: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    edtEndereco: TEdit;
    Label4: TLabel;
    edtTelefones: TEdit;
    Label5: TLabel;
    Label7: TLabel;
    edtNaturalidade: TEdit;
    Label9: TLabel;
    cboReligiao: TComboBox;
    Label11: TLabel;
    cboCodigoConvenio: TComboBox;
    Label13: TLabel;
    Label12: TLabel;
    edtNumeroCarteira: TEdit;
    Label10: TLabel;
    TabControl2: TPageControl;
    TabSheet3: TTabSheet;
    memoQueixa: TMemo;
    TabSheet4: TTabSheet;
    memoAntecedentes: TMemo;
    TabSheet5: TTabSheet;
    memoMedicacoes: TMemo;
    cboProfissao: TComboBox;
    cboCID: TComboBox;
    Label1: TLabel;
    cboUF: TComboBox;
    cboMunicipio: TComboBox;
    Label6: TLabel;
    Label14: TLabel;
    cboBairro: TComboBox;
    GroupBox1: TGroupBox;
    Label16: TLabel;
    edtNomePai: TEdit;
    Label17: TLabel;
    edtNomeMae: TEdit;
    Label18: TLabel;
    edtRG: TEdit;
    SpeedButton2: TSpeedButton;
    edtEmail: TEdit;
    Label15: TLabel;
    lbIdade: TLabel;
    dateNascimento: TDateTimePicker;
    dateDataEmissao: TDateTimePicker;
    Label19: TLabel;
    Label20: TLabel;
    cboResponsavel: TComboBox;
    btnPesquisa: TButton;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure dateNascimentoChange(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure CalculaIdade;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPacienteDetalhes: TFormPacienteDetalhes;

implementation

{$R *.dfm}

uses EntidadeFactory, ControllerPaciente, Principal, DBUtils, Mapper,
  RelFichaTriagem, TabelaCID, DialogsUtils;

procedure TFormPacienteDetalhes.btnAlterarClick(Sender: TObject);
begin
  inherited;
  CalculaIdade;
end;

procedure TFormPacienteDetalhes.btnConfirmarClick(Sender: TObject);
begin
  if (Operacao = 'Insert') then
  begin
    if (TControllerPaciente(Controller).NomeExiste(edtNome.Text,
                                                   edtNumeroCarteira.Text))  then
    begin
       showmessage('Paciente já se encontrado cadastrado!');
       abort;
    end
    else
    begin
       Condicao := 'T1."Nome"='+ quotedstr(edtNome.Text);
    end;
  end;
  inherited;
end;

procedure TFormPacienteDetalhes.btnInserirClick(Sender: TObject);
begin
  inherited;
  dateDataEmissao.Date := date;
end;

procedure TFormPacienteDetalhes.btnPesquisaClick(Sender: TObject);
var
  CodigoPaciente: string;
begin
  inherited;
  CodigoPaciente:= FormPrincipal.ShowPacientePesquisa;
  if CodigoPaciente <> '' then
  begin
    Condicao := 'T1."Codigo"=' +CodigoPaciente;
    GetDataset;
    MapperEntidade.Dataset := srcEntidade.Dataset;
    MapperEntidade.EntidadeToComponent;
  end;
end;

procedure TFormPacienteDetalhes.Button1Click(Sender: TObject);
begin
  inherited;
  if (Operacao = 'Insert') or (Operacao = 'Update') then
  begin
    TDialogs.MensagemAtencao('VOCE PRECISA CONFIRMAR O CADASTRO!!!');
    abort;
  end;

  if MapperEntidade.Dataset.FieldByName('Codigo').AsString <> '' then
     FormPrincipal.ShowRelFichaTriagem( MapperEntidade.Dataset );
end;

procedure TFormPacienteDetalhes.dateNascimentoChange(Sender: TObject);
begin
  inherited;
  CalculaIdade;
end;

Procedure TFormPacienteDetalhes.FormCreate(Sender: TObject);
var
 TabelaCID : TTabelaCID;
begin
  Controller := TControllerPaciente.Create;
  Entidade   := TEntidadeFactory.Criar(tpTriagem);
  Campos     := ControllerPaciente.CamposPaciente;
  Tabela     := ControllerPaciente.SQLConsultaPaciente;

  inherited;
  CampoCodigo:= 'T1."Codigo"';
  with MapperEntidade do
  begin
    Associar('Codigo',  nil );
    Associar('Antecedentes',  memoAntecedentes );
    Associar('CID',  cboCID  );
    Associar('CodigoConvenio', cboCodigoConvenio );
    Associar('Nome', edtNome );
    Associar('DataNascimento', dateNascimento );
    Associar('Endereco',  edtEndereco  );
    Associar('Medicacoes', memoMedicacoes );
    Associar('Nacionalidade', nil );
    Associar('Naturalidade', edtNaturalidade );

    Associar('NumeroCarteira', edtNumeroCarteira );
    Associar('Profissao',  cboProfissao );
    Associar('QueixaInicial', memoQueixa );
    Associar('Religiao', cboReligiao );
    Associar('Telefones',  edtTelefones);
    Associar('UF',  cboUF);
    Associar('Municipio',  cboMunicipio);
    Associar('Bairro',  cboBairro);
    //Associar('Cep',  edtCep);
    Associar('NomePai',  edtNomePai);
    Associar('NomeMae',  edtNomeMae);
    Associar('RG', edtRG );
    //Associar('OE', edtOE);
    Associar('DataEmissao',dateDataEmissao );
    Associar('Email', edtEmail);
    Associar('CodigoEspecialista', cboResponsavel);
  end;
//dateDataEmissao.InputSupport:= true;
  FillCombobox(tpConvenio,cboCodigoConvenio);
  FillCombobox(tpEspecialista,cboResponsavel);

  TabelaCID := TTabelaCID.create;
  cboCID.items:= TabelaCID.CIDList;
  TabelaCID.Free;
end;

procedure TFormPacienteDetalhes.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  FormPrincipal.ActConvenio.Execute;
end;

procedure TFormPacienteDetalhes.CalculaIdade;
begin
  try
    lbIdade.caption := 'Idade : ' + inttostr(Dateutils.YearsBetween(date, dateNascimento.Date)) + ' anos';
  except
  end;
end;

end.
