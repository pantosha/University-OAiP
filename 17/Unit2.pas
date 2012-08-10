unit Unit2;

interface
uses
 Stack;
type
 TCalc = class
  Stack: TStack;
  ANumber: array ['a'..'я'] of extended;
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
    if ch in Operands then // Является ли символ операндом
     if IsEmpty then // Пуст ли стек?
      Push(infix[i]) // Пуст. Добавляем в стек. И выходим
     else if ch = '(' then // Не пуст. Может это скобочка, открывающаяся скобочка?
       Push(infix[i]) //Да, это скобочка. Она уже добавлена в стек.
      else if ch = ')' then //Неа. Ну тогда, хотя бы, закрывающася скобочка?
       begin
        ch := Pop; // Ответ положительный: скобочка закрывающаяся.
        while ch <> '(' do //поехали искать открывающую скобочку.
        begin
         Result := Result + ch; //Заодно повыталкиваем в выходную строку все операнды между скобочками
         ch := Pop;
        end;
       end
       else // Парень, извини, не твой цикл, но стек не пустой иди же сюда!
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
