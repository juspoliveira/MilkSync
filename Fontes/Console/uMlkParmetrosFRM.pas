unit uMlkParmetrosFRM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmCadastro, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, Menus, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxPageControlProducer, dxSkinsdxBarPainter, ImgList, dxPSCore,
  dxPScxCommon, dxPScxGrid6Lnk, StdActns, DBActns, DBClientActns, ActnList,
  ExtCtrls, JvExControls, JvGradientHeaderPanel, StdCtrls, cxButtons, ToolWin,
  ComCtrls, JvExComCtrls, JvToolBar, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxContainer, cxCheckBox, cxDBEdit, cxMaskEdit, cxSpinEdit, cxTextEdit,
  cxDropDownEdit, cxImageComboBox, cxCurrencyEdit, cxCalendar, ShlObj,
  cxShellCommon, cxShellComboBox, cxDBShellComboBox, JvExStdCtrls, JvCombobox,
  JvDBSearchComboBox, Mask, JvExMask, JvToolEdit, JvMaskEdit, JvDBFindEdit,
  Buttons, ExtDlgs, DBCtrls, cxButtonEdit;

type
  TMlkParmetrosFRM = class(TfrmCadastro)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    cxLabel5: TLabel;
    cxLabel10: TLabel;
    cxLabel9: TLabel;
    sLabel4: TLabel;
    sLabel5: TLabel;
    sLabel1: TLabel;
    edtServidor: TcxDBTextEdit;
    edtIdErp: TcxDBTextEdit;
    edtTempo: TcxDBSpinEdit;
    edtCad: TcxDBSpinEdit;
    chkCargaMultiEmpresa: TcxDBCheckBox;
    chkDropTable: TcxDBCheckBox;
    chkLog: TcxDBCheckBox;
    ckbCtaAtiva: TcxDBCheckBox;
    edtConta: TcxDBTextEdit;
    edtNomeEmpresa: TcxDBTextEdit;
    cxLabel4: TLabel;
    cxLabel6: TLabel;
    cxLabel7: TLabel;
    cxLabel8: TLabel;
    ckbProxy: TcxDBCheckBox;
    edtProxyUrl: TcxDBTextEdit;
    edtProxyPorta: TcxDBTextEdit;
    edtProxyUsu: TcxDBTextEdit;
    edtProxySenha: TcxDBTextEdit;
    cbxMagis: TcxDBImageComboBox;
    cbxDatasul: TcxDBImageComboBox;
    cbxRm: TcxDBImageComboBox;
    cbxMeta: TcxDBImageComboBox;
    cbxSiga: TcxDBImageComboBox;
    cbxScl: TcxDBImageComboBox;
    ckbDatasul: TcxDBCheckBox;
    ckbRm: TcxDBCheckBox;
    ckbMagis: TcxDBCheckBox;
    ckbMeta: TcxDBCheckBox;
    ckbSiga: TcxDBCheckBox;
    cxDBCheckBox7: TcxDBCheckBox;
    cxLabel11: TLabel;
    ckbNotificaAtesto: TcxDBCheckBox;
    edtDifAtesto: TcxDBCurrencyEdit;
    lbl6: TLabel;
    cxLabel3: TLabel;
    cxLabel14: TLabel;
    edtIniLeitura: TcxDBDateEdit;
    edtUltLeitura: TcxDBDateEdit;
    ckbColetaHoje: TcxDBCheckBox;
    tabsArquivos: TTabSheet;
    tabsCarga: TTabSheet;
    s: TGroupBox;
    lbl1: TLabel;
    lbl17: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    sLabel3: TLabel;
    ckbPathDatasul: TcxDBShellComboBox;
    ckbPathTotsRm: TcxDBShellComboBox;
    ckbPathMagistech: TcxDBShellComboBox;
    ckbPathWebmeta: TcxDBShellComboBox;
    ckbPathSiga: TcxDBShellComboBox;
    ckbPathScl: TcxDBShellComboBox;
    ckbPathAtesto: TcxDBShellComboBox;
    GroupBox6: TGroupBox;
    sLabel6: TLabel;
    lbl8: TLabel;
    ckbPathCarga: TcxDBShellComboBox;
    ckbpathDump: TcxDBShellComboBox;
    GroupBox7: TGroupBox;
    lbl24: TLabel;
    lbl10: TLabel;
    lbl18: TLabel;
    lbl9: TLabel;
    lbl15: TLabel;
    lbl22: TLabel;
    lbl16: TLabel;
    lbl23: TLabel;
    lbl19: TLabel;
    lbl13: TLabel;
    lbl11: TLabel;
    lbl20: TLabel;
    lbl14: TLabel;
    lbl21: TLabel;
    lbl12: TLabel;
    btnMapRota: TSpeedButton;
    acFindFile: TAction;
    opdFindFile: TOpenTextFileDialog;
    btnMapColetor: TSpeedButton;
    btnMapExtrato: TSpeedButton;
    btnMapFazenda: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    btnMapItinerario: TSpeedButton;
    btnMapLinha: TSpeedButton;
    btnMapMotivo: TSpeedButton;
    btnMapProdutor: TSpeedButton;
    btnMatGrupoRota: TSpeedButton;
    btnMapTanque: TSpeedButton;
    btnMapVinculado: TSpeedButton;
    btnMapVeiculo: TSpeedButton;
    btnMapTag: TSpeedButton;
    btnMapTecnico: TSpeedButton;
    edtMapColetor: TcxDBTextEdit;
    edtMapExtrato: TcxDBTextEdit;
    edtMapRota: TcxDBTextEdit;
    edtMapTecnico: TcxDBTextEdit;
    edtMapFazenda: TcxDBTextEdit;
    edtMapItinerario: TcxDBTextEdit;
    edtMapLInha: TcxDBTextEdit;
    edtMapMotivo: TcxDBTextEdit;
    edtMapProdutor: TcxDBTextEdit;
    edtMapGrupoRota: TcxDBTextEdit;
    edtMapTanque: TcxDBTextEdit;
    edtMapVinculado: TcxDBTextEdit;
    edtMapVeiculo: TcxDBTextEdit;
    edtMapTag: TcxDBTextEdit;
    edtMapAnalise: TcxDBTextEdit;
    btnMapAnalise: TSpeedButton;
    grdMasterViewNomeEmpresa: TcxGridDBColumn;
    grdMasterViewContaId: TcxGridDBColumn;
    grdMasterViewKeyId: TcxGridDBColumn;
    grdMasterViewAtiva: TcxGridDBColumn;
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
    grdMasterViewDatIniLeituraDescargaWS: TcxGridDBColumn;
    grdMasterViewDatUltLeituraDescargaWS: TcxGridDBColumn;
    grdMasterViewEnviarNotifAtesto: TcxGridDBColumn;
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
    grdMasterViewPathMapRota: TcxGridDBColumn;
    grdMasterViewPatMapColetor: TcxGridDBColumn;
    grdMasterViewPatMapAnalise: TcxGridDBColumn;
    grdMasterViewPatMapExtrato: TcxGridDBColumn;
    grdMasterViewPatMapFazenda: TcxGridDBColumn;
    grdMasterViewPatMapItinerario: TcxGridDBColumn;
    grdMasterViewPatMapLinha: TcxGridDBColumn;
    grdMasterViewPatMapMotivo: TcxGridDBColumn;
    grdMasterViewPatMapProdutor: TcxGridDBColumn;
    grdMasterViewPatMapGrupoRota: TcxGridDBColumn;
    grdMasterViewPatMapTanque: TcxGridDBColumn;
    grdMasterViewPatMapTag: TcxGridDBColumn;
    grdMasterViewPatMapTecnico: TcxGridDBColumn;
    grdMasterViewPatMapVinculado: TcxGridDBColumn;
    grdMasterViewPatMapVeiculo: TcxGridDBColumn;
    grdMasterViewSync: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure acInsertExecute(Sender: TObject);
    procedure acFindFileExecute(Sender: TObject);
    procedure btnMapRotaClick(Sender: TObject);
    procedure btnMapColetorClick(Sender: TObject);
    procedure btnMapAnaliseClick(Sender: TObject);
    procedure btnMapExtratoClick(Sender: TObject);
    procedure btnMapFazendaClick(Sender: TObject);
    procedure btnMapItinerarioClick(Sender: TObject);
    procedure btnMapLinhaClick(Sender: TObject);
    procedure btnMapMotivoClick(Sender: TObject);
    procedure btnMapProdutorClick(Sender: TObject);
    procedure btnMatGrupoRotaClick(Sender: TObject);
    procedure btnMapTanqueClick(Sender: TObject);
    procedure btnMapVinculadoClick(Sender: TObject);
    procedure btnMapVeiculoClick(Sender: TObject);
    procedure btnMapTagClick(Sender: TObject);
    procedure btnMapTecnicoClick(Sender: TObject);
    procedure acSalvarExecute(Sender: TObject);
    procedure acManutencaoUpdate(Action: TBasicAction; var Handled: Boolean);
  
  private
    whoOpenFileFinder : Integer;
    procedure RunFileFinder(whoOpened: integer);
    function ValidarArquivoMapa(aContaId:Integer;aFile,aTabela: string): Boolean;
    function ValidarAssociacao:Boolean;
  public
    { Public declarations }
  end;

