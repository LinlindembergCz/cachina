unit ModuloAgenda;

interface

uses
  SysUtils, Classes, FMTBcd, DBClient, Provider, DB, SqlExpr, WideStrings,
  DBXFirebird, Vcl.Dialogs, strutils, Dateutils;

type
  TDataModuleConsultaAgenda = class(TDataModule)
    SQLDataSet1: TSQLDataSet;
    SQLDataSet1NumeroCarteira: TStringField;
    SQLDataSet1PACIENTE: TStringField;
    SQLDataSet1NUMEROPSICOLOGO: TStringField;
    SQLDataSet1PSICOLOGO: TStringField;
    SQLDataSet1CID: TStringField;
    SQLDataSet1QuantidadeSessoes: TIntegerField;
    SQLDataSet1Valor: TSingleField;
    SQLDataSet1Data: TDateField;
    SQLDataSet1Descricao: TStringField;
    SQLDataSet1NOMECONVENIO: TStringField;
    SQLDataSet1Codigo: TIntegerField;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Codigo: TIntegerField;
    ClientDataSet1Data: TDateField;
    ClientDataSet1QuantidadeSessoes: TIntegerField;
    ClientDataSet1PACIENTE: TStringField;
    ClientDataSet1NUMEROPSICOLOGO: TStringField;
    ClientDataSet1PSICOLOGO: TStringField;
    ClientDataSet1CID: TStringField;
    ClientDataSet1Valor: TSingleField;
    ClientDataSet1NumeroClinica: TStringField;
    ClientDataSet1Clinica: TStringField;
    ClientDataSet1calcNumeroCID: TStringField;
    ClientDataSet1calcDescricaoCID: TStringField;
    ClientDataSet1Descricao: TStringField;
    ClientDataSet1NOMECONVENIO: TStringField;
    ClientDataSet1calcValortotal: TFloatField;
    ClientDataSet1calcSessoes: TStringField;
    ClientDataSet1calcValor: TStringField;
    ClientDataSet1calcValorTotalTexto: TStringField;
    ClientDataSet1NumeroCarteira: TStringField;
    SQLDataSet1Antecedentes: TStringField;
    SQLDataSet1Convenio: TStringField;
    SQLDataSet1DataNascimento: TDateField;
    SQLDataSet1Encaminhado: TStringField;
    SQLDataSet1Endereco: TStringField;
    SQLDataSet1Medicacoes: TStringField;
    SQLDataSet1Nacionalidade: TStringField;
    SQLDataSet1Naturalidade: TStringField;
    SQLDataSet1Profissao: TStringField;
    SQLDataSet1QueixaInicial: TStringField;
    SQLDataSet1Religiao: TStringField;
    SQLDataSet1Telefones: TStringField;
    SQLDataSet1CodigoEspecialista: TIntegerField;
    SQLDataSet1UF: TStringField;
    SQLDataSet1Municipio: TStringField;
    SQLDataSet1Bairro: TStringField;
    SQLDataSet1Cep: TStringField;
    SQLDataSet1RG: TStringField;
    SQLDataSet1OE: TStringField;
    SQLDataSet1DataEmissao: TDateField;
    SQLDataSet1NomePai: TStringField;
    SQLDataSet1NomeMae: TStringField;
    SQLDataSet1CodigoConvenio: TIntegerField;
    SQLDataSet1Email: TStringField;
    ClientDataSet1Antecedentes: TStringField;
    ClientDataSet1Convenio: TStringField;
    ClientDataSet1DataNascimento: TDateField;
    ClientDataSet1Encaminhado: TStringField;
    ClientDataSet1Endereco: TStringField;
    ClientDataSet1Medicacoes: TStringField;
    ClientDataSet1Nacionalidade: TStringField;
    ClientDataSet1Naturalidade: TStringField;
    ClientDataSet1Profissao: TStringField;
    ClientDataSet1QueixaInicial: TStringField;
    ClientDataSet1Religiao: TStringField;
    ClientDataSet1Telefones: TStringField;
    ClientDataSet1CodigoEspecialista: TIntegerField;
    ClientDataSet1UF: TStringField;
    ClientDataSet1Municipio: TStringField;
    ClientDataSet1Bairro: TStringField;
    ClientDataSet1Cep: TStringField;
    ClientDataSet1RG: TStringField;
    ClientDataSet1OE: TStringField;
    ClientDataSet1DataEmissao: TDateField;
    ClientDataSet1NomePai: TStringField;
    ClientDataSet1NomeMae: TStringField;
    ClientDataSet1CodigoConvenio: TIntegerField;
    ClientDataSet1Email: TStringField;
    ClientDataSet1calcExecutadoPor: TStringField;
    SQLDataSet1NUMEROENCAMINHADO: TStringField;
    ClientDataSet1NUMEROENCAMINHADO: TStringField;
    ClientDataSet1calcNumeroCRP: TStringField;
    SQLDataSet1NumeroOperadora: TStringField;
    ClientDataSet1NumeroOperadora: TStringField;
    SQLDataSet1Conselho: TStringField;
    SQLDataSet1CONSELHO2: TStringField;
    ClientDataSet1Conselho: TStringField;
    ClientDataSet1CONSELHO2: TStringField;
    ClientDataSet1calcConselho: TStringField;
    ClientDataSet1calcDataFormatada: TStringField;
    ClientDataSet1calcNumeroCarteira: TStringField;
    SQLDataSet1Hora: TStringField;
    ClientDataSet1Hora: TStringField;
    SQLDataSet1CODIGOAGENDAMENTO: TIntegerField;
    ClientDataSet1CODIGOAGENDAMENTO: TIntegerField;
    SQLDataSet1DESCRICAOTABELACID: TStringField;
    ClientDataSet1DESCRICAOTABELACID: TStringField;
    SQLDataSet2: TSQLDataSet;
    DataSetProvider2: TDataSetProvider;
    ClientDataSet2: TClientDataSet;
    ClientDataSet2Codigo: TIntegerField;
    ClientDataSet2CodigoAgendamento: TIntegerField;
    ClientDataSet2Data: TDateField;
    ClientDataSet2Hora: TStringField;
    DataSource1: TDataSource;
    SQLDataSet2Codigo: TIntegerField;
    SQLDataSet2CodigoAgendamento: TIntegerField;
    SQLDataSet2Data: TDateField;
    SQLDataSet2Hora: TStringField;
    SQLDataSet3: TSQLDataSet;
    DataSetProvider3: TDataSetProvider;
    TabelaCID: TClientDataSet;
    TabelaCIDCodigo: TIntegerField;
    TabelaCIDDescricao: TStringField;
    srcLKTabelaCID: TDataSource;
    SQLDataSet1CodigoCID: TIntegerField;
    ClientDataSet1CodigoCID: TIntegerField;
    ClientDataSet1LKCodigoCID: TStringField;
    SQLDataSet1Autorizacao: TStringField;
    ClientDataSet1Autorizacao: TStringField;
    SQLDataSet1DATAPAGAMENTO: TDateField;
    SQLDataSet1VALORFATURA: TSingleField;
    ClientDataSet1DATAPAGAMENTO: TDateField;
    ClientDataSet1VALORFATURA: TSingleField;
    SQLDataSet1CodigoTipoAgendamento: TIntegerField;
    ClientDataSet1CodigoTipoAgendamento: TIntegerField;
    SQLDataSet1Situacao: TStringField;
    ClientDataSet1Situacao: TStringField;
    SQLDataSet1HOSPITAL: TStringField;
    ClientDataSet1HOSPITAL: TStringField;
    ClientDataSet1CalcIdade: TIntegerField;
    procedure ClientDataSet1CalcFields(DataSet: TDataSet);
    function DataSetProvider1DataRequest(Sender: TObject;
      Input: OleVariant): OleVariant;
    procedure ClientDataSet1ReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure ClientDataSet1AfterPost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure ClientDataSet1AfterDelete(DataSet: TDataSet);
    procedure DataSetProvider1BeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    function DataSetProvider2DataRequest(Sender: TObject;
      Input: OleVariant): OleVariant;
    procedure DataSetProvider1GetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: WideString);
  private
    { Private declarations }
  public
    { Public declarations }
    tabela: string;
  end;

