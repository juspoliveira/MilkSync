unit uVSSCLRotaConsoleFRM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvGradientHeaderPanel, Menus,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinSilver, dxSkinStardust, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo,
  StdCtrls, cxButtons, cxLabel, JvTrayIcon, JvAppInst, JvComponentBase,
  JvBalloonHint, uVSSCLRotaConsoleDTM, ExtCtrls, IdBaseComponent,
  IdAntiFreezeBase, IdAntiFreeze, dxSkinscxPCPainter, cxPC, cxGraphics,
  cxMaskEdit, cxDropDownEdit, cxCalendar, dxExEdtr, dxDBGrid, dxDBTLCl,
  dxGrClms, dxTL, dxDBCtrl, DB, dxCntner, sSkinProvider, sSkinManager,
  ComCtrls, sPageControl, ToolWin, sToolBar, Buttons, sSpeedButton, sPanel,
  sMemo, sComboBox, Mask, sMaskEdit, sCustomComboEdit, sTooledit, sLabel,
  ImgList, acAlphaImageList, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TVSSCLRotaConsoleFRM = class(TForm)
    hinPrincipal: TJvBalloonHint;
    apiPrincipal: TJvAppInstances;
    mnuPrincipal: TPopupMenu;
    Abrir1: TMenuItem;
    N3: TMenuItem;
    mniSinc: TMenuItem;
    N2: TMenuItem;
    mniDesativar: TMenuItem;
    mniDesativar15: TMenuItem;
    mniDesativar30: TMenuItem;
    mniDesativar60: TMenuItem;
    mniDesativar01: TMenuItem;
    N1: TMenuItem;
    mniReativar: TMenuItem;
    N5: TMenuItem;
    mniConfig: TMenuItem;
    N4: TMenuItem;
    mniEncerrar: TMenuItem;
    N6: TMenuItem;
    mniAtualizarVersao: TMenuItem;
    N7: TMenuItem;
    mniSobre: TMenuItem;
    icoPrincipal: TJvTrayIcon;
    afzPrincipal: TIdAntiFreeze;
    pgcMaster: TsPageControl;
    tsServico: TsTabSheet;
    tsRest: TsTabSheet;
    sPanel1: TsPanel;
    btnIniciar: TsSpeedButton;
    btnEncerrar: TsSpeedButton;
    btnLog: TsSpeedButton;
    btnFechar: TsSpeedButton;
    memResult: TsMemo;
    pnRest: TsPanel;
    btnRest: TsSpeedButton;
    edtInicio: TsDateEdit;
    edtFim: TsDateEdit;
    cbxRest: TsComboBox;
    memRest: TsMemo;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    skmMaster: TsSkinManager;
    skpMaster: TsSkinProvider;
    imgMaster: TsAlphaImageList;
    ds1: TDataSource;
    ds2: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnIniciarClick(Sender: TObject);
    procedure btnEncerrarClick(Sender: TObject);
    procedure btnStatusClick(Sender: TObject);
    procedure btnSobreClick(Sender: TObject);
    procedure mniEncerrarClick(Sender: TObject);
    procedure mniConfigClick(Sender: TObject);
    procedure mniSobreClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Abrir1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure icoPrincipalDblClick(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnLogClick(Sender: TObject);
    procedure btnRESTxClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnRestClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure Inicializar;
    function dtm: TVSSCLRotaConsoleDTM;
    procedure ExibirHint(Mensagem, Assunto: string; Timer: Integer = 10);
  public
    // Cria ou exibe formulario
     procedure CriaFormNome(NomeForm : String; ExibeModal: Boolean);
  end;

var
  VSSCLRotaConsoleFRM: TVSSCLRotaConsoleFRM;

implementation
uses uRotinasComuns, uRotinasComunsUI, uVSSCLRotaComum, uJson, 
  uVSSCLRotaDialogosFRM, uVSSCLRotaSettings;

{$R *.dfm}

{ TVSSCLRotaConsoleFRM }

function TVSSCLRotaConsoleFRM.dtm: TVSSCLRotaConsoleDTM;
begin
  Result := VSSCLRotaConsoleDTM;
end;

procedure TVSSCLRotaConsoleFRM.ExibirHint(Mensagem, Assunto: string;
  Timer: Integer);
begin
  icoPrincipal.BalloonHint(Assunto, Mensagem, btInfo, Timer * 60000);
end;

procedure TVSSCLRotaConsoleFRM.Inicializar;
begin
  Application.ShowMainForm := False;
  icoPrincipal.Active := True;

  ExibirHint('SCLRota Iniciando Aplicação...', 'SCLRota Aplicação');
  memResult.Lines.Add('Aplicação iniciada');
end;

procedure TVSSCLRotaConsoleFRM.FormCreate(Sender: TObject);
begin
  Inicializar;
  pgcMaster.ActivePage := tsServico;
end;

procedure TVSSCLRotaConsoleFRM.btnIniciarClick(Sender: TObject);
var
  x: Integer;
begin

  dtm.tmrConsole.Enabled := True;
  dtm.sheConsole.StartAll;
  memResult.Lines.Add('Aplicação Iniciada');
  for x := 1 to 6 do
  begin
     DadosConta.IdConta := DadosConta.ChaveContas[x];
    // Se não houver numero de conta, pula para proxima posição
    if DadosConta.IdConta = EmptyStr then
      Continue;

    if DadosConta.GeraTotvsDatasul = FlagSim then
    begin
      dtm.ExportarDescargas(False); // Não persiste o log de descarga para não influenciar na exportação das coletas
      dtm.ExportarColetas('Datasul');
    end;
    if DadosConta.GeraMagis = FlagSim then
      dtm.ExportarColetas('Magis');
    if DadosConta.GeraTotvsRm = FlagSim then
      dtm.ExportarColetas('RM');
    if DadosConta.GeraScl = FlagSim then
      dtm.ExportarColetas('SCL');

    if DadosConta.GeraSiga = FlagSim then
      dtm.ExportaSiga;
  end;
  // Atualiza data de leitura
  dtm.AtualizarDatLeituraParam(Date);

  // Inicia timer de atualização dos cadastros
  dtm.tmrSync.Enabled := True;
  
 end;

procedure TVSSCLRotaConsoleFRM.btnEncerrarClick(Sender: TObject);
begin
  dtm.tmrConsole.Enabled := False;
  dtm.sheConsole.StopAll;
  dtm.tmrSync.Enabled := False;
  memResult.Lines.Add('Aplicação Em Pausa');
end;

procedure TVSSCLRotaConsoleFRM.btnStatusClick(Sender: TObject);
begin
  if dtm.tmrConsole.Enabled then
    memResult.Lines.Add('Aplicação Ativa')
  else
    memResult.Lines.Add('Aplicação Inativa');
end;

procedure TVSSCLRotaConsoleFRM.btnSobreClick(Sender: TObject);
var
  dlg: TVSDialogosFRM;
begin
  dlg := TVSDialogosFRM.Create(nil);
  try
    dlg.Sobre;
  finally
    dlg.Release;
  end;
end;

procedure TVSSCLRotaConsoleFRM.mniEncerrarClick(Sender: TObject);
var
  dlg: TVSDialogosFRM;
begin
  dlg := TVSDialogosFRM.Create(nil);
  try
    if dlg.Autenticado then
    begin
      skmMaster.Active := False;
      Application.Terminate;
    end;
  finally
    dlg.Release;
  end;
end;

procedure TVSSCLRotaConsoleFRM.mniConfigClick(Sender: TObject);
var
  dlg: TVSDialogosFRM;                                                                 
begin

  dlg := TVSDialogosFRM.Create(nil);

  try
    if dlg.Autenticado then
    begin
      dtm.qryParametros.Close;
      dtm.qryParametros.Open;
      PopularDadosConta(dtm.qryParametros);
      try
        //Exibe o formulario de configuracao das contas
        VSSCLRotaSettings := TVSSCLRotaSettings.Create(nil);
        VSSCLRotaSettings.Visible := False;
        VSSCLRotaSettings.ShowModal;
      finally
        VSSCLRotaSettings.Destroy;
      end;
      {
      if dlg.EditarConfiguracoes then
      begin
        dtm.tmrSync.Enabled := False;
        dtm.tmrConsole.Enabled := False;
        dtm.sheConsole.StopAll;
        dtm.SalvarDadosParametros;
        ShowMessage('Esta ação requer o reinício da aplicação. Finalizando...');
        Self.Release;
        Application.Terminate;
      end;
      }
    end;
  finally
    dlg.Release;

  end;
end;

procedure TVSSCLRotaConsoleFRM.mniSobreClick(Sender: TObject);
var
  dlg: TVSDialogosFRM;
begin
  dlg := TVSDialogosFRM.Create(nil);
  try
    dlg.Sobre;
  finally
    dlg.Release;
  end;
end;

procedure TVSSCLRotaConsoleFRM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Self.WindowState := wsMinimized;
  Self.Hide;
  Action := caNone;
end;

procedure TVSSCLRotaConsoleFRM.Abrir1Click(Sender: TObject);
begin
  Self.Show;
 // icoPrincipal.ShowApplication;
end;

procedure TVSSCLRotaConsoleFRM.FormDestroy(Sender: TObject);
begin
  dtm.tmrConsole.Enabled := False;
  dtm.tmrSync.Enabled := False;
end;

procedure TVSSCLRotaConsoleFRM.icoPrincipalDblClick(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Self.Show;
  Application.ProcessMessages;
end;

procedure TVSSCLRotaConsoleFRM.btnLogClick(Sender: TObject);
var
  strArqLog: TStringList;
begin
  strArqLog := TStringList.Create;
  try
    strArqLog.LoadFromFile(InserirMsgLog('==================FIM LOG================'));
    memResult.Lines.Add(strArqLog.Text);
  finally
    strArqLog.Free;
  end;  
end;

procedure TVSSCLRotaConsoleFRM.btnRESTxClick(Sender: TObject);
var
  DadosRetorno: TDadosRetorno;
  DataIni, DataFim: string;
begin
  DataIni := FormatDateTime('yyyy-MM-dd', edtInicio.Date);
  DataFim := FormatDateTime('yyyy-MM-dd', edtFim.Date);
  if cbxRest.Text = 'readViagem' then
    DadosRetorno := readViagem(DataIni, DataFim);
  if cbxRest.Text = 'readDescarga' then
    DadosRetorno := readDescarga(DataIni, DataFim);
  memRest.Lines.Add('-----------------------------');
  memRest.Lines.Add(DadosRetorno.ToString);
end;


procedure TVSSCLRotaConsoleFRM.btnFecharClick(Sender: TObject);
begin
  dtm.tmrConsole.Enabled := False;
  dtm.tmrSync.Enabled := False;
  skmMaster.Active := False;
  Close;
  Application.Terminate;
end;

procedure TVSSCLRotaConsoleFRM.btnRestClick(Sender: TObject);
var
  DadosRetorno: TDadosRetorno;
  DataIni, DataFim: string;
begin
  DataIni := FormatDateTime('yyyy-MM-dd', edtInicio.Date);
  DataFim := FormatDateTime('yyyy-MM-dd', edtFim.Date);
  if cbxRest.Text = 'readViagem' then
    DadosRetorno := readViagem(DataIni, DataFim);
  if cbxRest.Text = 'readDescarga' then
    DadosRetorno := readDescarga(DataIni, DataFim);
  memRest.Lines.Add('-----------------------------');
  memRest.Lines.Add(DadosRetorno.ToString);
end;

procedure TVSSCLRotaConsoleFRM.FormShow(Sender: TObject);
begin
  // Mostra a versão da app na barra de titulos
  Self.Caption := self.Caption + '  :: Versão : ' + VersaoAplicativo('.\SclRotaIntegrador.exe');
end;
// Cria ou exibe formulario
procedure TVSSCLRotaConsoleFRM.CriaFormNome(NomeForm: String;
  ExibeModal: Boolean);
var
  Form : TForm;
  frmClass: TFormClass;
  i :integer;
begin
  frmClass := TFormClass(FindClass(NomeForm));
  for i:= 0 to Screen.FormCount - 1 do
  begin
    if Screen.Forms[i].ClassName = frmClass.ClassName then
    begin
      Screen.Forms[i].WindowState := wsNormal;
      Screen.Forms[i].BringToFront;
      Exit;
    end;
  end;
  // Cursor
  Screen.Cursor := crHourGlass;
  try
    Form := FrmClass.Create(Self);
    // Seta Estilo Child
    if ExibeModal then
    begin
      if Form.FormStyle <> fsNormal then
        Form.FormStyle := fsNormal;
      Form.Visible := False;
      Screen.Cursor := crDefault;
      Form.ShowModal;
    end
    else
    begin
      if (not Form.Visible) then
        Form.Visible := True;
    end;
  finally
    Screen.Cursor := crDefault;
  end;

  // Organizar Janelas Verticalmente
  if (Self.MDIChildCount > 1) then
    Self.Cascade;
end;
end.
