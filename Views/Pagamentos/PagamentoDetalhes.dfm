inherited FormPagamentoDetalhes: TFormPagamentoDetalhes
  Caption = 'Pagamentos'
  ClientHeight = 627
  ClientWidth = 1097
  ExplicitWidth = 1113
  ExplicitHeight = 665
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1097
    Height = 578
    ExplicitWidth = 1097
    ExplicitHeight = 578
    inherited tabPrincipal: TPageControl
      Width = 1095
      Height = 576
      ExplicitWidth = 1095
      ExplicitHeight = 576
      inherited TabSheet1: TTabSheet
        ExplicitWidth = 1087
        ExplicitHeight = 548
        inherited grdEntidade: TDBGrid
          Top = 113
          Width = 1087
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
          PopupMenu = PopupMenu1
          OnDrawColumnCell = grdEntidadeDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'Codigo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DataVencimento'
              Title.Caption = 'Vencimento'
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NumeroDocumento'
              Title.Caption = 'Documento'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Fornecedor'
              Width = 187
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Categoria'
              Title.Caption = 'Conta cont'#225'bil'
              Width = 196
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescricaoCentroCusto'
              Title.Caption = 'Centro de Custo'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Valor'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ValorBaixado'
              Title.Caption = 'Valor Pago'
              Width = 81
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Situacao'
              Title.Caption = 'Situa'#231#227'o'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DataBaixa'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FormaPagamento'
              Width = 97
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Caixa'
              Width = 106
              Visible = True
            end>
        end
        inherited pnlSuperior: TPanel
          Width = 1087
          Height = 113
          ExplicitWidth = 1087
          ExplicitHeight = 113
          inherited grpPesquisa: TGroupBox
            Left = 4
            Width = 948
            Height = 104
            ExplicitLeft = 4
            ExplicitWidth = 948
            ExplicitHeight = 104
            object Label3: TLabel [0]
              Left = 177
              Top = 16
              Width = 85
              Height = 13
              Caption = 'Forma de Pgto.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel [1]
              Left = 463
              Top = 16
              Width = 31
              Height = 13
              Caption = 'Caixa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label7: TLabel [2]
              Left = 625
              Top = 16
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
            object Label2: TLabel [3]
              Left = 830
              Top = 16
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
            object Label11: TLabel [4]
              Left = 9
              Top = 16
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
            object Label6: TLabel [5]
              Left = 9
              Top = 55
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
            object Label12: TLabel [6]
              Left = 177
              Top = 57
              Width = 81
              Height = 13
              Caption = 'Conta cont'#225'bil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label9: TLabel [7]
              Left = 463
              Top = 56
              Width = 89
              Height = 13
              Caption = 'Centro de custo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            inherited edtValorPesquisa: TEdit
              Left = 9
              Top = 71
              Width = 161
              ExplicitLeft = 9
              ExplicitTop = 71
              ExplicitWidth = 161
            end
            inherited btnPesquisar: TButton
              Left = 688
              Top = 69
              Width = 128
              ExplicitLeft = 688
              ExplicitTop = 69
              ExplicitWidth = 128
            end
            object cboFormaPgtoPesquisa: TComboBox
              Left = 177
              Top = 33
              Width = 272
              Height = 21
              TabOrder = 2
            end
            object cboCaixaPesquisa: TComboBox
              Left = 463
              Top = 33
              Width = 146
              Height = 21
              TabOrder = 3
            end
            object cboSituacaoPesquisa: TComboBox
              Left = 632
              Top = 35
              Width = 192
              Height = 21
              TabOrder = 4
              Items.Strings = (
                'Aberto'
                'Baixado'
                'Cancelado'
                'Parcelado')
            end
            object dateInicio: TDateTimePicker
              Left = 830
              Top = 33
              Width = 105
              Height = 22
              Cursor = crIBeam
              Date = 41709.544510381940000000
              Time = 41709.544510381940000000
              TabOrder = 5
            end
            object dateFim: TDateTimePicker
              Left = 830
              Top = 71
              Width = 105
              Height = 22
              Cursor = crIBeam
              Date = 41709.544510474540000000
              Time = 41709.544510474540000000
              TabOrder = 6
            end
            object edtNumero: TEdit
              Left = 9
              Top = 33
              Width = 161
              Height = 21
              TabOrder = 7
              OnKeyPress = EditPress
            end
            object cboCategoriaPesquisa: TComboBox
              Left = 176
              Top = 71
              Width = 269
              Height = 21
              DropDownCount = 20
              TabOrder = 8
            end
            object cboCentroCustoPesquisa: TComboBox
              Left = 463
              Top = 71
              Width = 183
              Height = 21
              DropDownCount = 20
              TabOrder = 9
            end
          end
          object edtPorTipoPeriodo: TRadioGroup
            Left = 958
            Top = 0
            Width = 119
            Height = 104
            Caption = 'Per'#237'odo por'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ItemIndex = 1
            Items.Strings = (
              'Cadastro'
              'Vencimento'
              'Baixa')
            ParentFont = False
            TabOrder = 1
          end
        end
        inherited pnlInferior: TPanel
          Top = 490
          Width = 1087
          Height = 58
          ExplicitTop = 490
          ExplicitWidth = 1087
          ExplicitHeight = 58
          object Label5: TLabel
            Left = 681
            Top = 5
            Width = 49
            Height = 19
            Caption = 'Total:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbTotal: TLabel
            Left = 736
            Top = 4
            Width = 35
            Height = 19
            Caption = '0,00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbTotalPago: TLabel
            Left = 735
            Top = 29
            Width = 35
            Height = 19
            Caption = '0,00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 681
            Top = 27
            Width = 47
            Height = 19
            Caption = 'Pago:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
      inherited TabSheet2: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 1087
        ExplicitHeight = 548
        object lbData: TLabel
          Left = 9
          Top = 5
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
        object lbCodigoPessoa: TLabel
          Left = 122
          Top = 3
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
        object lbDescricao: TLabel
          Left = 9
          Top = 45
          Width = 55
          Height = 13
          Caption = 'Descricao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbValor: TLabel
          Left = 423
          Top = 97
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
        object lbCodigoCategoria: TLabel
          Left = 255
          Top = 45
          Width = 81
          Height = 13
          Caption = 'Conta cont'#225'bil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbNumeroDocumento: TLabel
          Left = 146
          Top = 149
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
        object lbSituacao: TLabel
          Left = 9
          Top = 149
          Width = 49
          Height = 13
          Caption = 'Situacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbCodigoCaixa: TLabel
          Left = 146
          Top = 97
          Width = 31
          Height = 13
          Caption = 'Caixa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbCodigoFormaPagamento: TLabel
          Left = 272
          Top = 149
          Width = 85
          Height = 13
          Caption = 'Forma de Pgto.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbObservacao: TLabel
          Left = 11
          Top = 246
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
        object lbDataVencimento: TLabel
          Left = 9
          Top = 97
          Width = 67
          Height = 13
          Caption = 'Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnMovimentar: TSpeedButton
          Left = 11
          Top = 384
          Width = 105
          Height = 42
          Caption = 'Baixar'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          OnClick = btnMovimentarClick
        end
        object SpeedButton1: TSpeedButton
          Left = 528
          Top = 21
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = SpeedButton1Click
        end
        object SpeedButton2: TSpeedButton
          Left = 530
          Top = 65
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = SpeedButton2Click
        end
        object Label1: TLabel
          Left = 11
          Top = 199
          Width = 89
          Height = 13
          Caption = 'Centro de custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton3: TSpeedButton
          Left = 284
          Top = 219
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = SpeedButton3Click
        end
        object SpeedButton4: TSpeedButton
          Left = 131
          Top = 384
          Width = 105
          Height = 42
          Caption = 'Estornar'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          OnClick = SpeedButton4Click
        end
        object dateData: TDateTimePicker
          Left = 9
          Top = 22
          Width = 99
          Height = 21
          Date = 41745.569134178230000000
          Time = 41745.569134178230000000
          TabOrder = 0
        end
        object cboCodigoPessoa: TComboBox
          Left = 122
          Top = 22
          Width = 402
          Height = 21
          TabOrder = 1
        end
        object edtDescricao: TEdit
          Left = 9
          Top = 65
          Width = 237
          Height = 21
          TabOrder = 2
          OnKeyPress = EditPress
        end
        object edtValor: TEdit
          Left = 424
          Top = 116
          Width = 100
          Height = 21
          TabOrder = 3
        end
        object cboCodigoCategoria: TComboBox
          Left = 255
          Top = 65
          Width = 269
          Height = 21
          DropDownCount = 20
          TabOrder = 4
        end
        object edtNumeroDocumento: TEdit
          Left = 146
          Top = 168
          Width = 100
          Height = 21
          TabOrder = 6
        end
        object cboSituacao: TComboBox
          Left = 9
          Top = 168
          Width = 118
          Height = 21
          Style = csDropDownList
          TabOrder = 5
          Items.Strings = (
            'Aberto'
            'Baixado'
            'Cancelado'
            'Parcelado')
        end
        object cboCodigoCaixa: TComboBox
          Left = 146
          Top = 116
          Width = 255
          Height = 21
          Style = csDropDownList
          TabOrder = 7
        end
        object memoObservacao: TMemo
          Left = 9
          Top = 265
          Width = 515
          Height = 105
          TabOrder = 10
        end
        object cboCodigoFormaPagamento: TComboBox
          Left = 272
          Top = 168
          Width = 252
          Height = 21
          Style = csDropDownList
          TabOrder = 9
        end
        object dateDataVencimento: TDateTimePicker
          Left = 9
          Top = 116
          Width = 99
          Height = 21
          Date = 41745.569134178230000000
          Time = 41745.569134178230000000
          TabOrder = 8
        end
        object cboCentroCusto: TComboBox
          Left = 9
          Top = 219
          Width = 269
          Height = 21
          DropDownCount = 20
          TabOrder = 11
        end
      end
    end
  end
  inherited Panel2: TPanel
    Width = 1097
    ExplicitWidth = 1097
    inherited btnSair: TSpeedButton
      Left = 1029
      ExplicitLeft = 1029
    end
    object BitBtn2: TSpeedButton
      Left = 704
      Top = 1
      Width = 105
      Height = 42
      Caption = 'Imprimir'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      PopupMenu = PopupMenu1
      OnClick = BitBtn2Click
    end
  end
  inherited srcEntidade: TDataSource
    Left = 208
    Top = 342
  end
  inherited srcPesquisa: TDataSource
    OnStateChange = srcPesquisaStateChange
    Left = 136
    Top = 342
  end
  object PopupMenu1: TPopupMenu
    Left = 64
    Top = 344
    object Baixaar1: TMenuItem
      Caption = 'Baixar'
      OnClick = Baixaar1Click
    end
    object Parcelar1: TMenuItem
      Caption = 'Parcelar'
      OnClick = Parcelar1Click
    end
    object Recibo1: TMenuItem
      Caption = 'Recibo'
      OnClick = Recibo1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 272
    Top = 344
    object Resumo1: TMenuItem
      Caption = 'Resumo'
    end
  end
end
