inherited FormTabelaNFSeDetalhes: TFormTabelaNFSeDetalhes
  Caption = 'Tabela de Servi'#231'os NFSe '
  ClientHeight = 525
  ClientWidth = 731
  ExplicitWidth = 747
  ExplicitHeight = 563
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 731
    Height = 476
    inherited tabPrincipal: TPageControl
      Width = 729
      Height = 474
      inherited TabSheet1: TTabSheet
        inherited grdEntidade: TDBGrid
          Width = 721
          Height = 359
        end
        inherited pnlSuperior: TPanel
          Width = 721
        end
        inherited pnlInferior: TPanel
          Top = 424
          Width = 721
        end
      end
      inherited TabSheet2: TTabSheet
        ExplicitLeft = 3
        ExplicitTop = 24
        ExplicitWidth = 643
        ExplicitHeight = 399
        object Label1: TLabel
          Left = 16
          Top = 13
          Width = 83
          Height = 13
          Caption = 'C'#243'digo Servi'#231'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 16
          Top = 61
          Width = 55
          Height = 13
          Caption = 'Descri'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtCodigoNCM: TEdit
          Left = 16
          Top = 34
          Width = 148
          Height = 21
          TabOrder = 0
        end
        object memoDescricao: TMemo
          Left = 16
          Top = 80
          Width = 577
          Height = 89
          TabOrder = 1
        end
      end
    end
  end
  inherited Panel2: TPanel
    Width = 731
  end
end