var
  DataModuleConsultaAgenda: TDataModuleConsultaAgenda;
  SQL: string;
  SQLSessoes: string;

implementation

{$R *.dfm}

uses srvModBaseDados;


procedure TDataModuleConsultaAgenda.ClientDataSet1AfterDelete(
  DataSet: TDataSet);
begin
  ClientDataSet1.ApplyUpdates(0);
end;

procedure TDataModuleConsultaAgenda.ClientDataSet1AfterPost(DataSet: TDataSet);
begin
  ClientDataSet1.ApplyUpdates(0);
end;

procedure TDataModuleConsultaAgenda.ClientDataSet1CalcFields(DataSet: TDataSet);
var
  Data: string;
  I: Integer;
  CID: string;
begin
  ClientDataSet1calcValortotal.value   := ClientDataSet1Valor.value * ClientDataSet1QuantidadeSessoes.value;
  ClientDataSet1NumeroClinica.asstring := '10700056';
  ClientDataSet1Clinica.AsString       := 'AMA PSICOLOGIA CLÍNICA';
  ClientDataSet1calcSessoes.asstring   := '0  '+ClientDataSet1QuantidadeSessoes.asstring;

  if ClientDataSet1DESCRICAOTABELACID.Asstring <> '' then
    CID:= ClientDataSet1DESCRICAOTABELACID.Asstring
  else
    CID:= ClientDataSet1CID.asstring;

  if CID <> '' then
  begin
     if  Pos('.', copy(CID,1,5)) = 0 then
     begin
        ClientDataSet1calcNumeroCID.asstring := copy(CID,1,3);
     end
     else
     begin
        ClientDataSet1calcNumeroCID.asstring := copy(CID,1,5);
     end;
     ClientDataSet1calcDescricaoCID.asstring := copy(CID,6,200);
  end;

   ClientDataSet1calcValor.asstring:= fORMATfLOAT(',0.00;',ClientDataSet1Valor.ASFLOAT);
   ClientDataSet1calcValortotalTexto.asstring:= fORMATfLOAT(',0.00;',ClientDataSet1calcValortotal.ASFLOAT);

  if ClientDataSet1Encaminhado.asstring <> '' then
  begin
     ClientDataSet1calcExecutadoPor.asstring:= ClientDataSet1ENCAMINHADO.asstring;
     ClientDataSet1calcNumeroCRP.asstring:= ClientDataSet1NUMEROENCAMINHADO.asstring;
     ClientDataSet1calcConselho.asstring:= ClientDataSet1Conselho2.asstring;
  end
  else
  begin
     ClientDataSet1calcExecutadoPor.asstring := ClientDataSet1PSICOLOGO.AsString;
     ClientDataSet1calcNumeroCRP.asstring    :=  ClientDataSet1NUMEROPSICOLOGO.AsString;
     ClientDataSet1calcConselho.asstring:=  ClientDataSet1Conselho.asstring;
  end;

  Data:= ClientDataSet1Data.asstring;
  ClientDataSet1calcDataFormatada.asstring:= copy(Data,1,1)+'  '+copy(Data,2,1)+'  /  '+
                                             copy(Data,4,1)+'  '+copy(Data,5,1)+'  /  '+
                                             copy(Data,9,1)+'  '+copy(Data,10,1);

  if ClientDataSet1NumeroCarteira.asstring <> '' then
     for I := 0 to length(ClientDataSet1NumeroCarteira.asstring) do
        ClientDataSet1calcNumeroCarteira.asstring:= ClientDataSet1calcNumeroCarteira.asstring+
                                                    ClientDataSet1NumeroCarteira.asstring[i]+'  ';


  if yearOf(ClientDataSet1DataNascimento.asdatetime) > 1900 then
     ClientDataSet1CalcIdade.value:= DateUtils.YearsBetween(date, ClientDataSet1DataNascimento.asdatetime)
  else
     ClientDataSet1CalcIdade.value:= 0;
