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
  d: array of array of byte; {������ ������ �� ������ �������}
//  d: array [1..3, 1..64] of byte;
  k: array[1..3] of byte; {���������� ������ �� ������ �������}

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
  old, new: shortint; {������ � ����� ��������� ����������� �����}
  delta: shortint; {��������, ������������ ������� ����������� �����}
 begin
  k[1] := N; {������� ��� ����� �� ������ �������, �� ��������� �������� ������ ���}
  k[2] := 0;
  k[3] := 0;
  s := '';
  SetLength(d, 4, n+1);

  for i := 1 to N do
   d[1, i] := N - i + 1; {������ ������� ������, ������� ����� �� ������ �������, ���꠹1�� ����������}

  new := 1; {���������� ���� ����� �� ������ �������}

  if odd(N) then {� ����������� �� ��������N, �������堗 ��� 1, ��� -1}
   delta := -1
  else
   delta := 0;

  while k[2] < N do {�����������, ���� �� ��� ����� ���������� �� ������ ��������}
  begin
   old := new;
   new := ((old + 1 + delta) mod 3) + 1; {����� ��������� ����������� ����� ����� ��������� �� ���� �������}
   Transfer(old, new); {��������� ���������� ����}
   i := 6 - old - new; {��� ��� old � new�� ������ ���� �� ���� ��������, �� ����� �������� ������� ��������� ��� 1+2+3-old-new}
   if (k[old] > 0) and ((k[i] = 0) or (d[old, k[old]] < d[i, k[i]])) then {���� �� ����� ������� ��� ������, ��� ������� ���� ������ �������� ����� �� ������ �������, �� ������������� �� ���� ����}
    Transfer(old,i)
   else
    if k[i] > 0 then
     Transfer(i,old);
  end;

  Result := s;
  s := '';
 end;

end.
