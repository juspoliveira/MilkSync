inherited VSSCLRotaSettings: TVSSCLRotaSettings
  Left = 373
  Top = 0
  ActiveControl = pgcConfig
  Caption = 'Configuracao das Contas'
  ClientHeight = 610
  ClientWidth = 584
  OldCreateOrder = True
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcMaster: TcxPageControl
    Top = 78
    Width = 584
    Height = 513
    ClientRectBottom = 513
    ClientRectRight = 584
    inherited tabsRegistro: TcxTabSheet
      object pgcConfig: TsPageControl
        Left = 0
        Top = 0
        Width = 584
        Height = 494
        ActivePage = tsMapas
        Align = alClient
        Style = tsFlatButtons
        TabOrder = 0
        SkinData.SkinSection = 'PAGECONTROL'
        object tsParametros: TsTabSheet
          Caption = 'Par'#226'metros'
          SkinData.CustomColor = False
          SkinData.CustomFont = False
          object sGroupBox2: TsGroupBox
            Left = 0
            Top = 0
            Width = 576
            Height = 153
            Align = alTop
            Caption = '| Contas |'
            TabOrder = 0
            SkinData.SkinSection = 'GROUPBOX'
            object cxLabel5: TLabel
              Left = 9
              Top = 36
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
              Left = 259
              Top = 80
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
              Left = 9
              Top = 80
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
              Left = 371
              Top = 80
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
              Left = 145
              Top = 80
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
              Left = 9
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
              Left = 8
              Top = 54
              DataBinding.DataField = 'HostURL'
              DataBinding.DataSource = dsMaster
              TabOrder = 1
              Width = 529
            end
            object edtIdErp: TcxDBTextEdit
              Left = 133
              Top = 96
              DataBinding.DataField = 'KeyId'
              DataBinding.DataSource = dsMaster
              TabOrder = 3
              Width = 121
            end
            object edtTempo: TcxDBSpinEdit
              Left = 265
              Top = 95
              DataBinding.DataField = 'Intervalo'
              DataBinding.DataSource = dsMaster
              TabOrder = 4
              Width = 74
            end
            object edtCad: TcxDBSpinEdit
              Left = 373
              Top = 96
              DataBinding.DataField = 'IntervaloCarga'
              DataBinding.DataSource = dsMaster
              TabOrder = 5
              Width = 74
            end
            object chkCargaMultiEmpresa: TcxDBCheckBox
              Left = 6
              Top = 120
              Caption = 'Carga Multi-Empresa'
              DataBinding.DataField = 'CargaMultiEmpresa'
              DataBinding.DataSource = dsMaster
              Properties.DisplayChecked = 'S'
              Properties.DisplayUnchecked = 'N'
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              TabOrder = 6
              Transparent = True
              Width = 121
            end
            object chkDropTable: TcxDBCheckBox
              Left = 135
              Top = 120
              Caption = 'Limpar Tabelas'
              DataBinding.DataField = 'DropTable'
              DataBinding.DataSource = dsMaster
              Properties.DisplayChecked = 'S'
              Properties.DisplayUnchecked = 'N'
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              TabOrder = 7
              Transparent = True
              Width = 121
            end
            object chkLog: TcxDBCheckBox
              Left = 263
              Top = 119
              Caption = 'Gravar Log'
              DataBinding.DataField = 'Log'
              DataBinding.DataSource = dsMaster
              Properties.DisplayChecked = 'S'
              Properties.DisplayUnchecked = 'N'
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              TabOrder = 8
              Transparent = True
              Width = 82
            end
            object cxDBCheckBox1: TcxDBCheckBox
              Left = 455
              Top = 118
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
              TabOrder = 9
              Transparent = True
              Width = 82
            end
            object edtConta: TcxDBTextEdit
              Left = 9
              Top = 95
              DataBinding.DataField = 'ContaId'
              DataBinding.DataSource = dsMaster
              TabOrder = 2
              Width = 121
            end
            object edtNomeEmpresa: TcxDBTextEdit
              Left = 66
              Top = 12
              DataBinding.DataField = 'NomeEmpresa'
              DataBinding.DataSource = dsMaster
              TabOrder = 0
              Width = 470
            end
          end
          object sGroupBox3: TsGroupBox
            Left = 0
            Top = 153
            Width = 576
            Height = 75
            Align = alTop
            Caption = '| Proxy |'
            TabOrder = 1
            SkinData.SkinSection = 'GROUPBOX'
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
          object sGroupBox4: TsGroupBox
            Left = 0
            Top = 228
            Width = 576
            Height = 74
            Align = alTop
            Caption = '| Formato Arquivos Sa'#237'da |'
            TabOrder = 2
            SkinData.SkinSection = 'GROUPBOX'
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
              TabOrder = 8
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
              TabOrder = 6
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
              TabOrder = 7
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
              TabOrder = 9
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
              TabOrder = 10
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
                end>
              TabOrder = 11
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
              TabOrder = 0
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
              TabOrder = 1
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
              TabOrder = 2
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
              TabOrder = 3
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
              TabOrder = 4
              Transparent = True
              Width = 57
            end
            object cxDBCheckBox7: TcxDBCheckBox
              Left = 488
              Top = 19
              Caption = 'SCL'
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
              TabOrder = 5
              Transparent = True
              Width = 50
            end
          end
          object sGroupBox5: TsGroupBox
            Left = 0
            Top = 302
            Width = 576
            Height = 52
            Align = alTop
            Caption = '| Atesto |'
            TabOrder = 3
            SkinData.SkinSection = 'GROUPBOX'
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
          object sGroupBox6: TsGroupBox
            Left = 0
            Top = 354
            Width = 576
            Height = 109
            Align = alClient
            Caption = '| Intervalos |'
            TabOrder = 4
            SkinData.SkinSection = 'GROUPBOX'
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
              TabOrder = 2
              Width = 119
            end
            object cxDBCheckBox2: TcxDBCheckBox
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
              TabOrder = 1
              Transparent = True
              Width = 107
            end
          end
        end
        object tsPathFile: TsTabSheet
          Caption = 'Arquivos'
          SkinData.CustomColor = False
          SkinData.CustomFont = False
          object sGroupBox7: TsGroupBox
            Left = 0
            Top = 0
            Width = 576
            Height = 350
            Align = alTop
            Caption = '| Destino Arquivos Sa'#237'da |'
            TabOrder = 0
            SkinData.SkinSection = 'GROUPBOX'
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
            object deDatasul: TJvDirectoryEdit
              Left = 14
              Top = 38
              Width = 513
              Height = 19
              DialogKind = dkWin32
              DialogText = 'Escolha o diret'#243'rio'
              Flat = True
              ParentFlat = False
              InitialDir = '\'
              ButtonFlat = True
              TabOrder = 0
            end
            object deRm: TJvDirectoryEdit
              Left = 14
              Top = 77
              Width = 513
              Height = 19
              DialogKind = dkWin32
              DialogText = 'Escolha o diret'#243'rio'
              Flat = True
              ParentFlat = False
              InitialDir = '\'
              ButtonFlat = True
              TabOrder = 1
            end
            object deMagis: TJvDirectoryEdit
              Left = 14
              Top = 117
              Width = 513
              Height = 19
              DialogKind = dkWin32
              DialogText = 'Escolha o diret'#243'rio'
              Flat = True
              ParentFlat = False
              InitialDir = '\'
              ButtonFlat = True
              TabOrder = 2
            end
            object deMeta: TJvDirectoryEdit
              Left = 14
              Top = 158
              Width = 513
              Height = 19
              DialogKind = dkWin32
              DialogText = 'Escolha o diret'#243'rio'
              Flat = True
              ParentFlat = False
              InitialDir = '\'
              ButtonFlat = True
              TabOrder = 3
            end
            object deScl: TJvDirectoryEdit
              Left = 14
              Top = 245
              Width = 513
              Height = 19
              DialogKind = dkWin32
              DialogText = 'Escolha o diret'#243'rio'
              Flat = True
              ParentFlat = False
              InitialDir = '\'
              ButtonFlat = True
              TabOrder = 5
            end
            object deSiga: TJvDirectoryEdit
              Left = 14
              Top = 202
              Width = 513
              Height = 19
              DialogKind = dkWin32
              DialogText = 'Escolha o diret'#243'rio'
              Flat = True
              ParentFlat = False
              InitialDir = '\'
              ButtonFlat = True
              TabOrder = 4
            end
            object dePathDescarga: TJvDirectoryEdit
              Left = 13
              Top = 290
              Width = 513
              Height = 19
              DialogKind = dkWin32
              DialogText = 'Escolha o diret'#243'rio'
              Flat = True
              ParentFlat = False
              InitialDir = '\'
              ButtonFlat = True
              TabOrder = 6
            end
          end
          object sGroupBox8: TsGroupBox
            Left = 0
            Top = 350
            Width = 576
            Height = 113
            Align = alClient
            Caption = '| Diret'#243'rio Arquivos Carga |'
            TabOrder = 1
            SkinData.SkinSection = 'GROUPBOX'
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
            object deBaseCarga: TJvDirectoryEdit
              Left = 11
              Top = 36
              Width = 513
              Height = 19
              DialogKind = dkWin32
              DialogText = 'Escolha o diret'#243'rio'
              Flat = True
              ParentFlat = False
              InitialDir = '\'
              ButtonFlat = True
              TabOrder = 0
            end
            object deRetornoApi: TJvDirectoryEdit
              Left = 11
              Top = 74
              Width = 513
              Height = 19
              DialogKind = dkWin32
              DialogText = 'Escolha o diret'#243'rio'
              Flat = True
              ParentFlat = False
              InitialDir = '\'
              ButtonFlat = True
              TabOrder = 1
            end
          end
        end
        object tsMapas: TsTabSheet
          Caption = 'Mapas Importa'#231#227'o (Carga)'
          SkinData.CustomColor = False
          SkinData.CustomFont = False
          object pgcLigacao: TsPageControl
            Left = 0
            Top = 52
            Width = 576
            Height = 378
            ActivePage = sTabSheet7
            Align = alClient
            Style = tsButtons
            TabOrder = 1
            SkinData.SkinSection = 'PAGECONTROL'
            object sTabSheet7: TsTabSheet
              Caption = 'Pg.01'
              SkinData.CustomColor = False
              SkinData.CustomFont = False
              object sGroupBox10: TsGroupBox
                Left = 0
                Top = 0
                Width = 568
                Height = 347
                Align = alClient
                Caption = '| Mapas Associadados |'
                TabOrder = 0
                SkinData.SkinSection = 'GROUPBOX'
                object lbl22: TLabel
                  Left = 6
                  Top = 173
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
                object lbl23: TLabel
                  Left = 6
                  Top = 236
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
                object lbl9: TLabel
                  Left = 6
                  Top = 111
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
                object lbl10: TLabel
                  Left = 6
                  Top = 49
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
                object lbl15: TLabel
                  Left = 6
                  Top = 142
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
                object lbl16: TLabel
                  Left = 6
                  Top = 205
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
                object lbl18: TLabel
                  Left = 6
                  Top = 80
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
                object lbl19: TLabel
                  Left = 5
                  Top = 267
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
                object feAnalises: TJvFilenameEdit
                  Left = 6
                  Top = 32
                  Width = 533
                  Height = 19
                  Flat = True
                  ParentFlat = False
                  Filter = '*.ini|*.ini'
                  InitialDir = 'mapas'
                  TabOrder = 0
                end
                object feColetores: TJvFilenameEdit
                  Left = 6
                  Top = 62
                  Width = 533
                  Height = 19
                  Flat = True
                  ParentFlat = False
                  Filter = '*.ini|*.ini'
                  InitialDir = 'mapas'
                  TabOrder = 1
                end
                object feExtratos: TJvFilenameEdit
                  Left = 6
                  Top = 93
                  Width = 533
                  Height = 19
                  Flat = True
                  ParentFlat = False
                  Filter = '*.ini|*.ini'
                  InitialDir = 'mapas'
                  TabOrder = 2
                end
                object feFazendas: TJvFilenameEdit
                  Left = 6
                  Top = 124
                  Width = 533
                  Height = 19
                  Flat = True
                  ParentFlat = False
                  Filter = '*.ini|*.ini'
                  InitialDir = 'mapas'
                  TabOrder = 3
                end
                object feItinerarios: TJvFilenameEdit
                  Left = 6
                  Top = 155
                  Width = 533
                  Height = 19
                  Flat = True
                  ParentFlat = False
                  Filter = '*.ini|*.ini'
                  InitialDir = 'mapas'
                  TabOrder = 4
                end
                object feLinhas: TJvFilenameEdit
                  Left = 6
                  Top = 188
                  Width = 533
                  Height = 19
                  Flat = True
                  ParentFlat = False
                  Filter = '*.ini|*.ini'
                  InitialDir = 'mapas'
                  TabOrder = 5
                end
                object feMotivos: TJvFilenameEdit
                  Left = 6
                  Top = 218
                  Width = 533
                  Height = 19
                  Flat = True
                  ParentFlat = False
                  Filter = '*.ini|*.ini'
                  InitialDir = 'mapas'
                  TabOrder = 6
                end
                object feProdutores: TJvFilenameEdit
                  Left = 6
                  Top = 248
                  Width = 533
                  Height = 19
                  Flat = True
                  ParentFlat = False
                  Filter = '*.ini|*.ini'
                  InitialDir = 'mapas'
                  TabOrder = 7
                end
                object feGrupoRotas: TJvFilenameEdit
                  Left = 7
                  Top = 281
                  Width = 533
                  Height = 19
                  Flat = True
                  ParentFlat = False
                  Filter = '*.ini|*.ini'
                  InitialDir = 'mapas'
                  TabOrder = 8
                end
              end
            end
            object tsPage2: TsTabSheet
              Caption = 'Pg.02'
              SkinData.CustomColor = False
              SkinData.CustomFont = False
              object sGroupBox9: TsGroupBox
                Left = 0
                Top = 0
                Width = 568
                Height = 347
                Align = alClient
                TabOrder = 0
                SkinData.SkinSection = 'GROUPBOX'
                object lbl20: TLabel
                  Left = 6
                  Top = 97
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
                  Left = 6
                  Top = 137
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
                object lbl11: TLabel
                  Left = 6
                  Top = 59
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
                object lbl13: TLabel
                  Left = 7
                  Top = 19
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
                object lbl21: TLabel
                  Left = 11
                  Top = 174
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
                  Top = 209
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
                object feVeiculos: TJvFilenameEdit
                  Left = 6
                  Top = 116
                  Width = 535
                  Height = 19
                  Flat = True
                  ParentFlat = False
                  Filter = '*.ini|*.ini'
                  InitialDir = 'mapas'
                  TabOrder = 2
                end
                object feNfc: TJvFilenameEdit
                  Left = 6
                  Top = 152
                  Width = 535
                  Height = 19
                  Flat = True
                  ParentFlat = False
                  Filter = '*.ini|*.ini'
                  InitialDir = 'mapas'
                  TabOrder = 3
                end
                object feVinculados: TJvFilenameEdit
                  Left = 6
                  Top = 75
                  Width = 535
                  Height = 19
                  Flat = True
                  ParentFlat = False
                  Filter = '*.ini|*.ini'
                  InitialDir = 'mapas'
                  TabOrder = 1
                end
                object feTanques: TJvFilenameEdit
                  Left = 6
                  Top = 35
                  Width = 535
                  Height = 19
                  Flat = True
                  ParentFlat = False
                  Filter = '*.ini|*.ini'
                  InitialDir = 'mapas'
                  TabOrder = 0
                end
                object feRotas: TJvFilenameEdit
                  Left = 7
                  Top = 188
                  Width = 533
                  Height = 19
                  Flat = True
                  ParentFlat = False
                  Filter = '*.ini|*.ini'
                  InitialDir = 'mapas'
                  TabOrder = 4
                end
                object feTecnicos: TJvFilenameEdit
                  Left = 7
                  Top = 224
                  Width = 533
                  Height = 19
                  Flat = True
                  ParentFlat = False
                  Filter = '*.ini|*.ini'
                  InitialDir = 'mapas'
                  TabOrder = 5
                end
              end
            end
            object tsRegLog: TsTabSheet
              Caption = 'Log'
              SkinData.CustomColor = False
              SkinData.CustomFont = False
              object memLog: TsMemo
                Left = 0
                Top = 0
                Width = 568
                Height = 347
                Align = alClient
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                ScrollBars = ssBoth
                TabOrder = 0
                BoundLabel.Indent = 0
                BoundLabel.Font.Charset = DEFAULT_CHARSET
                BoundLabel.Font.Color = clWindowText
                BoundLabel.Font.Height = -11
                BoundLabel.Font.Name = 'MS Sans Serif'
                BoundLabel.Font.Style = []
                BoundLabel.Layout = sclLeft
                BoundLabel.MaxWidth = 0
                BoundLabel.UseSkinColor = True
                SkinData.SkinSection = 'EDIT'
              end
            end
          end
          object sPanel1: TsPanel
            Left = 0
            Top = 430
            Width = 576
            Height = 33
            Align = alBottom
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            SkinData.SkinSection = 'PANEL'
            object btnSalvarAssoc: TsSpeedButton
              Left = 13
              Top = 3
              Width = 76
              Height = 24
              Hint = 'Salva Mapas da conta ativa'
              Caption = '&Salvar'
              Flat = True
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000C1761BFFC275
                19FFBD6B13FFB96504FFB96504FFB96504FFBA6504FFBA6504FFBA6504FFBA65
                04FFBA6504FFBA6504FFBA6504FFBC690AFFB96A15FFC3791FFFD5933DFFEFB7
                36FFCDC6C0FFE9F8FFFFDBE5F6FFDBE8F8FFDBE8F8FFDBE8F9FFDBE8F8FFDAE7
                F8FFDBE7F8FFD8E4F5FFE9F6FFFFCDC6C0FFEAA714FFC0761DFFCD9551FFE8AE
                3CFFDCD7D4FFECE8E9FFADA0A2FFA79B9EFF9E9395FF94898CFF8A8185FF8379
                7CFF7B7276FF685F64FFECE8E9FFDCD7D4FFE59E20FFC77B25FFD09653FFEAB4
                47FFDCD7D4FFEFF0EFFFDFDEDCFFE1E0DFFFE0DFDEFFDFE0DDFFE0DFDDFFDFDE
                DDFFDFE0DEFFDBD9D9FFEDEDEDFFDCD7D4FFE7A62BFFC9802BFFD49B58FFEBB9
                50FFDCD7D4FFECE8E9FFA99D9FFFA4999EFF9A9194FF92888BFF897F85FF8279
                7CFF7A7177FF655C62FFECE8E9FFDCD7D4FFE8AC37FFCC8531FFD69E5BFFEDBD
                5AFFDCD7D4FFFFFFFFFFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFDCD7D4FFEAB340FFD08B34FFD9A45EFFF0C2
                63FFDCD7D4FFECE8E9FFA99D9FFFA4999EFF9A9194FF92888BFF897F85FF8279
                7CFF7A7177FF655C62FFECE8E9FFDCD7D4FFEDB749FFD2903AFFD8A35CFFF0C6
                6DFFDCD7D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFDCD7D4FFEEBD54FFD7963EFFDEAC69FFF9D2
                81FFC1975CFF9A7B60FF95775EFF97795DFF97795DFF97795DFF97795DFF9779
                5CFF97795CFF95775EFF9A7A5EFFC19A64FFF7CA6BFFD99B44FFDDAB67FFF6D5
                8BFFFFD056FFC0A887FFC8C5C9FFCEC6BFFFCDC6C0FFCDC6C0FFCDC6BFFFD6D0
                CAFFD6D3D0FFCFCED4FFC0A888FFFFD25DFFF3CC75FFDCA148FFDCA966FFF6D9
                93FFFBC85DFFC2B4A2FFD7DEEBFFDDDDDDFFDCDDDEFFDCDBDDFFE7E8EAFFC8BA
                A7FFA29692FFC2B4A2FFC6BCA9FFFBCB63FFF3D07EFFE0A74CFFE5B973FFF6DA
                97FFFBCC62FFC8BAA7FFDDE0E9FFE1DFDDFFE0DFDEFFDFDDDCFFEFF3F9FF9F88
                6FFFE5AF47FF9E9189FFC7BDB2FFFDCF6AFFF5D484FFE3AC51FFE9BC75FFF8DD
                9EFFFDCF69FFCEC0AFFFE3E7EFFFE7E5E3FFE6E5E4FFE5E4E2FFF1F6FFFFBAA3
                86FFFFE873FFB5AB9EFFCAC0B8FFFFD26EFFF9DA8EFFE7B25BFFEAC079FFF8E0
                9BFFFBD165FFD3C4AFFFEAEEF6FFECEBE8FFECEBE9FFEBE9E6FFFBFFFFFFA28E
                78FFDEAF4FFFA89C95FFD1C7B9FFFFDA78FFF5D889FFE2A442FFECC47EFFFEF4
                D5FFFFE290FFDCD7D4FFF5FFFFFFF6FEFFFFF6FEFFFFF6FDFFFFFFFFFFFFDFDD
                DCFFC8BAA7FFDFDDDCFFE5E4E2FFFFDE88FFE4AA45FFDD973419ECC681FFF0CA
                82FFF4CA7DFFE8C788FFEFCF94FFEED192F1EDCF92FFEED092FFEED093FFF2D3
                96FFF7D79BFFF6D69BFFE6C48AFFEBB552FFE19E351100000000}
              OnClick = btnSalvarAssocClick
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
            object btnExportar: TsSpeedButton
              Left = 459
              Top = 3
              Width = 76
              Height = 24
              Hint = 'Envia dados para servdor WEB'
              Caption = 'Exportar'
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000000000000000
                00000000000000000000A84E0941B05A0A9AC27C21EAC47D1FFFC47D1FFFC47D
                1FEAB059089AA8510B4100000000000000000000000000000000000000000000
                000000000000AF4F00C2E2AF3DFFE69B00FFF5D373FFDE8300FFDD8000FFF5CE
                6DFFE08F00FFE0A42AFFAD4D00C2000000000000000000000000000000000000
                0000BC6100F1F0BE45FFF1CA5AFFE3A436FFEED1ACFFE5A749FFE1A54BFFEDD0
                A9FFE19A3BFFEFC14AFFE8B028FFB55000F1000000000000000000000000C274
                13C2F2C443FFF6E5D3FFEECC92FFF6EAD2FFEBC46FFFE8B753FFE8B550FFEABE
                65FFF7EDD3FFEBC368FFF5E7CCFFE6A316FFB75700C200000000B95F083EEED3
                A3FFF8EBE1FFEBC672FFE19100FFF5DEB7FFE39700FFE29400FFE18E00FFE090
                00FFF5DEB1FFD87900FFE6B954FFF9ECD8FFE4B762FFB75E0F3ECB893D9CF7D1
                69FFEDBF5AFFEFC77DFFE6A103FFF7E6C8FFEBBC58FFEBBA53FFEABB4DFFEAB7
                47FFF7E4BDFFE18D00FFE9B95EFFE5A63BFFEBAD1CFFC778259CDAA757EAF8D9
                90FFF4E5D8FFF7E9CDFFF6DDAAFFF9EDD8FFF5E2BCFFF7EBD5FFF6EBD5FFF6E3
                C1FFF9E9D3FFF3DB9DFFF4E3C1FFF5E5CBFFF5D068FFCF8831EADAA757FFF6D2
                7CFFF4D699FFEEC45FFFEBA810FFF9EFDFFFEAB535FFEBAF28FFEAAC23FFE9AC
                26FFF9EDDCFFE29400FFE8B03AFFEDC66CFFECB73BFFCF8831FFDAA757FFF9D7
                83FFF6DCA6FFF4CE73FFEFB82DFFF9F2E5FFEEC152FFF0BE49FFEFB944FFECBA
                41FFFCF1DFFFE8A402FFECB84CFFEFCA7EFFECBB44FFCF8831FFE5B873EAFFF5
                D8FFF7EFE7FFF8ECDDFFF8E8C4FFF8F3E9FFF5D38DFFF4D58DFFF3D289FFF0CE
                7DFFFBF2E6FFF7E5BBFFF9EAD3FFF7E9DDFFF7E2A4FFDD9D42EADCA4549CFEF0
                BBFFF9DE99FFF8E4B2FFF8CF64FFF9F1E2FFF9F3E6FFFAFAF6FFFBFBF5FFFBF4
                E9FFF9EDDAFFEEBC3BFFF3D293FFF0C973FFF4CE6BFFD795389CD387163EF8EC
                D8FFFEFBFBFFF9E4B4FFF8D161FFFAF3DCFFF5D16AFFF5CD5BFFF4CA55FFF4C9
                58FFF8EFD4FFF2C342FFF5D89FFFFAF2ECFFF1D4A9FFD4891C3E00000000E3A8
                43C2FDF5D6FFFBF9FDFFF9E7C5FFFAF4E6FFFAECC8FFF9E7B6FFF9E6B7FFF9E9
                C5FFF9F0E5FFF8E7C7FFFBF3F6FFFAE39DFFDD961FC200000000000000000000
                0000EABD5CF1FEFBF0FFFAEBC7FFFADF9DFFFBF3E4FFF9E1A6FFF9E3A6FFFAED
                DFFFF9DF98FFF9E8C3FFFBEDC9FFE9B951F10000000000000000000000000000
                000000000000E8AE46C2F3E0BAFFFCEDB7FFFBF5E6FFFBE5A5FFFBE5A5FFFDF1
                DDFFFBE5A5FFF5E1B8FFE7AE49C2000000000000000000000000000000000000
                00000000000000000000E7AD4241F0D0907BF0D193EAEDBF5AFFEDBF5AFFF0D0
                90EAF0D0909AE7AE424100000000000000000000000000000000}
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
          end
          object rgCtaAtiva: TsRadioGroup
            Left = 0
            Top = 0
            Width = 576
            Height = 52
            Align = alTop
            Caption = '| Ative Uma Conta |'
            ParentBackground = False
            TabOrder = 0
            SkinData.SkinSection = 'GROUPBOX'
            Columns = 6
          end
        end
      end
    end
    inherited tabsGrid: TcxTabSheet
      inherited grdMaster: TcxGrid
        Width = 584
        Height = 482
        inherited grdMasterView: TcxGridDBTableView
          DataController.Filter.AutoDataSetFilter = False
          DataController.KeyFieldNames = 'ContaId'
          object grdMasterViewContaId: TcxGridDBColumn
            DataBinding.FieldName = 'ContaId'
            Width = 78
          end
          object grdMasterViewNomeEmpresa: TcxGridDBColumn
            DataBinding.FieldName = 'NomeEmpresa'
          end
          object grdMasterViewKeyId: TcxGridDBColumn
            DataBinding.FieldName = 'KeyId'
          end
          object grdMasterViewAtiva: TcxGridDBColumn
            DataBinding.FieldName = 'Ativa'
          end
          object grdMasterViewDatUltLeituraDescargaWS: TcxGridDBColumn
            DataBinding.FieldName = 'DatUltLeituraDescargaWS'
          end
          object grdMasterViewPathArqDescarga: TcxGridDBColumn
            DataBinding.FieldName = 'PathArqDescarga'
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
          object grdMasterViewEnviarNotifAtesto: TcxGridDBColumn
            DataBinding.FieldName = 'EnviarNotifAtesto'
          end
          object grdMasterViewDatIniLeituraDescargaWS: TcxGridDBColumn
            DataBinding.FieldName = 'DatIniLeituraDescargaWS'
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
            Visible = False
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
        end
      end
    end
  end
  inherited stsbManutencao: TStatusBar
    Top = 591
    Width = 584
  end
  inherited pnlCabecalho: TJvGradientHeaderPanel
    Width = 584
  end
  inherited tbMaster: TJvToolBar
    Width = 584
    Height = 46
  end
end
