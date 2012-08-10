unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Math;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    XEdit: TEdit;
    YEdit: TEdit;
    ZEdit: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    Label4: TLabel;
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
	x,y,z,a:extended;
begin
	Memo1.Clear;
	Memo1.Lines.Add('Исходные данные:');
	
	x:=StrToFloat(XEdit.Text);
	Memo1.Lines.Add(' X = '+FloatToStrF(x,fffixed,8,4));
	
	y:=StrToFloat(YEdit.Text);
	Memo1.Lines.Add(' Y = '+FloatToStrF(y,fffixed,8,4));
	
	z:=StrToFloat(ZEdit.Text);
	Memo1.Lines.Add(' Z = '+FloatToStrF(z,fffixed,8,4));

	a:=LogN( Exp(1) ,power(y,-sqrt(abs(x))))*(x-y/2)+sqr(sin(arctan(z)));

	Memo1.Lines.Add('Результат a = '+ FloatToStrF(a,fffixed,8,4));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
	Memo1.Clear;
	Xedit.Text:='-15,246';
	Yedit.Text:='4,642e-2';
	Zedit.Text:='20,001e2';
end;

end.