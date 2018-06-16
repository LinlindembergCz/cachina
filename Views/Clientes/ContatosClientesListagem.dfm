inherited FormContatosClientesListagem: TFormContatosClientesListagem
  BorderStyle = bsDialog
  Caption = 'Contatos'
  ClientHeight = 382
  ClientWidth = 650
  Visible = False
  OnActivate = FormActivate
  ExplicitWidth = 656
  ExplicitHeight = 410
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 650
    ExplicitWidth = 650
    inherited SpeedButton2: TSpeedButton
      Left = 562
      ExplicitLeft = 562
    end
    inherited btnSelecionar: TSpeedButton
      Left = 562
      Caption = 'Selecionar'
      ExplicitLeft = 562
    end
  end
  inherited Grid1: TDBGrid
    Width = 650
    Height = 309
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 532
        Visible = True
      end>
  end
end
