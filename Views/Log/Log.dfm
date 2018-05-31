inherited FormLogListagem: TFormLogListagem
  Caption = 'Log'
  ClientWidth = 781
  OnCreate = FormCreate
  ExplicitWidth = 797
  ExplicitHeight = 518
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 781
    inherited SpeedButton2: TSpeedButton
      Left = 695
      Top = 8
      ExplicitLeft = 554
      ExplicitTop = 8
    end
    inherited btnSelecionar: TSpeedButton
      Left = 695
      Top = 33
      Visible = False
      ExplicitLeft = 554
      ExplicitTop = 33
    end
  end
  inherited Grid1: TDBGrid
    Width = 560
    Columns = <
      item
        Expanded = False
        FieldName = 'Data'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Modulo'
        Width = 154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 232
        Visible = True
      end>
  end
  object DBMemo1: TDBMemo [2]
    Left = 560
    Top = 73
    Width = 221
    Height = 407
    Align = alRight
    DataField = 'Descricao'
    DataSource = srcEntidade
    TabOrder = 2
  end
end
