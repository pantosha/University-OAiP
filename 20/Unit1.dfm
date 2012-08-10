object Form1: TForm1
  Left = 192
  Top = 124
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
  object Label1: TLabel
    Left = 136
    Top = 104
    Width = 95
    Height = 13
    Caption = #1048#1089#1093#1086#1076#1085#1072#1103' '#1084#1072#1090#1088#1080#1094#1072
  end
  object Label2: TLabel
    Left = 384
    Top = 104
    Width = 83
    Height = 13
    Caption = #1042#1077#1082#1090#1086#1088' '#1089#1090#1086#1083#1077#1094' b'
  end
  object Label3: TLabel
    Left = 504
    Top = 104
    Width = 88
    Height = 13
    Caption = #1042#1077#1082#1090#1086#1088'-'#1089#1090#1086#1083#1073#1077#1094' x'
  end
  object Label4: TLabel
    Left = 616
    Top = 104
    Width = 133
    Height = 13
    Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1099#1077' '#1101#1083#1077#1084#1077#1085#1090#1099
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 128
    Width = 345
    Height = 249
    FixedCols = 0
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 0
    RowHeights = (
      24
      24
      24
      24
      24)
  end
  object StringGrid2: TStringGrid
    Left = 384
    Top = 128
    Width = 89
    Height = 249
    ColCount = 1
    FixedCols = 0
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 1
  end
  object StringGrid3: TStringGrid
    Left = 504
    Top = 128
    Width = 89
    Height = 249
    ColCount = 1
    FixedCols = 0
    FixedRows = 0
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 264
    Top = 400
    Width = 97
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 3
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object LabeledEdit1: TLabeledEdit
    Left = 144
    Top = 32
    Width = 97
    Height = 21
    EditLabel.Width = 53
    EditLabel.Height = 13
    EditLabel.Caption = #1042#1074#1077#1076#1080#1090#1077' N'
    TabOrder = 4
  end
  object BitBtn2: TBitBtn
    Left = 120
    Top = 64
    Width = 137
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1088#1072#1079#1084#1077#1088
    TabOrder = 5
    OnClick = BitBtn2Click
    Kind = bkOK
  end
  object StringGrid4: TStringGrid
    Left = 640
    Top = 128
    Width = 89
    Height = 249
    ColCount = 1
    FixedCols = 0
    FixedRows = 0
    TabOrder = 6
  end
  object BitBtn3: TBitBtn
    Left = 640
    Top = 392
    Width = 81
    Height = 25
    Caption = #1053#1072#1081#1090#1080
    TabOrder = 7
    OnClick = BitBtn3Click
    Kind = bkOK
  end
end
