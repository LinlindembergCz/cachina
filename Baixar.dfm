object FormBaixar: TFormBaixar
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Baixar'
  ClientHeight = 138
  ClientWidth = 211
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 21
    Width = 27
    Height = 13
    Caption = 'Data'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 63
    Width = 29
    Height = 13
    Caption = 'Valor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtValorPago: TEdit
    Left = 59
    Top = 55
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '0'
  end
  object dateDataPagamento: TDateTimePicker
    Left = 59
    Top = 15
    Width = 121
    Height = 21
    Date = 41774.373928125000000000
    Time = 41774.373928125000000000
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 32
    Top = 99
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 113
    Top = 99
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
  end
end
