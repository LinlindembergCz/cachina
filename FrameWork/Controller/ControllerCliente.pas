unit ControllerCliente;

interface

uses GenericEntidade, viewCliente, Controller, Forms , DB, Mapper, Classes, DBClient;

type
  TControllerCliente = class(TController)
  public
    constructor Create(Sender: TForm; ClientDataSet:TClientDataSet);override;
  end;

implementation

{ TControllerCliente }

uses FactoryEntidade;

constructor TControllerCliente.Create(Sender: TForm; ClientDataSet: TClientDataSet);
begin
  inherited Create(Sender, ClientDataSet);
  View := (Sender as TFormViewCLiente);
  Entidade := TFactoryEntidade.CriarCliente;
  Select;
end;


end.
