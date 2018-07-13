unit srvModBaseDados;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMSSQL, Data.FMTBcd, Data.DB,
  Data.SqlExpr, Datasnap.DBClient, //MidasLib,
  Data.DBXFirebird,  Vcl.Forms, IniFiles, Vcl.Dialogs;

type
  TDSServerModuleBaseDados = class(TDataModule)
    LSCONEXAO: TSQLConnection;
    SQLDSServidor: TSQLDataSet;
    SQLGUIATISS: TSQLDataSet;
    SQLGUIATISScodigoPrestadorNaOperadora: TStringField;
    SQLGUIATISSRegistroANS: TStringField;
    SQLGUIATISSNumeroLote: TStringField;
    SQLGUIATISSnumeroGuiaPrestador: TStringField;
    SQLGUIATISSdataAutorizacao: TDateField;
    SQLGUIATISSsenha: TStringField;
    SQLGUIATISSdataValidadeSenha: TDateField;
    SQLGUIATISSnumeroCarteira: TStringField;
    SQLGUIATISSatendimentoRN: TStringField;
    SQLGUIATISSnomeBeneficiario: TStringField;
    SQLGUIATISScodigoPrestadorNaOperadora_SOLI: TStringField;
    SQLGUIATISSnomeContratado: TStringField;
    SQLGUIATISSnomeProfissional: TStringField;
    SQLGUIATISSconselhoProfissional: TStringField;
    SQLGUIATISSnumeroConselhoProfissional: TStringField;
    SQLGUIATISSUF_SOLICITANTE: TSmallintField;
    SQLGUIATISSCBOS_SOLICITANTE: TStringField;
    SQLGUIATISSdataSolicitacao: TDateField;
    SQLGUIATISScaraterAtendimento: TStringField;
    SQLGUIATISScodigoPrestadorNaOperadora_EXEC: TStringField;
    SQLGUIATISSnomeContratado_EXEC: TStringField;
    SQLGUIATISSCNES: TStringField;
    SQLGUIATISStipoAtendimento: TStringField;
    SQLGUIATISSindicacaoAcidente: TStringField;
    SQLGUIATISStipoConsulta: TStringField;
    SQLGUIATISSdataExecucao: TDateField;
    SQLGUIATISScodigoTabela: TIntegerField;
    SQLGUIATISScodigoProcedimento: TStringField;
    SQLGUIATISSdescricaoProcedimento: TStringField;
    SQLGUIATISSquantidadeExecutada: TIntegerField;
    SQLGUIATISSreducaoAcrescimo: TSingleField;
    SQLGUIATISSvalorUnitario: TSingleField;
    SQLGUIATISSvalorTotal: TSingleField;
    SQLGUIATISSvalorProcedimentos: TSingleField;
    SQLGUIATISSvalorTotalGeral: TSingleField;
    SQLGUIATISSCODIGO: TIntegerField;
    SQLGUIATISSviaAcesso: TStringField;
    SQLGUIATISStecnicaUtilizada: TStringField;
    SQLGUIATISSgrauPart: TSingleField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Conectar:boolean;
    function Desconectar:boolean;
    function getDataSet(strQry:string):TDataSet;
    function execSql(strQry:string): boolean;
  end;

var
  DSServerModuleBaseDados: TDSServerModuleBaseDados;

implementation

{$R *.dfm}

function TDSServerModuleBaseDados.Conectar:boolean;
begin
  try
    LSCONEXAO.Connected := true;
    result := true;
  except
    result := false;
  end;
end;

procedure TDSServerModuleBaseDados.DataModuleCreate(Sender: TObject);
var
  arquivo:TIniFile;
  DataBase:String;
begin
   arquivo   := TIniFile.create(ExtractFilePath(application.ExeName)+'configuracao.ini');
   DataBase  := arquivo.ReadString('Configuracao', 'DataBase', DataBase);
   LSCONEXAO.Params.Values['DataBase']:= DataBase;
end;

function TDSServerModuleBaseDados.Desconectar:boolean;
begin
  try
    LSCONEXAO.Connected := false;
    result := true;
  except
    result := false;
  end;
end;

function TDSServerModuleBaseDados.getDataSet(strQry:string): TDataSet;
begin
  SQLDSServidor.Close;
  SQLDSServidor.Params.Clear;
  SQLDSServidor.commandText := strQry;
  SQLDSServidor.Open;

  result := SQLDSServidor;
end;

function TDSServerModuleBaseDados.execSql(strQry:string): boolean;
Var
   msgErro:string;
begin
  result := false;
  SQLDSServidor.Close;
  SQLDSServidor.Params.Clear;
  SQLDSServidor.commandText:= strQry;
  try
    SQLDSServidor.ExecSQL;
    result := true;
  except
    on e: Exception do
    begin
      raise Exception.Create(e.Message)
    end;
  end;
end;

end.
