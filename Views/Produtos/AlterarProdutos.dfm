object FormAlterarProdutos: TFormAlterarProdutos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Alterar produtos'
  ClientHeight = 251
  ClientWidth = 518
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 518
    Height = 251
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 469
    object GroupBox1: TGroupBox
      Left = 17
      Top = 8
      Width = 480
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
      object SpeedButton2: TSpeedButton
        Left = 434
        Top = 22
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = SpeedButton2Click
      end
      object SpeedButton3: TSpeedButton
        Left = 434
        Top = 69
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = SpeedButton3Click
      end
      object SpeedButton4: TSpeedButton
        Left = 434
        Top = 112
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = SpeedButton4Click
      end
      object cboFamilia: TComboBox
        Left = 64
        Top = 24
        Width = 364
        Height = 21
        TabOrder = 0
        OnChange = cboFamiliaChange
      end
      object cboGrupo: TComboBox
        Left = 64
        Top = 69
        Width = 364
        Height = 21
        Enabled = False
        TabOrder = 1
        OnChange = cboGrupoChange
      end
      object cboSubGrupo: TComboBox
        Left = 64
        Top = 115
        Width = 364
        Height = 21
        Enabled = False
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
    object Button1: TButton
      Left = 293
      Top = 215
      Width = 101
      Height = 25
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 400
      Top = 215
      Width = 97
      Height = 25
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Button2Click
    end
  end
end
