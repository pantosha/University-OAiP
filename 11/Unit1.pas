unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit2, ExtCtrls, Buttons;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    NEdit: TLabeledEdit;
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
var
 HanoiTower: Hanoi;
 n: byte;
begin
try
 Memo1.Clear;
 HanoiTower := Hanoi.Create;
try
 n := StrToInt(NEdit.Text);
 case RadioGroup1.ItemIndex of
  0: begin
   Memo1.Lines.Add('Цыплят по рекурсии считают:');
   Memo1.Lines.Add(HanoiTower.Recursion(n));
  end;
  1: begin
   Memo1.Lines.Add('Цыплят по итерации считают:');
   Memo1.Lines.Add(HanoiTower.Iteration(n));
  end;
 end;
except
 else begin
  ShowMessage('Это не Спарта! Не надо здесь стулья ломать!');
  Exit;
 end;
end;

finally
 HanoiTower.Free;
end;
end;

end.
