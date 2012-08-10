unit Unit2;

interface
 uses
  StdCtrls, SysUtils;
type
 TRab = record
  FIO: ShortString;
  Num: integer;
  Hours: word;
  Tar: integer;
  All: integer;
 end;
procedure MemoPrint(Worker: TRab; Memo: TMemo);
implementation
procedure MemoPrint;
begin
 with Worker do
  Memo.Lines.Add(FIO + ' #' + IntToStr(Num) + ' зарплата: ' + IntToStr(All));
end;
end. 
