object Form1: TForm1
  Left = 666
  Top = 191
  Width = 640
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    624
    444)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 152
    Top = 0
    Width = 472
    Height = 444
    ActivePage = TabSheet2
    Align = alRight
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'TImage'
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 464
        Height = 416
        Align = alClient
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TChart'
      ImageIndex = 1
      object Chart1: TChart
        Left = 0
        Top = 0
        Width = 464
        Height = 416
        AllowPanning = pmNone
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          '(1 + 2 *x^2) * e^(x^2)')
        View3D = False
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Series1: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series2: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
    end
  end
  object XnEdit: TLabeledEdit
    Left = 16
    Top = 56
    Width = 121
    Height = 21
    EditLabel.Width = 22
    EditLabel.Height = 13
    EditLabel.Caption = 'X_n:'
    TabOrder = 1
    Text = '0,1'
    OnKeyPress = XnEditKeyPress
  end
  object XkEdit: TLabeledEdit
    Left = 16
    Top = 96
    Width = 121
    Height = 21
    EditLabel.Width = 22
    EditLabel.Height = 13
    EditLabel.Caption = 'X_k:'
    TabOrder = 2
    Text = '0,7'
    OnKeyPress = XnEditKeyPress
  end
  object CpBufBut: TButton
    Left = 8
    Top = 392
    Width = 137
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1073#1091#1092#1077#1088
    TabOrder = 3
    OnClick = CpBufButClick
  end
  object MEdit: TLabeledEdit
    Left = 16
    Top = 136
    Width = 121
    Height = 21
    EditLabel.Width = 12
    EditLabel.Height = 13
    EditLabel.Caption = 'M:'
    TabOrder = 4
    Text = '600'
    OnKeyPress = MEditKeyPress
  end
  object GraphSolveBut: TButton
    Left = 8
    Top = 360
    Width = 137
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100
    TabOrder = 5
    OnClick = GraphSolveButClick
  end
end
