unit Unit2;

interface
uses
SysUtils;
Type
Hanoi = class
 public
  function Recursion(n: byte): string;
  function Iteration(n: byte): string;
 protected
  s: string;
  procedure Transfer(i1, i2: byte);
  procedure RecSolve(n: byte; a1, b1, c1: char);
end;

implementation
var
  d: array of array of byte; {список дисков на каждом стержне}
//  d: array [1..3, 1..64] of byte;
  k: array[1..3] of byte; {количество дисков на каждом стержне}

 function Hanoi.Recursion;
 var
  a1, b1, c1: char;
 begin
  a1 := '1';
  b1 := '2';
  c1 := '3';
  s := '';
  RecSolve(n, a1, b1, c1);
  Result := s;
  s := '';
 end;

 procedure Hanoi.RecSolve;
 begin
  if n > 1 then
   RecSolve(n - 1, a1, c1, b1);
  s := s + a1 + ' --> ' + b1 + ';' + #13#10;
  if n > 1 then
   RecSolve(n - 1, c1, b1, a1);
 end;

procedure Hanoi.Transfer;
 begin
  k[i2] := k[i2] + 1;
  d[i2, k[i2]] := d[i1, k[i1]];
  s := s + IntToStr(i1) + ' --> (' + IntToStr(d[i1,k[i1]]) + ') ' + intToStr(i2) + ';' + #13#10;
  k[i1] := k[i1] - 1;
 end;

 function Hanoi.Iteration;
 var
  i: byte;
  old, new: shortint; {старое и новое положение наименьшего диска}
  delta: shortint; {смещение, определяющее маршрут наименьшего диска}
 begin
  k[1] := N; {сначала все диски на первом стержне, на остальных стержнях дисков нет}
  k[2] := 0;
  k[3] := 0;
  s := '';
  SetLength(d, 4, n+1);

  for i := 1 to N do
   d[1, i] := N - i + 1; {запись номеров дисков, которые лежат на первом стержне, диск №1 — наименьший}

  new := 1; {наименьший диск лежит на первом стержне}

  if odd(N) then {в зависимости от чётности N, смещение — или 1, или -1}
   delta := -1
  else
   delta := 0;

  while k[2] < N do {выполняется, пока не все диски перенесены на второй стержень}
  begin
   old := new;
   new := ((old + 1 + delta) mod 3) + 1; {новое положение наименьшего диска можно посчитать по этой формуле}
   Transfer(old, new); {переносим наименьший диск}
   i := 6 - old - new; {так как old и new — номера двух из трех стержней, то номер третьего стержня считается как 1+2+3-old-new}
   if (k[old] > 0) and ((k[i] = 0) or (d[old, k[old]] < d[i, k[i]])) then {если на одном стержне нет дисков, или верхний диск больше верхнего диска на другом стержне, то перекладываем на него диск}
    Transfer(old,i)
   else
    if k[i] > 0 then
     Transfer(i,old);
  end;

  Result := s;
  s := '';
 end;

end.
