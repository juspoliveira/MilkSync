unit uVSDialogosFRM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxLabel, cxContainer, cxEdit, cxTextEdit, JvExControls,
  JvGradientHeaderPanel, cxPC, cxControls, cxMemo, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinSilver, dxSkinStardust,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter;

type
  TVSDialogosFRM = class(TForm)
    Panel1: TPanel;
    btnOk: TcxButton;
    btnCancelar: TcxButton;
    pgcDialogos: TcxPageControl;
    tbsAut: TcxTabSheet;
    pnlTitulo: TJvGradientHeaderPanel;
    edtSenha: TcxTextEdit;
    cxLabel1: TcxLabel;
    edtUsu: TcxTextEdit;
    cxLabel2: TcxLabel;
    edtPC: TcxTextEdit;
    cxLabel3: TcxLabel;
    tbsSobre: TcxTabSheet;
    JvGradientHeaderPanel2: TJvGradientHeaderPanel;
    cxLabel7: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel13: TcxLabel;
    edtVersaoAp: TcxTextEdit;
    edtIDComp: TcxTextEdit;
    edtVersaoReg: TcxTextEdit;
    edtPlano: TcxTextEdit;
    edtEmailConta: TcxTextEdit;
    cxLabel8: TcxLabel;
    tbsConfig: TcxTabSheet;
    cxLabel5: TcxLabel;
    cxLabel10: TcxLabel;
    edtIdComputador: TcxTextEdit;
    edtTimerConsole: TcxTextEdit;
    edtServidor: TcxTextEdit;
    cxLabel14: TcxLabel;
    edtPorta: TcxTextEdit;
    cxLabel15: TcxLabel;
    JvGradientHeaderPanel1: TJvGradientHeaderPanel;
    cxLabel4: TcxLabel;
    edtUltSinc: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    function Autenticado(SubTitulo: string = ''): Boolean;
    procedure Sobre;
    function EditarConfiguracoes: Boolean;
    function InfoDadosUsuario(var Usuario: string; var Senha: string): Boolean;
  end;



implementation

{$R *.dfm}

uses uVSNetLimiteComum, uRotinasComuns, uRotinasComunsUI;

{ TVSDialogosFRM }

function TVSDialogosFRM.EditarConfiguracoes: Boolean;
begin
  Result := False;
  pgcDialogos.ActivePage := tbsConfig;

  Self.ActiveControl := edtPorta;

  edtPorta.Text := DadosConta.PortaSQUID;
  edtServidor.Text := DadosConta.NetLimiteURL;
  edtUltSinc.Text := DadosConta.DataUltBuildStr;
  edtTimerConsole.Text := Format('%s (min)', [FloatToStr(DadosConta.TimerProcConsole/60000)]);
  edtUltSinc.Text := DadosConta.DataUltBuildStr;
  edtIdComputador.Text := DadosConta.IDComputador;
  
  Self.Visible := False;
  if (Self.ShowModal = mrOk) then
  begin
    DadosConta.PortaSQUID := edtPorta.Text;
    DadosConta.NetLimiteURL := edtServidor.Text;
    DadosConta.TimerProcConsole := ValorNumerico(edtTimerConsole.Text, 5);
    Result := True;
  end;
end;

function TVSDialogosFRM.Autenticado(SubTitulo: string): Boolean;
begin
  Result := False;
  pgcDialogos.ActivePage := tbsAut;

  edtPC.Text := NomeComputador;
  edtUsu.Text := DadosConta.EmailUsuario;
  edtUsu.Enabled := False;

  Self.ActiveControl := edtSenha;

  Self.pnlTitulo.LabelCaption := 'Autenticação';

  if (SubTitulo <> EmptyStr) then
    Self.pnlTitulo.LabelCaption := Self.pnlTitulo.LabelCaption + ' :: ' + SubTitulo;

  edtSenha.Text := EmptyStr;

  Self.Visible := False;
  if (Self.ShowModal = mrOk) then
  begin
    if (MD5(edtSenha.Text) <> DadosConta.SenhaUsuarioMD5) then
      RotinasComunsUI.Mensagem('Senha incorreta.', 'Autenticação', BotaoOK, MensagemAviso, True);
    Result := True;
  end;
end;

procedure TVSDialogosFRM.FormCreate(Sender: TObject);
begin
  tbsAut.TabVisible := False;
  tbsSobre.TabVisible := False;
  tbsConfig.TabVisible := False;
end;

procedure TVSDialogosFRM.Sobre;
begin
  pgcDialogos.ActivePage := tbsSobre;

  // Dados Conta
  edtEmailConta.Text := DadosConta.EmailUsuario;
  edtPlano.Text := DadosConta.Plano;
  edtVersaoReg.Text := DadosConta.DataUltBuildStr;
  edtIDComp.Text := DadosConta.IDComputador;
  edtVersaoAp.Text := VersaoAplicativo(Application.ExeName);

  Self.Visible := False;
  Self.ShowModal;
end;

function TVSDialogosFRM.InfoDadosUsuario(var Usuario: string; var Senha: string): Boolean;
begin
  pgcDialogos.ActivePage := tbsAut;

  edtPC.Text := NomeComputador;
  edtUsu.Text := EmptyStr;
  edtSenha.Text := EmptyStr;
  edtUsu.Enabled := True;

  Self.ActiveControl := edtUsu;

  Self.pnlTitulo.LabelCaption := 'Autenticação';

  Self.Visible := False;          
  Result := (Self.ShowModal = mrOk);
  
  Usuario := edtUsu.Text;
  Senha := edtSenha.Text;
end;

end.
