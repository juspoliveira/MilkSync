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
    object cdsViagemContaId: TIntegerField
      FieldName = 'ContaId'
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
    object cdsViagemLovDataViagem: TDateTimeField
      FieldName = 'LovDataViagem'
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
    object cdsControleultimaiteracao: TDateTimeField
      FieldName = 'ultimaiteracao'
    end
  end
  object cdsColetas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspColetas'
    Left = 312
    Top = 200
    object cdsColetasid: TIntegerField
      FieldName = 'id'
      ProviderFlags = [pfInWhere]
      Visible = False
    end
    object cdsColetasdt_push: TDateTimeField
      FieldName = 'dt_push'
      ProviderFlags = [pfInWhere]
      Visible = False
    end
    object cdsColetasparada_id: TIntegerField
      DisplayLabel = 'Fazenda'
      FieldName = 'parada_id'
      Required = True
      Visible = False
    end
    object cdsColetascoletor_id: TIntegerField
      DisplayLabel = 'Coletor'
      FieldName = 'coletor_id'
      Required = True
      Visible = False
    end
    object cdsColetastanque_id: TIntegerField
      DisplayLabel = 'Tanque'
      FieldName = 'tanque_id'
      Required = True
      Visible = False
    end
    object cdsColetasviagem_id: TIntegerField
      FieldName = 'viagem_id'
    end
    object cdsColetasdt_coleta: TDateTimeField
      DisplayLabel = 'Data Coleta'
      FieldName = 'dt_coleta'
    end
    object cdsColetasCodigoFazenda: TWideStringField
      Tag = 1
      DisplayLabel = 'Cod. Fazenda'
      FieldName = 'CodigoFazenda'
      Size = 15
    end
    object cdsColetasFazenda: TWideStringField
      Tag = 1
      FieldName = 'Fazenda'
      ProviderFlags = []
      Size = 100
    end
    object cdsColetasCodigoProdutor: TWideStringField
      DisplayLabel = 'Cod.  Produtor'
      FieldName = 'CodigoProdutor'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object cdsColetasProdutor: TWideStringField
      Tag = 1
      FieldName = 'Produtor'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
    object cdsColetastanque: TWideStringField
      Tag = 1
      DisplayLabel = 'Tanque'
      FieldName = 'tanque'
      Size = 45
    end
    object cdsColetasquantidade: TIntegerField
      FieldName = 'quantidade'
    end
    object cdsColetasregua: TFloatField
      DisplayLabel = 'Medida da R'#233'gua'
      FieldName = 'regua'
    end
    object cdsColetasalizarol: TWideStringField
      DisplayLabel = 'Alizarol'
      FieldName = 'alizarol'
      ProviderFlags = [pfInWhere]
      Size = 1
    end
    object cdsColetasamostra: TWideStringField
      DisplayLabel = 'N'#186' Amostra'
      FieldName = 'amostra'
      Size = 15
    end
    object cdsColetascontraprova: TWideStringField
      DisplayLabel = 'N'#186' Lacre'
      FieldName = 'contraprova'
      Size = 45
    end
    object cdsColetastemperatura: TFloatField
      DisplayLabel = 'Temperatura'
      FieldName = 'temperatura'
    end
    object cdsColetasBoca: TStringField
      FieldName = 'boca'
      Size = 5
    end
    object cdsColetascoletada: TWideStringField
      DisplayLabel = 'Status'
      FieldName = 'coletada'
      ProviderFlags = [pfInWhere]
      Size = 1
    end
    object cdsColetasCodigoLinha: TWideStringField
      DisplayLabel = 'Cod. Linha'
      FieldName = 'CodigoLinha'
      ProviderFlags = [pfInWhere]
    end
    object cdsColetasNomeLinha: TWideStringField
      DisplayLabel = 'Linha'
      FieldName = 'NomeLinha'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsColetasCodigoRota: TWideStringField
      DisplayLabel = 'Cod. Rota'
      FieldName = 'CodigoRota'
      ProviderFlags = [pfInWhere]
    end
    object cdsColetasRota: TWideStringField
      FieldName = 'Rota'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsColetasVeiculo: TWideStringField
      Tag = 1
      FieldName = 'Veiculo'
      ProviderFlags = [pfInWhere]
      Size = 8
    end
    object cdsColetasCodigoMotorista: TWideStringField
      Tag = 1
      DisplayLabel = 'Cod. Coletor'
      FieldName = 'CodigoMotorista'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object cdsColetasNomeMotorista: TWideStringField
      Tag = 1
      DisplayLabel = 'Coletor'
      FieldName = 'NomeMotorista'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
    object cdsColetasdt_edicao: TDateTimeField
      Tag = 1
      DisplayLabel = 'Dt. Edi'#231#227'o'
      FieldName = 'dt_edicao'
    end
  end
  object cdsRota: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 383
    Top = 200
    object cdsRotaCodigo: TStringField
      FieldName = 'codigo'
    end
    object cdsRotaNome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object cdsRotatipo_descarga: TStringField
      DisplayLabel = 'Tipo Descarga'
      FieldName = 'tipo_descarga'
      Size = 2
    end
    object cdsRotagruporota: TStringField
      FieldName = 'grupo_rota'
      Size = 1
    end
  end
  object cdsLinha: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 454
    Top = 200
    object cdsLinhaCodigo: TStringField
      FieldName = 'codigo'
    end
    object cdsLinhaNome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object cdsLinhaRota: TStringField
      FieldName = 'rota'
      Origin = 'fk'
    end
    object cdsLinhadistancia: TIntegerField
      FieldName = 'distancia'
    end
  end
  object cdsProdutor: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
    Top = 200
    object cdsProdutorInscricao: TStringField
      Tag = 1
      FieldName = 'inscricao'
      Size = 15
    end
    object cdsProdutorUltimaColeta: TStringField
      Tag = 1
      FieldName = 'ultimacoleta'
      Size = 10
    end
    object cdsProdutorQtdColeta: TFloatField
      Tag = 1
      FieldName = 'qtdcoleta'
    end
    object cdsProdutorLinha: TStringField
      Tag = 1
      FieldName = 'linha'
      Size = 5
    end
    object cdsProdutorCodigo: TStringField
      FieldName = 'codigo'
      Size = 15
    end
    object cdsProdutorNome: TStringField
      FieldName = 'nome'
      Size = 100
    end
    object cdsProdutordoc: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'doc'
    end
    object cdsProdutorLogradouro: TStringField
      FieldName = 'logradouro'
      Size = 100
    end
    object cdsProdutorNumero: TStringField
      FieldName = 'numero'
      Size = 10
    end
    object cdsProdutorBairro: TStringField
      FieldName = 'bairro'
      Size = 60
    end
    object cdsProdutorCidade: TStringField
      FieldName = 'cidade'
      Size = 60
    end
    object cdsProdutorUf: TStringField
      FieldName = 'uf'
      Size = 2
    end
    object cdsProdutorCep: TStringField
      FieldName = 'cep'
      Size = 10
    end
  end
  object cdsColetor: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 604
    Top = 200
    object cdsColetorCodigo: TStringField
      FieldName = 'codigo'
    end
    object cdsColetorNome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object cdsColetorcpf: TStringField
      FieldName = 'cpf'
      Size = 15
    end
    object cdsColetorrg: TStringField
      FieldName = 'rg'
      Size = 15
    end
    object cdsColetorcnh: TStringField
      FieldName = 'cnh'
    end
  end
  object cdsVeiculos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 381
    Top = 271
    object cdsVeiculosid: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'id'
      Calculated = True
    end
    object cdsVeiculosuf: TStringField
      Tag = 1
      FieldName = 'uf'
      Size = 2
    end
    object cdsVeiculosrntc: TStringField
      Tag = 1
      FieldName = 'rntc'
    end
    object cdsVeiculoscodigo: TStringField
      FieldName = 'codigo'
    end
    object cdsVeiculosplaca: TStringField
      FieldName = 'placa'
      Size = 8
    end
    object cdsVeiculostipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
    object cdsVeiculospesobruto: TFloatField
      FieldName = 'pesobruto'
    end
    object cdsVeiculospesoliquido: TFloatField
      FieldName = 'pesoliquido'
    end
    object cdsVeiculoscapacidade: TFloatField
      FieldName = 'capacidade'
    end
  end
  object cdsFazendas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 465
    Top = 271
    object cdsFazendascodigo: TStringField
      FieldName = 'codigo'
      Size = 15
    end
    object cdsFazendasnome: TStringField
      FieldName = 'nome'
      Size = 80
    end
    object cdsFazendaslogradouro: TStringField
      FieldName = 'logradouro'
      Size = 60
    end
    object cdsFazendasnumero: TStringField
      FieldName = 'numero'
      Size = 10
    end
    object cdsFazendasbairro: TStringField
      FieldName = 'bairro'
      Size = 60
    end
    object cdsFazendasmunicipio: TStringField
      FieldName = 'municipio'
      Size = 60
    end
    object cdsFazendasuf: TStringField
      FieldName = 'uf'
      Size = 2
    end
    object cdsFazendascep: TStringField
      FieldName = 'cep'
      Size = 10
    end
    object cdsFazendasproducao: TFloatField
      FieldName = 'producao'
    end
    object cdsFazendaslatitude: TStringField
      FieldName = 'latitude'
    end
    object cdsFazendaslongitude: TStringField
      FieldName = 'longitude'
    end
    object cdsFazendasprodutor: TStringField
      FieldName = 'produtor'
      Size = 15
    end
  end
  object cdsViagens: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 272
    object cdsViagensid: TIntegerField
      FieldName = 'id'
    end
    object cdsViagensveiculo_id: TIntegerField
      DisplayLabel = 'Ve'#237'culo'
      FieldName = 'veiculo_id'
      Required = True
      Visible = False
    end
    object cdsViagenscoletor_id: TIntegerField
      DisplayLabel = 'Coletor'
      FieldName = 'coletor_id'
      Required = True
      Visible = False
    end
    object cdsViagenslinha_id: TIntegerField
      DisplayLabel = 'Linha'
      FieldName = 'linha_id'
      Required = True
      Visible = False
    end
    object cdsViagensrota_id: TIntegerField
      DisplayLabel = 'Rota'
      FieldName = 'rota_id'
      Required = True
      Visible = False
    end
    object cdsViagensdt_push: TDateTimeField
      FieldName = 'dt_push'
      Visible = False
    end
    object cdsViagensNumeroViagem: TIntegerField
      FieldName = 'NumeroViagem'
    end
    object cdsViagensdt_abertura: TDateTimeField
      DisplayLabel = 'Dt. Abertura'
      FieldName = 'dt_abertura'
    end
    object cdsViagensdt_fechamento: TDateTimeField
      DisplayLabel = 'Dt. Fechamento'
      FieldName = 'dt_fechamento'
    end
    object cdsViagenskm_inicial: TFloatField
      DisplayLabel = 'km Incial'
      FieldName = 'km_inicial'
    end
    object cdsViagenskm_final: TFloatField
      DisplayLabel = 'km Final'
      FieldName = 'km_final'
    end
    object cdsViagensdt_liberacao: TDateTimeField
      DisplayLabel = 'Data Libera'#231#227'o'
      FieldName = 'dt_liberacao'
    end
    object cdsViagenskm_distancia: TIntegerField
      DisplayLabel = 'Dist'#226'ncia Percorrida'
      FieldName = 'km_distancia'
    end
    object cdsViagenskm_padrao: TIntegerField
      DisplayLabel = 'Dist'#226'ncia Prevista'
      FieldName = 'km_padrao'
    end
    object cdsViagenskm_real: TIntegerField
      DisplayLabel = 'Dist'#226'ncia Assumida'
      FieldName = 'km_real'
    end
    object cdsViagenskm_justificativa: TWideStringField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'km_justificativa'
      Size = 300
    end
    object cdsViagensrota: TWideStringField
      FieldName = 'rota'
      Size = 15
    end
    object cdsViagenscoletor: TWideStringField
      FieldName = 'coletor'
      Size = 15
    end
    object cdsViagenslinha: TWideStringField
      FieldName = 'linha'
      Size = 15
    end
    object cdsViagensveiculo: TWideStringField
      FieldName = 'veiculo'
      Size = 15
    end
    object cdsViagensPlacaVeiculo: TStringField
      FieldName = 'PlacaVeiculo'
      Size = 8
    end
    object cdsViagensNomeLinha: TStringField
      FieldName = 'NomeLinha'
      Size = 100
    end
    object cdsViagensNomeRota: TStringField
      FieldName = 'NomeRota'
      Size = 100
    end
    object cdsViagensNomeColetor: TStringField
      FieldName = 'NomeColetor'
      Size = 100
    end
    object cdsViagenscomunitario_pendente: TStringField
      FieldName = 'comunitario_pendente'
    end
    object cdsViagensbocas: TStringField
      FieldName = 'bocas'
    end
  end
  object qryAux: TADOQuery
    Connection = cnnMaster
    Parameters = <>
    Left = 440
    Top = 112
  end
  object qryApoio: TADOQuery
    Connection = cnnMaster
    Parameters = <>
    Left = 504
    Top = 112
  end
  object ImageList1: TImageList
    Left = 312
    Top = 104
  end
end
