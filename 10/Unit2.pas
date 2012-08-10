unit Unit2;

interface
uses
  Windows, SysUtils, Graphics, ExtCtrls;

type
 TRectangle = class
   procedure MoveTo(dx, dy, dr: integer);
   constructor Create(x0, y0, r0: word; Image0: TImage; ColorLine0: TColor);
  private
   ColorLine: TColor;
   Image: TImage;
   x, y, r: word;
   procedure Show;
   procedure Hide;
   procedure Draw; virtual;
 end;

 TExtremity = class(TRectangle)
   constructor Create(x0, y0, r0: word; Image0: TImage; ColorLine0: TColor);
  private
   point: array of TPoint;
   procedure Draw; override;
 end;

TArms = class(TExtremity)
   constructor Create(x0, y0, r0: word; Image0: TImage; ColorLine0: TColor);
   procedure Honor;
  private
   procedure Draw; override;
   procedure ArmsDraw(bl: Boolean = false);
 end;

implementation
 procedure TRectangle.Show;
 begin
  Image.Canvas.Pen.Color := clBlack;
  Draw;
 end;

 procedure TRectangle.Hide;
 begin
  Image.Canvas.Pen.Color := clWhite;
  Draw;
 end;

 procedure TRectangle.MoveTo;
 begin
  Hide;
  x := x + dx;
  y := y + dy;
  r := r + dr;
  Show;
 end;

 procedure TRectangle.Draw;
 begin
  Image.Canvas.Rectangle(x - r, y - 2*r, x + r + 1, y + 2*r);
 end;

 procedure TExtremity.Draw;
 begin
  inherited Draw;
  with Image.Canvas do begin
   Brush.Color:=clYellow;
   Ellipse(x - r, y - 4*r, x + r, y - 2*r);
   Brush.Color:=clWhite;
   point[0].X := x - 2*r;
   point[0].Y := y + 6*r;

   point[1].X := x - r;
   point[1].Y := y + 6 * r;

   point[2].X := x - r;
   point[2].Y := y + 2 * r;

   point[3].X := x + r;
   point[3].Y := y + 2 * r;

   point[4].X := x + r;
   point[4].Y := y + 6 * r;

   point[5].X := x + 2 * r;
   point[5].Y := y + 6 * r;

   Polyline(point);

  end;
 end;

 procedure TArms.ArmsDraw;
 var
 t: byte;
 begin
  point[0].X := x - r - 1;
  point[0].Y := y;

  point[1].X := x - 2*r - 1;
  point[1].Y := y - r;

  point[2].X := x - r;
  point[2].Y := y - 2*r;

  point[3].X := x + r;
  point[3].Y := y - 2*r;

  point[4].X := x + 2*r;
  point[4].Y := y - r;

  point[5].X := x + r;
  point[5].Y := y;
  Image.Canvas.Polyline(point);
  if bl then
  begin
   t := trunc(r/10);
   while point[0].Y > (y - 3*r) do
   begin
    Image.Canvas.Pen.Color := clWhite;
    Image.Canvas.Polyline(point);

    point[0].Y := point[0].Y - 2*t; //Ќе работает!
    point[1].Y := point[1].Y - t;

    Image.Canvas.Pen.Color := clBlack;
    Image.Canvas.Polyline(point);
    Image.Update;
    sleep(100);
   end;
   sleep(500);
   while point[0].Y < y do //нехватка времени и фантазии заставл€ет выбирать наибыстрейшие пути решени€ проблемы.
   begin
    Image.Canvas.Pen.Color := clWhite;
    Image.Canvas.Polyline(point);

    point[0].Y := point[0].Y + 2*t; //Ќе работает!
    point[1].Y := point[1].Y + t;

    Image.Canvas.Pen.Color := clBlack;
    Image.Canvas.Polyline(point);
    Image.Update;
    sleep(100);
   end;
   ArmsDraw;
  end;
 end;

 procedure TArms.Draw;
 begin
  inherited Draw;
  ArmsDraw;
 end;

 procedure TArms.Honor;
 begin
  ArmsDraw(true);
 end;

 constructor TRectangle.Create;
 begin
  inherited Create;
  x := x0;
  y := y0;
  r := r0;
  Image := Image0;
  ColorLine := ColorLine0;
 end;

 constructor TExtremity.Create;
 begin
  inherited Create(x0, y0, r0, Image0, ColorLine0);
  SetLength(point, 6);
 end;

 constructor TArms.Create;
 begin
  inherited Create(x0, y0, r0, Image0, ColorLine0);
  Draw;
 end;
end.
