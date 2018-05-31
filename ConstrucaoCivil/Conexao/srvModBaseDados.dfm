object DSServerModuleBaseDados: TDSServerModuleBaseDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 396
  Width = 627
  object SQLConnection1: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=16.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'DriverName=DataSnap'
      'HostName=127.0.0.1'
      'port=211'
      'Filters={}')
    Left = 280
    Top = 48
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta'
    RemoteServer = DSProviderConnectioneBase
    Left = 280
    Top = 168
  end
  object DSProviderConnectioneBase: TDSProviderConnection
    ServerClassName = 'TServerMethodsGeneric'
    SQLConnection = SQLConnection1
    Left = 280
    Top = 107
  end
  object ServerMethod_ExecSQL: TSqlServerMethod
    GetMetadata = False
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'SQL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    ServerMethodName = 'TServerMethodsGeneric.ExecSQl'
    Left = 472
    Top = 48
  end
end
