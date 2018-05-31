unit ControllerFactory;

interface

uses
  GenericEntidade, EntidadeFactory, Controller;

Type
  TControllerFactory = class
  public
    class function Criar (const TipoEntidade: TTipoEntidade):IController;
  end;

implementation

uses ControllerTabelas;

{ TControllerFactory }

class function TControllerFactory.Criar( const TipoEntidade: TTipoEntidade ):IController;
begin
  result := TControllerTabelas.create;
end;

end.
