unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Unit2;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Memo1: TMemo;
    EditNameCity: TLabeledEdit;
    EditCode: TLabeledEdit;
    EditNumber: TLabeledEdit;
    EditTime: TLabeledEdit;
    EditPrice: TLabeledEdit;
    BtnAdd: TBitBtn;
    BtnDel: TBitBtn;
    BtnSort: TBitBtn;
    BtnSearch: TBitBtn;
    RadioGroupSearch: TRadioGroup;
    RadioGroupSort: TRadioGroup;
    BtnOpenCreate: TBitBtn;
    BtnSave: TBitBtn;
    EditDate: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure BtnOpenCreateClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnSortClick(Sender: TObject);
    procedure BtnSearchClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
var
 Base: TAllMake;
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 Base := TAllMake.Create(Memo1);
end;

procedure TForm1.BtnOpenCreateClick(Sender: TObject);
begin
 Base.OpenCreate(OpenDialog1);
end;

procedure TForm1.BtnAddClick(Sender: TObject);
begin
 Base.Add(EditDate, EditNameCity, EditTime, EditPrice, EditNumber, EditCode);
end;

procedure TForm1.BtnSaveClick(Sender: TObject);
begin
 Base.Save(SaveDialog1);
end;

procedure TForm1.BtnSortClick(Sender: TObject);
begin
 case RadioGroupSort.ItemIndex of
  0: begin Base.MergeSort; Base.PrintMemo; end;
  1: begin Base.QuickSort; Base.PrintMemo; end;
 end;
end;

procedure TForm1.BtnSearchClick(Sender: TObject);
begin
try
 case RadioGroupSearch.ItemIndex of
  0: Base.PrintMemo(Base.LineSearch(EditNameCity.Text));
  1: Base.PrintMemo(Base.BinarySearch(StrToInt(EditTime.Text)));
 end;
except
else begin
  ShowMessage('Это не Высоцкий! Укол в шею не поможет!');
  Exit;
end;
end;
end;

procedure TForm1.BtnDelClick(Sender: TObject);
begin
 Base.Remove(StrToInt(EditTime.Text));
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
 Base.Free;
end;

end.
