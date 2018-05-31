object FormRelMovimentacaoCaixaFinanceiro: TFormRelMovimentacaoCaixaFinanceiro
  Left = 0
  Top = 0
  Caption = 'FormRelMovimentacaoCaixaFinanceiro'
  ClientHeight = 436
  ClientWidth = 1110
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRep1: TQuickRep
    Left = 16
    Top = 12
    Width = 1123
    Height = 794
    DataSet = cdsMovimentacaoCaixaFinanceiro
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
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      100.000000000000000000
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
    object DetailBand1: TQRBand
      Left = 38
      Top = 161
      Width = 1047
      Height = 21
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        55.562500000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = True
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 4
        Top = 1
        Width = 28
        Height = 17
        Size.Values = (
          44.979166666666670000
          10.583333333333330000
          2.645833333333333000
          74.083333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = cdsMovimentacaoCaixaFinanceiro
        DataField = 'Data'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 101
        Top = 3
        Width = 340
        Height = 17
        Size.Values = (
          44.979166666666670000
          267.229166666666700000
          7.937500000000000000
          899.583333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = cdsMovimentacaoCaixaFinanceiro
        DataField = 'Descricao'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 447
        Top = 3
        Width = 72
        Height = 17
        Size.Values = (
          44.979166666666670000
          1182.687500000000000000
          7.937500000000000000
          190.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = cdsMovimentacaoCaixaFinanceiro
        DataField = 'ValorCredito'
        Mask = ',0.00;'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 530
        Top = 3
        Width = 68
        Height = 17
        Size.Values = (
          44.979166666666670000
          1402.291666666667000000
          7.937500000000000000
          179.916666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = cdsMovimentacaoCaixaFinanceiro
        DataField = 'ValorDebito'
        Mask = ',0.00;'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 609
        Top = 1
        Width = 34
        Height = 17
        Size.Values = (
          44.979166666666670000
          1611.312500000000000000
          2.645833333333333000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = cdsMovimentacaoCaixaFinanceiro
        DataField = 'Saldo'
        Mask = ',0.00;'
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText6: TQRDBText
        Left = 719
        Top = 1
        Width = 218
        Height = 17
        Size.Values = (
          44.979166666666670000
          1902.354166666667000000
          2.645833333333333000
          576.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = cdsMovimentacaoCaixaFinanceiro
        DataField = 'PlanoConta'
        Mask = ',0.00;'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText7: TQRDBText
        Left = 943
        Top = 2
        Width = 218
        Height = 17
        Size.Values = (
          44.979166666666670000
          2495.020833333333000000
          5.291666666666667000
          576.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = cdsMovimentacaoCaixaFinanceiro
        DataField = 'Caixa'
        Mask = ',0.00;'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
    end
    object SummaryBand1: TQRBand
      Left = 38
      Top = 182
      Width = 1047
      Height = 31
      Frame.DrawTop = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        82.020833333333330000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRExpr1: TQRExpr
        Left = 447
        Top = 3
        Width = 77
        Height = 17
        Size.Values = (
          44.979166666666670000
          1182.687500000000000000
          7.937500000000000000
          203.729166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Color = clWhite
        Master = QuickRep1
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'SUM(ValorCredito)'
        Mask = ',0.00;'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRExpr2: TQRExpr
        Left = 535
        Top = 3
        Width = 82
        Height = 17
        Size.Values = (
          44.979166666666670000
          1415.520833333333000000
          7.937500000000000000
          216.958333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Color = clWhite
        Master = QuickRep1
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'SUM(ValorDebito)'
        Mask = ',0.00;'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
    object TitleBand1: TQRBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 123
      Frame.DrawBottom = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        325.437500000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object QRLabel2: TQRLabel
        Left = 4
        Top = 100
        Width = 30
        Height = 17
        Size.Values = (
          44.979166666666670000
          10.583333333333330000
          264.583333333333300000
          79.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Data'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 530
        Top = 100
        Width = 42
        Height = 17
        Size.Values = (
          44.979166666666670000
          1402.291666666667000000
          264.583333333333300000
          111.125000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'D'#233'bito'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 447
        Top = 100
        Width = 47
        Height = 17
        Size.Values = (
          44.979166666666670000
          1182.687500000000000000
          264.583333333333300000
          124.354166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cr'#233'dito'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 101
        Top = 100
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          267.229166666666700000
          264.583333333333300000
          148.166666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Hist'#243'rico'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 447
        Top = 19
        Width = 239
        Height = 20
        Size.Values = (
          52.916666666666670000
          1182.687500000000000000
          50.270833333333330000
          632.354166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Movimenta'#231#227'o Caixa financeiro'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRSysData1: TQRSysData
        Left = 968
        Top = 8
        Width = 68
        Height = 17
        Size.Values = (
          44.979166666666670000
          2561.166666666667000000
          21.166666666666670000
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
      object QRLabel8: TQRLabel
        Left = 609
        Top = 98
        Width = 38
        Height = 17
        Size.Values = (
          44.979166666666670000
          1611.312500000000000000
          259.291666666666700000
          100.541666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Saldo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 719
        Top = 100
        Width = 105
        Height = 17
        Size.Values = (
          44.979166666666670000
          1902.354166666667000000
          264.583333333333300000
          277.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Plano de Contas'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 943
        Top = 97
        Width = 38
        Height = 17
        Size.Values = (
          44.979166666666670000
          2495.020833333333000000
          256.645833333333300000
          100.541666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Caixa'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object imgLogo: TQRImage
        Left = 8
        Top = 8
        Width = 149
        Height = 86
        Size.Values = (
          227.541666666666700000
          21.166666666666670000
          21.166666666666670000
          394.229166666666700000)
        XLColumn = 0
        Stretch = True
      end
    end
  end
  object QRExcelFilter1: TQRExcelFilter
    TextEncoding = DefaultEncoding
    UseXLColumns = False
    Left = 520
    Top = 304
  end
  object QRPDFFilter1: TQRPDFFilter
    CompressionOn = False
    TextEncoding = AnsiEncoding
    Codepage = '1252'
    Left = 592
    Top = 296
  end
  object cdsMovimentacaoCaixaFinanceiro: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 296
    Data = {
      120100009619E0BD01000000180000000A000000000003000000120104446174
      6108000800000000000944657363726963616F01004900000001000557494454
      480200020064000553616C646F0800040000000000045469706F010049000000
      01000557494454480200020014000B56616C6F7244656269746F080004000000
      00000C56616C6F724372656469746F08000400000000000F4E756D65726F446F
      63756D656E746F01004900000001000557494454480200020014000B436F6469
      6669636163616F01004900000001000557494454480200020014000A506C616E
      6F436F6E7461010049000000010005574944544802000200C800054361697861
      01004900000001000557494454480200020014000000}
    object cdsMovimentacaoCaixaFinanceiroData: TDateTimeField
      FieldName = 'Data'
    end
    object cdsMovimentacaoCaixaFinanceiroDescricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object cdsMovimentacaoCaixaFinanceiroSaldo: TFloatField
      FieldName = 'Saldo'
    end
    object cdsMovimentacaoCaixaFinanceiroTipo: TStringField
      FieldName = 'Tipo'
    end
    object cdsMovimentacaoCaixaFinanceiroValorDebito: TFloatField
      FieldName = 'ValorDebito'
    end
    object cdsMovimentacaoCaixaFinanceiroValorCredito: TFloatField
      FieldName = 'ValorCredito'
    end
    object cdsMovimentacaoCaixaFinanceiroNumeroDocumento: TStringField
      FieldName = 'NumeroDocumento'
    end
    object cdsMovimentacaoCaixaFinanceiroCodificacao: TStringField
      FieldName = 'Codificacao'
    end
    object cdsMovimentacaoCaixaFinanceiroPlanoConta: TStringField
      FieldName = 'PlanoConta'
      Size = 200
    end
    object cdsMovimentacaoCaixaFinanceiroCaixa: TStringField
      FieldName = 'Caixa'
    end
  end
end
