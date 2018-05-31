unit LoginAcesso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormLoginAcesso = class(TForm)
    Label7: TLabel;
    Label8: TLabel;
    edtSenha: TEdit;
    edtLogin: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure Entrar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLoginAcesso: TFormLoginAcesso;

implementation

{$R *.dfm}

uses ControllerFuncionarios, Principal;

procedure TFormLoginAcesso.Button1Click(Sender: TObject);
begin
  Entrar;
  close;
end;

procedure TFormLoginAcesso.Button2Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TFormLoginAcesso.edtSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
  begin
    Entrar;
  end;
end;

procedure TFormLoginAcesso.Entrar;
var
  ControllerFuncionarios: TControllerFuncionarios;
begin
  ControllerFuncionarios     := TControllerFuncionarios.Create;
  FormPrincipal.CodigoPessoa := ControllerFuncionarios.VerificarLogin(edtLogin.Text, edtSenha.Text);
  FormPrincipal.login        := edtLogin.Text;
end;

end.

{
Select
moac.Codigo,moac.CodigoModulo, moac.CodigoAcesso, mo.Descricao, ac.Descricao as Acesso
From ModuloAcesso moac
inner join Acessos ac on ac.Codigo   = moac.CodigoAcesso
inner join Modulo mo on mo.Codigo = moac.CodigoModulo



Select
moac.Codigo, moac.CodigoModulo, moac.CodigoAcesso,
mo.Descricao,ac.Descricao as Acesso , perm.CodigoFuncionario, func.Nome
From ModuloAcesso moac
inner join Acessos ac on ac.Codigo   = moac.CodigoAcesso
inner join Modulo mo on mo.Codigo = moac.CodigoModulo
inner join PermissoesModuloAcesso perm on perm.CodigoModuloAcesso = moac.Codigo
inner join Funcionarios func on func.Codigo = perm.CodigoFuncionario

}
