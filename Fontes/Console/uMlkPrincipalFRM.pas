unit uMlkPrincipalFRM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, Menus, ExtCtrls, AppEvnts, jpeg, IdBaseComponent,
  IdAntiFreezeBase, IdAntiFreeze, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, ComCtrls, ImgList, StdCtrls,
  Buttons, cxImageComboBox, cxContainer, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxDBEdit, cxDropDownEdit, cxCalendar, JvComponentBase, JvDebugHandler;

type
  TMksPrincipalFRM = class(TForm)
    pmnManster: TPopupMenu;
    aclMaster: TActionList;
    acOpen: TAction;
    acTools: TAction;
    Abrir1: TMenuItem;
    Parametros1: TMenuItem;
    AppEvenMaster: TApplicationEvents;
    acClose: TAction;
    Sair1: TMenuItem;
    IdAntiFreeMaster: TIdAntiFreeze;
    pgcMaster: TPageControl;
    tabsHome: TTabSheet;
    imgMaster: TImageList;
    grpControle: TGroupBox;
    memLog: TMemo;
    Image1: TImage;
    btnStart: TSpeedButton;
    btnStop: TSpeedButton;
    btnLog: TSpeedButton;
    acStart: TAction;
    acStop: TAction;
    acLog: TAction;
    btnExit: TSpeedButton;
    acHide: TAction;
    AcConfig: TAction;
    SpeedButton1: TSpeedButton;
    tabsContas: TTabSheet;
    grdContas: TcxGrid;
    grdContasView: TcxGridDBTableView;
    grdContasLevel: TcxGridLevel;
    dsContas: TDataSource;
    grdContasViewNomeEmpresa: TcxGridDBColumn;
    grdContasViewContaId: TcxGridDBColumn;
    grdContasViewKeyId: TcxGridDBColumn;
    grdContasViewAtiva: TcxGridDBColumn;
    grdContasViewSync: TcxGridDBColumn;
    GroupBox1: TGroupBox;
    btnSaveTimer: TSpeedButton;
    sLabel4: TLabel;
    cxLabel10: TLabel;
    acSalvar: TAction;
    edtTempo: TcxDBSpinEdit;
    edtCad: TcxDBSpinEdit;
    dsControle: TDataSource;
    stbMaster: TStatusBar;
    grbLastIte: TGroupBox;
    edtLastIte: TcxDBDateEdit;
    tryMaster: TTrayIcon;
    grdContasViewDatUltSync: TcxGridDBColumn;
    grdContasViewCarga: TcxGridDBColumn;
    grdContasViewDatUltCarga: TcxGridDBColumn;
    procedure acOpenExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acCloseExecute(Sender: TObject);
    procedure acHideExecute(Sender: TObject);
    procedure acStartExecute(Sender: TObject);
    procedure acStopExecute(Sender: TObject);
    procedure AcConfigExecute(Sender: TObject);
    procedure acSalvarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pgcMasterChange(Sender: TObject);
    procedure AppEvenMasterMinimize(Sender: TObject);

  private
    procedure MostraStatusTmr;
    function VersaoApp (const FileName: string; var Major, Minor, Release, Build: Integer): Boolean;
  public
    { Public declarations }
  end;

var
  MksPrincipalFRM: TMksPrincipalFRM;

implementation

uses
  uMlkPrincipalDTM, uMlkParmetrosFRM, uGlobal, uConstantesComuns;

{$R *.dfm}
// Abre a aplicacao
procedure TMksPrincipalFRM.acCloseExecute(Sender: TObject);
begin
 tryMaster.BalloonHint := 'Bye Bye .. !';
 tryMaster.ShowBalloonHint;
 MlkPrincipalDTM.Finish;
 Halt(0);
 Application.Terminate;

end;

procedure TMksPrincipalFRM.AcConfigExecute(Sender: TObject);
begin
  MlkParmetrosFRM := TMlkParmetrosFRM.Create(self);
  MlkParmetrosFRM.ShowModal;
end;

procedure TMksPrincipalFRM.acHideExecute(Sender: TObject);
begin
  Self.Close;
end;

procedure TMksPrincipalFRM.acOpenExecute(Sender: TObject);
begin
  Self.Show;
  Application.BringToFront;
end;
 //Salva Parametros de controle
procedure TMksPrincipalFRM.acSalvarExecute(Sender: TObject);
begin
   if MostraMsgConf('Salvar Alteracoes ?')  then
   begin
     try
       if (dsControle.DataSet.State in dsEditModes) then
       begin
         // Para os servicos
         memLog.Lines.Append('Parando Servicos...' +  '[' +  FormatDateTime('dd-MM-yyyy hh:mm:ss', Now) + ']');
         acStop.Execute;
         // Salva novos tempos de sincronizacao
         MlkPrincipalDTM.SalvarControle;

         // Seta novos tempos nos timers
         memLog.Lines.Append('Setando Novos tempos de sincronizacao...' + '[' +  FormatDateTime('dd-MM-yyyy hh:mm:ss', Now) + ']');
         MlkPrincipalDTM.tmrConsole.Interval := (dsControle.DataSet.FieldByName('Intervalo').AsInteger * 1000); // Tempo em Milesegundos
         MlkPrincipalDTM.tmrSync.Interval := (dsControle.DataSet.FieldByName('IntervaloCarga').AsInteger * 1000); // Tempo em Milesegundos

         memLog.Lines.Append('Novos tempos de sincronizacao agora estao assim:') ;
         memLog.Lines.Append('Geracao de arquivos : ' + IntToStr(MlkPrincipalDTM.tmrConsole.Interval) + ' MileSegundos');
         memLog.Lines.Append('Atualiza de Cadastro: ' + IntToStr(MlkPrincipalDTM.tmrSync.Interval) + ' MileSegundos');

         MostraMsgInfo('Registro salvo com sucesso, Aplicacao sera reiniciada !');
         acClose.Execute;

       end;
     except
       raise Exception.Create('Falha ao salvar registro de controle!');
     end;
   end;
