object MlkPrincipalDTM: TMlkPrincipalDTM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 302
  Width = 433
  object cnnMaster: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=esd056402;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=MilkSync;Data Source=DESKTOP-KUC122' +
      '3\AGRITECH'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 16
  end
  object dspContas: TDataSetProvider
    DataSet = qryContas
    Left = 112
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
      Size = 255
    end
    object cdsContasPercAtesto: TFloatField
      FieldName = 'PercAtesto'
    end
    object cdsContasHostURL: TStringField
      FieldName = 'HostURL'
      Size = 500
    end
    object cdsContasLog: TStringField
      FieldName = 'Log'
      Size = 1
    end
    object cdsContasProxyHost: TStringField
      FieldName = 'ProxyHost'
    end
    object cdsContasProxyPorta: TStringField
      FieldName = 'ProxyPorta'
      Size = 10
    end
    object cdsContasProxyUsuario: TStringField
      FieldName = 'ProxyUsuario'
    end
    object cdsContasProxySenha: TStringField
      FieldName = 'ProxySenha'
    end
    object cdsContasIntervalo: TFloatField
      FieldName = 'Intervalo'
    end
    object cdsContasProxyUsar: TStringField
      FieldName = 'ProxyUsar'
      Size = 1
    end
    object cdsContasEnviarNotifAtesto: TStringField
      FieldName = 'EnviarNotifAtesto'
      Size = 1
    end
    object cdsContasGeraTotvsDatasul: TStringField
      FieldName = 'GeraTotvsDatasul'
      Size = 1
    end
    object cdsContasGeraTotvsRm: TStringField
      FieldName = 'GeraTotvsRm'
      Size = 1
    end
    object cdsContasGeraMagis: TStringField
      FieldName = 'GeraMagis'
      Size = 1
    end
    object cdsContasGeraMeta: TStringField
      FieldName = 'GeraMeta'
      Size = 1
    end
    object cdsContasGeraSiga: TStringField
      FieldName = 'GeraSiga'
      Size = 1
    end
    object cdsContasVerDatasul: TStringField
      FieldName = 'VerDatasul'
      Size = 1
    end
    object cdsContasVerRm: TStringField
      FieldName = 'VerRm'
      Size = 1
    end
    object cdsContasVerMagis: TStringField
      FieldName = 'VerMagis'
      Size = 1
    end
    object cdsContasVerMeta: TStringField
      FieldName = 'VerMeta'
      Size = 1
    end
    object cdsContasVerSiga: TStringField
      FieldName = 'VerSiga'
      Size = 1
    end
    object cdsContasGeraScl: TStringField
      FieldName = 'GeraScl'
      Size = 1
    end
    object cdsContasVerScl: TStringField
      FieldName = 'VerScl'
      Size = 1
    end
    object cdsContasPathArqDatasul: TStringField
      FieldName = 'PathArqDatasul'
      Size = 255
    end
    object cdsContasPathArqRm: TStringField
      FieldName = 'PathArqRm'
      Size = 255
    end
    object cdsContasPathArqMagis: TStringField
      FieldName = 'PathArqMagis'
      Size = 255
    end
    object cdsContasPathArqMeta: TStringField
      FieldName = 'PathArqMeta'
      Size = 255
    end
    object cdsContasPathArqSiga: TStringField
      FieldName = 'PathArqSiga'
      Size = 255
    end
    object cdsContasPathArqScl: TStringField
      FieldName = 'PathArqScl'
      Size = 255
    end
    object cdsContasParContaId1: TIntegerField
      FieldName = 'ParContaId1'
    end
    object cdsContasPathArqCarga: TStringField
      FieldName = 'PathArqCarga'
      Size = 255
    end
    object cdsContasIntervaloCarga: TFloatField
      FieldName = 'IntervaloCarga'
    end
    object cdsContasCargaMultiEmpresa: TStringField
      FieldName = 'CargaMultiEmpresa'
      Size = 1
    end
    object cdsContasPathCargaApi: TStringField
      FieldName = 'PathCargaApi'
      Size = 255
    end
    object cdsContasDropTable: TStringField
      FieldName = 'DropTable'
      Size = 1
    end
    object cdsContasParColetasHoje: TStringField
      FieldName = 'ParColetasHoje'
      Size = 1
    end
    object cdsContasDatUltLeituraDescargaWS: TWideStringField
      FieldName = 'DatUltLeituraDescargaWS'
      Size = 10
    end
    object cdsContasDatIniLeituraDescargaWS: TWideStringField
      FieldName = 'DatIniLeituraDescargaWS'
      Size = 10
    end
  end
  object sqlContas: TS2SQLDataSet
    ADOQuery = qryContas
    Left = 176
    Top = 112
  end
end
