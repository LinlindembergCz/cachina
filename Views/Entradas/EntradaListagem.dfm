inherited FormEntradaListagem: TFormEntradaListagem
  Caption = 'Entradas'
  ClientHeight = 514
  ClientWidth = 684
  Visible = False
  OnCreate = FormCreate
  ExplicitWidth = 700
  ExplicitHeight = 552
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 684
    Height = 129
    ExplicitWidth = 684
    ExplicitHeight = 129
    inherited SpeedButton2: TSpeedButton
      Left = 596
      Top = 101
      ExplicitLeft = 593
      ExplicitTop = 101
    end
    inherited btnSelecionar: TSpeedButton
      Left = 8
      Top = 101
      ExplicitLeft = 8
      ExplicitTop = 101
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 4
      Width = 665
      Height = 86
      Caption = 'Filtros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 29
        Width = 81
        Height = 13
        Caption = 'N'#186' Documento'
      end
      object Label2: TLabel
        Left = 191
        Top = 26
        Width = 43
        Height = 13
        Caption = 'Per'#237'odo'
      end
      object SpeedButton3: TSpeedButton
        Left = 479
        Top = 61
        Width = 80
        Height = 22
        Caption = 'Consultar'
        OnClick = SpeedButton3Click
      end
      object Label4: TLabel
        Left = 8
        Top = 62
        Width = 64
        Height = 13
        Caption = 'Fornecedor'
      end
      object edtDocumento: TEdit
        Left = 96
        Top = 22
        Width = 87
        Height = 21
        TabOrder = 0
      end
      object dateInicio: TDateTimePicker
        Left = 261
        Top = 22
        Width = 90
        Height = 22
        Cursor = crIBeam
        Date = 41709.544510381940000000
        Time = 41709.544510381940000000
        TabOrder = 2
      end
      object dateFim: TDateTimePicker
        Left = 372
        Top = 22
        Width = 101
        Height = 22
        Cursor = crIBeam
        Date = 41709.544510474540000000
        Time = 41709.544510474540000000
        TabOrder = 1
      end
      object edtFornecedor: TEdit
        Left = 96
        Top = 57
        Width = 377
        Height = 21
        TabOrder = 3
      end
    end
  end
  inherited Grid1: TDBGrid
    Top = 129
    Width = 684
    Height = 385
    OnDblClick = SpeedButton2Click
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Caption = 'Fornecedor'
        Width = 361
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NumeroDocumento'
        Title.Caption = 'N'#186' Documento'
        Width = 104
        Visible = True
      end>
  end
  inherited srcEntidade: TDataSource
    Left = 336
    Top = 230
  end
end
