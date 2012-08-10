object Form1: TForm1
  Left = 480
  Top = 77
  BorderStyle = bsDialog
  Caption = #1051#1072#1073'.'#1088#1072#1073' '#8470'11 '#1089#1090'.'#1075#1088'. '#1055#1072#1074#1083#1086#1074#1080#1095#1072' '#1040'.'#1053'.'
  ClientHeight = 220
  ClientWidth = 211
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    211
    220)
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 211
    Height = 113
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object NEdit: TLabeledEdit
    Left = 16
    Top = 136
    Width = 25
    Height = 21
    Anchors = [akRight, akBottom]
    EditLabel.Width = 9
    EditLabel.Height = 13
    EditLabel.Caption = 'n:'
    TabOrder = 1
    Text = '3'
  end
  object RadioGroup1: TRadioGroup
    Left = 64
    Top = 120
    Width = 137
    Height = 57
    Anchors = [akRight, akBottom]
    Caption = #1060#1091#1085#1082#1094#1080#1103':'
    ItemIndex = 0
    Items.Strings = (
      #1088#1077#1082#1091#1088#1089#1080#1103
      #1080#1090#1077#1088#1072#1094#1080#1103)
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 68
    Top = 184
    Width = 75
    Height = 25
    TabOrder = 3
    OnClick = BitBtn1Click
    Kind = bkOK
  end
end
