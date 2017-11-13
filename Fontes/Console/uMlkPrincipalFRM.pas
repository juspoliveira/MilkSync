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
  cxDBEdit;

type
  TMksPrincipalFRM = class(TForm)
    tryMaster: TTrayIcon;
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
    grdContasViewDatUltLeituraDescargaWS: TcxGridDBColumn;
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
    procedure acOpenExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acCloseExecute(Sender: TObject);
    procedure acHideExecute(Sender: TObject);
    procedure acStartExecute(Sender: TObject);
    procedure acStopExecute(Sender: TObject);
    procedure acLogExecute(Sender: TObject);
    procedure AcConfigExecute(Sender: TObject);
    procedure acSalvarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure MostraStatusTmr;
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

procedure TMksPrincipalFRM.acLogExecute(Sender: TObject);
begin
;
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
  MlkPrincipalDTM.tmrSync.Enabled := True;
  MlkPrincipalDTM.sheConsole.StartAll;
  MlkPrincipalDTM.StatusTmrConsole := TmrHabilitado;
  MlkPrincipalDTM.StatusTmrSync := TmrHabilitado;
  MostraStatusTmr;

  MlkPrincipalDTM.getServerData;
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

procedure TMksPrincipalFRM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caNone;
  Self.Hide;
end;

procedure TMksPrincipalFRM.FormCreate(Sender: TObject);
begin
  tryMaster.Visible := True;
  tryMaster.Animate := True;
  tryMaster.ShowBalloonHint;
  MlkPrincipalDTM.ShowStatusTmr := MostraStatusTmr;
end;

procedure TMksPrincipalFRM.FormShow(Sender: TObject);
begin
  // Mostra status dos timers
  MostraStatusTmr;
 end;

// Exibe o sttus to timer no Status Painel
procedure TMksPrincipalFRM.MostraStatusTmr;
begin
  stbMaster.Panels[1].Text := MlkPrincipalDTM.StatusTmrSync;
  stbMaster.Panels[3].Text := MlkPrincipalDTM.StatusTmrConsole;
  Application.ProcessMessages;
end;

end.