var
  MlkParmetrosFRM: TMlkParmetrosFRM;

implementation

uses
  uMlkPrincipalDTM, uConstantesComuns, uVSSCLRotaComum;

{$R *.dfm}
// Localiza arquivo de mapa de carga e salva no componente
procedure TMlkParmetrosFRM.acFindFileExecute(Sender: TObject);
begin
  inherited;

  opdFindFile.Execute;
  if opdFindFile.FileName <> EmptyStr then
  begin
    case whoOpenFileFinder of
      1:
      begin
        edtMapAnalise.SetFocus;
        edtMapAnalise.EditValue := opdFindFile.FileName;
        edtMapAnalise.PostEditValue;
      end;
      2:
      begin
        edtMapColetor.SetFocus;
        edtMapColetor.EditValue := opdFindFile.FileName;
        edtMapColetor.PostEditValue;
      end;
      3:
      begin
        edtMapExtrato.SetFocus;
        edtMapExtrato.EditValue := opdFindFile.FileName;
        edtMapExtrato.PostEditValue;
      end;
      4:
      begin
        edtMapFazenda.SetFocus;
        edtMapFazenda.EditValue := opdFindFile.FileName;
        edtMapFazenda.PostEditValue;
      end;
      5:
      begin
        edtMapItinerario.SetFocus;
        edtMapItinerario.EditValue := opdFindFile.FileName;
        edtMapItinerario.PostEditValue;
      end;
      6:
      begin
        edtMapLInha.SetFocus;
        edtMapLInha.EditValue := opdFindFile.FileName;
        edtMapLInha.PostEditValue;
      end;
      7:
      begin
        edtMapMotivo.SetFocus;
        edtMapMotivo.EditValue := opdFindFile.FileName;
        edtMapMotivo.PostEditValue;
      end;
      8:
      begin
        edtMapProdutor.SetFocus;
        edtMapProdutor.EditValue := opdFindFile.FileName;
        edtMapProdutor.PostEditValue;
      end;
      9:
      begin
        edtMapGrupoRota.SetFocus;
        edtMapGrupoRota.EditValue := opdFindFile.FileName;
        edtMapGrupoRota.PostEditValue;
      end;
      10:
      begin
        edtMapTanque.SetFocus;
        edtMapTanque.EditValue := opdFindFile.FileName;
        edtMapTanque.PostEditValue;
      end;
      11:
      begin
        edtMapVinculado.SetFocus;
        edtMapVinculado.EditValue := opdFindFile.FileName;
        edtMapVinculado.PostEditValue;
      end;
      12:
      begin
        edtMapVeiculo.SetFocus;
        edtMapVeiculo.EditValue := opdFindFile.FileName;
        edtMapVeiculo.PostEditValue;
      end;
      13:
      begin
        edtMapTag.SetFocus;
        edtMapTag.EditValue := opdFindFile.FileName;
        edtMapTag.PostEditValue;
      end;
      14:
      begin
        edtMapRota.SetFocus;
        edtMapRota.EditValue := opdFindFile.FileName;
        edtMapRota.PostEditValue;
      end;
      15:
      begin
        edtMapTecnico.SetFocus;
        edtMapTecnico.EditValue := opdFindFile.FileName;
        edtMapTecnico.PostEditValue;
      end;
    end;
  end;
