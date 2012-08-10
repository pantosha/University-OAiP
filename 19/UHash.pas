unit UHash;
interface
uses
 SysUtils, Dialogs, Grids, StdCtrls;

type
 Tkey = integer;
 TInf = record
  FIO: string;
  key: Tkey;
 end;

 PSel = ^TSel;
 TSel = record
  Inf: TInf;
  A: PSel;
 end;

 TMas = array [0..1] of PSel;
 PMas=^TMas;

 TH=class(TObject)
  n: word;
  constructor Create(M0:word);
  procedure Add(Inf:TInf);
  procedure Print(Memo:TMemo);
  procedure Read(key:TKey; var Inf:TInf);
  procedure ReadDel(key:TKey; var Inf:TInf);
  function MaxKey: TInf;
  destructor Free(var SG:TStringGrid);
 private
  M: word;
  sp, sp1: PSel;
  H: PMas;
 end;
implementation

constructor TH.Create;
var i:word;
begin
 M := M0;
 n := 0;
 GetMem(H, M*4);
 for i := 0 to M - 1 do
  H[i] := Nil;
end;

destructor TH.Free;
var i, j:integer;
begin
 j := -1;
 for i := 0 to M - 1 do
  while H[i] <> Nil do
  begin
   Inc(j);
   sp := H[i];
   SG.Cells[0, j] := sp^.Inf.Fio;
   SG.Cells[1, j] := IntToStr(sp^.Inf.key);
   H[i] := sp^.A;
   Dispose(sp);
  end;
  FreeMem(H,4*M);
end;

procedure TH.Add;
var i:integer;
    p:PSel;
begin
  i := inf.key mod M;
  New(p);
  Inc(n);
  p^.inf := Inf;
  p^.A := H[i];
  H[i] := p;
end;

procedure TH.Read;
var i:integer;
begin
  i := key mod M;
  sp := H[i];
  while (sp <> Nil) and (sp^.Inf.Key <> key) do
    sp := sp^.A;
  if sp <> Nil then
    Inf := sp^.Inf
  else
    ShowMessage('Ключ не найден');
end;

procedure TH.ReadDel;
var i:integer;
begin
 i := key mod M;
 sp := H[i];
 sp1 := sp;
 while (sp <> Nil) and (sp^.Inf.Key <> Key) do
 begin
  sp1 := sp;
  sp := sp^.A;
 end;
 if sp <> Nil then
 begin
  Inf := sp^.Inf;
  if sp1 = sp then
   H[i] := sp^.A
  else
   sp1^.A := sp^.A;
  Dispose(sp);
  Dec(n);
 end
 else
  ShowMessage('Ключ не найден');
end;

procedure TH.Print;
 procedure PrintMemo(sp:PSel;M:TMemo);
 begin
  while sp <> Nil do
  begin
   M.Lines.Add(sp^.Inf.FIO + ' ' + IntToStr(sp^.Inf.Key));
   sp := sp^.A;
  end;
 end;
var i:integer;
begin
 for i := 0 to M - 1 do
  if H[i] <> Nil then
   PrintMemo(H[i],Memo);
end;

function TH.MaxKey: TInf;
var
 i: byte;
 Pointer: PSel;
begin
 Result.key := 0;
 for i := 0 to M - 1 do // С первого элемента массива до последнего проводим проверку на максимальность.
 begin
  if H[i] <> nil then
  begin
   Pointer := H[i];
   while Pointer <> nil do
   begin
    if Pointer.Inf.Key >= Result.Key then
     Result := Pointer.Inf;
    Pointer := Pointer.A;
   end;
  end;
 end;
end;

end.
