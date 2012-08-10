object Form1: TForm1
  Left = 334
  Top = 98
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
  object ListBox1: TListBox
    Left = 24
    Top = 24
    Width = 193
    Height = 209
    ItemHeight = 13
    TabOrder = 0
  end
  object ButReload: TButton
    Left = 264
    Top = 32
    Width = 75
    Height = 25
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    TabOrder = 1
    OnClick = ButReloadClick
  end
  object ButSort: TButton
    Left = 264
    Top = 80
    Width = 75
    Height = 25
    Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 2
    OnClick = ButSortClick
  end
  object Button1: TButton
    Left = 304
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 288
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 4
    OnClick = Button2Click
  end
end