end;

procedure TMlkParmetrosFRM.acInsertExecute(Sender: TObject);
begin
  inherited;
  MlkPrincipalDTM.InserirVlrDefaultConta;
  ActiveControl := edtNomeEmpresa;
end;

procedure TMlkParmetrosFRM.acManutencaoUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  inherited;
  if Assigned(dsMaster) then
  begin
    if not (dsMaster.DataSet.State in dsEditModes)  then
    begin
      if  (edtNomeEmpresa.Text <> pnlCabecalho.LabelCaption) then
      begin
        pnlCabecalho.LabelCaption := edtNomeEmpresa.Text
      end;
    end
    else
      pnlCabecalho.LabelCaption := EmptyStr;
  end;
end;

procedure TMlkParmetrosFRM.acSalvarExecute(Sender: TObject);
begin
  // Valida a associacao dos mapas antes de salvar os dados
  if not (ValidarAssociacao) then
    Abort;
  inherited;
end;

procedure TMlkParmetrosFRM.btnMapAnaliseClick(Sender: TObject);
begin
  inherited;
  RunFileFinder(1); // Analise
end;

procedure TMlkParmetrosFRM.btnMapColetorClick(Sender: TObject);
begin
  inherited;
  RunFileFinder(2); // Coletor
end;

procedure TMlkParmetrosFRM.btnMapExtratoClick(Sender: TObject);
begin
  inherited;
   RunFileFinder(3);// Extrato
