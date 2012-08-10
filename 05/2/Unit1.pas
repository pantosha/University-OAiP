unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    BtnOk: TBitBtn;
    BtnExit: TBitBtn;
    StringGrid2: TStringGrid;
    StringGrid1: TStringGrid;
    KEdit: TEdit;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
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
var
 i : integer;
begin
 Randomize;
 KEdit.Text := IntToStr(Random(99));
 for i  := 0 to (StringGrid1.ColCount - 1) do
  StringGrid1.Cells[i, 0] := Chr(Random(255));
end;

procedure TForm1.BtnOkClick(Sender: TObject);
var
k, i: integer;
begin
try
 k := StrToInt(KEdit.Text) mod StringGrid1.ColCount;
except
 else begin
  MessageDlg('Это не Спартаааа!', mtWarning, [mbOk], 0);
  Exit;
 end;
end;

 for i := 0 to (StringGrid1.ColCount - 1) do
  StringGrid2.Cells[i, 0] := StringGrid1.Cells[(i + k) mod StringGrid1.ColCount, 0];
////////////////////////////////////////////////////////////////////
//  // i := (StringGrid1.ColCount + i - k) mod StringGrid1.ColCount;
//    for i := 0 to (StringGrid1.ColCount - 1) do
//     StringGrid2.Cells[(StringGrid1.ColCount + i - k) mod StringGrid1.ColCount, 0] := StringGrid1.Cells[i, 0]
////////////////////////////////////////////////////////////////////

end;

end.
