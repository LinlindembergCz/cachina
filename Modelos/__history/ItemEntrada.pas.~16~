unit ItemEntrada;

interface

uses
 CAtribEntity,  GenericEntidade;

type
  [TableName('ItemEntrada')]
  [Modulo('6')]
  TItemEntrada = class(TGenericEntidade)
  private
    FDesconto: double;
    FValor: double;
    FCodigoProduto: integer;
    FCodigo: integer;
    FTotal: double;
    FCodigoFilial: integer;
    FCodigoEntrada: integer;
    FQuantidade: double;
    FCodigoEstoque: integer;
    FOrdem: integer;
    FFator: double;
    FCFOP: string;

    FCST: string;
    FBaseICMS: Double;
    FPercentualICMS: double;
    FValorICMS: Double;

    FCSTPIS: string;
    FBasePIS: double;
    FPercentualPIS: double;
    FValorPIS: Double;

    FCSTCOFINS: string;
    FBaseCOFINS: Double;
    FPercentualCOFINS: Double;
    FValorCOFINS: Double;

    FCSTIPI: string;
    FBaseIPI: double;
    FPercentualIPI: double;
    FValorIPI: Double;

  public
    [KeyField('Codigo')]
    property Codigo :integer read FCodigo write FCodigo;
    [FieldName('CodigoFilial')]
    property CodigoFilial:integer read FCodigoFilial write FCodigoFilial;
    [FieldName('CodigoEntrada')]
    property CodigoEntrada:integer read FCodigoEntrada write FCodigoEntrada;
    [FieldName('Ordem')]
    property Ordem:integer read FOrdem write FOrdem;
    [FieldName('CodigoProduto')]
    property CodigoProduto:integer read FCodigoProduto write FCodigoProduto;
    [FieldName('Quantidade')]
    property Quantidade:double read FQuantidade write FQuantidade;
    [FieldName('Valor')]
    property Valor:double read FValor write FValor;
    [FieldName('Desconto')]
    property Desconto:double read FDesconto write FDesconto;
    [FieldName('Total')]
    property Total :double read FTotal write FTotal;
    [FieldName('CodigoEstoque')]
    property CodigoEstoque:integer read FCodigoEstoque write FCodigoEstoque;
    [FieldName('Fator')]
    property Fator: double read FFator write FFator;
    [FieldName('CFOP')]
    property CFOP :string read FCFOP write FCFOP;

    [FieldName('CST')]
    property CST: string read FCST write FCST;
    [FieldName('BaseICMS')]
    property BaseICMS: Double read FBaseICMS write FBaseICMS;
    [FieldName('PercentualICMS')]
    property PercentualICMS: Double read FPercentualICMS write FPercentualICMS;
    [FieldName('ValorICMS')]
    property ValorICMS: Double read FValorICMS write FValorICMS;

    [FieldName('CSTPIS',5)]
    property CSTPIS :string read FCSTPIS write FCSTPIS;
    [FieldName('BasePIS')]
    property BasePIS :double read FBasePIS write FBasePIS;
    [FieldName('ValorPIS')]
    property ValorPIS: Double read FValorPIS write FValorPIS;
    [FieldName('PercentualPIS')]
    property PercentualPIS: Double read FPercentualPIS write FPercentualPIS;

    [FieldName('CSTCOFINS',5)]
    property CSTCOFINS:string read FCSTCOFINS write FCSTCOFINS;
    [FieldName('BaseCOFINS')]
    property BaseCOFINS:double read FBaseCOFINS write FBaseCOFINS;
    [FieldName('PercentualCOFINS')]
    property PercentualCOFINS: Double read FValorCOFINS write FPercentualCOFINS;
    [FieldName('ValorCOFINS')]
    property ValorCOFINS: Double read FValorCOFINS write FValorCOFINS;

    [FieldName('CSTIPI',5)]
    property CSTIPI :string read FCSTIPI write FCSTIPI;
    [FieldName('BaseIPI')]
    property BaseIPI :double read FBaseIPI write FBaseIPI;
    [FieldName('PercentualIPI')]
    property PercentualIPI: Double read FPercentualIPI write FPercentualIPI;
    [FieldName('ValorIPI')]
    property ValorIPI: Double read FValorIPI write FValorIPI;

  end;

implementation

{ TItemEntrada }

end.
