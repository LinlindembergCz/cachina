object ServerMethodsGeneric: TServerMethodsGeneric
  OldCreateOrder = False
  Height = 298
  Width = 479
  object dspConsulta: TDataSetProvider
    DataSet = FDQuery1
    Constraints = False
    OnDataRequest = dspConsultaDataRequest
    Left = 144
    Top = 168
  end
  object FDQuery1: TFDQuery
    AutoCalcFields = False
    ObjectView = False
    IndexesActive = False
    Connection = ServerContainer1.FDConnection1
    FetchOptions.AssignedValues = [evItems]
    FetchOptions.Items = [fiBlobs, fiDetails]
    ResourceOptions.AssignedValues = [rvSilentMode]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvUpdateChngFields, uvRefreshDelete, uvCountUpdatedRecords, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.RefreshDelete = False
    UpdateOptions.CountUpdatedRecords = False
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    Left = 144
    Top = 104
  end
end
