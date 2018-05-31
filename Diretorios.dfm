object FormDiretorios: TFormDiretorios
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Selecione a pasta'
  ClientHeight = 363
  ClientWidth = 280
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DirectoryListBox1: TDirectoryListBox
    Left = 8
    Top = 8
    Width = 265
    Height = 321
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 198
    Top = 334
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtn1Click
  end
end
