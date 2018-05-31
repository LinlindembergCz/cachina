object DataModuleConsultaAgenda: TDataModuleConsultaAgenda
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 373
  Width = 488
  object SQLDataSet1: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'Select'#13#10'        Agendamento."Codigo" as CodigoAgendamento,'#13#10#13#10'  ' +
      '      TRIAGEM."Codigo",'#13#10'        Triagem."Antecedentes",'#13#10'      ' +
      '  Triagem."CID",'#13#10'        Triagem."Convenio",'#13#10'        Triagem."' +
      'DataNascimento",'#13#10'        Triagem."Endereco",'#13#10'        Triagem."' +
      'Medicacoes",'#13#10'        Triagem."Nacionalidade",'#13#10'        Triagem.' +
      '"Naturalidade",'#13#10'        Triagem."Profissao",'#13#10'        Triagem."' +
      'QueixaInicial",'#13#10'        Triagem."Religiao",'#13#10'        Triagem."T' +
      'elefones",'#13#10'        Triagem."CodigoEspecialista",'#13#10'        Triag' +
      'em."UF",'#13#10'        Triagem."Municipio",'#13#10'        Triagem."Bairro"' +
      ','#13#10'        Triagem."Cep",'#13#10'        Triagem."RG",'#13#10'        Triage' +
      'm."OE",'#13#10'        Triagem."DataEmissao",'#13#10'        Triagem."NomePa' +
      'i",'#13#10'        Triagem."NomeMae",'#13#10'        Triagem."CodigoConvenio' +
      '",'#13#10'        Triagem."Nome" as Paciente,'#13#10'        Triagem."Numero' +
      'Carteira",'#13#10'        Triagem."Email",'#13#10#13#10'        Especialista."Nu' +
      'mero" as NumeroPsicologo,'#13#10'        Especialista."Descricao" as P' +
      'sicologo,'#13#10'        Especialista."Conselho", '#13#10'        esp2."Desc' +
      'ricao" Encaminhado,'#13#10'        esp2."Numero" as NumeroEncaminhado,' +
      #13#10'        esp2."NumeroOperadora",'#13#10'        esp2."Conselho" as Co' +
      'nselho2, '#13#10#13#10'        Agendamento."QuantidadeSessoes",'#13#10'        A' +
      'gendamento."Hora",'#13#10'        ( case when Agendamento."VALOR" > 0 ' +
      'then Agendamento."VALOR" else   TipoAgendamento."Valor" end) as ' +
      ' Valor,'#13#10'        Agendamento."Data" ,'#13#10'        TipoAgendamento."' +
      'Descricao",'#13#10'        CONVENIO."Descricao" as NomeConvenio,'#13#10#13#10'  ' +
      '      tbcid."Descricao" as DescricaoTabelaCID,'#13#10'        Agendame' +
      'nto."CodigoCID",'#13#10'        Agendamento."Autorizacao",'#13#10'        Ag' +
      'endamento."DATAPAGAMENTO",'#13#10'        Agendamento."VALOR" as Valor' +
      'Fatura,'#13#10'        Agendamento."CodigoTipoAgendamento" ,'#13#10'        ' +
      'Agendamento."Situacao" ,'#13#10'   '#13#10'        Pessoa."Nome" as Hospital' +
      '     '#13#10'         '#13#10'         from'#13#10'         Agendamento'#13#10'         ' +
      'LEFT JOIN  Triagem                 on '#13#10'               Agendamen' +
      'to."CodigoPaciente" = Triagem."Codigo"'#13#10'         LEFT  join Espe' +
      'cialista            on '#13#10'               Agendamento."CodigoEspec' +
      'ialista" = Especialista."Codigo"'#13#10'         LEFT  join Convenio  ' +
      '             on '#13#10'               Agendamento."CodigoConvenio" = ' +
      'Convenio."Codigo"'#13#10'         LEFT join TipoAgendamento on '#13#10'     ' +
      '          Agendamento."CodigoTipoAgendamento" = TipoAgendamento.' +
      '"Codigo" '#13#10'         LEFT  join Especialista esp2      on '#13#10'     ' +
      '          esp2."Codigo" = Agendamento."CodigoEncaminhado"'#13#10'     ' +
      '   LEFT JOIN TabelaCID tbcid on '#13#10'               tbcid."Codigo" ' +
      '= Agendamento."CodigoCID"'#13#10'       LEFT JOIN Pessoa on Pessoa."Co' +
      'digo" = "CodigoHospital"'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DSServerModuleBaseDados.LSCONEXAO
    Left = 240
    Top = 56
    object SQLDataSet1CODIGOAGENDAMENTO: TIntegerField
      FieldName = 'CodigoAgendamento'
      Origin = 'Agendamento."Codigo"'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object SQLDataSet1Codigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'Triagem.Codigo'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object SQLDataSet1Hora: TStringField
      FieldName = 'Hora'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object SQLDataSet1Data: TDateField
      FieldName = 'Data'
      ProviderFlags = [pfInUpdate]
    end
    object SQLDataSet1CID: TStringField
      FieldName = 'CID'
      ProviderFlags = []
      Size = 50
    end
    object SQLDataSet1NumeroCarteira: TStringField
      FieldName = 'NumeroCarteira'
      ProviderFlags = []
      Size = 30
    end
    object SQLDataSet1PACIENTE: TStringField
      FieldName = 'PACIENTE'
      ProviderFlags = []
      Size = 50
    end
    object SQLDataSet1NUMEROPSICOLOGO: TStringField
      FieldName = 'NUMEROPSICOLOGO'
      ProviderFlags = []
      Size = 10
    end
    object SQLDataSet1PSICOLOGO: TStringField
      FieldName = 'PSICOLOGO'
      ProviderFlags = []
      Size = 50
    end
    object SQLDataSet1QuantidadeSessoes: TIntegerField
      FieldName = 'QuantidadeSessoes'
      ProviderFlags = []
    end
    object SQLDataSet1Valor: TSingleField
      FieldName = 'Valor'
      ProviderFlags = []
    end
    object SQLDataSet1Descricao: TStringField
      FieldName = 'Descricao'
      ProviderFlags = []
      Size = 300
    end
    object SQLDataSet1NOMECONVENIO: TStringField
      FieldName = 'NOMECONVENIO'
      ProviderFlags = []
      Required = True
      Size = 30
    end
    object SQLDataSet1Antecedentes: TStringField
      FieldName = 'Antecedentes'
      ProviderFlags = []
      Size = 500
    end
    object SQLDataSet1Convenio: TStringField
      FieldName = 'Convenio'
      ProviderFlags = []
      Size = 50
    end
    object SQLDataSet1DataNascimento: TDateField
      FieldName = 'DataNascimento'
      ProviderFlags = []
    end
    object SQLDataSet1Encaminhado: TStringField
      FieldName = 'Encaminhado'
      ProviderFlags = []
      Size = 50
    end
    object SQLDataSet1Endereco: TStringField
      FieldName = 'Endereco'
      ProviderFlags = []
      Size = 100
    end
    object SQLDataSet1Medicacoes: TStringField
      FieldName = 'Medicacoes'
      ProviderFlags = []
      Size = 100
    end
    object SQLDataSet1Nacionalidade: TStringField
      FieldName = 'Nacionalidade'
      ProviderFlags = []
      Size = 50
    end
    object SQLDataSet1Naturalidade: TStringField
      FieldName = 'Naturalidade'
      ProviderFlags = []
      Size = 50
    end
    object SQLDataSet1Profissao: TStringField
      FieldName = 'Profissao'
      ProviderFlags = []
      Size = 50
    end
    object SQLDataSet1QueixaInicial: TStringField
      FieldName = 'QueixaInicial'
      ProviderFlags = []
      Size = 1000
    end
    object SQLDataSet1Religiao: TStringField
      FieldName = 'Religiao'
      ProviderFlags = []
      Size = 50
    end
    object SQLDataSet1Telefones: TStringField
      FieldName = 'Telefones'
      ProviderFlags = []
      Size = 50
    end
    object SQLDataSet1CodigoEspecialista: TIntegerField
      FieldName = 'CodigoEspecialista'
      ProviderFlags = []
    end
    object SQLDataSet1UF: TStringField
      FieldName = 'UF'
      ProviderFlags = []
      Size = 2
    end
    object SQLDataSet1Municipio: TStringField
      FieldName = 'Municipio'
      ProviderFlags = []
      Size = 25
    end
    object SQLDataSet1Bairro: TStringField
      FieldName = 'Bairro'
      ProviderFlags = []
      Size = 25
    end
    object SQLDataSet1Cep: TStringField
      FieldName = 'Cep'
      ProviderFlags = []
      Size = 10
    end
    object SQLDataSet1RG: TStringField
      FieldName = 'RG'
      ProviderFlags = []
      Size = 15
    end
    object SQLDataSet1OE: TStringField
      FieldName = 'OE'
      ProviderFlags = []
      Size = 15
    end
    object SQLDataSet1DataEmissao: TDateField
      FieldName = 'DataEmissao'
      ProviderFlags = []
    end
    object SQLDataSet1NomePai: TStringField
      FieldName = 'NomePai'
      ProviderFlags = []
      Size = 50
    end
    object SQLDataSet1NomeMae: TStringField
      FieldName = 'NomeMae'
      ProviderFlags = []
      Size = 50
    end
    object SQLDataSet1CodigoConvenio: TIntegerField
      FieldName = 'CodigoConvenio'
      ProviderFlags = []
    end
    object SQLDataSet1Email: TStringField
      FieldName = 'Email'
      ProviderFlags = []
      Size = 50
    end
    object SQLDataSet1NUMEROENCAMINHADO: TStringField
      FieldName = 'NUMEROENCAMINHADO'
      ProviderFlags = []
      Size = 10
    end
    object SQLDataSet1NumeroOperadora: TStringField
      FieldName = 'NumeroOperadora'
      ProviderFlags = []
    end
    object SQLDataSet1Conselho: TStringField
      FieldName = 'Conselho'
      ProviderFlags = []
      Size = 10
    end
    object SQLDataSet1CONSELHO2: TStringField
      FieldName = 'CONSELHO2'
      ProviderFlags = []
      Size = 10
    end
    object SQLDataSet1DESCRICAOTABELACID: TStringField
      FieldName = 'DESCRICAOTABELACID'
      ProviderFlags = []
      Size = 200
    end
    object SQLDataSet1CodigoCID: TIntegerField
      FieldName = 'CodigoCID'
      ProviderFlags = [pfInUpdate]
    end
    object SQLDataSet1Autorizacao: TStringField
      FieldName = 'Autorizacao'
      ProviderFlags = [pfInUpdate]
    end
    object SQLDataSet1CodigoTipoAgendamento: TIntegerField
      FieldName = 'CodigoTipoAgendamento'
      ProviderFlags = []
      Required = True
    end
    object SQLDataSet1DATAPAGAMENTO: TDateField
      FieldName = 'DATAPAGAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object SQLDataSet1VALORFATURA: TSingleField
      FieldName = 'VALORFATURA'
      ProviderFlags = [pfInUpdate]
    end
    object SQLDataSet1Situacao: TStringField
      FieldName = 'Situacao'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object SQLDataSet1HOSPITAL: TStringField
      FieldName = 'HOSPITAL'
      ProviderFlags = []
      Size = 100
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    ResolveToDataSet = True
    UpdateMode = upWhereChanged
    OnDataRequest = DataSetProvider1DataRequest
    BeforeUpdateRecord = DataSetProvider1BeforeUpdateRecord
    Left = 240
    Top = 112
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    AfterPost = ClientDataSet1AfterPost
    AfterDelete = ClientDataSet1AfterDelete
    OnCalcFields = ClientDataSet1CalcFields
    OnReconcileError = ClientDataSet1ReconcileError
    Left = 240
    Top = 168
    object ClientDataSet1CODIGOAGENDAMENTO: TIntegerField
      FieldName = 'CodigoAgendamento'
      Origin = 'Agendamento."Codigo"'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object ClientDataSet1Codigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'Triagem.Codigo'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object ClientDataSet1Data: TDateField
      FieldName = 'Data'
      ProviderFlags = [pfInUpdate]
    end
    object ClientDataSet1Hora: TStringField
      FieldName = 'Hora'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object ClientDataSet1CID: TStringField
      FieldName = 'CID'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object ClientDataSet1calcValortotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calcValortotal'
      ProviderFlags = []
      DisplayFormat = ',0.00;'
      Calculated = True
    end
    object ClientDataSet1calcSessoes: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcSessoes'
      ProviderFlags = []
      Size = 10
      Calculated = True
    end
    object ClientDataSet1calcValor: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcValor'
      ProviderFlags = []
      Calculated = True
    end
    object ClientDataSet1calcValorTotalTexto: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcValorTotalTexto'
      ProviderFlags = []
      Calculated = True
    end
    object ClientDataSet1calcConselho: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcConselho'
      Size = 10
      Calculated = True
    end
    object ClientDataSet1calcDataFormatada: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcDataFormatada'
      Size = 25
      Calculated = True
    end
    object ClientDataSet1calcNumeroCarteira: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcNumeroCarteira'
      Size = 30
      Calculated = True
    end
    object ClientDataSet1calcNumeroCRP: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcNumeroCRP'
      Calculated = True
    end
    object ClientDataSet1calcNumeroCID: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcNumeroCID'
      ProviderFlags = []
      Size = 5
      Calculated = True
    end
    object ClientDataSet1calcDescricaoCID: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcDescricaoCID'
      ProviderFlags = []
      Size = 200
      Calculated = True
    end
    object ClientDataSet1calcExecutadoPor: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcExecutadoPor'
      Size = 50
      Calculated = True
    end
    object ClientDataSet1NumeroClinica: TStringField
      FieldKind = fkCalculated
      FieldName = 'NumeroClinica'
      ProviderFlags = []
      Calculated = True
    end
    object ClientDataSet1Clinica: TStringField
      FieldKind = fkCalculated
      FieldName = 'Clinica'
      ProviderFlags = []
      Size = 100
      Calculated = True
    end
    object ClientDataSet1QuantidadeSessoes: TIntegerField
      FieldName = 'QuantidadeSessoes'
      ProviderFlags = []
    end
    object ClientDataSet1PACIENTE: TStringField
      FieldName = 'PACIENTE'
      ProviderFlags = []
      Size = 50
    end
    object ClientDataSet1NUMEROPSICOLOGO: TStringField
      FieldName = 'NUMEROPSICOLOGO'
      ProviderFlags = []
      Size = 10
    end
    object ClientDataSet1PSICOLOGO: TStringField
      FieldName = 'PSICOLOGO'
      ProviderFlags = []
      Size = 50
    end
    object ClientDataSet1Valor: TSingleField
      FieldName = 'Valor'
      ProviderFlags = []
      DisplayFormat = ',0.00;'
    end
    object ClientDataSet1Descricao: TStringField
      FieldName = 'Descricao'
      ProviderFlags = []
      Size = 300
    end
    object ClientDataSet1NOMECONVENIO: TStringField
      FieldName = 'NOMECONVENIO'
      ProviderFlags = []
      Required = True
      Size = 30
    end
    object ClientDataSet1NumeroCarteira: TStringField
      FieldName = 'NumeroCarteira'
      ProviderFlags = []
      Size = 30
    end
    object ClientDataSet1Antecedentes: TStringField
      FieldName = 'Antecedentes'
      ProviderFlags = []
      Size = 500
    end
    object ClientDataSet1Convenio: TStringField
      FieldName = 'Convenio'
      ProviderFlags = []
      Size = 50
    end
    object ClientDataSet1DataNascimento: TDateField
      FieldName = 'DataNascimento'
      ProviderFlags = []
    end
    object ClientDataSet1Encaminhado: TStringField
      FieldName = 'Encaminhado'
      ProviderFlags = []
      Size = 50
    end
    object ClientDataSet1Endereco: TStringField
      FieldName = 'Endereco'
      ProviderFlags = []
      Size = 100
    end
    object ClientDataSet1Medicacoes: TStringField
      FieldName = 'Medicacoes'
      ProviderFlags = []
      Size = 100
    end
    object ClientDataSet1Nacionalidade: TStringField
      FieldName = 'Nacionalidade'
      ProviderFlags = []
      Size = 50
    end
    object ClientDataSet1Naturalidade: TStringField
      FieldName = 'Naturalidade'
      ProviderFlags = []
      Size = 50
    end
    object ClientDataSet1Profissao: TStringField
      FieldName = 'Profissao'
      ProviderFlags = []
      Size = 50
    end
    object ClientDataSet1QueixaInicial: TStringField
      FieldName = 'QueixaInicial'
      ProviderFlags = []
      Size = 1000
    end
    object ClientDataSet1Religiao: TStringField
      FieldName = 'Religiao'
      ProviderFlags = []
      Size = 50
    end
    object ClientDataSet1Telefones: TStringField
      FieldName = 'Telefones'
      ProviderFlags = []
      Size = 50
    end
    object ClientDataSet1CodigoEspecialista: TIntegerField
      FieldName = 'CodigoEspecialista'
      ProviderFlags = []
    end
    object ClientDataSet1UF: TStringField
      FieldName = 'UF'
      ProviderFlags = []
      Size = 2
    end
    object ClientDataSet1Municipio: TStringField
      FieldName = 'Municipio'
      ProviderFlags = []
      Size = 25
    end
    object ClientDataSet1Bairro: TStringField
      FieldName = 'Bairro'
      ProviderFlags = []
      Size = 25
    end
    object ClientDataSet1Cep: TStringField
      FieldName = 'Cep'
      ProviderFlags = []
      Size = 10
    end
    object ClientDataSet1RG: TStringField
      FieldName = 'RG'
      ProviderFlags = []
      Size = 15
    end
    object ClientDataSet1OE: TStringField
      FieldName = 'OE'
      ProviderFlags = []
      Size = 15
    end
    object ClientDataSet1DataEmissao: TDateField
      FieldName = 'DataEmissao'
      ProviderFlags = []
    end
    object ClientDataSet1NomePai: TStringField
      FieldName = 'NomePai'
      ProviderFlags = []
      Size = 50
    end
    object ClientDataSet1NomeMae: TStringField
      FieldName = 'NomeMae'
      ProviderFlags = []
      Size = 50
    end
    object ClientDataSet1CodigoConvenio: TIntegerField
      FieldName = 'CodigoConvenio'
      ProviderFlags = []
    end
    object ClientDataSet1Email: TStringField
      FieldName = 'Email'
      ProviderFlags = []
      Size = 50
    end
    object ClientDataSet1NUMEROENCAMINHADO: TStringField
      FieldName = 'NUMEROENCAMINHADO'
      ProviderFlags = []
      Size = 10
    end
    object ClientDataSet1NumeroOperadora: TStringField
      FieldName = 'NumeroOperadora'
      ProviderFlags = []
    end
    object ClientDataSet1Conselho: TStringField
      FieldName = 'Conselho'
      ProviderFlags = []
      Size = 10
    end
    object ClientDataSet1CONSELHO2: TStringField
      FieldName = 'CONSELHO2'
      ProviderFlags = []
      Size = 10
    end
    object ClientDataSet1DESCRICAOTABELACID: TStringField
      FieldName = 'DESCRICAOTABELACID'
      ProviderFlags = []
      Size = 200
    end
    object ClientDataSet1CodigoCID: TIntegerField
      FieldName = 'CodigoCID'
    end
    object ClientDataSet1LKCodigoCID: TStringField
      FieldKind = fkLookup
      FieldName = 'LKCodigoCID'
      LookupDataSet = TabelaCID
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'CodigoCID'
      Size = 200
      Lookup = True
    end
    object ClientDataSet1Autorizacao: TStringField
      FieldName = 'Autorizacao'
    end
    object ClientDataSet1DATAPAGAMENTO: TDateField
      FieldName = 'DATAPAGAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object ClientDataSet1VALORFATURA: TSingleField
      FieldName = 'VALORFATURA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00;'
    end
    object ClientDataSet1CodigoTipoAgendamento: TIntegerField
      FieldName = 'CodigoTipoAgendamento'
      Required = True
    end
    object ClientDataSet1Situacao: TStringField
      FieldName = 'Situacao'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object ClientDataSet1HOSPITAL: TStringField
      FieldName = 'HOSPITAL'
      Size = 100
    end
    object ClientDataSet1CalcIdade: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CalcIdade'
      Calculated = True
    end
  end
  object SQLDataSet2: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'Select  '#13#10'ss."Codigo", ss."CodigoAgendamento", ss."Data", ss."Ho' +
      'ra"  '#13#10'From '#13#10'Sessoes ss'#13#10'inner join Agendamento  on '#13#10'Agendamen' +
      'to."Codigo" = ss."CodigoAgendamento"'#13#10' LEFT JOIN  Triagem       ' +
      '          on '#13#10'               Agendamento."CodigoPaciente" = Tri' +
      'agem."Codigo"'#13#10'         LEFT  join Especialista            on '#13#10 +
      '               Agendamento."CodigoEspecialista" = Especialista."' +
      'Codigo"'#13#10'         LEFT  join Convenio               on '#13#10'       ' +
      '        Agendamento."CodigoConvenio" = Convenio."Codigo"'#13#10'      ' +
      '   LEFT join TipoAgendamento on '#13#10'               Agendamento."Co' +
      'digoTipoAgendamento" = TipoAgendamento."Codigo"  and '#13#10'         ' +
      '     Agendamento."CodigoConvenio" = TipoAgendamento."CodigoConve' +
      'nio"'#13#10'         LEFT  join Especialista esp2      on '#13#10'          ' +
      '     esp2."Codigo" = Agendamento."CodigoEncaminhado"'#13#10'        LE' +
      'FT JOIN TabelaCID tbcid on '#13#10'               tbcid."Codigo" = Age' +
      'ndamento."CodigoCID"'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DSServerModuleBaseDados.LSCONEXAO
    Left = 352
    Top = 56
    object SQLDataSet2Codigo: TIntegerField
      FieldName = 'Codigo'
      Required = True
    end
    object SQLDataSet2CodigoAgendamento: TIntegerField
      FieldName = 'CodigoAgendamento'
      Required = True
    end
    object SQLDataSet2Data: TDateField
      FieldName = 'Data'
    end
    object SQLDataSet2Hora: TStringField
      FieldName = 'Hora'
      Size = 5
    end
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = SQLDataSet2
    ResolveToDataSet = True
    OnDataRequest = DataSetProvider2DataRequest
    Left = 352
    Top = 112
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'CodigoAgendamento'
    MasterFields = 'CodigoAgendamento'
    MasterSource = DataSource1
    Params = <>
    ProviderName = 'DataSetProvider2'
    Left = 352
    Top = 168
    object ClientDataSet2Codigo: TIntegerField
      FieldName = 'Codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ClientDataSet2CodigoAgendamento: TIntegerField
      FieldName = 'CodigoAgendamento'
      Required = True
    end
    object ClientDataSet2Data: TDateField
      FieldName = 'Data'
    end
    object ClientDataSet2Hora: TStringField
      FieldName = 'Hora'
      Size = 5
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 240
    Top = 224
  end
  object SQLDataSet3: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'Select   *  From TabelaCID'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DSServerModuleBaseDados.LSCONEXAO
    Left = 104
    Top = 56
  end
  object DataSetProvider3: TDataSetProvider
    DataSet = SQLDataSet3
    ResolveToDataSet = True
    Left = 104
    Top = 112
  end
  object TabelaCID: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider3'
    Left = 104
    Top = 168
    object TabelaCIDCodigo: TIntegerField
      FieldName = 'Codigo'
      Required = True
    end
    object TabelaCIDDescricao: TStringField
      FieldName = 'Descricao'
      Size = 200
    end
  end
  object srcLKTabelaCID: TDataSource
    DataSet = TabelaCID
    Left = 104
    Top = 224
  end
end
