inherited FormCentroCustoDetalhes: TFormCentroCustoDetalhes
  Caption = 'Centro de custo'
  ClientHeight = 523
  ClientWidth = 733
  ExplicitWidth = 749
  ExplicitHeight = 561
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 733
    Height = 474
    ExplicitWidth = 116
    inherited tabPrincipal: TPageControl
      Width = 731
      Height = 472
      ExplicitWidth = 114
      inherited TabSheet1: TTabSheet
        ExplicitWidth = 106
        inherited grdEntidade: TDBGrid
          Width = 723
          Height = 357
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
          Width = 723
          ExplicitWidth = 106
        end
        inherited pnlInferior: TPanel
          Top = 422
          Width = 723
          ExplicitWidth = 106
        end
      end
      inherited TabSheet2: TTabSheet
        ExplicitLeft = 3
        ExplicitTop = 24
        ExplicitWidth = 643
        ExplicitHeight = 399
        object lbDescricao: TLabel
          Left = 17
          Top = 32
          Width = 46
          Height = 13
          Caption = 'Descricao'
        end
        object edtDescricao: TEdit
          Left = 97
          Top = 24
          Width = 472
          Height = 21
          TabOrder = 0
        end
      end
    end
  end
  inherited Panel2: TPanel
    Width = 733
    ExplicitWidth = 116
  end
end
