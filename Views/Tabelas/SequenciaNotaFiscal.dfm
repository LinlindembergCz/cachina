inherited FormSequenciaNotaFiscal: TFormSequenciaNotaFiscal
  Caption = 'FormSequenciaNotaFiscal'
  ClientHeight = 504
  ClientWidth = 757
  ExplicitWidth = 773
  ExplicitHeight = 542
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 757
    Height = 455
    inherited tabPrincipal: TPageControl
      Width = 755
      Height = 453
      inherited TabSheet1: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitHeight = 464
        inherited grdEntidade: TDBGrid
          Width = 747
          Height = 338
          Columns = <
            item
              Expanded = False
              FieldName = 'Sequencia'
              Width = 81
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Especie'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Serie'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Dispositivo'
              Visible = True
            end>
        end
        inherited pnlSuperior: TPanel
          Width = 747
        end
        inherited pnlInferior: TPanel
          Top = 403
          Width = 747
          ExplicitTop = 442
        end
      end
      inherited TabSheet2: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 747
        ExplicitHeight = 425
        object Label2: TLabel
          Left = 19
          Top = 32
          Width = 58
          Height = 13
          Caption = 'Sequencia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 243
          Top = 31
          Width = 42
          Height = 13
          Caption = 'Especie'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 443
          Top = 30
          Width = 28
          Height = 13
          Caption = 'serie'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Sequencia: TEdit
          Left = 83
          Top = 27
          Width = 97
          Height = 21
          TabOrder = 0
        end
        object Serie: TEdit
          Left = 509
          Top = 27
          Width = 97
          Height = 21
          TabOrder = 1
        end
        object Especie: TComboBox
          Left = 304
          Top = 24
          Width = 116
          Height = 21
          TabOrder = 2
          Items.Strings = (
            'NFE'
            'NFC'
            'REB')
        end
      end
    end
  end
  inherited Panel2: TPanel
    Width = 757
  end
end
