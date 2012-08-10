object Form1: TForm1
  Left = 468
  Top = 181
  BorderStyle = bsDialog
  Caption = #1051#1072#1073'.'#1088#1072#1073'. '#8470'12 '#1089#1090'.'#1075#1088'. 152003 '#1055#1072#1074#1083#1086#1074#1080#1095#1072' '#1040'.'#1053'.'
  ClientHeight = 324
  ClientWidth = 404
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
  object RadioGroup1: TRadioGroup
    Left = 208
    Top = 168
    Width = 185
    Height = 105
    Caption = #1052#1077#1090#1086#1076' '#1074#1099#1073#1086#1088#1072': '
    ItemIndex = 0
    Items.Strings = (
      #1074#1077#1090#1074#1077#1081' '#1080' '#1075#1088#1072#1085#1080#1094
      #1087#1086#1083#1085#1099#1081' '#1087#1077#1088#1077#1073#1086#1088
      #1084#1072#1082#1089'. '#1089#1090#1086#1080#1084#1086#1089#1090#1100
      #1084#1080#1085'. '#1084#1072#1089#1089#1072
      #1089#1073#1072#1083#1072#1085#1089#1080#1088'. '#1089#1090#1086#1080#1084'.'
      #1088#1091#1089#1089#1082#1072#1103' '#1088#1091#1083#1077#1090#1082#1072)
    TabOrder = 0
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 0
    Width = 200
    Height = 324
    Align = alLeft
    ColCount = 3
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goAlwaysShowEditor, goThumbTracking]
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 208
    Top = 8
    Width = 185
    Height = 89
    TabOrder = 2
  end
  object RunBut: TButton
    Left = 208
    Top = 288
    Width = 75
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 3
    OnClick = RunButClick
  end
  object ReloadBut: TButton
    Left = 312
    Top = 288
    Width = 75
    Height = 25
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    TabOrder = 4
    OnClick = ReloadButClick
  end
  object WEdit: TLabeledEdit
    Left = 208
    Top = 128
    Width = 89
    Height = 21
    EditLabel.Width = 71
    EditLabel.Height = 13
    EditLabel.Caption = #1052#1072#1082#1089'. '#1084#1072#1089#1089#1072': '
    MaxLength = 2
    TabOrder = 5
    Text = '30'
  end
  object NEdit: TLabeledEdit
    Left = 304
    Top = 128
    Width = 89
    Height = 21
    EditLabel.Width = 72
    EditLabel.Height = 13
    EditLabel.Caption = #1050#1086#1083'-'#1074#1086' '#1101#1083#1077#1084'.: '
    MaxLength = 2
    TabOrder = 6
    Text = '5'
  end
end
