unit FactoryEntidade;

interface

uses
GenericEntidade ;

type
  TFactoryEntidade  = class
  public
     class function CriarCliente: TGenericEntidade;
     class function CriarFabricante: TGenericEntidade;
  end;

implementation

uses Clientes ;

{ TFactory }

class function TFactoryEntidade.CriarCliente: TGenericEntidade;
begin
   result := TCliente.create;
end;

class function TFactoryEntidade.CriarFabricante: TGenericEntidade;
begin

end;

end.
