unit UtilsNumeros;

interface

function ConvertPercentToValor(Imposto, ValorVenda: double): double;

implementation


function ConvertPercentToValor(Imposto, ValorVenda: double): double;
begin
  result:= Imposto * ValorVenda/100;
end;

end.
