object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'd'
  ClientHeight = 527
  ClientWidth = 874
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = True
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object CategoryButtons1: TCategoryButtons
    Left = 0
    Top = 0
    Width = 29
    Height = 527
    Align = alLeft
    BorderStyle = bsNone
    ButtonFlow = cbfVertical
    ButtonWidth = 100
    ButtonOptions = [boAllowReorder, boAllowCopyingButtons, boFullSize, boGradientFill, boShowCaptions, boVerticalCategoryCaptions, boUsePlusMinus, boCaptionOnlyBorder]
    Categories = <
      item
        Caption = 'Ger'#234'ncia'
        Color = 16771818
        Collapsed = False
        Items = <
          item
            Action = ActFuncionarios
          end
          item
            Action = ActClientes
          end
          item
            Action = ActFornecedores
          end
          item
            Action = ActTabelaPreco
          end>
        TextColor = clRed
      end
      item
        Caption = 'Estoque'
        Color = 15400959
        Collapsed = False
        Items = <
          item
            Action = ActFamilia
            Caption = 'Familia de produto'
          end
          item
            Action = ActGrupoProduto
          end
          item
            Action = ActSubGrupoProduto
          end
          item
            Action = ActProdutos
          end>
        TextColor = clRed
      end
      item
        Caption = 'Financeiro'
        Color = 15395839
        Collapsed = False
        Items = <
          item
            Action = ActFormaPagamentos
          end
          item
            Action = ActRecebimentos
          end
          item
            Action = ActPagamentos
          end>
        TextColor = clRed
      end
      item
        Caption = 'Movimenta'#231#227'o'
        Color = 16777194
        Collapsed = False
        Items = <
          item
            Action = ActEntrada
            Caption = 'Entradas'
          end
          item
            Action = ActOrcamentoPesquisa
          end>
        TextColor = clRed
      end>
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    RegularButtonColor = clWhite
    SelectedButtonColor = 15132390
    TabOrder = 0
    StyleElements = [seBorder]
    OnMouseLeave = CategoryButtons1MouseLeave
    OnMouseMove = CategoryButtons1MouseMove
  end
  object ActionList1: TActionList
    Left = 552
    Top = 216
    object ActFuncionarios: TAction
      Caption = 'Funcion'#225'rios'
      OnExecute = ActFuncionariosExecute
    end
    object ActClientes: TAction
      Caption = 'Clientes'
      OnExecute = ActClientesExecute
    end
    object ActFornecedores: TAction
      Caption = 'Fornecedores'
      OnExecute = ActFornecedoresExecute
    end
    object ActProdutos: TAction
      Caption = 'Produtos/Servi'#231'os'
      OnExecute = ActProdutosExecute
    end
    object ActOrcamento: TAction
      Caption = 'Or'#231'amento'
      OnExecute = ActOrcamentoExecute
    end
    object ActOrcamentoPesquisa: TAction
      Caption = 'Or'#231'amento'
      OnExecute = ActOrcamentoPesquisaExecute
    end
    object ActParametros: TAction
      Caption = 'Parametros de pre'#231'o'
      OnExecute = ActParametrosExecute
    end
    object ActMarcas: TAction
      Caption = 'Marcas'
      OnExecute = ActMarcasExecute
    end
    object ActModelos: TAction
      Caption = 'Modelos'
      OnExecute = ActModelosExecute
    end
    object ActFormaPagamentos: TAction
      Caption = 'Forma de pagamento'
      OnExecute = ActFormaPagamentosExecute
    end
    object ActFamilia: TAction
      Caption = 'Familia'
      OnExecute = ActFamiliaExecute
    end
    object ActGrupoProduto: TAction
      Caption = 'Grupo de Produto'
      OnExecute = ActGrupoProdutoExecute
    end
    object ActSubGrupoProduto: TAction
      Caption = 'SubGrupo de Produto'
      OnExecute = ActSubGrupoProdutoExecute
    end
    object ActClassificacaoCliente: TAction
      Caption = 'ActClassificacaoCliente'
      OnExecute = ActClassificacaoClienteExecute
    end
    object ActEntrada: TAction
      Caption = 'Entrada'
      OnExecute = ActEntradaExecute
    end
    object ActSaida: TAction
      Caption = 'Sa'#237'da'
      OnExecute = ActSaidaExecute
    end
    object ActPagamentos: TAction
      Tag = 11
      Caption = 'Pagamentos'
      OnExecute = ActPagamentosExecute
    end
    object ActRecebimentos: TAction
      Tag = 10
      Caption = 'Recebimentos'
      OnExecute = ActRecebimentosExecute
    end
    object ActCategorias: TAction
      Caption = 'Categorias'
      OnExecute = ActCategoriasExecute
    end
    object ActCaixa: TAction
      Caption = 'Caixas'
      OnExecute = ActCaixaExecute
    end
    object ActCaixaFinanceiro: TAction
      Caption = 'Caixa Financeiro'
      OnExecute = ActCaixaFinanceiroExecute
    end
    object ActPedido: TAction
      Caption = 'Pedidos a Fornecedor'
      OnExecute = ActPedidoExecute
    end
    object ActEmpresa: TAction
      Caption = 'Empresa'
      OnExecute = ActEmpresaExecute
    end
    object ActCentroCusto: TAction
      Caption = 'Centro de Custo'
      OnExecute = ActCentroCustoExecute
    end
    object ActCargo: TAction
      Caption = 'ActCargo'
      OnExecute = ActCargoExecute
    end
    object ActTabelaNCM: TAction
      Caption = 'ActTabelaNCM'
      OnExecute = ActTabelaNCMExecute
    end
    object ActTabelaNFSe: TAction
      Caption = 'ActTabelaNFSe'
      OnExecute = ActTabelaNFSeExecute
    end
    object ActUnidadeMedida: TAction
      Caption = 'Unidade'
      OnExecute = ActUnidadeMedidaExecute
    end
    object ActParametrosSistema: TAction
      Caption = 'ActParametrosSistema'
      OnExecute = ActParametrosSistemaExecute
    end
    object ActTabelaPreco: TAction
      Caption = 'Tabela de Pre'#231'o'
      OnExecute = ActTabelaPrecoExecute
    end
  end
  object MainMenu1: TMainMenu
    Left = 552
    Top = 152
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Empresa1: TMenuItem
        Action = ActEmpresa
      end
      object Funcionarios1: TMenuItem
        Action = ActFuncionarios
      end
      object Fornecedor1: TMenuItem
        Action = ActFornecedores
      end
      object Clientes1: TMenuItem
        Action = ActClientes
      end
      object abelas1: TMenuItem
        Caption = 'Tabelas'
        object Marcas1: TMenuItem
          Action = ActMarcas
        end
        object Modelos1: TMenuItem
          Action = ActModelos
        end
        object Familia1: TMenuItem
          Action = ActFamilia
        end
        object GrupodeProduto1: TMenuItem
          Action = ActGrupoProduto
        end
        object SubGrupodeProduto1: TMenuItem
          Action = ActSubGrupoProduto
        end
        object FormadePagamento1: TMenuItem
          Action = ActFormaPagamentos
        end
        object ParametrosPrecoVenda1: TMenuItem
          Action = ActParametros
        end
      end
      object Produtos1: TMenuItem
        Action = ActProdutos
      end
      object N2: TMenuItem
        Caption = '-'
      end
    end
    object Oramento1: TMenuItem
      Caption = 'Vendas'
      object Oramentopesquisa1: TMenuItem
        Action = ActOrcamentoPesquisa
      end
    end
    object Suprimentos1: TMenuItem
      Caption = 'Estoque'
      object Compras1: TMenuItem
        Caption = 'Compras'
        Enabled = False
        object Pedidosdecompr1: TMenuItem
          Action = ActPedido
        end
      end
      object Movimentao1: TMenuItem
        Caption = 'Movimenta'#231#227'o'
        object Entradas1: TMenuItem
          Action = ActEntrada
        end
        object ActSaida1: TMenuItem
          Action = ActSaida
        end
      end
    end
    object Financeiro1: TMenuItem
      Caption = 'Financeiro'
      object ActCategorias1: TMenuItem
        Action = ActCategorias
        Caption = 'Plano de Contas'
      end
      object ActCaixa1: TMenuItem
        Action = ActCaixa
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Pagamentos1: TMenuItem
        Action = ActPagamentos
        Caption = 'Contas a Pagar'
      end
      object Recebecimentos1: TMenuItem
        Action = ActRecebimentos
        Caption = 'Contas a Receber'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object CaixaFinanceiro1: TMenuItem
        Caption = 'Fluxo de Caixa'
        object Fluxodecaixa1: TMenuItem
          Caption = 'Movimento di'#225'rio'
          OnClick = Fluxodecaixa1Click
        end
        object Fluxodecaixa2: TMenuItem
          Caption = 'Demonstrativo mensal'
          OnClick = Fluxodecaixa2Click
        end
        object L1: TMenuItem
          Caption = 'Movimenta'#231#227'o Financeira'
          OnClick = ActCaixaFinanceiroExecute
        end
        object Balanocontbil2: TMenuItem
          Caption = 'Balan'#231'o cont'#225'bil'
          OnClick = Balanocontbil2Click
        end
      end
      object Indicadores1: TMenuItem
        Caption = 'Indicadores'
        OnClick = Indicadores1Click
      end
    end
    object Segurana1: TMenuItem
      Caption = 'Utilidades'
      object Acessos1: TMenuItem
        Caption = 'Permiss'#245'es de Acessos'
        OnClick = Acessos1Click
      end
      object Parametros1: TMenuItem
        Action = ActParametrosSistema
        Caption = 'Parametros'
      end
      object SequenciaNF1: TMenuItem
        Caption = 'Sequencias'
        OnClick = SequenciaNF1Click
      end
      object Log1: TMenuItem
        Caption = 'Log'
        OnClick = Log1Click
      end
    end
  end
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 552
    Top = 280
  end
end
