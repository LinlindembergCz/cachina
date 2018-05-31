inherited FormFaseDetalhes: TFormFaseDetalhes
  Caption = 'Fase'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited tabPrincipal: TPageControl
      ActivePage = TabSheet1
      inherited TabSheet1: TTabSheet
        inherited grdEntidade: TDBGrid
          Columns = <
            item
              Expanded = False
              FieldName = 'Codificacao'
              Width = 81
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Descricao'
              Title.Caption = 'Descri'#231#227'o'
              Width = 518
              Visible = True
            end>
        end
      end
      inherited TabSheet2: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 643
        ExplicitHeight = 399
        object lbDescriacao: TLabel
          Left = 8
          Top = 69
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
        object Label1: TLabel
          Left = 8
          Top = 21
          Width = 64
          Height = 13
          Caption = 'Codifica'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 8
          Top = 118
          Width = 72
          Height = 13
          Caption = 'Classifica'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtDescricao: TEdit
          Tag = 1
          Left = 88
          Top = 64
          Width = 426
          Height = 21
          TabOrder = 0
          OnKeyPress = EditPress
        end
        object edtCodificacao: TEdit
          Tag = 1
          Left = 88
          Top = 16
          Width = 100
          Height = 21
          TabOrder = 1
          OnKeyPress = EditPress
        end
        object cboCodigoEtapa: TComboBox
          Left = 88
          Top = 112
          Width = 426
          Height = 21
          DropDownCount = 20
          TabOrder = 2
        end
      end
    end
  end
  inherited srcEntidade: TDataSource
    Left = 120
    Top = 294
  end
end
