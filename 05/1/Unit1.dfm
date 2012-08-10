object Form1: TForm1
  Left = 313
  Top = 276
  Width = 496
  Height = 186
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    480
    150)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 16
    Top = 88
    Width = 63
    Height = 21
    Alignment = taCenter
    AutoSize = False
    Caption = #1057#1076#1074#1080#1075' '#1074#1083#1077#1074#1086
    Layout = tlCenter
  end
  object BtnOk: TBitBtn
    Left = 304
    Top = 117
    Width = 75
    Height = 25
    Anchors = [akBottom]
    TabOrder = 0
    OnClick = BtnOkClick
    Kind = bkOK
  end
  object BtnExit: TBitBtn
    Left = 392
    Top = 117
    Width = 75
    Height = 25
    Anchors = [akBottom]
    TabOrder = 1
    Kind = bkClose
  end
  object StringGrid2: TStringGrid
    Left = 11
    Top = 48
    Width = 458
    Height = 24
    Anchors = [akTop]
    ColCount = 7
    Enabled = False
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowMoving, goColMoving, goEditing, goAlwaysShowEditor]
    ScrollBars = ssNone
    TabOrder = 2
  end
  object StringGrid1: TStringGrid
    Left = 11
    Top = 8
    Width = 458
    Height = 24
    Anchors = [akTop]
    ColCount = 7
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowMoving, goColMoving, goEditing, goAlwaysShowEditor]
    ScrollBars = ssNone
    TabOrder = 3
  end
  object KEdit: TEdit
    Left = 88
    Top = 88
    Width = 121
    Height = 21
    MaxLength = 2
    TabOrder = 4
    Text = '3'
  end
end
