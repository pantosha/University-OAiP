unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Math, ExtCtrls, Buttons;

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
    RadioGroup1: TRadioGroup;
    OKButton: TBitBtn;
    Close: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
implementation
{$R *.dfm}
uses
 Unit2;
var
 e: extended;

function yx (x: extended): extended;
begin
 Result := (1 + 2 * power(x, 2)) * exp(power(x, 2));
end;

function sx (x: extended): extended;
var
 a, n, s : extended;
begin
 a := 1;
 n := 0;
 s := 1;
try
 while abs((2 * n + 1) * a) > e do begin
  n := n + 1;
  a := a * power(x, 2) / n;
  s := s + (2 * n + 1) * a;
 end;
except
 else
  case MessageDlg('Это Спарта! Но вычисления можно продолжить. Продолжить?', mtError, [mbYes, mbNo], 0) of
   mrYes : Result := 0;
   mrNo  : Halt(1);
  end;
end;
 Result := s;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 Memo1.Clear;
 XnEdit.Text := '0,1';
 XkEdit.Text := '0,7';
 MEdit.Text := '5';
 eEdit.Text := '0,001';
end;

procedure TForm1.OKButtonClick(Sender: TObject);
var
 m: word;
 xn, xk, e: extended;
begin
try
 Memo1.Clear;
 Memo1.Lines.Add('Результаты ст.гр. 152003 Павловича А.Н.');
 xn := StrToFloat(XnEdit.Text);
  Memo1.Lines.Add(' xn = ' + FloatToStrF(xn, ffFixed, 6, 2));
 xk := StrToFloat(XkEdit.Text);
  Memo1.Lines.Add(' xk = ' + FloatToStrF(xk, ffFixed, 6, 2));
 m := StrToInt(MEdit.Text);
  Memo1.Lines.Add(' M = ' + IntToStr(m));
 e := StrToFloat(eEdit.Text);
  Memo1.Lines.Add(' e = ' + FloatToStrF(e, ffFixed, 8, 5));
except
 else begin
  MessageDlg('Это не Спарта!', mtWarning, [mbOk], 0);
  Exit;
 end;
end;
 case RadioGroup1.ItemIndex of
  0 : begin
   Memo1.Lines.Add('Расчёт S(x)');
   tyrpyr(sx, xn, xk, m, Memo1);
  end;
  1 : begin
   Memo1.Lines.Add('Расчёт Y(x)');
   tyrpyr(yx, xn, xk, m, Memo1);
  end;
 end;
end;

end.
