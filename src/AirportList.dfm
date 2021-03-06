object fmAirportList: TfmAirportList
  Left = 732
  Top = 146
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  BorderWidth = 1
  Caption = 'fmAirportList'
  ClientHeight = 383
  ClientWidth = 288
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 0
    Top = 381
    Width = 288
    Height = 2
    Align = alBottom
    Brush.Color = clHighlight
    Pen.Color = clHighlight
  end
  object Shape2: TShape
    Left = 0
    Top = 0
    Width = 288
    Height = 2
    Align = alTop
    Brush.Color = clHighlight
    Pen.Color = clHighlight
  end
  object Shape3: TShape
    Left = 0
    Top = 2
    Width = 2
    Height = 379
    Align = alLeft
    Brush.Color = clHighlight
    Pen.Color = clHighlight
  end
  object Shape4: TShape
    Left = 286
    Top = 2
    Width = 2
    Height = 379
    Align = alRight
    Brush.Color = clHighlight
    Pen.Color = clHighlight
  end
  object Panel1: TPanel
    Left = 2
    Top = 2
    Width = 284
    Height = 379
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 338
      Width = 284
      Height = 41
      Align = alBottom
      TabOrder = 0
      object btOK: TButton
        Left = 9
        Top = 12
        Width = 52
        Height = 21
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 0
        OnClick = btOKClick
      end
      object btCancel: TButton
        Left = 61
        Top = 8
        Width = 52
        Height = 25
        Caption = #1054#1090#1084#1077#1085#1072
        ModalResult = 2
        TabOrder = 1
        OnClick = btCancelClick
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 270
      Width = 284
      Height = 68
      Align = alBottom
      TabOrder = 1
      object Label1: TLabel
        Left = 5
        Top = 3
        Width = 48
        Height = 13
        Caption = #1042#1099#1073#1088#1072#1085#1086':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object mmSelectedAPs: TMemo
        Left = 1
        Top = 18
        Width = 282
        Height = 49
        Align = alBottom
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object CaptionPanel: TPanel
      Left = 0
      Top = 0
      Width = 284
      Height = 27
      Align = alTop
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      TabOrder = 3
    end
    object gpSearch: TGroupBox
      Left = 0
      Top = 27
      Width = 284
      Height = 39
      Align = alTop
      Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1102
      TabOrder = 2
      object mSearch: TMemo
        Left = 2
        Top = 15
        Width = 280
        Height = 22
        Align = alClient
        TabOrder = 0
        OnChange = mSearchChange
      end
    end
  end
  object spAirportList: TADOStoredProc
    CommandTimeout = 60
    ProcedureName = 'dbo.spGOOP_GetGroundHandlingPartitions'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 72
    Top = 152
  end
end
