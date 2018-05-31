unit UtilsString;

interface

uses
sysutils;

  function SoNumeros(texto: string): string;
  function IndexOfArray(const Value: String; Items: array of String): integer;
  function Cpf(num: string): boolean;
  function Cnpj(num: String):Boolean;
  function StrZero(iNumero, iComp: Integer): String;
  function NumeroParaExtenso(parmNumero: Double): string;

  type
  TNumeroStr = string;

  const
  Unidades: array [1 .. 19] of TNumeroStr = ('um', 'dois', 'três', 'quatro',
    'cinco', 'seis', 'sete', 'oito', 'nove', 'dez', 'onze', 'doze', 'treze',
    'quatorze', 'quinze', 'dezesseis', 'dezessete', 'dezoito', 'dezenove');

  Dezenas: array [1 .. 9] of TNumeroStr = ('dez', 'vinte', 'trinta',
    'quarenta', 'cinqüenta', 'sessenta', 'setenta', 'oitenta', 'noventa');

  Centenas: array [1 .. 9] of TNumeroStr = ('cem', 'duzentos', 'trezentos',
    'quatrocentos', 'quinhentos', 'seiscentos', 'setecentos', 'oitocentos',
    'novecentos');

  DiaSemana: array [1..7] of TNumeroStr = ('Segunda','Terça','Quarta','Quinta',
  'Sexta','Sábado', 'Domingo');

  Meses : array [1..12] of string = ('Janeiro','Fevereiro','Março','Abril','Maio',
  'Junho','Julho', 'Agosto','Setembro','Outubro','Novembro','Dezembro');

  ErrorString = 'Valor fora da faixa';
  Min = 0.01;
  Max = 4294967295.99;
  Moeda = ' real ';
  Moedas = ' reais ';
  Centesimo = ' centavo ';
  Centesimos = ' centavos ';


implementation

function SoNumeros(texto: string): string;
var
  I: integer;
  S: string;
begin
  S := '';
  for I := 1 To Length(texto) Do
  begin
    if (texto[I] in ['0' .. '9']) then
    begin
      S := S + Copy(texto, I, 1);
    end;
  end;
  result := S;
end;

function IndexOfArray(const Value: String; Items: array of String): integer;
var
  I: integer;
begin
  result := -1;
  for I := Low(Items) to High(Items) do
  begin
    if AnsiSameText(Value, Items[I]) then
    begin
      result := I;
      Break;
    end;
  end;
end;

function CNPJ(num: string): boolean;
var
  n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12: integer;
  d1, d2: integer;
  digitado, calculado: string;
begin
  n1 := StrToInt(num[1]);
  n2 := StrToInt(num[2]);
  n3 := StrToInt(num[3]);
  n4 := StrToInt(num[4]);
  n5 := StrToInt(num[5]);
  n6 := StrToInt(num[6]);
  n7 := StrToInt(num[7]);
  n8 := StrToInt(num[8]);
  n9 := StrToInt(num[9]);
  n10 := StrToInt(num[10]);
  n11 := StrToInt(num[11]);
  n12 := StrToInt(num[12]);
  d1 := n12 * 2 + n11 * 3 + n10 * 4 + n9 * 5 +
        n8 * 6 + n7 * 7 + n6 * 8 + n5 * 9 +
        n4 * 2 + n3 * 3 + n2 * 4 + n1 * 5;
  d1 := 11 - (d1 mod 11);
  if d1 >= 10 then
    d1 := 0;
  d2 := d1 * 2 + n12 * 3 + n11 * 4 + n10 * 5 +
        n9 * 6 + n8 * 7 + n7 * 8 + n6 * 9 +
        n5 * 2 + n4 * 3 + n3 * 4 + n2 * 5 + n1 * 6;
  d2 := 11 - (d2 mod 11);
  if d2 >= 10 then
    d2 := 0;
  calculado := inttostr(d1) + inttostr(d2);
  digitado := num[13] + num[14];
  if calculado = digitado then
    CNPJ := true
  else
    CNPJ := false;
end;

function CPF(num: string): boolean;
var
  n1, n2, n3, n4, n5, n6, n7, n8, n9: integer;
  d1, d2: integer;
  digitado, calculado: string;
