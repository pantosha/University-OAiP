unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Clipbrd, TeEngine, Series,
  TeeProcs, Chart, Unit2;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Image1: TImage;
    XnEdit: TLabeledEdit;
    XkEdit: TLabeledEdit;
    MEdit: TLabeledEdit;
    GraphSolveBut: TButton;
    CpBufBut: TButton;
    TabSheet2: TTabSheet;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    procedure GraphSolveButClick(Sender: TObject);
    procedure CpBufButClick(Sender: TObject);
    procedure XnEditKeyPress(Sender: TObject; var Key: Char);
    procedure MEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

var
aPoint : array of TPoint;
aXYPoint: array of TXYPoint;

procedure TForm1.GraphSolveButClick(Sender: TObject);
var
 h: double;
 kx, ky, k, xn, xk, x0: extended;
 i, m: byte;
 ox, oy: integer;
begin
try
 Image1.Picture := nil;
 xn := StrToFloat(XnEdit.Text);
 xk := StrToFloat(XkEdit.Text);
 m := byte(StrToInt(MEdit.Text));

{Создание массива значений}
 h := (xk - xn) / m;
 x0 := xn;
 SetLength(aXYPoint, m);
 for i := 0 to (m - 1) do
  with aXYPoint[i] do
  begin
   y := f(x0);
   x := x0;
   x0 := x0 + h;
  end;

{Расчёт коэф. и построение осей}
 kx := Trunc(Image1.Width / (xk - xn));
 ky := Trunc(Image1.Height / (MaxY(aXYPoint) - MinY(aXYPoint)));
 if kx < ky then
 begin
  k := kx;
  ox := Round(abs(xn * k));
  oy :=  Image1.Height div 2;
 end
 else
 begin
  k := ky;
  ox := Image1.Width div 2;
  oy := Round(maxY(aXYPoint) * k);
 end;

 with Image1.Canvas do
 begin
  MoveTo (0, oy); //ось абсцисс
  LineTo (Image1.Width, oy);

  MoveTo(ox, 0); //ось ординат
  LineTo(ox, Image1.Height);
 end;

{создание базы точек}
 SetLength(aPoint, m);
 for i := 0 to (m - 1) do
 begin
  aPoint[i].X := ox + Round(aXYPoint[i].x * k);
  aPoint[i].Y := oy - Round(aXYPoint[i].y * k);
 end;

 with Image1.Canvas do
 begin
  Pen.Color := clRed;
  Brush.Color := clGreen;
  Polyline (aPoint);
 end;

 with Chart1 do
 begin

  SeriesList[0].Clear;
  for i := 0 to High(aXYPoint) do
   with aXYPoint[i] do
   SeriesList[0].AddXY(x, y);

   SeriesList[1].Clear;
   t := xn
   for i := 0 to m
   begin
    y := power(t,2);
    SeriesList[1].AddXY(t, y);
    x := t + h;
   end;
 end;
except
 else
 begin
  ShowMessage('Уберите руки от клавиатуры. Без людей всё работает лучше.');
  Exit;
 end;
end;
end;

procedure TForm1.CpBufButClick(Sender: TObject);
begin
 case PageControl1.ActivePageIndex of
  0: Clipboard.Assign(Image1.Picture);
  1: Chart1.CopyToClipboardMetafile(True);
 end;
end;

procedure TForm1.XnEditKeyPress(Sender: TObject; var Key: Char);
begin
 if not(Key in ['0' .. '9', #8, ',']) then Key := #0;
end;

procedure TForm1.MEditKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0' .. '9', #8]) then key := #0;
end;

end.
