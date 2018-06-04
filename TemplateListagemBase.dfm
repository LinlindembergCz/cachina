object TemplateFormListagemBase: TTemplateFormListagemBase
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 480
  ClientWidth = 640
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 73
    Align = alTop
    TabOrder = 0
    DesignSize = (
      640
      73)
    object SpeedButton2: TSpeedButton
      Left = 552
      Top = 16
      Width = 80
      Height = 22
      Anchors = [akTop, akRight]
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object btnSelecionar: TSpeedButton
      Left = 552
      Top = 40
      Width = 80
      Height = 22
      Caption = 'Visualizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton2Click
    end
  end
  object Grid1: TDBGrid
    Left = 0
    Top = 73
    Width = 640
    Height = 407
    Align = alClient
    DataSource = srcEntidade
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = Grid1DblClick
    OnTitleClick = Grid1TitleClick
  end
  object srcEntidade: TDataSource
    AutoEdit = False
    Left = 296
    Top = 166
  end
end
