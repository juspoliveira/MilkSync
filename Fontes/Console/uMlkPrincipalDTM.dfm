object MlkPrincipalDTM: TMlkPrincipalDTM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 515
  Width = 718
  object cnnMaster: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=esd056402;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=MilkSync;Data Source=DESKTOP-KUC122' +
      '3\AGRITECH'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 24
  end
  object dspContas: TDataSetProvider
    DataSet = qryContas
    Left = 96
    Top = 112
  end
  object qryContas: TADOQuery
    Connection = cnnMaster
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Contas where 1=1  Order By Id')
    Left = 24
    Top = 112
  end
  object cdsContas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContas'
    BeforePost = cdsContasBeforePost
    Left = 240
    Top = 112
    object cdsContasId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object cdsContasNomeEmpresa: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'NomeEmpresa'
      Size = 70
    end
    object cdsContasContaId: TIntegerField
      DisplayLabel = 'Id. Conta'
      FieldName = 'ContaId'
    end
    object cdsContasKeyId: TStringField
      DisplayLabel = 'Chave ERP'
      FieldName = 'KeyId'
      Size = 15
    end
    object cdsContasAtiva: TStringField
      FieldName = 'Ativa'
      Size = 1
    end
    object cdsContasPathArqDescarga: TStringField
      FieldName = 'PathArqDescarga'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object cdsContasPercAtesto: TFloatField
      FieldName = 'PercAtesto'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContasHostURL: TStringField
      FieldName = 'HostURL'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object cdsContasLog: TStringField
      FieldName = 'Log'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsContasProxyHost: TStringField
      FieldName = 'ProxyHost'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContasProxyPorta: TStringField
      FieldName = 'ProxyPorta'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsContasProxyUsuario: TStringField
      FieldName = 'ProxyUsuario'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContasProxySenha: TStringField
      FieldName = 'ProxySenha'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContasIntervalo: TFloatField
      FieldName = 'Intervalo'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContasProxyUsar: TStringField
      FieldName = 'ProxyUsar'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsContasDatIniLeituraDescargaWS: TDateTimeField
      FieldName = 'DatIniLeituraDescargaWS'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContasDatUltLeituraDescargaWS: TDateTimeField
      FieldName = 'DatUltLeituraDescargaWS'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContasEnviarNotifAtesto: TStringField
      FieldName = 'EnviarNotifAtesto'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsContasGeraTotvsDatasul: TStringField
      FieldName = 'GeraTotvsDatasul'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsContasGeraTotvsRm: TStringField
      FieldName = 'GeraTotvsRm'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsContasGeraMagis: TStringField
      FieldName = 'GeraMagis'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsContasGeraMeta: TStringField
      FieldName = 'GeraMeta'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsContasGeraSiga: TStringField
      FieldName = 'GeraSiga'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsContasVerDatasul: TStringField
      FieldName = 'VerDatasul'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsContasVerRm: TStringField
      FieldName = 'VerRm'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsContasVerMagis: TStringField
      FieldName = 'VerMagis'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsContasVerMeta: TStringField
      FieldName = 'VerMeta'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsContasVerSiga: TStringField
      FieldName = 'VerSiga'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsContasGeraScl: TStringField
      FieldName = 'GeraScl'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsContasVerScl: TStringField
      FieldName = 'VerScl'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsContasPathArqDatasul: TStringField
      FieldName = 'PathArqDatasul'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object cdsContasPathArqRm: TStringField
      FieldName = 'PathArqRm'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object cdsContasPathArqMagis: TStringField
      FieldName = 'PathArqMagis'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object cdsContasPathArqMeta: TStringField
      FieldName = 'PathArqMeta'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object cdsContasPathArqSiga: TStringField
      FieldName = 'PathArqSiga'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object cdsContasPathArqScl: TStringField
      FieldName = 'PathArqScl'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object cdsContasParContaId1: TIntegerField
      FieldName = 'ParContaId1'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContasPathArqCarga: TStringField
      FieldName = 'PathArqCarga'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object cdsContasIntervaloCarga: TFloatField
      FieldName = 'IntervaloCarga'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContasCargaMultiEmpresa: TStringField
      FieldName = 'CargaMultiEmpresa'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsContasPathCargaApi: TStringField
      FieldName = 'PathCargaApi'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object cdsContasDropTable: TStringField
      FieldName = 'DropTable'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsContasParColetasHoje: TStringField
      FieldName = 'ParColetasHoje'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsContasPathMapRota: TStringField
      DisplayWidth = 150
      FieldName = 'PathMapRota'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object cdsContasPatMapColetor: TStringField
      FieldName = 'PatMapColetor'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object cdsContasPatMapAnalise: TStringField
      FieldName = 'PatMapAnalise'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object cdsContasPatMapExtrato: TStringField
      FieldName = 'PatMapExtrato'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object cdsContasPatMapFazenda: TStringField
      FieldName = 'PatMapFazenda'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object cdsContasPatMapItinerario: TStringField
      FieldName = 'PatMapItinerario'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object cdsContasPatMapLinha: TStringField
      FieldName = 'PatMapLinha'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object cdsContasPatMapMotivo: TStringField
      FieldName = 'PatMapMotivo'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object cdsContasPatMapProdutor: TStringField
      FieldName = 'PatMapProdutor'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object cdsContasPatMapGrupoRota: TStringField
      FieldName = 'PatMapGrupoRota'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object cdsContasPatMapTanque: TStringField
      FieldName = 'PatMapTanque'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object cdsContasPatMapTag: TStringField
      FieldName = 'PatMapTag'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object cdsContasPatMapTecnico: TStringField
      FieldName = 'PatMapTecnico'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object cdsContasPatMapVinculado: TStringField
      FieldName = 'PatMapVinculado'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object cdsContasPatMapVeiculo: TStringField
      FieldName = 'PatMapVeiculo'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object cdsContasSync: TStringField
      FieldName = 'Sync'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object sqlContas: TS2SQLDataSet
    ADOQuery = qryContas
    Left = 176
    Top = 112
  end
  object apiConsole: TJvAppInstances
    Left = 96
    Top = 24
  end
  object tmrConsole: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = tmrConsoleTimer
    Left = 171
    Top = 24
  end
  object sheConsole: TJvScheduledEvents
    AutoSave = False
    Events = <
      item
        Name = 'evtDescarga'
        StartDate = '2016/07/15 17:33:10.000'
        RecurringType = srkDaily
        EndType = sekNone
        Freq_StartTime = 0
        Freq_EndTime = 86399000
        Freq_Interval = 10800000
        Daily_EveryWeekDay = True
      end>
    Left = 233
    Top = 24
  end
  object tmrSync: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = tmrSyncTimer
    Left = 291
    Top = 24
  end
  object qryViagem: TADOQuery
    Connection = cnnMaster
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from LogViagem')
    Left = 24
    Top = 192
  end
  object qryDescarga: TADOQuery
    Connection = cnnMaster
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from LogDescarga')
    Left = 24
    Top = 272
  end
  object dspViagem: TDataSetProvider
    DataSet = qryViagem
    Left = 96
    Top = 192
  end
  object dspDescarga: TDataSetProvider
    DataSet = qryDescarga
    Left = 96
    Top = 272
  end
  object cdsViagem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspViagem'
    Left = 168
    Top = 193
    object cdsViagemLovId: TAutoIncField
      FieldName = 'LovId'
      ReadOnly = True
    end
    object cdsViagemLovRotaId: TIntegerField
      FieldName = 'LovRotaId'
    end
    object cdsViagemLovRotaCod: TStringField
      FieldName = 'LovRotaCod'
    end
    object cdsViagemLovEnviaNotif: TStringField
      FieldName = 'LovEnviaNotif'
      Size = 1
    end
    object cdsViagemLovDataProc: TWideStringField
      FieldName = 'LovDataProc'
      Size = 10
    end
    object cdsViagemLovDifColeta: TFloatField
      FieldName = 'LovDifColeta'
    end
    object cdsViagemLovQtdeDescarga: TIntegerField
      FieldName = 'LovQtdeDescarga'
    end
    object cdsViagemLovViagemId: TIntegerField
      FieldName = 'LovViagemId'
    end
    object cdsViagemLovGerDatasul: TStringField
      FieldName = 'LovGerDatasul'
      Size = 1
    end
    object cdsViagemLovGerRm: TStringField
      FieldName = 'LovGerRm'
      Size = 1
    end
    object cdsViagemLovGerMagis: TStringField
      FieldName = 'LovGerMagis'
      Size = 1
    end
    object cdsViagemLovGerMeta: TStringField
      FieldName = 'LovGerMeta'
      Size = 1
    end
    object cdsViagemLovGerSiga: TStringField
      FieldName = 'LovGerSiga'
      Size = 1
    end
    object cdsViagemLovColetor: TStringField
      FieldName = 'LovColetor'
      Size = 15
    end
    object cdsViagemLovVeiculo: TStringField
      FieldName = 'LovVeiculo'
      Size = 15
    end
    object cdsViagemLovDataViagem: TWideStringField
      FieldName = 'LovDataViagem'
      Size = 10
    end
    object cdsViagemLovGerScl: TStringField
      FieldName = 'LovGerScl'
      Size = 1
    end
    object cdsViagemLovIndex: TIntegerField
      FieldName = 'LovIndex'
    end
  end
  object cdsDescarga: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDescarga'
    Left = 168
    Top = 272
    object cdsDescargaLodId: TAutoIncField
      FieldName = 'LodId'
      ReadOnly = True
    end
    object cdsDescargaLodDescargaId: TIntegerField
      FieldName = 'LodDescargaId'
    end
    object cdsDescargaLodRotaId: TIntegerField
      FieldName = 'LodRotaId'
    end
    object cdsDescargaLodRotaCod: TStringField
      FieldName = 'LodRotaCod'
      Size = 50
    end
    object cdsDescargaLodEnviaNota: TStringField
      FieldName = 'LodEnviaNota'
      Size = 1
    end
    object cdsDescargaLodDataProc: TWideStringField
      FieldName = 'LodDataProc'
      Size = 10
    end
    object cdsDescargaLodDifColeta: TFloatField
      FieldName = 'LodDifColeta'
    end
  end
  object qrySql: TADOQuery
    Connection = cnnMaster
    Parameters = <>
    Left = 352
    Top = 24
  end
  object qryControle: TADOQuery
    Connection = cnnMaster
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Controle')
    Left = 424
    Top = 24
  end
  object dspControle: TDataSetProvider
    DataSet = qryControle
    Left = 504
    Top = 24
  end
  object cdsControle: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspControle'
    Left = 576
    Top = 24
    object cdsControleId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object cdsControleIntervalo: TIntegerField
      FieldName = 'Intervalo'
    end
    object cdsControleIntervalocarga: TIntegerField
      FieldName = 'Intervalocarga'
    end
  end
end
