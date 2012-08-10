unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Math, ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    XEdit: TEdit;
    iEdit: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    CheckBox1: TCheckBox;
    RadioGroup1: TRadioGroup;
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
x,f,a : extended;
i     : integer;
begin
Memo1.Clear;

Memo1.Lines.Add('Рез-ты ст.гр. 152003 Павловича А.Н.');
Memo1.Lines.Add('Исходные данные');
  x:=StrToFloat(XEdit.Text);
Memo1.Lines.Add(' X = ' + FloatToStrF(x,fffixed,8,4));
  i:=StrToInt(iEdit.Text);
Memo1.Lines.Add(' i = ' + IntToStr(i));

//Выбор необходимого вида вычислений
case RadioGroup1.ItemIndex of
  0:    f := sinh(x);
  1:    f := sqr(x);
  2:    f := Exp(x);
  else  begin
          Memo1.Lines.Add('Что-то пошло не так.');
          Exit;
        end
end;

//Вычисление необходимого значения
//if (i mod 2) = 0 and (x < 0) then
//  begin
//  end

if (i mod 2) = 0
  then begin
    if x < 0 then
     a := i / 2 * sqrt(f)
    else
     a := sqrt(abs(i*f));
  end
  else begin
   if x > 0 then
    a := i * sqrt(f)
   else
    a := sqrt(abs(i*f));
  end;

if CheckBox1.Checked then
  Memo1.Lines.Add('Результат a = '+ IntToStr(Round(a)))
 else
  Memo1.Lines.Add('Результат a = '+ FloatToStrF(a,fffixed,8,4));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
Memo1.Clear;
Xedit.Text:='-15,246';
iedit.Text:='5';
end;

end.
