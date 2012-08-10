unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Unit2;

type
  TForm1 = class(TForm)
    EFIO: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ENum: TEdit;
    Bevel1: TBevel;
    Label3: TLabel;
    EHours: TEdit;
    Label4: TLabel;
    ETariff: TEdit;
    BAdd: TButton;
    Memo1: TMemo;
    BCreate: TButton;
    BSave: TButton;
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure BCreateClick(Sender: TObject);
    procedure BSaveClick(Sender: TObject);
    procedure BAddClick(Sender: TObject);
    procedure ENumKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
implementation

{$R *.dfm}

const
 K = 1 - 0.12;
 WT: word = 144;

var
 Rab: array of TRab;
 Fr: file of TRab;
 Ft: TextFile;
 N: byte;

procedure TForm1.BCreateClick(Sender: TObject);
begin
 if OpenDialog1.Execute then
  if FileExists(OpenDialog1.FileName) then
  begin
   AssignFile(Fr, OpenDialog1.FileName);
   Reset(Fr);
   //кусок кода, вызывающий магию, для отображения содержания файла в текстовое окошечко.
   N := 0;
   Memo1.Clear;
   while N < FileSize(Fr) do
   begin
    SetLength(Rab, Length(Rab) + 1);
    Read(Fr, Rab[High(Rab)]);
    MemoPrint (Rab[High(Rab)], Memo1);
    N := N + 1;
   end;
  end
  else
  begin
   AssignFile(Fr, OpenDialog1.FileName);
   Rewrite(Fr);
  end;
end;

procedure TForm1.BSaveClick(Sender: TObject);
var
 i: byte;
begin
 if Length(Rab) <> 0 then
  if SaveDialog1.Execute then
   case SaveDialog1.FilterIndex of
    1: begin
     AssignFile(Fr, SaveDialog1.FileName);
     Rewrite(Fr);
     for i := 0 to High(Rab) do
      Write(Fr, Rab[i]);
     CloseFile(Fr);
    end;
    2: begin
     AssignFile(Ft, SaveDialog1.FileName);
     Rewrite(Ft);
     for i := 0 to High(Rab) do
      with Rab[i] do
       Writeln(Ft, FIO, ' #', Num:1, ' зарплата: ', All:1);
     CloseFile(Ft);
    end;
  end;
end;

procedure TForm1.BAddClick(Sender: TObject);
begin
try
 SetLength(Rab, Length(Rab) + 1);
 with Rab[High(Rab)] do
 begin
  FIO := EFIO.Text;
  Num := StrToInt(Enum.Text);
  Hours := StrToInt(EHours.Text);
  Tar := StrToInt(ETariff.Text);
  if Hours > WT then
   All := Trunc(K * (Tar * (2 * Hours - WT)))
  else
   All := Trunc(K * (Hours * Tar));
  MemoPrint (Rab[High(Rab)] , Memo1);
 end;
except
 else begin
  ShowMessage('Что-то случилось. Закройте, забейте, забудьте. А лучше подышите воздухом: ведь он такой ванильный!');
 end;
end;
end;

procedure TForm1.ENumKeyPress(Sender: TObject; var Key: Char);
begin
 if not(Key in ['0' .. '9', #8]) then Key := #0;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 CloseFile(Fr);
end;

end.
