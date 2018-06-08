inherited FormTabelaPreco: TFormTabelaPreco
  Caption = 'FormTabelaPreco'
  ClientHeight = 531
  ClientWidth = 687
  ExplicitWidth = 703
  ExplicitHeight = 569
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 687
    Height = 482
    ExplicitTop = 50
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
      Left = 280
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
      Left = 8
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
    object Label11: TLabel
      Left = 8
      Top = 84
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
    object Label12: TLabel
      Left = 461
      Top = 84
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
    object SpeedButton3: TSpeedButton
      Left = 427
      Top = 103
      Width = 23
      Height = 21
      Caption = '...'
    end
    object grdItens: TDBGrid
      Left = 8
      Top = 144
      Width = 777
      Height = 330
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
    object Edit1: TEdit
      Left = 8
      Top = 42
      Width = 257
      Height = 21
      TabOrder = 1
    end
    object dateDataEmissao: TDateTimePicker
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
      Left = 280
      Top = 42
      Width = 273
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
    object cboProduto: TDBLookupComboBox
      Left = 8
      Top = 103
      Width = 417
      Height = 21
      DropDownRows = 15
      DropDownWidth = 400
      KeyField = 'Codigo'
      ListField = 'Descricao'
      TabOrder = 4
    end
    object edtValor: TEdit
      Left = 458
      Top = 102
      Width = 111
      Height = 21
      Cursor = crIBeam
      TabOrder = 5
    end
  end
  inherited Panel2: TPanel
    Width = 687
  end
  inherited srcEntidade: TDataSource
    Left = 552
    Top = 278
  end
end
