unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit2, ComCtrls;

type
  TForm1 = class(TForm)
    LabelSearchResult: TLabel;
    ListBox1: TListBox;
    ButReload: TButton;
    ButSort: TButton;
    StatusBar1: TStatusBar;
    procedure ButReloadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButSortClick(Sender: TObject);
    procedure ButPushClick(Sender: TObject);
    procedure ButPopClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
var
 List: TTurnExtended;
const
 C = 20;
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 Randomize;
 List := TTurnExtended.Create(2 + Random(C));
 List.Print(ListBox1);
end;

procedure TForm1.ButPushClick(Sender: TObject);
var
 pushnum: byte;
begin
 PushNum := 1 + Random(254);
 List.Push(PushNum);
 StatusBar1.SimpleText := 'Было добавлено значение: ' + IntToStr(PushNum);
 List.Print(ListBox1);
end;

procedure TForm1.ButPopClick(Sender: TObject);
begin
 StatusBar1.SimpleText := 'Было прочитано значение: ' + IntToStr(List.Pop);
 List.Print(ListBox1);
end;

procedure TForm1.ButSortClick(Sender: TObject);
begin
 List.Sort;
 List.Print(ListBox1);
 StatusBar1.SimpleText := '';
end;

procedure TForm1.ButReloadClick(Sender: TObject);
begin
 List.Destroy;
 List := TTurnExtended.Create(2 + Random(C));
 List.Print(ListBox1);
 StatusBar1.SimpleText := '';
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 List.Destroy;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
 StatusBar1.SimpleText := '0x' + IntToHex(dword(List.Search(StrToInt(ListBox1.Items.Strings[ListBox1.ItemIndex]))), 7);
end;

end.

