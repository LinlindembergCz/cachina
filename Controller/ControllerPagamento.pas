unit ControllerPagamento;

interface

uses
   Windows,Data.DB,  Messages, SysUtils, Variants, Classes,  ControllerTabelas,
   GenericEntidade, StrUtils, dateUtils;

type
  TControllerPagamento = class( TControllerTabelas )
  private
    procedure Estornar(Objecto: TGenericEntidade);
  public
    procedure Inserir(Objecto: TGenericEntidade);override;
    procedure Atualizar(Objecto: TGenericEntidade);override;
    procedure Excluir(Objecto: TGenericEntidade);override;
    function GetDataSet(Objecto: TGenericEntidade;
                        Condicao: string;
                        Fields: string= '') :TDataset;
    function GetSelect(Tabela, Condicao:string; Fields: string= ''):TDataset;

    function GetBalancoContabil(Condicao: string):TDataSet;

    procedure Baixar(Objecto: TGenericEntidade);
    procedure InserirConta(Valor: Double;
                           CodigoFormaPagamento,
                           Vencimento,
                           CodigoFornecedor,
                           CodigoEntrada : string;
                           CentroCusto: string;
                           Numerodocumento: string );

    procedure InserirParcelas(FormaPagamentoParcela: string;
      ValorParcela: Double; DataVencimento: TDatetime; Acada: boolean;
      Dias: integer; CodigoFornecedor: string; QtdParcelas: Integer;
      CodigoEntrada, CentroCusto, Numerodocumento: string);
  end;

  resourcestring
  StrCamposPagamentos = 'T1.*, pess.Nome as Fornecedor, categ."Descricao" as Categoria,'+
                        ' caix."Descricao" as Caixa, form."Descricao" as FormaPagamento,'+
                        ' centro.Descricao as DescricaoCentroCusto';
  ConsultaTabela = ' Pagamento T1 '+
                   ' left join Pessoa pess on pess."Codigo" = T1."CodigoPessoa" '+
                   ' left join Categorias categ on categ."Codigo" = T1."CodigoCategoria"'+
                   ' left join Caixa caix on caix."Codigo" = T1."CodigoCaixa" '+
                   ' left join FormaPagamento form on form."Codigo" = T1."CodigoFormaPagamento"'+
                   ' left join CentroCusto centro on centro.Codigo = T1."CodigoCentroCusto" ';


implementation

{ TControllerClientes }

uses  GenericDAO, EntidadeFactory, Principal, UtilsNumeros,
  UtilsString, Mapper, Controller, ControllerCaixaMovimentacao;

procedure TControllerPagamento.Atualizar(Objecto: TGenericEntidade);
begin
  inherited;
  if ( PMapper <> nil ) and (PMapper.GetValueEntidade('Situacao') = 'Baixado' ) then
      Baixar(Objecto)
  else
  if ( PMapper <> nil ) and (PMapper.GetValueEntidade('Situacao') = 'Aberto' ) then
      Estornar(Objecto);
end;

procedure TControllerPagamento.Baixar(Objecto: TGenericEntidade);
var
  PCaixaMovimentacao:TGenericEntidade;
  ControllerCaixaMovimentacao: TControllerCaixaMovimentacao;
  MapperCaixaMovimentacao : TMapper;
begin
  inherited;
  if ( PMapper <> nil ) and (strtofloatDef(PMapper.GetValueEntidade('ValorBaixado'),0) > 0) then
  begin
    PCaixaMovimentacao := TEntidadeFactory.Criar(tpCaixaMovimentacao);
    ControllerCaixaMovimentacao:= TControllerCaixaMovimentacao.Create;
    MapperCaixaMovimentacao := TMapper.Create(PCaixaMovimentacao);
    with MapperCaixaMovimentacao do
    begin
      associar('Codigo',nil);
      associar('CodigoFilial',nil);
      associar('CodigoCaixa',nil, PMapper.GetValueEntidade('CodigoCaixa') );
      associar('DataHora',nil, datetostr(PMapper.GetValueDatetimeEntidade('DataBaixa')) );
      associar('Valor',nil, PMapper.GetValueEntidade('ValorBaixado'));
      associar('CodigoCategoria',nil, PMapper.GetValueEntidade('CodigoCategoria'));
      associar('Observacao',nil, PMapper.GetValueEntidade('Descricao'));
      associar('Tipo',nil,'DÉBITO');
      associar('CodigoConta', nil, PMapper.GetValueEntidade('Codigo') );
    end;
    ControllerCaixaMovimentacao.PMapper := MapperCaixaMovimentacao;
    ControllerCaixaMovimentacao.Inserir(PCaixaMovimentacao);
  end;
end;

procedure TControllerPagamento.Estornar(Objecto: TGenericEntidade);
var
  PCaixaMovimentacao:TGenericEntidade;
  ControllerCaixaMovimentacao: IController;
  MapperCaixaMovimentacao : TMapper;
begin
  inherited;
  if ( PMapper <> nil ) then
  begin
    TGenericDAO.DeleteSQL(TEntidadeFactory.GetNameEntidade(tpCaixaMovimentacao) ,
                         ' CodigoConta='+ PMapper.GetValueEntidade('Codigo'));
  end;
end;

procedure TControllerPagamento.Excluir(Objecto: TGenericEntidade);
begin
  inherited ;
end;


function TControllerPagamento.GetBalancoContabil(Condicao: string): TDataSet;
begin
   result := GetSelect ('vwBalancoContabil T1 ',Condicao);
