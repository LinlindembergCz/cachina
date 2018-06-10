object FormParametrosDetalhes: TFormParametrosDetalhes
  Left = 0
  Top = 0
  Caption = 'Parametros do sistema'
  ClientHeight = 583
  ClientWidth = 728
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 728
    Height = 542
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 726
      Height = 540
      ActivePage = TabSheet5
      Align = alClient
      TabOrder = 0
      object TabSheet2: TTabSheet
        Caption = 'Venda'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label1: TLabel
          Left = 97
          Top = 20
          Width = 112
          Height = 13
          Caption = 'CFOP padr'#227'o de venda'
        end
        object Label2: TLabel
          Left = 10
          Top = 52
          Width = 199
          Height = 13
          Caption = 'CFOP padr'#227'o venda  para fora do estado'
        end
        object CFOPPADRAOVENDA: TComboBox
          Left = 213
          Top = 15
          Width = 148
          Height = 21
          MaxLength = 4
          TabOrder = 0
        end
        object CFOPPADRAOVENDAFORAESTADO: TComboBox
          Left = 213
          Top = 45
          Width = 148
          Height = 21
          MaxLength = 4
          TabOrder = 1
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Compra'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label3: TLabel
          Left = 114
          Top = 17
          Width = 117
          Height = 13
          Caption = 'CFOP padr'#227'o de compra'
        end
        object Label4: TLabel
          Left = 42
          Top = 47
          Width = 191
          Height = 13
          Caption = 'CFOP padr'#227'o compra de fora do estado'
        end
        object Label5: TLabel
          Left = 102
          Top = 74
          Width = 131
          Height = 13
          Caption = 'CFOP padr'#227'o de devolu'#231#227'o'
        end
        object Label6: TLabel
          Left = 3
          Top = 102
          Width = 230
          Height = 13
          Caption = 'CFOP padr'#227'o de devolu'#231#227'o para fora do estado'
        end
        object CFOPPADRAOCOMPRA: TComboBox
          Left = 237
          Top = 14
          Width = 148
          Height = 21
          MaxLength = 4
          TabOrder = 0
        end
        object CFOPPADRAOCOMPRAFORAESTADO: TComboBox
          Left = 237
          Top = 44
          Width = 148
          Height = 21
          MaxLength = 4
          TabOrder = 1
        end
        object CFOPPADRAODEVOLUCAO: TComboBox
          Left = 237
          Top = 69
          Width = 148
          Height = 21
          MaxLength = 4
          TabOrder = 2
        end
        object CFOPPADRAODEVOLUCAOFORAESTADO: TComboBox
          Left = 237
          Top = 96
          Width = 148
          Height = 21
          MaxLength = 4
          TabOrder = 3
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'Financeiro'
        ImageIndex = 3
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object TabSheet5: TTabSheet
        Caption = 'NFE/NFC'
        ImageIndex = 4
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object PageControl2: TPageControl
          Left = 0
          Top = 0
          Width = 718
          Height = 512
          ActivePage = TabSheet7
          Align = alClient
          MultiLine = True
          TabOrder = 0
          object TabSheet1: TTabSheet
            Caption = 'Certificado'
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object GroupBox2: TGroupBox
              Left = 3
              Top = 2
              Width = 265
              Height = 144
              Caption = 'Certificado'
              TabOrder = 0
              object Label7: TLabel
                Left = 8
                Top = 16
                Width = 41
                Height = 13
                Caption = 'Caminho'
              end
              object Label8: TLabel
                Left = 8
                Top = 56
                Width = 30
                Height = 13
                Caption = 'Senha'
              end
              object sbtnCaminhoCert: TSpeedButton
                Left = 235
                Top = 32
                Width = 23
                Height = 24
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000130B0000130B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
                  333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
                  0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                  07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
                  07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
                  0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
                  33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
                  B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
                  3BB33773333773333773B333333B3333333B7333333733333337}
                NumGlyphs = 2
                OnClick = sbtnCaminhoCertClick
              end
              object Label25: TLabel
                Left = 8
                Top = 96
                Width = 79
                Height = 13
                Caption = 'N'#250'mero de S'#233'rie'
              end
              object sbtnGetCert: TSpeedButton
                Left = 235
                Top = 110
                Width = 23
                Height = 24
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000130B0000130B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
                  333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
                  0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                  07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
                  07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
                  0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
                  33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
                  B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
                  3BB33773333773333773B333333B3333333B7333333733333337}
                NumGlyphs = 2
              end
              object edtCaminho: TEdit
                Left = 8
                Top = 32
                Width = 225
                Height = 21
                TabOrder = 0
              end
              object edtSenha: TEdit
                Left = 8
                Top = 72
                Width = 249
                Height = 21
                PasswordChar = '*'
                TabOrder = 1
              end
              object edtNumSerie: TEdit
                Left = 3
                Top = 115
                Width = 225
                Height = 21
                TabOrder = 2
              end
            end
          end
          object TabSheet6: TTabSheet
            Caption = 'Geral'
            ImageIndex = 1
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object Label44: TLabel
              Left = 156
              Top = 426
              Width = 53
              Height = 13
              Caption = 'Token/CSC'
            end
            object Label45: TLabel
              Left = 139
              Top = 402
              Width = 73
              Height = 13
              Caption = 'IdToken/IdCSC'
            end
            object Label46: TLabel
              Left = 11
              Top = 312
              Width = 119
              Height = 13
              Caption = 'Vers'#227'o Documento Fiscal'
            end
            object Label47: TLabel
              Left = 9
              Top = 287
              Width = 120
              Height = 13
              Caption = 'Modelo Documento Fiscal'
            end
            object Label48: TLabel
              Left = 9
              Top = 262
              Width = 86
              Height = 13
              Caption = 'Forma de Emiss'#227'o'
            end
            object Label49: TLabel
              Left = 9
              Top = 233
              Width = 72
              Height = 13
              Caption = 'Formato Alerta'
            end
            object Label54: TLabel
              Left = 14
              Top = 339
              Width = 66
              Height = 13
              Caption = 'SSL Crypt  Lib'
            end
            object Label55: TLabel
              Left = 103
              Top = 339
              Width = 60
              Height = 13
              Caption = 'SSL Http  Lib'
            end
            object Label56: TLabel
              Left = 196
              Top = 339
              Width = 33
              Height = 13
              Caption = 'SSL Lib'
            end
            object Label57: TLabel
              Left = 14
              Top = 379
              Width = 58
              Height = 13
              Caption = 'SSL XML  Lib'
            end
            object Label58: TLabel
              Left = 14
              Top = 419
              Width = 44
              Height = 13
              Caption = 'SSL Type'
            end
            object GroupBox3: TGroupBox
              Left = 1
              Top = -1
              Width = 265
              Height = 202
              Caption = 'Geral'
              TabOrder = 0
              object Label9: TLabel
                Left = 13
                Top = 136
                Width = 55
                Height = 13
                Caption = 'Logo Marca'
              end
              object sbtnLogoMarca: TSpeedButton
                Left = 240
                Top = 148
                Width = 23
                Height = 24
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000130B0000130B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
                  333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
                  0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                  07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
                  07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
                  0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
                  33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
                  B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
                  3BB33773333773333773B333333B3333333B7333333733333337}
                NumGlyphs = 2
                OnClick = sbtnLogoMarcaClick
              end
              object edtLogoMarca: TEdit
                Left = 13
                Top = 152
                Width = 228
                Height = 21
                TabOrder = 0
              end
              object ckSalvar: TCheckBox
                Left = 25
                Top = 179
                Width = 209
                Height = 15
                Caption = 'Salvar Arquivos de Envio e Resposta'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object rgTipoDanfe: TRadioGroup
                Left = 8
                Top = 16
                Width = 249
                Height = 49
                Caption = 'DANFE'
                Columns = 2
                ItemIndex = 0
                Items.Strings = (
                  'Retrato'
                  'Paisagem')
                TabOrder = 2
              end
              object rgFormaEmissao: TRadioGroup
                Left = 13
                Top = 73
                Width = 249
                Height = 63
                Caption = 'Forma de Emiss'#227'o'
                Columns = 3
                ItemIndex = 0
                Items.Strings = (
                  'Normal'
                  'Conting'#234'ncia'
                  'SCAN'
                  'DPEC'
                  'FSDA'
                  'SVCAN'
                  'SVCRS '
                  'SVCSP'
                  'OffLine')
                TabOrder = 3
              end
            end
            object cbxRetirarAcentos: TCheckBox
              Left = 9
              Top = 205
              Width = 89
              Height = 17
              Caption = 'Retirar Acentos'
              TabOrder = 1
            end
            object CheckBox1: TCheckBox
              Left = 104
              Top = 207
              Width = 159
              Height = 15
              Caption = 'Salvar Arquivos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object edtToken: TEdit
              Left = 219
              Top = 423
              Width = 61
              Height = 21
              TabOrder = 3
            end
            object edtIdToken: TEdit
              Left = 219
              Top = 397
              Width = 61
              Height = 21
              TabOrder = 4
            end
            object cbVersaoDF: TComboBox
              Left = 138
              Top = 309
              Width = 133
              Height = 21
              TabOrder = 5
            end
            object cbModeloDF: TComboBox
              Left = 138
              Top = 282
              Width = 134
              Height = 21
              TabOrder = 6
            end
            object cbFormaEmissao: TComboBox
              Left = 104
              Top = 255
              Width = 168
              Height = 21
              TabOrder = 7
            end
            object edtFormatoAlerta: TEdit
              Left = 104
              Top = 228
              Width = 168
              Height = 21
              TabOrder = 8
            end
            object cboSSLCryptLib: TComboBox
              Left = 12
              Top = 358
              Width = 86
              Height = 21
              TabOrder = 9
              Items.Strings = (
                'cryWinCrypt'
                'cryCapicom'
                'cryNone'
                'cryOpenSSL'
                'cryWinCrypt')
            end
            object cboSSLHTTPLib: TComboBox
              Left = 104
              Top = 358
              Width = 86
              Height = 21
              TabOrder = 10
              Items.Strings = (
                'httpIndy'
                'httpNone'
                'httpOpenSSL'
                'httpWinHttp'
                'httpWinINet')
            end
            object cboSSLLib: TComboBox
              Left = 198
              Top = 358
              Width = 86
              Height = 21
              TabOrder = 11
              Items.Strings = (
                'libCapicom'
                'libCapicomDelphiSoap'
                'libCustom'
                'libNone'
                'libOpenSSL'
                'libWinCrypt')
            end
            object cboSSLXMLLib: TComboBox
              Left = 14
              Top = 398
              Width = 86
              Height = 21
              TabOrder = 12
              Items.Strings = (
                'xsLibXml2'
                'xsMsXml'
                'xsMsXmlCapicom'
                'xsNone'
                'xsXmlSec')
            end
            object cboSSLType: TComboBox
              Left = 14
              Top = 438
              Width = 86
              Height = 21
              TabOrder = 13
              Items.Strings = (
                'LT_all'
                'LT_SSHv2'
                'LT_SSLv2'
                'LT_SSLv3'
                'LT_TLSv1'
                'LT_TLSv1_1'
                'LT_TLSv1_2')
            end
          end
          object TabSheet7: TTabSheet
            Caption = 'WebService'
            ImageIndex = 2
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object GroupBox4: TGroupBox
              Left = 0
              Top = 4
              Width = 265
              Height = 141
              Caption = 'WebService'
              TabOrder = 0
              object Label10: TLabel
                Left = 8
                Top = 16
                Width = 121
                Height = 13
                Caption = 'Selecione UF de Destino:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object ckxVisualizar: TCheckBox
                Left = 8
                Top = 118
                Width = 153
                Height = 17
                Caption = 'Visualizar Mensagem'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object cbUF: TComboBox
                Left = 8
                Top = 32
                Width = 249
                Height = 24
                Style = csDropDownList
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ItemIndex = 24
                ParentFont = False
                TabOrder = 1
                Text = 'SP'
                Items.Strings = (
                  'AC'
                  'AL'
                  'AP'
                  'AM'
                  'BA'
                  'CE'
                  'DF'
                  'ES'
                  'GO'
                  'MA'
                  'MT'
                  'MS'
                  'MG'
                  'PA'
                  'PB'
                  'PR'
                  'PE'
                  'PI'
                  'RJ'
                  'RN'
                  'RS'
                  'RO'
                  'RR'
                  'SC'
                  'SP'
                  'SE'
                  'TO')
              end
              object rgTipoAmb: TRadioGroup
                Left = 7
                Top = 61
                Width = 249
                Height = 52
                Caption = 'Selecione o Ambiente de Destino'
                Columns = 2
                ItemIndex = 0
                Items.Strings = (
                  'Produ'#231#227'o'
                  'Homologa'#231#227'o')
                TabOrder = 2
              end
              object cbxSalvarSOAP: TCheckBox
                Left = 127
                Top = 119
                Width = 135
                Height = 17
                Caption = 'Salvar envelope SOAP'
                TabOrder = 3
              end
            end
            object gbProxy: TGroupBox
              Left = 0
              Top = 152
              Width = 265
              Height = 105
              Caption = 'Proxy'
              TabOrder = 1
              object Label11: TLabel
                Left = 8
                Top = 16
                Width = 22
                Height = 13
                Caption = 'Host'
              end
              object Label12: TLabel
                Left = 208
                Top = 16
                Width = 26
                Height = 13
                Caption = 'Porta'
              end
              object Label13: TLabel
                Left = 8
                Top = 56
                Width = 36
                Height = 13
                Caption = 'Usu'#225'rio'
              end
              object Label14: TLabel
                Left = 138
                Top = 56
                Width = 30
                Height = 13
                Caption = 'Senha'
              end
              object edtProxyHost: TEdit
                Left = 8
                Top = 32
                Width = 193
                Height = 21
                TabOrder = 0
              end
              object edtProxyPorta: TEdit
                Left = 208
                Top = 32
                Width = 50
                Height = 21
                TabOrder = 1
              end
              object edtProxyUser: TEdit
                Left = 8
                Top = 72
                Width = 123
                Height = 21
                TabOrder = 2
              end
              object edtProxySenha: TEdit
                Left = 135
                Top = 72
                Width = 123
                Height = 21
                PasswordChar = '*'
                TabOrder = 3
              end
            end
            object gbxRetornoEnvio: TGroupBox
              Left = 1
              Top = 261
              Width = 265
              Height = 114
              Caption = 'Retorno de Envio de NFe'
              TabOrder = 2
              object Label50: TLabel
                Left = 102
                Top = 27
                Width = 51
                Height = 13
                Caption = 'Tentativas'
              end
              object Label51: TLabel
                Left = 7
                Top = 67
                Width = 44
                Height = 13
                Caption = 'Intervalo'
              end
              object Label52: TLabel
                Left = 8
                Top = 27
                Width = 45
                Height = 13
                Hint = 
                  'Aguardar quantos segundos para primeira consulta de retorno de e' +
                  'nvio'
                Caption = 'Aguardar'
              end
              object cbxAjustarAut: TCheckBox
                Left = 8
                Top = 12
                Width = 234
                Height = 17
                Caption = 'Ajustar Automaticamente prop. "Aguardar"'
                TabOrder = 0
              end
              object edtTentativas: TEdit
                Left = 102
                Top = 43
                Width = 85
                Height = 21
                TabOrder = 2
              end
              object edtIntervalo: TEdit
                Left = 7
                Top = 83
                Width = 85
                Height = 21
                TabOrder = 3
              end
              object edtAguardar: TEdit
                Left = 8
                Top = 43
                Width = 85
                Height = 21
                Hint = 
                  'Aguardar quantos segundos para primeira consulta de retorno de e' +
                  'nvio'
                TabOrder = 1
              end
            end
          end
          object TabSheet8: TTabSheet
            Caption = 'Emitente'
            ImageIndex = 3
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object Label15: TLabel
              Left = 8
              Top = 4
              Width = 25
              Height = 13
              Caption = 'CNPJ'
            end
            object Label16: TLabel
              Left = 136
              Top = 4
              Width = 43
              Height = 13
              Caption = 'Insc.Est.'
            end
            object Label17: TLabel
              Left = 8
              Top = 44
              Width = 60
              Height = 13
              Caption = 'Raz'#227'o Social'
            end
            object Label18: TLabel
              Left = 8
              Top = 84
              Width = 41
              Height = 13
              Caption = 'Fantasia'
            end
            object Label19: TLabel
              Left = 8
              Top = 164
              Width = 55
              Height = 13
              Caption = 'Logradouro'
            end
            object Label20: TLabel
              Left = 208
              Top = 164
              Width = 37
              Height = 13
              Caption = 'N'#250'mero'
            end
            object Label21: TLabel
              Left = 8
              Top = 204
              Width = 65
              Height = 13
              Caption = 'Complemento'
            end
            object Label22: TLabel
              Left = 136
              Top = 204
              Width = 28
              Height = 13
              Caption = 'Bairro'
            end
            object Label23: TLabel
              Left = 8
              Top = 244
              Width = 62
              Height = 13
              Caption = 'C'#243'd. Cidade '
            end
            object Label24: TLabel
              Left = 76
              Top = 244
              Width = 33
              Height = 13
              Caption = 'Cidade'
            end
            object Label26: TLabel
              Left = 225
              Top = 244
              Width = 13
              Height = 13
              Caption = 'UF'
            end
            object Label27: TLabel
              Left = 136
              Top = 124
              Width = 19
              Height = 13
              Caption = 'CEP'
            end
            object Label28: TLabel
              Left = 8
              Top = 124
              Width = 24
              Height = 13
              Caption = 'Fone'
            end
            object Label29: TLabel
              Left = 8
              Top = 282
              Width = 27
              Height = 13
              Caption = 'CNAE'
            end
            object edtEmitCNPJ: TEdit
              Left = 8
              Top = 19
              Width = 123
              Height = 21
              TabOrder = 0
            end
            object edtEmitIE: TEdit
              Left = 137
              Top = 20
              Width = 123
              Height = 21
              TabOrder = 1
            end
            object edtEmitRazao: TEdit
              Left = 8
              Top = 60
              Width = 252
              Height = 21
              TabOrder = 2
            end
            object edtEmitFantasia: TEdit
              Left = 8
              Top = 100
              Width = 252
              Height = 21
              TabOrder = 3
            end
            object edtEmitFone: TEdit
              Left = 8
              Top = 140
              Width = 125
              Height = 21
              TabOrder = 4
            end
            object edtEmitCEP: TEdit
              Left = 137
              Top = 140
              Width = 123
              Height = 21
              TabOrder = 5
            end
            object edtEmitLogradouro: TEdit
              Left = 8
              Top = 180
              Width = 196
              Height = 21
              TabOrder = 6
            end
            object edtEmitNumero: TEdit
              Left = 210
              Top = 180
              Width = 50
              Height = 21
              TabOrder = 7
            end
            object edtEmitComp: TEdit
              Left = 8
              Top = 220
              Width = 123
              Height = 21
              TabOrder = 8
            end
            object edtEmitBairro: TEdit
              Left = 137
              Top = 220
              Width = 123
              Height = 21
              TabOrder = 9
            end
            object edtEmitCodCidade: TEdit
              Left = 8
              Top = 260
              Width = 61
              Height = 21
              TabOrder = 10
            end
            object edtEmitCidade: TEdit
              Left = 76
              Top = 260
              Width = 142
              Height = 21
              TabOrder = 11
            end
            object edtEmitUF: TEdit
              Left = 225
              Top = 260
              Width = 35
              Height = 21
              TabOrder = 12
            end
            object edtCNAE: TEdit
              Left = 8
              Top = 299
              Width = 142
              Height = 21
              TabOrder = 13
            end
          end
          object TabSheet9: TTabSheet
            Caption = 'Email'
            ImageIndex = 4
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object GroupBox5: TGroupBox
              Left = 1
              Top = 4
              Width = 264
              Height = 324
              Caption = 'Email'
              TabOrder = 0
              object Label30: TLabel
                Left = 8
                Top = 16
                Width = 69
                Height = 13
                Caption = 'Servidor SMTP'
              end
              object Label31: TLabel
                Left = 206
                Top = 16
                Width = 26
                Height = 13
                Caption = 'Porta'
              end
              object Label32: TLabel
                Left = 8
                Top = 56
                Width = 36
                Height = 13
                Caption = 'Usu'#225'rio'
              end
              object Label33: TLabel
                Left = 137
                Top = 56
                Width = 30
                Height = 13
                Caption = 'Senha'
              end
              object Label34: TLabel
                Left = 8
                Top = 96
                Width = 122
                Height = 13
                Caption = 'Assunto do email enviado'
              end
              object Label35: TLabel
                Left = 8
                Top = 168
                Width = 93
                Height = 13
                Caption = 'Mensagem do Email'
              end
              object edtSmtpHost: TEdit
                Left = 8
                Top = 32
                Width = 193
                Height = 21
                TabOrder = 0
              end
              object edtSmtpPort: TEdit
                Left = 206
                Top = 32
                Width = 51
                Height = 21
                TabOrder = 1
              end
              object edtSmtpUser: TEdit
                Left = 8
                Top = 72
                Width = 120
                Height = 21
                TabOrder = 2
              end
              object edtSmtpPass: TEdit
                Left = 137
                Top = 72
                Width = 120
                Height = 21
                TabOrder = 3
              end
              object edtEmailAssunto: TEdit
                Left = 8
                Top = 112
                Width = 249
                Height = 21
                TabOrder = 4
              end
              object cbEmailSSL: TCheckBox
                Left = 10
                Top = 144
                Width = 167
                Height = 17
                Caption = 'SMTP exige conex'#227'o segura'
                TabOrder = 5
              end
              object mmEmailMsg: TMemo
                Left = 8
                Top = 184
                Width = 249
                Height = 130
                TabOrder = 6
              end
            end
          end
          object TabSheet13: TTabSheet
            Caption = 'Pastas'
            ImageIndex = 5
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object Label36: TLabel
              Left = 8
              Top = 0
              Width = 19
              Height = 13
              Caption = 'NFe'
            end
            object SpeedButton1: TSpeedButton
              Tag = 1
              Left = 238
              Top = 13
              Width = 23
              Height = 24
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
                333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
                0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
                07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
                0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
                33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
                B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
                3BB33773333773333773B333333B3333333B7333333733333337}
              NumGlyphs = 2
              OnClick = SpeedButton1Click
            end
            object Label37: TLabel
              Left = 8
              Top = 42
              Width = 68
              Height = 13
              Caption = 'Cancelamento'
            end
            object SpeedButton2: TSpeedButton
              Tag = 2
              Left = 235
              Top = 57
              Width = 23
              Height = 24
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
                333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
                0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
                07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
                0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
                33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
                B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
                3BB33773333773333773B333333B3333333B7333333733333337}
              NumGlyphs = 2
              OnClick = SpeedButton1Click
            end
            object Label38: TLabel
              Left = 8
              Top = 81
              Width = 26
              Height = 13
              Caption = 'DPEC'
            end
            object SpeedButton3: TSpeedButton
              Tag = 3
              Left = 235
              Top = 97
              Width = 23
              Height = 24
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
                333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
                0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
                07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
                0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
                33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
                B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
                3BB33773333773333773B333333B3333333B7333333733333337}
              NumGlyphs = 2
              OnClick = SpeedButton1Click
            end
            object Label39: TLabel
              Left = 8
              Top = 199
              Width = 54
              Height = 13
              Caption = 'Inutiliza'#231#227'o'
            end
            object SpeedButton4: TSpeedButton
              Tag = 6
              Left = 235
              Top = 215
              Width = 23
              Height = 24
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
                333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
                0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
                07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
                0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
                33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
                B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
                3BB33773333773333773B333333B3333333B7333333733333337}
              NumGlyphs = 2
              OnClick = SpeedButton1Click
            end
            object Label40: TLabel
              Left = 8
              Top = 160
              Width = 21
              Height = 13
              Caption = 'MDe'
            end
            object Label41: TLabel
              Left = 8
              Top = 121
              Width = 20
              Height = 13
              Caption = 'CCe'
            end
            object SpeedButton5: TSpeedButton
              Tag = 4
              Left = 235
              Top = 137
              Width = 23
              Height = 24
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
                333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
                0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
                07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
                0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
                33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
                B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
                3BB33773333773333773B333333B3333333B7333333733333337}
              NumGlyphs = 2
              OnClick = SpeedButton1Click
            end
            object SpeedButton6: TSpeedButton
              Tag = 5
              Left = 235
              Top = 176
              Width = 23
              Height = 24
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
                333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
                0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
                07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
                0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
                33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
                B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
                3BB33773333773333773B333333B3333333B7333333733333337}
              NumGlyphs = 2
              OnClick = SpeedButton1Click
            end
            object Label42: TLabel
              Left = 8
              Top = 242
              Width = 30
              Height = 13
              Caption = 'Salvar'
            end
            object SpeedButton7: TSpeedButton
              Tag = 7
              Left = 235
              Top = 258
              Width = 23
              Height = 24
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
                333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
                0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
                07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
                0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
                33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
                B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
                3BB33773333773333773B333333B3333333B7333333733333337}
              NumGlyphs = 2
              OnClick = SpeedButton1Click
            end
            object Label43: TLabel
              Left = 8
              Top = 283
              Width = 42
              Height = 13
              Caption = 'Schemas'
            end
            object SpeedButton8: TSpeedButton
              Tag = 8
              Left = 235
              Top = 297
              Width = 23
              Height = 24
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
                333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
                0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
                07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
                0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
                33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
                B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
                3BB33773333773333773B333333B3333333B7333333733333337}
              NumGlyphs = 2
              OnClick = SpeedButton1Click
            end
            object edtPathNfe: TEdit
              Left = 8
              Top = 16
              Width = 225
              Height = 21
              TabOrder = 0
            end
            object edtPathCancelamento: TEdit
              Left = 8
              Top = 58
              Width = 225
              Height = 21
              TabOrder = 1
            end
            object edtPathDPEC: TEdit
              Left = 8
              Top = 97
              Width = 225
              Height = 21
              TabOrder = 2
            end
            object edtPathInutilizacao: TEdit
              Left = 8
              Top = 215
              Width = 225
              Height = 21
              TabOrder = 3
            end
            object edtPathMDe: TEdit
              Left = 8
              Top = 176
              Width = 225
              Height = 21
              TabOrder = 4
            end
            object edtPathCCe: TEdit
              Left = 8
              Top = 137
              Width = 225
              Height = 21
              TabOrder = 5
            end
            object edtPathSalvar: TEdit
              Left = 8
              Top = 258
              Width = 225
              Height = 21
              TabOrder = 6
            end
            object edtPathSquemas: TEdit
              Left = 8
              Top = 299
              Width = 225
              Height = 21
              TabOrder = 7
            end
          end
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 728
    Height = 41
    Align = alTop
    TabOrder = 1
    object Button1: TButton
      Left = 7
      Top = 6
      Width = 86
      Height = 28
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*-nfe.XML'
    Filter = 
      'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|To' +
      'dos os Arquivos (*.*)|*.*'
    Title = 'Selecione a NFe'
    Left = 480
    Top = 336
  end
end
