unit Entrada;

interface

uses
  SysUtils, CAtribEntity, GenericEntidade;

type

  [TableName('Entrada')]
  [Modulo('6')]
  TEntrada = class(TGenericEntidade)
  private
    FValorFrete: Double;
    FCodigoFornecedor: Integer;
    FValorIPI: Double;
    FValorDesconto: Double;
    FCodigo: Integer;
    FValorICMS: Double;
    FValorSeguro: Double;
    FDataEmissao: TDatetime;
    FCodigoFormaPagamento: Integer;
    FValorDocumento: Double;
    FValorCustofinanceiro: Double;
    FTipoFrete: string;
    FValorPIS: Double;
    FValorDespesas: Double;
    FValorCONFINS: Double;
    FValorICMSSubstituto: Double;
    FData: TDatetime;
    FNumeroDocumento: string;
    FCPFCNPJ: string;
    FRazaoSocial: string;
    FNome: string;
    FTelefone: string;
    FCodigoFilial: Integer;
    FChaveAcesso: string;
    FEspecie: string;
    FSerie: string;
    FSituacao: string;
  public
    [KeyField('Codigo')]
    [FieldName('Codigo')]
    property Codigo: Integer read FCodigo write FCodigo;
    [FieldName('CodigoFilial')]
    property CodigoFilial: Integer read FCodigoFilial write FCodigoFilial;
    [FieldName('Data')]
    property Data: TDatetime read FData write FData;
    [FieldName('CodigoFornecedor')]
    property CodigoFornecedor: Integer read FCodigoFornecedor
      write FCodigoFornecedor;
    [FieldName('NumeroDocumento')]
    property NumeroDocumento: string read FNumeroDocumento
      write FNumeroDocumento;
    [FieldName('CodigoFormaPagamento')]
    property CodigoFormaPagamento: Integer read FCodigoFormaPagamento
      write FCodigoFormaPagamento;
    [FieldName('ValorFrete')]
    property ValorFrete: Double read FValorFrete write FValorFrete;
    [FieldName('ValorCustofinanceiro')]
    property ValorCustofinanceiro: Double read FValorCustofinanceiro
      write FValorCustofinanceiro;
    [FieldName('ValorDespesas')]
    property ValorDespesas: Double read FValorDespesas write FValorDespesas;
    [FieldName('TipoFrete')]
    property TipoFrete: string read FTipoFrete write FTipoFrete;
    [FieldName('DataEmissao')]
    property DataEmissao: TDatetime read FDataEmissao write FDataEmissao;
    [FieldName('ValorDocumento')]
    property ValorDocumento: Double read FValorDocumento write FValorDocumento;
    [FieldName('ValorSeguro')]
    property ValorSeguro: Double read FValorSeguro write FValorSeguro;
    [FieldName('ValorIPI')]
    property ValorIPI: Double read FValorIPI write FValorIPI;
    [FieldName('ValorPIS')]
    property ValorPIS: Double read FValorPIS write FValorPIS;
    [FieldName('ValorCONFINS')]
    property ValorCONFINS: Double read FValorCONFINS write FValorCONFINS;
    [FieldName('ValorICMS')]
    property ValorICMS: Double read FValorICMS write FValorICMS;
    [FieldName('ValorICMSSubstituto')]
    property ValorICMSSubstituto: Double read FValorICMSSubstituto
      write FValorICMSSubstituto;
    [FieldName('ValorDesconto')]
    property ValorDesconto: Double read FValorDesconto write FValorDesconto;
    [FieldName('ChaveAcesso')]
    property ChaveAcesso: string read FChaveAcesso write FChaveAcesso;
    [FieldName('Especie',3)]
    property Especie: string read FEspecie write FEspecie;
    [FieldName('Serie',3)]
    property Serie: string read FSerie write FSerie;

    [FieldName('Situacao',15)]
    property Situacao: string read FSituacao write FSituacao;
    property Nome: string read FNome write FNome;
    property CPFCNPJ: string read FCPFCNPJ write FCPFCNPJ;
    property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
    property Telefone: string read FTelefone write FTelefone;
  end;

implementation

{ TEntrada }
uses
  System.Classes;

initialization
  RegisterClass(TEntrada);

End.
