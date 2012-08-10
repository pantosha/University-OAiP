unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unit2, StdCtrls, ExtCtrls, Grids;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    EditInfix: TLabeledEdit;
    EditPostfix: TLabeledEdit;
    ButToPostfix: TButton;
    EditResult: TLabeledEdit;
    ButClear: TButton;
    ButCalc: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ButToPostfixClick(Sender: TObject);
    procedure ButCalcClick(Sender: TObject);
    procedure ButClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
var
 Polish: TCalc;
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
 i: byte;
begin
 Polish := TCalc.Create;

 StringGrid1.Cells[0,0] := 'Имя:';
 StringGrid1.Cells[1,0] := 'Значение:';

 Randomize;

 for i := 1 to StringGrid1.RowCount do
 begin
  StringGrid1.Cells[0,i] := Chr(96 + i);
  StringGrid1.Cells[1,i] := IntToStr(Random(10));
 end;
end;

procedure TForm1.ButToPostfixClick(Sender: TObject);
begin
try
 EditPostfix.Text := Polish.InfixToPostfix(EditInfix.Text);
except
 else
  ShowMessage('Опять бред какой-то');
end;
end;

procedure TForm1.ButCalcClick(Sender: TObject);
var
 i: byte;
begin
try
 with Polish do
 begin
  for i := 1 to StringGrid1.RowCount do
   ANumber[StringGrid1.Cells[0,i][1]] := StrToFloat(StringGrid1.Cells[1,i]);
  EditPostfix.Text := Polish.InfixToPostfix(EditInfix.Text);
  EditResult.Text := FloatToStr(Calculate(EditPostfix.Text));
 end;
except
 else
  ShowMessage('Опять бред какой-то');
end;
end;

procedure TForm1.ButClearClick(Sender: TObject);
var
 i: byte;
begin
 EditResult.Clear;
 EditPostfix.Clear;
 for i := 1 to StringGrid1.RowCount do
 begin
  StringGrid1.Cells[0,i] := Chr(96 + i);
  StringGrid1.Cells[1,i] := IntToStr(Random(10));
 end;
end;

end.
