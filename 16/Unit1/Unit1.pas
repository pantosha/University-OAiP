unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit2;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    ButReload: TButton;
    ButSort: TButton;
    Button1: TButton;
    Button2: TButton;
    procedure ButReloadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButSortClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
var
 Stack: TOchered;
const
 C = 20;
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 Randomize;
 Stack := TOchered.Create(2 + Random(C));
 Stack.Print(ListBox1);
end;

procedure TForm1.ButReloadClick(Sender: TObject);
begin
 Stack.Destroy;
 Stack := TOchered.Create(2 + Random(C));
 Stack.Print(ListBox1);
end;

procedure TForm1.ButSortClick(Sender: TObject);
begin
 Stack.Sort;
 Stack.Print(ListBox1);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 Stack.Pop;
 Stack.Print(ListBox1);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 Stack.Push(1 + Random(254));
 Stack.Print(ListBox1);
end;

end.

