object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Mapper for delphi'
  ClientHeight = 547
  ClientWidth = 911
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 136
    Top = 9
    Width = 43
    Height = 13
    Caption = 'Attribute'
  end
  object Label2: TLabel
    Left = 286
    Top = 8
    Width = 24
    Height = 13
    Caption = 'Type'
  end
  object Label3: TLabel
    Left = 8
    Top = 8
    Width = 55
    Height = 13
    Caption = 'Class Name'
  end
  object Label7: TLabel
    Left = 384
    Top = 9
    Width = 19
    Height = 13
    Caption = 'Size'
  end
  object Label8: TLabel
    Left = 472
    Top = 9
    Width = 55
    Height = 13
    Caption = 'Component'
  end
  object Edit1: TEdit
    Left = 136
    Top = 28
    Width = 129
    Height = 21
    TabOrder = 0
  end
  object ComboBox1: TComboBox
    Left = 286
    Top = 27
    Width = 75
    Height = 21
    TabOrder = 1
    Items.Strings = (
      'string'
      'Integer'
      'boolean'
      'TDatetime'
      'Double')
  end
  object Button1: TButton
    Left = 439
    Top = 279
    Width = 80
    Height = 25
    Caption = 'Generate>>'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 828
    Top = 25
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 3
    OnClick = Button2Click
  end
  object ValueListEditor1: TValueListEditor
    Left = 8
    Top = 55
    Width = 425
    Height = 484
    TabOrder = 4
    TitleCaptions.Strings = (
      'Attribute'
      'Type')
    ColWidths = (
      91
      328)
  end
  object Edit2: TEdit
    Left = 8
    Top = 28
    Width = 113
    Height = 21
    TabOrder = 5
  end
  object edtSize: TEdit
    Left = 384
    Top = 28
    Width = 74
    Height = 21
    TabOrder = 6
  end
  object cboComponent: TComboBox
    Left = 472
    Top = 28
    Width = 108
    Height = 21
    TabOrder = 7
    OnChange = cboComponentChange
    Items.Strings = (
      'TEdit'
      'TCombobox'
      'TCheckBox'
      'TCalendar'
      'TCalendarEdit'
      'TMemo'
      '')
  end
  object edtItens: TEdit
    Left = 586
    Top = 28
    Width = 236
    Height = 21
    TabOrder = 8
  end
  object chkChave: TCheckBox
    Left = 208
    Top = 8
    Width = 57
    Height = 17
    Caption = 'Chave'
    TabOrder = 9
  end
  object PageControl1: TPageControl
    Left = 525
    Top = 56
    Width = 378
    Height = 483
    ActivePage = TabSheet4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    object TabSheet1: TTabSheet
      Caption = 'Class'
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 370
        Height = 455
        Align = alClient
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Create table'
      ImageIndex = 1
      object Memo2: TMemo
        Left = 0
        Top = 0
        Width = 370
        Height = 455
        Align = alClient
        TabOrder = 0
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Components'
      ImageIndex = 3
      object Memo4: TMemo
        Left = 0
        Top = 0
        Width = 370
        Height = 455
        Align = alClient
        TabOrder = 0
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Associate'
      ImageIndex = 2
      object Memo3: TMemo
        Left = 0
        Top = 0
        Width = 370
        Height = 455
        Align = alClient
        TabOrder = 0
      end
    end
  end
  object radFMX: TRadioButton
    Left = 439
    Top = 208
    Width = 71
    Height = 17
    Caption = 'Firemonkey'
    TabOrder = 11
  end
  object radVCL: TRadioButton
    Left = 439
    Top = 231
    Width = 71
    Height = 17
    Caption = 'VCL'
    TabOrder = 12
  end
end