end;

procedure TMlkParmetrosFRM.btnMapFazendaClick(Sender: TObject);
begin
  inherited;
  RunFileFinder(4); // Fazenda
end;

procedure TMlkParmetrosFRM.btnMapItinerarioClick(Sender: TObject);
begin
  inherited;
  RunFileFinder(5);     // Itinerario
end;

procedure TMlkParmetrosFRM.btnMapLinhaClick(Sender: TObject);
begin
  inherited;
  RunFileFinder(6); // Linha
end;

procedure TMlkParmetrosFRM.btnMapMotivoClick(Sender: TObject);
begin
  inherited;
  RunFileFinder(7); // Motivos Cancelamento
end;

procedure TMlkParmetrosFRM.btnMapProdutorClick(Sender: TObject);
begin
  inherited;
  RunFileFinder(8); // Produtores
end;

procedure TMlkParmetrosFRM.btnMapRotaClick(Sender: TObject);
begin
  inherited;
  RunFileFinder(14);  // Rota;
end;

procedure TMlkParmetrosFRM.btnMapTagClick(Sender: TObject);
begin
  inherited;
  RunFileFinder(13)  // Tags
end;

procedure TMlkParmetrosFRM.btnMapTanqueClick(Sender: TObject);
begin
  inherited;
  RunFileFinder(10); // Tanques
end;

procedure TMlkParmetrosFRM.btnMapTecnicoClick(Sender: TObject);
begin
  inherited;
  RunFileFinder(15); // Tecnicos
end;

procedure TMlkParmetrosFRM.btnMapVeiculoClick(Sender: TObject);
begin
  inherited;
  RunFileFinder(12); // Veiculos
end;

procedure TMlkParmetrosFRM.btnMapVinculadoClick(Sender: TObject);
begin
  inherited;
  RunFileFinder(11); // Tanques Vinculados
end;

procedure TMlkParmetrosFRM.btnMatGrupoRotaClick(Sender: TObject);
begin
  inherited;
  RunFileFinder(9); // Grupo Rota
end;

procedure TMlkParmetrosFRM.FormCreate(Sender: TObject);
begin
  inherited;
   GetDados := MlkPrincipalDTM.PesquisarConta;
   SetDados := MlkPrincipalDTM.SalvarConta;
   MlkPrincipalDTM.PesquisarConta(FiltroInicial);
end;

// Executa acao de localizacao dos arquivos de mapa
procedure TMlkParmetrosFRM.RunFileFinder(whoOpened: integer);
begin
  whoOpenFileFinder := whoOpened;
  acFindFile.Execute;
end;
// Valida o arquivo de mapra de carga com a conta ativa
function TMlkParmetrosFRM.ValidarArquivoMapa(aContaId:Integer; aFile, aTabela: string): Boolean;
var
  _ArqOrgem, _TabelaDestino, _Separador, _TipoArquivo, _ChaveObrigatoria, _ChaveConta : string;
