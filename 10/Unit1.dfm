object Form1: TForm1
  Left = 299
  Top = 155
  Width = 928
  Height = 480
  Caption = 'Form1'
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
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 912
    Height = 444
    Align = alClient
  end
  object ButUp: TButton
    Left = 736
    Top = 376
    Width = 75
    Height = 25
    Caption = #1042#1074#1077#1088#1093
    TabOrder = 0
    OnClick = ButUpClick
  end
  object ButDown: TButton
    Left = 736
    Top = 408
    Width = 75
    Height = 25
    Caption = #1042#1085#1080#1079
    TabOrder = 1
    OnClick = ButDownClick
  end
  object ButRight: TButton
    Left = 816
    Top = 408
    Width = 75
    Height = 25
    Caption = #1042#1087#1088#1072#1074#1086
    TabOrder = 2
    OnClick = ButRightClick
  end
  object ButLeft: TButton
    Left = 656
    Top = 408
    Width = 75
    Height = 25
    Caption = #1042#1083#1077#1074#1086
    TabOrder = 3
    OnClick = ButLeftClick
  end
  object ButDec: TButton
    Left = 648
    Top = 368
    Width = 75
    Height = 25
    Caption = #1059#1084#1077#1085#1100#1096#1080#1090#1100
    TabOrder = 4
    OnClick = ButDecClick
  end
  object ButInc: TButton
    Left = 824
    Top = 368
    Width = 75
    Height = 25
    Caption = #1059#1074#1077#1083#1080#1095#1080#1090#1100
    TabOrder = 5
    OnClick = ButIncClick
  end
  object Button1: TButton
    Left = 736
    Top = 336
    Width = 75
    Height = 25
    Caption = #1054#1090#1076#1072#1090#1100' '#1095#1077#1089#1090#1100
    TabOrder = 6
    OnClick = Button1Click
  end
end
