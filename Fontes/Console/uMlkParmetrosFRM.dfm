inherited MlkParmetrosFRM: TMlkParmetrosFRM
  Caption = 'Manutencao de Contas && Parametros '
  ClientHeight = 622
  ClientWidth = 669
  Visible = False
  ExplicitTop = -203
  ExplicitWidth = 675
  ExplicitHeight = 651
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton4: TSpeedButton [0]
    Left = 555
    Top = 249
    Width = 23
    Height = 22
    Action = acFindFile
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton5: TSpeedButton [1]
    Left = 552
    Top = 281
    Width = 23
    Height = 22
    Action = acFindFile
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton6: TSpeedButton [2]
    Left = 555
    Top = 312
    Width = 23
    Height = 22
    Action = acFindFile
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton7: TSpeedButton [3]
    Left = 554
    Top = 345
    Width = 23
    Height = 22
    Action = acFindFile
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton8: TSpeedButton [4]
    Left = 555
    Top = 378
    Width = 23
    Height = 22
    Action = acFindFile
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton9: TSpeedButton [5]
    Left = 554
    Top = 410
    Width = 23
    Height = 22
    Action = acFindFile
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton10: TSpeedButton [6]
    Left = 555
    Top = 443
    Width = 23
    Height = 22
    Action = acFindFile
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton11: TSpeedButton [7]
    Left = 553
    Top = 472
    Width = 23
    Height = 22
    Action = acFindFile
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton12: TSpeedButton [8]
    Left = 554
    Top = 507
    Width = 23
    Height = 22
    Action = acFindFile
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited pgcManutencao: TPageControl
    Width = 669
    Height = 538
    ActivePage = tabsCadastro
    ExplicitWidth = 669
    ExplicitHeight = 538
    inherited tabsPesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 661
      ExplicitHeight = 510
      inherited grdMaster: TcxGrid
        Width = 661
        Height = 510
        ExplicitWidth = 661
        ExplicitHeight = 510
        inherited grdMasterView: TcxGridDBTableView
          DataController.KeyFieldNames = 'Id'
          object grdMasterViewNomeEmpresa: TcxGridDBColumn
            DataBinding.FieldName = 'NomeEmpresa'
            Width = 244
          end
          object grdMasterViewContaId: TcxGridDBColumn
            DataBinding.FieldName = 'ContaId'
          end
          object grdMasterViewKeyId: TcxGridDBColumn
            DataBinding.FieldName = 'KeyId'
            Width = 67
          end
          object grdMasterViewAtiva: TcxGridDBColumn
            DataBinding.FieldName = 'Ativa'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Items = <
              item
                Description = 'Sim'
                ImageIndex = 0
                Value = 'S'
              end
              item
                Description = 'Nao'
                Value = 'N'
              end>
            Width = 49
          end
          object grdMasterViewDatUltLeituraDescargaWS: TcxGridDBColumn
            DataBinding.FieldName = 'DatUltLeituraDescargaWS'
            Width = 76
          end
          object grdMasterViewSync: TcxGridDBColumn
            DataBinding.FieldName = 'Sync'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Items = <
              item
                Description = 'Sim'
                ImageIndex = 0
                Value = 'S'
              end
              item
                Description = 'Nao'
                Value = 'N'
              end>
            Width = 54
          end
          object grdMasterViewPercAtesto: TcxGridDBColumn
            DataBinding.FieldName = 'PercAtesto'
          end
          object grdMasterViewHostURL: TcxGridDBColumn
            DataBinding.FieldName = 'HostURL'
          end
          object grdMasterViewLog: TcxGridDBColumn
            DataBinding.FieldName = 'Log'
          end
          object grdMasterViewProxyHost: TcxGridDBColumn
            DataBinding.FieldName = 'ProxyHost'
          end
          object grdMasterViewProxyPorta: TcxGridDBColumn
            DataBinding.FieldName = 'ProxyPorta'
          end
          object grdMasterViewProxyUsuario: TcxGridDBColumn
            DataBinding.FieldName = 'ProxyUsuario'
          end
          object grdMasterViewProxySenha: TcxGridDBColumn
            DataBinding.FieldName = 'ProxySenha'
          end
          object grdMasterViewIntervalo: TcxGridDBColumn
            DataBinding.FieldName = 'Intervalo'
          end
          object grdMasterViewProxyUsar: TcxGridDBColumn
            DataBinding.FieldName = 'ProxyUsar'
          end
          object grdMasterViewDatIniLeituraDescargaWS: TcxGridDBColumn
            DataBinding.FieldName = 'DatIniLeituraDescargaWS'
          end
          object grdMasterViewPathArqDescarga: TcxGridDBColumn
            DataBinding.FieldName = 'PathArqDescarga'
          end
          object grdMasterViewEnviarNotifAtesto: TcxGridDBColumn
            DataBinding.FieldName = 'EnviarNotifAtesto'
          end
          object grdMasterViewGeraTotvsDatasul: TcxGridDBColumn
            DataBinding.FieldName = 'GeraTotvsDatasul'
          end
          object grdMasterViewGeraTotvsRm: TcxGridDBColumn
            DataBinding.FieldName = 'GeraTotvsRm'
          end
          object grdMasterViewGeraMagis: TcxGridDBColumn
            DataBinding.FieldName = 'GeraMagis'
          end
          object grdMasterViewGeraMeta: TcxGridDBColumn
            DataBinding.FieldName = 'GeraMeta'
          end
          object grdMasterViewGeraSiga: TcxGridDBColumn
            DataBinding.FieldName = 'GeraSiga'
          end
          object grdMasterViewVerDatasul: TcxGridDBColumn
            DataBinding.FieldName = 'VerDatasul'
          end
          object grdMasterViewVerRm: TcxGridDBColumn
            DataBinding.FieldName = 'VerRm'
          end
          object grdMasterViewVerMagis: TcxGridDBColumn
            DataBinding.FieldName = 'VerMagis'
          end
          object grdMasterViewVerMeta: TcxGridDBColumn
            DataBinding.FieldName = 'VerMeta'
          end
          object grdMasterViewVerSiga: TcxGridDBColumn
            DataBinding.FieldName = 'VerSiga'
          end
          object grdMasterViewGeraScl: TcxGridDBColumn
            DataBinding.FieldName = 'GeraScl'
          end
          object grdMasterViewVerScl: TcxGridDBColumn
            DataBinding.FieldName = 'VerScl'
          end
          object grdMasterViewPathArqDatasul: TcxGridDBColumn
            DataBinding.FieldName = 'PathArqDatasul'
          end
          object grdMasterViewPathArqRm: TcxGridDBColumn
            DataBinding.FieldName = 'PathArqRm'
          end
          object grdMasterViewPathArqMagis: TcxGridDBColumn
            DataBinding.FieldName = 'PathArqMagis'
          end
          object grdMasterViewPathArqMeta: TcxGridDBColumn
            DataBinding.FieldName = 'PathArqMeta'
          end
          object grdMasterViewPathArqSiga: TcxGridDBColumn
            DataBinding.FieldName = 'PathArqSiga'
          end
          object grdMasterViewPathArqScl: TcxGridDBColumn
            DataBinding.FieldName = 'PathArqScl'
          end
          object grdMasterViewParContaId1: TcxGridDBColumn
            DataBinding.FieldName = 'ParContaId1'
          end
          object grdMasterViewPathArqCarga: TcxGridDBColumn
            DataBinding.FieldName = 'PathArqCarga'
          end
          object grdMasterViewIntervaloCarga: TcxGridDBColumn
            DataBinding.FieldName = 'IntervaloCarga'
          end
          object grdMasterViewCargaMultiEmpresa: TcxGridDBColumn
            DataBinding.FieldName = 'CargaMultiEmpresa'
          end
          object grdMasterViewPathCargaApi: TcxGridDBColumn
            DataBinding.FieldName = 'PathCargaApi'
          end
          object grdMasterViewDropTable: TcxGridDBColumn
            DataBinding.FieldName = 'DropTable'
          end
          object grdMasterViewParColetasHoje: TcxGridDBColumn
            DataBinding.FieldName = 'ParColetasHoje'
          end
          object grdMasterViewPathMapRota: TcxGridDBColumn
            DataBinding.FieldName = 'PathMapRota'
          end
          object grdMasterViewPatMapColetor: TcxGridDBColumn
            DataBinding.FieldName = 'PatMapColetor'
          end
          object grdMasterViewPatMapAnalise: TcxGridDBColumn
            DataBinding.FieldName = 'PatMapAnalise'
          end
          object grdMasterViewPatMapExtrato: TcxGridDBColumn
            DataBinding.FieldName = 'PatMapExtrato'
          end
          object grdMasterViewPatMapFazenda: TcxGridDBColumn
            DataBinding.FieldName = 'PatMapFazenda'
          end
          object grdMasterViewPatMapItinerario: TcxGridDBColumn
            DataBinding.FieldName = 'PatMapItinerario'
          end
          object grdMasterViewPatMapLinha: TcxGridDBColumn
            DataBinding.FieldName = 'PatMapLinha'
          end
          object grdMasterViewPatMapMotivo: TcxGridDBColumn
            DataBinding.FieldName = 'PatMapMotivo'
          end
          object grdMasterViewPatMapProdutor: TcxGridDBColumn
            DataBinding.FieldName = 'PatMapProdutor'
          end
          object grdMasterViewPatMapGrupoRota: TcxGridDBColumn
            DataBinding.FieldName = 'PatMapGrupoRota'
          end
          object grdMasterViewPatMapTanque: TcxGridDBColumn
            DataBinding.FieldName = 'PatMapTanque'
          end
          object grdMasterViewPatMapTag: TcxGridDBColumn
            DataBinding.FieldName = 'PatMapTag'
          end
          object grdMasterViewPatMapTecnico: TcxGridDBColumn
            DataBinding.FieldName = 'PatMapTecnico'
          end
          object grdMasterViewPatMapVinculado: TcxGridDBColumn
            DataBinding.FieldName = 'PatMapVinculado'
          end
          object grdMasterViewPatMapVeiculo: TcxGridDBColumn
            DataBinding.FieldName = 'PatMapVeiculo'
          end
          object grdMasterViewDatUltSync: TcxGridDBColumn
            DataBinding.FieldName = 'DatUltSync'
          end
          object grdMasterViewDatUltCarga: TcxGridDBColumn
            DataBinding.FieldName = 'DatUltCarga'
          end
          object grdMasterViewCarga: TcxGridDBColumn
            DataBinding.FieldName = 'Carga'
          end
          object grdMasterViewGerarCsv: TcxGridDBColumn
            DataBinding.FieldName = 'GerarCsv'
          end
        end
      end
    end
    inherited tabsCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 661
      ExplicitHeight = 510
      inherited pnlMaster: TPanel
        Width = 661
        Height = 510
        ExplicitWidth = 661
        ExplicitHeight = 510
        object GroupBox1: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 655
          Height = 174
          Align = alTop
          Caption = '| Conta |'
          TabOrder = 0
          object cxLabel5: TLabel
            Left = 4
            Top = 54
            Width = 51
            Height = 13
            Caption = 'URL Host'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object cxLabel10: TLabel
            Left = 254
            Top = 98
            Width = 103
            Height = 13
            Caption = 'Gerar Arquivos (Min.)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object cxLabel9: TLabel
            Left = 4
            Top = 98
            Width = 48
            Height = 13
            Caption = 'Id Conta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object sLabel4: TLabel
            Left = 381
            Top = 98
            Width = 113
            Height = 13
            Caption = 'Enviar Cadastros (Min.)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object sLabel5: TLabel
            Left = 140
            Top = 98
            Width = 53
            Height = 13
            Caption = 'Chave ERP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object sLabel1: TLabel
            Left = 4
            Top = 14
            Width = 49
            Height = 13
            Caption = 'Empresa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtServidor: TcxDBTextEdit
            Left = 3
            Top = 72
            DataBinding.DataField = 'HostURL'
            DataBinding.DataSource = dsMaster
            TabOrder = 0
            Width = 529
          end
          object edtIdErp: TcxDBTextEdit
            Left = 128
            Top = 114
            DataBinding.DataField = 'KeyId'
            DataBinding.DataSource = dsMaster
            TabOrder = 1
            Width = 121
          end
          object edtTempo: TcxDBSpinEdit
            Left = 260
            Top = 113
            DataBinding.DataField = 'Intervalo'
            DataBinding.DataSource = dsMaster
            TabOrder = 2
            Width = 74
          end
          object edtCad: TcxDBSpinEdit
            Left = 383
            Top = 114
            DataBinding.DataField = 'IntervaloCarga'
            DataBinding.DataSource = dsMaster
            TabOrder = 3
            Width = 74
          end
          object chkCargaMultiEmpresa: TcxDBCheckBox
            Left = 1
            Top = 145
            Caption = 'Carga Multi-Empresa'
            DataBinding.DataField = 'CargaMultiEmpresa'
            DataBinding.DataSource = dsMaster
            Properties.DisplayChecked = 'S'
            Properties.DisplayUnchecked = 'N'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            TabOrder = 4
            Transparent = True
            Width = 121
          end
          object chkDropTable: TcxDBCheckBox
            Left = 131
            Top = 144
            Caption = 'Limpar Tabelas'
            DataBinding.DataField = 'DropTable'
            DataBinding.DataSource = dsMaster
            Properties.DisplayChecked = 'S'
            Properties.DisplayUnchecked = 'N'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            TabOrder = 5
            Transparent = True
            Width = 121
          end
          object chkLog: TcxDBCheckBox
            Left = 258
            Top = 144
            Caption = 'Gravar Log'
            DataBinding.DataField = 'Log'
            DataBinding.DataSource = dsMaster
            Properties.DisplayChecked = 'S'
            Properties.DisplayUnchecked = 'N'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            TabOrder = 6
            Transparent = True
            Width = 82
          end
          object ckbCtaAtiva: TcxDBCheckBox
            Left = 450
            Top = 143
            Caption = 'ATIVO'
            DataBinding.DataField = 'Ativa'
            DataBinding.DataSource = dsMaster
            ParentFont = False
            Properties.DisplayChecked = 'S'
            Properties.DisplayUnchecked = 'N'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            TabOrder = 7
            Transparent = True
            Width = 82
          end
          object edtConta: TcxDBTextEdit
            Left = 4
            Top = 113
            DataBinding.DataField = 'ContaId'
            DataBinding.DataSource = dsMaster
            TabOrder = 8
            Width = 121
          end
          object edtNomeEmpresa: TcxDBTextEdit
            Left = 3
            Top = 30
            DataBinding.DataField = 'NomeEmpresa'
            DataBinding.DataSource = dsMaster
            TabOrder = 9
            Width = 529
          end
          object chkGeraXls: TcxDBCheckBox
            Left = 349
            Top = 144
            Caption = 'Gerar CSV'
            DataBinding.DataField = 'GerarCsv'
            DataBinding.DataSource = dsMaster
            Properties.DisplayChecked = 'S'
            Properties.DisplayUnchecked = 'N'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            TabOrder = 10
            Transparent = True
            Width = 82
          end
        end
        object GroupBox2: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 183
          Width = 655
          Height = 74
          Align = alTop
          Caption = '| Proxy |'
          TabOrder = 1
          object cxLabel4: TLabel
            Left = 101
            Top = 21
            Width = 19
            Height = 13
            Caption = 'URL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object cxLabel6: TLabel
            Left = 84
            Top = 46
            Width = 36
            Height = 13
            Caption = 'Usu'#225'rio'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object cxLabel7: TLabel
            Left = 410
            Top = 21
            Width = 26
            Height = 13
            Caption = 'Porta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object cxLabel8: TLabel
            Left = 367
            Top = 46
            Width = 30
            Height = 13
            Caption = 'Senha'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object ckbProxy: TcxDBCheckBox
            Left = 7
            Top = 19
            Caption = 'Proxy'
            DataBinding.DataField = 'ProxyUsar'
            DataBinding.DataSource = dsMaster
            ParentFont = False
            Properties.DisplayChecked = 'S'
            Properties.DisplayUnchecked = 'N'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            TabOrder = 0
            Transparent = True
            Width = 82
          end
          object edtProxyUrl: TcxDBTextEdit
            Left = 127
            Top = 17
            DataBinding.DataField = 'ProxyHost'
            DataBinding.DataSource = dsMaster
            TabOrder = 1
            Width = 266
          end
          object edtProxyPorta: TcxDBTextEdit
            Left = 445
            Top = 17
            DataBinding.DataField = 'ProxyPorta'
            DataBinding.DataSource = dsMaster
            TabOrder = 2
            Width = 84
          end
          object edtProxyUsu: TcxDBTextEdit
            Left = 130
            Top = 42
            DataBinding.DataField = 'ProxyUsuario'
            DataBinding.DataSource = dsMaster
            TabOrder = 3
            Width = 169
          end
          object edtProxySenha: TcxDBTextEdit
            Left = 410
            Top = 42
            DataBinding.DataField = 'ProxySenha'
            DataBinding.DataSource = dsMaster
            Properties.PasswordChar = '*'
            TabOrder = 4
            Width = 121
          end
        end
        object GroupBox3: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 263
          Width = 655
          Height = 79
          Align = alTop
          Caption = '| Formato Arquivos Saida |'
          TabOrder = 2
          object cbxMagis: TcxDBImageComboBox
            Left = 221
            Top = 42
            DataBinding.DataField = 'VerMagis'
            DataBinding.DataSource = dsMaster
            Properties.ClearKey = 46
            Properties.ImmediatePost = True
            Properties.Items = <
              item
                Description = 'V.1'
                ImageIndex = 0
                Value = '1'
              end
              item
                Description = 'V.2'
                Value = '2'
              end>
            TabOrder = 0
            Width = 86
          end
          object cbxDatasul: TcxDBImageComboBox
            Left = 7
            Top = 43
            DataBinding.DataField = 'VerDatasul'
            DataBinding.DataSource = dsMaster
            Properties.ClearKey = 46
            Properties.ImmediatePost = True
            Properties.Items = <
              item
                Description = '1.0'
                ImageIndex = 0
                Value = '1'
              end>
            Style.ButtonStyle = btsFlat
            Style.ButtonTransparency = ebtNone
            TabOrder = 1
            Width = 91
          end
          object cbxRm: TcxDBImageComboBox
            Left = 123
            Top = 43
            DataBinding.DataField = 'VerRm'
            DataBinding.DataSource = dsMaster
            Properties.ClearKey = 46
            Properties.ImmediatePost = True
            Properties.Items = <
              item
                Description = #217'nico'
                ImageIndex = 0
                Value = 'U'
              end
              item
                Description = 'M'#250'ltiplos'
                Value = 'M'
              end>
            TabOrder = 2
            Width = 79
          end
          object cbxMeta: TcxDBImageComboBox
            Left = 318
            Top = 41
            DataBinding.DataField = 'VerMeta'
            DataBinding.DataSource = dsMaster
            Properties.ClearKey = 46
            Properties.ImmediatePost = True
            Properties.Items = <
              item
                Description = '1.0'
                ImageIndex = 0
                Value = '1'
              end>
            TabOrder = 3
            Width = 95
          end
          object cbxSiga: TcxDBImageComboBox
            Left = 419
            Top = 40
            DataBinding.DataField = 'VerSiga'
            DataBinding.DataSource = dsMaster
            Properties.ClearKey = 46
            Properties.ImmediatePost = True
            Properties.Items = <
              item
                Description = '1.0'
                ImageIndex = 0
                Value = '1'
              end>
            TabOrder = 4
            Width = 67
          end
          object cbxScl: TcxDBImageComboBox
            Left = 490
            Top = 39
            DataBinding.DataField = 'VerScl'
            DataBinding.DataSource = dsMaster
            Properties.ClearKey = 46
            Properties.ImmediatePost = True
            Properties.Items = <
              item
                Description = '1.0'
                ImageIndex = 0
                Value = '1'
              end
              item
                Description = 'S2'
                Value = '2'
              end
              item
                Description = 'SCA'
                Value = 'A'
              end>
            TabOrder = 5
            Width = 74
          end
          object ckbDatasul: TcxDBCheckBox
            Left = 3
            Top = 19
            Caption = 'TOTVS(Datasul)'
            DataBinding.DataField = 'GeraTotvsDatasul'
            DataBinding.DataSource = dsMaster
            ParentFont = False
            Properties.DisplayChecked = 'S'
            Properties.DisplayUnchecked = 'N'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            TabOrder = 6
            Transparent = True
            Width = 116
          end
          object ckbRm: TcxDBCheckBox
            Left = 118
            Top = 19
            Caption = 'TOTVS (RM)'
            DataBinding.DataField = 'GeraTotvsRm'
            DataBinding.DataSource = dsMaster
            ParentFont = False
            Properties.DisplayChecked = 'S'
            Properties.DisplayUnchecked = 'N'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            TabOrder = 7
            Transparent = True
            Width = 98
          end
          object ckbMagis: TcxDBCheckBox
            Left = 216
            Top = 19
            Caption = 'Magistech'
            DataBinding.DataField = 'GeraMagis'
            DataBinding.DataSource = dsMaster
            ParentFont = False
            Properties.DisplayChecked = 'S'
            Properties.DisplayUnchecked = 'N'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            TabOrder = 8
            Transparent = True
            Width = 86
          end
          object ckbMeta: TcxDBCheckBox
            Left = 315
            Top = 19
            Caption = 'WebMeta'
            DataBinding.DataField = 'GeraMeta'
            DataBinding.DataSource = dsMaster
            ParentFont = False
            Properties.DisplayChecked = 'S'
            Properties.DisplayUnchecked = 'N'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            TabOrder = 9
            Transparent = True
            Width = 82
          end
          object ckbSiga: TcxDBCheckBox
            Left = 416
            Top = 19
            Caption = 'Siga'
            DataBinding.DataField = 'GeraSiga'
            DataBinding.DataSource = dsMaster
            ParentFont = False
            Properties.DisplayChecked = 'S'
            Properties.DisplayUnchecked = 'N'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            TabOrder = 10
            Transparent = True
            Width = 57
          end
          object cxDBCheckBox7: TcxDBCheckBox
            Left = 488
            Top = 19
            Caption = 'OUTROS'
            DataBinding.DataField = 'GeraScl'
            DataBinding.DataSource = dsMaster
            ParentFont = False
            Properties.DisplayChecked = 'S'
            Properties.DisplayUnchecked = 'N'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            TabOrder = 11
            Transparent = True
            Width = 76
          end
        end
        object GroupBox4: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 348
          Width = 655
          Height = 51
          Align = alTop
          Caption = '| Atesto |'
          TabOrder = 3
          object cxLabel11: TLabel
            Left = 7
            Top = 22
            Width = 51
            Height = 13
            Caption = 'Percentual'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object ckbNotificaAtesto: TcxDBCheckBox
            Left = 136
            Top = 18
            Caption = 'Enviar Notificacao'
            DataBinding.DataField = 'EnviarNotifAtesto'
            DataBinding.DataSource = dsMaster
            ParentFont = False
            Properties.DisplayChecked = 'S'
            Properties.DisplayUnchecked = 'N'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            TabOrder = 0
            Transparent = True
            Width = 130
          end
          object edtDifAtesto: TcxDBCurrencyEdit
            Left = 65
            Top = 18
            DataBinding.DataField = 'PercAtesto'
            DataBinding.DataSource = dsMaster
            TabOrder = 1
            Width = 65
          end
        end
        object GroupBox5: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 405
          Width = 655
          Height = 102
          Align = alClient
          Caption = '| Intervalos |'
          TabOrder = 4
          object lbl6: TLabel
            Left = 10
            Top = 50
            Width = 541
            Height = 31
            AutoSize = False
            Caption = 
              'Aten'#231#227'o. Ajustando a data para dias anteriores, arquivos j'#225' expo' +
              'rtados e processados podem ser regerados. Isto pode afetar o con' +
              'trole de estoque do seu ERP.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
          end
          object cxLabel3: TLabel
            Left = 17
            Top = 25
            Width = 53
            Height = 13
            Caption = 'Data Inicial'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object cxLabel14: TLabel
            Left = 201
            Top = 25
            Width = 65
            Height = 13
            Caption = #218'ltima Leitura'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edtIniLeitura: TcxDBDateEdit
            Left = 75
            Top = 22
            DataBinding.DataField = 'DatIniLeituraDescargaWS'
            DataBinding.DataSource = dsMaster
            TabOrder = 0
            Width = 119
          end
          object edtUltLeitura: TcxDBDateEdit
            Left = 275
            Top = 22
            TabStop = False
            DataBinding.DataField = 'DatUltLeituraDescargaWS'
            DataBinding.DataSource = dsMaster
            Enabled = False
            TabOrder = 1
            Width = 119
          end
          object ckbColetaHoje: TcxDBCheckBox
            Left = 414
            Top = 23
            Caption = 'Coletas Hoje'
            DataBinding.DataField = 'ParColetasHoje'
            DataBinding.DataSource = dsMaster
            ParentFont = False
            Properties.DisplayChecked = 'S'
            Properties.DisplayUnchecked = 'N'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            TabOrder = 2
            Transparent = True
            Width = 107
          end
        end
      end
    end
    object tabsArquivos: TTabSheet
      Caption = 'Arquivos'
      ImageIndex = 2
      object s: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 655
        Height = 337
        Align = alTop
        Caption = '| Diretorio de Arquivos de Saida |'
        TabOrder = 0
        object lbl1: TLabel
          Left = 16
          Top = 59
          Width = 67
          Height = 13
          Caption = 'TOTVS (RM)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl17: TLabel
          Left = 16
          Top = 20
          Width = 92
          Height = 13
          Caption = 'TOTVS (Datasul)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl2: TLabel
          Left = 16
          Top = 99
          Width = 58
          Height = 13
          Caption = 'Magistech'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl3: TLabel
          Left = 16
          Top = 140
          Width = 54
          Height = 13
          Caption = 'WebMeta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl4: TLabel
          Left = 16
          Top = 184
          Width = 28
          Height = 13
          Caption = 'SIGA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl5: TLabel
          Left = 16
          Top = 227
          Width = 20
          Height = 13
          Caption = 'SCL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object sLabel3: TLabel
          Left = 14
          Top = 275
          Width = 402
          Height = 13
          Caption = 
            'Diretorio de Arquivos de Atesto (Somente volume aferido na desca' +
            'rga)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ckbPathDatasul: TcxDBShellComboBox
          Left = 16
          Top = 37
          DataBinding.DataField = 'PathArqDatasul'
          DataBinding.DataSource = dsMaster
          Properties.Root.BrowseFolder = bfCustomPath
          Properties.ShowFullPath = sfpAlways
          TabOrder = 0
          Width = 489
        end
        object ckbPathTotsRm: TcxDBShellComboBox
          Left = 16
          Top = 75
          DataBinding.DataField = 'PathArqRm'
          DataBinding.DataSource = dsMaster
          Properties.Root.BrowseFolder = bfCustomPath
          Properties.ShowFullPath = sfpAlways
          TabOrder = 1
          Width = 489
        end
        object ckbPathMagistech: TcxDBShellComboBox
          Left = 16
          Top = 118
          DataBinding.DataField = 'PathArqMagis'
          DataBinding.DataSource = dsMaster
          Properties.Root.BrowseFolder = bfCustomPath
          Properties.ShowFullPath = sfpAlways
          TabOrder = 2
          Width = 489
        end
        object ckbPathWebmeta: TcxDBShellComboBox
          Left = 16
          Top = 159
          DataBinding.DataField = 'PathArqMeta'
          DataBinding.DataSource = dsMaster
          Properties.Root.BrowseFolder = bfCustomPath
          Properties.ShowFullPath = sfpAlways
          TabOrder = 3
          Width = 489
        end
        object ckbPathSiga: TcxDBShellComboBox
          Left = 14
          Top = 202
          DataBinding.DataField = 'PathArqSiga'
          DataBinding.DataSource = dsMaster
          Properties.Root.BrowseFolder = bfCustomPath
          Properties.ShowFullPath = sfpAlways
          TabOrder = 4
          Width = 489
        end
        object ckbPathScl: TcxDBShellComboBox
          Left = 14
          Top = 248
          DataBinding.DataField = 'PathArqScl'
          DataBinding.DataSource = dsMaster
          Properties.Root.BrowseFolder = bfCustomPath
          Properties.ShowFullPath = sfpAlways
          TabOrder = 5
          Width = 489
        end
        object ckbPathAtesto: TcxDBShellComboBox
          Left = 16
          Top = 294
          DataBinding.DataField = 'PathArqDescarga'
          DataBinding.DataSource = dsMaster
          Properties.Root.BrowseFolder = bfCustomPath
          Properties.ShowFullPath = sfpAlways
          TabOrder = 6
          Width = 489
        end
      end
      object GroupBox6: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 346
        Width = 655
        Height = 161
        Align = alClient
        Caption = '| Diretorio de Arquivos de Carga |'
        TabOrder = 1
        object sLabel6: TLabel
          Left = 10
          Top = 58
          Width = 361
          Height = 13
          Caption = 'Local de Gera'#231#227'o de Arquivos Consulta Base Carga - API SclRota'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl8: TLabel
          Left = 10
          Top = 20
          Width = 451
          Height = 13
          Caption = 
            'Localiza'#231#227'o da Base de dados Exportada do ERP para envio ao  ser' +
            'vidor SCLRota'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 10
          Top = 99
          Width = 305
          Height = 13
          Caption = 'Local de Gera'#231#227'o de Arquivos  - Link Painel Milk'#39's Rota'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ckbPathCarga: TcxDBShellComboBox
          Left = 16
          Top = 39
          DataBinding.DataField = 'PathArqCarga'
          DataBinding.DataSource = dsMaster
          Properties.Root.BrowseFolder = bfCustomPath
          Properties.ShowFullPath = sfpAlways
          TabOrder = 0
          Width = 489
        end
        object ckbpathDump: TcxDBShellComboBox
          Left = 14
          Top = 77
          DataBinding.DataField = 'PathCargaApi'
          DataBinding.DataSource = dsMaster
          Properties.Root.BrowseFolder = bfCustomPath
          Properties.ShowFullPath = sfpAlways
          TabOrder = 1
          Width = 489
        end
        object ckbPathLinkPainle: TcxDBShellComboBox
          Left = 14
          Top = 118
          DataBinding.DataField = 'PathArqLinkViagem'
          DataBinding.DataSource = dsMaster
          Properties.Root.BrowseFolder = bfCustomPath
          Properties.ShowFullPath = sfpAlways
          TabOrder = 2
          Width = 489
        end
      end
    end
    object tabsCarga: TTabSheet
      Caption = 'Mapas Importacao (Carga)'
      ImageIndex = 3
      object GroupBox7: TGroupBox
        Left = 0
        Top = 0
        Width = 661
        Height = 510
        Align = alClient
        Caption = '| Localizacao dos Mapas |'
        TabOrder = 0
        object lbl24: TLabel
          Left = 6
          Top = 18
          Width = 47
          Height = 13
          Caption = 'An'#225'lises'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl10: TLabel
          Left = 6
          Top = 50
          Width = 54
          Height = 13
          Caption = 'Coletores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl18: TLabel
          Left = 6
          Top = 82
          Width = 48
          Height = 13
          Caption = 'Extratos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl9: TLabel
          Left = 6
          Top = 114
          Width = 53
          Height = 13
          Caption = 'Fazendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl15: TLabel
          Left = 6
          Top = 146
          Width = 60
          Height = 13
          Caption = 'Itiner'#225'rios'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl22: TLabel
          Left = 6
          Top = 179
          Width = 30
          Height = 13
          Caption = 'Linha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl16: TLabel
          Left = 6
          Top = 211
          Width = 123
          Height = 13
          Caption = 'Motivo Cancelamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl23: TLabel
          Left = 6
          Top = 243
          Width = 63
          Height = 13
          Caption = 'Produtores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl19: TLabel
          Left = 5
          Top = 275
          Width = 87
          Height = 13
          Caption = 'Grupos de Rota'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl13: TLabel
          Left = 7
          Top = 307
          Width = 48
          Height = 13
          Caption = 'Tanques'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl11: TLabel
          Left = 6
          Top = 340
          Width = 111
          Height = 13
          Caption = 'Tanques Vinculados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl20: TLabel
          Left = 6
          Top = 372
          Width = 46
          Height = 13
          Caption = 'Ve'#237'culos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl14: TLabel
          Left = 7
          Top = 405
          Width = 54
          Height = 13
          Caption = 'Tag (NFC)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl21: TLabel
          Left = 7
          Top = 437
          Width = 27
          Height = 13
          Caption = 'Rota'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl12: TLabel
          Left = 7
          Top = 469
          Width = 49
          Height = 13
          Caption = 'T'#233'cnicos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnMapRota: TSpeedButton
          Left = 551
          Top = 448
          Width = 23
          Height = 22
          Action = acFindFile
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnMapColetor: TSpeedButton
          Left = 551
          Top = 63
          Width = 23
          Height = 22
          Action = acFindFile
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnMapExtrato: TSpeedButton
          Left = 551
          Top = 95
          Width = 23
          Height = 22
          Action = acFindFile
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnMapFazenda: TSpeedButton
          Left = 550
          Top = 127
          Width = 23
          Height = 22
          Action = acFindFile
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnMapItinerario: TSpeedButton
          Left = 551
          Top = 160
          Width = 23
          Height = 22
          Action = acFindFile
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnMapLinha: TSpeedButton
          Left = 551
          Top = 192
          Width = 23
          Height = 22
          Action = acFindFile
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnMapMotivo: TSpeedButton
          Left = 551
          Top = 222
          Width = 23
          Height = 22
          Action = acFindFile
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnMapProdutor: TSpeedButton
          Left = 551
          Top = 256
          Width = 23
          Height = 22
          Action = acFindFile
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnMatGrupoRota: TSpeedButton
          Left = 551
          Top = 291
          Width = 23
          Height = 22
          Action = acFindFile
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnMapTanque: TSpeedButton
          Left = 551
          Top = 322
          Width = 23
          Height = 22
          Action = acFindFile
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnMapVinculado: TSpeedButton
          Left = 551
          Top = 355
          Width = 23
          Height = 22
          Action = acFindFile
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnMapVeiculo: TSpeedButton
          Left = 548
          Top = 384
          Width = 23
          Height = 22
          Action = acFindFile
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnMapTag: TSpeedButton
          Left = 548
          Top = 420
          Width = 23
          Height = 22
          Action = acFindFile
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnMapTecnico: TSpeedButton
          Left = 553
          Top = 483
          Width = 23
          Height = 22
          Action = acFindFile
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnMapAnalise: TSpeedButton
          Left = 550
          Top = 31
          Width = 23
          Height = 22
          Action = acFindFile
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtMapColetor: TcxDBTextEdit
          Left = 7
          Top = 64
          DataBinding.DataField = 'PatMapColetor'
          DataBinding.DataSource = dsMaster
          Properties.ClearKey = 46
          TabOrder = 1
          OnClick = btnMapColetorClick
          Width = 541
        end
        object edtMapExtrato: TcxDBTextEdit
          Left = 7
          Top = 96
          DataBinding.DataField = 'PatMapExtrato'
          DataBinding.DataSource = dsMaster
          TabOrder = 2
          Width = 541
        end
        object edtMapRota: TcxDBTextEdit
          Left = 4
          Top = 449
          DataBinding.DataField = 'PathMapRota'
          DataBinding.DataSource = dsMaster
          TabOrder = 13
          OnClick = btnMatGrupoRotaClick
          Width = 541
        end
        object edtMapTecnico: TcxDBTextEdit
          Left = 6
          Top = 484
          DataBinding.DataField = 'PatMapTecnico'
          DataBinding.DataSource = dsMaster
          TabOrder = 14
          OnClick = btnMapTecnicoClick
          Width = 541
        end
        object edtMapFazenda: TcxDBTextEdit
          Left = 6
          Top = 128
          DataBinding.DataField = 'PatMapFazenda'
          DataBinding.DataSource = dsMaster
          TabOrder = 3
          Width = 541
        end
        object edtMapItinerario: TcxDBTextEdit
          Left = 7
          Top = 160
          DataBinding.DataField = 'PatMapItinerario'
          DataBinding.DataSource = dsMaster
          TabOrder = 4
          OnClick = btnMapItinerarioClick
          Width = 541
        end
        object edtMapLInha: TcxDBTextEdit
          Left = 6
          Top = 193
          DataBinding.DataField = 'PatMapLinha'
          DataBinding.DataSource = dsMaster
          TabOrder = 5
          Width = 541
        end
        object edtMapMotivo: TcxDBTextEdit
          Left = 7
          Top = 224
          DataBinding.DataField = 'PatMapMotivo'
          DataBinding.DataSource = dsMaster
          TabOrder = 6
          OnClick = btnMapMotivoClick
          Width = 541
        end
        object edtMapProdutor: TcxDBTextEdit
          Left = 7
          Top = 256
          DataBinding.DataField = 'PatMapProdutor'
          DataBinding.DataSource = dsMaster
          TabOrder = 7
          Width = 541
        end
        object edtMapGrupoRota: TcxDBTextEdit
          Left = 7
          Top = 288
          DataBinding.DataField = 'PatMapGrupoRota'
          DataBinding.DataSource = dsMaster
          TabOrder = 8
          OnClick = btnMatGrupoRotaClick
          Width = 541
        end
        object edtMapTanque: TcxDBTextEdit
          Left = 7
          Top = 321
          DataBinding.DataField = 'PatMapTanque'
          DataBinding.DataSource = dsMaster
          TabOrder = 9
          Width = 541
        end
        object edtMapVinculado: TcxDBTextEdit
          Left = 7
          Top = 353
          DataBinding.DataField = 'PatMapVinculado'
          DataBinding.DataSource = dsMaster
          TabOrder = 10
          OnClick = btnMapVinculadoClick
          Width = 541
        end
        object edtMapVeiculo: TcxDBTextEdit
          Left = 7
          Top = 385
          DataBinding.DataField = 'PatMapVeiculo'
          DataBinding.DataSource = dsMaster
          TabOrder = 11
          OnClick = btnMapVeiculoClick
          Width = 541
        end
        object edtMapTag: TcxDBTextEdit
          Left = 7
          Top = 417
          DataBinding.DataField = 'PatMapTag'
          DataBinding.DataSource = dsMaster
          TabOrder = 12
          Width = 541
        end
        object edtMapAnalise: TcxDBTextEdit
          Left = 4
          Top = 32
          DataBinding.DataField = 'PatMapAnalise'
          DataBinding.DataSource = dsMaster
          Properties.ClearKey = 46
          TabOrder = 0
          Width = 541
        end
      end
    end
  end
  inherited stsbManutencao: TStatusBar
    Top = 603
    Width = 669
    ExplicitTop = 603
    ExplicitWidth = 669
  end
  inherited tbCadastro: TJvToolBar
    Width = 669
    ButtonWidth = 26
    ExplicitWidth = 669
    object ToolButton2: TToolButton
      Left = 450
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object tbDesableSync: TToolButton
      Left = 458
      Top = 0
      Hint = 'Inativa Sincronizacao de todas as contas'
      Caption = 'Contas'
      DropdownMenu = mniAtivaInativa
      ImageIndex = 13
      Style = tbsDropDown
      OnClick = acDesableAllExecute
    end
  end
  inherited pnlCabecalho: TJvGradientHeaderPanel
    Width = 669
    ExplicitWidth = 669
  end
  inherited acManutencao: TActionList
    Left = 388
    Top = 65530
    object acFindFile: TAction [29]
      Hint = 'Localizar o Arquivo'
      ImageIndex = 4
      OnExecute = acFindFileExecute
    end
    object acDesableAll: TAction
      Category = 'Master'
      Caption = '&Desabilita todas'
      Hint = 'Inativa Sincronizacao de todas as contas'
      ImageIndex = 15
      OnExecute = acDesableAllExecute
    end
    object acEnableAll: TAction
      Category = 'Master'
      Caption = '&Habilita todas'
      Hint = 'Habilitar sincronizacao de todas as contas'
      ImageIndex = 14
      OnExecute = acEnableAllExecute
    end
  end
  inherited dsMaster: TDataSource
    DataSet = MlkPrincipalDTM.cdsContas
    Left = 560
    Top = 65530
  end
  inherited strMaster: TcxStyleRepository
    Left = 456
    Top = 65530
  end
  inherited prtMaster: TdxComponentPrinter
    Left = 524
    Top = 65530
    inherited prtMasterLink: TdxGridReportLink
      ReportDocument.CreationDate = 43045.785616412040000000
      BuiltInReportLink = True
    end
  end
  inherited pmnExportacao: TPopupMenu
    Left = 420
    Top = 65530
  end
  inherited imlCadastro: TImageList
    Left = 488
    Top = 65530
    Bitmap = {
      494C010110007800740010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AC6A2BFFE1A53CFFE6C58FFFF2E0
      C3FFF8F0E2FF0000000000000000000000000000000000000000145AB3CD1457
      A9C1000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000282423595D64
      6FFF000000001509001C3F20066063300592623005923F1F07601409001C0000
      00005C636DFF272322590000000000000000000000000000000000000000716B
      68FF000000000000000003005276050288BE050288BE03005276000000000000
      0000706A64FF0000000000000000000000000000000000000000000000000000
      00000000000000000000E4CDBAFFB5B6B9FF965B19FFDF9C1FFFCC891BFFCD8A
      1BFFCD8A1BFFD6A149FFE5BE73FFE4CDB7FF00000000000000000C31576429BE
      ECFF1161A3B70000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000D0D0F264844
      4CFFA35D16ECDA8705FFDF9508FFFCBF33FFFABE31FFDF9106FFD88300FFA159
      12EC49424CFF0D0D0F260000000000000000000000000000000000000000655E
      52FF150FAAF91010EFFF2726FAFF3D3AF8FF3D3AF8FF2827FBFF1010EFFF1410
      A9F9645D51FF0000000000000000000000000000000000000000000000000000
      00000000000000000000B26523FF121019FF804A09FFE39C20FFCB891CFFCD8A
      1CFFCD8A1CFFCC891CFFD6941CFFAC641DFF0000000000000000000000000C36
      6A7927FFFFFF01135A7100000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000B050112CC7D
      17FFF7AD15FFF6B627FFF5DFBAFFEAECF2FF454444FFF7E0B8FFF6B729FFF7A7
      0DFFC8780FFF0B05011200000000000000000000000000000000000000001010
      B7E81D24FFFF7C76E9FFCFC5DCFFE4E4E2FF454444FFC9BED3FF7D78EAFF1D24
      FFFF100FB6E80000000000000000000000000000000000000000000000000000
      00000000000000000000C67B2CFF13111AFF864F09FFE49A21FFCD8A1DFFCF8B
      1DFFCF8B1DFFCE8A1DFFD8941BFFB36F2AFF0000000000000000000000000105
      0E122BE7F7FF0CE3F8FF01001D29000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C67922F3F3B7
      2EFFFBB928FFF7E0B8FFEAECF2FFEAECF2FFE3E1DEFFD4D4D2FFF7E0B8FFFBBB
      2BFFF7BD36FFC27318F3000000000000000000000000000000000E0EA5D01826
      FDFFA198DDFF6F6F6EFFEBE9E8FFE4E4E2FFDBD8D7FFD1D0CFFF454444FFA099
      DEFF1827FEFF0E0EA5D00000000000000000000000000000000000000000FDFD
      FEFF2020CAFF00000000D69140FF14111BFF8A530BFFE69E22FFCE8C1FFFCF8D
      1FFFCF8D1FFFCE8C1FFFD6941DFFB6732FFF0000000000000000000000000000
      00000F2B738A24FFFFFF0076C2DA000000000000000000000000000000000000
      00000000000000000000000000000000000002010004522E0F71ECB337FFF0C9
      7FFF69686AFFDEE2E6FFEBE7E7FFEBE7E7FFE3E1DEFFD4D4D2FFD4D4D2FF4544
      44FFF9B92CFFE9AB29FF512D0F710201000400000000000000001E2CEFFF5C60
      E9FFFFFFFCFFFAFAF9FFEBE9E8FFE4E4E2FFDBD8D7FFD1D0CFFFD1D0CFFFB9B6
      B3FF6367F0FF1F2DF0FF00000000000000000000000000000000000000000000
      00001614D9FF2329F4FFAD6D40FF251A00FF8E530EFFD89220FFCF8C1FFFD08F
      23FFD08F22FFCF8E22FFD79620FFBA7833FF0000000000000000000000000000
      000004081E252AD8F4FF08FFFFFF0057A6B90000000000000000000000000000
      00000000000000000000000000000000000026160732A66F25C7F0BD45FFF1E5
      CEFFFFFFFFFFFFFFFFFFF1F2F0FFF0F0EDFFF3F1F0FFECEAE7FFD4D4D2FFCCC8
      C8FFDAC4A8FFF4BE42FFA26820C726160732000000000B0A69811F3AFAFFC4C3
      F2FF6F6F6EFFFAFAF9FFEBE9E8FFE1E0DFFFDAD7D6FFCFCECDFFD0CECDFF4544
      44FFA09DCEFF223DFDFF0B0A6981000000002F38E7FF1D2AE8FF232CE8FF222E
      EBFF2430EFFF2032FFFF1B25F9FF00002FFFAA6F06FFE4EAF1FFBC7418FFD693
      24FFD29227FFD29127FFD89925FFBE7D35FF0000000000000000000000000000
      000000000000112A667B21FFFFFF00D2FFFF081D6C8A00000000000000000000
      0000000000000000000000000000000000005837136FCA953EE6F8CC68FFD8D3
      CEFFF9F7F7FFF9F7F7FFF1F2F0FFD4D4D2FFD4D4D2FFD4D4D2FFD4D4D2FFB6B3
      B4FFABA29BFFFCC75BFFC58F34E65735126F000000001416AECD203CFBFFE9E0
      F6FFF7F7F6FFF7F7F6FFEBEAE9FFE1E0DFFFDAD7D6FFD0CECDFFD0CECDFFD0CE
      CDFFB5ABBDFF2441FFFF1416AECD00000000606DEFFF152EF4FF223AF4FF2137
      F4FF2338F2FF273AEFFF213CFFFF2B3FFFFF895645FFFAD273FFD29A3DFFD698
      2EFFD39229FFD4932BFFDA9C2DFFC28238FF0000000000000000000000000000
      00010000000002001B2539B4EBFF0CFFFFFF06A8F3FF0B11719B000000000000
      00000000000000000000000000000000000064411A7CD9AF63EEFFD870FF6C6B
      6BFFFEFDFCFFFEFDFCFFFFFFFFFF000000FF000000FF424043FF424043FF6E6D
      6CFF454444FFFFCA5BFFD7AC5BEE6342197C000000001314AFCB5B6EF4FF6F6F
      6EFFFBFBFAFFFBFBFAFFF0F0EEFF242327FF242327FF414143FF3C393DFF4442
      40FF454444FF6072F8FF1214AFCB000000006A7AF4FF4565F7FF4A67F6FF4E69
      F6FF425CF3FF1F3CF2FF5E7FFFFF1F28B9FFA46820FFF0BA4DFFDEAE56FFDFAF
      58FFDBA749FFD59A36FFDB9F31FFC5883DFF0000000000000000000000000035
      5863008AE5FF008AE5FF0B95E3F908DBFDFF00DDFFFF06A8F3FF0000699D0000
      0000000000000000000000000000000000004B31105BC39951DAF2CC7AFFF9EC
      CFFFFFFFFFFFF6F6F6FFFFFFFFFF424043FFFFFEFDFFFFFEFDFFECE9E7FFECE9
      E7FFF9D37CFFFAD78CFFC2954EDA4A30105B000000001215A6BA7686F1FFA1A4
      FCFFFFFFFFFFFCFCFBFFF8F7F7FF414143FFECEAE8FFECEAE8FFE0DFDEFFE0DF
      DEFF8988DBFF8897F6FF1618A6BA000000005960EFFF656FF1FF636DF1FF6670
      F0FF495FF1FF638AFFFF8667B4FF0D0300FFAA7628FFF2C46DFFE0B05DFFE0B2
      5EFFE2B462FFE2B261FFE1AE4BFFCA8B3EFF0000000000000000000000000001
      080B66CFE6F041FFFFFF00D4FAFF00D4FAFF00D4FAFF00CFFFFF06A8F3FF0D20
      6C8D00000000000000000000000000000000160E041B9D7537B5FEF8DEFFF5CC
      75FF6E6D6CFFEAEAEBFFFFFFFFFF6E6D6CFFEFEDEBFFEFEDEBFFE2E1E2FF4544
      44FFF6CF79FFFFFAE2FF9C7437B5160E041B0000000007056370B8C2F5FF6E77
      F9FF6F6F6EFFE2E1E0FFFAF9F9FF7B7A77FFECEAE8FFE2E0DEFFD8D7D5FF4544
      44FF6A70F5FFB7C2F6FF0B076370000000000000000000000000000000000000
      00003B40F0FF5360FFFFE9A84EFF22180BFFA8793AFFF5CA77FFE2B768FFE3B8
      69FFE3B869FFE4B86AFFEAC377FFD1984CFF0000000000000000000000000000
      00001A1E282C9CF4F8FF57FFFFFF3DD8F8FF46D5F7FF34E8FFFF23E3FFFF06A8
      F3FF0609415A000000000000000000000000000000002517042DF8E6BFFFFBEA
      C6FFF6CD71FFEDF0FAFFFFFFFFFF959496FFE1E2E5FFE1E2E5FFE1E2E6FFF7CE
      74FFFFEDC5FFF7E2B8FF2517042D000000000000000000000000616CF4FFAAB3
      F2FFB9BBFFFFFFFFFCFFFAF9F9FF9A9999FFECEAE8FFE2E0DEFFD5D2DEFF9C9E
      E2FFB6BAF4FF606CF4FF0000000000000000000000000000000000000000FAFA
      FEFF2222FFFF00000000F6B54CFF1C1014FFB2803FFFF8D284FFE6BF73FFE7C0
      74FFE7C074FFE7BF73FFECCB80FFD59D52FF0000000000000000000000000000
      0000000000003847677398FFFFFF4CF0FEFF53EAFEFF68BCEEFF699DE0FF2D47
      6A7A090E5E8100000000000000000000000000000000000000006046196DFEF5
      DAFFFFEFCDFFF0C76DFFE1E2E6FF959496FF454444FFE9E2D9FFF1C76CFFFFF0
      CAFFFFF7DFFF5F43196D000000000000000000000000000000000805545B929F
      F6FFAAB1F2FF8F91FCFFD1CEDCFFBEBCB2FF454444FFD5D2DEFF8386EEFFADB4
      F5FF94A1F7FF0907545B00000000000000000000000000000000000000000000
      00000000000000000000F5B144FF1D1212FFB98949FFFDD991FFEAC681FFEAC5
      81FFEAC581FFEAC581FFF0D08FFFD8A357FF0000000000000000000000000000
      000000000000000001026691B7C66CFCFFFF37E2FCFF51DEFDFF4D6CB0CF0000
      000000000000000000000000000000000000D9AD55EBF1CF7EFF5F47196BA97B
      27C3F7E9D0FFFFFDEFFFF7DDA1FFF5CD76FFF2CA75FFF0C872FFFFFFF0FFF5E8
      CEFFA5792AC35C3E076BE7B140FFD4A744EB00000000404BF7FF404BB6B9272A
      CDDB8892F7FFCCD1F0FF999FF7FF767CFCFF767CFCFF989FF7FFCCD1F1FF8991
      F8FF1F1EC4DB1212B2B9180FF4FF000000000000000000000000000000000000
      00000000000000000000E6AB5BFF180D0EFFC49957FFFFF2AFFFFFE09DFFFFE4
      A0FFF8DB9AFFF3D495FFF5DEA3FFDDAB5DFF0000000000000000000000000000
      00000000000000000000161E303890E0F7FF5EF4FFFF3CE1FFFF54D0FAFF465C
      A2C200000000000000000000000000000000D8C590E0F5DFAAFFEDBB55FFDB9F
      30FFBE8317E0B8954DC6F7E1AFFFFBEDC9FFFCEDCAFFF6E2B2FFB9964FC6BE80
      10E0D79726FFECBC56FFF1D17BFFD6B971E0000000005C71FBFF4560FAFF273E
      F6FF1412F3FF343AE5EC7781F6FFA2A9F4FFA6AFF4FF747CF6FF3B41E6EC1D2E
      F6FF2A43F7FF2533F5FF1B19F4FF000000000000000000000000000000000000
      00000000000000000000EBB05BFF301F1BFF231F20FF6E5A44FF9E8663FFBBA7
      7CFFDDC18CFFF1D399FFFEEBBAFFE2B164FF0000000000000000000000000000
      00000000000000000000000000003C50666F8AF0FEFF49EAFFFF36ECFFFF47BE
      F1FF3E65A3C200000000000000000000000035302337ADA07BB0FFE88FFFF5D2
      7EFFECBA52FFDF9F23FF3324073A07050108070501083223043AE8BC64FFEDC4
      68FFF5CD6CFFFFEA8EFFAD9B65B0352F1F3700000000414E93945270FFFF314C
      F8FF222CF5FF150AF4FF06035D6202002F3202002F320A0F5D626F83FDFF4865
      FAFF3654F9FF2A41FAFF13198E94000000000000000000000000000000000000
      00000000000000000000E9B867FFDBA750FFCF9C4DFFC49346FFB98940FFB281
      38FFCE9947FFDEAB53FFE8B863FFE3B25FFF0000000000000000000000000000
      0000000000000000000000000000000000004B6F95A57DD2F5FF6EBBE6F475C8
      F3FF6AA9E3FF4C78A4BA000000000000000000000000000000009E917FE1BEAA
      6AC0F9DF92FFCBAE67D606040107000000000000000006040107CAAC65D6FAEA
      B6FFC0AF7EC0948774E100000000000000000000000000000000636992DA2439
      D8DB2025F5FF170DF1FC000000000000000000000000000000004A64F7FC6C87
      FCFF415BDBDB52588BDA00000000000000000000000000000000000000000000
      0000000000000000000000000000E56508FFE46A0CFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C05500FFC05500FF00000000000000000000
      0000000000000000000000000000000000000000000000000000BD7444FF0000
      0000000000000000000000000000000000000000000000000000EEDCD1FFB461
      1FFFBA6318FFB85F11FFB76735FF000000000000000083807EFF7F797AFF6364
      6DFFAD7120FFD89226FFCC8825FFCC8925FFCD8925FFCF8B22FFCC8824FFC783
      23FFC98520FFD08B1FFFCB841CFF000000000000000000000000000000000000
      00000000000000000000E6670AFFE5801AFFE57816FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BF5400FFD47A0BFFC05500FF000000000000
      0000000000000000000000000000000000000000000000000000B75D15FFC277
      45FF000000000000000000000000000000000000000000000000EAD4CBFFDEAC
      53FFF0AA13FFECA40FFFB6632AFF0000000000000000837D7CFF7F7A7AFF5B5D
      65FFAC6E13FFD88E19FFCD8719FFD28B18FFBA6D04FFAA5907FFBF7108FFD48F
      1AFFCF8A1AFFCD8819FFCD8921FF000000000000000000000000000000000000
      000000000000E76907FFED9A2EFFF0B03EFFE26E10FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BE5100FFF4BA23FFD57708FFC9681AFF0000
      0000000000000000000000000000000000000000000000000000CF8F4BFFE5B1
      57FFB3571EFF0000000000000000000000000000000000000000EBD6CDFFD69D
      4CFFE59B15FFE29512FFB4602BFF0000000000000000827D7BFF7F7A7AFF5C5C
      66FFB3741EFFDD9425FFD59026FFC5780FFFD0B19BFFFFFFFFFFCAA282FFC375
      0BFFD69328FFD58E23FFD18E2BFF000000000000000000000000000000000000
      0000E96F08FFEEA139FFF8CB5DFFE99B36FFDC700EFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BE5100FFE69101FFF0AD15FFD47608FFC968
      19FF000000000000000000000000000000000000000000000000CC8850FFFDE0
      70FFDB8D1AFFBD6833FFF7EEE8FF000000000000000000000000ECD7CDFFD9A4
      55FFEAA51EFFE7A119FFB3632BFF0000000000000000827D7BFF7F7A7AFF5C5C
      63FFB67C26FFDF9D2FFFD79730FFC37A1CFFE9DDD3FFFFFFFFFFE1CDC0FFBF70
      08FFDA9C33FFD6952DFFD39435FF00000000000000000000000000000000ED77
      09FFEFAE4AFFF9D06FFFF7C054FFDF9737FFD77821FFE08225FFDC781FFFDC78
      19FFDB7213FFDA6B0FFFDA680AFFD35008FFCA6713FFC45E06FFC45E07FFC55F
      08FFC56009FFC5600AFFC5610BFFCA6709FFE99300FFE18B00FFF0A90EFFD073
      0AFFC96818FF0000000000000000000000000000000000000000D08D51FFF6DA
      78FFF1BD35FFE3A134FFBB6221FFF4E6DBFF0000000000000000EDD9CDFFDCAB
      60FFEDB12DFFEAAB27FFB8672FFF0000000000000000827D7BFF7F7A7AFF5B5A
      63FFBB8130FFE2A33DFFD79B3CFFD99932FFB7732AFFC6996AFFBA7422FFDA9B
      38FFD89D3DFFDA9B3AFFD69940FF000000000000000000000000EE7F0AFFF4BB
      5FFFFAD885FFF7C765FFF6C059FFEDAF4AFFEAAA41FFE7A535FFE89E2BFFE793
      21FFE48919FFE28211FFE37D0AFFCB4B00FFDC8C25FFFFE767FFFFD555FFFDCD
      47FFFCC63EFFF8BC33FFF5B427FFF3AB1CFFED9F12FFE99505FFE48C00FFED9E
      02FFCE720CFFC96817FF00000000000000000000000000000000D49254FFF8DF
      85FFEBB63BFFF3C94FFFECB342FFBE6319FFEBD1BEFF00000000EED9CDFFDFB0
      68FFF0BB3DFFEDB335FFBF6D31FF0000000000000000827D7BFF7F787AFF5A5B
      61FFC08838FFE7A945FFDCA144FFDC9C38FFD6AB76FFF0E7E1FFD9B382FFD893
      2CFFDFA447FFDFA241FFD99F47FF0000000000000000F1880CFFF6C671FFFCE1
      9FFFF9CE7AFFF7CA6DFFF6C361FFF6C055FFF6BA4AFFF4B33EFFF3AA33FFF1A3
      29FFF09A1FFFEF9217FFEE8B0FFFCE4E02FFDE9128FFFFE676FFFAD063FFF8CD
      56FFF7CA4DFFF6C443FFF4BD39FFF2B32FFFEFA824FFEEA41AFFEC9C0EFFE68F
      02FFEF9B00FFD27C16FFC76312FF000000000000000000000000D89957FFFAE4
      92FFEEBF4AFFEDC257FFF5CD5AFFEEBC4BFFC9701CFFECD0BBFFF6EBE3FFE0B2
      70FFF2C44BFFF0BD44FFC27335FF0000000000000000827D7BFF7F7878FF5A5B
      62FFC38E3FFFEBB050FFE1A94EFFDD9D39FFD1A269FFFFFFFFFFE9D6C5FFCC86
      1EFFE5AE52FFE3A94CFFDCA44FFF00000000F39714FFF9DC9BFFFEEFD0FFFAD7
      88FFF9D383FFF8CF77FFF7C869FFF5C15BFFF4BB51FFF2B645FFF1AC39FFF0A5
      30FFEE9D26FFED941CFFEF9115FFD05406FFE3982EFFFFEB83FFFBDA6FFFF9D3
      65FFF9CF5CFFF7C952FFF6C749FFF5BF40FFF3B635FFF1B02CFFEFA921FFEDA4
      18FFE68A00FFF6BF29FFEDBD65FFC96511FF0000000000000000DC9E59FFFBE9
      9DFFF0C557FFF1CA63FFF1C95FFFF3CD5CFFF9D86CFFD28737FFD39460FFE4B9
      7AFFF3CB57FFF1C651FFC77A37FF00000000000000007F7A78FF7B7676FF5957
      5DFFC79245FFEDB558FFE3AC55FFE7B158FFD59235FFE8D5BFFFFFFFFFFFD9AD
      7AFFD99A3AFFE7B35CFFDFAA58FF00000000F2950EFFF8CF87FFFFF9ECFFFCE1
      ACFFF9D583FFF8D27FFFF7CB72FFF6C563FFF4BD54FFF3B544FFF2AF3BFFF0A6
      32FFEF9F26FFED951DFFF09718FFD65908FFE9A231FFFFF08EFFFDE17AFFFCDC
      72FFFBD769FFF9D260FFF8CB55FFF7C84EFFF5C547FFF4BD3CFFF3B534FFEFA7
      1BFFF2B62BFFF5D675FFDD963BFFC5600DFF0000000000000000E0A35CFFFBED
      A8FFF1CD63FFF3D270FFF1CB63FFF6D878FFF6DE93FFD99851FFE8C6A7FFE4BB
      79FFF5D366FFF3CE5FFFCD7F39FF00000000000000008E8888FF8F8A8AFF7472
      78FFD7B070FFF4CA83FFEAC27CFFECC37DFFF0C77DFFD8A354FFFBF8F6FFFFFF
      FFFFD59E56FFEAB556FFE2B15FFF0000000000000000F38601FFF5C170FFFFFA
      ECFFFCE2ADFFF9D17DFFF8CF7AFFF7C868FFF6C56AFFF4C261FFF3BB53FFF2B4
      47FFF0AE3DFFEFA532FFF09F20FFDA6009FFEDAC38FFFFF49DFFFEE789FFFEE3
      80FFFDE07AFFFBDC71FFFBD769FFFAD261FFF7CD55FFF6C951FFF5BD36FFF2BD
      38FFFCDC6EFFDE922CFFC45D0BFF000000000000000000000000E2A95FFFFDF1
      AFFFF4D46FFFF5D36EFFF8E794FFF3D894FFD17D22FFFEFCFBFFF7EBDFFFE8C1
      80FFF6D874FFF5D46DFFD1843CFF0000000000000000A09C9CFF9E9999FF817E
      83FFDCB77CFFF6D492FFE8BF80FFDEB074FFE7BB73FFE3B161FFF0E0C9FFFFFF
      FFFFEEDAC1FFE9B663FFE5B86CFF000000000000000000000000F17D00FFF5BB
      68FFFFFAEBFFFBE1ADFFF9CE70FFF8CC70FFFBE7B6FFFAEABEFFF9E2ABFFF8DE
      9CFFF6D88AFFF6D47FFFF6C34EFFD96209FFF1BC5AFFFFFFFAFFFFFFE3FFFFFF
      E0FFFFFEDDFFFFFCD8FFFFFDD9FFFFF7C7FFFBD463FFF8C947FFF7D474FFFEE6
      8CFFE3931FFFC45D0DFF00000000000000000000000000000000E5AF62FFFEF5
      B9FFF4D773FFFDECA3FFF4DDA0FFDB963DFFFAF2E9FF00000000F4E2CEFFEAC6
      86FFF7DF80FFF6DB79FFD58D3EFF00000000000000009C9797FF999595FF7E7B
      7FFFDEBA81FFF9D28EFFE7C187FFFEFFFFFFFFFFFFFFF9F4EEFFFFFFFFFFFFFF
      FFFFEAC894FFF2CF8FFFECCA8EFF00000000000000000000000000000000EF78
      00FFF2B35CFFFEF8E4FFFCE7BFFFF8D17CFFF2A842FFF1A137FFF0A031FFEF9A
      2BFFED9125FFEC8821FFEC8A21FFDF640FFFEEA42AFFEEB144FFEDAB3EFFECAA
      3DFFEBA83CFFEAA83DFFE8A037FFE7A33BFFFDDE67FFFDE9A2FFFFF3B1FFE59F
      2EFFC25809FF0000000000000000000000000000000000000000EAB565FFFEF5
      B8FFFBED9FFFF1D38FFFE19B3CFF000000000000000000000000F5E4CFFFECC9
      89FFF9E48BFFF8DF83FFD99341FF00000000000000009C9797FF999595FF7E7A
      7FFFE0C087FFFCDA9BFFEBC885FFECCC97FFF6E8D6FFFCFAF9FFF9F1E6FFECCC
      9CFFEDC57DFFF6D99EFFEDCB8FFF000000000000000000000000000000000000
      0000EE7000FFF1AC50FFFEFDF1FFF9D593FFEA7803FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000ECA01AFFFFFBC8FFFFFCCCFFE5A540FFC157
      07FF000000000000000000000000000000000000000000000000ECBB64FFFFFF
      EAFFF3D58CFFE3A43CFF00000000000000000000000000000000F7E5D0FFEECE
      8EFFFAE995FFFAE58FFFDD9B45FF00000000000000009C9896FF999595FF7C7A
      7DFFE1C38BFFFDDDA2FFF4D79EFFF4D293FFF0CB85FFEEC77EFFEEC982FFF4D1
      90FFF7D9A0FFF7DAA0FFEECE95FF000000000000000000000000000000000000
      000000000000ED6F00FFF1AA55FFFAE39FFFED8F1BFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F3B83BFFFFFEC8FFE5A63FFFC15605FF0000
      0000000000000000000000000000000000000000000000000000F0C875FFF8E9
      BAFFEAB14BFF0000000000000000000000000000000000000000F7E7D0FFF1D2
      91FFFBE892FFFAE78DFFE1A147FF0000000000000000A6A3A4FFA19C9CFF7A78
      7BFFE3C68DFFFFE4A3FFFBDD9EFFFBDE9FFFFCDE9FFFFCDEA0FFFBDEA0FFFADC
      9DFFFADB9CFFFDDF9EFFF6D89CFF000000000000000000000000000000000000
      00000000000000000000ED7104FFEEA031FFED9525FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F8BE33FFE4A541FFC15505FF000000000000
      0000000000000000000000000000000000000000000000000000EEB942FFEEC0
      5FFF000000000000000000000000000000000000000000000000F8E8CFFFF4DC
      A2FFFFFFE5FFFFFFDDFFE5AA50FF00000000000000009C9895FFB2AFADFFC6C6
      C8FFEFE2CAFFF4E8D4FFF0E6D3FFF3E8D6FFF5EAD8FFF6ECD9FFF8EEDCFFFAF0
      DEFFFAF1E1FFFFFAEDFFE4CDA8FF000000000000000000000000000000000000
      0000000000000000000000000000EF8307FFED820BFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DA8A26FFC15708FF00000000000000000000
      0000000000000000000000000000000000000000000000000000F1C96BFF0000
      0000000000000000000000000000000000000000000000000000FAEED9FFEAB5
      50FFEDC170FFECBD6BFFE8B154FF00000000000000008A8782FF2E2820FF3F3D
      3CFF5E5241FFBD9763FFB28D5DFFB08B5CFFAE8658FFAB8456FFAA8154FFA87F
      50FFA57B4CFFA27646FFAB733DFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004D73AAFF224078FFC4AAA6FF3E3B38FF8C8482FF64615FFF2C2A
      28FF2B2728FF302C2CFF383635FF0000000000000000383535FF898380FF3432
      30FF201F1EFF212020FF2C2829FF2F2D2DFF0000000000000000000000000000
      0000D7C39BFFECE3D6FFECE3D6FFECE3D6FFECE3D6FFECE3D6FFECE3D6FFD7C3
      9BFF0000000000000000000000000000000000000000000000009E4309FFAF58
      11FFA74801FFA85727FF00000000000000000000000000000000000000000000
      000000000000E6D2C9FFAE663EFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004072AEFF008EECFF009AF4FF1F4B80FF272323FFBAB7B0FF75716CFF1310
      10FF111010FF1A1A18FF3C3835FF0000000000000000474444FFEBE6E4FF332F
      2EFF110F0FFF171615FF2F2D2BFF333131FFAFABABFFB0ABABFFA6A1A1FF716B
      72FFC4AB7FFFEDE1D5FFEDE1D5FFEDE1D5FFEDE1D5FFEDE1D5FFEDE1D5FFC4AB
      7FFF757076FFA39D9DFFA8A3A3FFAAA4A4FF0000000000000000BA7027FFFDC2
      30FFE88E00FFB45D1FFF00000000000000000000000000000000000000000000
      0000ECDCD6FFAA5519FF9E4512FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFEFF2E6D
      B1FF2BA7F5FF16C0FFFF00A0F3FF558AC3FF504B48FFCFC8CAFFBABAB5FF5650
      4EFF514B49FF4B4645FF494443FF00000000000000006B675FFFBEBCBAFFA5A0
      9EFF514D49FF4C4746FF494643FF312E2CFF958F8FFFC3C0BFFFC3C0BFFF837D
      84FFC6A874FFE0CBAEFFE0CBAEFFE0CBAEFFE0CBAEFFE0CBAEFFE0CBAEFFC6A8
      74FF837D84FFC3C0BFFFC3C0BFFF999292FF0000000000000000B86B28FFEFB4
      37FFDE8A0BFFB56223FF0000000000000000000000000000000000000000E4CC
      C5FFAC5C23FFEFB12FFFAB561DFF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFEFF2873BAFF68C4
      F8FF6BD4FFFF279CE6FF6595C7FF0000000075706EFFCCCCC8FFEFEDEDFF8E88
      83FF7F7B77FF6F6966FF4E4B46FF0000000000000000716D66FFAFAAA6FFF5F5
      F3FF857F7BFF736D6BFF615C59FF454140FFA49FA1FFD1CFCEFFD1CFCEFFD3D2
      D1FFD2D2D3FFD0D0D2FFD0D0D2FFD0D0D2FFD0D0D2FFD0D0D2FFD0D0D2FFD2D2
      D3FFD3D2D1FFBACAD7FF6E9BE3FFA49FA1FF0000000000000000BE7030FFF3BC
      46FFE49515FFB96728FF00000000000000000000000000000000D9B5A9FFB86F
      32FFEBAD2FFFE6950FFFAC5620FF000000000000000000000000000000000000
      000000000000000000000000000000000000000000003C8ED4FFA4E3FEFFB5EE
      FFFF4CAAE7FF659CD1FF0000000000000000827F7DFFBAB5B2FFE8E8E6FF8682
      7EFF6C6864FF686361FF4B4646FF000000000000000064635EFFABA6A0FFE0E0
      DEFF746D6BFF67625DFF625D5BFF5D5C5CFFAAA7A7FFD9D7D7FFD9D7D7FFD9D7
      D7FFD9D7D7FFD9D7D7FFD9D7D7FFD9D7D7FFD9D7D7FFD9D7D7FFD9D7D7FFD9D7
      D7FFD9D7D7FF8AC3E9FF004BFBFFABA8A8FF0000000000000000C27634FFF6C4
      51FFE79F1FFFC06E2BFF000000000000000000000000D3A997FFBF7838FFF0B7
      3EFFE49613FFE49A1DFFB25F27FF000000000000000000000000FDFDFDFFA087
      88FF896969FF92726DFF856466FFAF9494FFB9A7B0FF359EE8FFBDF5FFFF77C4
      EFFF63A0D9FF000000000000000000000000B2B1AEFFABA5A0FFF9FBFBFF9E9A
      98FF746F6CFF716C69FF565251FF0000000000000000615E5BFFADA8A3FFF5F5
      F5FF807B78FF736D69FF635D5BFF9D9C9CFFB7B3B3FFE6E8E9FFD6C5AFFFBC6B
      10FFBB6A0FFFBB6A0FFFBB6A0FFFBB6A0FFFBB6A0FFFBB6A0FFFBB6A0FFFBB6A
      0FFFBC6B10FFD6C5AFFFE6E8E9FFB8B5B5FF0000000000000000C77B38FFF6CB
      5CFFEAA728FFC4742EFF0000000000000000C28368FFCC8F49FFF4BD41FFE39A
      1EFFE49C28FFE7A527FFB76328FF0000000000000000D6CCCCFF7D5757FFDFD3
      CBFFFFFFF7FFFFFFE7FFFFFEDBFFD6BB9EFF90584DFF817B8EFF1794E4FF6AB4
      E8FF00000000000000000000000000000000B4B2B2FF888280FFF9F7F7FFB5AD
      ABFF716C69FF716C68FF595554FF8A8786FFAEADABFF5C5A57FFA6A29DFFF3F3
      F3FF827E79FF736F6BFF514C4AFF919090FFBCB9BAFFEEF2F5FFBA7B3EFFE1A9
      42FFE1A842FFE1A842FFE1A842FFE1A842FFE1A842FFE1A842FFE1A842FFE1A8
      42FFE1A942FFBA7B3EFFEEF2F5FFBFBBBCFF0000000000000000CB823BFFF7D2
      67FFEEB031FFCD823BFF00000000C17E5BFFD4984CFFF4C247FFE7A329FFE7A6
      31FFE7A62FFFEDAC31FFBE6A2AFF00000000EDE8E8FF886565FFFFFFFFFFFFFF
      FFFFFDF8E8FFFAF2DCFFF8EDCFFFFFF1CFFFF6DEBAFF9F5945FFBFC6D5FF0000
      00000000000000000000000000000000000084807FFF393535FF383432FF2F2B
      2AFF252121FF3D3A38FF6F6968FF5B5655FF2A2827FF6F6868FF4D4744FF1515
      14FF0B090AFF0B0A0BFF0C0B0CFF3B3B3BFFCDC8C9FFF8FCFFFFCD9753FFEEC6
      70FFEEC771FFEEC771FFEEC771FFEEC771FFEEC771FFEEC771FFEEC771FFEEC7
      71FFEEC670FFCD9753FFF8FCFFFFCECBCCFF0000000000000000D08840FFFAD7
      72FFF0B73CFFD38D46FFBD7041FFE6BC79FFFACE53FFE9A82AFFEBB03BFFEAAE
      38FFE9AD37FFEDB43AFFC3712DFF00000000A28788FFF6EFEAFFFFFFFFFFFEFB
      F5FFFBF7E8FFF9F4DAFFF5EBCCFFE6CEACFFF3DAB8FFE2BD99FFAA8A8DFF0000
      000000000000000000000000000000000000BBB9B9FF8B8682FFEBE8E8FFF1F1
      F3FFE0DAD7FF7C7775FF645F61FF645D5CFF292726FF6F6966FF575151FFEFED
      EBFFF9F9F5FFD7D3CFFFE9E2DAFF959393FFD2D0D0FFFCFFFFFFD7A55CFFEDC9
      77FFE9BF68FFE9BF68FFE9BF68FFE9BF68FFE9BF68FFE9BF68FFE9BF68FFE9BF
      68FFEDC977FFD7A55CFFFCFFFFFFD4D1D0FF0000000000000000D68E43FFFADA
      7DFFF1C046FFD8944BFFDFB79FFFDDA966FFFCE89FFFEEB83FFFEBB23BFFECB5
      43FFECB541FFEFB943FFCA7831FF00000000927573FFFFFFFFFFFDFBF1FFFCF8
      EEFFFAF3E1FFFCF5E3FFF7F0D7FFF0DFC1FFE7C9A9FFF0D1ABFFA77D74FFF7F5
      F6FF00000000000000000000000000000000D1CFCEFF736F69FFD7D7D5FFDAD5
      D7FFC5C1BEFF716C6BFF5F5B59FF5F5857FF282625FF6B6663FF524F4DFFE6E6
      E4FFCECCCCFFBAB5B4FFA59E9BFFB1B1B0FFDEDCDBFFFFFFFFFFE8C070FFE0AC
      54FFB99D6BFFD7BD91FFD7BD91FFD7BD91FFD7BD91FFD7BD91FFD7BD91FFB99D
      6BFFE0AC54FFE8C070FFFFFFFFFFE3DFDFFF0000000000000000DA9445FFFCE1
      88FFF4C651FFD8913CFF00000000E1BBA2FFD4944BFFFFF1B8FFF0BF4DFFEDB5
      42FFEEBB4CFFF1C24DFFCF8133FF00000000987C79FFFFFFFCFFF9F2E1FFFAF3
      DEFFFAF7E5FFFAF1DCFFF1DFC0FFEDD9BAFFECD8B9FFEDCAA5FFAF8679FFECE7
      E8FF00000000000000000000000000000000DEDDDDFF645D5BFFD5D1CFFFE9EB
      EDFFE2E2DEFF7B7777FF66615FFF6B6362FF262323FF595451FF494542FFFDFD
      FBFFEBEDEDFFE0E0DCFF97918EFFCBCBCBFFD0CACCFFBBBABFFFDDB572FFCE9D
      5EFFC4AB7FFFDFCAADFFDFCAADFFDFCAADFFDFCAADFFDFCAADFFDFCAADFFC4AB
      7FFFCC9855FFDCB26DFFBDBCC0FFD0C9CBFF0000000000000000DD9A48FFFEE6
      8FFFF7CE5CFFDC973DFF0000000000000000E8C5A8FFD99A4FFFFFF4C1FFF3C7
      59FFEFBB4AFFF3C558FFD48736FF000000009B7F7AFFFFFFEBFFF9EED5FFFAF1
      D7FFF9F2DAFFF2E3C6FFFEFBF9FFFFFFF0FFEFDFC0FFE9C69EFFAF847AFFF4F1
      F2FF0000000000000000000000000000000000000000807C79FFE8E2E0FFC3C3
      C0FF7F7875FF55514FFF595654FF403D3BFF332F2FFFB7AFABFF7F7B77FFA39D
      9DFF8C8986FF97918FFF53504FFF000000000000000000000000000000000000
      0000D0BD98FFECDFD1FFECDFD1FFECDFD1FFECDFD1FFECDFD1FFECDFD1FFD0BD
      98FF000000000000000000000000000000000000000000000000E2A04CFFFFE9
      97FFF9D363FFDD9B41FF000000000000000000000000F2DCC5FFDA9C49FFFBEB
      B6FFF7CF69FFF4C854FFD88F39FF00000000AE9495FFF7EAC8FFF9EBCCFFEFDC
      BEFFF4E4C7FFF0E1C5FFFDFCECFFFAF5DDFFEFDCBCFFDFB087FFB49999FF0000
      00000000000000000000000000000000000000000000C2C0C0FF9F9A9AFF5A56
      54FFAAA6A3FF787370FF3D3938FF00000000000000009D9A98FFF5F5EBFF524E
      4DFF302D2DFF514F4DFF757373FF000000000000000000000000000000000000
      0000D5C4A4FFEFE4D8FFEFE4D8FFEFE4D8FFEFE4D8FFEFE4D8FFEFE4D8FFD5C4
      A4FF000000000000000000000000000000000000000000000000E5A74FFFFFEE
      A1FFFAD96EFFE3A244FF00000000000000000000000000000000F4DFC8FFDD9B
      3FFFFFF2C8FFFBDB7BFFDD9430FF00000000DDD3D6FFBA998CFFFDECC4FFEDD4
      B0FFE5CAA8FFEFDBBFFFF2E3C4FFF2DEBCFFEABF93FFBB8E7DFFE6DEE1FF0000
      0000000000000000000000000000000000000000000000000000000000006865
      61FF9B9897FF5E5957FF2E2B28FF0000000000000000565150FF8C8B86FF3C38
      38FF454343FF0000000000000000000000000000000000000000000000000000
      0000DED0B8FFF5EDE4FFF5EDE4FFF5EDE4FFF5EDE4FFF5EDE4FFF5EDE4FFDED0
      B8FF000000000000000000000000000000000000000000000000E8AD52FFFFEE
      9DFFFCDA69FFE5A945FF0000000000000000000000000000000000000000F7E8
      D5FFE2A340FFFFF8D0FFE6AE54FF0000000000000000CDBEC4FFBE9A8DFFE6C7
      A5FFEFCBA3FFECC8A2FFE8BE94FFDCAA86FFBE9585FFDED5D7FF000000000000
      0000000000000000000000000000000000000000000000000000000000006C67
      66FFFFFFFFFFF3EDEBFFA29D9AFF0000000000000000AAA5A5FFFFFFFFFFF1EB
      E6FF686462FF0000000000000000000000000000000000000000000000000000
      0000E2D6C1FFF8F3EAFFF8F3EAFFF8F3EAFFF8F3EAFFF8F3EAFFF8F3EAFFE2D6
      C1FF000000000000000000000000000000000000000000000000EDB85BFFFFFF
      EAFFFFF9C1FFEBB553FF00000000000000000000000000000000000000000000
      0000FBF2E5FFE7A93EFFE8AC43FF000000000000000000000000E8E3E5FFC8B2
      B3FFB89B92FFC29F96FFBE9E95FFCBB8B6FFF0EDEEFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000006967
      64FFA5A2A0FF8A8683FF5E5956FF0000000000000000625E5CFF9B9896FF726E
      6EFF52504DFF0000000000000000000000000000000000000000000000000000
      0000E6DCCCFFEFE8DBFFEFE8DBFFEFE8DBFFEFE8DBFFEFE8DBFFEFE8DBFFE7DE
      CFFF000000000000000000000000000000000000000000000000EAAA34FFEEBF
      65FFEFBD60FFECB653FF00000000000000000000000000000000000000000000
      000000000000F8E8CFFFEDBA5EFF000000000000000000000000815A1DFFA282
      51FF917043FF917045FF917045FF917045FF917045FF917045FF917045FF9170
      44FF9D7B4AFF997544FF8C6632FF00000000C1761BFFC27519FFBD6B13FFB965
      04FFB96504FFB96504FFBA6504FFBA6504FFBA6504FFBA6504FFBA6504FFBA65
      04FFBA6504FFBC690AFFB96A15FFC3791FFF0000000000000000000000000000
      00000804ABFF0000C5FF0000C2FF0000C2FF0000C2FF0000C3FF0000C5FF0404
      A8FF000000000000000000000000000000000000000000000000000000000000
      0000B5B5DEFF6463C6FF1B18B4FF120DBAFF120DBAFF1B18B4FF6463C6FFB5B5
      DEFF000000000000000000000000000000000000000000000000A08052FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF987644FF00000000D5933DFFEFB736FFCDC6C0FFE9F8
      FFFFDBE5F6FFDBE8F8FFDBE8F8FFDBE8F9FFDBE8F8FFDAE7F8FFDBE7F8FFD8E4
      F5FFE9F6FFFFCDC6C0FFEAA714FFC0761DFF0000000000000000000000000701
      AFFF2826F7FF6464FCFF6464FCFF6464FCFF6464FCFF6464FCFF3E3AFCFF0000
      F6FF0000AEFF0000000000000000000000000000000000000000F6F6FBFF4745
      B8FF0F0BD5FF130FF4FF1611FFFF1611FFFF1611FFFF1611FFFF130FF4FF0F0B
      D5FF4745B8FFF6F6FBFF00000000000000000000000000000000A68556FFFFFF
      FFFFF5F4ECFFF3F1E8FFF3F1E9FFF3F1E9FFF2F0E7FFEFE8DEFFEEE9E0FFEFEB
      E2FFF6F3EDFFF0EBE2FF987137FF00000000CD9551FFE8AE3CFFDCD7D4FFECE8
      E9FFADA0A2FFA79B9EFF9E9395FF94898CFF8A8185FF83797CFF7B7276FF685F
      64FFECE8E9FFDCD7D4FFE59E20FFC77B25FF00000000000000000B05B5FF191E
      F7FFC5C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5C3FFFF6464
      FCFF0200F4FF0000B3FF000000000000000000000000F7F7FCFF211EB8FF1512
      F2FF1816FEFF1615F4FF1614EFFF1514EFFF1514EFFF1614EFFF1615F4FF1816
      FEFF1512F2FF211EB8FFF7F7FCFF000000000000000000000000AD9164FFFFFF
      FFFFF6F4EFFFF5F2EFFFF5F2EFFFF5F2EFFFF5F2EFFFF6F5EDFFF3F4E8FFF3F0
      EAFFFCFCF9FFEFE9E0FF7A5431FF00000000D09653FFEAB447FFDCD7D4FFEFF0
      EFFFDFDEDCFFE1E0DFFFE0DFDEFFDFE0DDFFE0DFDDFFDFDEDDFFDFE0DEFFDBD9
      D9FFEDEDEDFFDCD7D4FFE7A62BFFC9802BFF000000000F0ABCFF2833F7FF6A72
      FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5C3
      FFFF3336F7FF0D10F5FF0000BBFF00000000000000004C48C7FF1719F2FF1A1D
      F9FF181BF0FF181BF1FF181BF1FF181BF1FF181BF1FF181BF1FF181BF1FF181B
      F0FF1A1DF9FF1719F2FF4C48C7FF000000000000000000000000B39669FFFFFF
      FFFFF6F4EFFFF5F2EDFFF5F2EDFFF5F2EDFFF5F3EEFFF5F2EEFFF7F3EFFFF5F2
      EDFFFDFDFAFFEFE8E0FF7C5738FF00000000D49B58FFEBB950FFDCD7D4FFECE8
      E9FFA99D9FFFA4999EFF9A9194FF92888BFF897F85FF82797CFF7A7177FF655C
      62FFECE8E9FFDCD7D4FFE8AC37FFCC8531FF140FC3FF3344F8FF0B1CF5FFEDED
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF9396FFFF0B13F4FF141BF6FF0605C3FFB9B7EAFF1417DFFF1C26FBFF1A22
      F0FF1B22F1FF1B22F1FF1B22F1FF1B22F1FF1B22F1FF1B22F1FF1B22F1FF1B22
      F1FF1A22F0FF1C26FBFF1417DFFFB9B7EBFF0000000000000000B19667FFFFFF
      FFFFF6F4EFFFF5F2EDFFF5F2EDFFF5F2EDFFF7F6EFFFF6F1EEFFFCF6F4FFFAF3
      F2FFFEFBFDFFEFE9DFFF7D5837FF00000000D69E5BFFEDBD5AFFDCD7D4FFFFFF
      FFFFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFDCD7D4FFEAB340FFD08B34FF3638DCFF172FF7FF1026F4FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF8F96FFFF0B1BF3FF1723F6FF0A0CD9FF6764DCFF1E2AF5FF1827F5FF0512
      F0FF0412F0FF0412F0FF0412F0FF0412F0FF0412F0FF0412F0FF0412F0FF0412
      F0FF0512F0FF1827F5FF1E2AF5FF6A66DCFF0000000000000000B19666FFFFFF
      FFFFF6F4EFFFF5F2EDFFF4F1ECFFF4F0ECFFF9F3F2FFFBFAF0FFFBF9F5FFFBF4
      F3FFFCF7F3FFEFEAE3FF7D5939FF00000000D9A45EFFF0C263FFDCD7D4FFECE8
      E9FFA99D9FFFA4999EFF9A9194FF92888BFF897F85FF82797CFF7A7177FF655C
      62FFECE8E9FFDCD7D4FFEDB749FFD2903AFF3639DEFF1B38F7FF142FF4FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7683FDFFFFFF
      FFFFBBC3FFFF0F24F4FF1A2EF7FF0C10DBFF3230DBFF1328FBFF2125D0FF7573
      D9FF7171DAFF6F6FDAFF6F6FDAFF6F6FDAFF6F6FDAFF6F6FDAFF6F6FDAFF7171
      DAFF7573D9FF2225D0FF1930FCFF2725D6FF0000000000000000B0956DFFFFFF
      FFFFF7F4EDFFF4F1ECFFF6F2EDFFF9F2F2FFFAFAF4FFFBFDF6FFFCFAF9FFF4EF
      E7FFF5F1ECFFF0EAE2FF7E5B3AFF00000000D8A35CFFF0C66DFFDCD7D4FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFDCD7D4FFEEBD54FFD7963EFF3337E1FF1E3DF7FF1735F5FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6D80FBFFFFFF
      FFFFBBC3FFFF122AF4FF1A35F7FF0C12DEFF5757E6FF1937F7FF3E3FE1FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF4848E1FF0F2FF9FF1819D8FF0000000000000000B19E7CFFFFFF
      FFFFFCFEF8FFF9F9F0FFFBFAF9FFFAF9FCFFFBFCFBFFFAFAFCFFF3F1E9FFEAE5
      DDFFECE7E0FFE6D8CBFF81603AFF00000000DEAC69FFF9D281FFC1975CFF9A7B
      60FF95775EFF97795DFF97795DFF97795DFF97795DFF97795CFF97795CFF9577
      5EFF9A7A5EFFC19A64FFF7CA6BFFD99B44FF6D70EFFF425BFAFF2441F6FFFFFF
      FFFFFFFFFFFFFBFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6D80FBFFFFFF
      FFFFBBC3FFFF1732F5FF334FF8FF3F45E8FF5351EBFF5473F9FF5C5CEFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF4041ECFF092AF8FF1F20D5FF0000000000000000BDA787FFFFFF
      FFFFFDFEFCFFFAFBF8FFFAFAFCFFFAFBFEFFFCFBF9FFF5F2EAFFF0EEE7FFE9E2
      DAFFE6DDD4FFD6CBB4FF87663DFF00000000DDAB67FFF6D58BFFFFD056FFC0A8
      87FFC8C5C9FFCEC6BFFFCDC6C0FFCDC6C0FFCDC6BFFFD6D0CAFFD6D3D0FFCFCE
      D4FFC0A888FFFFD25DFFF3CC75FFDCA148FF6F73F1FF647CFDFF5E76FCFFFFFF
      FFFF93A1FFFFD7DCFFFF93A1FFFFFFFFFFFF8696FEFFFFFFFFFF6D80FBFFFDFE
      FFFFBBC3FFFF5B72FBFF6175FCFF5359EFFF5C57ECFF5A77F9FF6E71F7FFD8D6
      FDFFD4D6FBFFC4C3FBFFB3B4FAFFB3B5FBFFB4B5FBFFB4B5FBFFB4B5FBFFB6B7
      FBFFBEBCFCFF4347F7FF4460F1FF5C57DFFF0000000000000000C5B190FFFFFF
      FFFFFCFDFDFFFAF9F9FFFAFBFDFFFBFDFAFFF9F7F0FFF3EEE4FFDDD4C5FFD4BE
      ABFFD0BCA1FFBEA784FF88673EFF00000000DCA966FFF6D993FFFBC85DFFC2B4
      A2FFD7DEEBFFDDDDDDFFDCDDDEFFDCDBDDFFE7E8EAFFC8BAA7FFA29692FFC2B4
      A2FFC6BCA9FFFBCB63FFF3D07EFFE0A74CFF7176F4FF6880FDFF5E76FBFFFFFF
      FFFFB5C2FFFFE4E9FFFFACB8FFFFFFFFFFFFAAB6FFFFFFFFFFFF6D80FBFF8F96
      FFFF8F96FFFF6076FCFF6278FDFF535AF2FF8B83F2FF7084FAFF5B7DF7FF516E
      F6FF526EF6FF536EF6FF4E6AF5FF3E5CF4FF3756F4FF3755F4FF3757F4FF4160
      F4FF516CF7FF6283FCFF7287ECFF8982E9FF0000000000000000C7B596FFFFFF
      FFFFF8FDFDFFFAFBFBFFFBFDFAFFF6F7EBFFF3F1E9FFE3D9CAFFC9B493FFEBE3
      DCFFE1D9C6FFB79D73FF8C683EFF00000000E5B973FFF6DA97FFFBCC62FFC8BA
      A7FFDDE0E9FFE1DFDDFFE0DFDEFFDFDDDCFFEFF3F9FF9F886FFFE5AF47FF9E91
      89FFC7BDB2FFFDCF6AFFF5D484FFE3AC51FF5653EFFF97ABFFFF617CFBFFFFFF
      FFFFB5C2FFFFE3E8FFFFACBBFFFFFFFFFFFFA9B7FFFFFFFFFFFF6D80FBFF617B
      FBFF657CFCFF667DFCFF657DFCFF4F4CEFFFC8C5F8FF5E5DF4FF80A1FAFF5D7B
      F7FF6480F7FF6682F7FF6682F7FF6985F7FF6B87F7FF6B87F7FF6B87F7FF6884
      F7FF5E7CF7FF81A2FFFF5456D5FFC8C5F8FF0000000000000000C8B599FFFFFF
      FFFFFBFDFFFFFDFDFDFFF6F7F2FFEDE7E0FFEFE4DDFFD1BEA6FFCDB99AFFFFFF
      FFFFCFBBA1FF957D68FF504AE8FF00000000E9BC75FFF8DD9EFFFDCF69FFCEC0
      AFFFE3E7EFFFE7E5E3FFE6E5E4FFE5E4E2FFF1F6FFFFBAA386FFFFE873FFB5AB
      9EFFCAC0B8FFFFD26EFFF9DA8EFFE7B25BFF000000005451F2FF94A7FFFF5E7C
      FCFFB5C2FFFFE6EBFFFFAFBDFFFFFFFFFFFFAABAFFFFFFFFFFFF6D80FBFF657D
      FBFF6981FCFF6781FCFF4D49F2FF00000000000000007068F2FF7D86F8FF87A6
      FAFF617FF7FF6783F7FF6B85F7FF6A86F7FF6985F7FF6985F7FF6683F6FF617F
      F6FF89A7FFFF707ADEFF6D65E8FF000000000000000000000000C9B89BFFFFFF
      FFFFFCFFFFFFFCF8F3FFF4EBE5FFE5DFD7FFE3D6C6FFCDB696FFBCAA89FFD6C8
      B4FF927656FF000000000000000000000000EAC079FFF8E09BFFFBD165FFD3C4
      AFFFEAEEF6FFECEBE8FFECEBE9FFEBE9E6FFFBFFFFFFA28E78FFDEAF4FFFA89C
      95FFD1C7B9FFFFDA78FFF5D889FFE2A442FF00000000000000005350F4FF95AA
      FFFF5E7CFCFFF1F3FFFFB5C2FFFFFFFFFFFFAEBDFFFFFFFFFFFF7E96FFFF6983
      FBFF6C87FDFF4E4AF3FF000000000000000000000000F9F8FEFF4E41F1FF8087
      F6FF9DBCFBFF7F9FFBFF6D8BF8FF6D89F8FF6D89F8FF6D8BFAFF809FFCFFA0BE
      FDFF7984E3FF463DDBFFF9F8FEFF000000000000000000000000CBBDA2FFFFFF
      FFFFFFFFFFFFFAF7F6FFF0E8DFFFDFD7C7FFD8C6B1FFC1AA85FF9F824CFF9780
      68FF00000000000000000000000000000000ECC47EFFFEF4D5FFFFE290FFDCD7
      D4FFF5FFFFFFF6FEFFFFF6FEFFFFF6FDFFFFFFFFFFFFDFDDDCFFC8BAA7FFDFDD
      DCFFE5E4E2FFFFDE88FFE4AA45FFFBF4EBFF0000000000000000000000005552
      F6FF99ADFFFF7E96FFFF829AFFFF7E96FFFF7E96FFFF7E96FFFF7E96FFFF6D89
      FCFF4F4AF5FF0000000000000000000000000000000000000000F8F8FEFF6E66
      F4FF6160F1FF94A3F4FFA2B9F9FFA2BBFAFFA2BCFAFFA2B8F7FF92A2EFFF5C5B
      DFFF6B64EBFFF8F8FEFF00000000000000000000000000000000C3B292FFCEBC
      A3FFC4B3A0FFC1B09AFFC0AF99FFBDA78CFFBBA384FFAA9161FF8C6F5DFF0000
      000000000000000000000000000000000000ECC681FFF0CA82FFF4CA7DFFE8C7
      88FFEFCF94FFEBCF91FFEDCF92FFEED092FFEED093FFF2D396FFF7D79BFFF6D6
      9BFFE6C48AFFEBB552FFFDF8F1FF000000000000000000000000000000000000
      00005854F8FF7378FCFF7276FCFF6C72FCFF6F73FCFF6D73FCFF7578FDFF5B56
      FAFF000000000000000000000000000000000000000000000000000000000000
      0000C6C3FBFF857FF4FF5E59EEFF5A57EBFF5957EAFF5B56EAFF847DF0FFC6C3
      FAFF00000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF07CFFFC813EC37FC00C7FFC003E007
      FC00E3FFC003E007FC00E1FFC003C003E400F1FF0000C003F000F0FF00008001
      0000F87F000080010000E83F000080010000E01F000080010000E00F00008001
      F000F0078001C003E400F807C003C003FC00F81F00008001FC00FC0F00008001
      FC00FE0700008001FC00FF03C183C3C3FE7FFE7FDFC18001FC7FFE3FCFC18001
      F87FFE1FC7C18001F07FFE0FC1C18001E0000007C0C18001C0000003C0418001
      80000001C001800100000000C001800100000000C001800180000001C0018001
      C0000003C0418001E0000007C1C18001F07FFE0FC3C18001F87FFE1FC7C18001
      FC7FFE3FCFC18001FE7FFE7FDFC18001FFF80180F00FC3F9FFF001800000C3F1
      FFC001800000C3E1FF8101800000C3C1FF8301800000C381C00701800000C301
      800F00000000C201001F00000000C001001F00000000C001000F00000000C201
      000F00000000C301000F8001F00FC381001F8181F00FC3C1001FE187F00FC3E1
      803FE187F00FC3F1C07FE187F00FC3F9C0010000F00FF00FC0010000E007C003
      C0010000C0038001C001000080018001C001000000000000C001000000000000
      C001000000000000C001000000000000C001000000000000C001000000000000
      C001000000000000C001000000000000C001000080018001C0070000C0038001
      C00F0000E007C003C01F0001F00FF00F00000000000000000000000000000000
      000000000000}
  end
  object opdFindFile: TOpenTextFileDialog
    DefaultExt = '*.ini'
    InitialDir = '..'
    Options = [ofReadOnly, ofHideReadOnly, ofEnableSizing]
    Left = 344
    Top = 65530
  end
  object mniAtivaInativa: TPopupMenu
    Images = imlCadastro
    Left = 200
    object acDesableAll1: TMenuItem
      Action = acEnableAll
    end
    object Inativa1: TMenuItem
      Action = acDesableAll
    end
  end
end
