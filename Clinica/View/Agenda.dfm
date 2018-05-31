inherited TemplateFormComTabDetalhes1: TTemplateFormComTabDetalhes1
  Caption = 'Agendamento'
  ClientHeight = 541
  ClientWidth = 1004
  ExplicitWidth = 1020
  ExplicitHeight = 579
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1004
    Height = 492
    inherited tabPrincipal: TPageControl
      Width = 1002
      Height = 490
      ExplicitWidth = 1002
      ExplicitHeight = 490
      inherited TabSheet1: TTabSheet
        Caption = 'Agendamento'
        ExplicitLeft = 8
        ExplicitTop = 16
        ExplicitWidth = 994
        ExplicitHeight = 462
        object lbPsicologo: TLabel
          Left = 2
          Top = 20
          Width = 72
          Height = 13
          Caption = 'Respons'#225'vel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbNomePaciente: TLabel
          Left = 2
          Top = 238
          Width = 49
          Height = 13
          Caption = 'Paciente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton1: TSpeedButton
          Left = 291
          Top = 233
          Width = 24
          Height = 22
          Anchors = [akTop, akRight]
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbCodigoConvenio: TLabel
          Left = 3
          Top = 274
          Width = 52
          Height = 13
          Caption = 'Conv'#234'nio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton2: TSpeedButton
          Left = 291
          Top = 267
          Width = 24
          Height = 22
          Anchors = [akTop, akRight]
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbCodigoTipoAgendamento: TLabel
          Left = 3
          Top = 307
          Width = 79
          Height = 13
          Caption = 'Procedimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton3: TSpeedButton
          Left = 291
          Top = 300
          Width = 24
          Height = 22
          Anchors = [akTop, akRight]
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel
          Left = 3
          Top = 339
          Width = 27
          Height = 13
          Caption = 'Hora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbData: TLabel
          Left = 328
          Top = -4
          Width = 261
          Height = 19
          Anchors = [akTop, akRight]
          Caption = 'Ter'#231'a-feira, 4 de mar'#231'o de 2014'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object cboEspecialista: TComboBox
          Left = 88
          Top = 16
          Width = 227
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DropDownCount = 20
          TabOrder = 0
        end
        object cboPaciente: TComboBox
          Left = 88
          Top = 233
          Width = 191
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DropDownCount = 16
          TabOrder = 1
        end
        object cboCodigoConvenio: TComboBox
          Left = 88
          Top = 267
          Width = 192
          Height = 21
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
        object cboCodigoTipoAgendamento: TComboBox
          Left = 88
          Top = 300
          Width = 192
          Height = 21
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
        end
        object dateData: TMonthCalendar
          Left = 88
          Top = 41
          Width = 227
          Height = 186
          Align = alCustom
          Anchors = [akRight]
          Date = 41722.816839270830000000
          DoubleBuffered = False
          MaxSelectRange = 30
          ParentDoubleBuffered = False
          ShowTodayCircle = False
          TabOrder = 4
        end
        object Edit1: TEdit
          Left = 88
          Top = 336
          Width = 57
          Height = 21
          TabOrder = 5
        end
        object StringGrid1: TDBGrid
          Left = 335
          Top = 20
          Width = 656
          Height = 439
          DataSource = srcEntidade
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 6
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'Hora'
              Width = 56
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Paciente'
              Width = 195
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescricaoTipoAgendamento'
              Title.Caption = 'Procedimento'
              Width = 133
              Visible = True
            end>
        end
      end
    end
  end
  inherited Panel2: TPanel
    Width = 1004
  end
end
