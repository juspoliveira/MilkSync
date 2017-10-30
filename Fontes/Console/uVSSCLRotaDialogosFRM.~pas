unit uVSSCLRotaDialogosFRM;

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
  dxSkinscxPCPainter, cxCheckBox, cxMaskEdit, cxSpinEdit, cxGroupBox,
  cxDropDownEdit, cxCalendar, cxGraphics, cxImageComboBox, ActnList,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Mask, JvExMask, JvToolEdit,
  ComCtrls;

type
  TVSDialogosFRM = class(TForm)
    Panel1: TPanel;
    btnOk: TcxButton;
    btnCancelar: TcxButton;
    pgcDialogos: TcxPageControl;
    tbsAut: TcxTabSheet;
    pnlTitulo: TJvGradientHeaderPanel;
    tbsSobre: TcxTabSheet;
    JvGradientHeaderPanel2: TJvGradientHeaderPanel;
    cxLabel13: TcxLabel;
    edtVersaoAp: TcxTextEdit;
    tbsConfig: TcxTabSheet;
    JvGradientHeaderPanel1: TJvGradientHeaderPanel;
    cxGroupBox5: TcxGroupBox;
    edtSenha: TcxTextEdit;
    cxLabel1: TcxLabel;
    edtUsu: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxGroupBox6: TcxGroupBox;
    pgcConfig: TPageControl;
    tsParametros: TTabSheet;
    tsPathFile: TTabSheet;
    cxGroupBox3: TcxGroupBox;
    cxLabel5: TcxLabel;
    cxLabel10: TcxLabel;
    edtServidor: TcxTextEdit;
    chxLog: TcxCheckBox;
    edtTempo: TcxSpinEdit;
    chxUsarProxy: TcxCheckBox;
    edtConta1: TcxTextEdit;
    cxLabel9: TcxLabel;
    cxgrpbx1: TcxGroupBox;
    cxLabel4: TcxLabel;
    edtProxyPorta: TcxTextEdit;
    cxLabel6: TcxLabel;
    edtProxyUsu: TcxTextEdit;
    cxLabel7: TcxLabel;
    edtProxySenha: TcxTextEdit;
    cxLabel8: TcxLabel;
    edtProxyUrl: TcxTextEdit;
    cxGroupBox4: TcxGroupBox;
    ckbDatasul: TcxCheckBox;
    ckbRM: TcxCheckBox;
    ckbMagis: TcxCheckBox;
    ckbMeta: TcxCheckBox;
    ckbSiga: TcxCheckBox;
    cbxMagis: TcxImageComboBox;
    cbxDatasul: TcxImageComboBox;
    cbxRm: TcxImageComboBox;
    cbxMeta: TcxImageComboBox;
    cbxSiga: TcxImageComboBox;
    cbxScl: TcxImageComboBox;
    ckbScl: TcxCheckBox;
    cxGroupBox2: TcxGroupBox;
    edtDifAtesto: TcxTextEdit;
    cxLabel11: TcxLabel;
    chxEnviarNota: TcxCheckBox;
    cxGroupBox1: TcxGroupBox;
    lbl6: TLabel;
    edtIniLeitura: TcxDateEdit;
    cxLabel3: TcxLabel;
    cxLabel14: TcxLabel;
    edtUltLeitura: TcxDateEdit;
    cxGroupBox7: TcxGroupBox;
    lbl17: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    deDatasul: TJvDirectoryEdit;
    deRm: TJvDirectoryEdit;
    deMagis: TJvDirectoryEdit;
    deMeta: TJvDirectoryEdit;
    deScl: TJvDirectoryEdit;
    deSiga: TJvDirectoryEdit;
    lbl7: TLabel;
    dePathDescarga: TJvDirectoryEdit;
    edtConta2: TcxTextEdit;
    edtConta3: TcxTextEdit;
    edtConta4: TcxTextEdit;
    edtConta5: TcxTextEdit;
    edtConta6: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure cbxDatasulPropertiesInitPopup(Sender: TObject);
    procedure cbxMagisPropertiesInitPopup(Sender: TObject);
    procedure cbxRmPropertiesInitPopup(Sender: TObject);
    procedure cbxMetaPropertiesInitPopup(Sender: TObject);
    procedure cbxSigaPropertiesInitPopup(Sender: TObject);
    procedure cbxSclPropertiesInitPopup(Sender: TObject);
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

uses uRotinasComuns, uRotinasComunsUI, uVSSCLRotaComum,
  uVSSCLRotaConsoleDTM;

