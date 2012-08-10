unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit2;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    ButPush: TButton;
    ButPop: TButton;
    ButSort: TButton;
    LabelSearchResult: TLabel;
    ButReload: TButton;
    ButQuest: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ButPushClick(Sender: TObject);
    procedure ButPopClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ButSortClick(Sender: TObject);
    procedure ButReloadClick(Sender: TObject);
    procedure ButQuestClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
var
 Stack: TStack;
const
 C = 20;
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 Randomize;
 Stack := TStack.Create(2 + Random(C));
 Stack.Print(ListBox1);
end;

procedure TForm1.ButPushClick(Sender: TObject);
begin
 Stack.Push(1 + Random(254));
 Stack.Print(ListBox1);
end;

procedure TForm1.ButPopClick(Sender: TObject);
var
 Popnumber: byte;
begin
 Popnumber := Stack.Pop;
 Stack.Print(ListBox1);
 ShowMessage('Было извлечено значение ' + IntToStr(Popnumber));
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
LabelSearchResult.Caption := '0x' + IntToHex(dword(Stack.Search(StrToInt(ListBox1.Items.Strings[ListBox1.ItemIndex]))), 7);
end;

procedure TForm1.ButSortClick(Sender: TObject);
begin
 Stack.Sort;
 Stack.Print(ListBox1);
end;

procedure TForm1.ButReloadClick(Sender: TObject);
begin
 Stack.Destroy;
 Stack := TStack.Create(2 + Random(C));
 Stack.Print(ListBox1);
end;

procedure TForm1.ButQuestClick(Sender: TObject);
begin
 ShowMessage('Всего лишь ' + IntToStr(Stack.NumMoreThanAvr) + ' элемента(ов) больше среднего значения');
end;
end.
