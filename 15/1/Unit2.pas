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
  ESP, ETP: PTField;
  constructor Create(n: byte);
  procedure Push(Number: byte);
  function Pop: byte;
 end;
implementation
 constructor TStack.Create(n: byte);
 var
  i: byte;
 begin
  Inherited Create;
//  ESP := nil;
//  ETP := nil;
//  Randomize;
//  for i := 0 to n do
//   Push(1 + Random(200));
 end;
 
 procedure TStack.Push;
 begin
  New(ETP);
  ETP^.Number := Number;
  ETP^.SP := ESP;
  ESP := ETP;
 end;

 function TStack.Pop: byte;
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
end.
 