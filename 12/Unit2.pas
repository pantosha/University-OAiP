unit Unit2;

interface
uses
 Grids, SysUtils;
type
 RElem = record
  number: byte;
  price, weight: integer;
 end;
 tes = set of byte;
 TSort = class
  PMax: integer; //массив, который встречается на всём протяжении лабы.
  constructor Create(WM: integer; Grid: TStringGrid);
  function BranchAndBound: tes;
  function CompleteEnumeration: tes;
  function MaxPrice: tes;
  function MinWeight: tes;
  function Perebor: tes;
  function OptimPrice: tes;
  function RussianRoulette: tes;
 private
  n: byte; //кол-во элементов.
  a: array of RElem;
  WMax: integer;
 end;

implementation

constructor TSort.Create;
var
 i: byte;
begin
 inherited Create;
 n := Grid.RowCount - 2;
 SetLength(a, n+1);
 for i := 0 to n do
 begin
  a[i].weight := StrToInt(Grid.Cells[1, i + 1]);
  a[i].price := StrToInt(Grid.Cells[2, i + 1]);
  a[i].number := i + 1;
 end;
 WMax := WM;
end;
//ветвей и границ.
function TSort.BranchAndBound;
var
 i: byte;
 OptS, S: tes;
 allpr: integer;
procedure Recursion(i: byte; allwt, allpr: integer);
var
 pr1 : integer;
begin
 if a[i].weight + allwt <= WMax then
 begin
  Include(S, a[i].number);
  if i < n then
   Recursion(i + 1, allwt + a[i].weight, allpr)
  else if allpr > PMax then
   begin
    PMax := allpr;
    OptS := S;
   end;
  Exclude(S, a[i].number);
 end;

 pr1 := allpr - a[i].price;

 if pr1 > PMax then
  if i < n then
   Recursion(i + 1, allwt, pr1)
  else
  begin
   PMax := pr1;
   OptS := S;
  end;
end;

begin
 S:=[];
 OptS := [];
 allpr := 0;
 for i := 0 to High(a) do
  allpr := allpr + a[i].price;
 Recursion(0, 0, allpr);
 Result := OptS;
end;

//полный перебор
function TSort.CompleteEnumeration: tes;
var
 i: byte;
 allpr: integer;
 S, OptS: tes;
procedure Recursion(i: byte; allwt, allpr: integer);
var
 allwt1, allpr1: byte;
begin
 allwt1 := allwt + a[i].weight;
 Include(S, a[i].number);

 if i < n then
  Recursion(i + 1, allwt1, allpr)
 else if (allwt1 <= Wmax) and (allpr > Pmax) then
  begin
   PMax := allpr;
   OptS := S;
  end;

 Exclude(S, a[i].number);
 allpr1 := allpr - a[i].price;

 if i < n then
  Recursion(i + 1, allwt, allpr1)
 else if (allwt <= Wmax) and (allpr1 > Pmax) then
  begin
   PMax := allpr1;
   OptS := S;
  end;
end;
begin
 S := [];
 allpr := 0;
 for i := 0 to High(a) do
  allpr := allpr + a[i].price;
 Recursion(0, 0, allpr);
 Result := OptS;
end;

//перебор элементов массива
function TSort.Perebor;
var
 i: byte;
 S: tes;
 wt, allwt: integer;
begin
 S := [];
 i := 0;
 PMax := 0;
 allwt := 0;
repeat
 wt := allwt + a[i].weight;
 if wt <= WMax then
 begin
  allwt := wt;
  PMax := PMax + a[i].price;
  Include(S, a[i].number);
  Result := S;
 end;
 Inc(i);
until (i > High(a)) or (WMax = wt);
end;

function TSort.MaxPrice;
var
 i, j: byte;
 t: RElem;
begin
 for i := 1 to High(a) do  //сортируем массив по убыванию цены.
  for j := High(a) downto i do
   if a[j].price > a[j-1].price then
   begin
    t := a[j-1];
    a[j-1] := a[j];
    a[j] := t;
   end;
 Result := Perebor;
end;

function TSort.MinWeight;
var
 i, j: byte;
 t: RElem;
 allwt, wt: integer;
begin
 for i := 1 to High(a) do  //сортируем массив по возрастанию массы.
  for j := High(a) downto i do
   if a[j].weight < a[j-1].weight then
   begin
    t := a[j-1];
    a[j-1] := a[j];
    a[j] := t;
   end;
 allwt := 0;
 PMax := 0;
 Result := [];
 for i := 0 to High(a) do
 begin
  wt := allwt + a[i].weight;
  if wt <= WMax then
  begin
   PMax := PMax + a[i].price;
   allwt := wt;
   Include(Result, a[i].number);
  end
  else
   Break;
 end;
end;

function TSort.OptimPrice;
var
 i, j: byte;
 t: RElem;
begin
 for i := 1 to High(a) do  //сортируем массив по убыванию соотношения цена/масса.
  for j := High(a) downto i do
   if (a[j].price / a[j].weight) > (a[j-1].price / a[j-1].weight) then
   begin
    t := a[j-1];
    a[j-1] := a[j];
    a[j] := t;
   end;

 Result := Perebor;
end;

function TSort.RussianRoulette;
var
 k, i: byte;
 allwt, allpr: integer;
 S: tes;
begin
 Randomize;
 for i := 0 to (Random(n) + 5) do
 begin
  k := Random(n + 1);
  allpr := 0;
  allwt := 0;
  S := [];

  while (allwt + a[k].weight) <= WMax do
  begin
   if not (a[k].number in S) then
   begin
    allwt := allwt + a[k].weight;
    allpr := allpr + a[k].price;
    Include(S, a[k].number);
   end;
   k := Random(n + 1);
  end;

  if allpr > PMax then
  begin
   PMax := allpr;
   Result := S;
  end;
 end;
end;
end.

