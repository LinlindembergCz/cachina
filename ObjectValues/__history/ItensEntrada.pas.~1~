unit ItensEntrada;

interface

uses
  Contnrs, GenericEntidade, ItemEntrada;

type
  TItensEntrada= Class( TObjectList )
  private
    function GetItems(Index: Integer): TItemEntrada;
    procedure SetItems(Index: Integer; const Value: TItemEntrada);
  public
    function Add(AObject: TGenericEntidade): Integer;
    property Items[Index: Integer]: TItemEntrada read GetItems write SetItems; default;
  End;

implementation

{TItensOrcamento}

function TItensEntrada.GetItems(Index: Integer): TItemEntrada;
begin
Result := TItemEntrada(inherited Items[Index]);
end;

procedure TItensEntrada.SetItems(Index: Integer;
const Value: TItemEntrada);
begin
inherited Items[Index] := Value;
end;

function TItensEntrada.Add(AObject: TGenericEntidade): Integer;
begin
Result := inherited Add(AObject);
end;

end.
