inherited FormGrupoProdutosDetalhes: TFormGrupoProdutosDetalhes
  Caption = 'Grupo de produtos'
  ClientHeight = 518
  ClientWidth = 735
  ExplicitWidth = 751
  ExplicitHeight = 556
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 735
    Height = 469
    ExplicitWidth = 735
    ExplicitHeight = 469
    inherited tabPrincipal: TPageControl
      Width = 733
      Height = 467
      ExplicitWidth = 733
      ExplicitHeight = 467
      inherited TabSheet1: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 725
        ExplicitHeight = 439
        inherited grdEntidade: TDBGrid
          Width = 725
          Height = 352
        end
        inherited pnlSuperior: TPanel
          Width = 725
          ExplicitWidth = 725
        end
        inherited pnlInferior: TPanel
          Top = 417
          Width = 725
          ExplicitTop = 417
          ExplicitWidth = 725
        end
      end
      inherited TabSheet2: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 630
        ExplicitHeight = 399
        object Familia: TLabel
          Left = 8
          Top = 64
          Width = 65
          Height = 13
          Caption = 'CodigoFamilia'
        end
        object Label1: TLabel
          Left = 3
          Top = 35
          Width = 46
          Height = 13
          Caption = 'Descricao'
        end
        object edtDescriacao: TEdit
          Tag = 1
          Left = 88
          Top = 32
          Width = 441
          Height = 21
          TabOrder = 0
          OnKeyPress = EditPress
        end
        object cboCodigoFamilia: TComboBox
          Left = 88
          Top = 64
          Width = 441
          Height = 21
          TabOrder = 1
        end
      end
    end
  end
  inherited Panel2: TPanel
    Width = 735
    ExplicitWidth = 735
  end
end
