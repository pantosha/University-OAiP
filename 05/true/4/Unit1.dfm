object Form1: TForm1
  Left = 616
  Top = 228
  Width = 386
  Height = 260
  Caption = #1051#1072#1073'. '#1088#1072#1073'. '#8470'4 '#1089#1090'.'#1075#1088'. '#1055#1072#1074#1083#1086#1074#1080#1095#1072' '#1040'.'#1053'.'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    370
    224)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 94
    Height = 16
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #1050#1086#1083#1100'-'#1074#1086' '#1089#1090#1088#1086#1082':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 200
    Top = 16
    Width = 112
    Height = 16
    Caption = #1050#1086#1083'-'#1074#1086' '#1089#1090#1086#1083#1073#1094#1086#1074':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object StringGrid1: TStringGrid
    Left = 17
    Top = 48
    Width = 329
    Height = 129
    Anchors = [akLeft, akTop, akRight, akBottom]
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goAlwaysShowEditor]
    TabOrder = 0
  end
  object NEdit: TEdit
    Left = 120
    Top = 16
    Width = 25
    Height = 21
    TabOrder = 1
    Text = '4'
  end
  object MEdit: TEdit
    Left = 320
    Top = 16
    Width = 25
    Height = 21
    TabOrder = 2
    Text = '4'
  end
  object Button1: TButton
    Left = 192
    Top = 192
    Width = 169
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1089#1090#1086#1083#1073#1094#1099' '#1080' '#1089#1090#1088#1086#1082#1080
    TabOrder = 3
    OnClick = FormCreate
  end
  object Button2: TButton
    Left = 8
    Top = 192
    Width = 177
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1055#1086#1076#1089#1095#1080#1090#1072#1090#1100' "'#1054#1089#1086#1073#1099#1077'" '#1101#1083#1077#1084#1077#1085#1090#1099
    TabOrder = 4
    OnClick = Button2Click
  end
end
