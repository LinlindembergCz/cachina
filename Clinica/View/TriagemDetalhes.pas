unit TriagemDetalhes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, Dateutils,
  TemplateDetalhesComTabGrid, System.Rtti, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors, FMX.Memo,
  FMX.ListBox, FMX.Edit, FMX.DateTimeCtrls, Data.Bind.Components,
  Data.Bind.DBScope, Data.Bind.Grid, Data.DB, FMX.Layouts, FMX.Grid,
  FMX.TabControl, FMX.Ani;

type
  TFormTriagemDetalhes = class(TTemplateFormComTabGridDetalhes)
    Label2: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    edtEndereco: TEdit;
    Label4: TLabel;
    edtTelefones: TEdit;
    Label5: TLabel;
    dateNascimento: TCalendarEdit;
    lbIdade: TLabel;
    Label7: TLabel;
    edtNaturalidade: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    edtNascionalidade: TEdit;
    cboReligiao: TComboBox;
    cboProfissao: TComboBox;
    Label10: TLabel;
    Label11: TLabel;
    cboConvenio: TComboBox;
    edtNumeroCarteira: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    cboCID: TComboBox;
    TabControl2: TTabControl;
    TabItem3: TTabItem;
    memoQueixa: TMemo;
    TabItem4: TTabItem;
    memoAntecedentes: TMemo;
    TabItem5: TTabItem;
    memoMedicacoes: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTriagemDetalhes: TFormTriagemDetalhes;

implementation

{$R *.dfm}

uses ControllerPaciente, EntidadeFactory;

procedure TFormTriagemDetalhes.FormCreate(Sender: TObject);
begin

  Controller := TControllerPaciente.Create;
  Entidade   := TEntidadeFactory.Criar(tpTriagem);
  inherited;
  with MapperEntidade do
  begin
    Associar('Codigo',  nil );
    Associar('Antecedentes',  memoAntecedentes );
    Associar('CID',  cboCID  );
    Associar('Convenio', cboConvenio );
    Associar('DataNascimento', dateNascimento );
    Associar('Endereco',  edtEndereco  );
    Associar('Medicacoes', memoMedicacoes );
    Associar('Nacionalidade', edtNascionalidade );
    Associar('Naturalidade', edtNaturalidade );
    Associar('Nome', edtNome );
    Associar('NumeroCarteira', edtNumeroCarteira );
    Associar('Profissao',  cboProfissao );
    Associar('QueixaInicial', memoQueixa );
    Associar('Religiao', cboReligiao );
    Associar('Telefones',  edtTelefones);
  end;

end;

end.
