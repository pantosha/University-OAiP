object Form1: TForm1
  Left = 290
  Top = 178
  BorderStyle = bsDialog
  Caption = #1051#1072#1073'.'#1088#1072#1073'. '#8470'16 '#1089#1090'.'#1075#1088'. '#1055#1072#1074#1083#1086#1074#1080#1095#1072' '#1040'.'#1053'.'
  ClientHeight = 204
  ClientWidth = 224
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabelSearchResult: TLabel
    Left = 8
    Top = 8
    Width = 128
    Height = 13
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1101#1083#1077#1084#1077#1085#1090' '#1089#1090#1077#1082#1072
  end
  object ListBox1: TListBox
    Left = 8
    Top = 24
    Width = 137
    Height = 153
    ItemHeight = 13
    TabOrder = 0
    OnClick = ListBox1Click
  end
  object ButPush: TButton
    Left = 152
    Top = 24
    Width = 65
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = ButPushClick
  end
  object ButPop: TButton
    Left = 152
    Top = 66
    Width = 65
    Height = 25
    Caption = #1055#1088#1086#1095#1080#1090#1072#1090#1100
    TabOrder = 2
    OnClick = ButPopClick
  end
  object ButSort: TButton
    Left = 152
    Top = 109
    Width = 65
    Height = 25
    Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
    TabOrder = 3
    OnClick = ButSortClick
  end
  object ButReload: TButton
    Left = 152
    Top = 152
    Width = 65
    Height = 25
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    TabOrder = 4
    OnClick = ButReloadClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 185
    Width = 224
    Height = 19
    Panels = <>
  end
end
