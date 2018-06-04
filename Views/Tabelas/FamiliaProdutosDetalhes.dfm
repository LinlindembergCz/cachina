inherited FormFamiliaProdutosDetalhes: TFormFamiliaProdutosDetalhes
  Caption = 'Familia de produtos'
  ClientHeight = 492
  ClientWidth = 732
  ExplicitWidth = 748
  ExplicitHeight = 530
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 732
    Height = 443
    ExplicitHeight = 494
    inherited tabPrincipal: TPageControl
      Width = 730
      Height = 441
      ExplicitHeight = 492
      inherited TabSheet1: TTabSheet
        ExplicitHeight = 464
        inherited grdEntidade: TDBGrid
          Width = 722
          Height = 326
        end
        inherited pnlSuperior: TPanel
          Width = 722
        end
        inherited pnlInferior: TPanel
          Top = 391
          Width = 722
          ExplicitTop = 442
        end
      end
      inherited TabSheet2: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 630
        ExplicitHeight = 399
        object Label1: TLabel
          Left = 8
          Top = 40
          Width = 46
          Height = 13
          Caption = 'Descricao'
        end
        object edtDescricao: TEdit
          Tag = 1
          Left = 88
          Top = 32
          Width = 481
          Height = 21
          TabOrder = 0
          OnKeyPress = EditPress
        end
      end
    end
  end
  inherited Panel2: TPanel
    Width = 732
  end
end
