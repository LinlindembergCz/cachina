unit Orcamento;

interface

uses
   CAtribEntity,  GenericEntidade;

Type
  [TableName('Orcamento')]
  [Modulo('4')]
  TOrcamento = class(TGenericEntidade)
  private
    FDesconto: Double;
    FObservacao: string;
    FCodigo: integer;
    FCodigoFilial: integer;
    FCodigoFuncionario: integer;
    FCodigoFormaPagamento: integer;
    FSituacao: string;
    FCodigoCliente: integer;
    FPlaca: string;
    FValidade: TDatetime;
    FData: TDatetime;
    FCPFCNPJ: string;
    FRazaoSocial: string;
    FNome: string;
    FTelefone: string;
    FopcaofarolMilha: string;
    FopcaoChaveRoda: string;
    FopcaoMacaco: string;
    FTextRodas: string;
    FTextFarolMilha: string;
    FopcaoAutoFalantes: string;
    FTextChaveRoda: string;
    FTextMacaco: string;
    FopcaoCdPlayer: string;
    FopcaoTriangulo: string;
    FTextObjetos: string;
    FopcaoEstepe: string;
    FTextAutoFalantes: string;
    FopcaoPneusTraseiros: string;
    FopcaoTapete: string;
    FopcaoExtintor: string;
    FTextCDPlayer: string;
    FopcaoCalotas: string;
    FTextTriangulo: string;
    FopcaoChave: string;
    FTextEstepe: string;
    FTextPneusTraseiros: string;
    FTextTapete: string;
    FTextExtintor: string;
    FopcaoBateria: string;
    FTextCalotas: string;
    FopcaoManual: string;
    FTextChave: string;
    FopcaoPneusDianteiro: string;
    FTextBateria: string;
    FTextManual: string;
    FopcaoAcendendor: string;
    FTextPneusDianteiro: string;
    FopcaoRodas: string;
    FTextAcendedor: string;
    FContato: string;
    FOrdem: string;
    FObservacaoVistoria: string;
    FEmitiuNFSe: string;
    FEmitiuNFe: string;
    FDataHoraInicio: TDatetime;
    FCodigoTabelaPreco :integer;
  public
    [KeyField('Codigo')]
    [FieldName('Codigo')]
    property Codigo: integer read FCodigo write FCodigo;
    [FieldName('CodigoFilial')]
    property CodigoFilial: integer read FCodigoFilial write FCodigoFilial;
    [FieldName('Data')]
    property Data: TDatetime read FData write FData;
    [FieldName('Placa')]
    property Placa: string read FPlaca write FPlaca;
    [FieldName('Observacao')]
    property Observacao: string read FObservacao write FObservacao;
    [FieldName('CodigoFuncionario')]
    property CodigoFuncionario: integer read FCodigoFuncionario
      write FCodigoFuncionario;
    [FieldName('Desconto')]
    property Desconto: Double read FDesconto write FDesconto;
    [FieldName('CodigoFormaPagamento')]
    property CodigoFormaPagamento: integer read FCodigoFormaPagamento
      write FCodigoFormaPagamento;
    [FieldName('CodigoCliente')]
    property CodigoCliente: integer read FCodigoCliente write FCodigoCliente;
    [FieldName('Validade')]
    property Validade: TDatetime read FValidade write FValidade;
    [FieldName('Situacao')]
    property Situacao: string read FSituacao write FSituacao;

    property Nome: string read FNome write FNome;
    property CPFCNPJ: string read FCPFCNPJ write FCPFCNPJ;
    property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
    property Telefone: string read FTelefone write FTelefone;

    [FieldName('opcaoExtintor')]
    property opcaoExtintor: string read FopcaoExtintor write FopcaoExtintor;
    [FieldName('opcaoMacaco')]
    property opcaoMacaco: string read FopcaoMacaco write FopcaoMacaco;
    [FieldName('opcaoChaveRoda')]
    property opcaoChaveRoda: string read FopcaoChaveRoda
      write FopcaoChaveRoda;
    [FieldName('opcaoBateria')]
    property opcaoBateria: string read FopcaoBateria write FopcaoBateria;
    [FieldName('opcaoTriangulo')]
    property opcaoTriangulo: string read FopcaoTriangulo
      write FopcaoTriangulo;
    [FieldName('opcaoCalotas')]
    property opcaoCalotas: string read FopcaoCalotas write FopcaoCalotas;
    [FieldName('opcaoAcendendor')]
    property opcaoAcendendor: string read FopcaoAcendendor
      write FopcaoAcendendor;
    [FieldName('opcaofarolMilha')]
    property opcaofarolMilha: string read FopcaofarolMilha
      write FopcaofarolMilha;
    [FieldName('opcaoTapete')]
    property opcaoTapete: string read FopcaoTapete write FopcaoTapete;
    [FieldName('opcaoRodas')]
    property opcaoRodas: string read FopcaoRodas write FopcaoRodas;
    [FieldName('opcaoCdPlayer')]
    property opcaoCdPlayer: string read FopcaoCdPlayer write FopcaoCdPlayer;
    [FieldName('opcaoEstepe')]
    property opcaoEstepe: string read FopcaoEstepe write FopcaoEstepe;
    [FieldName('opcaoPneusTraseiros')]
    property opcaoPneusTraseiros: string read FopcaoPneusTraseiros
      write FopcaoPneusTraseiros;
    [FieldName('opcaoPneusDianteiro')]
    property opcaoPneusDianteiro: string read FopcaoPneusDianteiro
      write FopcaoPneusDianteiro;
    [FieldName('opcaoChave')]
    property opcaoChave: string read FopcaoChave write FopcaoChave;
    [FieldName('opcaoManual')]
    property opcaoManual: string read FopcaoManual write FopcaoManual;
    [FieldName('opcaoAutoFalantes')]
    property opcaoAutoFalantes: string read FopcaoAutoFalantes
      write FopcaoAutoFalantes;
    [FieldName('TextExtintor')]
    property TextExtintor: string read FTextExtintor write FTextExtintor;
    [FieldName('TextMacaco')]
    property TextMacaco: string read FTextMacaco write FTextMacaco;
    [FieldName('TextChaveRoda')]
    property TextChaveRoda: string read FTextChaveRoda write FTextChaveRoda;
    [FieldName('TextTriangulo')]
    property TextTriangulo: string read FTextTriangulo write FTextTriangulo;
    [FieldName('TextCalotas')]
    property TextCalotas: string read FTextCalotas write FTextCalotas;
    [FieldName('TextBateria')]
    property TextBateria: string read FTextBateria write FTextBateria;
    [FieldName('TextAutoFalantes')]
    property TextAutoFalantes: string read FTextAutoFalantes
      write FTextAutoFalantes;
    [FieldName('TextCDPlayer')]
    property TextCDPlayer: string read FTextCDPlayer write FTextCDPlayer;
    [FieldName('TextRodas')]
    property TextRodas: string read FTextRodas write FTextRodas;
    [FieldName('TextTapete')]
    property TextTapete: string read FTextTapete write FTextTapete;
    [FieldName('TextFarolMilha')]
    property TextFarolMilha: string read FTextFarolMilha
      write FTextFarolMilha;
    [FieldName('TextAcendedor')]
    property TextAcendedor: string read FTextAcendedor write FTextAcendedor;
    [FieldName('TextEstepe')]
    property TextEstepe: string read FTextEstepe write FTextEstepe;
    [FieldName('TextPneusTraseiros')]
    property TextPneusTraseiros: string read FTextPneusTraseiros
      write FTextPneusTraseiros;
    [FieldName('TextPneusDianteiro')]
    property TextPneusDianteiro: string read FTextPneusDianteiro
      write FTextPneusDianteiro;
    [FieldName('TextChave')]
    property TextChave: string read FTextChave write FTextChave;
    [FieldName('TextManual')]
    property TextManual: string read FTextManual write FTextManual;
    [FieldName('TextObjetos')]
    property TextObjetos: string read FTextObjetos write FTextObjetos;
    [FieldName('Ordem')]
    property Ordem: string read FOrdem write FOrdem;
    [FieldName('Contato')]
    property Contato: string read FContato write FContato;
    [FieldName('ObservacaoVistoria')]
    property ObservacaoVistoria: string read FObservacaoVistoria
      write FObservacaoVistoria;
    //[FieldName('EmitiuNFSe')]
    property EmitiuNFSe: string read FEmitiuNFSe write FEmitiuNFSe;
    //[FieldName('EmitiuNFe')]
    property EmitiuNFe: string read FEmitiuNFe write FEmitiuNFe;

    [FieldName('DataInicio')]
    property DataHoraInicio: Tdatetime read FDataHoraInicio write FDataHoraInicio;
    [FieldName('CodigoTabelaPreco')]
    property CodigoTabelaPreco :integer read FCodigoTabelaPreco write FCodigoTabelaPreco;

    //property CodigoLoteRecebimento: integer;
  end;

  [TableName('OrcamentoFormaPagamento')]
  [Modulo('4')]
  TOrcamentoFormaPagamento = class(TGenericEntidade)
  private
    FPercentualDesconto: Double;
    FValor: Double;
    FCodigo: integer;
    FVencimento: Tdatetime;
    FCodigoOrcamento: integer;
    FQuantidadePercelas: Integer;
    FCodigoFormaPagamento: Integer;
    FOpcao: string;
    FCodigoLoteRecebimento: integer;
    FCodigoFilial: integer;
    FValorPago: double;
  public
    [KeyField('Codigo')]
    property Codigo:integer read FCodigo write FCodigo;
    [FieldName('CodigoFilial')]
    property CodigoFilial:integer read FCodigoFilial write FCodigoFilial;

    [FieldName('CodigoOrcamento')]
    property CodigoOrcamento:integer read FCodigoOrcamento write FCodigoOrcamento;
    [FieldName('CodigoFormaPagamento')]
    property CodigoFormaPagamento:Integer read FCodigoFormaPagamento write FCodigoFormaPagamento;
    [FieldName('Valor')]
    property Valor:Double read FValor write FValor;
    [FieldName('PercentualDesconto')]
    property PercentualDesconto:Double read FPercentualDesconto write FPercentualDesconto;
    [FieldName('QuantidadePercelas')]
    property QuantidadePercelas:Integer read FQuantidadePercelas write FQuantidadePercelas;
    [FieldName('Vencimento')]
    property Vencimento:TDatetime read FVencimento write FVencimento;
    [FieldName('Opcao')]
    property Opcao: string read FOpcao write FOpcao;
    [FieldName('ValorPago')]
    property ValorPago: double read FValorPago write FValorPago;
  end;
implementation

{ TOrcamento }



end.
