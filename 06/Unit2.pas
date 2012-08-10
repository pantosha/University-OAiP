unit Unit2;

interface
 uses
  StdCtrls, SysUtils;
 type
  temp = function (x: extended): extended;
 procedure tyrpyr (f: temp; xn, xk: extended; m: word; Memo: TMemo);
implementation

procedure tyrpyr;
var
 x, y, h : extended;
 i : integer;
begin
 x := xn;
 h := (xk - xn) / m;

 for i := 1 to m do begin
  y := f(x);
  Memo.Lines.Add(' x = ' + FloatToStrf(x,fffixed,8,3) + ' y = ' + FloatToStrf(y,fffixed,8,3));
  x := x + h;
 end;
end;
end.
