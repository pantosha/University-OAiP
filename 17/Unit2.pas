unit Unit2;

interface
uses
 Stack;
type
 TCalc = class
  Stack: TStack;
  ANumber: array ['a'..'�'] of extended;
  function InfixToPostfix(infix: string): string;
  function Calculate(str: string): extended;
 end;

implementation
 uses
  Math;
 var
  Operands: set of char = ['+', '-', '*', '/', '(', ')', '^'];

 function TCalc.InfixToPostfix(infix: string): string;
  function Priority(ch: char): byte;
  begin
   case ch of
	'(', ')': Result := 0;
	'+', '-': Result := 1;
	'*', '/': Result := 2;
    '^'     : Result := 3;
  else Result := 0;
   end;
  end;
 var
  i: byte;
  ch: char;
  pc: 0..3;
  Stack: TStack;
  temp: char;
 begin
  Stack := TStack.Create;
 try
  Result := '';
  with Stack do
  begin
   for i := 1 to Length(infix) do
   begin
    ch := infix[i];
    if ch in Operands then // �������� �� ������ ���������
     if IsEmpty then // ���� �� ����?
      Push(infix[i]) // ����. ��������� � ����. � �������
     else if ch = '(' then // �� ����. ����� ��� ��������, ������������� ��������?
       Push(infix[i]) //��, ��� ��������. ��� ��� ��������� � ����.
      else if ch = ')' then //���. �� �����, ���� ��, ������������ ��������?
       begin
        ch := Pop; // ����� �������������: �������� �������������.
        while ch <> '(' do //������� ������ ����������� ��������.
        begin
         Result := Result + ch; //������ ������������� � �������� ������ ��� �������� ����� ����������
         ch := Pop;
        end;
       end
       else // ������, ������, �� ���� ����, �� ���� �� ������ ��� �� ����!
	   begin
	    pc := Priority(ch);
      while not IsEmpty do
		  begin
		   temp := Pop;
		   if pc <= Priority(temp) then
		    Result := Result + temp
		   else
       begin
        Push(temp);
		    Break;
       end
      end;
       Push(ch);
      end
	 else
	  Result := Result + ch;
   end;
   while not IsEmpty do
    Result := Result + Pop;
  end;
 finally
  Stack.Destroy;
 end;
 end;

 function TCalc.Calculate(str: string): extended;
 var
  i: byte;
  chres: char;
  num1, num2: extended;
  Stack: TStack;
 begin
  Stack := TStack.Create;
 try
  chres := Succ('z');
  with Stack do
  begin
   for i := 1 to Length(str) do
    if str[i] in Operands then
    begin
     num2 := ANumber[Pop];
     num1 := ANumber[Pop];
     case str[i] of
      '+': ANumber[chres] := num1 + num2;
      '-': ANumber[chres] := num1 - num2;
      '*': ANumber[chres] := num1 * num2;
      '/': ANumber[chres] := num1 / num2;
      '^': ANumber[chres] := Power(num1, num2);
     end;
     Push(chres);
     Inc(chres);
    end
    else
     Push(str[i]);
   Result := ANumber[Pop];
  end;
 finally
  Stack.Destroy;
 end;
 end;
end.
