object Form1: TForm1
  Left = 938
  Top = 220
  BorderStyle = bsDialog
  Caption = #1051#1072#1073'. '#1088#1072#1073'. '#8470'6 '#1089#1090'.'#1075#1088'. 152003 '#1055#1072#1074#1083#1086#1074#1080#1095#1072' '#1040'.'#1053'.'
  ClientHeight = 422
  ClientWidth = 304
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 22
    Height = 13
    Caption = 'Xn ='
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 22
    Height = 13
    Caption = 'Xk ='
    Layout = tlCenter
  end
  object Label3: TLabel
    Left = 8
    Top = 72
    Width = 18
    Height = 13
    Caption = 'M ='
    Layout = tlCenter
  end
  object Label4: TLabel
    Left = 16
    Top = 104
    Width = 15
    Height = 13
    Caption = 'e ='
    Layout = tlCenter
  end
  object Label5: TLabel
    Left = 8
    Top = 144
    Width = 182
    Height = 13
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1087#1088#1086#1075#1088#1072#1084#1084#1099':'
  end
  object XnEdit: TEdit
    Left = 32
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object XkEdit: TEdit
    Left = 32
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object MEdit: TEdit
    Left = 32
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object eEdit: TEdit
    Left = 32
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object Memo1: TMemo
    Left = 8
    Top = 160
    Width = 289
    Height = 217
    TabOrder = 4
  end
  object RadioGroup1: TRadioGroup
    Left = 160
    Top = 8
    Width = 137
    Height = 113
    Caption = #1060#1091#1085#1082#1094#1080#1103
    ItemIndex = 0
    Items.Strings = (
      'S(x)'
      'Y(x)')
    TabOrder = 5
  end
  object OKButton: TBitBtn
    Left = 56
    Top = 392
    Width = 75
    Height = 25
    TabOrder = 6
    OnClick = OKButtonClick
    Kind = bkOK
  end
  object Close: TBitBtn
    Left = 184
    Top = 392
    Width = 75
    Height = 25
    TabOrder = 7
    Kind = bkClose
  end
end
