unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, Unit2, ExtCtrls;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LabeledEdit1: TLabeledEdit;
    BitBtn2: TBitBtn;
    StringGrid4: TStringGrid;
    Label4: TLabel;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  G:TSlau;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
var k,j,N:integer;
begin
  N:=StrToInt(LabeledEdit1.Text);
  G:=TSlau.Create(N);
  k:=1;
  while k<N+1 do
    begin
      for j:=k to N do
        G.Addj(k,j,StrToFloat(StringGrid1.Cells[j-1,k-1]));
      Inc(k);
    end;
  for i:=0 to N-1 do
    G.Addb(i+1,StrToFloat(StringGrid2.Cells[0,i]));
  G.SlauT;
  G.Print(StringGrid1,StringGrid2,StringGrid3);
  G.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  LabeledEdit1.Text:='5';
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var N:integer;
begin
  N:=StrToInt(LabeledEdit1.Text);
  StringGrid1.ColCount:=N;
  StringGrid1.RowCount:=N;
  StringGrid2.RowCount:=N;
  StringGrid3.RowCount:=N;
  StringGrid4.RowCount:=N;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var k,j,N:integer;
begin
  N:=StrToInt(LabeledEdit1.Text);
  G:=TSlau.Create(N);
  k:=1;
  while k<N+1 do
    begin
      for j:=k to N do
        G.Addj(k,j,StrToFloat(StringGrid1.Cells[j-1,k-1]));
      Inc(k);
    end;
  G.Max(StringGrid4);;
  G.Free;
end;

end.
