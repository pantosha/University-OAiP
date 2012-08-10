object Form1: TForm1
  Left = 206
  Top = 48
  BorderStyle = bsDialog
  Caption = #1051#1072#1073'.'#1088#1072#1073'.'#8470'17 '#1089#1090'.'#1075#1088'.152003 '#1055#1072#1074#1083#1086#1074#1080#1095#1072' '#1040'.'#1053'.'
  ClientHeight = 146
  ClientWidth = 400
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
  object StringGrid1: TStringGrid
    Left = 8
    Top = 8
    Width = 145
    Height = 129
    ColCount = 2
    DefaultColWidth = 61
    FixedCols = 0
    RowCount = 7
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goAlwaysShowEditor, goThumbTracking]
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object EditInfix: TLabeledEdit
    Left = 160
    Top = 24
    Width = 121
    Height = 21
    EditLabel.Width = 98
    EditLabel.Height = 13
    EditLabel.Caption = #1048#1085#1092#1080#1082#1089#1085#1072#1103' '#1092#1086#1088#1084#1072':'
    TabOrder = 1
    Text = 'a+b*(c-d^a)+e/f'
  end
  object EditPostfix: TLabeledEdit
    Left = 160
    Top = 72
    Width = 121
    Height = 21
    EditLabel.Width = 112
    EditLabel.Height = 13
    EditLabel.Caption = #1055#1086#1089#1090#1092#1080#1082#1089#1085#1072#1103' '#1092#1086#1088#1084#1072': '
    ReadOnly = True
    TabOrder = 2
  end
  object ButToPostfix: TButton
    Left = 288
    Top = 16
    Width = 105
    Height = 25
    Caption = #1042' '#1087#1086#1089#1090#1092#1080#1082#1089#1085#1091#1102
    TabOrder = 3
    OnClick = ButToPostfixClick
  end
  object ButCalc: TButton
    Left = 288
    Top = 64
    Width = 105
    Height = 25
    Caption = #1055#1086#1076#1089#1095#1080#1090#1072#1090#1100
    TabOrder = 4
    OnClick = ButCalcClick
  end
  object EditResult: TLabeledEdit
    Left = 160
    Top = 120
    Width = 121
    Height = 21
    EditLabel.Width = 63
    EditLabel.Height = 13
    EditLabel.Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099':'
    ReadOnly = True
    TabOrder = 5
  end
  object ButClear: TButton
    Left = 288
    Top = 112
    Width = 105
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 6
    OnClick = ButClearClick
  end
end
