unit Unit2;

interface
uses
 SysUtils, StdCtrls;
type
 PTField = ^TField;

 TField = record
  Number: byte;
  NextPointer: PTField;
  PrevPointer: PTField;
 end;

 TTurn = class
  constructor Create(n: byte);
  procedure Push(Number: byte);
  function Pop: byte;
  procedure Print(ListBox: TListBox);
  function Search(LookFor: byte; FP: PTField = nil): PTField;
  destructor Destroy; override;
 protected
  EBP, ESP: PTField;
 end;

 TTurnExtended = class(TTurn)
  procedure Sort;
 end;

implementation
 constructor TTurn.Create(n: byte);
 var
  i: byte;
 begin
  Inherited Create;
  EBP := nil;
  ESP := nil;
  Randomize;
  for i := 0 to n do
   Push(1 + Random(254));
 end;

 procedure TTurn.Push(Number: byte); // что-то надо делать с крайними.  ак лучше добавить их адреса?
 var
  ETP: PTField;
 begin
  New(ETP);
  ETP^.Number := Number;
  ETP^.NextPointer := nil;
  ETP^.PrevPointer := ESP;
  if ESP <> nil then
   ESP^.NextPointer := ETP
  else
   EBP := ETP;
  ESP := ETP;
 end;

 function TTurn.Pop: byte;
 var
  ETP: PTField;
 begin
  if EBP <> nil then
  begin
   Result := EBP^.Number;
   if ESP <> EBP then
   begin
	ETP := EBP;
    EBP^.NextPointer^.PrevPointer := nil;
    EBP := EBP^.NextPointer;
    Dispose(ETP);
   end
   else
   begin
    Dispose(EBP);
    ESP := nil;
    EBP := nil;
   end;
  end
  else
   Result := 0;
 end;

 procedure TTurn.Print;
 var
  ETP: PTField;
 begin
  if ESP <> nil then
  begin
   ETP := EBP;
   ListBox.Clear;
   while ETP <> nil do
   begin
    ListBox.Items.Add(IntToStr(ETP^.Number));
    ETP := ETP^.NextPointer;
   end;
  end
  else
   ListBox.Clear;
 end;
 
 function TTurn.Search(LookFor: byte; FP: PTField = nil): PTField;
 begin
  Result := nil;
  if EBP = nil then
   Exit;
  if FP = nil then
   Result := EBP
  else
   Result := FP;
  while (LookFor <> Result^.Number) and (Result <> nil) do
   Result := Result^.NextPointer;
 end;

 procedure TTurnExtended.Sort;
 procedure ChangePos(FP: PTField);
 var
  ETP: PTField;
 begin
  ETP := FP^.NextPointer;
// рассматриваем идущую перед двум€ мен€емыми значени€ми €чейку
  if FP <> EBP then
   FP^.PrevPointer^.NextPointer := ETP // FP^.NextPointer; //предыдуща€ €чейка - ok! ¬незапно, предыдуща€ €чейка не сущетсвует
  else
   EBP := ETP;
  ETP^.PrevPointer := FP^.PrevPointer;

// то же, что и в предыдущем комментарии, но уже с последующей €чейкой
  if ETP <> ESP then
   ETP^.NextPointer^.PrevPointer := FP //последующа€ €чейка - ok!
  else
   ESP := FP;
  FP^.NextPointer := ETP^.NextPointer;

  ETP^.NextPointer := FP;
  FP^.PrevPointer := ETP;

  {
  if FP <> EBP then
   FP^.PrevPointer^.NextPointer := FP^.NextPointer; //предыдуща€ €чейка - ok! ¬незапно, предыдуща€ €чейка не сущетсвует
  if FP^.NextPointer <> ESP then
   FP^.NextPointer^.NextPointer^.PrevPointer := FP; //последующа€ €чейка - ok!

  FP^.NextPointer^.NextPointer := FP;
  FP^.NextPointer^.PrevPointer := FP^.PrevPointer;

  FP^.NextPointer :=
}
 end;
 var
  isp, jsp: PTField;
 begin
  if EBP <> ESP then
  begin
   isp := nil;
   repeat
    jsp := EBP;
    while jsp^.NextPointer <> isp do
	   if jsp^.Number > jsp^.NextPointer^.Number then
	    ChangePos(jsp)
	   else
	    jsp := jsp^.NextPointer;
	  isp := jsp;                 //
   until isp = EBP^.NextPointer;
  end;
 end;

 destructor TTurn.Destroy;
 var
  ETP: PTField;
 begin
  if ESP <> nil then
   while ESP <> nil do
   begin
    ETP := ESP;
    ESP := ESP^.PrevPointer;
    Dispose(ETP);
   end;
  Inherited Destroy;
 end; 
end.