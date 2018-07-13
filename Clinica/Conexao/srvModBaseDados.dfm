object DSServerModuleBaseDados: TDSServerModuleBaseDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 270
  Width = 422
  object LSCONEXAO: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver190.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=19.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver190.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=19.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'TrimChar=False'
      'DriverName=Firebird'
      'Database=LocalHost:D:\Amma\PSICOLOGO.FDB'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False'
      'HostName=LocalHost')
    Connected = True
    Left = 110
    Top = 47
  end
  object SQLDSServidor: TSQLDataSet
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = LSCONEXAO
    Left = 112
    Top = 120
  end
  object SQLGUIATISS: TSQLDataSet
    CommandText = 'SELECT * FROM GUITISS'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = LSCONEXAO
    Left = 232
    Top = 120
    object SQLGUIATISScodigoPrestadorNaOperadora: TStringField
      FieldName = 'codigoPrestadorNaOperadora'
      Size = 10
    end
    object SQLGUIATISSRegistroANS: TStringField
      FieldName = 'RegistroANS'
      Size = 7
    end
    object SQLGUIATISSNumeroLote: TStringField
      FieldName = 'NumeroLote'
      Size = 8
    end
    object SQLGUIATISSnumeroGuiaPrestador: TStringField
      FieldName = 'numeroGuiaPrestador'
      Size = 10
    end
    object SQLGUIATISSdataAutorizacao: TDateField
      FieldName = 'dataAutorizacao'
    end
    object SQLGUIATISSsenha: TStringField
      FieldName = 'senha'
    end
    object SQLGUIATISSdataValidadeSenha: TDateField
      FieldName = 'dataValidadeSenha'
    end
    object SQLGUIATISSnumeroCarteira: TStringField
      FieldName = 'numeroCarteira'
      Size = 10
    end
    object SQLGUIATISSatendimentoRN: TStringField
      FieldName = 'atendimentoRN'
      FixedChar = True
      Size = 1
    end
    object SQLGUIATISSnomeBeneficiario: TStringField
      FieldName = 'nomeBeneficiario'
      Size = 50
    end
    object SQLGUIATISScodigoPrestadorNaOperadora_SOLI: TStringField
      FieldName = 'codigoPrestadorNaOperadora_SOLI'
      Size = 10
    end
    object SQLGUIATISSnomeContratado: TStringField
      FieldName = 'nomeContratado'
      Size = 50
    end
    object SQLGUIATISSnomeProfissional: TStringField
      FieldName = 'nomeProfissional'
      Size = 50
    end
    object SQLGUIATISSconselhoProfissional: TStringField
      FieldName = 'conselhoProfissional'
    end
    object SQLGUIATISSnumeroConselhoProfissional: TStringField
      FieldName = 'numeroConselhoProfissional'
      Size = 10
    end
    object SQLGUIATISSUF_SOLICITANTE: TSmallintField
      FieldName = 'UF_SOLICITANTE'
    end
    object SQLGUIATISSCBOS_SOLICITANTE: TStringField
      FieldName = 'CBOS_SOLICITANTE'
      Size = 10
    end
    object SQLGUIATISSdataSolicitacao: TDateField
      FieldName = 'dataSolicitacao'
    end
    object SQLGUIATISScaraterAtendimento: TStringField
      FieldName = 'caraterAtendimento'
    end
    object SQLGUIATISScodigoPrestadorNaOperadora_EXEC: TStringField
      FieldName = 'codigoPrestadorNaOperadora_EXEC'
      Size = 10
    end
    object SQLGUIATISSnomeContratado_EXEC: TStringField
      FieldName = 'nomeContratado_EXEC'
      Size = 50
    end
    object SQLGUIATISSCNES: TStringField
      FieldName = 'CNES'
      Size = 8
    end
    object SQLGUIATISStipoAtendimento: TStringField
      FieldName = 'tipoAtendimento'
    end
    object SQLGUIATISSindicacaoAcidente: TStringField
      FieldName = 'indicacaoAcidente'
    end
    object SQLGUIATISStipoConsulta: TStringField
      FieldName = 'tipoConsulta'
    end
    object SQLGUIATISSdataExecucao: TDateField
      FieldName = 'dataExecucao'
    end
    object SQLGUIATISScodigoTabela: TIntegerField
      FieldName = 'codigoTabela'
    end
    object SQLGUIATISScodigoProcedimento: TStringField
      FieldName = 'codigoProcedimento'
      Size = 10
    end
    object SQLGUIATISSdescricaoProcedimento: TStringField
      FieldName = 'descricaoProcedimento'
      Size = 50
    end
    object SQLGUIATISSquantidadeExecutada: TIntegerField
      FieldName = 'quantidadeExecutada'
    end
    object SQLGUIATISSreducaoAcrescimo: TSingleField
      FieldName = 'reducaoAcrescimo'
    end
    object SQLGUIATISSvalorUnitario: TSingleField
      FieldName = 'valorUnitario'
    end
    object SQLGUIATISSvalorTotal: TSingleField
      FieldName = 'valorTotal'
    end
    object SQLGUIATISSvalorProcedimentos: TSingleField
      FieldName = 'valorProcedimentos'
    end
    object SQLGUIATISSvalorTotalGeral: TSingleField
      FieldName = 'valorTotalGeral'
    end
    object SQLGUIATISSCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object SQLGUIATISSviaAcesso: TStringField
      FieldName = 'viaAcesso'
    end
    object SQLGUIATISStecnicaUtilizada: TStringField
      FieldName = 'tecnicaUtilizada'
    end
    object SQLGUIATISSgrauPart: TSingleField
      FieldName = 'grauPart'
    end
  end
end