{ TVSDialogosFRM }

function TVSDialogosFRM.EditarConfiguracoes: Boolean;
begin
  Result := False;
  pgcDialogos.ActivePage := tbsConfig;
  Self.ActiveControl := edtServidor;
  edtServidor.Text := DadosConta.HostURL;
 // edtConta.Text := DadosConta.IdConta;
  edtTempo.Text := IntToStr(DadosConta.TimerProcInterno);
  chxUsarProxy.Checked := DadosConta.UsarProxy;
  chxLog.Checked := DadosConta.Log;
  edtProxyUrl.Text := DadosConta.DadosProxy.Host;
  edtProxyPorta.Text := DadosConta.DadosProxy.Porta;
  edtProxyUsu.Text := DadosConta.DadosProxy.Usuario;
  edtProxySenha.Text := DadosConta.DadosProxy.Senha;
  chxEnviarNota.Checked := DadosConta.EnviarNotifiAtesto;
  edtDifAtesto.EditValue := DadosConta.PercAtesto;
  edtIniLeitura.EditValue := DadosConta.DatIniLeituraDescargaWS;
  edtUltLeitura.EditValue := DadosConta.DatUltLeituraDescargaWS;
  ckbDatasul.EditValue := DadosConta.GeraTotvsDatasul;
  ckbRM.EditValue := DadosConta.GeraTotvsRm;
  ckbMagis.EditValue := DadosConta.GeraMagis;
  ckbMeta.EditValue := DadosConta.GeraMeta;
  ckbSiga.EditValue := DadosConta.GeraSiga;
  ckbScl.EditValue  := DadosConta.GeraScl;
  cbxDatasul.EditValue := DadosConta.VerDatasul;
  cbxRm.EditValue := DadosConta.VerRm;
  cbxMagis.EditValue := DadosConta.VerMagis;
  cbxMeta.EditValue := DadosConta.VerMeta;
  cbxSiga.EditValue := DadosConta.VerSiga;
  cbxScl.EditValue := DadosConta.VerScl;
  // Diretorios dos arquivos de saida
  deDatasul.Directory := DadosConta.PathArqDatasul;
  deRm.Directory := DadosConta.PathArqRm;
  deMagis.Directory := DadosConta.PathArqMagis;
  deMeta.Directory := DadosConta.PathArqMeta;
  deSiga.Directory := DadosConta.PathArqSiga;
  deScl.Directory := DadosConta.PathArqScl;
  dePathDescarga.Directory := DadosConta.PathArqDescarga;
  // Identificadores das contas
  edtConta1.Text := DadosConta.IdConta1;
  edtConta2.Text := DadosConta.IdConta2;
  edtConta3.Text := DadosConta.IdConta3;
  edtConta4.Text := DadosConta.IdConta4;
  edtConta5.Text := DadosConta.IdConta5;
  edtConta6.Text := DadosConta.IdConta6;

  Self.Visible := False;
  Self.Height := 610;
  if (Self.ShowModal = mrOk) then
  begin
    DadosConta.HostURL := edtServidor.Text;
    DadosConta.IdConta1 := edtConta1.Text;
    DadosConta.IdConta2 := edtConta2.Text;
    DadosConta.IdConta3 := edtConta3.Text;
    DadosConta.IdConta4 := edtConta4.Text;
    DadosConta.IdConta5 := edtConta5.Text;
    DadosConta.IdConta6 := edtConta6.Text;
    // Alimenta array com chaves das contas
    DadosConta.ChaveContas[1] := edtConta1.Text;
    DadosConta.ChaveContas[2] := edtConta2.Text;
    DadosConta.ChaveContas[3] := edtConta3.Text;
    DadosConta.ChaveContas[4] := edtConta4.Text;
    DadosConta.ChaveContas[5] := edtConta5.Text;
    DadosConta.ChaveContas[6] := edtConta6.Text;

    DadosConta.PathArqDescarga := dePathDescarga.Directory;
    DadosConta.PercAtesto := StrToFloat(edtDifAtesto.Text);
    DadosConta.UsarProxy := chxUsarProxy.Checked;
    DadosConta.PathBase := EmptyStr ; // edtPathExp.EditValue;
    DadosConta.TimerProcInterno := edtTempo.EditValue;
    DadosConta.Log := chxLog.Checked;
    DadosConta.EnviarNotifiAtesto := chxEnviarNota.Checked;

    if VarIsNull(edtIniLeitura.EditValue) then
      DadosConta.DatIniLeituraDescargaWS := 0
    else
      DadosConta.DatIniLeituraDescargaWS := edtIniLeitura.EditValue;
    // Dados Proxy
    DadosConta.DadosProxy.Host := edtProxyUrl.Text;
    DadosConta.DadosProxy.Porta := edtProxyPorta.Text;
    DadosConta.DadosProxy.Usuario := edtProxyUsu.Text;
    DadosConta.DadosProxy.Senha := edtProxySenha.Text;

    // Arquivos a serem gerados
    DadosConta.GeraTotvsDatasul := ckbDatasul.EditValue;
    DadosConta.GeraTotvsRm := ckbRM.EditValue;
    DadosConta.GeraMagis := ckbMagis.EditValue;
    DadosConta.GeraMeta := ckbMeta.EditValue;
    DadosConta.GeraSiga := ckbSiga.EditValue;
    DadosConta.GeraScl := ckbScl.EditValue;

    // Versao dos arquivos a serem gerados
    DadosConta.VerDatasul := cbxDatasul.EditValue;
    DadosConta.VerRm      := cbxRm.EditValue;
    DadosConta.VerMagis   := cbxMagis.EditValue;
    DadosConta.VerMeta    := cbxMeta.EditValue;
    DadosConta.VerSiga    := cbxSiga.EditValue;
    DadosConta.VerScl     := cbxScl.EditValue;

    // Diretorios de arquivos de saída
    DadosConta.PathArqDatasul := deDatasul.Directory;
    DadosConta.PathArqRm := deRm.Directory;
    DadosConta.PathArqMagis := deMagis.Directory;
    DadosConta.PathArqMeta := deMeta.Directory;
    DadosConta.PathArqSiga := deSiga.Directory;
    DadosConta.PathArqScl := deScl.Directory;

    Result := True;
  end;
