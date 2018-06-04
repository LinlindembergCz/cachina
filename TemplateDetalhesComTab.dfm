inherited TemplateFormComTabDetalhes: TTemplateFormComTabDetalhes
  Caption = 'TemplateFormBaseDetalhes1'
  ClientHeight = 499
  ClientWidth = 727
  ExplicitWidth = 743
  ExplicitHeight = 537
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 727
    Height = 450
    ExplicitWidth = 727
    ExplicitHeight = 450
    object tabPrincipal: TPageControl
      Left = 1
      Top = 1
      Width = 725
      Height = 448
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'TabSheet1'
      end
    end
  end
  inherited Panel2: TPanel
    Width = 727
    ExplicitWidth = 727
    inherited btnConfirmar: TSpeedButton
      Left = 439
      Top = 2
      ExplicitLeft = 439
      ExplicitTop = 2
    end
    inherited btnSair: TSpeedButton
      Left = 659
      Top = 2
      ExplicitLeft = 659
      ExplicitTop = 2
    end
    object btnRelatorio: TSpeedButton
      Left = 549
      Top = 2
      Width = 104
      Height = 42
      Caption = 'Relatorio F6'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      PopupMenu = PopupRelatorio
      OnClick = btnRelatorioClick
    end
  end
  object PopupRelatorio: TPopupMenu
    Left = 221
    Top = 170
  end
end
