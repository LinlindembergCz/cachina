object DSServerModuleBaseDados: TDSServerModuleBaseDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 377
  Width = 638
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
      'HostName=192.168.0.12'
      'port=211'
      'Filters={}')
    Left = 96
    Top = 64
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta'
    RemoteServer = DSProviderConnectioneBase
    Left = 96
    Top = 176
  end
  object DSProviderConnectioneBase: TDSProviderConnection
    ServerClassName = 'TServerMethodsGeneric'
    SQLConnection = SQLConnection1
    Left = 96
    Top = 115
  end
  object ServerMethod_ExecSQL: TSqlServerMethod
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'SQL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    ServerMethodName = 'TServerMethodsGeneric.ExecSQl'
    Left = 288
    Top = 64
  end
end
