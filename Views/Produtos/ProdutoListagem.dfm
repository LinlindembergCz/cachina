inherited FormProdutoListagem: TFormProdutoListagem
  BorderStyle = bsDialog
  Caption = 'Produtos'
  ClientHeight = 481
  ClientWidth = 764
  Position = poDesktopCenter
  Visible = False
  ExplicitWidth = 770
  ExplicitHeight = 509
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 764
    Height = 70
    ExplicitWidth = 764
    ExplicitHeight = 70
    inherited SpeedButton2: TSpeedButton
      Left = 673
      Top = 6
      Font.Height = -13
      ExplicitLeft = 673
      ExplicitTop = 6
    end
    inherited btnSelecionar: TSpeedButton
      Left = 320
      Top = 6
      Width = 132
      Caption = 'Incluir na entrada'
      Font.Height = -13
      OnClick = btnSelecionarClick
      ExplicitLeft = 320
      ExplicitTop = 6
      ExplicitWidth = 132
    end
    object lbdescricao: TLabel
      Left = 8
      Top = 44
      Width = 91
      Height = 19
      Caption = 'lbdescricao'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 479
      Top = 6
      Width = 168
      Height = 22
      Anchors = [akTop, akRight]
      Caption = 'Cadastrar novo produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton3: TSpeedButton
      Left = 208
      Top = 6
      Width = 80
      Height = 22
      Anchors = [akTop, akRight]
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton3Click
    end
    object edtdescricao: TEdit
      Left = 8
      Top = 7
      Width = 185
      Height = 21
      TabOrder = 0
    end
  end
  inherited Grid1: TDBGrid
    Top = 70
    Width = 764
    Height = 411
  end
end
