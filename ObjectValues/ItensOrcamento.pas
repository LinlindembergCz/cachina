unit ItensOrcamento;

interface

uses
  Contnrs, GenericEntidade, ItemOrcamento;

type

  TItensEntradas = Class( TObjectList )
  private
    function GetItems(Index: Integer): TItemOrcamento;
    procedure SetItems(Index: Integer; const Value: TItemOrcamento);
  public
    function Add(AObject: TGenericEntidade): Integer;
    property Items[Index: Integer]: TItemOrcamento read GetItems write SetItems; default;
  End;

implementation

{TItensOrcamento}

function TItensEntradas.GetItems(Index: Integer): TItemOrcamento;
begin
Result := TItemOrcamento(inherited Items[Index]);
end;

procedure TItensEntradas.SetItems(Index: Integer;
const Value: TItemOrcamento);
begin
inherited Items[Index] := Value;
end;

function TItensEntradas.Add(AObject: TGenericEntidade): Integer;
begin
Result := inherited Add(AObject);
end;

end.
