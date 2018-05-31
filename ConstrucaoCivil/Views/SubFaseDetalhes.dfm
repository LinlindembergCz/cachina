inherited FormSubFaseDetalhes: TFormSubFaseDetalhes
  Caption = 'Servi'#231'os'
  ClientHeight = 678
  ClientWidth = 989
  ExplicitWidth = 1005
  ExplicitHeight = 716
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel [0]
    Left = 3
    Top = 225
    Width = 77
    Height = 13
    Caption = 'Unidade med.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited Panel1: TPanel
    Width = 989
    Height = 629
    ExplicitWidth = 989
    ExplicitHeight = 629
    inherited tabPrincipal: TPageControl
      Width = 987
      Height = 627
      ExplicitWidth = 987
      ExplicitHeight = 627
      inherited TabSheet1: TTabSheet
        ExplicitWidth = 979
        ExplicitHeight = 599
        inherited grdEntidade: TDBGrid
          Width = 979
          Height = 512
          Columns = <
            item
              Expanded = False
              FieldName = 'CodificacaoEtapa'
              Title.Caption = 'Codigo'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescricaoEtapa'
              Title.Caption = 'Etapa'
              Width = 162
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CodificacaoFase'
              Title.Caption = 'Codigo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescricaoFase'
              Title.Caption = 'Fase'
              Width = 149
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Codificacao'
              Title.Caption = 'Codigo'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Descricao'
              Title.Caption = 'Servi'#231'o'
              Width = 273
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Valor'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Predecessora'
              Width = 75
              Visible = True
            end>
        end
        inherited pnlSuperior: TPanel
          Width = 979
          ExplicitWidth = 979
          inherited grpPesquisa: TGroupBox
            object SpeedButton1: TSpeedButton [0]
              Left = 350
              Top = 19
              Width = 23
              Height = 22
              Caption = '+'
              OnClick = SpeedButton1Click
            end
          end
        end
        inherited pnlInferior: TPanel
          Top = 577
          Width = 979
          ExplicitTop = 577
          ExplicitWidth = 979
        end
        object trServico: TTreeView
          Left = 1
          Top = 63
          Width = 975
          Height = 514
          Anchors = [akLeft, akTop, akRight, akBottom]
          Indent = 19
          PopupMenu = PopupMenu1
          RightClickSelect = True
          TabOrder = 3
          OnClick = trServicoClick
          OnDblClick = trServicoDblClick
        end
      end
      inherited TabSheet2: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 979
        ExplicitHeight = 599
        object lbDescriacao: TLabel
          Left = 3
          Top = 74
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
          Left = 3
          Top = 23
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
          Left = 3
          Top = 126
          Width = 26
          Height = 13
          Caption = 'Fase'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 3
          Top = 173
          Width = 29
          Height = 13
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 5
          Top = 223
          Width = 77
          Height = 13
          Caption = 'Unidade med.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 211
          Top = 23
          Width = 77
          Height = 13
          Caption = 'Predecessora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 3
          Top = 265
          Width = 37
          Height = 13
          Caption = 'Status'
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
          Top = 69
          Width = 625
          Height = 21
          TabOrder = 0
          OnKeyPress = EditPress
        end
        object edtCodificacao: TEdit
          Tag = 1
          Left = 88
          Top = 18
          Width = 100
          Height = 21
          TabOrder = 1
          OnKeyPress = EditPress
        end
        object cboCodigoFase: TComboBox
          Left = 88
          Top = 120
          Width = 426
          Height = 21
          DropDownCount = 20
          TabOrder = 2
        end
        object edtValor: TEdit
          Tag = 1
          Left = 88
          Top = 165
          Width = 113
          Height = 21
          TabOrder = 3
          OnKeyPress = EditPress
        end
        object cboUnidadeMedida: TComboBox
          Left = 88
          Top = 220
          Width = 113
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object edtPredecessora: TEdit
          Tag = 1
          Left = 296
          Top = 18
          Width = 100
          Height = 21
          TabOrder = 5
          OnKeyPress = EditPress
        end
        object cboEstatus: TComboBox
          Left = 88
          Top = 262
          Width = 113
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          Items.Strings = (
            'Ativo'
            'Inativo')
        end
      end
    end
  end
  inherited Panel2: TPanel
    Width = 989
    ExplicitWidth = 989
    inherited btnSair: TSpeedButton
      Left = 921
      Top = 2
      ExplicitLeft = 921
      ExplicitTop = 2
    end
  end
  inherited srcEntidade: TDataSource
    Left = 416
    Top = 222
  end
  inherited srcPesquisa: TDataSource
    Left = 128
  end
  object PopupMenu1: TPopupMenu
    Left = 224
    Top = 240
    object NovaEtapa1: TMenuItem
      Caption = 'Nova Etapa'
      OnClick = NovaEtapa1Click
    end
    object NovaFase1: TMenuItem
      Caption = 'Nova Fase'
      OnClick = NovaFase1Click
    end
    object NovoServio1: TMenuItem
      Caption = 'Novo Servi'#231'o'
      OnClick = NovoServio1Click
    end
  end
end
