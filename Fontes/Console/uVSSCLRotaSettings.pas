unit uVSSCLRotaSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmCadastroZeos, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinSilver, dxSkinStardust, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  JvComponentBase, JvBalloonHint, Menus, StdActns, DBActns, DBClientActns,
  ActnList, ImgList, ComCtrls, ToolWin, JvExComCtrls, JvToolBar, StdCtrls,
  ExtCtrls, JvExControls, JvGradientHeaderPanel, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, sGroupBox, Buttons, sSpeedButton,
  sPanel, sMemo, JvToolEdit, JvExMask, Mask, sMaskEdit, sCustomComboEdit,
  sTooledit, cxDropDownEdit, cxCalendar, cxImageComboBox, cxContainer,
  cxTextEdit, cxMaskEdit, cxSpinEdit, sCheckBox, sEdit, sLabel,
  sPageControl, cxDBEdit, cxCheckBox, cxCurrencyEdit;

type
  TVSSCLRotaSettings = class(TfrmCadastroZeos)
    pgcConfig: TsPageControl;
    tsParametros: TsTabSheet;
    sGroupBox2: TsGroupBox;
    cxLabel5: TsLabel;
    cxLabel10: TsLabel;
    cxLabel9: TsLabel;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    sGroupBox3: TsGroupBox;
    cxLabel4: TsLabel;
    cxLabel6: TsLabel;
    cxLabel7: TsLabel;
    cxLabel8: TsLabel;
    sGroupBox4: TsGroupBox;
    cbxMagis: TcxDBImageComboBox;
    cbxDatasul: TcxDBImageComboBox;
    cbxRm: TcxDBImageComboBox;
    cbxMeta: TcxDBImageComboBox;
    cbxSiga: TcxDBImageComboBox;
    cbxScl: TcxDBImageComboBox;
    sGroupBox5: TsGroupBox;
    cxLabel11: TsLabel;
    sGroupBox6: TsGroupBox;
    lbl6: TsLabel;
    cxLabel3: TsLabel;
    cxLabel14: TsLabel;
    tsPathFile: TsTabSheet;
    sGroupBox7: TsGroupBox;
    lbl17: TsLabel;
    lbl1: TsLabel;
    lbl2: TsLabel;
    lbl3: TsLabel;
    lbl4: TsLabel;
    lbl5: TsLabel;
    sLabel3: TsLabel;
    deDatasul: TJvDirectoryEdit;
    deRm: TJvDirectoryEdit;
    deMagis: TJvDirectoryEdit;
    deMeta: TJvDirectoryEdit;
    deScl: TJvDirectoryEdit;
    deSiga: TJvDirectoryEdit;
    dePathDescarga: TJvDirectoryEdit;
    sGroupBox8: TsGroupBox;
    lbl8: TsLabel;
    sLabel6: TsLabel;
    deBaseCarga: TJvDirectoryEdit;
    deRetornoApi: TJvDirectoryEdit;
    tsMapas: TsTabSheet;
    pgcLigacao: TsPageControl;
    sTabSheet7: TsTabSheet;
    sGroupBox10: TsGroupBox;
    lbl22: TsLabel;
    lbl23: TsLabel;
    lbl9: TsLabel;
    lbl10: TsLabel;
    lbl15: TsLabel;
    lbl16: TsLabel;
    lbl24: TsLabel;
    lbl18: TsLabel;
    lbl19: TsLabel;
    feAnalises: TJvFilenameEdit;
    feColetores: TJvFilenameEdit;
    feExtratos: TJvFilenameEdit;
    feFazendas: TJvFilenameEdit;
    feItinerarios: TJvFilenameEdit;
    feLinhas: TJvFilenameEdit;
    feMotivos: TJvFilenameEdit;
    feProdutores: TJvFilenameEdit;
    feGrupoRotas: TJvFilenameEdit;
    tsPage2: TsTabSheet;
    sGroupBox9: TsGroupBox;
    lbl20: TsLabel;
    lbl14: TsLabel;
    lbl11: TsLabel;
    lbl13: TsLabel;
    lbl21: TsLabel;
    lbl12: TsLabel;
    feVeiculos: TJvFilenameEdit;
    feNfc: TJvFilenameEdit;
    feVinculados: TJvFilenameEdit;
    feTanques: TJvFilenameEdit;
    feRotas: TJvFilenameEdit;
    feTecnicos: TJvFilenameEdit;
    tsRegLog: TsTabSheet;
    memLog: TsMemo;
    sPanel1: TsPanel;
    btnSalvarAssoc: TsSpeedButton;
    btnExportar: TsSpeedButton;
    rgCtaAtiva: TsRadioGroup;
    edtServidor: TcxDBTextEdit;
    edtIdErp: TcxDBTextEdit;
    edtTempo: TcxDBSpinEdit;
    edtCad: TcxDBSpinEdit;
    chkCargaMultiEmpresa: TcxDBCheckBox;
    chkDropTable: TcxDBCheckBox;
    chkLog: TcxDBCheckBox;
    cxDBCheckBox1: TcxDBCheckBox;
    edtConta: TcxDBTextEdit;
    sLabel1: TsLabel;
    edtNomeEmpresa: TcxDBTextEdit;
    ckbProxy: TcxDBCheckBox;
    edtProxyUrl: TcxDBTextEdit;
    edtProxyPorta: TcxDBTextEdit;
    edtProxyUsu: TcxDBTextEdit;
    edtProxySenha: TcxDBTextEdit;
    ckbDatasul: TcxDBCheckBox;
    ckbRm: TcxDBCheckBox;
    ckbMagis: TcxDBCheckBox;
    ckbMeta: TcxDBCheckBox;
    ckbSiga: TcxDBCheckBox;
    cxDBCheckBox7: TcxDBCheckBox;
    ckbNotificaAtesto: TcxDBCheckBox;
    edtDifAtesto: TcxDBCurrencyEdit;
    edtIniLeitura: TcxDBDateEdit;
    edtUltLeitura: TcxDBDateEdit;
    cxDBCheckBox2: TcxDBCheckBox;
    grdMasterViewContaId: TcxGridDBColumn;
    grdMasterViewNomeEmpresa: TcxGridDBColumn;
    grdMasterViewKeyId: TcxGridDBColumn;
    grdMasterViewAtiva: TcxGridDBColumn;
    grdMasterViewDatUltLeituraDescargaWS: TcxGridDBColumn;
    grdMasterViewPathArqDescarga: TcxGridDBColumn;
    grdMasterViewPercAtesto: TcxGridDBColumn;
    grdMasterViewHostURL: TcxGridDBColumn;
    grdMasterViewLog: TcxGridDBColumn;
    grdMasterViewProxyHost: TcxGridDBColumn;
    grdMasterViewProxyPorta: TcxGridDBColumn;
    grdMasterViewProxyUsuario: TcxGridDBColumn;
    grdMasterViewProxySenha: TcxGridDBColumn;
    grdMasterViewIntervalo: TcxGridDBColumn;
    grdMasterViewProxyUsar: TcxGridDBColumn;
    grdMasterViewEnviarNotifAtesto: TcxGridDBColumn;
    grdMasterViewDatIniLeituraDescargaWS: TcxGridDBColumn;
    grdMasterViewGeraTotvsDatasul: TcxGridDBColumn;
    grdMasterViewGeraTotvsRm: TcxGridDBColumn;
    grdMasterViewGeraMagis: TcxGridDBColumn;
    grdMasterViewGeraMeta: TcxGridDBColumn;
    grdMasterViewGeraSiga: TcxGridDBColumn;
    grdMasterViewVerDatasul: TcxGridDBColumn;
    grdMasterViewVerRm: TcxGridDBColumn;
    grdMasterViewVerMagis: TcxGridDBColumn;
    grdMasterViewVerMeta: TcxGridDBColumn;
    grdMasterViewVerSiga: TcxGridDBColumn;
    grdMasterViewGeraScl: TcxGridDBColumn;
    grdMasterViewVerScl: TcxGridDBColumn;
    grdMasterViewPathArqDatasul: TcxGridDBColumn;
    grdMasterViewPathArqRm: TcxGridDBColumn;
    grdMasterViewPathArqMagis: TcxGridDBColumn;
    grdMasterViewPathArqMeta: TcxGridDBColumn;
    grdMasterViewPathArqSiga: TcxGridDBColumn;
    grdMasterViewPathArqScl: TcxGridDBColumn;
    grdMasterViewParContaId1: TcxGridDBColumn;
    grdMasterViewPathArqCarga: TcxGridDBColumn;
    grdMasterViewIntervaloCarga: TcxGridDBColumn;
    grdMasterViewCargaMultiEmpresa: TcxGridDBColumn;
    grdMasterViewPathCargaApi: TcxGridDBColumn;
    grdMasterViewDropTable: TcxGridDBColumn;
    grdMasterViewParColetasHoje: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure acInsertExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VSSCLRotaSettings: TVSSCLRotaSettings;

implementation

uses
   uVSSCLSettingsDTM;

{$R *.dfm}

procedure TVSSCLRotaSettings.FormCreate(Sender: TObject);
begin
  inherited;
  VSSCLSettingsDTM := TVSSCLSettingsDTM.Create(self);
  dsMaster.DataSet := VSSCLSettingsDTM.cdsContas;
  GetDados := VSSCLSettingsDTM.PesquisarContas;
  SetDados := VSSCLSettingsDTM.SalvarContas;
  CommandText := VSSCLSettingsDTM.qryContas.SQL.Text;
 end;

procedure TVSSCLRotaSettings.acInsertExecute(Sender: TObject);
begin
  inherited;
  VSSCLSettingsDTM.InserirValoresDefault;
  edtNomeEmpresa.SetFocus;
end;

end.
