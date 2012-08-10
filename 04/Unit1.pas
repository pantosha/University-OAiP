unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Math;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    NEdit: TEdit;
    MEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
 Nmax = 10;

type
 Mas = array [1 .. Nmax, 1 .. Nmax] of extended;

var
  Form1: TForm1;
  n, m: integer;
  a: Mas;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
i, j : integer;
begin
try
 n := StrToInt(NEdit.Text);  //строки
 m := StrToInt(MEdit.Text);  //столбцы

 StringGrid1.RowCount := n + 1;
 StringGrid1.ColCount := m + 1;

 StringGrid1.FixedRows := 1;
 StringGrid1.FixedCols := 1;

except
 else begin
  MessageDlg('Это не Спартаааа!', mtWarning, [mbOk], 0);
  Exit;
 end;
end;

 for i := 1 to n do
  StringGrid1.Cells[0,i] := IntToStr(i);

 for i := 1 to m do
  StringGrid1.Cells[i,0] := IntToStr(i);

 for i := 1 to n do
  for j := 1 to m do
   StringGrid1.Cells[j,i] := IntToStr(Random (20));

 end;

procedure TForm1.Button2Click(Sender: TObject);
var
i, j, k, s, f : integer;
begin
 s := 0;
try
 for i := 1 to n do
  for j := 1 to m do
   a[i, j] := StrToFloat( StringGrid1.Cells[j, i] );
except
  else begin
  MessageDlg('Это не Спартаааа!', mtWarning, [mbOk], 0);
  Exit;
 end;
end;

 for i := 1 to n do begin
  for j := 2 to (m - 1) do begin
   k := m;
   f := 1;
   while a[i, f] < a[i, j] do
    f := f + 1;

   if f = j then begin
    while a[i, k] > a[i, j] do
     k := k - 1;

    if k = j then
     s := s + 1;
   end
   else
    Continue;
  end;
 end;
 MessageDlg('Особых элем. - ' + IntToStr(s), mtInformation, [mbOk],0);
end;

end.
