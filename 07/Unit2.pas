unit Unit2;

interface
 
 uses
  StdCtrls, SysUtils, Dialogs;
 
 procedure RandomFill (a: array of char; length: byte; Edit: TEdit);
 procedure StrToArr (StrIn: string; Edit: TEdit);
implementation

 procedure SortArr (var Arr: array of integer);
var
 i, j: byte;
 t: integer;
begin
 for i := 1 to High(Arr) do
  for j := High(Arr) downto i do
   if Arr[j - 1] > Arr[j] then begin
    t := Arr[j];
    Arr[j] := Arr[j-1];
    Arr[j-1] := t;
   end;
end;

 procedure RandomFill;
var
 i: byte;
begin
 Edit.Clear;
 Randomize;
 for i := 0 to (20 + Random(length)) do
  Edit.Text := Edit.Text + a[Random(High(a) + 1)];
end;

procedure StrToArr;
var
 i, j: byte;
 n: integer;
 num: string;
 NumArray: array of integer;
begin
 Edit.Clear;
 StrIn := StrIn + ' ';
 n := Length(StrIn);
 j := 0;
 if n = 0 then
  Exit;
try
 for i := 1 to n do begin
  if StrIn[i] <> ' ' then begin
   num := num + StrIn[i];
  end
  else
   if Length(num) <> 0 then begin
    j := j + 1;
    SetLength(NumArray, j);
    NumArray[High(NumArray)] := StrToInt(num);
    num := '';
   end;
 end;
 SortArr(NumArray);
 Edit.Text := IntToStr(NumArray[0]);
 for i := 1 to High(NumArray) do
  Edit.Text := Edit.Text + ' ' + IntToStr(NumArray[i]);
 NumArray := nil;
except
 else
  ShowMessage('Шосьци-гдесьци-хтосьци пальцем тычет в вас со злости');
end;
end;
end.
