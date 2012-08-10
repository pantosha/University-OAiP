unit Stack;

interface
uses
 SysUtils, StdCtrls;
type
 PTField = ^TField;

 TField = record
  Ch: char;
  SP: PTField;
 end;

 TStack = class
  constructor Create;
  procedure Push(Ch: char);
  function Pop: char;
  function IsEmpty: boolean;
  destructor Destroy; override;
 private
  ESP: PTField;
 end;

implementation
 constructor TStack.Create;
 begin
  Inherited Create;
  ESP := nil;
 end;

 procedure TStack.Push;
 var
  ETP: PTField;
 begin
  New(ETP);
  ETP^.Ch := Ch;
  ETP^.SP := ESP;
  ESP := ETP;
 end;

 function TStack.Pop: char;
 var
  ETP: PTField;
 begin
  if ESP <> nil then
  begin
   Result := ESP^.Ch;
   ETP := ESP;
   ESP := ESP^.SP;
   Dispose(ETP);
  end
  else
   Result := '!';
 end;

 function TStack.IsEmpty: boolean;
 begin
  if ESP <> nil then
   Result := false
  else
   Result := true;
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
