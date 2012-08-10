unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;
type
 TCall = record
  Date: TDateTime;
  Time, Price, Number, Code: word;
  City: string[30];
 end;

 ATCall = array of TCall;
 AByte = array of byte;

 TAllMake = class
  ABase: ATCall;
  FBase: file of TCall;
  N: byte;
  Memo: TMemo;
  constructor Create(Memo1: TMemo);
  procedure OpenCreate(OpenDialog: TOpenDialog); // +
  procedure Save(SaveDialog: TSaveDialog); // +
  procedure Add(EDate, ECity, ETime, EPrice, ENumber, ECode: TLabeledEdit); // -
  procedure Remove(Time: word);
  function LineSearch(Text: string; i: byte = 0): AByte; // +
  function BinarySearch(Time: word): AByte;
  procedure QuickSort; // -
  procedure MergeSort;
  procedure PrintMemo(b: array of byte); overload;
  procedure PrintMemo(); overload;
 end;

implementation

constructor TAllMake.Create;
begin
 Memo := Memo1;
 SetLength(ABase, 0);
end;

procedure TAllMake.PrintMemo(b: array of byte);
var
 i: word;
begin
try
 if Length(b) <> 0 then
  for i := 0 to High(b) do
   Memo.Lines.Add('Дата:' + DateToStr(ABase[b[i]].Date) + ' Город: ' + ABase[b[i]].City + ' Время: ' + IntToStr(ABase[b[i]].Time));
except
 else begin
  ShowMessage('Это не Высоцкий! Укол в шею не поможет!');
  Exit;
 end;
end;
end;

procedure TAllMake.PrintMemo;
var
 i: word;
begin
try
 if Length(ABase) <> 0 then
 for i := 0 to High(ABase) do
  Memo.Lines.Add('Дата:' + DateToStr(ABase[i].Date) + ' Город: ' + ABase[i].City + ' Время: ' + IntToStr(ABase[i].Time));
except
 else begin
  ShowMessage('Это не Высоцкий! Укол в шею не поможет!');
  Exit;
 end;
end;
end;

procedure TAllMake.OpenCreate;
begin
 if OpenDialog.Execute then
  if FileExists(OpenDialog.FileName) then
  begin
   AssignFile(FBase, OpenDialog.FileName);
   Reset(FBase);
   //кусок кода, вызывающий магию, для отображения содержания файла в текстовое окошечко.
   N := 0;
   Memo.Clear;
   SetLength(ABase, FileSize(FBase));
   while N < FileSize(FBase) do
   begin
    Read(FBase, ABase[N]);
    PrintMemo([N]);
    Inc(N);
   end
   {   begin
    SetLength(ABase, Length(ABase) + 1);
    Read(FBase, ABase[High(ABase)]);
//    MemoPrint (ABase[High(ABase)], Memo);// не забыть допилить или перепилить. Возможно так: MemoPrint([N])
    N := N + 1;
   end;
   PrintMemo;}
  end
  else
  begin
   AssignFile(FBase, OpenDialog.FileName);
   Rewrite(FBase);
  end;
end;

procedure TAllMake.Save(SaveDialog: TSaveDialog);
var
 i: byte;
begin
 if Length(ABase) <> 0 then
  if SaveDialog.Execute then
  begin
   AssignFile(FBase, SaveDialog.FileName);
   Rewrite(FBase);
   for i := 0 to High(ABase) do
    Write(FBase, ABase[i]);
   CloseFile(FBase);
  end;
end;

procedure TAllMake.Add(EDate, ECity, ETime, EPrice, ENumber, ECode: TLabeledEdit); // положить на форму кнопки, подумать головой и... сесть...
begin
try
 SetLength(ABase, Length(ABase) + 1);
 with ABase[High(ABase)] do
 begin
  Date := StrToDate(EDate.Text);
  City := ECity.Text;
  Time := StrToInt(ETime.Text);
  Price := StrToInt(EPrice.Text);
  Number := StrToInt(ENumber.Text);
  Code := StrToInt(ECode.Text);
  PrintMemo ([High(ABase)]);
 end;
except
 else begin
  ShowMessage('Что-то случилось. Закройте, забейте, забудьте. А лучше подышите воздухом: ведь он такой ванильный!');
 end;
end;
end;

procedure TAllMake.Remove(Time: word);
var
 i, j: word;
 b: Abyte;
begin
 b := BinarySearch(Time);
 if Length(b) <> 0 then
 begin
  j := 0;
  for i := b[j] to High(ABase) do
  begin
   ABase[i-j] := ABase[i];
   if b[j] = i then
    Inc(j);
  end;
  SetLength(ABase, Length(ABase)-j);
  Memo.Clear;
  PrintMemo;
 end;
end;
function TAllMake.LineSearch(Text: string; i: byte = 0): AByte;
{var
 i, j: word;}
begin
// получим вечный цикл, если отправим i > High(ABase)
for i := i to High(ABase) do // интересный взгляд на переменные.
 if (ABase[i].City = Text) then
 begin
  SetLength(Result, Length(Result) + 1);
  Result[High(Result)] := i;
 end;
end;

