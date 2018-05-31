inherited FormQuantitativoDetalhes: TFormQuantitativoDetalhes
  Caption = 'Quantitativos'
  ClientHeight = 608
  ClientWidth = 1258
  ExplicitWidth = 1274
  ExplicitHeight = 646
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1258
    Height = 559
    ExplicitWidth = 1258
    ExplicitHeight = 559
    inherited tabPrincipal: TPageControl
      Width = 1256
      Height = 557
      Font.Name = ' '
      ParentFont = False
      ExplicitWidth = 1256
      ExplicitHeight = 557
      inherited TabSheet1: TTabSheet
        ExplicitTop = 25
        ExplicitWidth = 1248
        ExplicitHeight = 528
        inherited grdEntidade: TDBGrid
          Width = 1248
          Height = 441
          TitleFont.Name = ' '
          Columns = <
            item
              Expanded = False
              FieldName = 'DescricaoObra'
              Title.Caption = 'Obra'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = ' '
              Title.Font.Style = [fsBold]
              Width = 282
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescricaoProjeto'
              Title.Caption = 'Projeto'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = ' '
              Title.Font.Style = [fsBold]
              Width = 241
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Quantidade'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = ' '
              Title.Font.Style = [fsBold]
              Width = 122
              Visible = True
            end>
        end
        inherited pnlSuperior: TPanel
          Width = 1248
          ExplicitWidth = 1248
          inherited grpPesquisa: TGroupBox
            Top = 2
            ExplicitTop = 2
            inherited edtValorPesquisa: TEdit
              Top = 23
              ExplicitTop = 23
            end
            inherited btnPesquisar: TButton
              Top = 22
              ExplicitTop = 22
            end
          end
        end
        inherited pnlInferior: TPanel
          Top = 506
          Width = 1248
          ExplicitTop = 506
          ExplicitWidth = 1248
        end
      end
      inherited TabSheet2: TTabSheet
        ExplicitTop = 25
        ExplicitWidth = 1248
        ExplicitHeight = 528
        object Label1: TLabel
          Left = 3
          Top = 3
          Width = 27
          Height = 13
          Caption = 'Obra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 241
          Top = 3
          Width = 42
          Height = 13
          Caption = 'Projeto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 648
          Top = 3
          Width = 52
          Height = 13
          Caption = 'Unidades'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object gpbItens: TGroupBox
          Left = 241
          Top = 51
          Width = 1001
          Height = 126
          TabOrder = 5
          object Label4: TLabel
            Left = 11
            Top = 8
            Width = 42
            Height = 13
            Caption = 'Servi'#231'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 12
            Top = 47
            Width = 57
            Height = 13
            Caption = 'Descritivo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btnAdicionar: TSpeedButton
            Left = 853
            Top = 21
            Width = 71
            Height = 25
            Caption = '&Confirmar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = btnAdicionarClick
          end
          object CornerButton1: TSpeedButton
            Left = 925
            Top = 21
            Width = 68
            Height = 25
            Caption = '&Remover'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = CornerButton1Click
          end
          object cboCodigoSubfase: TComboBox
            Left = 11
            Top = 23
            Width = 836
            Height = 22
            TabOrder = 0
          end
          object memoDescritivo: TMemo
            Left = 11
            Top = 66
            Width = 979
            Height = 50
            TabOrder = 1
          end
        end
        object grdItens: TDBGrid
          Left = 241
          Top = 51
          Width = 1001
          Height = 470
          DataSource = srcItens
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = ' '
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'DescricaoFase'
              ReadOnly = True
              Title.Caption = 'Fase'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 332
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescricaoServico'
              ReadOnly = True
              Title.Caption = 'Servi'#231'o'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 433
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Quantidade'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 86
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescricaoUnidadeMedida'
              Title.Caption = 'Unid. Medida'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 105
              Visible = True
            end>
        end
        object cboObra: TComboBox
          Left = 3
          Top = 21
          Width = 232
          Height = 22
          DoubleBuffered = False
          ParentDoubleBuffered = False
          TabOrder = 1
        end
        object cboProjeto: TComboBox
          Left = 241
          Top = 21
          Width = 401
          Height = 22
          TabOrder = 2
        end
        object edtQuantidadeUnidade: TEdit
          Left = 648
          Top = 21
          Width = 57
          Height = 22
          TabOrder = 3
        end
        object trServico: TTreeView
          Left = 3
          Top = 51
          Width = 232
          Height = 470
          Indent = 19
          PopupMenu = PopupMenu1
          RightClickSelect = True
          TabOrder = 4
          OnDblClick = trServicoDblClick
        end
      end
    end
  end
  inherited Panel2: TPanel
    Width = 1258
    ExplicitWidth = 1258
    inherited btnSair: TSpeedButton
      Left = 1144
      Top = 2
      ExplicitLeft = 1144
      ExplicitTop = 2
    end
  end
  inherited srcEntidade: TDataSource
    Top = 390
  end
  inherited srcPesquisa: TDataSource
    Left = 48
    Top = 398
  end
  object srcItens: TDataSource
    Left = 432
    Top = 374
  end
  object PopupMenu1: TPopupMenu
    Left = 144
    Top = 224
    object Adicionartodos1: TMenuItem
      Caption = 'Adicionar todos'
      OnClick = Adicionartodos1Click
    end
  end
end
