inherited FormSaidaListagem: TFormSaidaListagem
  Caption = 'Entradas'
  ClientHeight = 514
  ClientWidth = 681
  FormStyle = fsStayOnTop
  OnCreate = FormCreate
  ExplicitWidth = 697
  ExplicitHeight = 552
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 681
    Height = 129
    ExplicitWidth = 681
    ExplicitHeight = 129
    inherited SpeedButton2: TSpeedButton
      Left = 593
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
      Width = 573
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
        Top = 26
        Width = 43
        Height = 13
        Caption = 'Per'#237'odo'
      end
      object SpeedButton3: TSpeedButton
        Left = 320
        Top = 22
        Width = 80
        Height = 22
        Caption = 'Consultar'
        OnClick = SpeedButton3Click
      end
      object dateInicio: TDateTimePicker
        Left = 77
        Top = 22
        Width = 90
        Height = 22
        Cursor = crIBeam
        Date = 41709.544510381940000000
        Time = 41709.544510381940000000
        TabOrder = 1
      end
      object dateFim: TDateTimePicker
        Left = 188
        Top = 22
        Width = 101
        Height = 22
        Cursor = crIBeam
        Date = 41709.544510474540000000
        Time = 41709.544510474540000000
        TabOrder = 0
      end
    end
  end
  inherited Grid1: TDBGrid
    Top = 129
    Width = 681
    Height = 385
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Aplicacao'
        Title.Caption = 'Aplica'#231#227'o'
        Width = 361
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data'
        Width = 101
        Visible = True
      end>
  end
  inherited srcEntidade: TDataSource
    Left = 336
    Top = 230
  end
end
