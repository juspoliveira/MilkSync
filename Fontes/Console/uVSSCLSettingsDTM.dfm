object VSSCLSettingsDTM: TVSSCLSettingsDTM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 644
  Top = 212
  Height = 403
  Width = 428
  object qryContas: TZQuery
    Connection = VSSCLRotaConsoleDTM.zcnnRota
    SQL.Strings = (
      'Select * from Contas where 1=2 Order by Id')
    Params = <>
    Left = 24
    Top = 24
  end
  object pvdContas: TDataSetProvider
    DataSet = qryContas
    Options = [poAllowCommandText]
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
