object VSDialogosFRM: TVSDialogosFRM
  Left = 426
  Top = 178
  Width = 464
  Height = 360
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
    Top = 286
    Width = 448
    Height = 36
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 0
    object btnOk: TcxButton
      Left = 127
      Top = 8
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
      Left = 223
      Top = 8
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
    Width = 448
    Height = 286
    ActivePage = tbsConfig
    Align = alClient
    Color = clBtnFace
    ParentColor = False
    TabOrder = 1
    ClientRectBottom = 286
    ClientRectRight = 448
    ClientRectTop = 24
    object tbsAut: TcxTabSheet
      Caption = 'tbsAut'
      ImageIndex = 0
      object pnlTitulo: TJvGradientHeaderPanel
        Left = 0
        Top = 0
        Width = 448
        Height = 35
        GradientStyle = grVertical
        LabelCaption = 'Autentica'#231#227'o'
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
        TabOrder = 3
      end
      object edtSenha: TcxTextEdit
        Left = 113
        Top = 134
        Properties.EchoMode = eemPassword
        TabOrder = 2
        Width = 170
      end
      object cxLabel1: TcxLabel
        Left = 72
        Top = 134
        Caption = 'Senha'
      end
      object edtUsu: TcxTextEdit
        Left = 113
        Top = 98
        Enabled = False
        StyleDisabled.TextColor = clWindowText
        TabOrder = 1
        Width = 216
      end
      object cxLabel2: TcxLabel
        Left = 67
        Top = 98
        Caption = 'Usu'#225'rio'
      end
      object edtPC: TcxTextEdit
        Left = 113
        Top = 64
        Enabled = False
        TabOrder = 0
        Width = 216
      end
      object cxLabel3: TcxLabel
        Left = 46
        Top = 64
        Caption = 'Computador'
      end
    end
    object tbsSobre: TcxTabSheet
      Caption = 'tbsSobre'
      ImageIndex = 2
      object JvGradientHeaderPanel2: TJvGradientHeaderPanel
        Left = 0
        Top = 0
        Width = 448
        Height = 33
        GradientStyle = grVertical
        LabelCaption = 'Informa'#231#245'es da Conta'
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
      object cxLabel7: TcxLabel
        Left = 89
        Top = 66
        Caption = 'Email'
      end
      object cxLabel9: TcxLabel
        Left = 87
        Top = 89
        Caption = 'Plano'
      end
      object cxLabel11: TcxLabel
        Left = 26
        Top = 135
        Caption = 'Id do Computador'
      end
      object cxLabel13: TcxLabel
        Left = 16
        Top = 158
        Caption = 'Vers'#227'o do Aplicativo'
      end
      object edtVersaoAp: TcxTextEdit
        Left = 124
        Top = 156
        Enabled = False
        StyleDisabled.TextColor = clWindowText
        TabOrder = 5
        Width = 120
      end
      object edtIDComp: TcxTextEdit
        Left = 124
        Top = 133
        Enabled = False
        StyleDisabled.TextColor = clWindowText
        TabOrder = 6
        Width = 180
      end
      object edtVersaoReg: TcxTextEdit
        Left = 124
        Top = 110
        Enabled = False
        StyleDisabled.TextColor = clWindowText
        TabOrder = 7
        Width = 180
      end
      object edtPlano: TcxTextEdit
        Left = 124
        Top = 87
        Enabled = False
        StyleDisabled.TextColor = clWindowText
        TabOrder = 8
        Width = 180
      end
      object edtEmailConta: TcxTextEdit
        Left = 124
        Top = 64
        Enabled = False
        StyleDisabled.TextColor = clWindowText
        TabOrder = 9
        Width = 281
      end
      object cxLabel8: TcxLabel
        Left = 23
        Top = 112
        Caption = 'Vers'#227'o das Regras'
      end
    end
    object tbsConfig: TcxTabSheet
      Caption = 'tbsConfig'
      ImageIndex = 2
      object cxLabel5: TcxLabel
        Left = 43
        Top = 76
        Caption = 'NETLimite URL'
      end
      object cxLabel10: TcxLabel
        Left = 24
        Top = 131
        Caption = 'Id do Computador'
      end
      object edtIdComputador: TcxTextEdit
        Left = 124
        Top = 129
        Enabled = False
        StyleDisabled.TextColor = clWindowText
        TabOrder = 5
        Width = 180
      end
      object edtTimerConsole: TcxTextEdit
        Left = 124
        Top = 104
        StyleDisabled.TextColor = clWindowText
        TabOrder = 2
        Width = 180
      end
      object edtServidor: TcxTextEdit
        Left = 124
        Top = 75
        StyleDisabled.TextColor = clWindowText
        TabOrder = 1
        Width = 310
      end
      object cxLabel14: TcxLabel
        Left = 19
        Top = 105
        Caption = 'Atualiza'#231#227'o Regras'
      end
      object edtPorta: TcxTextEdit
        Left = 124
        Top = 50
        StyleDisabled.TextColor = clWindowText
        TabOrder = 0
        Width = 40
      end
      object cxLabel15: TcxLabel
        Left = 50
        Top = 51
        Caption = 'Porta SQUID'
      end
      object JvGradientHeaderPanel1: TJvGradientHeaderPanel
        Left = 0
        Top = 0
        Width = 448
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
        TabOrder = 8
      end
      object cxLabel4: TcxLabel
        Left = 14
        Top = 157
        Caption = #218'ltima Sincroniza'#231#227'o'
      end
      object edtUltSinc: TcxTextEdit
        Left = 124
        Top = 155
        Enabled = False
        StyleDisabled.TextColor = clWindowText
        TabOrder = 10
        Width = 120
      end
    end
  end
end
