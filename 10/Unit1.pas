unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Unit2, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Image1: TImage;
    ButUp: TButton;
    ButDown: TButton;
    ButRight: TButton;
    ButLeft: TButton;
    ButDec: TButton;
    ButInc: TButton;
    Button1: TButton;
    procedure ButUpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButDownClick(Sender: TObject);
    procedure ButRightClick(Sender: TObject);
    procedure ButLeftClick(Sender: TObject);
    procedure ButDecClick(Sender: TObject);
    procedure ButIncClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
 Soldier: TArms;
 Form1: TForm1;
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 Image1.Picture := nil;
 Soldier := TArms.Create(trunc(Image1.Width / 2), trunc(Image1.Height / 2), 12, Image1, clBlack);
end;

procedure TForm1.ButDownClick(Sender: TObject);
begin
 Soldier.MoveTo(0, 30, 0);
end;

procedure TForm1.ButUpClick(Sender: TObject);
begin
 Soldier.MoveTo(0, -30, 0);
end;

procedure TForm1.ButRightClick(Sender: TObject);
begin
  Soldier.MoveTo(30, 0, 0);
end;

procedure TForm1.ButLeftClick(Sender: TObject);
begin
  Soldier.MoveTo(-30, 0, 0);
end;

procedure TForm1.ButDecClick(Sender: TObject);
begin
  Soldier.MoveTo(0, 0, -3);
end;

procedure TForm1.ButIncClick(Sender: TObject);
begin
  Soldier.MoveTo(0, 0, 3);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 Soldier.Honor;
end;

end.
