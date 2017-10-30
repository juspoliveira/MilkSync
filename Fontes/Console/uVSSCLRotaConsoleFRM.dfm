object VSSCLRotaConsoleFRM: TVSSCLRotaConsoleFRM
  Left = 346
  Top = 147
  Width = 589
  Height = 393
  Caption = 'SCLRota Integrador'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMinimized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlInfoCopia: TJvGradientHeaderPanel
    Left = 0
    Top = 0
    Width = 581
    Height = 35
    GradientStyle = grVertical
    LabelCaption = 'SCLRota :: Integrador'
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
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 35
    Width = 581
    Height = 331
    ActivePage = cxTabSheet1
    Align = alClient
    TabOrder = 1
    ClientRectBottom = 331
    ClientRectRight = 581
    ClientRectTop = 24
    object cxTabSheet1: TcxTabSheet
      Caption = 'Servi'#231'os'
      ImageIndex = 0
      object memResult: TcxMemo
        Left = 0
        Top = 54
        Align = alClient
        ParentFont = False
        Properties.ReadOnly = False
        Properties.ScrollBars = ssBoth
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        Height = 253
        Width = 581
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 581
        Height = 54
        Align = alTop
        TabOrder = 1
        object btnIniciar: TcxButton
          Left = 27
          Top = 16
          Width = 83
          Height = 25
          Caption = 'Iniciar'
          TabOrder = 0
          OnClick = btnIniciarClick
          LookAndFeel.Kind = lfOffice11
        end
        object btnEncerrar: TcxButton
          Left = 120
          Top = 16
          Width = 83
          Height = 25
          Caption = 'Pausar'
          TabOrder = 1
          OnClick = btnEncerrarClick
          LookAndFeel.Kind = lfOffice11
        end
        object btnLog: TcxButton
          Left = 216
          Top = 16
          Width = 83
          Height = 25
          Caption = 'LOG'
          TabOrder = 2
          OnClick = btnLogClick
          LookAndFeel.Kind = lfOffice11
        end
        object btnFechar: TcxButton
          Left = 456
          Top = 16
          Width = 60
          Height = 25
          Caption = 'Fechar'
          TabOrder = 3
          OnClick = btnFecharClick
          LookAndFeel.Kind = lfOffice11
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'REST'
      ImageIndex = 1
      object Label1: TLabel
        Left = 0
        Top = 41
        Width = 48
        Height = 13
        Align = alTop
        Caption = 'Resultado'
      end
      object memRest: TcxMemo
        Left = 0
        Top = 54
        Align = alClient
        ParentFont = False
        Properties.ReadOnly = False
        Properties.ScrollBars = ssBoth
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        Height = 253
        Width = 581
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 581
        Height = 41
        Align = alTop
        TabOrder = 1
        object btnREST: TcxButton
          Left = 23
          Top = 8
          Width = 83
          Height = 25
          Caption = 'REST'
          TabOrder = 0
          OnClick = btnRESTClick
          LookAndFeel.Kind = lfOffice11
        end
        object cbxRest: TcxComboBox
          Left = 128
          Top = 12
          Properties.Items.Strings = (
            'readDescarga'
            'readViagem')
          TabOrder = 1
          Text = 'readViagem'
          Width = 177
        end
        object edtInicio: TcxDateEdit
          Left = 328
          Top = 11
          TabOrder = 2
          Width = 121
        end
        object edtFim: TcxDateEdit
          Left = 464
          Top = 11
          TabOrder = 3
          Width = 121
        end
      end
    end
  end
  object hinPrincipal: TJvBalloonHint
    UseBalloonAsApplicationHint = True
    Left = 328
    Top = 96
  end
  object apiPrincipal: TJvAppInstances
    Left = 328
    Top = 152
  end
  object mnuPrincipal: TPopupMenu
    Left = 376
    Top = 96
    object Abrir1: TMenuItem
      Caption = 'Abrir'
      OnClick = Abrir1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object mniSinc: TMenuItem
      Caption = 'Sincronizar agora'
      Visible = False
    end
    object N2: TMenuItem
      Caption = '-'
      Visible = False
    end
    object mniDesativar: TMenuItem
      Caption = 'Desativar'
      Visible = False
      object mniDesativar15: TMenuItem
        Caption = '15 Minutos'
      end
      object mniDesativar30: TMenuItem
        Caption = '30 Minutos'
      end
      object mniDesativar60: TMenuItem
        Caption = '60 Minutos'
      end
      object mniDesativar01: TMenuItem
        Caption = '01 Minuto'
      end
    end
    object N1: TMenuItem
      Caption = '-'
      Visible = False
    end
    object mniReativar: TMenuItem
      Caption = 'Reativar'
      Visible = False
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object mniConfig: TMenuItem
      Caption = 'Configura'#231#245'es'
      OnClick = mniConfigClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object mniEncerrar: TMenuItem
      Caption = 'Encerrar'
      OnClick = mniEncerrarClick
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object mniAtualizarVersao: TMenuItem
      Caption = 'Atualizar Vers'#227'o'
      Visible = False
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object mniSobre: TMenuItem
      Caption = 'Sobre'
      OnClick = mniSobreClick
    end
  end
  object icoPrincipal: TJvTrayIcon
    Icon.Data = {
      0000010001001010000001002000680400001600000028000000100000002000
      0000010020000000000000040000006400000064000000000000000000000000
      00000000000000000000B88B1E00B5881D00B5881D00B5881D1CB5881DBAB588
      1DB9B5881D1CB5881D00B5881D00B2851C000000000000000000000000000000
      000000000000AD821C00B5881D00B5881D00B5881D1FB5881D58B5881D96B588
      1D96B5881D58B5881D1FB5881D00B5881D00B5881D0000000000000000000000
      000000000000B1851C00B6881D00B5881D05B5881D5DB5881DB0B5881DADB588
      1DADB5881DB0B5881D5CB5881D05B5881D00B5881D000000000000000000B588
      1D00B5881D00B5881D00B5881D19B5881D97B5881D7DB5881D57B5881D53B588
      1D53B5881D58B5881D7DB5881D97B5881D18B5881D00B5881D00D19D2100B588
      1D00B5881D00B5881D12B5881D1BB5881D46B5881D8BB5881DAEB5881DB7B588
      1DB7B5881DAEB5881D8BB5881D45B5881D1BB5881D12B5881D00B5881D00B588
      1D00B5881D13B5881DAEB5881DC7B5881D75B5881D3DB5871C2AB3851728B386
      1828B5881C2AB5881D3DB5881D75B5881DC8B5881DADB5881D13B5881D00B588
      1D03B5881D89B5881DFFB5881DFFB5881DFFB4861AF4B68A20E2BA912ED5BA8F
      2BD5B5881DE2B4871BF4B5881DFFB5881DFFB5881DFFB5881D88B5881D03B588
      1D50B5881DEFB5881DFFB5881DFFB6891FFFCAAA5FFFE5D5B1FFF0E6D0FFEEE4
      CCFFDFCC9FFFC29D46FFB5871CFFB5881DFFB5881DFFB5881DEEB5881D4FB588
      1DC2B5881DFFB5881DFFB5871CFFD1B472FFFBF8F2FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF3ECDCFFC39F49FFB4871BFFB5881DFFB5881DFFB5881DC1B588
      1DFAB5881DFFB5881CFFB98E2AFFEFE5CEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFDECA9CFFB5871CFFB5881DFFB5881DFFB5881DF9B588
      1DF5B5881DFFB5881CFFB98E29FFEEE3CBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFDDC999FFB5871CFFB5881DFFB5881DFFB5881DF5B588
      1DBEB5881DFFB5881DFFB4871BFFD0B370FFFDFBF8FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF5EFE2FFC29E47FFB4871BFFB5881DFFB5881DFFB5881DBDB588
      1D4CB5881DECB5881DFFB5881CFFB68A22FFDCC693FFFEFEFDFFFFFFFFFFFFFF
      FFFFFAF6EFFFCDAF68FFB4871BFFB5881DFFB5881DFFB5881DEBB5881D4BB588
      1D01B5881D6DB5881DF3B5881DFFB5871CFFB88C26FFDDC897FFFEFDFCFFF9F5
      EDFFCFB26EFFB5881DFFB5881DFFB5881DFFB5881DF3B5881D6CB5881D01B588
      1D00B5881D03B5881D56B5881DCEB5881DFCB5871CFFB78C24FFD4BA7CFFCBAC
      61FFB5881CFFB5881DFFB5881DFCB5881DCDB5881D56B5881D02B5881D00B588
      1D00B5881D00B5881D00B5881D1DB5881D72B5881DC0B5881CECB4871BFDB487
      1BFDB5881DECB5881DC0B5881D71B5881D1DB5881D00B5881D00B5881D008007
      000000030000C000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000}
    IconIndex = 0
    PopupMenu = mnuPrincipal
    Delay = 400
    Snap = True
    Visibility = [tvAutoHide, tvRestoreClick, tvMinimizeClick]
    OnDblClick = icoPrincipalDblClick
    Left = 376
    Top = 152
  end
  object afzPrincipal: TIdAntiFreeze
    ApplicationHasPriority = False
    IdleTimeOut = 500
    Left = 272
    Top = 152
  end
end