end;

procedure TMksPrincipalFRM.acStartExecute(Sender: TObject);
begin
  memLog.Lines.Append('Servico Iniciado ...' + '[' +  FormatDateTime('dd-MM-yyyy hh:mm:ss', Now) + ']');
  MlkPrincipalDTM.tmrConsole.Enabled := True;
  MlkPrincipalDTM.tmrSync.Enabled := False;
  MlkPrincipalDTM.sheConsole.StartAll;
  MlkPrincipalDTM.StatusTmrConsole := TmrHabilitado;
  MlkPrincipalDTM.StatusTmrSync := TmrInativo;
  MostraStatusTmr;
  MlkPrincipalDTM.SetLastIteration;

  MlkPrincipalDTM.getServerData;

  try
    MlkPrincipalDTM.tmrConsole.Enabled := False;
    MlkPrincipalDTM.tmrSyncTimer(nil);
  finally
     MlkPrincipalDTM.tmrConsole.Enabled := True;;
  end;

end;
// Para os timmers e servicos
procedure TMksPrincipalFRM.acStopExecute(Sender: TObject);
begin
  memLog.Lines.Append('Servico em Pausa ...' + '[' +  FormatDateTime('dd-MM-yyyy hh:mm:ss', Now) + ']');
  MlkPrincipalDTM.sheConsole.StopAll;
  MlkPrincipalDTM.tmrConsole.Enabled := False;
  MlkPrincipalDTM.tmrSync.Enabled := False;
  MlkPrincipalDTM.StatusTmrConsole := TmrInabilitado;
  MlkPrincipalDTM.StatusTmrSync := TmrInabilitado;
  MostraStatusTmr;
end;

procedure TMksPrincipalFRM.AppEvenMasterMinimize(Sender: TObject);
begin
  acHide.Execute;
end;

procedure TMksPrincipalFRM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caNone;
  Self.Hide;
end;

procedure TMksPrincipalFRM.FormCreate(Sender: TObject);
begin
  tryMaster.Visible := True;
  tryMaster.Animate := False;
  tryMaster.ShowBalloonHint;
  MlkPrincipalDTM.ShowStatusTmr := MostraStatusTmr;
 // ReportMemoryLeaksOnShutdown := True;
end;

procedure TMksPrincipalFRM.FormShow(Sender: TObject);
var
 vMaior, vMenor, vRelease,vBiuld : Integer;
begin
  // Mostra status dos timers
  MostraStatusTmr;
  // Mostra versao da app na barra de titulos
  if VersaoApp(Application.ExeName,vMaior, vMenor, vRelease, vBiuld) then
    Self.Caption := Self.Caption + ' <> ' + IntToStr(vMaior) + '.' + IntToStr(vMenor)+
                                            '.' + IntToStr(vRelease) +
                                            '.' + IntToStr(vBiuld);
end;


// Exibe o sttus to timer no Status Painel
procedure TMksPrincipalFRM.MostraStatusTmr;
begin
  stbMaster.Panels[1].Text := MlkPrincipalDTM.StatusTmrSync;
  stbMaster.Panels[4].Text := MlkPrincipalDTM.StatusTmrConsole;
  pgcMaster.ActivePage := tabsContas;
  Application.ProcessMessages;
end;

procedure TMksPrincipalFRM.pgcMasterChange(Sender: TObject);
begin
   if pgcMaster.ActivePage = tabsContas then
  begin
    MlkPrincipalDTM.SelectAllRecordsConta;
  end;
end;

function TMksPrincipalFRM.VersaoApp(const FileName: string; var Major, Minor, Release, Build: Integer): Boolean;

// Portugues
//  Pega os números de versão maior, Menor, release e build para o arquivo
//       exe ou dll passado como argumento em FileName, coloca esses números
//       nas variáveis major, minor, release e build passadas como referencia.
// Retorna True = Sucesso, conseguiu obter a versão
// Retorna False = Falha, provavelmente arquivo não localizado ou informação
//                 de versão não consta no arquivo.

var
  Zero: DWORD; // set to 0 by GetFileVersionInfoSize
  VersionInfoSize: DWORD;
  PVersionData: pointer;
  PFixedFileInfo: PVSFixedFileInfo;
  FixedFileInfoLength: UINT;

begin
  Result := False;
  Major := 0;
  Minor := 0;
  Release := 0;
  Build := 0;
  VersionInfoSize := GetFileVersionInfoSize(pChar(FileName), Zero);
  if VersionInfoSize = 0 then
     exit;
  PVersionData := AllocMem(VersionInfoSize);
  try
    if GetFileVersionInfo(pChar(FileName), 0, VersionInfoSize, PVersionData) = False then
       exit;
//      raise Exception.Create('Não pude recuperar informação sobre versão');
    if VerQueryValue(PVersionData, '', pointer(PFixedFileInfo), FixedFileInfoLength) = False then
       exit;
    Major := PFixedFileInfo^.dwFileVersionMS shr 16;
    Minor := PFixedFileInfo^.dwFileVersionMS and $FFFF;
    Release := PFixedFileInfo^.dwFileVersionLS shr 16;
    Build := PFixedFileInfo^.dwFileVersionLS and $FFFF;
  finally
    FreeMem(PVersionData);
  end;
  if (Major or Minor or Release or Build) <> 0 then
     result := True;
//    result := IntToStr(Major) + IntToStr(Minor) + IntToStr(Release) + IntToStr(Build);
end;


end.
