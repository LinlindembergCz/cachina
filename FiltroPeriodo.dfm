object FormFiltroPeriodo: TFormFiltroPeriodo
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Per'#237'odo'
  ClientHeight = 108
  ClientWidth = 269
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
    Left = 16
    Top = 16
    Width = 13
    Height = 13
    Caption = 'De'
  end
  object Label2: TLabel
    Left = 135
    Top = 13
    Width = 17
    Height = 13
    Caption = 'At'#233
  end
  object DateTimePicker1: TDateTimePicker
    Left = 16
    Top = 32
    Width = 113
    Height = 21
    Date = 41775.903711851850000000
    Time = 41775.903711851850000000
    TabOrder = 0
  end
  object DateTimePicker2: TDateTimePicker
    Left = 135
    Top = 32
    Width = 113
    Height = 21
    Date = 41775.903711851850000000
    Time = 41775.903711851850000000
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 41
    Top = 72
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 161
    Top = 72
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
  end
end
