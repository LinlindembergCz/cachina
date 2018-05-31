inherited FormSubGrupoProdutosDetalhes: TFormSubGrupoProdutosDetalhes
  Caption = 'Sub grupo de produtos'
  FormStyle = fsStayOnTop
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited tabPrincipal: TPageControl
      inherited TabSheet1: TTabSheet
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      inherited TabSheet2: TTabSheet
        object Grupo: TLabel
          Left = 8
          Top = 64
          Width = 90
          Height = 13
          Caption = 'Grupo de produtos'
        end
        object Label1: TLabel
          Left = 8
          Top = 40
          Width = 46
          Height = 13
          Caption = 'Descricao'
        end
        object edtDescricao: TEdit
          Tag = 1
          Left = 112
          Top = 32
          Width = 417
          Height = 21
          TabOrder = 0
          OnKeyPress = EditPress
        end
        object cboCodigoGrupo: TComboBox
          Left = 112
          Top = 64
          Width = 417
          Height = 21
          TabOrder = 1
        end
      end
    end
  end
end
