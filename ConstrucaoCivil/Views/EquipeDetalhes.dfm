inherited FormEquipeDetalhes: TFormEquipeDetalhes
  Caption = 'Equipes'
  ClientHeight = 533
  ClientWidth = 841
  ExplicitWidth = 857
  ExplicitHeight = 571
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 841
    Height = 484
    ExplicitWidth = 798
    ExplicitHeight = 484
    inherited tabPrincipal: TPageControl
      Width = 839
      Height = 482
      ExplicitWidth = 796
      ExplicitHeight = 482
      inherited TabSheet1: TTabSheet
        ExplicitWidth = 903
        ExplicitHeight = 454
        inherited grdEntidade: TDBGrid
          Width = 831
          Height = 367
          OnDrawColumnCell = grdEntidadeDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'Descricao'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 216
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Responsavel'
              Title.Caption = 'Respons'#225'vel'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 378
              Visible = True
            end>
        end
        inherited pnlSuperior: TPanel
          Width = 831
          ExplicitWidth = 903
          inherited grpPesquisa: TGroupBox
            Height = 49
            ExplicitHeight = 49
            inherited edtValorPesquisa: TEdit
              Top = 17
              ExplicitTop = 17
            end
          end
        end
        inherited pnlInferior: TPanel
          Top = 432
          Width = 831
          ExplicitTop = 432
          ExplicitWidth = 903
        end
      end
      inherited TabSheet2: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 788
        ExplicitHeight = 454
        object Label1: TLabel
          Left = 12
          Top = 12
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
          Left = 12
          Top = 62
          Width = 65
          Height = 13
          Caption = 'Funcion'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton1: TSpeedButton
          Left = 517
          Top = 79
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = SpeedButton1Click
        end
        object Label3: TLabel
          Left = 207
          Top = 14
          Width = 113
          Height = 13
          Caption = 'Gestor Respons'#225'vel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtDescricao: TEdit
          Left = 12
          Top = 31
          Width = 189
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
        end
        object DBGrid1: TDBGrid
          Left = 12
          Top = 112
          Width = 581
          Height = 308
          DataSource = srcItemEquipe
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = DBGrid1CellClick
          Columns = <
            item
              Expanded = False
              FieldName = 'Nome'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 114
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescricaoCargo'
              Title.Caption = 'Cargo'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 104
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Participacao'
              Title.Caption = '% Te'#243'rica'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Gratificacao'
              Title.Caption = 'Gratifica'#231#227'o'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 77
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TipoGratificacao'
              PickList.Strings = (
                'Fixo'
                'Por Servi'#231'o')
              Title.Caption = 'Tipo de Gratifica'#231#227'o'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 126
              Visible = True
            end
            item
              Expanded = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Title.Caption = '%Real'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 52
              Visible = True
            end>
        end
        object Button1: TButton
          Left = 599
          Top = 78
          Width = 75
          Height = 25
          Caption = 'Confirmar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 677
          Top = 78
          Width = 75
          Height = 25
          Caption = 'Remover'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = Button2Click
        end
        object cboCodigoFuncionario: TDBLookupComboBox
          Left = 12
          Top = 78
          Width = 499
          Height = 21
          DropDownRows = 20
          TabOrder = 4
        end
        object DBGrid2: TDBGrid
          Left = 599
          Top = 112
          Width = 225
          Height = 308
          DataSource = srgCargos
          TabOrder = 5
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = DBGrid1CellClick
          Columns = <
            item
              Expanded = False
              FieldName = 'Descricao'
              Title.Caption = 'Cargo'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 134
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Quantidade'
              Title.Caption = 'Qtd.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 40
              Visible = True
            end>
        end
        object chkAtiva: TCheckBox
          Left = 650
          Top = 33
          Width = 55
          Height = 17
          Caption = 'Ativa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
        end
        object cboResponsavel: TComboBox
          Left = 208
          Top = 32
          Width = 425
          Height = 21
          TabOrder = 7
        end
        object Button3: TButton
          Left = 10
          Top = 426
          Width = 75
          Height = 25
          Caption = 'Duplicar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          OnClick = Button3Click
        end
      end
    end
  end
  inherited Panel2: TPanel
    Width = 841
    ExplicitWidth = 798
  end
  inherited srcEntidade: TDataSource
    Left = 120
    Top = 302
  end
  object srcItemEquipe: TDataSource
    Left = 120
    Top = 360
  end
  object srgCargos: TDataSource
    Left = 504
    Top = 352
  end
end
