inherited FormImovelClassificacaoDetalhes: TFormImovelClassificacaoDetalhes
  Caption = 'Classifica'#231#227'o'
  ExplicitWidth = 669
  ExplicitHeight = 516
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited tabPrincipal: TPageControl
      ActivePage = TabSheet1
      ExplicitWidth = 651
      inherited TabSheet1: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 643
        ExplicitHeight = 399
        inherited grdEntidade: TDBGrid
          Width = 643
          Columns = <
            item
              Expanded = False
              FieldName = 'Codigo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Descricao'
              Width = 530
              Visible = True
            end>
        end
        inherited pnlSuperior: TPanel
          Width = 643
          ExplicitWidth = 643
        end
        inherited pnlInferior: TPanel
          Width = 643
          ExplicitWidth = 643
        end
      end
      inherited TabSheet2: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 643
        ExplicitHeight = 399
        object Label1: TLabel
          Left = 3
          Top = 43
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object edtDescricao: TEdit
          Left = 64
          Top = 40
          Width = 553
          Height = 21
          TabOrder = 0
        end
      end
    end
  end
  inherited Panel2: TPanel
    ExplicitLeft = 8
    ExplicitTop = -5
  end
end
