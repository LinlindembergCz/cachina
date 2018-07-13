inherited FormEstabelecimentoDetalhes: TFormEstabelecimentoDetalhes
  Caption = 'FormEstabelecimentoDetalhes'
  ClientHeight = 504
  ClientWidth = 666
  Visible = False
  ExplicitWidth = 682
  ExplicitHeight = 542
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 666
    Height = 455
    ExplicitWidth = 666
    ExplicitHeight = 455
    inherited tabPrincipal: TPageControl
      Width = 664
      Height = 453
      ExplicitWidth = 664
      ExplicitHeight = 453
      inherited TabSheet1: TTabSheet
        ExplicitWidth = 656
        ExplicitHeight = 425
        inherited grdEntidade: TDBGrid
          Width = 656
          Height = 338
        end
        inherited pnlSuperior: TPanel
          Width = 656
          ExplicitWidth = 656
        end
        inherited pnlInferior: TPanel
          Top = 403
          Width = 656
          ExplicitTop = 403
          ExplicitWidth = 656
        end
      end
      inherited TabSheet2: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 630
        ExplicitHeight = 399
        object lbDescricao: TLabel
          Left = 8
          Top = 32
          Width = 46
          Height = 13
          Caption = 'Descricao'
        end
        object lbEndereco: TLabel
          Left = 8
          Top = 64
          Width = 45
          Height = 13
          Caption = 'Endereco'
        end
        object lbBairro: TLabel
          Left = 8
          Top = 96
          Width = 28
          Height = 13
          Caption = 'Bairro'
        end
        object lbMunicipio: TLabel
          Left = 8
          Top = 128
          Width = 43
          Height = 13
          Caption = 'Municipio'
        end
        object lbUF: TLabel
          Left = 8
          Top = 160
          Width = 13
          Height = 13
          Caption = 'UF'
        end
        object lbNumero: TLabel
          Left = 8
          Top = 192
          Width = 37
          Height = 13
          Caption = 'Numero'
        end
        object lbCNPJ: TLabel
          Left = 8
          Top = 224
          Width = 25
          Height = 13
          Caption = 'CNPJ'
        end
        object edtDescricao: TEdit
          Left = 88
          Top = 26
          Width = 433
          Height = 21
          TabOrder = 0
          OnKeyPress = EditPress
        end
        object edtEndereco: TEdit
          Left = 88
          Top = 58
          Width = 433
          Height = 21
          TabOrder = 1
          OnKeyPress = EditPress
        end
        object edtBairro: TEdit
          Left = 88
          Top = 90
          Width = 433
          Height = 21
          TabOrder = 2
          OnKeyPress = EditPress
        end
        object edtMunicipio: TEdit
          Left = 88
          Top = 122
          Width = 433
          Height = 21
          TabOrder = 3
          OnKeyPress = EditPress
        end
        object edtUF: TEdit
          Left = 88
          Top = 154
          Width = 33
          Height = 21
          TabOrder = 4
        end
        object edtNumero: TEdit
          Left = 88
          Top = 186
          Width = 129
          Height = 21
          TabOrder = 5
        end
        object edtCNPJ: TEdit
          Left = 88
          Top = 218
          Width = 129
          Height = 21
          TabOrder = 6
        end
      end
    end
  end
  inherited Panel2: TPanel
    Width = 666
    ExplicitWidth = 666
  end
  inherited srcEntidade: TDataSource
    Left = 120
    Top = 406
  end
  inherited srcPesquisa: TDataSource
    Top = 358
  end
end
