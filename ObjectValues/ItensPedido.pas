unit ItensPedido;

interface

uses
  Contnrs, GenericEntidade, ItemPedido;

type
  TItensPedido= Class( TObjectList )
  private
    function GetItems(Index: Integer): TItemPedido;
    procedure SetItems(Index: Integer; const Value: TItemPedido);
  public
    function Add(AObject: TGenericEntidade): Integer;
    property Items[Index: Integer]: TItemPedido read GetItems write SetItems; default;
  End;

implementation

{TItensPedido}

function TItensPedido.GetItems(Index: Integer): TItemPedido;
begin
Result := TItemPedido(inherited Items[Index]);
end;

procedure TItensPedido.SetItems(Index: Integer;
const Value: TItemPedido);
begin
inherited Items[Index] := Value;
end;

function TItensPedido.Add(AObject: TGenericEntidade): Integer;
begin
Result := inherited Add(AObject);
end;

end.
