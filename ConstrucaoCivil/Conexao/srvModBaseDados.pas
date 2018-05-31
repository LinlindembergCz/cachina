unit srvModBaseDados;

interface

uses
  System.Classes, SysUtils, Data.DBXDataSnap, IndyPeerImpl, Data.DBXCommon, Inifiles, forms,
  Data.FMTBcd, Data.DB, Data.SqlExpr, Datasnap.DBClient, Datasnap.DSConnect;

type
  TDSServerModuleBaseDados = class(TDataModule)
    SQLConnection1: TSQLConnection;
    cdsConsulta: TClientDataSet;
    DSProviderConnectioneBase: TDSProviderConnection;
    ServerMethod_ExecSQL: TSqlServerMethod;
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

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TDSServerModuleBaseDados.Conectar:boolean;
begin
  try
    SQLConnection1.Connected := true;
    result := true;
  except
    result := false;
  end;
end;

procedure TDSServerModuleBaseDados.DataModuleCreate(Sender: TObject);
var
  arquivo:TIniFile;
  DataBase:String;
  HostName: string;
begin
  arquivo   := TIniFile.create(ExtractFilePath(application.ExeName)+'configuracao.ini');
  HostName  := arquivo.ReadString('Configuracao', 'HostName', HostName);
  SQLConnection1.Params.Values['HostName']:= HostName;
end;

function TDSServerModuleBaseDados.Desconectar:boolean;
begin

  try
    SQLConnection1.Connected := false;
    result := true;
  except
    result := false;
  end;

end;

function TDSServerModuleBaseDados.getDataSet(strQry:string): TDataSet;
begin
  cdsConsulta.Close;
  cdsConsulta.datarequest(strQry);
  cdsConsulta.Open;

  result := cdsConsulta;
end;

function TDSServerModuleBaseDados.execSql(strQry:string): boolean;
Var
   msgErro:string;
begin
  result := false;
  try
    ServerMethod_ExecSQL.ParamByName('SQL').Value := strQry;
    ServerMethod_ExecSQL.ExecuteMethod;
    result := true;
  except
    on e: Exception do
    begin
      raise Exception.Create(e.Message)
    end;
  end;
end;

end.
