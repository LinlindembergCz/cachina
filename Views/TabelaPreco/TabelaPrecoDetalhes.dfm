inherited FormTabelaPrecoDetalhes: TFormTabelaPrecoDetalhes
  Caption = 'FormTabelaPrecoDetalhes'
  ClientHeight = 531
  ClientWidth = 684
  ExplicitWidth = 700
  ExplicitHeight = 569
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 684
    Height = 482
    ExplicitWidth = 687
    ExplicitHeight = 482
    object lbDataEmissao: TLabel
      Left = 578
      Top = 22
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
      Left = 392
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
      Left = 80
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
    object BitBtn1: TSpeedButton
      Left = 476
      Top = 146
      Width = 94
      Height = 28
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
      Left = 576
      Top = 146
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
    object grdItens: TDBGrid
      Left = 8
      Top = 180
      Width = 663
      Height = 290
      DataSource = srcItens
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CodigoProduto'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Descricao'
          Width = 418
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Preco'
          Width = 125
          Visible = True
        end>
    end
    object edtDescricao: TEdit
      Left = 80
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
      Left = 392
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
      Top = 71
      Width = 663
      Height = 70
      Caption = 'Item'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object Label11: TLabel
        Left = 11
        Top = 21
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
        Left = 521
        Top = 34
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
        Left = 11
        Top = 34
        Width = 508
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
      end
    end
  end
  inherited Panel2: TPanel
    Width = 684
    ExplicitWidth = 687
    inherited btnSair: TSpeedButton
      Left = 600
      ExplicitLeft = 600
    end
  end
  inherited srcEntidade: TDataSource
    Left = 320
    Top = 54
  end
  object srcItens: TDataSource
    AutoEdit = False
    Left = 288
    Top = 326
  end
end
