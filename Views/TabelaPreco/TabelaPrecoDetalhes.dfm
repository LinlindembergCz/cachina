inherited FormTabelaPrecoDetalhes: TFormTabelaPrecoDetalhes
  Caption = 'FormTabelaPrecoDetalhes'
  ClientHeight = 549
  ClientWidth = 756
  ExplicitWidth = 772
  ExplicitHeight = 587
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 756
    Height = 500
    ExplicitWidth = 756
    ExplicitHeight = 500
    object lbDataEmissao: TLabel
      Left = 578
      Top = 23
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
    object Label4: TLabel
      Left = 385
      Top = 23
      Width = 121
      Height = 13
      Caption = 'Forma de pagamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 75
      Top = 23
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
      Left = 8
      Top = 23
      Width = 38
      Height = 13
      Caption = 'Codigo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnAdicionaProduto: TSpeedButton
      Left = 476
      Top = 168
      Width = 94
      Height = 28
      Caption = 'Adicionar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnAdicionaProdutoClick
    end
    object CornerButton1: TSpeedButton
      Left = 576
      Top = 168
      Width = 95
      Height = 28
      Caption = 'Remover'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 80
      Top = 64
      Width = 63
      Height = 13
      Caption = '% Deconto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 8
      Top = 171
      Width = 209
      Height = 28
      Caption = 'Adicionar Todos os produtos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object grdItens: TDBGrid
      Left = 8
      Top = 202
      Width = 663
      Height = 290
      Anchors = [akLeft, akTop, akBottom]
      DataSource = srcItens
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Color = clSilver
          Expanded = False
          FieldName = 'CodigoProduto'
          ReadOnly = True
          Width = 85
          Visible = True
        end
        item
          Color = clSilver
          Expanded = False
          FieldName = 'Descricao'
          ReadOnly = True
          Width = 418
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Preco'
          Width = 117
          Visible = True
        end>
    end
    object edtDescricao: TEdit
      Left = 75
      Top = 42
      Width = 297
      Height = 21
      TabOrder = 1
    end
    object dateValidade: TDateTimePicker
      Left = 576
      Top = 41
      Width = 95
      Height = 22
      Cursor = crIBeam
      Date = 41733.672745138890000000
      Time = 41733.672745138890000000
      TabOrder = 2
    end
    object cboFormaPagamento: TComboBox
      Left = 385
      Top = 42
      Width = 170
      Height = 21
      Style = csDropDownList
      DropDownCount = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edtCodigo: TEdit
      Left = 8
      Top = 42
      Width = 55
      Height = 21
      TabOrder = 4
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 103
      Width = 663
      Height = 62
      Caption = 'Item'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object Label11: TLabel
        Left = 74
        Top = 18
        Width = 45
        Height = 13
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpeedButton3: TSpeedButton
        Left = 482
        Top = 33
        Width = 23
        Height = 21
        Caption = '...'
      end
      object Label12: TLabel
        Left = 548
        Top = 18
        Width = 32
        Height = 13
        Caption = 'Pre'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cboProduto: TDBLookupComboBox
        Left = 75
        Top = 34
        Width = 401
        Height = 21
        DropDownRows = 15
        DropDownWidth = 400
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ParentFont = False
        TabOrder = 0
        OnCloseUp = cboProdutoCloseUp
      end
      object edtPreco: TEdit
        Left = 547
        Top = 34
        Width = 98
        Height = 21
        Cursor = crIBeam
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = '0'
      end
      object edtCodigoProduto: TEdit
        Left = 7
        Top = 33
        Width = 55
        Height = 24
        TabOrder = 2
        OnChange = edtCodigoProdutoChange
      end
    end
    object edtDesconto: TEdit
      Left = 80
      Top = 83
      Width = 62
      Height = 21
      Cursor = crIBeam
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
  end
  inherited Panel2: TPanel
    Width = 756
    ExplicitWidth = 756
    inherited btnSair: TSpeedButton
      Left = 680
      ExplicitLeft = 680
    end
    object CornerButton2: TSpeedButton
      Left = 576
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
    Left = 288
    Top = 118
  end
  object srcItens: TDataSource
    Left = 288
    Top = 326
  end
end
