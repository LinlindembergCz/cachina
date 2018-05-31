object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 525
  ClientWidth = 1276
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRep1: TQuickRep
    Left = 8
    Top = 8
    Width = 3368
    Height = 794
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poLandscape
    Page.PaperSize = Custom
    Page.Continuous = False
    Page.Values = (
      10.000000000000000000
      2100.000000000000000000
      10.000000000000000000
      8910.000000000000000000
      10.000000000000000000
      10.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object PageHeaderBand1: TQRBand
      Left = 4
      Top = 4
      Width = 3360
      Height = 133
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        351.895833333333300000
        8890.000000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRLabel4: TQRLabel
        Left = 437
        Top = 52
        Width = 178
        Height = 20
        Size.Values = (
          52.916666666666670000
          1156.229166666667000000
          137.583333333333300000
          470.958333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Produ'#231#227'o - Detalhado'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRSysData1: TQRSysData
        Left = 867
        Top = 16
        Width = 68
        Height = 17
        Size.Values = (
          44.979166666666670000
          2293.937500000000000000
          42.333333333333330000
          179.916666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDateTime
        Transparent = False
        ExportAs = exptText
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 8
        Top = 104
        Width = 58
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          275.166666666666700000
          153.458333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QRLabel1'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText18: TQRDBText
        Left = 268
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          709.083333333333300000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '01'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText19: TQRDBText
        Left = 290
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          767.291666666666700000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '02'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText20: TQRDBText
        Left = 312
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          825.500000000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '03'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText21: TQRDBText
        Left = 334
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          883.708333333333300000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '04'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText22: TQRDBText
        Left = 356
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          941.916666666666700000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '05'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText23: TQRDBText
        Left = 378
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1000.125000000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '06'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText24: TQRDBText
        Left = 400
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1058.333333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '07'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText25: TQRDBText
        Left = 422
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1116.541666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '08'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText26: TQRDBText
        Left = 443
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1172.104166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '09'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText27: TQRDBText
        Left = 465
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1230.312500000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '10'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText28: TQRDBText
        Left = 487
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1288.520833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '11'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText29: TQRDBText
        Left = 509
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1346.729166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '12'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText30: TQRDBText
        Left = 531
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1404.937500000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '13'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText31: TQRDBText
        Left = 553
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1463.145833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '14'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText32: TQRDBText
        Left = 574
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1518.708333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '15'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText33: TQRDBText
        Left = 596
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1576.916666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '16'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText34: TQRDBText
        Left = 616
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1629.833333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '17'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText35: TQRDBText
        Left = 638
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1688.041666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '18'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText36: TQRDBText
        Left = 660
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1746.250000000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '19'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText37: TQRDBText
        Left = 682
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1804.458333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '20'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText38: TQRDBText
        Left = 704
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1862.666666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '21'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText39: TQRDBText
        Left = 726
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1920.875000000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '22'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText40: TQRDBText
        Left = 748
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1979.083333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '23'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText41: TQRDBText
        Left = 770
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2037.291666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '24'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText42: TQRDBText
        Left = 791
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2092.854166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '25'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText43: TQRDBText
        Left = 813
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2151.062500000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '26'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText44: TQRDBText
        Left = 835
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2209.270833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '27'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText45: TQRDBText
        Left = 857
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2267.479166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '28'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText46: TQRDBText
        Left = 879
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2325.687500000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '29'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText47: TQRDBText
        Left = 901
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2383.895833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '30'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText48: TQRDBText
        Left = 922
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2439.458333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '31'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText49: TQRDBText
        Left = 941
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2489.729166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '32'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText50: TQRDBText
        Left = 961
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2542.645833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '33'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText51: TQRDBText
        Left = 983
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2600.854166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '34'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText52: TQRDBText
        Left = 1005
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2659.062500000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '35'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText53: TQRDBText
        Left = 1027
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2717.270833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '36'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText54: TQRDBText
        Left = 1049
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2775.479166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '37'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText55: TQRDBText
        Left = 1070
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2831.041666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '38'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText56: TQRDBText
        Left = 1089
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2881.312500000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '39'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText57: TQRDBText
        Left = 1111
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2939.520833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '01'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText58: TQRDBText
        Left = 1133
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2997.729166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '02'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText59: TQRDBText
        Left = 1155
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          3055.937500000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '03'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText60: TQRDBText
        Left = 1177
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          3114.145833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '04'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText61: TQRDBText
        Left = 1199
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          3172.354166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '05'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText62: TQRDBText
        Left = 1221
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          3230.562500000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '06'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText63: TQRDBText
        Left = 1243
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          3288.770833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '07'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText64: TQRDBText
        Left = 1265
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          3346.979166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '08'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText65: TQRDBText
        Left = 1286
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          3402.541666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '09'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText66: TQRDBText
        Left = 1308
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          3460.750000000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '10'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText67: TQRDBText
        Left = 1330
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          3518.958333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '11'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText68: TQRDBText
        Left = 1352
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          3577.166666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '12'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText69: TQRDBText
        Left = 1374
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          3635.375000000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '13'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText70: TQRDBText
        Left = 1396
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          3693.583333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '14'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText71: TQRDBText
        Left = 1417
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          3749.145833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '15'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText72: TQRDBText
        Left = 1439
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          3807.354166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '16'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText73: TQRDBText
        Left = 1459
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          3860.270833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '17'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText74: TQRDBText
        Left = 1481
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          3918.479166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '18'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText75: TQRDBText
        Left = 1503
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          3976.687500000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '19'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText76: TQRDBText
        Left = 1525
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          4034.895833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '20'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText77: TQRDBText
        Left = 1547
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          4093.104166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '21'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText78: TQRDBText
        Left = 1569
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          4151.312500000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '22'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText79: TQRDBText
        Left = 1591
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          4209.520833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '23'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText80: TQRDBText
        Left = 1613
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          4267.729166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '24'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText81: TQRDBText
        Left = 1634
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          4323.291666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '25'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText82: TQRDBText
        Left = 1656
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          4381.500000000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '26'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText83: TQRDBText
        Left = 1678
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          4439.708333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '27'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText84: TQRDBText
        Left = 1700
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          4497.916666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '28'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText85: TQRDBText
        Left = 1722
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          4556.125000000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '29'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText86: TQRDBText
        Left = 1744
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          4614.333333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '30'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText87: TQRDBText
        Left = 1765
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          4669.895833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '31'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText88: TQRDBText
        Left = 1784
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          4720.166666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '32'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText89: TQRDBText
        Left = 1804
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          4773.083333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '33'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText90: TQRDBText
        Left = 1826
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          4831.291666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '34'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText91: TQRDBText
        Left = 1848
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          4889.500000000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '35'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText92: TQRDBText
        Left = 1870
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          4947.708333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '36'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText93: TQRDBText
        Left = 1892
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          5005.916666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '37'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText94: TQRDBText
        Left = 1913
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          5061.479166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '38'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText95: TQRDBText
        Left = 1935
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          5119.687500000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '39'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText96: TQRDBText
        Left = 268
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          709.083333333333300000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '01'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText97: TQRDBText
        Left = 290
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          767.291666666666700000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '02'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText98: TQRDBText
        Left = 312
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          825.500000000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '03'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText99: TQRDBText
        Left = 334
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          883.708333333333300000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '04'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText100: TQRDBText
        Left = 356
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          941.916666666666700000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '05'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText101: TQRDBText
        Left = 378
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1000.125000000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '06'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText102: TQRDBText
        Left = 400
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1058.333333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '07'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText103: TQRDBText
        Left = 422
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1116.541666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '08'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText104: TQRDBText
        Left = 443
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1172.104166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '09'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText105: TQRDBText
        Left = 465
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1230.312500000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '10'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText106: TQRDBText
        Left = 487
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1288.520833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '11'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText107: TQRDBText
        Left = 509
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1346.729166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '12'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText108: TQRDBText
        Left = 531
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1404.937500000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '13'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText109: TQRDBText
        Left = 553
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1463.145833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '14'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText110: TQRDBText
        Left = 574
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1518.708333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '15'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText111: TQRDBText
        Left = 596
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1576.916666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '16'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText112: TQRDBText
        Left = 616
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1629.833333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '17'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText113: TQRDBText
        Left = 638
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1688.041666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '18'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText114: TQRDBText
        Left = 660
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1746.250000000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '19'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText115: TQRDBText
        Left = 682
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1804.458333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '20'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText116: TQRDBText
        Left = 704
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1862.666666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '21'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText117: TQRDBText
        Left = 726
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1920.875000000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '22'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText118: TQRDBText
        Left = 748
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          1979.083333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '23'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText119: TQRDBText
        Left = 770
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2037.291666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '24'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText120: TQRDBText
        Left = 791
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2092.854166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '25'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText121: TQRDBText
        Left = 813
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2151.062500000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '26'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText122: TQRDBText
        Left = 835
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2209.270833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '27'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText123: TQRDBText
        Left = 857
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2267.479166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '28'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText124: TQRDBText
        Left = 879
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2325.687500000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '29'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText125: TQRDBText
        Left = 901
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2383.895833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '30'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText126: TQRDBText
        Left = 922
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2439.458333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '31'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText127: TQRDBText
        Left = 941
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2489.729166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '32'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText128: TQRDBText
        Left = 961
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2542.645833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '33'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText129: TQRDBText
        Left = 983
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2600.854166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '34'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText130: TQRDBText
        Left = 1005
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2659.062500000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '35'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText131: TQRDBText
        Left = 1027
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2717.270833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '36'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText132: TQRDBText
        Left = 1049
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2775.479166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '37'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText133: TQRDBText
        Left = 1070
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2831.041666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '38'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText134: TQRDBText
        Left = 1089
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          2881.312500000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '39'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText174: TQRDBText
        Left = 2800
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          7408.333333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '01'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText175: TQRDBText
        Left = 2822
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          7466.541666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '02'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText176: TQRDBText
        Left = 2844
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          7524.750000000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '03'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText177: TQRDBText
        Left = 2866
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          7582.958333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '04'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText178: TQRDBText
        Left = 2888
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          7641.166666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '05'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText179: TQRDBText
        Left = 2910
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          7699.375000000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '06'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText180: TQRDBText
        Left = 2932
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          7757.583333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '07'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText181: TQRDBText
        Left = 2954
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          7815.791666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '08'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText182: TQRDBText
        Left = 2975
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          7871.354166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '09'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText183: TQRDBText
        Left = 2997
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          7929.562500000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '10'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText184: TQRDBText
        Left = 3019
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          7987.770833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '11'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText185: TQRDBText
        Left = 3041
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          8045.979166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '12'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText186: TQRDBText
        Left = 3063
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          8104.187500000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '13'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText187: TQRDBText
        Left = 3085
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          8162.395833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '14'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText188: TQRDBText
        Left = 3106
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          8217.958333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '15'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText189: TQRDBText
        Left = 3128
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          8276.166666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '16'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText190: TQRDBText
        Left = 3148
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          8329.083333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '17'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText191: TQRDBText
        Left = 3170
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          8387.291666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '18'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText192: TQRDBText
        Left = 3192
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          8445.500000000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '19'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText193: TQRDBText
        Left = 3214
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          8503.708333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '20'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText213: TQRDBText
        Left = 1957
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          5177.895833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '01'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText214: TQRDBText
        Left = 1979
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          5236.104166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '02'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText215: TQRDBText
        Left = 2001
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          5294.312500000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '03'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText216: TQRDBText
        Left = 2023
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          5352.520833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '04'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText217: TQRDBText
        Left = 2045
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          5410.729166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '05'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText218: TQRDBText
        Left = 2067
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          5468.937500000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '06'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText219: TQRDBText
        Left = 2089
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          5527.145833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '07'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText220: TQRDBText
        Left = 2111
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          5585.354166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '08'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText221: TQRDBText
        Left = 2132
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          5640.916666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '09'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText222: TQRDBText
        Left = 2154
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          5699.125000000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '10'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText223: TQRDBText
        Left = 2176
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          5757.333333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '11'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText224: TQRDBText
        Left = 2198
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          5815.541666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '12'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText225: TQRDBText
        Left = 2220
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          5873.750000000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '13'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText226: TQRDBText
        Left = 2242
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          5931.958333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '14'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText227: TQRDBText
        Left = 2263
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          5987.520833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '15'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText228: TQRDBText
        Left = 2285
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          6045.729166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '16'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText229: TQRDBText
        Left = 2305
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          6098.645833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '17'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText230: TQRDBText
        Left = 2327
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          6156.854166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '18'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText231: TQRDBText
        Left = 2349
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          6215.062500000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '19'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText232: TQRDBText
        Left = 2371
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          6273.270833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '20'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText233: TQRDBText
        Left = 2393
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          6331.479166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '21'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText234: TQRDBText
        Left = 2415
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          6389.687500000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '22'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText235: TQRDBText
        Left = 2437
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          6447.895833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '23'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText236: TQRDBText
        Left = 2459
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          6506.104166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '24'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText237: TQRDBText
        Left = 2480
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          6561.666666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '25'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText238: TQRDBText
        Left = 2502
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          6619.875000000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '26'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText239: TQRDBText
        Left = 2524
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          6678.083333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '27'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText240: TQRDBText
        Left = 2546
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          6736.291666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '28'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText241: TQRDBText
        Left = 2568
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          6794.500000000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '29'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText242: TQRDBText
        Left = 2590
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          6852.708333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '30'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText243: TQRDBText
        Left = 2611
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          6908.270833333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '31'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText244: TQRDBText
        Left = 2630
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          6958.541666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '32'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText245: TQRDBText
        Left = 2650
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          7011.458333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '33'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText246: TQRDBText
        Left = 2672
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          7069.666666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '34'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText247: TQRDBText
        Left = 2694
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          7127.875000000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '35'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText248: TQRDBText
        Left = 2716
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          7186.083333333333000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '36'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText249: TQRDBText
        Left = 2738
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          7244.291666666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '37'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText250: TQRDBText
        Left = 2759
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          7299.854166666667000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '38'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText251: TQRDBText
        Left = 2778
        Top = 110
        Width = 16
        Height = 17
        Size.Values = (
          44.979166666666670000
          7350.125000000000000000
          291.041666666666700000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = '39'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
    end
    object QRBand1: TQRBand
      Left = 4
      Top = 137
      Width = 3360
      Height = 28
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        74.083333333333330000
        8890.000000000000000000)
      PreCaluculateBandHeight = True
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText135: TQRDBText
        Left = 4
        Top = 0
        Width = 259
        Height = 17
        Size.Values = (
          44.979166666666670000
          10.583333333333330000
          0.000000000000000000
          685.270833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataField = 'Atividade'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRShape1: TQRShape
        Left = 268
        Top = 1
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          709.083333333333300000
          2.645833333333333000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 290
        Top = 0
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          767.291666666666700000
          0.000000000000000000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 334
        Top = 0
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          883.708333333333300000
          0.000000000000000000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 312
        Top = 0
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          825.500000000000000000
          0.000000000000000000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape5: TQRShape
        Left = 422
        Top = -42
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          1116.541666666667000000
          -111.125000000000000000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 400
        Top = -42
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          1058.333333333333000000
          -111.125000000000000000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 378
        Top = 0
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          1000.125000000000000000
          0.000000000000000000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 356
        Top = 0
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          941.916666666666700000
          0.000000000000000000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 403
        Top = 0
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          1066.270833333333000000
          0.000000000000000000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape10: TQRShape
        Left = 425
        Top = 1
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          1124.479166666667000000
          2.645833333333333000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape11: TQRShape
        Left = 447
        Top = 1
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          1182.687500000000000000
          2.645833333333333000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape12: TQRShape
        Left = 469
        Top = 1
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          1240.895833333333000000
          2.645833333333333000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape13: TQRShape
        Left = 491
        Top = 1
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          1299.104166666667000000
          2.645833333333333000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape14: TQRShape
        Left = 513
        Top = 1
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          1357.312500000000000000
          2.645833333333333000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape15: TQRShape
        Left = 531
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          1404.937500000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape16: TQRShape
        Left = 553
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          1463.145833333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape17: TQRShape
        Left = 575
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          1521.354166666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape18: TQRShape
        Left = 597
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          1579.562500000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape19: TQRShape
        Left = 619
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          1637.770833333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape20: TQRShape
        Left = 641
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          1695.979166666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape21: TQRShape
        Left = 660
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          1746.250000000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape22: TQRShape
        Left = 682
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          1804.458333333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape23: TQRShape
        Left = 704
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          1862.666666666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape24: TQRShape
        Left = 726
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          1920.875000000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape25: TQRShape
        Left = 748
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          1979.083333333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape26: TQRShape
        Left = 770
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          2037.291666666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape27: TQRShape
        Left = 791
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          2092.854166666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape28: TQRShape
        Left = 813
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          2151.062500000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape29: TQRShape
        Left = 835
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          2209.270833333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape30: TQRShape
        Left = 857
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          2267.479166666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape31: TQRShape
        Left = 879
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          2325.687500000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape32: TQRShape
        Left = 904
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          2391.833333333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape33: TQRShape
        Left = 929
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          2457.979166666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape34: TQRShape
        Left = 952
        Top = 1
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          2518.833333333333000000
          2.645833333333333000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape35: TQRShape
        Left = 974
        Top = 1
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          2577.041666666667000000
          2.645833333333333000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape36: TQRShape
        Left = 996
        Top = 1
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          2635.250000000000000000
          2.645833333333333000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape37: TQRShape
        Left = 1018
        Top = 1
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          2693.458333333333000000
          2.645833333333333000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape38: TQRShape
        Left = 1040
        Top = 1
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          2751.666666666667000000
          2.645833333333333000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape39: TQRShape
        Left = 1058
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          2799.291666666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape40: TQRShape
        Left = 1080
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          2857.500000000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape41: TQRShape
        Left = 1102
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          2915.708333333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape42: TQRShape
        Left = 1124
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          2973.916666666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape43: TQRShape
        Left = 1146
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          3032.125000000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape44: TQRShape
        Left = 1168
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          3090.333333333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape45: TQRShape
        Left = 1193
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          3156.479166666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape46: TQRShape
        Left = 1215
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          3214.687500000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape47: TQRShape
        Left = 1237
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          3272.895833333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape48: TQRShape
        Left = 1259
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          3331.104166666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape49: TQRShape
        Left = 1281
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          3389.312500000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape50: TQRShape
        Left = 1303
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          3447.520833333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape51: TQRShape
        Left = 1324
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          3503.083333333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape52: TQRShape
        Left = 1346
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          3561.291666666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape53: TQRShape
        Left = 1368
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          3619.500000000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape54: TQRShape
        Left = 1390
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          3677.708333333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape55: TQRShape
        Left = 1409
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          3727.979166666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape56: TQRShape
        Left = 1431
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          3786.187500000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape57: TQRShape
        Left = 1453
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          3844.395833333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape58: TQRShape
        Left = 1475
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          3902.604166666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape59: TQRShape
        Left = 1497
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          3960.812500000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape60: TQRShape
        Left = 1519
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          4019.020833333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape61: TQRShape
        Left = 1540
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          4074.583333333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape62: TQRShape
        Left = 1562
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          4132.791666666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape63: TQRShape
        Left = 1584
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          4191.000000000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape64: TQRShape
        Left = 1606
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          4249.208333333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape65: TQRShape
        Left = 1628
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          4307.416666666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape66: TQRShape
        Left = 1653
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          4373.562500000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape67: TQRShape
        Left = 1678
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          4439.708333333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape68: TQRShape
        Left = 1701
        Top = 1
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          4500.562500000000000000
          2.645833333333333000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape69: TQRShape
        Left = 1723
        Top = 1
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          4558.770833333333000000
          2.645833333333333000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape70: TQRShape
        Left = 1745
        Top = 1
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          4616.979166666667000000
          2.645833333333333000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape71: TQRShape
        Left = 1767
        Top = 1
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          4675.187500000000000000
          2.645833333333333000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape72: TQRShape
        Left = 1789
        Top = 1
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          4733.395833333333000000
          2.645833333333333000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape73: TQRShape
        Left = 1807
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          4781.020833333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape74: TQRShape
        Left = 1829
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          4839.229166666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape75: TQRShape
        Left = 1851
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          4897.437500000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape76: TQRShape
        Left = 1873
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          4955.645833333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape77: TQRShape
        Left = 1895
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          5013.854166666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape78: TQRShape
        Left = 1917
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          5072.062500000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape79: TQRShape
        Left = 1942
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          5138.208333333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape80: TQRShape
        Left = 1964
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          5196.416666666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape81: TQRShape
        Left = 1986
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          5254.625000000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape82: TQRShape
        Left = 2008
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          5312.833333333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape83: TQRShape
        Left = 2030
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          5371.041666666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape84: TQRShape
        Left = 2052
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          5429.250000000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape85: TQRShape
        Left = 2800
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          7408.333333333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape86: TQRShape
        Left = 2778
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          7350.125000000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape87: TQRShape
        Left = 2756
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          7291.916666666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape88: TQRShape
        Left = 2734
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          7233.708333333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape89: TQRShape
        Left = 2712
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          7175.500000000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape90: TQRShape
        Left = 2690
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          7117.291666666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape91: TQRShape
        Left = 2665
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          7051.145833333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape92: TQRShape
        Left = 2643
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          6992.937500000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape93: TQRShape
        Left = 2621
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          6934.729166666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape94: TQRShape
        Left = 2599
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          6876.520833333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape95: TQRShape
        Left = 2577
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          6818.312500000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape96: TQRShape
        Left = 2555
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          6760.104166666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape97: TQRShape
        Left = 2537
        Top = 1
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          6712.479166666667000000
          2.645833333333333000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape98: TQRShape
        Left = 2515
        Top = 1
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          6654.270833333333000000
          2.645833333333333000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape99: TQRShape
        Left = 2493
        Top = 1
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          6596.062500000000000000
          2.645833333333333000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape100: TQRShape
        Left = 2471
        Top = 1
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          6537.854166666667000000
          2.645833333333333000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape101: TQRShape
        Left = 2449
        Top = 1
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          6479.645833333333000000
          2.645833333333333000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape102: TQRShape
        Left = 2426
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          6418.791666666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape103: TQRShape
        Left = 2401
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          6352.645833333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape104: TQRShape
        Left = 2376
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          6286.500000000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape105: TQRShape
        Left = 2354
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          6228.291666666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape106: TQRShape
        Left = 2332
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          6170.083333333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape107: TQRShape
        Left = 2310
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          6111.875000000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape108: TQRShape
        Left = 2288
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          6053.666666666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape109: TQRShape
        Left = 2267
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          5998.104166666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape110: TQRShape
        Left = 2245
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          5939.895833333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape111: TQRShape
        Left = 2223
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          5881.687500000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape112: TQRShape
        Left = 2201
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          5823.479166666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape113: TQRShape
        Left = 2179
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          5765.270833333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape114: TQRShape
        Left = 2157
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          5707.062500000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape115: TQRShape
        Left = 2138
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          5656.791666666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape116: TQRShape
        Left = 2116
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          5598.583333333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape117: TQRShape
        Left = 2094
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          5540.375000000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape118: TQRShape
        Left = 2072
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          5482.166666666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape119: TQRShape
        Left = 2822
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          7466.541666666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape120: TQRShape
        Left = 2847
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          7532.687500000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape121: TQRShape
        Left = 2872
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          7598.833333333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape122: TQRShape
        Left = 2895
        Top = 1
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          7659.687500000000000000
          2.645833333333333000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape123: TQRShape
        Left = 2917
        Top = 1
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          7717.895833333333000000
          2.645833333333333000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape124: TQRShape
        Left = 2939
        Top = 1
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          7776.104166666667000000
          2.645833333333333000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape125: TQRShape
        Left = 2961
        Top = 1
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          7834.312500000000000000
          2.645833333333333000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape126: TQRShape
        Left = 2983
        Top = 1
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          7892.520833333333000000
          2.645833333333333000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape127: TQRShape
        Left = 3001
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          7940.145833333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape128: TQRShape
        Left = 3023
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          7998.354166666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape129: TQRShape
        Left = 3045
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          8056.562500000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape130: TQRShape
        Left = 3067
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          8114.770833333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape131: TQRShape
        Left = 3089
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          8172.979166666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape132: TQRShape
        Left = 3111
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          8231.187500000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape133: TQRShape
        Left = 3136
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          8297.333333333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape134: TQRShape
        Left = 3158
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          8355.541666666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape135: TQRShape
        Left = 3180
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          8413.750000000000000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape136: TQRShape
        Left = 3202
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          8471.958333333333000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape137: TQRShape
        Left = 3224
        Top = 2
        Width = 16
        Height = 19
        Size.Values = (
          50.270833333333330000
          8530.166666666667000000
          5.291666666666667000
          42.333333333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
  end
end
