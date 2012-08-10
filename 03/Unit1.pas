unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Math;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    XnEdit: TEdit;
    XkEdit: TEdit;
    MEdit: TEdit;
    eEdit: TEdit;
    Label5: TLabel;
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  n, M: integer;
  y, e, s, a, xk, xn, h: extended;
begin
  Memo1.Clear;
  Memo1.Lines.Add('Результаты ст.гр. 152003 Павловича А.Н.');

  xn:=StrToFloat(XnEdit.Text);
 Memo1.Lines.Add(' xn = ' + FloatToStrF(xn,ffFixed,6,2));

  xk:=StrToFloat(XkEdit.Text);
 Memo1.Lines.Add(' xk = ' + FloatToStrF(xk,ffFixed,6,2));

  M:=StrToInt(MEdit.Text);
 Memo1.Lines.Add(' M = ' + IntToStr(M));

  h := (xk - xn) / M;
 Memo1.Lines.Add(' h = ' + FloatToStrF(h,ffFixed,8,5));

  e:=StrToFloat(eEdit.Text);
 Memo1.Lines.Add(' e = ' + FloatToStrF(e,ffFixed,8,5));
repeat
 n := 0;
 s := 1;
 a := 1;

  while abs((2 * n + 1) * a) > e do begin
   n := n + 1;
   a := a * power(xn, 2) / n;
   s := s + (2 * n + 1) * a;
  end;

 y := (1 + 2 * power(xn, 2)) * exp(power(xn, 2));
 Memo1.Lines.Add( 'При x = ' + FloatToStrF(xn, ffFixed,6,3) + ' Y = ' + FloatToStrF(y, ffFixed,6,3) + ' сумма = ' + FloatToStrF(s, ffFixed,6,3) + ' N = ' + IntToStr(n));
 xn := xn + h;
until xn >= (xk + h / 2)
  end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 Memo1.Clear;
 XnEdit.Text := '0,1';
 XkEdit.Text := '0,7';
 MEdit.Text := '5';
 eEdit.Text := '0,001';
end;

end.
