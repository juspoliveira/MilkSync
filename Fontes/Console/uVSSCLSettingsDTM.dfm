object VSSCLSettingsDTM: TVSSCLSettingsDTM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 646
  Top = 213
  Height = 403
  Width = 428
  object qryContas: TZQuery
    Connection = VSSCLRotaConsoleDTM.zcnnRota
    SQL.Strings = (
      'Select * from Contas where 1=2 Order by ContaId')
    Params = <>
    Left = 24
    Top = 24
    object qryContasId: TIntegerField
      FieldName = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryContasNomeEmpresa: TStringField
      FieldName = 'NomeEmpresa'
      Size = 280
    end
    object qryContasContaId: TIntegerField
      FieldName = 'ContaId'
    end
    object qryContasKeyId: TStringField
      FieldName = 'KeyId'
      Size = 60
    end
    object qryContasAtiva: TStringField
      FieldName = 'Ativa'
      Size = 4
    end
    object qryContasDatUltLeituraDescargaWS: TDateField
      FieldName = 'DatUltLeituraDescargaWS'
    end
    object qryContasPathArqDescarga: TStringField
      FieldName = 'PathArqDescarga'
      Size = 1020
    end
    object qryContasPercAtesto: TFloatField
      FieldName = 'PercAtesto'
    end
    object qryContasHostURL: TStringField
      FieldName = 'HostURL'
      Size = 2000
    end
    object qryContasLog: TStringField
      FieldName = 'Log'
      Size = 4
    end
    object qryContasProxyHost: TStringField
      FieldName = 'ProxyHost'
      Size = 80
    end
    object qryContasProxyPorta: TStringField
      FieldName = 'ProxyPorta'
      Size = 40
    end
    object qryContasProxyUsuario: TStringField
      FieldName = 'ProxyUsuario'
      Size = 80
    end
    object qryContasProxySenha: TStringField
      FieldName = 'ProxySenha'
      Size = 80
    end
    object qryContasIntervalo: TFloatField
      FieldName = 'Intervalo'
    end
    object qryContasProxyUsar: TStringField
      FieldName = 'ProxyUsar'
      Size = 4
    end
    object qryContasEnviarNotifAtesto: TStringField
      FieldName = 'EnviarNotifAtesto'
      Size = 4
    end
    object qryContasDatIniLeituraDescargaWS: TDateField
      FieldName = 'DatIniLeituraDescargaWS'
    end
    object qryContasGeraTotvsDatasul: TStringField
      FieldName = 'GeraTotvsDatasul'
      Size = 4
    end
    object qryContasGeraTotvsRm: TStringField
      FieldName = 'GeraTotvsRm'
      Size = 4
    end
    object qryContasGeraMagis: TStringField
      FieldName = 'GeraMagis'
      Size = 4
    end
    object qryContasGeraMeta: TStringField
      FieldName = 'GeraMeta'
      Size = 4
    end
    object qryContasGeraSiga: TStringField
      FieldName = 'GeraSiga'
      Size = 4
    end
    object qryContasVerDatasul: TStringField
      FieldName = 'VerDatasul'
      Size = 4
    end
    object qryContasVerRm: TStringField
      FieldName = 'VerRm'
      Size = 4
    end
    object qryContasVerMagis: TStringField
      FieldName = 'VerMagis'
      Size = 4
    end
    object qryContasVerMeta: TStringField
      FieldName = 'VerMeta'
      Size = 4
    end
    object qryContasVerSiga: TStringField
      FieldName = 'VerSiga'
      Size = 4
    end
    object qryContasGeraScl: TStringField
      FieldName = 'GeraScl'
      Size = 4
    end
    object qryContasVerScl: TStringField
      FieldName = 'VerScl'
      Size = 4
    end
    object qryContasPathArqDatasul: TStringField
      FieldName = 'PathArqDatasul'
      Size = 1020
    end
    object qryContasPathArqRm: TStringField
      FieldName = 'PathArqRm'
      Size = 1020
    end
    object qryContasPathArqMagis: TStringField
      FieldName = 'PathArqMagis'
      Size = 1020
    end
    object qryContasPathArqMeta: TStringField
      FieldName = 'PathArqMeta'
      Size = 1020
    end
    object qryContasPathArqSiga: TStringField
      FieldName = 'PathArqSiga'
      Size = 1020
    end
    object qryContasPathArqScl: TStringField
      FieldName = 'PathArqScl'
      Size = 1020
    end
    object qryContasParContaId1: TIntegerField
      FieldName = 'ParContaId1'
    end
    object qryContasPathArqCarga: TStringField
      FieldName = 'PathArqCarga'
      Size = 1020
    end
    object qryContasIntervaloCarga: TFloatField
      FieldName = 'IntervaloCarga'
    end
    object qryContasCargaMultiEmpresa: TStringField
      FieldName = 'CargaMultiEmpresa'
      Size = 4
    end
    object qryContasPathCargaApi: TStringField
      FieldName = 'PathCargaApi'
      Size = 1020
    end
    object qryContasDropTable: TStringField
      FieldName = 'DropTable'
      Size = 4
    end
    object qryContasParColetasHoje: TStringField
      FieldName = 'ParColetasHoje'
      Size = 4
    end
  end
  object pvdContas: TDataSetProvider
    DataSet = qryContas
    ResolveToDataSet = True
    Options = [poCascadeUpdates, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 24
  end
  object sqlContas: TS2ZSQLDataSet
    ADOQuery = qryContas
    Left = 136
    Top = 24
  end
  object cdsContas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pvdContas'
    BeforePost = cdsContasBeforePost
    OnReconcileError = cdsContasReconcileError
    Left = 208
    Top = 24
    object cdsContasId: TIntegerField
      FieldName = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsContasContaId: TIntegerField
      DisplayLabel = 'Id. Conta'
      FieldName = 'ContaId'
    end
    object cdsContasNomeEmpresa: TStringField
      DisplayLabel = 'Nome Empresa'
      FieldName = 'NomeEmpresa'
      Size = 140
    end
    object cdsContasKeyId: TStringField
      DisplayLabel = 'Chave ERP'
      FieldName = 'KeyId'
      Size = 30
    end
    object cdsContasAtiva: TStringField
      FieldName = 'Ativa'
      Size = 2
    end
    object cdsContasDatUltLeituraDescargaWS: TDateField
      DisplayLabel = 'Ult. Sincrozinacao'
      FieldName = 'DatUltLeituraDescargaWS'
    end
    object cdsContasPathArqDescarga: TStringField
      DisplayLabel = 'Dir. Arquivos Descarga'
      FieldName = 'PathArqDescarga'
      Size = 510
    end
    object cdsContasPercAtesto: TFloatField
      DisplayLabel = '% Atesto M'#39'inimo'
      FieldName = 'PercAtesto'
    end
    object cdsContasHostURL: TStringField
      DisplayLabel = 'URI Servidor'
      FieldName = 'HostURL'
      Size = 1000
    end
    object cdsContasLog: TStringField
      DisplayLabel = 'Gravar Log ?'
      FieldName = 'Log'
      Size = 2
    end
    object cdsContasProxyHost: TStringField
      DisplayLabel = 'URI Proxy'
      FieldName = 'ProxyHost'
      Size = 40
    end
    object cdsContasProxyPorta: TStringField
      DisplayLabel = 'Porta Proxy'
      FieldName = 'ProxyPorta'
    end
    object cdsContasProxyUsuario: TStringField
      DisplayLabel = 'Usuario Proxy'
      FieldName = 'ProxyUsuario'
      Size = 40
    end
    object cdsContasProxySenha: TStringField
      DisplayLabel = 'Senha Proxy'
      FieldName = 'ProxySenha'
      Size = 40
    end
    object cdsContasIntervalo: TFloatField
      DisplayLabel = 'Intervalo Sincronizacao'
      FieldName = 'Intervalo'
    end
    object cdsContasProxyUsar: TStringField
      DisplayLabel = 'Usar Proxy'
      FieldName = 'ProxyUsar'
      Size = 2
    end
    object cdsContasEnviarNotifAtesto: TStringField
      DisplayLabel = 'Notificar desvio Atesto'
      FieldName = 'EnviarNotifAtesto'
      Size = 2
    end
    object cdsContasDatIniLeituraDescargaWS: TDateField
      DisplayLabel = 'Data Incial Comun. WS'
      FieldName = 'DatIniLeituraDescargaWS'
    end
    object cdsContasGeraTotvsDatasul: TStringField
      DisplayLabel = 'Gerar TOTVS Datasul'
      FieldName = 'GeraTotvsDatasul'
      Size = 2
    end
    object cdsContasGeraTotvsRm: TStringField
      DisplayLabel = 'Gera Totvs Rm'
      FieldName = 'GeraTotvsRm'
      Size = 2
    end
    object cdsContasGeraMagis: TStringField
      DisplayLabel = 'Gera Magis'
      FieldName = 'GeraMagis'
      Size = 2
    end
    object cdsContasGeraMeta: TStringField
      DisplayLabel = 'Gera Meta'
      FieldName = 'GeraMeta'
      Size = 2
    end
    object cdsContasGeraSiga: TStringField
      DisplayLabel = 'Gera Siga'
      FieldName = 'GeraSiga'
      Size = 2
    end
    object cdsContasVerDatasul: TStringField
      DisplayLabel = 'Ver. Datasul'
      FieldName = 'VerDatasul'
      Size = 2
    end
    object cdsContasVerRm: TStringField
      DisplayLabel = 'Ver. Rm'
      FieldName = 'VerRm'
      Size = 2
    end
    object cdsContasVerMagis: TStringField
      DisplayLabel = 'Ver. Magis'
      FieldName = 'VerMagis'
      Size = 2
    end
    object cdsContasVerMeta: TStringField
      DisplayLabel = 'Ver. Meta'
      FieldName = 'VerMeta'
      Size = 2
    end
    object cdsContasVerSiga: TStringField
      DisplayLabel = 'Ver. Siga'
      FieldName = 'VerSiga'
      Size = 2
    end
    object cdsContasGeraScl: TStringField
      DisplayLabel = 'Gera Scl'
      FieldName = 'GeraScl'
      Size = 2
    end
    object cdsContasVerScl: TStringField
      DisplayLabel = 'Ver. Scl'
      FieldName = 'VerScl'
      Size = 2
    end
    object cdsContasPathArqDatasul: TStringField
      DisplayLabel = 'Pasta Arq. Datasul'
      FieldName = 'PathArqDatasul'
      Size = 510
    end
    object cdsContasPathArqRm: TStringField
      DisplayLabel = 'Pasta Arq. RM'
      FieldName = 'PathArqRm'
      Size = 510
    end
    object cdsContasPathArqMagis: TStringField
      DisplayLabel = 'Pasta Arq. Magis'
      FieldName = 'PathArqMagis'
      Size = 510
    end
    object cdsContasPathArqMeta: TStringField
      DisplayLabel = 'Pasta Arq. Meta'
      FieldName = 'PathArqMeta'
      Size = 510
    end
    object cdsContasPathArqSiga: TStringField
      DisplayLabel = 'Pasta Arq. Siga'
      FieldName = 'PathArqSiga'
      Size = 510
    end
    object cdsContasPathArqScl: TStringField
      DisplayLabel = 'Pasta Arq. SCL'
      FieldName = 'PathArqScl'
      Size = 510
    end
    object cdsContasParContaId1: TIntegerField
      FieldName = 'ParContaId1'
      Visible = False
    end
    object cdsContasPathArqCarga: TStringField
      DisplayLabel = 'Localizacao Arquivos Carga'
      FieldName = 'PathArqCarga'
      Size = 510
    end
    object cdsContasIntervaloCarga: TFloatField
      DisplayLabel = 'Intervalo Carga'
      FieldName = 'IntervaloCarga'
    end
    object cdsContasCargaMultiEmpresa: TStringField
      DisplayLabel = 'Carga MultiEmpresa'
      FieldName = 'CargaMultiEmpresa'
      Size = 2
    end
    object cdsContasPathCargaApi: TStringField
      DisplayLabel = 'Pasta Retorno API'
      FieldName = 'PathCargaApi'
      Size = 510
    end
    object cdsContasDropTable: TStringField
      DisplayLabel = 'Apaga Dados Tabelas carga'
      FieldName = 'DropTable'
      Size = 2
    end
    object cdsContasParColetasHoje: TStringField
      DisplayLabel = 'Gera Coletas Dia'
      FieldName = 'ParColetasHoje'
      Size = 2
    end
  end
end
