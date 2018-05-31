unit EspecialistaDetalhes2;

interface

uses TemplateDetalhesBase, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Controls,
  Data.DB, System.Classes, Vcl.ExtCtrls, Mapper, GenericEntidade, Vcl.ComCtrls,
  Vcl.Buttons;


type
  TFormEspecialistaDetalhes2 = class(TTemplateFormBaseDetalhes)
    StringGrid1: TDBGrid;
    lbDescricao: TLabel;
    edtDescricao: TEdit;
    srcEspecialistaConvenio: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    lbNumero: TLabel;
    edtNumero: TEdit;
    Label2: TLabel;
    cboConselho: TComboBox;
    Label1: TLabel;
    edtNumeroOperadora: TEdit;
    Label4: TLabel;
    Label3: TLabel;
    edtIndentificador: TEdit;
    Button1: TButton;
    Button2: TButton;
    cboConvenio: TComboBox;
    DBGrid1: TDBGrid;
    TabSheet3: TTabSheet;
    Label5: TLabel;
    edtLogin: TEdit;
    Label6: TLabel;
    edtSenha: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure StringGrid1CellClick(Column: TColumn);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);
  private
    procedure SelectEspecialistaConvenio;
    { Private declarations }
  public
    { Public declarations }
     MapperEspecialistaConvenio: TMapper;
     EspecialistaConvenio:TGenericEntidade;
     FieldsEspecialistaConvenio: TStringList;
  end;

var
  FormEspecialistaDetalhes2: TFormEspecialistaDetalhes2;

implementation

{$R *.dfm}

uses ControllerTabelas, EntidadeFactory, DBUtils, SysUtils, Variants;

procedure TFormEspecialistaDetalhes2.btnAlterarClick(Sender: TObject);
begin
  inherited;
  SelectEspecialistaConvenio;
end;

procedure TFormEspecialistaDetalhes2.btnInserirClick(Sender: TObject);
begin
  inherited;
  SelectEspecialistaConvenio;
end;

procedure TFormEspecialistaDetalhes2.Button1Click(Sender: TObject);
begin
  inherited;
  MapperEspecialistaConvenio.ComponentToEntidade;
  if not srcEspecialistaConvenio.DataSet.locate('Convenio',
     VarArrayOf([cboConvenio.Text ]) , []) then
  begin
     MapperEspecialistaConvenio.SendValueToFieldEntidade('CodigoEspecialista',
     srcEntidade.Dataset.FieldByName('Codigo').AsString);
     Controller.Inserir(EspecialistaConvenio);
  end
  else
  begin
    Controller.Atualizar(EspecialistaConvenio);
  end;
  SelectEspecialistaConvenio;
end;

procedure TFormEspecialistaDetalhes2.Button2Click(Sender: TObject);
begin
  inherited;
  if EspecialistaConvenio <> nil then
  begin
     MapperEspecialistaConvenio.SendDataSetToEntidade;
     if not srcEspecialistaConvenio.DataSet.IsEmpty then
        Controller.Excluir(EspecialistaConvenio);
     SelectEspecialistaConvenio;
  end;
end;

procedure TFormEspecialistaDetalhes2.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if not srcEspecialistaConvenio.DataSet.IsEmpty then
  begin
     MapperEspecialistaConvenio.SendDataSetToEntidade;
     MapperEspecialistaConvenio.EntidadeToComponent;
  end;
end;

procedure TFormEspecialistaDetalhes2.FormCreate(Sender: TObject);
begin
  Controller := TControllertabelas.Create;
  Entidade   := TEntidadeFactory.Criar(tpEspecialista);
  inherited;
  CampoCodigo:= '"Codigo"';
  with MapperEntidade do
  begin
    associar('Codigo', nil);
    associar('Descricao', edtDescricao);
    associar('Numero', edtNumero);
    associar('NumeroOperadora', edtNumeroOperadora);
    associar('Conselho', cboConselho);
    associar('Login', edtLogin);
    associar('Senha', edtSenha);
  end;

  EspecialistaConvenio       := TEntidadeFactory.Criar( tpEspecialistaConvenio);
  MapperEspecialistaConvenio := TMapper.Create(EspecialistaConvenio, nil );
  with MapperEspecialistaConvenio do
  begin
     associar('Codigo', nil);
     associar('CodigoEspecialista', nil);
     associar('CodigoConvenio', cboConvenio);
     associar('Matricula', edtIndentificador);
  end;

  FillCombobox(tpConvenio,cboConvenio);

end;

procedure TFormEspecialistaDetalhes2.StringGrid1CellClick(Column: TColumn);
begin
  inherited;
  SelectEspecialistaConvenio;
end;

procedure TFormEspecialistaDetalhes2.SelectEspecialistaConvenio;
begin
  //Colocar na DAO
  srcEspecialistaConvenio.DataSet := Controller.GetSelect(TEntidadeFactory.GetNameEntidade(tpEspecialistaConvenio) +
  ' T1 inner Join Convenio con on con."Codigo" = T1."CodigoConvenio" ',
  '"CodigoEspecialista"=' + quotedstr(srcEntidade.DataSet.FieldByName('Codigo').AsString), 'T1.*, con."Descricao" as Convenio');
  if MapperEspecialistaConvenio <> nil then
    MapperEspecialistaConvenio.Dataset := srcEspecialistaConvenio.DataSet;
end;

end.
