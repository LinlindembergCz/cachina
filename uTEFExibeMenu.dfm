object frmTEFExibeMenu: TfrmTEFExibeMenu
  Left = 506
  Top = 178
  Caption = 'TEF'
  ClientHeight = 360
  ClientWidth = 509
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 24
  object Splitter1: TSplitter
    Left = 237
    Top = 50
    Width = 5
    Height = 260
    Align = alRight
    Visible = False
    ExplicitHeight = 261
  end
  object ListBox1: TListBox
    Left = 0
    Top = 50
    Width = 237
    Height = 260
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 24
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 509
    Height = 50
    Align = alTop
    Caption = 'Panel1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 310
    Width = 509
    Height = 50
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      509
      50)
    object BitBtn1: TBitBtn
      Left = 150
      Top = 6
      Width = 70
      Height = 35
      Anchors = [akTop]
      Caption = '&OK'
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 259
      Top = 6
      Width = 110
      Height = 35
      Anchors = [akTop]
      Caption = 'Cancelar'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object Memo1: TMemo
    Left = 242
    Top = 50
    Width = 267
    Height = 260
    Align = alRight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 3
    Visible = False
    WordWrap = False
  end
end