end;

function TControllerPagamento.GetDataSet(Objecto: TGenericEntidade;Condicao: string;  Fields: string= ''): TDataset;
begin
  result:= inherited;
end;

function TControllerPagamento.GetSelect(Tabela, Condicao,
  Fields: string): TDataset;
begin
  result:= inherited;
end;

procedure TControllerPagamento.Inserir(Objecto:TGenericEntidade);
begin
  inherited;
  Baixar(Objecto);
end;


procedure TControllerPagamento.InserirConta( Valor: Double;
                                             CodigoFormaPagamento,
                                             Vencimento,
                                             CodigoFornecedor,
                                             CodigoEntrada : string;
                                             CentroCusto: string;
                                             Numerodocumento: string );
var
  Pagamento           : TGenericEntidade;
  MapperPagamento       : TMapper;
  DatasetFormaPagamento : TDataSet;
  BaixaAutomatica       : string;
  PercentualJuros       : string;
  PercentualMulta       : string;
  PercentualTaxaCartao  : Double;
  PercentualTaxaAntecipacao : Double;
  DiasAntecipacao           : integer;
begin
  Pagamento       := TEntidadefactory.Criar(tpPagamento);
  MapperPagamento := TMapper.Create(Pagamento,  nil);

  try

      with MapperPagamento do
      begin
        associar('Codigo', nil);
        associar('CodigoFilial', nil);
        associar('CodigoPessoa', nil,  CodigoFornecedor);
        associar('Valor', nil, FloatToStr(Valor) );
        associar('CodigoFormaPagamento', nil, CodigoFormaPagamento );
        associar('CodigoCaixa',  nil, '1');
        associar('Data', nil, datetostr(date) );
        associar('DataVencimento', nil, Vencimento );
        associar('Observacao', nil, '');
        associar('CodigoCategoria',  nil);
        associar('Situacao', nil,'Aberto');

        if CentroCusto <> '' then
           associar('CodigoCentroCusto',  nil, CentroCusto );

        if CodigoFormaPagamento <> '' then
        begin
            DatasetFormaPagamento := GetSelect( 'FormaPagamento' ,
                                                'Codigo='+ CodigoFormaPagamento,
                                                ' BaixaAutomatica , '+
                                                ' ISNULL(PercentualJuros,0) as PercentualJuros,'+
                                                ' ISNULL(PercentualMulta,0) as PercentualMulta,'+
                                                ' ISNULL(PercentualTaxaCartao,0) as PercentualTaxaCartao,'+
                                                ' ISNULL(PercentualTaxaAntecipacao,0)  as PercentualTaxaAntecipacao,'+
                                                ' ISNULL(DiasAntecipacao,0) as DiasAntecipacao' );

           BaixaAutomatica           := DatasetFormaPagamento.fieldbyname('BaixaAutomatica').asstring;
           PercentualTaxaCartao      := 0;
           PercentualTaxaAntecipacao := 0;
           DiasAntecipacao           := 0;

           if BaixaAutomatica = 'S' then
           begin
              associar('Situacao', nil,'Baixado');
              associar('DataBaixa', nil,datetostr(date + DiasAntecipacao) );
              associar('ValorBaixado', nil, FloatToStr(Valor -
                                                      (Valor * PercentualTaxaCartao / 100 ) -
                                                      (Valor * PercentualTaxaAntecipacao / 100) ) );
           end;

           associar('PercentualJuros', nil, PercentualJuros );
           associar('PercentualMulta', nil, PercentualMulta );

           associar('PercentualTaxaCartao', nil, floattostr(PercentualTaxaCartao) );
           associar('PercentualTaxaAntecipacao', nil, floattostr(PercentualTaxaAntecipacao) );
           associar('DiasAntecipacao', nil, inttostr(DiasAntecipacao) );

           associar('CodigoEntrada', nil, CodigoEntrada );
           associar('NumeroDocumento', nil, NumeroDocumento );
        end;

        Inserir( Pagamento );
        {if BaixaAutomatica <> '' then
        begin
           Atualizar( Pagamento );
        end;}
      end;
  finally
     Pagamento.free;
     MapperPagamento.free;

  end;
end;

procedure  TControllerPagamento.InserirParcelas( FormaPagamentoParcela: string;
                                                 ValorParcela :Double;
                                                 DataVencimento:TDatetime;
                                                 Acada:boolean;
                                                 Dias :integer;
                                                 CodigoFornecedor: string;
                                                 QtdParcelas:Integer;
                                                 CodigoEntrada,
                                                 CentroCusto,
                                                 Numerodocumento : string);
var
  I , Dia :integer;
begin
   Dia := dayOf(DataVencimento);
   if QtdParcelas > 0 then
   begin
       for I := 0 to QtdParcelas - 1 do
       begin
          InserirConta( ValorParcela,
                        FormaPagamentoParcela,
                        datetostr(DataVencimento),
                        CodigoFornecedor,
                        CodigoEntrada,
                        CentroCusto,
                        Numerodocumento +'/'+inttostr( I + 1 ) );
          if Acada  then
             DataVencimento:= incDay(DataVencimento,Dias)
          else
             DataVencimento:=  IncMonth(DataVencimento);
       end;
   end
   else
   begin
      InserirConta( ValorParcela,
                    FormaPagamentoParcela,
                    datetostr(DataVencimento),
                    CodigoFornecedor,
                    CodigoEntrada,
                    CentroCusto,
                    Numerodocumento);
   end;

end;



end.


