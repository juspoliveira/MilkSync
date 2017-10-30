object VSDialogosFRM: TVSDialogosFRM
  Left = 369
  Top = 104
  Width = 578
  Height = 616
  Caption = 'Informa'#231#245'es'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 553
    Width = 570
    Height = 36
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 0
    object btnOk: TcxButton
      Left = 199
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
    end
    object btnCancelar: TcxButton
      Left = 295
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 1
      LookAndFeel.Kind = lfOffice11
    end
  end
  object pgcDialogos: TcxPageControl
    Left = 0
    Top = 0
    Width = 570
    Height = 553
    ActivePage = tbsConfig
    Align = alClient
    Color = clBtnFace
    ParentColor = False
    Style = 3
    TabOrder = 1
    ClientRectBottom = 553
    ClientRectRight = 570
    ClientRectTop = 23
    object tbsAut: TcxTabSheet
      Caption = 'Login'
      ImageIndex = 0
      object pnlTitulo: TJvGradientHeaderPanel
        Left = 0
        Top = 0
        Width = 570
        Height = 35
        GradientStyle = grVertical
        LabelCaption = 'Credenciais'
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWhite
        LabelFont.Height = -13
        LabelFont.Name = 'Verdana'
        LabelFont.Style = [fsBold]
        LabelAlignment = taLeftJustify
        Align = alTop
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        TabOrder = 0
      end
      object cxGroupBox5: TcxGroupBox
        Left = 0
        Top = 35
        Align = alTop
        Caption = '| Autoriza'#231#227'o |'
        TabOrder = 1
        Height = 101
        Width = 570
        object edtSenha: TcxTextEdit
          Left = 55
          Top = 63
          Properties.EchoMode = eemPassword
          TabOrder = 1
          Width = 170
        end
        object cxLabel1: TcxLabel
          Left = 14
          Top = 63
          Caption = 'Senha'
        end
        object edtUsu: TcxTextEdit
          Left = 55
          Top = 27
          StyleDisabled.TextColor = clWindowText
          TabOrder = 0
          Width = 216
        end
        object cxLabel2: TcxLabel
          Left = 9
          Top = 27
          Caption = 'Usu'#225'rio'
        end
      end
      object cxGroupBox6: TcxGroupBox
        Left = 0
        Top = 136
        Align = alClient
        TabOrder = 2
        Height = 394
        Width = 570
      end
    end
    object tbsConfig: TcxTabSheet
      Caption = 'Par'#226'metros'
      ImageIndex = 2
      object JvGradientHeaderPanel1: TJvGradientHeaderPanel
        Left = 0
        Top = 0
        Width = 570
        Height = 33
        GradientStyle = grVertical
        LabelCaption = 'Configura'#231#245'es'
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWhite
        LabelFont.Height = -13
        LabelFont.Name = 'Verdana'
        LabelFont.Style = [fsBold]
        LabelAlignment = taLeftJustify
        Align = alTop
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        TabOrder = 0
      end
      object pgcConfig: TPageControl
        Left = 0
        Top = 33
        Width = 570
        Height = 497
        ActivePage = tsParametros
        Align = alClient
        Style = tsFlatButtons
        TabOrder = 1
        object tsParametros: TTabSheet
          Caption = 'Par'#226'metros'
          object cxGroupBox3: TcxGroupBox
            Left = 0
            Top = 0
            Align = alTop
            Caption = '| Credenciais |'
            TabOrder = 0
            Height = 110
            Width = 562
            object cxLabel5: TcxLabel
              Left = 9
              Top = 18
              Caption = 'URL Host'
            end
            object cxLabel10: TcxLabel
              Left = 9
              Top = 72
              Caption = 'Temporizador'
            end
            object edtServidor: TcxTextEdit
              Left = 81
              Top = 17
              StyleDisabled.TextColor = clWindowText
              TabOrder = 2
              Width = 436
            end
            object chxLog: TcxCheckBox
              Left = 246
              Top = 71
              Caption = 'Log'
              Properties.Alignment = taRightJustify
              TabOrder = 3
              Width = 48
            end
            object edtTempo: TcxSpinEdit
              Left = 82
              Top = 70
              Properties.AssignedValues.MaxValue = True
              Properties.AssignedValues.MinValue = True
              Properties.EditFormat = '# min.'
              TabOrder = 4
              Width = 57
            end
            object chxUsarProxy: TcxCheckBox
              Left = 146
              Top = 71
              Caption = 'Usar Proxy'
              Properties.Alignment = taRightJustify
              TabOrder = 5
              Width = 81
            end
            object edtConta1: TcxTextEdit
              Left = 81
              Top = 42
              StyleDisabled.TextColor = clWindowText
              TabOrder = 6
              Width = 67
            end
            object cxLabel9: TcxLabel
              Left = 9
              Top = 44
              Caption = 'Id Contas '
            end
            object edtConta2: TcxTextEdit
              Left = 155
              Top = 42
              StyleDisabled.TextColor = clWindowText
              TabOrder = 8
              Width = 67
            end
            object edtConta3: TcxTextEdit
              Left = 225
              Top = 42
              StyleDisabled.TextColor = clWindowText
              TabOrder = 9
              Width = 67
            end
            object edtConta4: TcxTextEdit
              Left = 297
              Top = 42
              StyleDisabled.TextColor = clWindowText
              TabOrder = 10
              Width = 67
            end
            object edtConta5: TcxTextEdit
              Left = 371
              Top = 42
              StyleDisabled.TextColor = clWindowText
              TabOrder = 11
              Width = 67
            end
            object edtConta6: TcxTextEdit
              Left = 449
              Top = 42
              StyleDisabled.TextColor = clWindowText
              TabOrder = 12
              Width = 67
            end
          end
          object cxgrpbx1: TcxGroupBox
            Left = 0
            Top = 110
            Align = alTop
            Caption = '| Proxy |'
            TabOrder = 1
            Height = 129
            Width = 562
            object cxLabel4: TcxLabel
              Left = 23
              Top = 18
              Caption = 'URL'
            end
            object edtProxyPorta: TcxTextEdit
              Left = 56
              Top = 42
              StyleDisabled.TextColor = clWindowText
              TabOrder = 1
              Width = 161
            end
            object cxLabel6: TcxLabel
              Left = 6
              Top = 69
              Caption = 'Usu'#225'rio'
            end
            object edtProxyUsu: TcxTextEdit
              Left = 56
              Top = 68
              StyleDisabled.TextColor = clWindowText
              TabOrder = 2
              Width = 161
            end
            object cxLabel7: TcxLabel
              Left = 16
              Top = 44
              Caption = 'Porta'
            end
            object edtProxySenha: TcxTextEdit
              Left = 56
              Top = 94
              StyleDisabled.TextColor = clWindowText
              TabOrder = 3
              Width = 161
            end
            object cxLabel8: TcxLabel
              Left = 12
              Top = 95
              Caption = 'Senha'
              Transparent = True
            end
            object edtProxyUrl: TcxTextEdit
              Left = 56
              Top = 16
              StyleDisabled.TextColor = clWindowText
              TabOrder = 0
              Width = 257
            end
          end
          object cxGroupBox4: TcxGroupBox
            Left = 0
            Top = 239
            Align = alTop
            Caption = '| Arquivos  Sa'#237'da |'
            TabOrder = 2
            Height = 83
            Width = 562
            object ckbDatasul: TcxCheckBox
              Left = 6
              Top = 15
              Caption = 'TOTVS (Datasul)'
              Properties.DisplayChecked = 'S'
              Properties.DisplayUnchecked = 'N'
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              State = cbsChecked
              TabOrder = 0
              Width = 107
            end
            object ckbRM: TcxCheckBox
              Left = 111
              Top = 15
              Caption = 'TOTVS (RM)'
              Properties.DisplayChecked = 'S'
              Properties.DisplayUnchecked = 'N'
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              State = cbsGrayed
              TabOrder = 1
              Width = 81
            end
            object ckbMagis: TcxCheckBox
              Left = 196
              Top = 15
              Caption = 'MAGISTECH'
              Properties.DisplayChecked = 'S'
              Properties.DisplayUnchecked = 'N'
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              State = cbsGrayed
              TabOrder = 2
              Width = 89
            end
            object ckbMeta: TcxCheckBox
              Left = 290
              Top = 15
              Caption = 'WEBMETA'
              Properties.DisplayChecked = 'S'
              Properties.DisplayUnchecked = 'N'
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              State = cbsGrayed
              TabOrder = 3
              Width = 79
            end
            object ckbSiga: TcxCheckBox
              Left = 390
              Top = 15
              Caption = 'SIGA'
              Properties.DisplayChecked = 'S'
              Properties.DisplayUnchecked = 'N'
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              State = cbsGrayed
              TabOrder = 4
              Width = 47
            end
            object cbxMagis: TcxImageComboBox
              Left = 198
              Top = 46
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
              Properties.OnInitPopup = cbxMagisPropertiesInitPopup
              TabOrder = 5
              Width = 86
            end
            object cbxDatasul: TcxImageComboBox
              Left = 9
              Top = 47
              Properties.ClearKey = 46
              Properties.ImmediatePost = True
              Properties.Items = <
                item
                  Description = '1.0'
                  ImageIndex = 0
                  Value = '1'
                end>
              Properties.OnInitPopup = cbxDatasulPropertiesInitPopup
              TabOrder = 6
              Width = 91
            end
            object cbxRm: TcxImageComboBox
              Left = 112
              Top = 47
              Properties.ClearKey = 46
              Properties.ImmediatePost = True
              Properties.Items = <>
              Properties.OnInitPopup = cbxRmPropertiesInitPopup
              TabOrder = 7
              Width = 79
            end
            object cbxMeta: TcxImageComboBox
              Left = 291
              Top = 45
              Properties.ClearKey = 46
              Properties.ImmediatePost = True
              Properties.Items = <
                item
                  Description = '1.0'
                  ImageIndex = 0
                  Value = '1'
                end>
              Properties.OnInitPopup = cbxMetaPropertiesInitPopup
              TabOrder = 8
              Width = 95
            end
            object cbxSiga: TcxImageComboBox
              Left = 393
              Top = 44
              Properties.ClearKey = 46
              Properties.ImmediatePost = True
              Properties.Items = <
                item
                  Description = '1.0'
                  ImageIndex = 0
                  Value = '1'
                end>
              Properties.OnInitPopup = cbxSigaPropertiesInitPopup
              TabOrder = 9
              Width = 76
            end
            object cbxScl: TcxImageComboBox
              Left = 477
              Top = 43
              Properties.ClearKey = 46
              Properties.ImmediatePost = True
              Properties.Items = <
                item
                  Description = '1.0'
                  ImageIndex = 0
                  Value = '1'
                end>
              Properties.OnInitPopup = cbxSclPropertiesInitPopup
              TabOrder = 10
              Width = 74
            end
            object ckbScl: TcxCheckBox
              Left = 475
              Top = 15
              Caption = 'SCL'
              Properties.DisplayChecked = 'S'
              Properties.DisplayUnchecked = 'N'
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              State = cbsGrayed
              TabOrder = 11
              Width = 47
            end
          end
          object cxGroupBox2: TcxGroupBox
            Left = 0
            Top = 322
            Align = alTop
            Caption = '| Atesto |'
            TabOrder = 3
            Height = 43
            Width = 562
            object edtDifAtesto: TcxTextEdit
              Left = 66
              Top = 14
              StyleDisabled.TextColor = clWindowText
              TabOrder = 0
              Width = 77
            end
            object cxLabel11: TcxLabel
              Left = 7
              Top = 15
              Caption = 'Percentual'
            end
            object chxEnviarNota: TcxCheckBox
              Left = 151
              Top = 14
              Caption = 'Enviar Notifica'#231#227'o'
              Properties.Alignment = taRightJustify
              TabOrder = 2
              Width = 111
            end
          end
          object cxGroupBox1: TcxGroupBox
            Left = 0
            Top = 365
            Align = alClient
            Caption = '| Leitura Descargas |'
            TabOrder = 4
            Height = 101
            Width = 562
            object lbl6: TLabel
              Left = 8
              Top = 58
              Width = 505
              Height = 31
              AutoSize = False
              Caption = 
                'Aten'#231#227'o. Os arquivos exportados anteriormente ser'#227'o regerados. I' +
                'sto pode afetar  o controle de estoque do seu ERP.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              WordWrap = True
            end
            object edtIniLeitura: TcxDateEdit
              Left = 84
              Top = 20
              Properties.ClearKey = 46
              Properties.SaveTime = False
              Properties.ShowTime = False
              StyleDisabled.TextColor = clWindowText
              TabOrder = 0
              Width = 109
            end
            object cxLabel3: TcxLabel
              Left = 17
              Top = 22
              Caption = 'Data Inicial'
            end
            object cxLabel14: TcxLabel
              Left = 201
              Top = 22
              Caption = #218'ltima Leitura'
            end
            object edtUltLeitura: TcxDateEdit
              Left = 276
              Top = 20
              Enabled = False
              Properties.ClearKey = 46
              Properties.SaveTime = False
              Properties.ShowTime = False
              StyleDisabled.TextColor = clWindowText
              TabOrder = 3
              Width = 109
            end
          end
        end
        object tsPathFile: TTabSheet
          Caption = 'Arquivos'
          ImageIndex = 1
          object cxGroupBox7: TcxGroupBox
            Left = 0
            Top = 0
            Align = alClient
            Caption = '| Locais dos Arquivos  Sa'#237'da |'
            TabOrder = 0
            Height = 466
            Width = 562
            object lbl17: TLabel
              Left = 16
              Top = 32
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
              Top = 80
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
              Top = 128
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
              Top = 176
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
              Top = 224
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
              Top = 272
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
            object lbl7: TLabel
              Left = 15
              Top = 324
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
              Top = 50
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
              Top = 98
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
              Top = 146
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
              Top = 194
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
              Top = 290
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
              Top = 242
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
              Top = 342
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
        end
      end
    end
    object tbsSobre: TcxTabSheet
      Caption = 'Sobre'
      ImageIndex = 2
      object JvGradientHeaderPanel2: TJvGradientHeaderPanel
        Left = 0
        Top = 0
        Width = 570
        Height = 33
        GradientStyle = grVertical
        LabelCaption = 'Informa'#231#245'es da Vers'#227'o'
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWhite
        LabelFont.Height = -13
        LabelFont.Name = 'Verdana'
        LabelFont.Style = [fsBold]
        LabelAlignment = taLeftJustify
        Align = alTop
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        TabOrder = 0
      end
      object cxLabel13: TcxLabel
        Left = 16
        Top = 70
        Caption = 'Vers'#227'o do Aplicativo'
      end
      object edtVersaoAp: TcxTextEdit
        Left = 124
        Top = 68
        Enabled = False
        StyleDisabled.TextColor = clWindowText
        TabOrder = 2
        Width = 120
      end
    end
  end
end
