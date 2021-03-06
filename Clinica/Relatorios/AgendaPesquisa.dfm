object FormAgendamentoPesquisa: TFormAgendamentoPesquisa
  Left = 0
  Top = 0
  Caption = 'Impress'#227'o de guias da Amil'
  ClientHeight = 542
  ClientWidth = 1242
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnCreate = FormCreate
  DesignSize = (
    1242
    542)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 643
    Top = 21
    Width = 8
    Height = 16
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 10
    Top = 8
    Width = 55
    Height = 13
    Caption = 'Especialista'
  end
  object Label3: TLabel
    Left = 393
    Top = 5
    Width = 25
    Height = 13
    Caption = 'In'#237'cio'
  end
  object Label4: TLabel
    Left = 506
    Top = 8
    Width = 45
    Height = 13
    Caption = 'Conv'#234'nio'
  end
  object Label5: TLabel
    Left = 8
    Top = 43
    Width = 41
    Height = 13
    Caption = 'Paciente'
  end
  object Label6: TLabel
    Left = 393
    Top = 43
    Width = 16
    Height = 13
    Caption = 'Fim'
  end
  object Label7: TLabel
    Left = 506
    Top = 43
    Width = 41
    Height = 13
    Caption = 'Situa'#231#227'o'
  end
  object Label8: TLabel
    Left = 204
    Top = 8
    Width = 55
    Height = 13
    Caption = 'Executante'
  end
  object grdEntidade: TDBGrid
    Left = 8
    Top = 85
    Width = 1226
    Height = 446
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = grdEntidadeDrawColumnCell
    OnTitleClick = grdEntidadeTitleClick
    Columns = <
      item
        Color = clSilver
        Expanded = False
        FieldName = 'CodigoAgendamento'
        ReadOnly = True
        Title.Caption = 'Codigo'
        Visible = True
      end
      item
        Color = clSilver
        Expanded = False
        FieldName = 'PSICOLOGO'
        ReadOnly = True
        Title.Caption = 'Respons'#225'vel'
        Width = 122
        Visible = True
      end
      item
        Color = clSilver
        Expanded = False
        FieldName = 'NumeroCarteira'
        ReadOnly = True
        Width = 84
        Visible = True
      end
      item
        Color = clSilver
        Expanded = False
        FieldName = 'PACIENTE'
        ReadOnly = True
        Title.Caption = 'Paciente'
        Width = 167
        Visible = True
      end
      item
        Color = clSilver
        Expanded = False
        FieldName = 'Descricao'
        ReadOnly = True
        Width = 136
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data'
        Width = 77
        Visible = True
      end
      item
        Color = clSilver
        Expanded = False
        FieldName = 'NOMECONVENIO'
        ReadOnly = True
        Title.Caption = 'Conv'#234'nio'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Situacao'
        PickList.Strings = (
          'Agendado'
          'Andamento'
          'Conclu'#237'do'
          'Cancelado'
          'Faturado'
          'Pago')
        Visible = True
      end
      item
        DropDownRows = 18
        Expanded = False
        FieldName = 'LKCodigoCID'
        Title.Caption = 'CID'
        Width = 307
        Visible = True
      end
      item
        Color = clSilver
        Expanded = False
        FieldName = 'Encaminhado'
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATAPAGAMENTO'
        Title.Caption = 'Dt. Pgto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORFATURA'
        Title.Caption = 'Valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HOSPITAL'
        Title.Caption = 'Unidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Hora'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Autorizacao'
        Width = 101
        Visible = True
      end>
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 8
    Top = 23
    Width = 185
    Height = 21
    DropDownRows = 15
    KeyField = 'Codigo'
    ListField = 'Descricao'
    ListSource = DataSource3
    TabOrder = 1
    OnKeyDown = DBLookupComboBox2KeyDown
  end
  object btnPesquisar: TButton
    Left = 643
    Top = 54
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 2
    OnClick = btnPesquisarClick
  end
  object Button2: TButton
    Left = 724
    Top = 54
    Width = 75
    Height = 25
    Caption = 'Imprimir'
    PopupMenu = PopupMenu1
    TabOrder = 3
    OnClick = Button2Click
  end
  object CheckBox1: TCheckBox
    Left = 857
    Top = 62
    Width = 79
    Height = 17
    Caption = 'Selecionado'
    TabOrder = 4
  end
  object CheckBox2: TCheckBox
    Left = 966
    Top = 62
    Width = 65
    Height = 17
    Caption = 'Com CID'
    Checked = True
    State = cbChecked
    TabOrder = 5
    Visible = False
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 504
    Top = 21
    Width = 130
    Height = 21
    KeyField = 'Codigo'
    ListField = 'Descricao'
    ListSource = DataSource4
    TabOrder = 6
    OnCloseUp = DBLookupComboBox2CloseUp
    OnKeyDown = DBLookupComboBox2KeyDown
  end
  object edtNome: TEdit
    Left = 8
    Top = 58
    Width = 379
    Height = 21
    TabOrder = 7
    OnKeyPress = edtNomeKeyPress
  end
  object dataInicio: TDateTimePicker
    Left = 393
    Top = 21
    Width = 97
    Height = 21
    Date = 41725.881213148150000000
    Time = 41725.881213148150000000
    TabOrder = 8
  end
  object dataFim: TDateTimePicker
    Left = 393
    Top = 58
    Width = 97
    Height = 21
    Date = 41725.881213148150000000
    Time = 41725.881213148150000000
    TabOrder = 9
  end
  object cboSituacao: TComboBox
    Left = 504
    Top = 58
    Width = 133
    Height = 21
    TabOrder = 10
    Items.Strings = (
      'Agendado'
      'Andamento'
      'Conclu'#237'do'
      'Cancelado'
      'A Faturar'
      'Faturado'
      'Pago')
  end
  object DBLookupComboBox3: TDBLookupComboBox
    Left = 202
    Top = 22
    Width = 185
    Height = 21
    DropDownRows = 15
    KeyField = 'Codigo'
    ListField = 'Descricao'
    ListSource = DataSource3
    TabOrder = 11
    OnKeyDown = DBLookupComboBox2KeyDown
  end
  object DataSource1: TDataSource
    DataSet = DataModuleConsultaAgenda.ClientDataSet1
    Left = 880
    Top = 248
  end
  object DataSource2: TDataSource
    Left = 192
    Top = 176
  end
  object Especialista: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Descricao'
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 296
    Top = 96
    object EspecialistaCodigo: TIntegerField
      FieldName = 'Codigo'
      Required = True
    end
    object EspecialistaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet2
    Left = 400
    Top = 96
  end
  object SQLDataSet2: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'select * from Especialista'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DSServerModuleBaseDados.LSCONEXAO
    Left = 392
    Top = 168
  end
  object DataSource3: TDataSource
    DataSet = Especialista
    Left = 192
    Top = 96
  end
  object SQLDataSet1: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'select * from Convenio'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DSServerModuleBaseDados.LSCONEXAO
    Left = 184
    Top = 304
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = SQLDataSet1
    Left = 280
    Top = 304
  end
  object Convenio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider2'
    Left = 376
    Top = 304
    object IntegerField1: TIntegerField
      FieldName = 'Codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
  end
  object DataSource4: TDataSource
    DataSet = Convenio
    Left = 456
    Top = 304
  end
  object PopupMenu1: TPopupMenu
    Left = 576
    Top = 208
    object GuiaAmilAnterior1: TMenuItem
      Caption = 'Guia Amil Anterior'
      OnClick = GuiaAmilAnterior1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object GuiaAmil1: TMenuItem
      Caption = 'Guia Amil'
      OnClick = GuiaAmil1Click
    end
    object GuiaAmilPrImpressa1: TMenuItem
      Caption = 'Guia Amil - Pr'#233'-Impressa'
      OnClick = GuiaAmilPrImpressa1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Fichadopaciente1: TMenuItem
      Caption = 'Ficha do paciente'
      OnClick = Fichadopaciente1Click
    end
    object Relao1: TMenuItem
      Caption = 'Rela'#231#227'o de atendimento'
      OnClick = Relao1Click
    end
    object GuiadeConsulta1: TMenuItem
      Caption = 'Guia de Consulta'
      OnClick = GuiadeConsulta1Click
    end
    object Agenda1: TMenuItem
      Caption = 'Agenda'
      OnClick = Agenda1Click
    end
    object Pesquisa1: TMenuItem
      Caption = 'Pesquisa'
      OnClick = Pesquisa1Click
    end
    object RelatorioFaturamento1: TMenuItem
      Caption = 'Relatorio Faturamento'
      OnClick = RelatorioFaturamento1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object RegitrarFatura1: TMenuItem
      Caption = 'Regitrar Fatura'
      OnClick = RegitrarFatura1Click
    end
  end
end
