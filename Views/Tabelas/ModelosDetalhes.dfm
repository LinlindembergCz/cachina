inherited FormModelosDetalhes: TFormModelosDetalhes
  Caption = 'Modelos de produtos'
  ClientWidth = 642
  FormStyle = fsStayOnTop
  ExplicitWidth = 658
  ExplicitHeight = 516
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 642
    ExplicitWidth = 642
    inherited tabPrincipal: TPageControl
      Width = 640
      ActivePage = TabSheet1
      ExplicitWidth = 640
      inherited TabSheet1: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 632
        ExplicitHeight = 399
        inherited grdEntidade: TDBGrid
          Width = 632
        end
        inherited pnlSuperior: TPanel
          Width = 632
          ExplicitWidth = 632
        end
        inherited pnlInferior: TPanel
          Width = 632
          ExplicitWidth = 632
        end
      end
      inherited TabSheet2: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 632
        ExplicitHeight = 399
        object lbDescriacao: TLabel
          Left = 8
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
        object edtDescricao: TEdit
          Tag = 1
          Left = 88
          Top = 29
          Width = 481
          Height = 21
          TabOrder = 0
          OnKeyPress = EditPress
        end
        object cboMarca: TComboBox
          Left = 88
          Top = 64
          Width = 145
          Height = 21
          TabOrder = 1
          Text = 'cboMarca'
        end
      end
    end
  end
  inherited Panel2: TPanel
    Width = 642
    ExplicitWidth = 642
  end
end