begin
  n1 := StrToInt(num[1]);
  n2 := StrToInt(num[2]);
  n3 := StrToInt(num[3]);
  n4 := StrToInt(num[4]);
  n5 := StrToInt(num[5]);
  n6 := StrToInt(num[6]);
  n7 := StrToInt(num[7]);
  n8 := StrToInt(num[8]);
  n9 := StrToInt(num[9]);
  d1 := n9 * 2 + n8 * 3 + n7 * 4 + n6 * 5 +
        n5 * 6 + n4 * 7 + n3 * 8 + n2 * 9 +
        n1 * 10;
  d1 := 11 - (d1 mod 11);
  if d1 >= 10 then
    d1 := 0;
  d2 := d1 * 2 + n9 * 3 + n8 * 4 + n7 * 5 +
        n6 * 6 + n5 * 7 + n4 * 8 + n3 * 9 +
        n2 * 10 + n1 * 11;
  d2 := 11 - (d2 mod 11);
  if d2 >= 10 then
    d2 := 0;
  calculado := inttostr(d1) + inttostr(d2);
  digitado := num[10] + num[11];
  if calculado = digitado then
    CPF := true
  else
    CPF := false;
end;

function StrZero(iNumero, iComp: Integer): String;
begin
  Result := StringOfChar('0',iComp-Length(IntToStr(iNumero)))+IntToStr(iNumero);
end;

function NumeroParaExtenso(parmNumero: Double): string;

  function ConversaoRecursiva(N: LongWord): string;
  begin
    case N of
      1 .. 19:
        result := Unidades[N];
      20, 30, 40, 50, 60, 70, 80, 90:
        result := Dezenas[N div 10] + ' ';
      21 .. 29, 31 .. 39, 41 .. 49, 51 .. 59, 61 .. 69, 71 .. 79, 81 .. 89,
        91 .. 99:
        result := Dezenas[N div 10] + ' e ' + ConversaoRecursiva(N mod 10);
      100, 200, 300, 400, 500, 600, 700, 800, 900:
        result := Centenas[N div 100] + ' ';
      101 .. 199:
        result := ' cento e ' + ConversaoRecursiva(N mod 100);
      201 .. 299, 301 .. 399, 401 .. 499, 501 .. 599, 601 .. 699, 701 .. 799,
        801 .. 899, 901 .. 999:
        result := Centenas[N div 100] + ' e ' + ConversaoRecursiva(N mod 100);
      1000 .. 999999:
        result := ConversaoRecursiva(N div 1000) + ' mil ' + ConversaoRecursiva
          (N mod 1000);
      1000000 .. 1999999:
        result := ConversaoRecursiva(N div 1000000)
          + ' milhão ' + ConversaoRecursiva(N mod 1000000);
      2000000 .. 999999999:
        result := ConversaoRecursiva(N div 1000000) + ' milhões ' +
          ConversaoRecursiva(N mod 1000000);
      1000000000 .. 1999999999:
        result := ConversaoRecursiva(N div 1000000000)
          + ' bilhão ' + ConversaoRecursiva(N mod 1000000000);
      2000000000 .. 4294967295:
        result := ConversaoRecursiva(N div 1000000000)
          + ' bilhões ' + ConversaoRecursiva(N mod 1000000000);
    end;
  end;

begin

  if (parmNumero >= Min) and (parmNumero <= Max) then
  begin
    { Tratar reais }
    result := ConversaoRecursiva(Round(Int(parmNumero)));
    if Round(Int(parmNumero)) = 1 then
      result := result + Moeda
    else if Round(Int(parmNumero)) <> 0 then
      result := result + Moedas;

    { Tratar centavos }
    if not(Frac(parmNumero) = 0.00) then
    begin
      if Round(Int(parmNumero)) <> 0 then
        result := result + ' e ';
      result := result + ConversaoRecursiva(Round(Frac(parmNumero) * 100));
      if (Round(Frac(parmNumero) * 100) = 1) then
        result := result + Centesimo
      else
        result := result + Centesimos;
    end;
  end
  else
  if parmNumero <> 0 then
    raise ERangeError.CreateFmt('%g ' + ErrorString + ' %g..%g',
      [parmNumero, Min, Max]);
end;

end.
