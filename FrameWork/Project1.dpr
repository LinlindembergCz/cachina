program Project1;

uses
  Vcl.Forms,
  viewCliente in 'View\viewCliente.pas' {FormViewCLiente},
  Mapper in 'Mapper\Mapper.pas',
  Clientes in 'Model\Clientes.pas',
  FactoryEntidade in 'Factory\FactoryEntidade.pas',
  GenericDAO in 'DAO\GenericDAO.pas',
  ControllerCliente in 'Controller\ControllerCliente.pas',
  Controller in 'Controller\Controller.pas',
  InterfaceController in 'Controller\InterfaceController.pas',
  FactoryController in 'Factory\FactoryController.pas',
  GenericEntidade in 'Model\GenericEntidade.pas',
  AtributoEntidade in 'Mapper\AtributoEntidade.pas',
  Conexao in 'Conexao\Conexao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormViewCLiente, FormViewCLiente);
  Application.Run;
end.
