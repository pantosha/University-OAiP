object Form1: TForm1
  Left = 427
  Top = 114
  Width = 436
  Height = 378
  Caption = #1051#1072#1073'.'#1088#1072#1073'. '#8470'13 '#1089#1090'.'#1075#1088'.'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 14
    Top = 136
    Width = 393
    Height = 169
    TabOrder = 0
  end
  object EditDate: TLabeledEdit
    Left = 14
    Top = 16
    Width = 121
    Height = 21
    EditLabel.Width = 32
    EditLabel.Height = 13
    EditLabel.Caption = #1044#1072#1090#1072': '
    TabOrder = 1
  end
  object EditNameCity: TLabeledEdit
    Left = 150
    Top = 16
    Width = 121
    Height = 21
    EditLabel.Width = 91
    EditLabel.Height = 13
    EditLabel.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1075#1086#1088#1086#1076#1072':'
    TabOrder = 2
  end
  object EditCode: TLabeledEdit
    Left = 286
    Top = 16
    Width = 121
    Height = 21
    EditLabel.Width = 60
    EditLabel.Height = 13
    EditLabel.Caption = #1050#1086#1076' '#1075#1086#1088#1086#1076#1072':'
    TabOrder = 3
  end
  object EditNumber: TLabeledEdit
    Left = 14
    Top = 56
    Width = 121
    Height = 21
    EditLabel.Width = 89
    EditLabel.Height = 13
    EditLabel.Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072':'
    TabOrder = 4
  end
  object EditTime: TLabeledEdit
    Left = 150
    Top = 56
    Width = 121
    Height = 21
    EditLabel.Width = 36
    EditLabel.Height = 13
    EditLabel.Caption = #1042#1088#1077#1084#1103':'
    TabOrder = 5
  end
  object EditPrice: TLabeledEdit
    Left = 286
    Top = 56
    Width = 121
    Height = 21
    EditLabel.Width = 36
    EditLabel.Height = 13
    EditLabel.Caption = #1058#1072#1088#1080#1092':'
    TabOrder = 6
  end
  object BtnAdd: TBitBtn
    Left = 20
    Top = 88
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 7
    OnClick = BtnAddClick
  end
  object BtnDel: TBitBtn
    Left = 116
    Top = 88
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 8
    OnClick = BtnDelClick
  end
  object BtnSort: TBitBtn
    Left = 232
    Top = 312
    Width = 75
    Height = 25
    Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 9
    OnClick = BtnSortClick
  end
  object BtnSearch: TBitBtn
    Left = 328
    Top = 312
    Width = 75
    Height = 25
    Caption = #1048#1089#1082#1072#1090#1100
    TabOrder = 10
    OnClick = BtnSearchClick
  end
  object RadioGroupSearch: TRadioGroup
    Left = 328
    Top = 80
    Width = 81
    Height = 49
    Caption = #1055#1086#1080#1089#1082': '
    ItemIndex = 0
    Items.Strings = (
      #1051#1080#1085#1077#1081#1085#1099#1081
      #1041#1080#1085#1072#1088#1085#1099#1081)
    TabOrder = 11
  end
  object RadioGroupSort: TRadioGroup
    Left = 216
    Top = 80
    Width = 81
    Height = 49
    Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072': '
    ItemIndex = 0
    Items.Strings = (
      'C'#1083#1080#1103#1085#1080#1077
      'QuickSort')
    TabOrder = 12
  end
  object BtnOpenCreate: TBitBtn
    Left = 16
    Top = 312
    Width = 105
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' / '#1054#1090#1082#1088#1099#1090#1100
    TabOrder = 13
    OnClick = BtnOpenCreateClick
  end
  object BtnSave: TBitBtn
    Left = 136
    Top = 312
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 14
    OnClick = BtnSaveClick
  end
  object OpenDialog1: TOpenDialog
    Left = 56
    Top = 168
  end
  object SaveDialog1: TSaveDialog
    Left = 24
    Top = 168
  end
end
