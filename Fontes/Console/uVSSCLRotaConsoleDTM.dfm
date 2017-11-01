object VSSCLRotaConsoleDTM: TVSSCLRotaConsoleDTM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 711
  Top = 24
  Height = 592
  Width = 455
  object zcnnRota: TZConnection
    ControlsCodePage = cGET_ACP
    UTF8StringsAsWideField = False
    AutoEncodeStrings = False
    Properties.Strings = (
      'controls_cp=GET_ACP')
    Connected = True
    Port = 0
    Database = 'C:\Desenvolvimento\tools\MilkSync\Deploy\VSSCLRota.db'
    Protocol = 'sqlite-3'
    Left = 40
    Top = 16
  end
  object qryParametros: TZQuery
    Connection = zcnnRota
    SQL.Strings = (
      'SELECT * FROM Parametros')
    Params = <>
    Left = 40
    Top = 76
    object qryParametrosParContaId: TIntegerField
      FieldName = 'ParContaId'
    end
    object qryParametrosParDatUltLeituraDescargaWS: TDateField
      FieldName = 'ParDatUltLeituraDescargaWS'
    end
    object qryParametrosParPathArqDescarga: TStringField
      FieldName = 'ParPathArqDescarga'
      Size = 1020
    end
    object qryParametrosParPercAtesto: TFloatField
      FieldName = 'ParPercAtesto'
    end
    object qryParametrosParHostURL: TStringField
      FieldName = 'ParHostURL'
      Size = 2000
    end
    object qryParametrosParLog: TStringField
      FieldName = 'ParLog'
      Size = 4
    end
    object qryParametrosParProxyHost: TStringField
      FieldName = 'ParProxyHost'
      Size = 80
    end
    object qryParametrosParProxyPorta: TStringField
      FieldName = 'ParProxyPorta'
      Size = 40
    end
    object qryParametrosParProxyUsuario: TStringField
      FieldName = 'ParProxyUsuario'
      Size = 80
    end
    object qryParametrosParProxySenha: TStringField
      FieldName = 'ParProxySenha'
      Size = 80
    end
    object qryParametrosParIntervalo: TFloatField
      FieldName = 'ParIntervalo'
    end
    object qryParametrosParIntervaloCarga: TFloatField
      FieldName = 'ParIntervaloCarga'
    end
    object qryParametrosParProxyUsar: TStringField
      FieldName = 'ParProxyUsar'
      Size = 4
    end
    object qryParametrosParEnviarNotifAtesto: TStringField
      FieldName = 'ParEnviarNotifAtesto'
      Size = 4
    end
    object qryParametrosParDatIniLeituraDescargaWS: TDateField
      FieldName = 'ParDatIniLeituraDescargaWS'
    end
    object cdsParametrosParGeraTotvsDatasul: TStringField
      FieldName = 'ParGeraTotvsDatasul'
      Size = 4
    end
    object cdsParametrosParGeraTotvsRm: TStringField
      FieldName = 'ParGeraTotvsRm'
      Size = 4
    end
    object cdsParametrosParGeraMagis: TStringField
      FieldName = 'ParGeraMagis'
      Size = 4
    end
    object cdsParametrosParGeraMeta: TStringField
      FieldName = 'ParGeraMeta'
      Size = 4
    end
    object cdsParametrosParGeraSiga: TStringField
      FieldName = 'ParGeraSiga'
      Size = 4
    end
    object cdsParametrosParGeraScl: TStringField
      FieldName = 'ParGeraScl'
      Size = 4
    end
    object cdsParametrosParVerDatasul: TStringField
      FieldName = 'ParVerDatasul'
      Size = 4
    end
    object cdsParametrosParVerRm: TStringField
      FieldName = 'ParVerRm'
      Size = 4
    end
    object cdsParametrosParVerMagis: TStringField
      FieldName = 'ParVerMagis'
      Size = 4
    end
    object cdsParametrosParVerMeta: TStringField
      FieldName = 'ParVerMeta'
      Size = 4
    end
    object cdsParametrosParVerSiga: TStringField
      FieldName = 'ParVerSiga'
      Size = 4
    end
    object cdsParametrosParVerScl: TStringField
      FieldName = 'ParVerScl'
      Size = 4
    end
    object cdsParametrosParPathArqCarga: TStringField
      FieldName = 'ParPathArqCarga'
      Size = 1020
    end
    object cdsParametrosParPathArqDatasul: TStringField
      FieldName = 'ParPathArqDatasul'
      Size = 1020
    end
    object cdsParametrosParPathArqRm: TStringField
      FieldName = 'ParPathArqRm'
      Size = 1020
    end
    object cdsParametrosParPathArqMagis: TStringField
      FieldName = 'ParPathArqMagis'
      Size = 1020
    end
    object cdsParametrosParPathArqMeta: TStringField
      FieldName = 'ParPathArqMeta'
      Size = 1020
    end
    object cdsParametrosParPathArqSiga: TStringField
      FieldName = 'ParPathArqSiga'
      Size = 1020
    end
    object cdsParametrosParPathArqScl: TStringField
      FieldName = 'ParPathArqScl'
      Size = 1020
    end
    object cdsParametrosParContaId1: TIntegerField
      FieldName = 'ParContaId1'
    end
    object cdsParametrosParContaId2: TIntegerField
      FieldName = 'ParContaId2'
    end
    object cdsParametrosParContaId3: TIntegerField
      FieldName = 'ParContaId3'
    end
    object cdsParametrosParContaId4: TIntegerField
      FieldName = 'ParContaId4'
    end
    object cdsParametrosParContaId5: TIntegerField
      FieldName = 'ParContaId5'
    end
    object cdsParametrosParContaId6: TIntegerField
      FieldName = 'ParContaId6'
    end
    object cdsParametrosParKeyId1: TStringField
      FieldName = 'ParKeyId1'
      Size = 60
    end
    object cdsParametrosParKeyId2: TStringField
      FieldName = 'ParKeyId2'
      Size = 60
    end
    object cdsParametrosParKeyId3: TStringField
      FieldName = 'ParKeyId3'
      Size = 60
    end
    object cdsParametrosParKeyId4: TStringField
      FieldName = 'ParKeyId4'
      Size = 60
    end
    object cdsParametrosParKeyId5: TStringField
      FieldName = 'ParKeyId5'
      Size = 60
    end
    object cdsParametrosParKeyId6: TStringField
      FieldName = 'ParKeyId6'
      Size = 60
    end
    object cdsParametrosParCargaMultiEmpresa: TStringField
      FieldName = 'ParCargaMultiEmpresa'
      Size = 4
    end
    object cdsParametrosParPathCargaApi: TStringField
      FieldName = 'ParPathCargaApi'
      Size = 1020
    end
    object cdsParametrosParDropTable: TStringField
      FieldName = 'ParDropTable'
      Size = 4
    end
    object cdsParametrosParColetasHoje: TStringField
      FieldName = 'ParColetasHoje'
      Size = 4
    end
  end
  object qryDescarga: TZQuery
    Connection = zcnnRota
    SQL.Strings = (
      'SELECT * FROM LogDescarga')
    Params = <>
    Left = 113
    Top = 76
  end
  object qrySQL: TZQuery
    Connection = zcnnRota
    SQL.Strings = (
      'SELECT * FROM LogDescarga')
    Params = <>
    Left = 169
    Top = 76
  end
  object apiConsole: TJvAppInstances
    Left = 40
    Top = 136
  end
  object tmrConsole: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = tmrConsoleTimer
    Left = 115
    Top = 136
  end
  object sheConsole: TJvScheduledEvents
    AutoSave = False
    Events = <
      item
        Name = 'evtDescarga'
        OnExecute = sheConsoleEvents0Execute
        StartDate = '2016/07/15 17:33:10.000'
        RecurringType = srkDaily
        EndType = sekNone
        Freq_StartTime = 0
        Freq_EndTime = 86399000
        Freq_Interval = 10800000
        Daily_EveryWeekDay = True
      end>
    Left = 177
    Top = 135
  end
  object qryAux: TZQuery
    Connection = zcnnRota
    Params = <>
    Left = 32
    Top = 216
  end
  object cdsColetas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspColetas'
    Left = 40
    Top = 280
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
    Left = 111
    Top = 280
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
    Left = 182
    Top = 280
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
    Left = 248
    Top = 280
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
    Left = 332
    Top = 280
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
    Left = 109
    Top = 351
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
    Left = 193
    Top = 351
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
    Left = 40
    Top = 352
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
  object qryApoio: TZQuery
    Connection = zcnnRota
    Params = <>
    Left = 106
    Top = 216
  end
  object csvDataSet: TJvCsvDataSet
    Separator = '|'
    SavesChanges = False
    AutoBackupCount = 0
    Left = 296
    Top = 418
  end
  object csvFileBase: TJvCSVBase
    CSVFieldNames.Strings = (
      '0001|ROBSON'
      'LAZARO'
      'NASC.'
      'ALVES'
      '|00001|')
    Left = 373
    Top = 418
  end
  object tmrSync: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = tmrSyncTimer
    Left = 235
    Top = 135
  end
end
