inherited FormCategoriasDetalhes: TFormCategoriasDetalhes
  Caption = 'Plano de Contas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited tabPrincipal: TPageControl
      inherited TabSheet1: TTabSheet
        inherited grdEntidade: TDBGrid
          Top = 65
          Height = 312
          Align = alClient
          Columns = <
            item
              Expanded = False
              FieldName = 'Codificacao'
              Width = 113
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Descricao'
              Width = 402
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Tipo'
              Width = 79
              Visible = True
            end>
        end
      end
      inherited TabSheet2: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 643
        ExplicitHeight = 399
        object lbDescricao: TLabel
          Left = 17
          Top = 56
          Width = 46
          Height = 13
          Caption = 'Descricao'
        end
        object lbCodificacao: TLabel
          Left = 17
          Top = 21
          Width = 55
          Height = 13
          Caption = 'Codificacao'
        end
        object Label1: TLabel
          Left = 17
          Top = 93
          Width = 20
          Height = 13
          Caption = 'Tipo'
        end
        object edtCodificacao: TEdit
          Left = 80
          Top = 17
          Width = 152
          Height = 21
          TabOrder = 0
        end
        object edtDescricao: TEdit
          Left = 80
          Top = 52
          Width = 504
          Height = 21
          TabOrder = 1
        end
        object cboTipo: TComboBox
          Left = 80
          Top = 88
          Width = 145
          Height = 21
          TabOrder = 2
          Items.Strings = (
            'C'
            'D')
        end
      end
    end
  end
end
