inherited FormPedidoListagem: TFormPedidoListagem
  Caption = 'FormPedidoListagem'
  OnCreate = FormCreate
  ExplicitWidth = 656
  ExplicitHeight = 518
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 97
    ExplicitHeight = 97
    inherited SpeedButton2: TSpeedButton
      Top = 63
      ExplicitTop = 63
    end
    inherited btnSelecionar: TSpeedButton
      Left = 8
      Top = 63
      OnClick = btnSelecionarClick
      ExplicitLeft = 8
      ExplicitTop = 63
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 4
      Width = 624
      Height = 53
      Caption = 'Filtros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label2: TLabel
        Left = 7
        Top = 28
        Width = 43
        Height = 13
        Caption = 'Per'#237'odo'
      end
      object SpeedButton3: TSpeedButton
        Left = 544
        Top = 18
        Width = 65
        Height = 22
        Caption = 'Consultar'
        OnClick = SpeedButton3Click
      end
      object Label4: TLabel
        Left = 272
        Top = 25
        Width = 64
        Height = 13
        Caption = 'Fornecedor'
      end
      object dateInicio: TDateTimePicker
        Left = 56
        Top = 19
        Width = 90
        Height = 22
        Cursor = crIBeam
        Date = 41709.544510381940000000
        Time = 41709.544510381940000000
        TabOrder = 1
      end
      object dateFim: TDateTimePicker
        Left = 167
        Top = 19
        Width = 101
        Height = 22
        Cursor = crIBeam
        Date = 41709.544510474540000000
        Time = 41709.544510474540000000
        TabOrder = 0
      end
      object edtFornecedor: TEdit
        Left = 342
        Top = 19
        Width = 196
        Height = 21
        TabOrder = 2
      end
    end
    object btnInserir: TButton
      Left = 94
      Top = 63
      Width = 80
      Height = 22
      Caption = 'Novo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnInserirClick
    end
    object btnAlterar: TButton
      Left = 180
      Top = 63
      Width = 80
      Height = 22
      Caption = 'Alterar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnAlterarClick
    end
  end
  inherited Grid1: TDBGrid
    Top = 97
    Height = 383
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 338
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Situacao'
        Width = 99
        Visible = True
      end>
  end
end
