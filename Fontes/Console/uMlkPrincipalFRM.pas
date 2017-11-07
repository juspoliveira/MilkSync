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
  Buttons;

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
    tmrSync: TTimer;
    tmrFiles: TTimer;
    procedure acOpenExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acCloseExecute(Sender: TObject);
    procedure acHideExecute(Sender: TObject);
    procedure acStartExecute(Sender: TObject);
    procedure acStopExecute(Sender: TObject);
    procedure acLogExecute(Sender: TObject);
    procedure AcConfigExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MksPrincipalFRM: TMksPrincipalFRM;

implementation

uses
  uMlkPrincipalDTM, uMlkParmetrosFRM;

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

procedure TMksPrincipalFRM.acStartExecute(Sender: TObject);
begin
 ;
end;

procedure TMksPrincipalFRM.acStopExecute(Sender: TObject);
begin
       ;
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
end;

end.
