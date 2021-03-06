object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Ama psicologia'
  ClientHeight = 513
  ClientWidth = 757
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 0
    Width = 757
    Height = 513
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 376
    ExplicitTop = 80
    ExplicitWidth = 300
    ExplicitHeight = 150
    ControlData = {
      4C0000003D4E0000053500000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object ActionList1: TActionList
    Left = 384
    Top = 176
    object ActTipoAgendamento: TAction
      Caption = 'ActTipoAgendamento'
      OnExecute = ActTipoAgendamentoExecute
    end
    object ActPaciente: TAction
      Caption = 'Paciente'
      OnExecute = ActPacienteExecute
    end
    object ActAgendamento: TAction
      Caption = 'Agendamento'
      OnExecute = ActAgendamentoExecute
    end
    object ActConvenio: TAction
      Caption = 'Convenio'
      OnExecute = ActConvenioExecute
    end
    object ActEspecialista: TAction
      Caption = 'Especialista'
      OnExecute = ActEspecialistaExecute
    end
    object ActPacientePesquisa: TAction
      Caption = 'ActPacientePesquisa'
      OnExecute = ActPacientePesquisaExecute
    end
    object ActAgendaPesquisa: TAction
      Caption = 'ActAgendaPesquisa'
      OnExecute = ActAgendaPesquisaExecute
    end
    object ActAgendaRecorrencia: TAction
      Caption = 'ActAgendaRecorrencia'
      OnExecute = ActAgendaRecorrenciaExecute
    end
    object ActFamilia: TAction
      Caption = 'ActFamilia'
      OnExecute = ActFamiliaExecute
    end
    object Actgrupoproduto: TAction
      Caption = 'Actgrupoproduto'
      OnExecute = ActgrupoprodutoExecute
    end
    object ActSubgrupoProduto: TAction
      Caption = 'ActSubgrupoProduto'
      OnExecute = ActSubgrupoProdutoExecute
    end
    object ActFornecedor: TAction
      Caption = 'ActFornecedor'
      OnExecute = ActFornecedorExecute
    end
    object ActProdutos: TAction
      Caption = 'Produtos'
      OnExecute = ActProdutosExecute
    end
    object ActEntrada: TAction
      Caption = 'Entrada'
      OnExecute = ActEntradaExecute
    end
    object ActSaida: TAction
      Caption = 'Sa'#237'da'
      OnExecute = ActSaidaExecute
    end
    object ActFormaPagamentos: TAction
      Caption = 'ActFormaPagamentos'
      OnExecute = ActFormaPagamentosExecute
    end
    object ActPagamento: TAction
      Caption = 'Pagamentos'
      OnExecute = ActPagamentoExecute
    end
    object ActRecebimento: TAction
      Caption = 'Recebimentos'
      OnExecute = ActRecebimentoExecute
    end
    object ActCategoria: TAction
      Caption = 'Categorias'
      OnExecute = ActCategoriaExecute
    end
    object ActCaixa: TAction
      Caption = 'Caixa'
      OnExecute = ActCaixaExecute
    end
    object ActEstabelecimento: TAction
      Caption = 'Estabelecimento'
      OnExecute = ActEstabelecimentoExecute
    end
    object ActTabelaCID: TAction
      Caption = 'ActTabelaCID'
      OnExecute = ActTabelaCIDExecute
    end
    object ActFornecedores: TAction
      Caption = 'ActFornecedores'
    end
    object ActCategorias: TAction
      Caption = 'ActCategorias'
    end
    object ActCentroCusto: TAction
      Caption = 'ActCentroCusto'
    end
    object ActTabelaNCM: TAction
      Caption = 'ActTabelaNCM'
    end
    object ActTabelaNFSe: TAction
      Caption = 'ActTabelaNFSe'
    end
    object ActUnidadeMedida: TAction
      Caption = 'ActUnidadeMedida'
    end
  end
  object MainMenu1: TMainMenu
    Left = 304
    Top = 176
    object MenuItem7: TMenuItem
      Caption = 'Arquivo'
      object Estabelecimento1: TMenuItem
        Action = ActEstabelecimento
      end
      object Especialista1: TMenuItem
        Action = ActEspecialista
      end
      object MenuItem1: TMenuItem
        Caption = 'Paciente'
        OnClick = ActPacienteExecute
      end
      object Fornecedor1: TMenuItem
        Action = ActFornecedor
        Caption = 'Fornecedores'
      end
    end
    object MenuItem3: TMenuItem
      Caption = 'Agendamento'
      OnClick = ActAgendamentoExecute
    end
    object Suprimentos1: TMenuItem
      Caption = 'Estoque'
      object ActProdutos1: TMenuItem
        Action = ActProdutos
      end
      object ActEntrada1: TMenuItem
        Action = ActEntrada
      end
      object ActSaida1: TMenuItem
        Action = ActSaida
      end
    end
    object Financeiro1: TMenuItem
      Caption = 'Financeiro'
      object ActCategoria1: TMenuItem
        Action = ActCategoria
      end
      object ActCaixa1: TMenuItem
        Action = ActCaixa
      end
      object ActPagamento1: TMenuItem
        Action = ActPagamento
      end
      object ActRecebimento1: TMenuItem
        Action = ActRecebimento
      end
    end
    object Faturamento1: TMenuItem
      Caption = 'Faturamento'
      object SPSADT1: TMenuItem
        Caption = 'Guia SADT'
        OnClick = SPSADT1Click
      end
    end
    object MenuItem6: TMenuItem
      Caption = 'Sair'
      OnClick = MenuItem6Click
    end
  end
end
