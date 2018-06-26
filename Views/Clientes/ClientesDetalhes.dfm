inherited FormClientesDetalhes: TFormClientesDetalhes
  Caption = 'Pessoa'
  ClientHeight = 484
  ClientWidth = 754
  ExplicitWidth = 770
  ExplicitHeight = 522
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 754
    Height = 435
    ExplicitWidth = 754
    ExplicitHeight = 435
    inherited tabPrincipal: TPageControl
      Width = 752
      Height = 433
      ExplicitWidth = 752
      ExplicitHeight = 433
      inherited TabSheet1: TTabSheet
        ExplicitWidth = 744
        ExplicitHeight = 405
        inherited grdEntidade: TDBGrid
          Width = 744
          Height = 318
          Columns = <
            item
              Expanded = False
              FieldName = 'Codigo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Nome'
              Width = 524
              Visible = True
            end>
        end
        inherited pnlSuperior: TPanel
          Width = 744
          ExplicitWidth = 744
        end
        inherited pnlInferior: TPanel
          Top = 383
          Width = 744
          ExplicitTop = 383
          ExplicitWidth = 744
        end
      end
      inherited TabSheet2: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 744
        ExplicitHeight = 405
        object tabDetalhes: TPageControl
          Left = 0
          Top = 0
          Width = 744
          Height = 405
          ActivePage = TabSheet7
          Align = alClient
          TabOrder = 0
          object TabSheet7: TTabSheet
            Caption = 'Dados Iniciais'
            object Label1: TLabel
              Left = 11
              Top = 45
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
              Left = 12
              Top = 13
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
              Top = 104
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
              Top = 140
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
            object Label12: TLabel
              Left = 11
              Top = 173
              Width = 72
              Height = 13
              Caption = 'Classifica'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label31: TLabel
              Left = 557
              Top = 74
              Width = 11
              Height = 13
              Caption = 'IE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label32: TLabel
              Left = 558
              Top = 43
              Width = 16
              Height = 13
              Caption = 'RG'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object SpeedButton7: TSpeedButton
              Left = 232
              Top = 6
              Width = 60
              Height = 24
              Caption = 'Localizar'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = SpeedButton7Click
            end
            object Nome: TEdit
              Tag = 1
              Left = 93
              Top = 40
              Width = 453
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnKeyPress = EditPress
            end
            object RazaoSocial: TEdit
              Left = 93
              Top = 71
              Width = 453
              Height = 21
              TabOrder = 2
              OnKeyPress = EditPress
            end
            object CPFCNPJ: TEdit
              Left = 93
              Top = 6
              Width = 133
              Height = 21
              TabOrder = 0
              OnExit = CPFCNPJExit
            end
            object Telefone: TEdit
              Left = 93
              Top = 103
              Width = 269
              Height = 21
              TabOrder = 3
            end
            object Email: TEdit
              Left = 93
              Top = 137
              Width = 266
              Height = 21
              TabOrder = 4
            end
            object CodigoClassificacao: TComboBox
              Left = 93
              Top = 169
              Width = 153
              Height = 21
              TabOrder = 5
            end
            object Faturar: TCheckBox
              Left = 264
              Top = 171
              Width = 97
              Height = 17
              Caption = 'Faturar'
              TabOrder = 6
            end
            object InscricaoEstadual: TEdit
              Left = 589
              Top = 71
              Width = 115
              Height = 21
              TabOrder = 7
            end
            object RG: TEdit
              Left = 589
              Top = 40
              Width = 115
              Height = 21
              TabOrder = 8
            end
          end
          object TabSheet6: TTabSheet
            Caption = 'Observa'#231#227'o'
            object Observacao: TMemo
              Left = 0
              Top = 0
              Width = 736
              Height = 377
              Align = alClient
              TabOrder = 0
            end
          end
          object TabSheet10: TTabSheet
            Caption = 'Outra Inform'#231#245'es'
            ImageIndex = 7
            TabVisible = False
            object Label11: TLabel
              Left = 7
              Top = 55
              Width = 69
              Height = 13
              Caption = 'Nome do pai'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label13: TLabel
              Left = 7
              Top = 16
              Width = 63
              Height = 13
              Caption = 'Estado civil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label23: TLabel
              Left = 7
              Top = 93
              Width = 77
              Height = 13
              Caption = 'Nome da m'#227'e'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label24: TLabel
              Left = 7
              Top = 133
              Width = 46
              Height = 13
              Caption = 'C'#244'njuge'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label25: TLabel
              Left = 7
              Top = 173
              Width = 69
              Height = 13
              Caption = 'CPF C'#244'njuge'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label26: TLabel
              Left = 7
              Top = 213
              Width = 76
              Height = 13
              Caption = 'Renda formal'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label27: TLabel
              Left = 7
              Top = 250
              Width = 82
              Height = 13
              Caption = 'Renda familiar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label28: TLabel
              Left = 229
              Top = 174
              Width = 32
              Height = 13
              Caption = 'Filhos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label29: TLabel
              Left = 8
              Top = 285
              Width = 59
              Height = 13
              Caption = 'Data Nasc.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label30: TLabel
              Left = 214
              Top = 17
              Width = 52
              Height = 13
              Caption = 'Profiss'#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object SpeedButton1: TSpeedButton
              Left = 550
              Top = 13
              Width = 23
              Height = 22
              Caption = '...'
            end
            object SpeedButton2: TSpeedButton
              Left = 550
              Top = 47
              Width = 23
              Height = 22
              Caption = '...'
            end
            object SpeedButton3: TSpeedButton
              Left = 550
              Top = 125
              Width = 23
              Height = 22
              Caption = '...'
            end
            object SpeedButton4: TSpeedButton
              Left = 550
              Top = 86
              Width = 23
              Height = 22
              Caption = '...'
            end
            object ComboBox1: TComboBox
              Left = 93
              Top = 13
              Width = 108
              Height = 21
              TabOrder = 0
              Items.Strings = (
                'Solteiro'
                'Casado'
                'Divorciado'
                'Viuvo'
                'Uni'#227'o est'#225'vel')
            end
            object edtCPFConjuge: TEdit
              Tag = 1
              Left = 93
              Top = 168
              Width = 108
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnKeyPress = EditPress
            end
            object cboCodigoPessoaPai: TDBLookupComboBox
              Left = 93
              Top = 48
              Width = 453
              Height = 21
              TabOrder = 2
            end
            object cboCodigoPessoaMae: TDBLookupComboBox
              Left = 93
              Top = 87
              Width = 453
              Height = 21
              TabOrder = 3
            end
            object cboCodigoPessoaConjuge: TDBLookupComboBox
              Left = 93
              Top = 125
              Width = 453
              Height = 21
              TabOrder = 4
            end
            object edtRenda: TEdit
              Tag = 1
              Left = 93
              Top = 208
              Width = 108
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              OnKeyPress = EditPress
            end
            object edtRendaFamiliar: TEdit
              Tag = 1
              Left = 93
              Top = 245
              Width = 108
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
              OnKeyPress = EditPress
            end
            object edtFilhos: TEdit
              Tag = 1
              Left = 269
              Top = 168
              Width = 57
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
              OnKeyPress = EditPress
            end
            object dateDataNascimento: TDateTimePicker
              Left = 93
              Top = 280
              Width = 108
              Height = 21
              Date = 41796.371892696760000000
              Time = 41796.371892696760000000
              TabOrder = 8
            end
            object DBLookupComboBox1: TDBLookupComboBox
              Left = 272
              Top = 14
              Width = 274
              Height = 21
              TabOrder = 9
            end
          end
          object TabSheet3: TTabSheet
            Caption = 'Endere'#231'o'
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
              Left = 9
              Top = 139
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
            object Endereco: TEdit
              Left = 105
              Top = 21
              Width = 408
              Height = 21
              MaxLength = 200
              TabOrder = 0
              OnKeyPress = EditPress
            end
            object Bairro: TEdit
              Left = 104
              Top = 58
              Width = 409
              Height = 21
              MaxLength = 30
              TabOrder = 1
              OnKeyPress = EditPress
            end
            object Municipio: TEdit
              Left = 104
              Top = 98
              Width = 232
              Height = 21
              MaxLength = 30
              TabOrder = 2
              OnKeyPress = EditPress
            end
            object UF: TComboBox
              Left = 105
              Top = 136
              Width = 73
              Height = 21
              MaxLength = 2
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
              MaxLength = 100
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
            OnShow = TabSheet4Show
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
            object Label16: TLabel
              Left = 339
              Top = 54
              Width = 62
              Height = 13
              Caption = 'Autorizado'
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
              Top = 50
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
            object cboAutorizado: TComboBox
              Left = 417
              Top = 50
              Width = 79
              Height = 21
              TabOrder = 3
              Items.Strings = (
                'SIM'
                'NAO')
            end
            object btnInserirContato: TButton
              Left = 2
              Top = 80
              Width = 75
              Height = 25
              Caption = 'Novo'
              TabOrder = 4
              OnClick = btnInserirContatoClick
            end
            object btnConfirmarContato: TButton
              Left = 93
              Top = 80
              Width = 75
              Height = 25
              Caption = 'Confirmar'
              TabOrder = 5
              OnClick = btnConfirmarContatoClick
            end
            object btnRemoverContato: TButton
              Left = 180
              Top = 80
              Width = 75
              Height = 25
              Caption = 'Remover'
              TabOrder = 6
              OnClick = btnRemoverContatoClick
            end
            object DBGrid2: TDBGrid
              Left = 0
              Top = 126
              Width = 736
              Height = 251
              Align = alBottom
              DataSource = srcContatos
              TabOrder = 7
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
                  Width = 362
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CPFContato'
                  Title.Caption = 'CPF'
                  Width = 116
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Telefone'
                  Width = 78
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Autorizado'
                  Visible = True
                end>
            end
          end
          object TabSheet5: TTabSheet
            Caption = 'Ve'#237'culos'
            OnShow = TabSheet5Show
            object Label17: TLabel
              Left = 6
              Top = 15
              Width = 41
              Height = 13
              Caption = 'Modelo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label18: TLabel
              Left = 6
              Top = 43
              Width = 30
              Height = 13
              Caption = 'Placa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label19: TLabel
              Left = 6
              Top = 74
              Width = 19
              Height = 13
              Caption = 'Cor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label20: TLabel
              Left = 6
              Top = 102
              Width = 22
              Height = 13
              Caption = 'Ano'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btnInserirVeiculo: TButton
              Left = 4
              Top = 126
              Width = 75
              Height = 25
              Caption = 'Novo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              OnClick = btnInserirVeiculoClick
            end
            object btnConfirmarVeiculo: TButton
              Left = 93
              Top = 126
              Width = 75
              Height = 25
              Caption = 'Confirmar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 5
              OnClick = btnConfirmarVeiculoClick
            end
            object btnRemoverVeiculo: TButton
              Left = 184
              Top = 126
              Width = 75
              Height = 25
              Caption = 'Remover'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 6
              OnClick = btnRemoverVeiculoClick
            end
            object cboCor: TComboBox
              Left = 80
              Top = 67
              Width = 127
              Height = 21
              TabOrder = 2
              Items.Strings = (
                'Preto'
                'Vermelho'
                'Prata'
                'Azul'
                'Branco'
                'Marrom'
                'Verde'
                'Amarelo')
            end
            object cboModelo: TComboBox
              Left = 81
              Top = 11
              Width = 127
              Height = 21
              TabOrder = 0
            end
            object DBGrid3: TDBGrid
              Left = 0
              Top = 168
              Width = 736
              Height = 209
              Align = alBottom
              DataSource = srcVeiculos
              TabOrder = 7
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnCellClick = DBGrid3CellClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'Data'
                  Width = 87
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Modelo'
                  Width = 162
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Placa'
                  Width = 91
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Cor'
                  Width = 106
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Ano'
                  Width = 88
                  Visible = True
                end>
            end
            object edtAno: TEdit
              Left = 80
              Top = 97
              Width = 127
              Height = 21
              TabOrder = 3
            end
            object edtPlaca: TEdit
              Left = 80
              Top = 38
              Width = 127
              Height = 21
              TabOrder = 1
            end
          end
          object TabSheet8: TTabSheet
            Caption = 'Hist'#243'rico'
            ImageIndex = 5
            OnShow = TabSheet8Show
            object Grid1: TDBGrid
              Left = 0
              Top = 0
              Width = 736
              Height = 145
              Align = alTop
              DataSource = srcOrcamento
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'Codigo'
                  Title.Caption = 'O.S.'
                  Width = 53
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Situacao'
                  Title.Caption = 'Situa'#231#227'o'
                  Width = 103
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Data'
                  Title.Caption = 'Emiss'#227'o'
                  Width = 79
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DataVencimento'
                  Title.Caption = 'Prazo'
                  Width = 86
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PrazoMedio'
                  Title.Caption = 'Prazo Medio'
                  Width = 66
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DataBaixa'
                  Title.Caption = 'Data Pagamento'
                  Width = 88
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PrazoStatus'
                  Title.Caption = 'Status'
                  Width = 75
                  Visible = True
                end>
            end
            object grdItens: TDBGrid
              Left = 0
              Top = 145
              Width = 736
              Height = 232
              Align = alClient
              DataSource = srcItensOrcamento
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'Ordem'
                  Title.Caption = 'Item'
                  Width = 38
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Descricao'
                  Width = 303
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Quantidade'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Valor'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Desconto'
                  Title.Caption = '%'
                  Width = 37
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Total'
                  Visible = True
                end>
            end
          end
          object TabSheet9: TTabSheet
            Caption = 'Formas de pagamentos'
            ImageIndex = 6
            OnShow = TabSheet9Show
            object SpeedButton5: TSpeedButton
              Left = 316
              Top = 22
              Width = 23
              Height = 22
              Caption = '...'
              OnClick = SpeedButton5Click
            end
            object DBGrid1: TDBGrid
              Left = 5
              Top = 54
              Width = 721
              Height = 297
              DataSource = srcFormaPagamentoCliente
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'Descricao'
                  Title.Caption = 'Descri'#231#227'o'
                  Width = 686
                  Visible = True
                end>
            end
            object cboFormPagamento: TDBLookupComboBox
              Left = 5
              Top = 23
              Width = 308
              Height = 21
              DropDownRows = 20
              TabOrder = 1
            end
            object Button1: TButton
              Left = 348
              Top = 20
              Width = 75
              Height = 25
              Caption = 'Adicionar'
              TabOrder = 2
              OnClick = Button1Click
            end
            object Button2: TButton
              Left = 429
              Top = 20
              Width = 75
              Height = 25
              Caption = 'Remover'
              TabOrder = 3
              OnClick = Button2Click
            end
          end
          object b: TTabSheet
            Caption = 'Notifica'#231#245'es'
            ImageIndex = 8
            OnShow = bShow
            object Label33: TLabel
              Left = 275
              Top = 307
              Width = 62
              Height = 13
              Caption = 'Frequ'#234'ncia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object Label34: TLabel
              Left = 599
              Top = 305
              Width = 24
              Height = 13
              Caption = 'Tipo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object Label35: TLabel
              Left = 360
              Top = 307
              Width = 38
              Height = 13
              Caption = 'A cada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object Label36: TLabel
              Left = 483
              Top = 306
              Width = 48
              Height = 13
              Caption = 'Validade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object Label37: TLabel
              Left = 21
              Top = 6
              Width = 33
              Height = 13
              Caption = 'Texto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBGrid4: TDBGrid
              Left = 20
              Top = 115
              Width = 693
              Height = 180
              DataSource = srcLembretes
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnCellClick = DBGrid4CellClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'Descricao'
                  Title.Caption = 'Descri'#231#227'o'
                  Width = 378
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TipoRepeticao'
                  Title.Caption = 'Tipo'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RepetirACada'
                  Title.Caption = 'Repetir'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UnidadeRepeticao'
                  Title.Caption = 'A cada'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Encerrado'
                  Visible = True
                end>
            end
            object memoDescricao: TMemo
              Left = 19
              Top = 22
              Width = 693
              Height = 55
              MaxLength = 500
              TabOrder = 1
            end
            object edtRepetirACada: TEdit
              Left = 271
              Top = 325
              Width = 63
              Height = 21
              TabOrder = 2
              Text = '1'
              Visible = False
            end
            object cboUnidadeRepeticao: TComboBox
              Left = 360
              Top = 325
              Width = 117
              Height = 21
              TabOrder = 3
              Visible = False
              Items.Strings = (
                'Hora'
                'Dia'
                'M'#234's')
            end
            object cboTipoRepeticao: TComboBox
              Left = 599
              Top = 324
              Width = 113
              Height = 21
              TabOrder = 4
              Visible = False
              Items.Strings = (
                'Diaria'
                'Semanal'
                'Mensal')
            end
            object Button3: TButton
              Left = 19
              Top = 84
              Width = 75
              Height = 25
              Caption = 'Novo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 5
              OnClick = Button3Click
            end
            object Button4: TButton
              Left = 110
              Top = 84
              Width = 75
              Height = 25
              Caption = 'Confirmar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 6
              OnClick = Button4Click
            end
            object Button5: TButton
              Left = 197
              Top = 84
              Width = 75
              Height = 25
              Caption = 'Remover'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 7
            end
            object chkEncerrado: TCheckBox
              Left = 71
              Top = 3
              Width = 97
              Height = 17
              Caption = 'Encerrado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 8
            end
            object dateData: TDateTimePicker
              Left = 483
              Top = 324
              Width = 97
              Height = 21
              Date = 41722.540775486110000000
              Time = 41722.540775486110000000
              TabOrder = 9
              Visible = False
            end
          end
        end
      end
    end
  end
  inherited Panel2: TPanel
    Width = 754
    ExplicitWidth = 754
    inherited btnInserir: TSpeedButton
      Left = 9
      ExplicitLeft = 9
    end
    inherited btnConfirmar: TSpeedButton
      Top = 1
      ExplicitTop = 1
    end
    inherited btnSair: TSpeedButton
      Left = 679
      ExplicitLeft = 679
    end
  end
  inherited srcEntidade: TDataSource
    Left = 152
    Top = 414
  end
  inherited srcPesquisa: TDataSource
    Left = 64
    Top = 414
  end
  inherited PopupRelatorio: TPopupMenu
    Left = 333
    Top = 298
  end
  object srcContatos: TDataSource
    AutoEdit = False
    Left = 240
    Top = 414
  end
  object srcVeiculos: TDataSource
    AutoEdit = False
    Left = 328
    Top = 414
  end
  object srcOrcamento: TDataSource
    AutoEdit = False
    OnDataChange = srcOrcamentoDataChange
    Left = 408
    Top = 414
  end
  object srcItensOrcamento: TDataSource
    AutoEdit = False
    Left = 504
    Top = 414
  end
  object srcFormaPagamentoCliente: TDataSource
    AutoEdit = False
    Left = 632
    Top = 414
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
  object ACBrConsultaCPF1: TACBrConsultaCPF
    ProxyPort = '8080'
    Left = 641
    Top = 274
  end
  object ACBrConsultaCNPJ1: TACBrConsultaCNPJ
    ProxyPort = '8080'
    PesquisarIBGE = False
    Left = 641
    Top = 330
  end
  object srcLembretes: TDataSource
    AutoEdit = False
    Left = 64
    Top = 366
  end
end
