object Form1: TForm1
  Left = 458
  Top = 204
  BorderStyle = bsDialog
  Caption = #1051#1072#1073'.'#1088#1072#1073'. '#8470'8 '#1089#1090'.'#1075#1088'. '#1055#1072#1074#1083#1086#1074#1080#1095#1072' '#1040'.'#1053'.'
  ClientHeight = 341
  ClientWidth = 385
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 39
    Height = 13
    Caption = #1060'.'#1048'.'#1054'.:'
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 48
    Top = 56
    Width = 95
    Height = 13
    Caption = #1058#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088':'
    Layout = tlCenter
  end
  object Bevel1: TBevel
    Left = 40
    Top = 48
    Width = 185
    Height = 105
    Shape = bsFrame
  end
  object Label3: TLabel
    Left = 56
    Top = 88
    Width = 89
    Height = 21
    AutoSize = False
    Caption = #1054#1090#1088#1072#1073#1086#1090#1072#1085'. '#1095#1072#1089#1099':'
    Layout = tlCenter
  end
  object Label4: TLabel
    Left = 104
    Top = 120
    Width = 36
    Height = 21
    AutoSize = False
    Caption = #1058#1072#1088#1080#1092': '
    Layout = tlCenter
  end
  object EFIO: TEdit
    Left = 64
    Top = 16
    Width = 297
    Height = 21
    TabOrder = 0
  end
  object ENum: TEdit
    Left = 144
    Top = 56
    Width = 65
    Height = 21
    TabOrder = 1
    OnKeyPress = ENumKeyPress
  end
  object EHours: TEdit
    Left = 144
    Top = 88
    Width = 65
    Height = 21
    TabOrder = 2
    OnKeyPress = ENumKeyPress
  end
  object ETariff: TEdit
    Left = 144
    Top = 120
    Width = 65
    Height = 21
    AutoSize = False
    TabOrder = 3
    OnKeyPress = ENumKeyPress
  end
  object BAdd: TButton
    Left = 240
    Top = 128
    Width = 75
    Height = 25
    Caption = '&'#1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 4
    OnClick = BAddClick
  end
  object Memo1: TMemo
    Left = 24
    Top = 168
    Width = 337
    Height = 121
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object BCreate: TButton
    Left = 24
    Top = 304
    Width = 105
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' / '#1054#1090#1082#1088#1099#1090#1100
    TabOrder = 6
    OnClick = BCreateClick
  end
  object BSave: TButton
    Left = 136
    Top = 304
    Width = 105
    Height = 25
    Caption = '&'#1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 7
    OnClick = BSaveClick
  end
  object BitBtn1: TBitBtn
    Left = 288
    Top = 304
    Width = 75
    Height = 25
    TabOrder = 8
    OnClick = BitBtn1Click
    Kind = bkClose
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.bd'
    Filter = #1041#1072#1079#1099' '#1076#1072#1085#1085#1099#1093'|*.bd|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Options = [ofHideReadOnly, ofCreatePrompt, ofEnableSizing]
    Left = 352
    Top = 80
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'bd'
    Filter = #1041#1072#1079#1099' '#1076#1072#1085#1085#1099#1093'|*.bd|'#1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083'|*.txt'
    Left = 352
    Top = 48
  end
end