function TAllMake.BinarySearch(Time: word): Abyte; // возвращает номер элемента массива или -1, если такого элемента нет.
var
 i: word;
 function Recursion(b, e: byte): byte;
 var
  m: byte;
 begin
  if b < e then
  begin
   m := b + (e - b) div 2; // ??? ???: m := (e + b) div 2; ?? ???????? ??????: "????? ??? ?????????"
                           //  ?????: "????? b ? e ??????, ??? ??? ?? ????? ?????? ?????? ?????? ?? ?????????? ??? ??? ???????"
   if Time <= ABase[m].Time then
    Result := Recursion(b, m)
   else
    Result := Recursion(m + 1, e);
  end
  else
   Result := b;
 end;
begin
// тут не хватает копипаста вызова функции сортировки массива a[].
 MergeSort; // теперь хватает
//
 i := Recursion(0, High(ABase));
 while ABase[i].Time = Time do
 begin
  SetLength(Result, Length(Result) + 1);
  Result[High(Result)] := i;
  Inc(i);
 end;
// Result := Recursion(0, High(ABase));
// if ABase[Result].Time <> Time then
//  Memo.Lines.Add('Нет такого');
end;

procedure TAllMake.QuickSort;
 procedure Sort(b, e: word);
 var
  i, j, x: word;
  w: TCall;
 begin
  i := b;
  j := e;
  x := ABase[(b + e) div 2].Time;
  Repeat
   while ABase[i].Time < x do
    Inc(i);
   while ABase[j].Time > x do
    Dec(j);
   if i <= j then // зачем эта проверка?
   begin
		w := ABase[i];
    ABase[i] := ABase[j];
    ABase[j] := w;
    Inc(i);
    Dec(j);
   end;
  until i > j;
  if b < j then
   Sort(b, j);
  if i < e then
   Sort(i, e);
	end; //sort
  begin
	 Sort(0, Length(ABase)-1);
  end;

procedure TAllMake.MergeSort;
 var
  Atmp: ATCall; //Временный буфер
  //Слияние
 procedure merge(L, Spl, R : word);
  var
    i, j, k : word;
  begin
   i := L;
   j := Spl + 1;
   k := 0;
    //Выбираем меньший из первых и добавляем в tmp
   while (i <= Spl) and (j <= R) do
   begin
    if ABase[i].Time > ABase[j].Time then
    begin
     Atmp[k] := ABase[j];
     Inc(j);
    end
    else
    begin
     Atmp[k] := ABase[i];
     Inc(i);
    end;
    Inc(k);
   end;
    //Просто дописываем в tmp оставшиеся эл-ты
   if i <= Spl then      //Если первая часть не пуста
    for j := i to Spl do
    begin
     Atmp[k] := ABase[j];
     Inc(k);
    end
   else                  //Если вторая часть не пуста
    for i := j to R do
    begin
     Atmp[k] := ABase[i];
     Inc(k);
    end;
    //Перемещаем из tmp в arr
   Move(Atmp[0], ABase[L], k*SizeOf(TCall));
  end;

  //Сортировка
  procedure sort(L, R : word);
  var
   splitter : word;
  begin
    //Массив из 1-го эл-та упорядочен по определению
   if L >= R then Exit;
    splitter := (L + R) div 2;  //Делим массив пополам
    sort(L, splitter);          //Сортируем каждую
    sort(splitter + 1, R);      //часть по отдельности
    merge(L, splitter, R);      //Производим слияние
  end;

  //Основная часть процедуры сортировки
begin
  SetLength(Atmp, Length(ABase));
  sort(0, Length(ABase) - 1);
  SetLength(Atmp, 0);
end;

{                             //                   ||                    ||
procedure TAllMake.SortSlip; //пиление в процессе ||********************||
                             //                   ''\/\/\/\/\/\/\/\/\/\/''
 procedure Slip(b, m, e: word);
 var
  c: ATCall;
  i, j, k: word;
 begin
  i := b;
  k := 0;
  j := m + 1;
  SetLength(c, e - b + 1);
  while (i <= m) and (j <= e) do
   if ABase[i].Time < ABase[j].Time then
   begin c[k] := ABase[i]; Inc(i); Inc(k); end
           else
   begin c[k] := ABase[j]; Inc(j); Inc(k) end;
      while i <= m do
   begin c[k] := ABase[i]; Inc(i); Inc(k) end;
	    while j <= e do
   begin c[k] := ABase[j]; Inc(j); Inc(k) end;

  k := 0;
  for i := b to e do
  begin
   Inc(k);
   ABase[i] := c[k];
  end;
 end;

 procedure Recursion (b, e: word);
 var
  m: word;
 begin
  if b <> e then
  begin
   m := (b + e) div 2;
   Recursion(b, m);
   Recursion(m + 1, e);
   Slip(b, m, e);
  end;
 end;
begin
 Recursion(0, High(ABase));
 PrintMemo;
end; }
{
//////////////////////*temporatary*//////////////////////
function LineSearch(a: array of string[30]; Text: shortstring; i: byte = 0): boolean; overload
begin
 SetLength(a, Length(a) + 1);
 a[High(a)] := Text;
 while a[i] <> Text do
  Inc(i);
 if i = High(a) then
 begin
  Length(a, Length(a) - 1);
  Result := true;
 end
 else
  Result := false;
end;

procedure SpecZadanie;
var
 ACity: array of shortstring;
 i: byte;
begin
 SetLength(ACity, 1);
 ACity[0] := ABase[0].City;
 for i := 1 to High(ABase) do
  if LineSearch(ACity, ABase[i].City) then
  begin
   SetLength(a, Length(a) + 1);
   ACity[High(ACity)] := ABase[i].City;
   PrintMemo(LineSearch(ABase[i].City, i));
  end;
end; }

end.
