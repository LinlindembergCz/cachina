unit AlterarProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, strUtils,
  Vcl.Buttons;

type
  TFormAlterarProdutos = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    cboFamilia: TComboBox;
    Label3: TLabel;
    cboGrupo: TComboBox;
    Label4: TLabel;
    cboSubGrupo: TComboBox;
    Label36: TLabel;
    cboCodigoProdutoServico: TComboBox;
    Button1: TButton;
    Button2: TButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure Button2Click(Sender: TObject);
    procedure cboFamiliaChange(Sender: TObject);
    procedure cboGrupoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
    Produtos: TStringList;
  end;

var
  FormAlterarProdutos: TFormAlterarProdutos;

implementation

{$R *.dfm}

uses EntidadeFactory, DBUtils, srvModBaseDados, Principal;

procedure TFormAlterarProdutos.Button1Click(Sender: TObject);
var
   codigoFamilia:string;
   codigoGrupo:string;
   codigoSubGrupo:string;
   codigoProdutoServico:string;

   Values: string;
begin
  Values:= '';
  if cboFamilia.ItemIndex > - 1 then
     Values  := ' CodigoFamilia = '+inttostr( Integer(cboFamilia.Items.Objects[cboFamilia.ItemIndex]));
  if cbogrupo.ItemIndex > - 1 then
     Values  := Values + ifthen( Values <> '',',','') +' CodigoGrupo = '+inttostr( Integer(cbogrupo.Items.Objects[cbogrupo.ItemIndex]));
  if cbosubgrupo.ItemIndex > - 1 then
     Values := Values + ifthen( Values <> '',',','')  +' codigoSubGrupo = '+inttostr( Integer(cbosubgrupo.Items.Objects[cbosubgrupo.ItemIndex]));
  if cboCodigoProdutoServico.ItemIndex > - 1 then
     Values  := Values + ifthen( Values <> '',',','') +' CodigoProdutoServico = '+inttostr( Integer(cboCodigoProdutoServico.Items.Objects[cboCodigoProdutoServico.ItemIndex]));

   DSServerModuleBaseDados.ExecSQL('Update Produtos Set '+  Values +
   ' where Codigo IN ( '+ Produtos.DelimitedText +')' );

  showmessage('Opera��o finalizada com sucesso!');
   close;
end;

procedure TFormAlterarProdutos.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TFormAlterarProdutos.cboFamiliaChange(Sender: TObject);
begin
    cboGrupo.Enabled:= cboFamilia.Text <> '';
  if cboGrupo.Enabled  then
  begin
      FillCombobox( tpGrupo,
      cboGrupo,
      'CodigoFamilia In (Select Codigo From FamiliaProdutos where Descricao ='+
      quotedstr(cboFamilia.Text)+')', 'Codigo', ' Descricao ', 'Descricao');
  end;
end;

procedure TFormAlterarProdutos.cboGrupoChange(Sender: TObject);
begin
  cboSubGrupo.Enabled:= cboGrupo.Text <> '';
  if cboSubGrupo.Enabled  then
  begin
      FillCombobox( tpSubGrupo,
      cboSubGrupo,'CodigoGrupo IN (Select Codigo From GrupoProdutos where Descricao ='+
      quotedstr(cboGrupo.Text)+')', 'Codigo', ' Descricao ',  'Descricao');
  end;
end;

procedure TFormAlterarProdutos.FormCreate(Sender: TObject);
begin
   Produtos:= TStringList.Create;

   FillCombobox( tpFamilia,  cboFamilia);

   FillCombobox( tpProduto,  cboCodigoProdutoServico,
   'Tipo=''SERVICO''', 'Codigo', 'Descricao');

   Produtos.Delimiter:= ',';
end;

procedure TFormAlterarProdutos.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  FormPrincipal.ActFamilia.Execute;
end;

procedure TFormAlterarProdutos.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  FormPrincipal.Actgrupoproduto.Execute;
end;

procedure TFormAlterarProdutos.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  FormPrincipal.ActSubgrupoProduto.Execute;
end;

end.
