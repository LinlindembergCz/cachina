unit Imovel;

interface

uses
 CAtribEntity,  GenericEntidade;

type
  [TableName('Imovel')]
  TImovel = class(TGenericEntidade)
  private
    FCodigoSituacao: Integer;
    FEstudaPermuta: string;
    FObservacao: string;
    FTitulo: string;
    FCodigoProprietario: Integer;
    FBairro: string;
    FAreaTotal: Double;
    FCodigoTipo: Integer;
    FPublicado: string;
    FValorVenda: Double;
    FUF: string;
    FValorEntrada: Double;
    FAreaConstruida: Double;
    FCodigo: Integer;
    FDataVencimento: TDatetime;
    FGaragens: Integer;
    FCodigoFilial: Integer;
    FValorAluguel: Double;
    FTextoCondicoesComerciais: string;
    FComissaoCorretor: Double;
    FQuartos: Integer;
    FFinalidade: string;
    FSuspenso: string;
    FTextoVistoria: string;
    FComplemento: string;
    FValorCondominio: Double;
    FCodigoCliente: Integer;
    FDataCadastro: TDatetime;
    FBanheiros: Integer;
    FCodigoResponsavel: Integer;
    FTextoAnuncio: string;
    FReferencia: string;
    FSuites: Integer;
    FCidade: string;
    FEndereco: string;
    FEmplacado: string;
    procedure SetAreaConstruida(const Value: Double);
    procedure SetAreaTotal(const Value: Double);
    procedure SetBairro(const Value: string);
    procedure SetBanheiros(const Value: Integer);
    procedure SetCidade(const Value: string);
    procedure SetCodigo(const Value: Integer);
    procedure SetCodigoCliente(const Value: Integer);
    procedure SetCodigoFilial(const Value: Integer);
    procedure SetCodigoProprietario(const Value: Integer);
    procedure SetCodigoResponsavel(const Value: Integer);
    procedure SetCodigoSituacao(const Value: Integer);
    procedure SetCodigoTipo(const Value: Integer);
    procedure SetComissaoCorretor(const Value: Double);
    procedure SetComplemento(const Value: string);
    procedure SetDataCadastro(const Value: TDatetime);
    procedure SetDataVencimento(const Value: TDatetime);
    procedure SetEmplacado(const Value: string);
    procedure SetEndereco(const Value: string);
    procedure SetEstudaPermuta(const Value: string);
    procedure SetFinalidade(const Value: string);
    procedure SetGaragens(const Value: Integer);
    procedure SetObservacao(const Value: string);
    procedure SetPublicado(const Value: string);
    procedure SetQuartos(const Value: Integer);
    procedure SetReferencia(const Value: string);
    procedure SetSuites(const Value: Integer);
    procedure SetSuspenso(const Value: string);
    procedure SetTextoAnuncio(const Value: string);
    procedure SetTextoCondicoesComerciais(const Value: string);
    procedure SetTextoVistoria(const Value: string);
    procedure SetTitulo(const Value: string);
    procedure SetUF(const Value: string);
    procedure SetValorAluguel(const Value: Double);
    procedure SetValorCondominio(const Value: Double);
    procedure SetValorEntrada(const Value: Double);
    procedure SetValorVenda(const Value: Double);
public
  [KeyField('Codigo')]
  property Codigo: Integer read FCodigo write SetCodigo;
  [FieldName('CodigoFilial')]
  property CodigoFilial: Integer read FCodigoFilial write SetCodigoFilial;
  [FieldName('Referencia')]
  property Referencia: string read FReferencia write SetReferencia;
  [FieldName('CodigoResponsavel')]
  property CodigoResponsavel: Integer read FCodigoResponsavel write SetCodigoResponsavel;
  [FieldName('CodigoCliente')]
  property CodigoCliente: Integer read FCodigoCliente write SetCodigoCliente;
  [FieldName('CodigoClienteProprietario')]
  property CodigoProprietario: Integer read FCodigoProprietario write SetCodigoProprietario;
  [FieldName('Endereco')]
  property Endereco: string read FEndereco write SetEndereco;
  [FieldName('Bairro')]
  property Bairro: string read FBairro write SetBairro;
  [FieldName('Cidade')]
  property Cidade: string read FCidade write SetCidade;
  [FieldName('Estado')]
  property UF: string read FUF write SetUF;
  [FieldName('Quartos')]
  property Quartos: Integer read FQuartos write SetQuartos;
  [FieldName('Suites')]
  property Suites: Integer read FSuites write SetSuites;
  [FieldName('Balheiros')]
  property Banheiros: Integer read FBanheiros write SetBanheiros;
  [FieldName('AreaTotal')]
  property AreaTotal: Double read FAreaTotal write SetAreaTotal;
  [FieldName('AreaContruida')]
  property AreaConstruida: Double read FAreaConstruida write SetAreaConstruida;
  [FieldName('ValorVenda')]
  property ValorVenda: Double read FValorVenda write SetValorVenda;
  [FieldName('ValorAluguel')]
  property ValorAluguel: Double read FValorAluguel write SetValorAluguel;
  [FieldName('ValorCondominio')]
  property ValorCondominio: Double read FValorCondominio write SetValorCondominio;
  [FieldName('Complemento')]
  property Complemento: string read FComplemento write SetComplemento;
  [FieldName('Titulo')]
  property Titulo: string read FTitulo write SetTitulo;
  [FieldName('DataCadastro')]
  property DataCadastro: TDatetime read FDataCadastro write SetDataCadastro;
  [FieldName('CodigoTipo')]
  property CodigoTipo: Integer read FCodigoTipo write SetCodigoTipo;
  [FieldName('CodigoSituacao')]
  property CodigoSituacao: Integer read FCodigoSituacao write SetCodigoSituacao;
  [FieldName('Finalidade')]
  property Finalidade: string read FFinalidade write SetFinalidade;
  [FieldName('Observacao')]
  property Observacao: string read FObservacao write SetObservacao;
  [FieldName('ComissaoCorretor')]
  property ComissaoCorretor: Double read FComissaoCorretor write SetComissaoCorretor;
  [FieldName('Garagens')]
  property Garagens: Integer read FGaragens write SetGaragens;
  [FieldName('ValorEntrada')]
  property ValorEntrada: Double read FValorEntrada write SetValorEntrada;
  [FieldName('DataVencimento')]
  property DataVencimento: TDatetime read FDataVencimento write SetDataVencimento;
  [FieldName('Publicado')]
  property Publicado: string read FPublicado write SetPublicado;
  [FieldName('Emplacado')]
  property Emplacado: string read FEmplacado write SetEmplacado;
  [FieldName('EstudaPermuta')]
  property EstudaPermuta: string read FEstudaPermuta write SetEstudaPermuta;
  [FieldName('TextoAnuncio')]
  property TextoAnuncio: string read FTextoAnuncio write SetTextoAnuncio;
  [FieldName('TextoVistoria')]
  property TextoVistoria: string read FTextoVistoria write SetTextoVistoria;
  [FieldName('TextoCondicoesComerciais')]
  property TextoCondicoesComerciais: string read FTextoCondicoesComerciais write SetTextoCondicoesComerciais;
  [FieldName('Suspenso')]
  property Suspenso: string read FSuspenso write SetSuspenso;
