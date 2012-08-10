object Form1: TForm1
  Left = 233
  Top = 148
  BorderStyle = bsDialog
  Caption = #1051#1072#1073'. '#1088#1072#1073'. '#8470'2 '#1089#1090'.'#1075#1088'. 152003 '#1055#1072#1074#1083#1086#1074#1080#1095' '#1040'.'#1053'.'
  ClientHeight = 337
  ClientWidth = 320
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    320
    337)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 40
    Width = 16
    Height = 13
    Anchors = []
    Caption = 'X ='
  end
  object Label2: TLabel
    Left = 8
    Top = 86
    Width = 11
    Height = 13
    Anchors = []
    Caption = 'i ='
  end
  object Label4: TLabel
    Left = 8
    Top = 136
    Width = 190
    Height = 13
    Alignment = taCenter
    Anchors = []
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1087#1088#1086#1075#1088#1072#1084#1084#1099':'
    ShowAccelChar = False
  end
  object XEdit: TEdit
    Left = 27
    Top = 38
    Width = 121
    Height = 21
    Anchors = []
    TabOrder = 0
  end
  object iEdit: TEdit
    Left = 27
    Top = 80
    Width = 121
    Height = 21
    Anchors = []
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 8
    Top = 155
    Width = 305
    Height = 123
    Anchors = []
    TabOrder = 2
  end
  object Button1: TButton
    Left = 122
    Top = 304
    Width = 75
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 3
    OnClick = Button1Click
  end
  object CheckBox1: TCheckBox
    Left = 240
    Top = 280
    Width = 73
    Height = 17
    Caption = #1054#1082#1088#1091#1075#1083#1103#1090#1100
    TabOrder = 4
  end
  object RadioGroup1: TRadioGroup
    Left = 192
    Top = 32
    Width = 121
    Height = 73
    Caption = 'f(x) = '
    Items.Strings = (
      'sh(x)'
      'x^2'
      'e^x')
    TabOrder = 5
  end
end
