unit ItensSaida;

interface

uses
  Contnrs, GenericEntidade, ItemSaida;

type
  TItensSaida= Class( TObjectList )
  private
    function GetItems(Index: Integer): TItemSaida;
    procedure SetItems(Index: Integer; const Value: TItemSaida);
  public
    function Add(AObject: TGenericEntidade): Integer;
    property Items[Index: Integer]: TItemSaida read GetItems write SetItems; default;
  End;

implementation

{TItensSaida}

function TItensSaida.GetItems(Index: Integer): TItemSaida;
begin
Result := TItemSaida(inherited Items[Index]);
end;

procedure TItensSaida.SetItems(Index: Integer;
const Value: TItemSaida);
begin
inherited Items[Index] := Value;
end;

function TItensSaida.Add(AObject: TGenericEntidade): Integer;
begin
Result := inherited Add(AObject);
end;

end.