begin
  try
    Result := True;
    if FileExists(aFile) then
    begin
      LeIni(_TabelaDestino,aFile,'DESTINO','Tabela');
      LeIni(_ChaveConta,aFile,'CONTA','ChaveConta');

      if (  IntToStr(aContaId) <> _ChaveConta) then
      begin
        ShowMessage('Arquivo carregado da tabela [ '+ aTabela +' ], não pertence a conta ativa : Conta Arquivo( '+ _ChaveConta + ' )' +
        ' Conta Ativa : ( ' + InttoStr(aContaId)+ ' )');
        Result := False;
      end;
      if _TabelaDestino <> aTabela then
      begin
         ShowMessage('Arquivo carregado não é da tabela : ' + aTabela);
        Result := False;
      end;
    end
    else
      ShowMessage('Arquivo associado à tabela : '+ aTabela + ' - ' + aFile + ', não localizado, verifique !');
  finally
    ;
  end;

end;
// Valida a associacao dos mapas de importacao de dados para OWebService
function TMlkParmetrosFRM.ValidarAssociacao: Boolean;
var
  _Conta : Integer;
begin
  _Conta := StrToInt(edtConta.Text);
  Result := True;
   if (edtMapAnalise.Text <> EmptyStr) then
  begin
    if not ValidarArquivoMapa(_Conta,edtMapAnalise.Text, 'Analise') then
    begin
      Result := False;
      Abort;
    end;
  end;
  if (edtMapColetor.Text <> EmptyStr) then
  begin
    if not ValidarArquivoMapa(_Conta,edtMapColetor.Text, 'Coletor') then
    begin
      Result := False;
      Abort;
    end;
  end;
  if (edtMapExtrato.Text <> EmptyStr) then
  begin
    if not ValidarArquivoMapa(_Conta,edtMapExtrato.Text, 'Extrato') then
    begin
      Result := False;
      Abort;
    end;
  end;
  if (edtMapFazenda.Text <> EmptyStr) then
  begin
    if not ValidarArquivoMapa(_Conta,edtMapFazenda.Text, 'Fazenda') then
    begin
      Result := False;
      Abort;
    end;
  end;
  if (edtMapItinerario.Text <> EmptyStr) then
  begin
    if not ValidarArquivoMapa(_Conta,edtMapItinerario.Text, 'Itinerario') then
    begin
      Result := False;
      Abort;
    end;
  end;
  if (edtMapLInha.Text <> EmptyStr) then
  begin
    if not ValidarArquivoMapa(_Conta,edtMapLInha.Text, 'Linha') then
    begin
      Result := False;
      Abort;
    end;
  end;
  if (edtMapMotivo.Text <> EmptyStr) then
  begin
    if not ValidarArquivoMapa(_Conta,edtMapMotivo.Text, 'MotivoClto') then
    begin
      Result := False;
      Abort;
    end;
  end;
  if (edtMapProdutor.Text <> EmptyStr) then
  begin
    if not ValidarArquivoMapa(_Conta,edtMapProdutor.Text, 'Produtor') then
    begin
      Result := False;
      Abort;
    end;
  end;
  if (edtMapGrupoRota.Text <> EmptyStr) then
  begin
    if not ValidarArquivoMapa(_Conta,edtMapGrupoRota.Text, 'grupo_rota') then
    begin
      Result := False;
      Abort;
    end;
  end;
  if (edtMapRota.Text <> EmptyStr) then
  begin
    if not ValidarArquivoMapa(_Conta,edtMapRota.Text, 'Rota') then
    begin
      Result := False;
      Abort;
    end;
  end;
  if (edtMapTecnico.Text <> EmptyStr) then
  begin
    if not ValidarArquivoMapa(_Conta,edtMapTecnico.Text, 'Tecnico') then
    begin
      Result := False;
      Abort;
    end;
  end;
  if (edtMapTanque.Text <> EmptyStr) then
  begin
    if not ValidarArquivoMapa(_Conta,edtMapTanque.Text, 'Tanque') then
    begin
      Result := False;
      Abort;
    end;
  end;
  if (edtMapVinculado.Text <> EmptyStr) then
  begin
    if not ValidarArquivoMapa(_Conta,edtMapVinculado.Text, 'tanque_vinculado') then
    begin
      Result := False;
      Abort;
    end;
  end;
  if (edtMapTag.Text <> EmptyStr) then
  begin
    if not ValidarArquivoMapa(_Conta,edtMapTag.Text, 'Tag') then
    begin
      Result := False;
      Abort;
    end;
  end;
  if (edtMapVeiculo.Text <> EmptyStr) then
  begin
    if not ValidarArquivoMapa(_Conta,edtMapVeiculo.Text, 'Veiculo') then
    begin
      Result := False;
      Abort;
    end;
  end;
end;

end.
