unit Unit2;

interface
uses
 SysUtils, StdCtrls;
type
 PTField = ^TField;

 TField = record
  Number: byte;
  SP: PTField;
 end;

 TStack = class
  constructor Create(n: byte);
  procedure Push(Number: byte);
  function Pop: byte;
  procedure Print(ListBox: TListBox);
  function Search(LookFor: byte; FP: PTField = nil): PTField;
  procedure Sort;
  function NumMoreThanAvr: byte;
  destructor Destroy; override;
 private
  ESP: PTField;
 end;

implementation
 constructor TStack.Create(n: byte);
 var
  i: byte;
 begin
  Inherited Create;
  ESP := nil;
  Randomize;
  for i := 0 to n do
   Push(1 + Random(254));
 end;

 procedure TStack.Push;
 var
  ETP: PTField;
 begin
  New(ETP);
  ETP^.Number := Number;
  ETP^.SP := ESP;
  ESP := ETP;
 end;

 function TStack.Pop: byte;
 var
  ETP: PTField;
 begin
  if ESP <> nil then
  begin
   Result := ESP^.Number;
   ETP := ESP;
   ESP := ESP^.SP;
   Dispose(ETP);
  end
  else
   Result := 0;
 end;

 procedure TStack.Print;
 var
  ETP: PTField;
 begin
  if ESP <> nil then
  begin
   ETP := ESP;
   ListBox.Clear;
   while ETP <> nil do
   begin
    ListBox.Items.Add(IntToStr(ETP^.Number));
    ETP := ETP^.SP;
   end;
  end;
 end;

 function TStack.Search(LookFor: byte; FP: PTField = nil): PTField; // если не заработает, то FP: PTField = nil
 begin
  Result := nil;
  if ESP = nil then
   Exit;
  if FP = nil then
   Result := ESP
  else
   Result := FP;
  while (LookFor <> Result^.Number) and (Result <> nil) do
   Result := Result^.SP;
 end;

 procedure TStack.Sort;
  procedure Obmen(FP: PTField);
  var
   ETP: PTField;
  begin
   ETP := FP^.SP^.SP;
   FP^.SP^.SP := ETP^.SP;
   ETP^.SP := FP^.SP;
   FP^.SP := ETP;
  end;
 var
  jsp, isp: PTField;
 begin
  if ESP^.SP = Nil then exit;
  Push(0);
  jsp := Nil;
  repeat
   isp := ESP;
   while isp^.SP^.SP <> jsp do
   begin
    if isp^.SP^.Number > isp^.SP^.SP^.Number then
     Obmen(isp);
    isp := isp^.SP;
   end;
   jsp := isp^.SP;
  until ESP^.SP^.SP = jsp;
  Pop;
 end;

 function TStack.NumMoreThanAvr: byte;
 var
  Average, n: byte;
  Sum: integer;
  ETP: PTField;
 begin
  Result := 0;
  if ESP = nil then Exit;
// находим среднее значение
  Sum := 0;
  n := 0;
  ETP := ESP;
  while ETP <> nil do
  begin
   Sum := Sum + ETP^.Number;
   Inc(n);
   ETP := ETP^.SP;
  end;
  Average := Sum div n;
// теперь выискиваем, сколько же элементов больше среднего значения
  ETP := ESP;
  Result := 0;
  while ETP <> nil do
  begin
   if ETP^.Number > Average then
    Result := Result + 1;
   ETP := ETP^.SP;
  end;
 end;

 destructor TStack.Destroy;
 var
  ETP: PTField;
 begin
  if ESP = nil then Exit;
  while ESP <> nil do
  begin
   ETP := ESP;
   ESP := ESP^.SP;
   Dispose(ETP);
  end;
  Inherited Destroy;
 end;
end.
