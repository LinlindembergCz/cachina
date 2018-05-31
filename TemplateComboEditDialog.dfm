object TemplateFormComboboEditDialog: TTemplateFormComboboEditDialog
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Form2'
  ClientHeight = 94
  ClientWidth = 375
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object lbEntidade: TLabel
    Left = 8
    Top = 8
    Width = 87
    Height = 19
    Caption = 'lbEntidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 112
    Top = 55
    Width = 80
    Height = 22
    Caption = 'OK'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 208
    Top = 55
    Width = 80
    Height = 22
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = Button2Click
  end
  object ComboEdit1: TComboBox
    Left = 6
    Top = 28
    Width = 361
    Height = 21
    TabOrder = 2
  end
end
