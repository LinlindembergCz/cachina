inherited FormEntradaDetalhes: TFormEntradaDetalhes
  Caption = 'Entrada'
  ClientHeight = 619
  ClientWidth = 978
  ExplicitWidth = 994
  ExplicitHeight = 657
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 978
    Height = 570
    ExplicitWidth = 978
    ExplicitHeight = 570
    object lbData: TLabel
      Left = 67
      Top = 12
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
    object lbCodigoFornecedor: TLabel
      Left = 175
      Top = 12
      Width = 64
      Height = 13
      Caption = 'Fornecedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbNumeroDocumento: TLabel
      Left = 606
      Top = 10
      Width = 81
      Height = 13
      Caption = 'N'#186' Documento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbValorFrete: TLabel
      Left = 92
      Top = 55
      Width = 30
      Height = 13
      Caption = 'Frete'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbTipoFrete: TLabel
      Left = 726
      Top = 12
      Width = 74
      Height = 13
      Caption = 'Tipo de Frete'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDataEmissao: TLabel
      Left = 871
      Top = 12
      Width = 93
      Height = 13
      Caption = 'Data de Emiss'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbValorDocumento: TLabel
      Left = 175
      Top = 55
      Width = 114
      Height = 13
      Caption = 'Valor do Documento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbValorDesconto: TLabel
      Left = 6
      Top = 55
      Width = 53
      Height = 13
      Caption = 'Desconto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 6
      Top = 11
      Width = 38
      Height = 13
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnImportar: TSpeedButton
      Left = 10
      Top = 303
      Width = 102
      Height = 25
      Caption = 'Importar NF-e'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnImportarClick
    end
    object btpPagamento: TSpeedButton
      Left = 118
      Top = 303
      Width = 94
      Height = 25
      Caption = 'Pagamento'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btpPagamentoClick
    end
    object Label20: TLabel
      Left = 308
      Top = 55
      Width = 116
      Height = 13
      Caption = 'Chave de acesso NFE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnDevolver: TSpeedButton
      Left = 220
      Top = 303
      Width = 94
      Height = 25
      Caption = 'Devolver'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnDevolverClick
    end
    object Label21: TLabel
      Left = 642
      Top = 55
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
    object Label22: TLabel
      Left = 694
      Top = 55
      Width = 29
      Height = 13
      Caption = 'Serie'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label23: TLabel
      Left = 756
      Top = 55
      Width = 49
      Height = 13
      Caption = 'Situa'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton4: TSpeedButton
      Left = 558
      Top = 26
      Width = 20
      Height = 21
      Caption = '...'
      OnClick = SpeedButton4Click
    end
    object gpbItens: TGroupBox
      Left = 6
      Top = 101
      Width = 963
      Height = 196
      Caption = 'Item'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      object Label6: TLabel
        Left = 510
        Top = 20
        Width = 20
        Height = 13
        Caption = 'Qtd'
      end
      object Label10: TLabel
        Left = 56
        Top = 20
        Width = 38
        Height = 13
        Caption = 'Codigo'
      end
      object Label11: TLabel
        Left = 104
        Top = 20
        Width = 45
        Height = 13
        Caption = 'Produto'
      end
      object Label12: TLabel
        Left = 700
        Top = 20
        Width = 29
        Height = 13
        Caption = 'Valor'
      end
      object Label9: TLabel
        Left = 11
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Item'
      end
      object Label2: TLabel
        Left = 854
        Top = 21
        Width = 45
        Height = 13
        Caption = 'Estoque'
      end
      object Label3: TLabel
        Left = 588
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Unid.'
      end
      object Label4: TLabel
        Left = 649
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Coef.'
      end
      object BitBtn1: TSpeedButton
        Left = 800
        Top = 80
        Width = 145
        Height = 37
        Caption = 'Adicionar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = BitBtn1Click
      end
      object CornerButton1: TSpeedButton
        Left = 800
        Top = 123
        Width = 145
        Height = 39
        Caption = 'Remover'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = CornerButton1Click
      end
      object Label14: TLabel
        Left = 790
        Top = 20
        Width = 28
        Height = 13
        Caption = 'CFOP'
      end
      object SpeedButton5: TSpeedButton
        Left = 481
        Top = 38
        Width = 23
        Height = 21
        Caption = '...'
        OnClick = SpeedButton5Click
      end
      object edtCodigoItem: TEdit
        Left = 56
        Top = 38
        Width = 41
        Height = 21
        TabStop = False
        ReadOnly = True
        TabOrder = 1
        OnChange = edtCodigoItemChange
      end
      object edtQuantidade: TEdit
        Left = 510
        Top = 38
        Width = 68
        Height = 21
        TabOrder = 3
      end
      object edtValor: TEdit
        Left = 698
        Top = 38
        Width = 87
        Height = 21
        Cursor = crIBeam
        TabOrder = 6
      end
      object edtOrdem: TEdit
        Left = 8
        Top = 38
        Width = 41
        Height = 21
        TabStop = False
        ReadOnly = True
        TabOrder = 0
      end
      object cboProduto: TDBLookupComboBox
        Left = 104
        Top = 38
        Width = 377
        Height = 21
        DropDownRows = 15
        DropDownWidth = 400
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = srcProdutos
        TabOrder = 2
        OnCloseUp = cboProdutoCloseUp
      end
      object cboEstoque: TDBLookupComboBox
        Left = 854
        Top = 38
        Width = 99
        Height = 21
        DropDownRows = 15
        DropDownWidth = 200
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = srcEstoque
        TabOrder = 7
        OnCloseUp = cboProdutoCloseUp
      end
      object cboUnidadeMedida: TComboBox
        Left = 588
        Top = 38
        Width = 51
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object edtFator: TEdit
        Left = 649
        Top = 38
        Width = 41
        Height = 21
        TabOrder = 5
      end
      object edtCFOP: TEdit
        Left = 791
        Top = 38
        Width = 57
        Height = 21
        NumbersOnly = True
        TabOrder = 8
      end
      object GroupBox1: TGroupBox
        Left = 9
        Top = 65
        Width = 169
        Height = 120
        Caption = 'ICMS'
        TabOrder = 9
        object Label5: TLabel
          Left = 9
          Top = 19
          Width = 21
          Height = 13
          Caption = 'CST'
        end
        object Label7: TLabel
          Left = 7
          Top = 46
          Width = 59
          Height = 13
          Caption = 'Base ICMS'
        end
        object Label8: TLabel
          Left = 7
          Top = 71
          Width = 61
          Height = 13
          Caption = 'Valor ICMS'
        end
        object Label24: TLabel
          Left = 8
          Top = 95
          Width = 45
          Height = 13
          Caption = '% ICMS'
        end
        object cboCST: TComboBox
          Left = 81
          Top = 15
          Width = 75
          Height = 21
          TabOrder = 0
          Items.Strings = (
            ''
            '00'
            '10'
            '20'
            '30'
            '40'
            '41'
            '45'
            '50'
            '51'
            '60'
            '70'
            '80'
            '81'
            '90'
            '101'
            '102'
            '103'
            '201'
            '202'
            '203'
            '300'
            '400'
            '500'
            '900')
        end
        object edtBaseICMS: TEdit
          Left = 81
          Top = 41
          Width = 75
          Height = 21
          TabOrder = 1
        end
        object edtValorICMS: TEdit
          Left = 81
          Top = 67
          Width = 75
          Height = 21
          TabOrder = 2
        end
        object edtPercentualICMS: TEdit
          Left = 81
          Top = 91
          Width = 75
          Height = 21
          TabOrder = 3
        end
      end
      object GroupBox2: TGroupBox
        Left = 191
        Top = 65
        Width = 185
        Height = 120
        Caption = 'IPI'
        TabOrder = 10
        object Label25: TLabel
          Left = 9
          Top = 19
          Width = 41
          Height = 13
          Caption = 'CST IPI'
        end
        object Label17: TLabel
          Left = 9
          Top = 46
          Width = 47
          Height = 13
          Caption = 'Base IPI'
        end
        object Label13: TLabel
          Left = 9
          Top = 71
          Width = 49
          Height = 13
          Caption = 'Valor IPI'
        end
        object Label26: TLabel
          Left = 9
          Top = 95
          Width = 33
          Height = 13
          Caption = '% IPI'
        end
        object cboCSTIPI: TComboBox
          Left = 99
          Top = 15
          Width = 74
          Height = 21
          TabOrder = 0
          Items.Strings = (
            ''
            '00'
            '49'
            '50'
            '99'
            '01'
            '02'
            '03'
            '04'
            '05'
            '51'
            '52'
            '53'
            '54'
            '55')
        end
        object edtBaseIPI: TEdit
          Left = 99
          Top = 41
          Width = 74
          Height = 21
          TabOrder = 1
        end
        object edtValorIPI: TEdit
          Left = 99
          Top = 67
          Width = 74
          Height = 21
          TabOrder = 2
        end
        object edtPercentualIPI: TEdit
          Left = 99
          Top = 94
          Width = 74
          Height = 21
          TabOrder = 3
        end
      end
      object GroupBox3: TGroupBox
        Left = 590
        Top = 65
        Width = 185
        Height = 120
        Caption = 'COFINS'
        TabOrder = 11
        object Label29: TLabel
          Left = 8
          Top = 19
          Width = 64
          Height = 13
          Caption = 'CST COFINS'
        end
        object Label19: TLabel
          Left = 8
          Top = 46
          Width = 64
          Height = 13
          Caption = 'Base Cofins'
        end
        object Label16: TLabel
          Left = 8
          Top = 71
          Width = 66
          Height = 13
          Caption = 'Valor Cofins'
        end
        object Label30: TLabel
          Left = 8
          Top = 95
          Width = 56
          Height = 13
          Caption = '% COFINS'
        end
        object cboCSTCOFINS: TComboBox
          Left = 97
          Top = 15
          Width = 71
          Height = 21
          TabOrder = 0
          Items.Strings = (
            ''
            '01'
            '02'
            '03'
            '04'
            '05'
            '06'
            '07'
            '08'
            '09'
            '49'
            '50'
            '51'
            '52'
            '53'
            '54'
            '55'
            '56'
            '60'
            '61'
            '62'
            '63'
            '64'
            '65'
            '66'
            '67'
            '70'
            '71'
            '72'
            '73'
            '74'
            '75'
            '98'
            '99')
        end
        object edtBaseCofins: TEdit
          Left = 97
          Top = 41
          Width = 71
          Height = 21
          TabOrder = 1
        end
        object edtValorCofins: TEdit
          Left = 97
          Top = 67
          Width = 72
          Height = 21
          TabOrder = 2
        end
        object edtPercentualCOFINS: TEdit
          Left = 97
          Top = 91
          Width = 71
          Height = 21
          TabOrder = 3
        end
      end
      object GroupBox4: TGroupBox
        Left = 392
        Top = 65
        Width = 185
        Height = 120
        Caption = 'PIS'
        TabOrder = 12
        object Label27: TLabel
          Left = 9
          Top = 19
          Width = 43
          Height = 13
          Caption = 'CST PIS'
        end
        object Label18: TLabel
          Left = 9
          Top = 46
          Width = 49
          Height = 13
          Caption = 'Base PIS'
        end
        object Label15: TLabel
          Left = 9
          Top = 73
          Width = 51
          Height = 13
          Caption = 'Valor PIS'
        end
        object Label28: TLabel
          Left = 9
          Top = 95
          Width = 35
          Height = 13
          Caption = '% PIS'
        end
        object cboCSTPIS: TComboBox
          Left = 92
          Top = 15
          Width = 76
          Height = 21
          TabOrder = 0
          Items.Strings = (
            ''
            '01'
            '02'
            '03'
            '04'
            '05'
            '06'
            '07'
            '08'
            '09'
            '49'
            '50'
            '51'
            '52'
            '53'
            '54'
            '55'
            '56'
            '60'
            '61'
            '62'
            '63'
            '64'
            '65'
            '66'
            '67'
            '70'
            '71'
            '72'
            '73'
            '74'
            '75'
            '98'
            '99')
        end
        object edtBasePIS: TEdit
          Left = 92
          Top = 41
          Width = 76
          Height = 21
          TabOrder = 1
        end
        object edtValorPIS: TEdit
          Left = 92
          Top = 67
          Width = 76
          Height = 21
          TabOrder = 2
        end
        object edtPercentualPIS: TEdit
          Left = 92
          Top = 91
          Width = 76
          Height = 21
          TabOrder = 3
        end
      end
    end
    object dateData: TDateTimePicker
      Left = 67
      Top = 27
      Width = 100
      Height = 22
      Cursor = crIBeam
      Date = 41733.672745023150000000
      Time = 41733.672745023150000000
      TabOrder = 1
    end
    object cboCodigoFornecedor: TDBLookupComboBox
      Left = 175
      Top = 27
      Width = 382
      Height = 21
      DropDownRows = 20
      TabOrder = 2
    end
    object edtNumeroDocumento: TEdit
      Left = 606
      Top = 25
      Width = 98
      Height = 21
      NumbersOnly = True
      TabOrder = 3
    end
    object cboTipoFrete: TComboBox
      Left = 726
      Top = 26
      Width = 134
      Height = 21
      TabOrder = 4
      Items.Strings = (
        'Conta Emitente'
        'Conta Destinatario'
        'Conta Terceiros'
        'Proprio Remetente'
        'Proprio Destinatario'
        'Sem Frete')
    end
    object edtValorFrete: TEdit
      Left = 90
      Top = 74
      Width = 67
      Height = 21
      TabOrder = 7
    end
    object edtValorDocumento: TEdit
      Left = 175
      Top = 74
      Width = 114
      Height = 21
      NumbersOnly = True
      TabOrder = 8
    end
    object dateDataEmissao: TDateTimePicker
      Left = 871
      Top = 26
      Width = 95
      Height = 22
      Cursor = crIBeam
      Date = 41733.672745138890000000
      Time = 41733.672745138890000000
      TabOrder = 5
    end
    object grdItens: TDBGrid
      Left = 6
      Top = 334
      Width = 963
      Height = 226
      Anchors = [akLeft, akTop, akBottom]
      DataSource = srcItens
      TabOrder = 9
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = grdItensCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Ordem'
          Title.Caption = 'Item'
          Width = 29
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CodigoProduto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Descricao'
          Width = 341
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Quantidade'
          Title.Caption = 'Qtd.'
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Valor'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Desconto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Total'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CFOP'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CST'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BaseICMS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PercentualICMS'
          Title.Caption = '%ICMS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValorICMS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CSTIPI'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BaseIPI'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PercentualIPI'
          Title.Caption = '%lIPI'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValorIPI'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CSTPIS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BasePIS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PercentualPIS'
          Title.Caption = '%PIS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValorPIS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CSTCOFINS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BaseCOFINS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PercentualCOFINS'
          Title.Caption = '%COFINS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValorCOFINS'
          Width = 74
          Visible = True
        end>
    end
    object edtCodigo: TEdit
      Left = 6
      Top = 27
      Width = 52
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object edtValorDesconto: TEdit
      Left = 6
      Top = 74
      Width = 69
      Height = 21
      TabOrder = 6
    end
    object edtChaveAcesso: TEdit
      Left = 308
      Top = 74
      Width = 323
      Height = 21
      NumbersOnly = True
      TabOrder = 11
    end
    object edtEspecie: TEdit
      Left = 642
      Top = 74
      Width = 46
      Height = 21
      MaxLength = 3
      TabOrder = 12
    end
    object edtSerie: TEdit
      Left = 694
      Top = 74
      Width = 46
      Height = 21
      MaxLength = 3
      TabOrder = 13
    end
    object cboSituacao: TComboBox
      Left = 756
      Top = 74
      Width = 134
      Height = 21
      Enabled = False
      TabOrder = 14
      Items.Strings = (
        'ABERTA'
        'BAIXADA'
        'DEVOLVIDA')
    end
  end
  inherited Panel2: TPanel
    Width = 978
    ExplicitWidth = 978
    inherited btnAlterar: TSpeedButton
      Left = 99
      Top = 1
      ExplicitLeft = 99
      ExplicitTop = 1
    end
    inherited btnCancelar: TSpeedButton
      Left = 206
      ExplicitLeft = 206
    end
    inherited btnExcluir: TSpeedButton
      Left = 326
      ExplicitLeft = 326
    end
    inherited btnConfirmar: TSpeedButton
      Left = 438
      ExplicitLeft = 438
    end
    inherited btnSair: TSpeedButton
      Left = 906
      ExplicitLeft = 906
    end
    object CornerButton2: TSpeedButton
      Left = 562
      Top = 0
      Width = 83
      Height = 43
      Caption = 'Pesquisa'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = CornerButton2Click
    end
  end
  inherited srcEntidade: TDataSource
    Left = 424
    Top = 366
  end
  object srcItens: TDataSource
    AutoEdit = False
    Left = 496
    Top = 366
  end
  object srcProdutos: TDataSource
    AutoEdit = False
    Left = 656
    Top = 366
  end
  object srcEstoque: TDataSource
    AutoEdit = False
    Left = 736
    Top = 366
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*-nfe.XML'
    Filter = 
      'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|To' +
      'dos os Arquivos (*.*)|*.*'
    Title = 'Selecione a NFe'
    Left = 568
    Top = 360
  end
  object srcPagamentos: TDataSource
    AutoEdit = False
    Left = 424
    Top = 430
  end
end
