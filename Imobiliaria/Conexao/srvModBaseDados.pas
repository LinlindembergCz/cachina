unit srvModBaseDados;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMSSQL, Data.FMTBcd, Data.DB,
  Data.SqlExpr, Datasnap.DBClient, MidasLib;

type
  TDSServerModuleBaseDados = class(TDataModule)
    LSCONEXAO: TSQLConnection;
    SQLDSServidor: TSQLDataSet;
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

{%CLASSGROUP 'Vcl.Controls.TControl'}

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
