object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Form1'
  ClientHeight = 290
  ClientWidth = 479
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 479
    Height = 290
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 112
    ExplicitTop = 112
    ExplicitWidth = 185
    ExplicitHeight = 41
    object GroupBox1: TGroupBox
      Left = 16
      Top = 8
      Width = 437
      Height = 201
      TabOrder = 0
      object Label2: TLabel
        Left = 6
        Top = 27
        Width = 40
        Height = 13
        Caption = 'Fam'#237'lia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 6
        Top = 72
        Width = 34
        Height = 13
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 6
        Top = 118
        Width = 54
        Height = 13
        Caption = 'Subgrupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label36: TLabel
        Left = 6
        Top = 162
        Width = 42
        Height = 13
        Caption = 'Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cboFamilia: TComboBox
        Left = 64
        Top = 24
        Width = 364
        Height = 21
        TabOrder = 0
      end
      object cboGrupo: TComboBox
        Left = 64
        Top = 69
        Width = 364
        Height = 21
        TabOrder = 1
      end
      object cboSubGrupo: TComboBox
        Left = 64
        Top = 115
        Width = 364
        Height = 21
        TabOrder = 2
      end
      object cboCodigoProdutoServico: TComboBox
        Left = 64
        Top = 159
        Width = 364
        Height = 21
        TabOrder = 3
      end
    end
  end
end
