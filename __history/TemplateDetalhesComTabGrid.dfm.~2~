inherited TemplateFormComTabGridDetalhes: TTemplateFormComTabGridDetalhes
  Caption = 'TemplateFormComTabDetalhes1'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited tabPrincipal: TPageControl
      ExplicitWidth = 725
      inherited TabSheet1: TTabSheet
        Caption = 'Pesquisa'
        OnShow = TabSheet1Show
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 717
        ExplicitHeight = 399
        object grdEntidade: TDBGrid
          Left = 0
          Top = 65
          Width = 717
          Height = 312
          Align = alClient
          DataSource = srcPesquisa
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = grdEntidadeDblClick
          OnTitleClick = grdEntidadeTitleClick
        end
        object pnlSuperior: TPanel
          Left = 0
          Top = 0
          Width = 717
          Height = 65
          Align = alTop
          TabOrder = 1
          object grpPesquisa: TGroupBox
            Left = 3
            Top = 0
            Width = 630
            Height = 57
            Caption = 'Filtro de pesquisa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object edtValorPesquisa: TEdit
              Left = 8
              Top = 19
              Width = 258
              Height = 21
              TabOrder = 0
              OnKeyPress = EditPress
            end
            object btnPesquisar: TButton
              Left = 272
              Top = 18
              Width = 75
              Height = 25
              Caption = 'Pesquisar'
              TabOrder = 1
              OnClick = btnPesquisarClick
            end
          end
        end
        object pnlInferior: TPanel
          Left = 0
          Top = 377
          Width = 717
          Height = 22
          Align = alBottom
          Color = clWhite
          ParentBackground = False
          TabOrder = 2
          object lbregistros: TLabel
            Left = 4
            Top = 4
            Width = 36
            Height = 13
            Caption = 'Linhas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Detalhes'
        ImageIndex = 1
        OnShow = TabSheet2Show
      end
    end
  end
  object srcPesquisa: TDataSource [3]
    AutoEdit = False
    Left = 120
    Top = 238
  end
end
