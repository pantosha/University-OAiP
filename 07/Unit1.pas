unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
uses Unit2;
var
 a: array [0 .. 14] of char = ' 01 23 45 67 89';

procedure TForm1.Button1Click(Sender: TObject);
begin
 RandomFill(a, Random(40), Edit1);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 RandomFill(a, Random(40), Edit1);
end;
//Давайте будем честными. Это всего лишь учебная программа, она может и даже должна содержать ошибки.

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
 StrToArr (Edit1.Text, Edit2);
end;

end.
