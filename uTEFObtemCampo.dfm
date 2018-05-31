object frmTEFObtemCampo: TfrmTEFObtemCampo
  Left = 365
  Top = 160
  BorderStyle = bsDialog
  Caption = 'TEF'
  ClientHeight = 212
  ClientWidth = 519
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnShow = FormShow
  DesignSize = (
    519
    212)
  PixelsPerInch = 96
  TextHeight = 24
  object Edit1: TEdit
    Left = 32
    Top = 99
    Width = 437
    Height = 32
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    ExplicitWidth = 427
  end
  object BitBtn1: TBitBtn
    Left = 150
    Top = 137
    Width = 119
    Height = 35
    Anchors = [akTop]
    Caption = '&OK'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
    ExplicitLeft = 146
  end
  object BitBtn2: TBitBtn
    Left = 309
    Top = 137
    Width = 117
    Height = 35
    Anchors = [akTop]
    Caption = 'Cancelar'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
    ExplicitLeft = 302
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 519
    Height = 50
    Align = alTop
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    ExplicitWidth = 509
  end
end