end;

procedure TDataModuleConsultaAgenda.ClientDataSet1ReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage(E.Message);
end;

procedure TDataModuleConsultaAgenda.DataModuleCreate(Sender: TObject);
begin
  SQL:= SQLDataSet1.CommandText;
  SQLSessoes:= SQLDataSet2.CommandText;
end;

procedure TDataModuleConsultaAgenda.DataSetProvider1BeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
  var
    Data, Hora, quantidade,Autorizacao, SQL, DATAPAGAMENTO, VALORFATURA : string;
begin
  if UpdateKind in [ukModify, ukInsert] then
  begin
      if not DeltaDS.FieldByName('data').IsNull then
         Data   := ' "Data" = '+ quotedstr(FormatDatetime('YYYY/MM/DD',DeltaDS.FieldByName('Data').Value));

      if not DeltaDS.FieldByName('DATAPAGAMENTO').IsNull then
         DATAPAGAMENTO   := ' "DATAPAGAMENTO" = '+ quotedstr(FormatDatetime('YYYY/MM/DD',DeltaDS.FieldByName('DATAPAGAMENTO').AsDatetime));

      if not DeltaDS.FieldByName('VALORFATURA').IsNull then
         VALORFATURA   := ' "VALOR" = '+ stringreplace(stringreplace(DeltaDS.FieldByName('VALORFATURA').asstring
                   ,',','.',[rfReplaceAll]), '.','',[rfReplaceAll]);

      if not DeltaDS.FieldByName('Hora').IsNull then
         Hora   := ' "Hora" = '+ quotedstr(DeltaDS.FieldByName('Hora').Asstring);

      if not DeltaDS.FieldByName('CodigoCID').IsNull then
         quantidade := ' "CodigoCID" = '+ DeltaDS.FieldByName('CodigoCID').Asstring;

       if not DeltaDS.FieldByName('Situacao').IsNull then
         quantidade := ' "Situacao" = '+ quotedstr(DeltaDS.FieldByName('Situacao').Asstring);

      if not DeltaDS.FieldByName('Autorizacao').IsNull then
         Autorizacao := ' "Autorizacao" = '+ DeltaDS.FieldByName('Autorizacao').Asstring;



      SQL:= 'Update AGENDAMENTO Set '+
      Data       +
      ifthen( (Hora <> '') and (Data <> '') , ' , ', '') +
      Hora       +
      ifthen( (quantidade <> '') and (Hora <> '') , ' , ', '') +
      Quantidade +
      ifthen( (DATAPAGAMENTO <> '') and (Quantidade <> '') , ' , ', '') +
      DATAPAGAMENTO +
      ifthen( (VALORFATURA <> '') and (DATAPAGAMENTO <> '') , ' , ', '') +
      VALORFATURA +
      ifthen( (Autorizacao <> '') and (VALORFATURA <> '') , ' , ', '') +
      Autorizacao +
      ' where "Codigo" = '+ ClientDataSet1.FieldByName('CodigoAgendamento').AsString;

      DSServerModuleBaseDados.LSCONEXAO.ExecuteDirect( SQL );
  end
  else
  if UpdateKind in [ukDelete] then
     DSServerModuleBaseDados.LSCONEXAO.ExecuteDirect('Delete from AGENDAMENTO '+
     ' where "Codigo" = '+ DeltaDS.FieldByName('CodigoAgendamento').AsString);
  Applied:= true;

end;

function TDataModuleConsultaAgenda.DataSetProvider1DataRequest(Sender: TObject;
  Input: OleVariant): OleVariant;
begin
  SQLDataSet1.CommandText:= SQL+' where '+ Input +
  '  order by Agendamento."NomePaciente" ';
end;

procedure TDataModuleConsultaAgenda.DataSetProvider1GetTableName(
  Sender: TObject; DataSet: TDataSet; var TableName: WideString);
begin
  TableName:= 'AGENDAMENTO';
end;

function TDataModuleConsultaAgenda.DataSetProvider2DataRequest(Sender: TObject;
  Input: OleVariant): OleVariant;
begin
  SQLDataSet2.CommandText := SQLSessoes +' where '+ Input +' order by ss."Data"';
end;

end.
