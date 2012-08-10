unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls, Unit2;

type
  TForm1 = class(TForm)
    RadioGroup1: TRadioGroup;
    StringGrid1: TStringGrid;
    Memo1: TMemo;
    RunBut: TButton;
    ReloadBut: TButton;
    WEdit: TLabeledEdit;
    NEdit: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure ReloadButClick(Sender: TObject);
    procedure RunButClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
 Form1: TForm1;
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 Memo1.Clear;
 ReloadButClick(Sender);
 StringGrid1.Cells[1, 0] := 'Вес:';
 StringGrid1.Cells[2, 0] := 'Цена:';
end;

procedure TForm1.ReloadButClick(Sender: TObject);
var
 i, j: byte;
begin
 StringGrid1.ColCount := 3;
 StringGrid1.RowCount := StrToInt(NEdit.Text) + 1;
 for i := 1 to StrToInt(NEdit.Text) do
  StringGrid1.Cells[0, i] := IntToStr(i);
 Randomize;
 for i := 1 to StrToInt(NEdit.Text) do
  for j := 1 to 3 do
   StringGrid1.Cells[j, i] := IntToStr(Random (15) + 5);
end;

procedure TForm1.RunButClick(Sender: TObject);
var
 Sort: TSort;
 S: tes;
 i: byte;
begin
try
 Memo1.Clear;
 Sort := TSort.Create(StrToInt(WEdit.Text), StringGrid1);
 with Sort do begin
  case RadioGroup1.ItemIndex of
   0: S := BranchAndBound;
   1: S := CompleteEnumeration;
   2: S := MaxPrice;
   3: S := MinWeight;
   4: S := OptimPrice;
   5: S := RussianRoulette;
  end;
 end;
 Memo1.Lines.Add('№  масса  цена');
 for i := 1 to (StringGrid1.RowCount - 1) do
  if i in S then
   Memo1.Lines.Add(StringGrid1.Cells[0, i] + '       ' + StringGrid1.Cells[1, i] + '        ' + StringGrid1.Cells[2, i]);
 Memo1.Lines.Add('Общая стоимость: ' + IntToStr(Sort.PMax));
finally
 Sort.Free;
end;
end;

end.
