inherited FormFornecedoresDetalhes: TFormFornecedoresDetalhes
  Caption = 'Fornecedores'
  ClientHeight = 521
  ClientWidth = 710
  ExplicitWidth = 726
  ExplicitHeight = 559
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 710
    Height = 472
    ExplicitWidth = 710
    inherited tabPrincipal: TPageControl
      Width = 708
      Height = 470
      ActivePage = TabSheet2
      ExplicitWidth = 708
      inherited TabSheet1: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 700
        ExplicitHeight = 442
        inherited grdEntidade: TDBGrid
          Width = 700
          Height = 354
          Columns = <
            item
              Expanded = False
              FieldName = 'Codigo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Nome'
              Width = 197
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Raz'#227'o social'
              Width = 207
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CPFCNPJ'
              Width = 152
              Visible = True
            end>
        end
        inherited pnlSuperior: TPanel
          Width = 700
          ExplicitWidth = 700
          inherited grpPesquisa: TGroupBox
            inherited btnPesquisar: TButton
              Top = 16
              ExplicitTop = 16
            end
          end
        end
        inherited pnlInferior: TPanel
          Top = 419
          Width = 700
          Height = 23
          ExplicitTop = 419
          ExplicitWidth = 700
          ExplicitHeight = 23
        end
      end
      inherited TabSheet2: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 700
        ExplicitHeight = 464
        object tabProdutoDetalhes: TPageControl
          Left = 0
          Top = 0
          Width = 700
          Height = 442
          ActivePage = TabSheet7
          Align = alClient
          TabOrder = 0
          ExplicitHeight = 464
          object TabSheet7: TTabSheet
            Caption = 'Dados Iniciais'
            object Label1: TLabel
              Left = 11
              Top = 20
              Width = 32
              Height = 13
              Caption = 'Nome'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label2: TLabel
              Left = 11
              Top = 49
              Width = 53
              Height = 13
              Caption = 'CPF/CNPJ'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label22: TLabel
              Left = 11
              Top = 76
              Width = 70
              Height = 13
              Caption = 'Raz'#227'o social'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label3: TLabel
              Left = 11
              Top = 111
              Width = 49
              Height = 13
              Caption = 'Telefone'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label4: TLabel
              Left = 11
              Top = 147
              Width = 35
              Height = 13
              Caption = 'E-mail'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object SpeedButton1: TSpeedButton
              Left = 231
              Top = 40
              Width = 72
              Height = 22
              Caption = 'Pesquisar'
              OnClick = SpeedButton1Click
            end
            object Label11: TLabel
              Left = 309
              Top = 44
              Width = 104
              Height = 13
              Caption = 'Inscri'#231#227'o estadual'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Nome: TEdit
              Tag = 1
              Left = 93
              Top = 12
              Width = 453
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnKeyPress = EditPress
            end
            object RazaoSocial: TEdit
              Left = 93
              Top = 76
              Width = 453
              Height = 21
              TabOrder = 2
              OnKeyPress = EditPress
            end
            object CPFCNPJ: TEdit
              Left = 92
              Top = 42
              Width = 133
              Height = 21
              TabOrder = 1
            end
            object Telefone: TEdit
              Left = 92
              Top = 110
              Width = 269
              Height = 21
              TabOrder = 3
            end
            object Email: TEdit
              Left = 92
              Top = 144
              Width = 266
              Height = 21
              TabOrder = 4
            end
            object InscricaoEstadual: TEdit
              Left = 424
              Top = 39
              Width = 123
              Height = 21
              TabOrder = 5
            end
          end
          object TabSheet3: TTabSheet
            Caption = 'Endere'#231'o'
            ExplicitHeight = 436
            object Label5: TLabel
              Left = 8
              Top = 24
              Width = 65
              Height = 13
              Caption = 'Logradouro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label6: TLabel
              Left = 8
              Top = 64
              Width = 34
              Height = 13
              Caption = 'Bairro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label7: TLabel
              Left = 8
              Top = 99
              Width = 53
              Height = 13
              Caption = 'Munic'#237'pio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 8
              Top = 147
              Width = 14
              Height = 13
              Caption = 'UF'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label9: TLabel
              Left = 8
              Top = 179
              Width = 20
              Height = 13
              Caption = 'CEP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label10: TLabel
              Left = 7
              Top = 223
              Width = 79
              Height = 13
              Caption = 'Complemento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object SpeedButton6: TSpeedButton
              Left = 255
              Top = 174
              Width = 60
              Height = 24
              Caption = 'Localizar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = SpeedButton6Click
            end
            object Label45: TLabel
              Left = 342
              Top = 103
              Width = 67
              Height = 13
              Caption = 'Codigo IBGE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Endereco: TEdit
              Left = 104
              Top = 21
              Width = 409
              Height = 21
              TabOrder = 0
              OnKeyPress = EditPress
            end
            object Bairro: TEdit
              Left = 104
              Top = 58
              Width = 409
              Height = 21
              TabOrder = 1
              OnKeyPress = EditPress
            end
            object Municipio: TEdit
              Left = 104
              Top = 98
              Width = 232
              Height = 21
              TabOrder = 2
              OnKeyPress = EditPress
            end
            object UF: TComboBox
              Left = 104
              Top = 144
              Width = 73
              Height = 21
              TabOrder = 3
              Items.Strings = (
                'AC'
                'AL'
                'AM'
                'AP'
                'BA'
                'CE'
                'DF'
                'ES'
                'GO'
                'MA'
                'MG'
                'MS'
                'MT'
                'PA'
                'PB'
                'PE'
                'PI'
                'PR'
                'RJ'
                'RN'
                'RO'
                'RR'
                'RS'
                'SC'
                'SE'
                'SP'
                'TO'
                'EX')
            end
            object CEP: TEdit
              Left = 104
              Top = 178
              Width = 145
              Height = 21
              TabOrder = 4
            end
            object Complemento: TEdit
              Left = 104
              Top = 216
              Width = 412
              Height = 21
              TabOrder = 5
              OnKeyPress = EditPress
            end
            object CodigoIBGE: TEdit
              Left = 414
              Top = 98
              Width = 99
              Height = 21
              TabOrder = 6
            end
          end
          object TabSheet4: TTabSheet
            Caption = 'Contatos'
            OnEnter = TabSheet4Enter
            object Label14: TLabel
              Left = 5
              Top = 17
              Width = 32
              Height = 13
              Caption = 'Nome'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label15: TLabel
              Left = 5
              Top = 56
              Width = 49
              Height = 13
              Caption = 'Telefone'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label21: TLabel
              Left = 389
              Top = 16
              Width = 20
              Height = 13
              Caption = 'CPF'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edtNomeContato: TEdit
              Left = 83
              Top = 13
              Width = 300
              Height = 21
              TabOrder = 0
            end
            object edtTelefoneContato: TEdit
              Left = 83
              Top = 53
              Width = 137
              Height = 21
              TabOrder = 1
            end
            object edtCPFContato: TEdit
              Left = 417
              Top = 13
              Width = 137
              Height = 21
              TabOrder = 2
            end
            object btnInserirContato: TButton
              Left = 2
              Top = 80
              Width = 75
              Height = 25
              Caption = 'Novo'
              TabOrder = 3
              OnClick = btnInserirContatoClick
            end
            object btnConfirmarContato: TButton
              Left = 93
              Top = 80
              Width = 75
              Height = 25
              Caption = 'Confirmar'
              TabOrder = 4
              OnClick = btnConfirmarContatoClick
            end
            object btnRemoverContato: TButton
              Left = 180
              Top = 80
              Width = 75
              Height = 25
              Caption = 'Remover'
              TabOrder = 5
              OnClick = btnRemoverContatoClick
            end
            object DBGrid2: TDBGrid
              Left = 0
              Top = 172
              Width = 692
              Height = 242
              Align = alBottom
              DataSource = srcContatos
              TabOrder = 6
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnCellClick = DBGrid2CellClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'Nome'
                  Width = 440
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Telefone'
                  Visible = True
                end>
            end
          end
          object TabSheet6: TTabSheet
            Caption = 'Observa'#231#227'o'
            object Observacao: TMemo
              Left = 8
              Top = 8
              Width = 601
              Height = 345
              TabOrder = 0
            end
          end
        end
      end
    end
  end
  inherited Panel2: TPanel
    Width = 710
    ExplicitWidth = 710
    inherited btnSair: TSpeedButton
      Left = 643
      Top = 1
      ExplicitLeft = 643
      ExplicitTop = 1
    end
    inherited btnRelatorio: TSpeedButton
      Left = 547
      Top = 1
      Width = 86
      ExplicitLeft = 547
      ExplicitTop = 1
      ExplicitWidth = 86
    end
  end
  inherited srcPesquisa: TDataSource
    Left = 128
  end
  object srcContatos: TDataSource
    AutoEdit = False
    Left = 240
    Top = 358
  end
  object ACBrCEP1: TACBrCEP
    ProxyPort = '8080'
    ParseText = True
    WebService = wsBuscarCep
    PesquisarIBGE = True
    OnBuscaEfetuada = ACBrCEP1BuscaEfetuada
    Left = 640
    Top = 216
  end
end
