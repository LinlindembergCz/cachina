object FormEmissorNFSe: TFormEmissorNFSe
  Left = 199
  Top = 124
  Caption = 'Emissor NFSe'
  ClientHeight = 530
  ClientWidth = 863
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 863
    Height = 530
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 297
    ExplicitWidth = 566
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 861
      Height = 168
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 564
      object btnImprimir: TButton
        Left = 376
        Top = 72
        Width = 177
        Height = 25
        Caption = 'Imprimir DANFSe'
        TabOrder = 7
        OnClick = btnImprimirClick
      end
      object btnConsultarLote: TButton
        Left = 192
        Top = 40
        Width = 177
        Height = 25
        Caption = 'Consultar Lote'
        TabOrder = 3
        OnClick = btnConsultarLoteClick
      end
      object btnCancNFSe: TButton
        Left = 192
        Top = 72
        Width = 177
        Height = 25
        Caption = 'Cancelar NFSe'
        TabOrder = 6
        OnClick = btnCancNFSeClick
      end
      object btnGerarEnviarLote: TButton
        Left = 192
        Top = 8
        Width = 177
        Height = 25
        Caption = 'Gerar e Enviar Lote'
        TabOrder = 1
        OnClick = btnGerarEnviarLoteClick
      end
      object btnGerarRPS: TButton
        Left = 8
        Top = 8
        Width = 177
        Height = 25
        Caption = 'Gerar RPS'
        TabOrder = 0
        OnClick = btnGerarRPSClick
      end
      object btnConsultarSitLote: TButton
        Left = 8
        Top = 40
        Width = 177
        Height = 25
        Caption = 'Consultar Situa'#231#227'o do Lote'
        TabOrder = 2
        OnClick = btnConsultarSitLoteClick
      end
      object btnConsultarNFSeRPS: TButton
        Left = 376
        Top = 40
        Width = 177
        Height = 25
        Caption = 'Consultar NFSe por RPS'
        TabOrder = 4
        OnClick = btnConsultarNFSeRPSClick
      end
      object btnConsultarNFSePeriodo: TButton
        Left = 8
        Top = 72
        Width = 177
        Height = 25
        Caption = 'Consultar NFSe por Per'#237'odo'
        TabOrder = 5
        OnClick = btnConsultarNFSePeriodoClick
      end
      object btnGerarEnviarNFSe: TButton
        Left = 376
        Top = 8
        Width = 177
        Height = 25
        Caption = 'Gerar e Enviar NFSe'
        TabOrder = 8
        OnClick = btnGerarEnviarNFSeClick
      end
      object btnEnviaremail: TButton
        Left = 8
        Top = 104
        Width = 177
        Height = 25
        Caption = 'Enviar e-mail'
        TabOrder = 9
      end
      object btnLinkNFSe: TButton
        Left = 191
        Top = 103
        Width = 177
        Height = 25
        Caption = 'Link NFSe'
        TabOrder = 10
        OnClick = btnLinkNFSeClick
      end
      object btnGerarLoteRPS: TButton
        Left = 376
        Top = 104
        Width = 177
        Height = 25
        Caption = 'Gerar Lote RPS'
        TabOrder = 11
        OnClick = btnGerarLoteRPSClick
      end
      object btnGerarEnviarSincrono: TButton
        Left = 8
        Top = 136
        Width = 177
        Height = 25
        Caption = 'Gerar e Enviar Lote - Sincrono'
        TabOrder = 12
        OnClick = btnGerarEnviarSincronoClick
      end
      object Button1: TButton
        Left = 192
        Top = 135
        Width = 361
        Height = 25
        Caption = 'Verifica se uma cidade '#233' atendida pelo componente ou n'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 13
        OnClick = Button1Click
      end
    end
    object PageControl2: TPageControl
      Left = 1
      Top = 169
      Width = 861
      Height = 360
      ActivePage = TabSheet5
      Align = alClient
      TabOrder = 1
      ExplicitWidth = 564
      object TabSheet5: TTabSheet
        Caption = 'Respostas'
        ExplicitWidth = 556
        object MemoResp: TMemo
          Left = 0
          Top = 0
          Width = 853
          Height = 332
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 556
        end
      end
      object TabSheet6: TTabSheet
        Caption = 'XML Resposta'
        ImageIndex = 1
        ExplicitWidth = 556
        object WBResposta: TWebBrowser
          Left = 0
          Top = 0
          Width = 853
          Height = 332
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 564
          ExplicitHeight = 368
          ControlData = {
            4C00000029580000502200000000000000000000000000000000000000000000
            000000004C000000000000000000000001000000E0D057007335CF11AE690800
            2B2E126208000000000000004C0000000114020000000000C000000000000046
            8000000000000000000000000000000000000000000000000000000000000000
            00000000000000000100000000000000000000000000000000000000}
        end
      end
      object TabSheet8: TTabSheet
        Caption = 'Log'
        ImageIndex = 2
        ExplicitWidth = 556
        object memoLog: TMemo
          Left = 0
          Top = 0
          Width = 853
          Height = 332
          Align = alClient
          ScrollBars = ssVertical
          TabOrder = 0
          ExplicitWidth = 556
        end
      end
      object TabSheet9: TTabSheet
        Caption = 'NFSe'
        ImageIndex = 3
        ExplicitWidth = 556
        object trvwNFSe: TTreeView
          Left = 0
          Top = 0
          Width = 853
          Height = 332
          Align = alClient
          Indent = 19
          TabOrder = 0
          ExplicitWidth = 556
        end
      end
      object TabSheet10: TTabSheet
        Caption = 'Retorno Completo WS'
        ImageIndex = 4
        ExplicitWidth = 556
        object memoRespWS: TMemo
          Left = 0
          Top = 0
          Width = 853
          Height = 332
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 556
        end
      end
      object Dados: TTabSheet
        Caption = 'Dados'
        ImageIndex = 5
        ExplicitWidth = 556
        object MemoDados: TMemo
          Left = 0
          Top = 0
          Width = 853
          Height = 332
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 556
        end
      end
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*-nfe.XML'
    Filter = 
      'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|To' +
      'dos os Arquivos (*.*)|*.*'
    Title = 'Selecione a NFe'
    Left = 552
    Top = 320
  end
  object ACBrNFSe1: TACBrNFSe
    OnStatusChange = ACBrNFSe1StatusChange
    Configuracoes.Geral.SSLLib = libNone
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpNone
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.CodigoMunicipio = 0
    Configuracoes.Geral.ConsultaLoteAposEnvio = False
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.Salvar = True
    Configuracoes.WebServices.QuebradeLinha = '|'
    Left = 392
    Top = 248
  end
end
