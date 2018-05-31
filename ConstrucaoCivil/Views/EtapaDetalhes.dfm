inherited FormEtapaDetalhes: TFormEtapaDetalhes
  Caption = 'Etapa'
  ClientHeight = 467
  ClientWidth = 654
  ExplicitWidth = 670
  ExplicitHeight = 505
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 654
    Height = 418
    ExplicitWidth = 654
    ExplicitHeight = 418
    inherited tabPrincipal: TPageControl
      Width = 652
      Height = 416
      ActivePage = TabSheet1
      ExplicitWidth = 652
      ExplicitHeight = 416
      inherited TabSheet1: TTabSheet
        ExplicitWidth = 644
        ExplicitHeight = 388
        inherited grdEntidade: TDBGrid
          Width = 644
          Height = 301
          Columns = <
            item
              Expanded = False
              FieldName = 'Codificacao'
              Width = 83
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Descricao'
              Title.Caption = 'Descri'#231#227'o'
              Width = 516
              Visible = True
            end>
        end
        inherited pnlSuperior: TPanel
          Width = 644
          ExplicitWidth = 644
        end
        inherited pnlInferior: TPanel
          Top = 366
          Width = 644
          ExplicitTop = 366
          ExplicitWidth = 644
        end
      end
      inherited TabSheet2: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 644
        ExplicitHeight = 388
        object lbDescriacao: TLabel
          Left = 8
          Top = 66
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
          Top = 18
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
          Width = 62
          Height = 13
          Caption = 'BaseDados'
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
          Top = 61
          Width = 426
          Height = 21
          TabOrder = 0
          OnKeyPress = EditPress
        end
        object edtCodificacao: TEdit
          Tag = 1
          Left = 88
          Top = 13
          Width = 100
          Height = 21
          TabOrder = 1
          OnKeyPress = EditPress
        end
        object cboCodigoBaseDados: TComboBox
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
  inherited Panel2: TPanel
    Width = 654
    ExplicitWidth = 654
  end
  inherited srcEntidade: TDataSource
    Left = 96
    Top = 318
  end
  inherited srcPesquisa: TDataSource
    Left = 184
    Top = 318
  end
end
