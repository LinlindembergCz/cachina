program ServidorSistema;

uses
  Vcl.Forms,
  ServidorDataSnap in 'ServidorDataSnap.pas' {Form2},
  ServerMethodsUnit1 in 'ServerMethodsUnit1.pas' {ServerMethodsGeneric: TDSServerModule},
  ServerContainerUnit1 in 'ServerContainerUnit1.pas' {ServerContainer1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TServerContainer1, ServerContainer1);
  Application.Run;
end.