end;

implementation

{ TImovel }

procedure TImovel.SetAreaConstruida(const Value: Double);
begin
  FAreaConstruida := Value;
end;

procedure TImovel.SetAreaTotal(const Value: Double);
begin
  FAreaTotal := Value;
end;

procedure TImovel.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TImovel.SetBanheiros(const Value: Integer);
begin
  FBanheiros := Value;
end;

procedure TImovel.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TImovel.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TImovel.SetCodigoCliente(const Value: Integer);
begin
  FCodigoCliente := Value;
end;

procedure TImovel.SetCodigoFilial(const Value: Integer);
begin
  FCodigoFilial := Value;
end;

procedure TImovel.SetCodigoProprietario(const Value: Integer);
begin
  FCodigoProprietario := Value;
end;

procedure TImovel.SetCodigoResponsavel(const Value: Integer);
begin
  FCodigoResponsavel := Value;
end;

procedure TImovel.SetCodigoSituacao(const Value: Integer);
begin
  FCodigoSituacao := Value;
end;

procedure TImovel.SetCodigoTipo(const Value: Integer);
begin
  FCodigoTipo := Value;
end;

procedure TImovel.SetComissaoCorretor(const Value: Double);
begin
  FComissaoCorretor := Value;
end;

procedure TImovel.SetComplemento(const Value: string);
begin
  FComplemento := Value;
end;

procedure TImovel.SetDataCadastro(const Value: TDatetime);
begin
  FDataCadastro := Value;
end;

procedure TImovel.SetDataVencimento(const Value: TDatetime);
begin
  FDataVencimento := Value;
end;

procedure TImovel.SetEmplacado(const Value: string);
begin
  FEmplacado := Value;
end;

procedure TImovel.SetEndereco(const Value: string);
begin
  FEndereco := Value;
end;

procedure TImovel.SetEstudaPermuta(const Value: string);
begin
  FEstudaPermuta := Value;
end;

procedure TImovel.SetFinalidade(const Value: string);
begin
  FFinalidade := Value;
end;

procedure TImovel.SetGaragens(const Value: Integer);
begin
  FGaragens := Value;
end;

procedure TImovel.SetObservacao(const Value: string);
begin
  FObservacao := Value;
end;

procedure TImovel.SetPublicado(const Value: string);
begin
  FPublicado := Value;
end;

procedure TImovel.SetQuartos(const Value: Integer);
begin
  FQuartos := Value;
end;

procedure TImovel.SetReferencia(const Value: string);
begin
  FReferencia := Value;
end;

procedure TImovel.SetSuites(const Value: Integer);
begin
  FSuites := Value;
end;

procedure TImovel.SetSuspenso(const Value: string);
begin
  FSuspenso := Value;
end;

procedure TImovel.SetTextoAnuncio(const Value: string);
begin
  FTextoAnuncio := Value;
end;

procedure TImovel.SetTextoCondicoesComerciais(const Value: string);
begin
  FTextoCondicoesComerciais := Value;
end;

procedure TImovel.SetTextoVistoria(const Value: string);
begin
  FTextoVistoria := Value;
end;

procedure TImovel.SetTitulo(const Value: string);
begin
  FTitulo := Value;
end;

procedure TImovel.SetUF(const Value: string);
begin
  FUF := Value;
end;

procedure TImovel.SetValorAluguel(const Value: Double);
begin
  FValorAluguel := Value;
end;

procedure TImovel.SetValorCondominio(const Value: Double);
begin
  FValorCondominio := Value;
end;

procedure TImovel.SetValorEntrada(const Value: Double);
begin
  FValorEntrada := Value;
end;

procedure TImovel.SetValorVenda(const Value: Double);
begin
  FValorVenda := Value;
end;

End.
