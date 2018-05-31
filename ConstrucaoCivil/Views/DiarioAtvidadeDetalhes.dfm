inherited FormDiarioAtividadeDetalhes: TFormDiarioAtividadeDetalhes
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Di'#225'rio de Obra'
  ClientHeight = 595
  ClientWidth = 1263
  Position = poDesktopCenter
  WindowState = wsMaximized
  ExplicitWidth = 1279
  ExplicitHeight = 633
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1263
    Height = 546
    ExplicitWidth = 1263
    ExplicitHeight = 546
    inherited tabPrincipal: TPageControl
      Width = 1261
      Height = 544
      ExplicitWidth = 1261
      ExplicitHeight = 544
      inherited TabSheet1: TTabSheet
        ExplicitWidth = 1253
        ExplicitHeight = 516
        inherited grdEntidade: TDBGrid
          Top = 112
          Width = 1253
          Height = 382
          Columns = <
            item
              Expanded = False
              FieldName = 'Codigo'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 98
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Data'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 153
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescricaoObra'
              Title.Caption = 'Obra'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 318
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NomeFuncionario'
              Title.Caption = 'Respons'#225'vel'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 352
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Tempo'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 112
              Visible = True
            end>
        end
        inherited pnlSuperior: TPanel
          Width = 1253
          Height = 112
          ExplicitWidth = 1253
          ExplicitHeight = 112
          inherited grpPesquisa: TGroupBox
            Top = -1
            Width = 1230
            Height = 98
            ExplicitTop = -1
            ExplicitWidth = 1230
            ExplicitHeight = 98
            object Label8: TLabel [0]
              Left = 8
              Top = 15
              Width = 43
              Height = 13
              Caption = 'Per'#237'odo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label12: TLabel [1]
              Left = 120
              Top = 53
              Width = 46
              Height = 13
              Caption = 'Unidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label14: TLabel [2]
              Left = 120
              Top = 14
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
            object Label10: TLabel [3]
              Left = 353
              Top = 54
              Width = 37
              Height = 13
              Caption = 'Equipe'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label16: TLabel [4]
              Left = 353
              Top = 14
              Width = 72
              Height = 13
              Caption = 'Respons'#225'vel'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label15: TLabel [5]
              Left = 944
              Top = 15
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
            object Label13: TLabel [6]
              Left = 493
              Top = 15
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
            object Label6: TLabel [7]
              Left = 495
              Top = 53
              Width = 65
              Height = 13
              Caption = 'Funcion'#225'rio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            inherited edtValorPesquisa: TEdit
              Left = 944
              Top = 30
              Width = 223
              TabOrder = 6
              ExplicitLeft = 944
              ExplicitTop = 30
              ExplicitWidth = 223
            end
            inherited btnPesquisar: TButton
              Left = 944
              Top = 66
              ParentFont = False
              TabOrder = 8
              ExplicitLeft = 944
              ExplicitTop = 66
            end
            object dateInicio: TDateTimePicker
              Left = 8
              Top = 30
              Width = 97
              Height = 22
              Cursor = crIBeam
              Date = 41709.544510381940000000
              Time = 41709.544510381940000000
              TabOrder = 0
            end
            object dateFim: TDateTimePicker
              Left = 10
              Top = 69
              Width = 95
              Height = 22
              Cursor = crIBeam
              Date = 41709.544510474540000000
              Time = 41709.544510474540000000
              TabOrder = 1
            end
            object cboObraPesquisa: TComboBox
              Left = 120
              Top = 30
              Width = 217
              Height = 21
              TabOrder = 2
              OnChange = cboObraPesquisaChange
            end
            object cboUnidadePesquisa: TComboBox
              Left = 120
              Top = 69
              Width = 217
              Height = 21
              DropDownCount = 20
              TabOrder = 3
            end
            object cboEquipePesquisa: TComboBox
              Left = 353
              Top = 69
              Width = 129
              Height = 21
              DropDownCount = 20
              TabOrder = 5
            end
            object cboResponsavelPesquisa: TComboBox
              Left = 353
              Top = 30
              Width = 129
              Height = 21
              TabOrder = 4
            end
            object cboSubfasePesquisa: TComboBox
              Left = 493
              Top = 30
              Width = 436
              Height = 21
              DropDownCount = 20
              Sorted = True
              TabOrder = 7
            end
            object Button1: TButton
              Left = 1025
              Top = 66
              Width = 75
              Height = 25
              Caption = 'Relat'#243'rio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              PopupMenu = PopupMenu1
              TabOrder = 9
            end
            object cboFuncionarioPesquisa: TComboBox
              Left = 493
              Top = 69
              Width = 436
              Height = 21
              DropDownCount = 20
              TabOrder = 10
            end
          end
        end
        inherited pnlInferior: TPanel
          Top = 494
          Width = 1253
          ExplicitTop = 494
          ExplicitWidth = 1253
        end
      end
      inherited TabSheet2: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 1253
        ExplicitHeight = 516
        object gpbItens: TGroupBox
          Left = 253
          Top = 135
          Width = 992
          Height = 87
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label11: TLabel
            Left = 8
            Top = 6
            Width = 37
            Height = 13
            Caption = 'Equipe'
          end
          object btnAdicionar: TSpeedButton
            Left = 840
            Top = 23
            Width = 71
            Height = 25
            Caption = '&Confirmar'
            OnClick = btnAdicionarClick
          end
          object CornerButton1: TSpeedButton
            Left = 917
            Top = 24
            Width = 68
            Height = 25
            Caption = '&Remover'
            OnClick = CornerButton1Click
          end
          object Label1: TLabel
            Left = 245
            Top = 6
            Width = 42
            Height = 13
            Caption = 'Servi'#231'o'
          end
          object Label2: TLabel
            Left = 139
            Top = 5
            Width = 74
            Height = 13
            Caption = 'Unidade Hab.'
          end
          object Label9: TLabel
            Left = 8
            Top = 61
            Width = 67
            Height = 13
            Caption = 'Observa'#231#227'o'
          end
          object cboCodigoEquipe: TComboBox
            Left = 8
            Top = 24
            Width = 121
            Height = 21
            DropDownCount = 20
            TabOrder = 0
          end
          object cboCodigoSubfase: TComboBox
            Left = 245
            Top = 24
            Width = 586
            Height = 21
            DropDownCount = 20
            Sorted = True
            TabOrder = 1
          end
          object cboCodigoUnidadeImovel: TComboBox
            Left = 139
            Top = 24
            Width = 96
            Height = 21
            DropDownCount = 20
            TabOrder = 2
          end
          object edtObservacao: TEdit
            Left = 81
            Top = 56
            Width = 900
            Height = 21
            TabOrder = 3
          end
        end
        object grdItens: TDBGrid
          Left = 247
          Top = 132
          Width = 992
          Height = 372
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataSource = srcItens
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          PopupMenu = PopupMenu2
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = grdItensCellClick
          Columns = <
            item
              Expanded = False
              FieldName = 'Codigo'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Color = clSilver
              Expanded = False
              FieldName = 'DescricaoUnidade'
              ReadOnly = True
              Title.Caption = 'Unidade'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 53
              Visible = True
            end
            item
              Color = clSilver
              Expanded = False
              FieldName = 'DescricaoEquipe'
              ReadOnly = True
              Title.Caption = 'Equipe'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 66
              Visible = True
            end
            item
              Color = clSilver
              Expanded = False
              FieldName = 'DescricaoFase'
              ReadOnly = True
              Title.Caption = 'Fase'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 208
              Visible = True
            end
            item
              Color = clSilver
              Expanded = False
              FieldName = 'DescricaoServico'
              ReadOnly = True
              Title.Caption = 'Servi'#231'o'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 283
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Apontamento'
              Title.Caption = '%'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 37
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HoraInicio'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HoraFim'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Status'
              PickList.Strings = (
                'Aprovado'
                'Reprovado')
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Observacao'
              Title.Caption = 'Observa'#231#227'o'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 220
              Visible = True
            end>
        end
        object GroupBox1: TGroupBox
          Left = 416
          Top = 3
          Width = 829
          Height = 123
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Observa'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          DesignSize = (
            829
            123)
          object memoObservacao: TMemo
            Left = 8
            Top = 17
            Width = 813
            Height = 98
            Anchors = [akLeft, akTop, akRight]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
        object GroupBox2: TGroupBox
          Left = 4
          Top = 127
          Width = 237
          Height = 378
          Anchors = [akLeft, akTop, akBottom]
          Caption = 'Estrutura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          DesignSize = (
            237
            378)
          object trServico: TTreeView
            Left = 8
            Top = 17
            Width = 222
            Height = 352
            Anchors = [akLeft, akTop, akBottom]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Indent = 19
            ParentFont = False
            RightClickSelect = True
            TabOrder = 0
            OnDblClick = trServicoDblClick
          end
        end
        object GroupBox3: TGroupBox
          Left = 4
          Top = 0
          Width = 406
          Height = 126
          Caption = 'Informa'#231#245'es'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          object Label3: TLabel
            Left = 10
            Top = 22
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
          object Label4: TLabel
            Left = 10
            Top = 51
            Width = 27
            Height = 13
            Caption = 'Data'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 10
            Top = 80
            Width = 39
            Height = 13
            Caption = 'Tempo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 10
            Top = 105
            Width = 72
            Height = 13
            Caption = 'Respons'#225'vel'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object cboCodigoObra: TComboBox
            Left = 86
            Top = 16
            Width = 294
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = cboCodigoObraChange
          end
          object dateData: TDateTimePicker
            Left = 86
            Top = 43
            Width = 123
            Height = 21
            Date = 41843.954420115740000000
            Time = 41843.954420115740000000
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object cboTempo: TComboBox
            Left = 86
            Top = 71
            Width = 123
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Items.Strings = (
              'Bom'
              'Ruim'
              'Inst'#225'vel')
          end
          object cboCodigoFuncionario: TComboBox
            Left = 86
            Top = 98
            Width = 294
            Height = 21
            DropDownCount = 20
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
        end
      end
    end
  end
  inherited Panel2: TPanel
    Width = 1263
    ExplicitWidth = 1263
    inherited btnAlterar: TSpeedButton
      Left = 95
      Top = 1
      ExplicitLeft = 95
      ExplicitTop = 1
    end
    inherited btnSair: TSpeedButton
      Left = 1187
      Top = 2
      Anchors = [akLeft, akTop, akRight]
      ExplicitLeft = 1187
      ExplicitTop = 2
    end
  end
  inherited srcEntidade: TDataSource
    Left = 56
    Top = 478
  end
  inherited srcPesquisa: TDataSource
    Left = 56
    Top = 382
  end
  object srcItens: TDataSource
    AutoEdit = False
    Left = 56
    Top = 430
  end
  object PopupMenu1: TPopupMenu
    Left = 872
    Top = 256
    object DiariodeObra1: TMenuItem
      Caption = 'Diario de Obra'
      OnClick = DiariodeObra1Click
    end
    object Produo2: TMenuItem
      Caption = 'Produ'#231#227'o 100%'
      object ProduoResumido1: TMenuItem
        Caption = 'Resumido'
        OnClick = ProduoResumido1Click
      end
      object Produo1: TMenuItem
        Caption = 'Detalhado'
        OnClick = Produo1Click
      end
      object Equipe1: TMenuItem
        Caption = 'Equipe'
      end
    end
    object ProduoAcumulada1: TMenuItem
      Caption = 'Produ'#231#227'o Acumulada'
      object Aprovado1: TMenuItem
        Caption = 'Aprovado'
        object Resumido1: TMenuItem
          Tag = 1
          Caption = 'Resumido'
          OnClick = Resumido1Click
        end
        object Detalhadao1: TMenuItem
          Tag = 1
          Caption = 'Detalhado'
          OnClick = Detalhadao1Click
        end
        object Equipe2: TMenuItem
          Tag = 1
          Caption = 'Por Equipe'
          OnClick = Equipe2Click
        end
      end
      object Indiferente1: TMenuItem
        Caption = 'Indiferente'
        object Resumido2: TMenuItem
          Caption = 'Resumido'
          OnClick = Resumido1Click
        end
        object Detalhado1: TMenuItem
          Caption = 'Detalhado'
          OnClick = Detalhadao1Click
        end
        object Equipe3: TMenuItem
          Caption = 'Por Equipe'
          OnClick = Equipe2Click
        end
      end
      object Reprovado1: TMenuItem
        Caption = 'Reprovado'
        object Resumido3: TMenuItem
          Tag = 2
          Caption = 'Resumido'
          OnClick = Resumido1Click
        end
        object Detalhado2: TMenuItem
          Tag = 2
          Caption = 'Detalhado'
          OnClick = Detalhadao1Click
        end
        object porEquipe1: TMenuItem
          Tag = 2
          Caption = 'Por Equipe'
          OnClick = Equipe2Click
        end
      end
    end
    object ResumoEstatstico1: TMenuItem
      Caption = 'Resumo Estat'#237'stico'
      OnClick = ResumoEstatstico1Click
    end
    object Acompanhamento1: TMenuItem
      Caption = 'Acompanhamento'
      OnClick = Acompanhamento1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 768
    Top = 344
    object Aprovartodasasatividaderelat1: TMenuItem
      Caption = 'Aprovar todo o hist'#243'rico da atividade'
      OnClick = Aprovartodasasatividaderelat1Click
    end
  end
end
