unit Unit2;

interface
 uses
  SysUtils, StdCtrls;

 type
 TXYPoint = record
  x : extended;
  y : extended;
 end;

 function f(x: extended):extended;
 function MaxY(aXYPoint: array of TXYPoint): extended;
 function MinY(aXYPoint: array of TXYPoint): extended;
implementation
 uses
  Math;

 function f;
 begin
  Result := (1 + 2 * power(x, 2)) * exp(power(x, 2));
  //Result := sin(x);
 end;

 function MaxY;
{Нахождение максимального y}
 var
  i: byte;
 begin
  Result := aXYPoint[0].y;
  for i := 1 to High(aXYPoint) do
   if Result < aXYPoint[i].y then
    Result := aXYPoint[i].y
  end;

 function MinY;
{Нахождение минимального y}
 var
  i: byte;
 begin
  Result := aXYPoint[0].y;
  for i := 1 to High(aXYPoint) do
   if Result > aXYPoint[i].y then
    Result := aXYPoint[i].y
 end;
end.
