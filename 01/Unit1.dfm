object Form1: TForm1
  Left = 233
  Top = 148
  BorderStyle = bsDialog
  Caption = #1051#1072#1073'. '#1088#1072#1073'. '#8470'1 '#1075#1088'. 152003 '#1055#1072#1074#1083#1086#1074#1080#1095' '#1040'.'#1053'.'
  ClientHeight = 337
  ClientWidth = 320
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    320
    337)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 25
    Width = 111
    Height = 13
    Anchors = []
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' X ='
  end
  object Label2: TLabel
    Left = 8
    Top = 62
    Width = 111
    Height = 13
    Anchors = []
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' Y ='
  end
  object Label3: TLabel
    Left = 8
    Top = 98
    Width = 111
    Height = 13
    Anchors = []
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' Z ='
  end
  object Label4: TLabel
    Left = 69
    Top = 152
    Width = 182
    Height = 13
    Alignment = taCenter
    Anchors = []
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1087#1088#1086#1075#1088#1072#1084#1084#1099':'
  end
  object XEdit: TEdit
    Left = 128
    Top = 24
    Width = 121
    Height = 21
    Anchors = []
    TabOrder = 0
  end
  object YEdit: TEdit
    Left = 128
    Top = 60
    Width = 121
    Height = 21
    Anchors = []
    TabOrder = 1
  end
  object ZEdit: TEdit
    Left = 128
    Top = 96
    Width = 121
    Height = 21
    Anchors = []
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 8
    Top = 166
    Width = 305
    Height = 123
    Anchors = []
    TabOrder = 3
  end
  object Button1: TButton
    Left = 122
    Top = 304
    Width = 75
    Height = 25
    Anchors = [akBottom]
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 4
    OnClick = Button1Click
  end
end
