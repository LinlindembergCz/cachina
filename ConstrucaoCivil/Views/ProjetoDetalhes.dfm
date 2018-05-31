inherited FormProjetoDetalhes: TFormProjetoDetalhes
  Caption = 'Projetos Habitacionais'
  ClientHeight = 546
  ExplicitWidth = 669
  ExplicitHeight = 584
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 497
    inherited tabPrincipal: TPageControl
      Height = 495
      inherited TabSheet1: TTabSheet
        inherited grdEntidade: TDBGrid
          Height = 307
          Columns = <
            item
              Expanded = False
              FieldName = 'Codigo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Descricao'
              Width = 537
              Visible = True
            end>
        end
        inherited pnlInferior: TPanel
          Top = 445
        end
        object DBMemo1: TDBMemo
          Left = 0
          Top = 356
          Width = 643
          Height = 89
          Align = alBottom
          DataField = 'Descritivo'
          DataSource = srcPesquisa
          ReadOnly = True
          TabOrder = 3
          ExplicitLeft = 256
          ExplicitTop = 312
          ExplicitWidth = 185
        end
      end
      inherited TabSheet2: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 643
        ExplicitHeight = 399
        object Label1: TLabel
          Left = 16
          Top = 32
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
        object Label2: TLabel
          Left = 16
          Top = 93
          Width = 67
          Height = 13
          Caption = 'Observa'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtDescricao: TEdit
          Left = 16
          Top = 51
          Width = 585
          Height = 21
          TabOrder = 0
        end
        object memoDescritivo: TMemo
          Left = 16
          Top = 112
          Width = 585
          Height = 265
          TabOrder = 1
        end
      end
    end
  end
end