end;

function TVSDialogosFRM.Autenticado(SubTitulo: string): Boolean;
begin
  Result := False;
  pgcDialogos.ActivePage := tbsAut;

  Self.ActiveControl := edtUsu;

  Self.pnlTitulo.LabelCaption := 'Autenticação';

  if (SubTitulo <> EmptyStr) then
    Self.pnlTitulo.LabelCaption := Self.pnlTitulo.LabelCaption + ' :: ' + SubTitulo;

  edtSenha.Text := EmptyStr;

  Self.Visible := False;
  Self.Height := 300;
  if (Self.ShowModal = mrOk) then
  begin
    if not ((LowerCase(edtUsu.Text) = DadosConta.NomeUsuario) and
      (LowerCase(edtSenha.Text) = DadosConta.SenhaUsuario)) then
      RotinasComunsUI.Mensagem('Usuário/Senha incorretos.', 'Autenticação', BotaoOK, MensagemAviso, True);
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
  edtVersaoAp.Text := VersaoAplicativo(Application.ExeName);

  Self.Visible := False;
  Self.Height := 300;
  Self.ShowModal;
end;

function TVSDialogosFRM.InfoDadosUsuario(var Usuario: string; var Senha: string): Boolean;
begin
  pgcDialogos.ActivePage := tbsAut;

  Self.ActiveControl := edtUsu;

  Self.pnlTitulo.LabelCaption := 'Autenticação';

  Self.Visible := False;

  Result := (Self.ShowModal = mrOk);

  Usuario := edtUsu.Text;
  Senha := edtSenha.Text;
end;

procedure TVSDialogosFRM.cbxDatasulPropertiesInitPopup(Sender: TObject);
begin
 cbxDatasul.Properties.ReadOnly :=  not ckbDatasul.Checked ;
end;

procedure TVSDialogosFRM.cbxMagisPropertiesInitPopup(Sender: TObject);
begin
   cbxMagis.Properties.ReadOnly := not ckbMagis.Checked;
end;

procedure TVSDialogosFRM.cbxRmPropertiesInitPopup(Sender: TObject);
begin
 cbxRm.Properties.ReadOnly := not ckbRM.Checked;
end;

procedure TVSDialogosFRM.cbxMetaPropertiesInitPopup(Sender: TObject);
begin
 cbxMeta.Properties.ReadOnly := not ckbMeta.Checked;
end;

procedure TVSDialogosFRM.cbxSigaPropertiesInitPopup(Sender: TObject);
begin
 cbxSiga.Properties.ReadOnly := not ckbSiga.Checked;
end;

procedure TVSDialogosFRM.cbxSclPropertiesInitPopup(Sender: TObject);
begin
  cbxScl.Properties.ReadOnly := not ckbScl.Checked;
end;

end.
