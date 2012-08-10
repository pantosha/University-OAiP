object Form1: TForm1
  Left = 625
  Top = 163
  Width = 487
  Height = 166
  Caption = #1051#1072#1073'.'#1088#1072#1073'. '#8470'7 '#1089#1090'.'#1075#1088'. '#1055#1072#1074#1083#1086#1074#1080#1095#1072' '#1040'.'#1053'.'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    471
    130)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 209
    Height = 13
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1089#1090#1088#1086#1082#1091' '#1095#1080#1089#1077#1083' '#1080' '#1085#1072#1078#1084#1080#1090#1077' "Enter":'
  end
  object Edit1: TEdit
    Left = 16
    Top = 24
    Width = 440
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object Edit2: TEdit
    Left = 16
    Top = 64
    Width = 440
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
  end
  object Button1: TButton
    Left = 376
    Top = 96
    Width = 75
    Height = 25
    Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
end
