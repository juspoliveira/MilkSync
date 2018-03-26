(* Template Cadastro Básico
  Autor : Evanio R. Silva
  Obs : O Dataset está representado pelo dsMaster.DataSet
        Toda a funcionalidade da tela deve ser implementada nas Actions *)
unit ufrmCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  ToolWin, ImgList, DBActns, ActnList, DB, Grids,
  DBGrids, ExtCtrls, StdCtrls, Mask, DBCtrls, DBClientActns,
  StdActns, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxLookAndFeelPainters, cxButtons, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxCommon,
  Menus, cxGridExportLink, DBClient, MidasLib, cxTextEdit, cxDBEdit, cxDBLookupComboBox,
  cxImageComboBox, cxBlobEdit, cxButtonEdit, cxContainer, cxLabel, ADODB,
  JvExControls, JvComponent, JvGradientHeaderPanel, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinSilver, dxSkinStardust,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, dxPScxGrid6Lnk, JvExComCtrls, JvToolBar, ComCtrls,
  cxLookAndFeels, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPScxPageControlProducer, dxSkinsdxBarPainter;
  
type
  TCoresControles = array of TColor;

  TfrmCadastro = class(TForm)
    acManutencao: TActionList;
    acFirst: TAction;
    acPrior: TAction;
    acNext: TAction;
    acLast: TAction;
    acInsertAntigo: TDataSetInsert;
    acDelete: TDataSetDelete;
    dsMaster: TDataSource;
    acPesquisar: TAction;
    acImprimir: TAction;
    pgcManutencao: TPageControl;
    tabsCadastro: TTabSheet;
    tabsPesquisa: TTabSheet;
    acVisualizacao: TAction;
    acFiltro: TAction;
    pnlMaster: TPanel;
    acApply: TClientDataSetApply;
    acPost: TDataSetPost;
    acSalvar: TAction;
    acTotalReg: TAction;
    acPreparaFiltro: TAction;
    stsbManutencao: TStatusBar;
    acFechar: TAction;
    acCancel: TAction;
    acPesqLookup: TAction;
    acConfirmacao: TAction;
    grdMaster: TcxGrid;
    grdMasterView: TcxGridDBTableView;
    grdMasterLevel: TcxGridLevel;
    strMaster: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    acHelp: TAction;
    prtMaster: TdxComponentPrinter;
    prtMasterLink: TdxGridReportLink;
    pmnExportacao: TPopupMenu;
    acExportarHTML: TAction;
    acExportarTXT: TAction;
    ExportarHTML1: TMenuItem;
    acSalvarExp: TFileSaveAs;
    acExportarExcel: TAction;
    acExportarXML: TAction;
    acFirstGrid: TAction;
    acPriorGrid: TAction;
    acNextGrid: TAction;
    acLastGrid: TAction;
    tbCadastro: TJvToolBar;
    tbInserir: TcxButton;
    tbGravar: TcxButton;
    tbCancelar: TcxButton;
    tbExcluir: TcxButton;
    tbFiltrar: TcxButton;
    tbPrimeiro: TcxButton;
    tbAnterior: TcxButton;
    tbProximo: TcxButton;
    tbUltimo: TcxButton;
    tbImprimir: TcxButton;
    tbAjuda: TcxButton;
    tbFechar: TcxButton;
    tbNovaPesq: TcxButton;
    pnlCabecalho: TJvGradientHeaderPanel;
    ExportarHTML2: TMenuItem;
    ExportarTXT2: TMenuItem;
    ExportarExcel2: TMenuItem;
    ExportarXML2: TMenuItem;
    imlCadastro: TImageList;
    Image1: TImage;
    acInsert: TAction;
    procedure acFiltroExecute(Sender: TObject);
    procedure acVisualizacaoExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acDeleteExecute(Sender: TObject);
    procedure acSalvarExecute(Sender: TObject);
    procedure acManutencaoUpdate(Action: TBasicAction;
      var Handled: Boolean);
    procedure acPreparaFiltroExecute(Sender: TObject);
    procedure acInsertAntigoExecute(Sender: TObject);
    procedure acHelpExecute(Sender: TObject);
    procedure acExportarTXTExecute(Sender: TObject);
    procedure acExportarHTMLExecute(Sender: TObject);
    procedure acExportarExcelExecute(Sender: TObject);
    procedure acExportarXMLExecute(Sender: TObject);
    procedure acImprimirExecute(Sender: TObject);
    procedure acFecharExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dsMasterStateChange(Sender: TObject);
    procedure grdMasterViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure grdMasterViewDataControllerFilterChanged(Sender: TObject);
    procedure grdMasterViewDataControllerGroupingChanged(Sender: TObject);
    procedure acFirstGridExecute(Sender: TObject);
    procedure acPriorGridExecute(Sender: TObject);
    procedure acNextGridExecute(Sender: TObject);
    procedure acLastGridExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure acFirstExecute(Sender: TObject);
    procedure acPriorExecute(Sender: TObject);
    procedure acNextExecute(Sender: TObject);
    procedure acLastExecute(Sender: TObject);
    procedure acInsertExecute(Sender: TObject);

  private
    FRelatorio: string;
    FCriterioFiltro: Boolean;
    FstlCamposSoLeitura: TStringList;
    FFiltroAnterior: string;
    FFiltroAtivo: Boolean;
    FCoresControles: TCoresControles;
    FValidarCoresControles: Boolean;
    FPreparaPesquisa: Boolean;
    procedure BindColunsGrid;
    procedure SetarAcaoAtual;
    procedure VoltarEstadoEdicaoCampos;
    procedure SetStatusFiltro(const Value: Boolean);
    procedure SalvarCoresOriginaisControles;

  public
    GetDados: procedure(Filtro: string = '') of object;
    SetDados: procedure of object;
    procedure RepesquisarDados(AplicarFiltroAnterior: Boolean = False);
    procedure SetarTotalRegistros;
    procedure DestacarControlesSomenteLeitura;
    procedure EsconderTitulo;
    property Relatorio: string read FRelatorio write FRelatorio;
    property CriterioFiltro: Boolean read FCriterioFiltro write FCriterioFiltro default False;
    property FiltroAtivo: Boolean read FFiltroAtivo write SetStatusFiltro;
    property PreparaPesquisa: Boolean read FPreparaPesquisa write FPreparaPesquisa;
    property CoresOriginaisControles: TCoresControles read FCoresControles write FCoresControles;
    property ValidarCoresControles: Boolean read FValidarCoresControles write FValidarCoresControles;
    property FiltroAnterior: string read FFiltroAnterior write FFiltroAnterior;
  end;

var
  frmCadastro: TfrmCadastro;

implementation

uses uRotinasComuns, uConstantesComuns;

{$R *.dfm}
{Modo Visualização}

procedure TfrmCadastro.acVisualizacaoExecute(Sender: TObject);
begin
  if pgcManutencao.ActivePage = tabsPesquisa then
    pgcManutencao.ActivePage := tabsCadastro
  else
    pgcManutencao.ActivePage := tabsPesquisa;
end;
{Libera Memória Form/Verifica Dados Pendente Gravação}

procedure TfrmCadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (acSalvar.Enabled) and (MessageDlg('Deseja salvar as alterações ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    acSalvar.Execute;
  Action := caFree;
  FstlCamposSoLeitura.Free;
end;
{Deletar}

procedure TfrmCadastro.acDeleteExecute(Sender: TObject);
begin
  {Aplica Alterações}
  if MessageDlg('Confirma Exclusão do Registro ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dsMaster.DataSet.Delete;
    if Assigned(SetDados) then
      SetDados;
    RepesquisarDados(True);
  end;
end;
{Salvar}

procedure TfrmCadastro.acSalvarExecute(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    SelectNext(Screen.ActiveControl, True, True);
    // Salva Alterações Pendentes em Cache
    if (dsMaster.DataSet.State in dsEditModes) then
      dsMaster.DataSet.Post;
    // Salva Dados
    if Assigned(SetDados) then
      SetDados;
    // Repesquisa
    RepesquisarDados;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadastro.acCancelExecute(Sender: TObject);
begin
  if (TClientDataSet(dsMaster.DataSet).UpdateStatus = usModified) then
    TClientDataSet(dsMaster.DataSet).RevertRecord
  else
    dsMaster.DataSet.Cancel;
end;

{Controla Estado Actions}

procedure TfrmCadastro.acManutencaoUpdate(Action: TBasicAction;
  var Handled: Boolean);
var
  FlgNavegacao: Boolean;
begin
  if Assigned(dsMaster) and Assigned(dsMaster.DataSet) then
  begin

    // Salvar
    acSalvar.Enabled := ((dsMaster.DataSet.State in [dsEdit, dsInsert]) or ((TClientDataSet(dsMaster.DataSet).Active) and
      (TClientDataSet(dsMaster.DataSet).ChangeCount > 0))) and (not FPreparaPesquisa);
    // Novo
    acInsert.Enabled := not (acSalvar.Enabled);

    // Cancelar
    acCancel.Enabled := ((dsMaster.DataSet.State in dsEditModes) or ((TClientDataSet(dsMaster.DataSet).Active) and
      (TClientDataSet(dsMaster.DataSet).UpdateStatus = usModified))) and (not FPreparaPesquisa);

    // Visualizar
    acVisualizacao.Enabled := (dsMaster.DataSet.State = dsBrowse);

    // Destaca Campos Somente Leitura
    if FValidarCoresControles then
      DestacarControlesSomenteLeitura;

    // Ações Navegação
    if pgcManutencao.ActivePage = tabsPesquisa then
    begin
      acFirstGrid.Enabled := (not grdMasterView.DataController.IsBOF);
      acNextGrid.Enabled := (not grdMasterView.DataController.IsEOF);
      acLastGrid.Enabled := (not grdMasterView.DataController.IsEOF);
      acPriorGrid.Enabled := (not grdMasterView.DataController.IsBOF);

      if Assigned(tbPrimeiro.Action) then
        tbPrimeiro.Action := acFirstGrid;
      if Assigned(tbAnterior.Action) then
        tbAnterior.Action := acPriorGrid;
      if Assigned(tbProximo.Action) then
        tbProximo.Action := acNextGrid;
      if Assigned(tbUltimo.Action) then
        tbUltimo.Action := acLastGrid;
    end
    else
    begin
      // Estado Navegação
      FlgNavegacao := (dsMaster.DataSet.Active) and (dsMaster.DataSet.RecordCount > 1);
      acFirst.Enabled := FlgNavegacao and (dsMaster.DataSet.RecNo > 1);
      acPrior.Enabled := FlgNavegacao and (dsMaster.DataSet.RecNo > 1);
      acLast.Enabled := FlgNavegacao and (dsMaster.DataSet.RecNo < dsMaster.DataSet.RecordCount);
      acNext.Enabled := FlgNavegacao and (dsMaster.DataSet.RecNo < dsMaster.DataSet.RecordCount);

      if Assigned(tbPrimeiro.Action) then
        tbPrimeiro.Action := acFirst;
      if Assigned(tbAnterior.Action) then
        tbAnterior.Action := acPrior;
      if Assigned(tbProximo.Action) then
        tbProximo.Action := acNext;
      if Assigned(tbUltimo.Action) then
        tbUltimo.Action := acLast;
    end;
  end;
end;

procedure TfrmCadastro.acFiltroExecute(Sender: TObject);
var
  i: Integer;
  Campo: TField;
  CmdTxtWhereFiltro,
    NomeCampo,
    ValorCampo: string;
begin
  Screen.Cursor := crHourGlass;
  // WorkAround :  Erro Estouro Índice cxGrid
  dsMaster.DataSet.DisableControls;
  try
    ActiveControl := nil;

    CmdTxtWhereFiltro := EmptyStr;

    for i := 0 to dsMaster.DataSet.Fields.Count - 1 do
    begin

      Campo := dsMaster.DataSet.Fields[i];
      {Nome Campo}
      if Campo.Origin <> EmptyStr then
        NomeCampo := Campo.Origin
      else
        NomeCampo := Campo.FieldName;

      if (not Campo.IsNull) and (Campo.ClassName <> 'TDataSetField') and
        (Campo.FieldKind <> fkCalculated) and (Campo.FieldKind <> fkInternalCalc) and
        (not Campo.ReadOnly) and (pfInWhere in Campo.ProviderFlags) and (Campo.Visible) and (Campo.Tag = 0) then
      begin
        if Campo.DataType = ftDateTime then
          CmdTxtWhereFiltro := CmdTxtWhereFiltro + Format(' and %s between %s and %s ',
            [NomeCampo, QuotedStr(FormatDateTime('yyyy-mm-dd 00:00:00', Campo.Value)),
            QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss',
            StrToDateTime(Format('%s 23:59:59', [Copy(Campo.AsString, 1, 10)]))))])
        else if Campo.FieldKind = fkLookup then
        begin
          {Nome Campo Lookup}
          if (dsMaster.DataSet.Fields.FindField(Campo.KeyFields).Origin <> EmptyStr) then
            NomeCampo := dsMaster.DataSet.Fields.FindField(Campo.KeyFields).Origin
          else
            NomeCampo := Campo.KeyFields;

          if not (dsMaster.DataSet.Fields.FindField(Campo.KeyFields).IsNull) then
            CmdTxtWhereFiltro := CmdTxtWhereFiltro + Format(' and %s = %s ',
              [NomeCampo, QuotedStr(dsMaster.DataSet.Fields.FindField(Campo.KeyFields).AsString)])
        end
        else if (Campo.DataType = ftBCD) then
        begin
          ValorCampo := StringReplace(Campo.AsString, ',', '.', []);
          CmdTxtWhereFiltro := CmdTxtWhereFiltro + Format(' and %s = %s ', [NomeCampo, ValorCampo]);
        end
        else if (Campo.DataType <> ftString) then
        begin
          ValorCampo := StringReplace(Campo.AsString, ',', '.', []);
          CmdTxtWhereFiltro := CmdTxtWhereFiltro + Format(' and %s = %s ',
            [NomeCampo, QuotedStr(ValorCampo)]);
        end
        else
          CmdTxtWhereFiltro := CmdTxtWhereFiltro + Format(' and %s Like %s ',
            [NomeCampo, QuotedStr('%' + Campo.AsString + '%')])
      end;
    end;

    // Verifica Critério Filtro
    if (CmdTxtWhereFiltro = EmptyStr) and (FCriterioFiltro) then
    begin
      MessageDlg('Favor informar critério para pesquisa', mtInformation, [mbOk], 0);
      Abort;
    end;

    if Assigned(GetDados) then
      GetDados(CmdTxtWhereFiltro);

    // Notifica Filtro Ativo
    if (CmdTxtWhereFiltro <> EmptyStr) then
      SetStatusFiltro(True);

    // Total de Registros
    SetarTotalRegistros;

    // Volta Estado Edição Campos
    VoltarEstadoEdicaoCampos;

    // Guarda Filtro Anterior
    FFiltroAnterior := CmdTxtWhereFiltro;

    // Notifica Desabilitação Botões Salvar e Cancelar
    FPreparaPesquisa := False;

    // Tabs Pesquisa
    //pgcManutencao.ActivePage := tabsPesquisa;

  finally
    dsMaster.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadastro.acPreparaFiltroExecute(Sender: TObject);
var
  i: Integer;
begin
  // Notifica Desabilitação Botões Salvar e Cancelar
  FPreparaPesquisa := True;

  SelectNext(Screen.ActiveControl, True, True);
  // Verifica Dados Pendente Gravação
  if (dsMaster.DataSet.Modified) and (acSalvar.Enabled) and (MessageDlg('Deseja salvar as alterações ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    acSalvar.Execute;

  // Notifica Status Filtro
  SetStatusFiltro(False);

  if (pgcManutencao.ActivePage <> tabsCadastro) and (tabsCadastro.Enabled) then
    pgcManutencao.ActivePage := tabsCadastro;

  // Cancela alterações
  if dsMaster.DataSet.State in dsEditModes then
    dsMaster.DataSet.Cancel;

  TClientDataSet(dsMaster.DataSet).EmptyDataSet;
  dsMaster.DataSet.Insert;
  dsMaster.DataSet.ClearFields;

  FstlCamposSoLeitura.Clear;
  // Adiciona na Lista Campos Read-Only
  for i := 0 to dsMaster.DataSet.FieldCount - 1 do
  begin
    if dsMaster.DataSet.Fields[i].ReadOnly then
    begin
      FstlCamposSoLeitura.Add(dsMaster.DataSet.Fields[i].FieldName);
      dsMaster.DataSet.Fields[i].ReadOnly := False;
    end;
  end;

  // Limpa Filtro Anterior
  FFiltroAnterior := EmptyStr;
  // Limpa Filtro Grid
  grdMasterView.DataController.Filter.Clear;

  // Total Reg.
  SetarTotalRegistros;

end;

procedure TfrmCadastro.acInsertAntigoExecute(Sender: TObject);
begin
  if (dsMaster.DataSet.State in dsEditModes) then
    dsMaster.DataSet.Cancel;

  SetStatusFiltro(False);
  if (pgcManutencao.ActivePage <> tabsCadastro) and (tabsCadastro.Enabled) then
    pgcManutencao.ActivePage := tabsCadastro;
  dsMaster.DataSet.Append;

  // Estado Edição Campos
  VoltarEstadoEdicaoCampos;

  // Limpa Filtro Anterior
  FFiltroAnterior := EmptyStr;

  // Notifica Desabilitação Botões Salvar e Cancelar
  FPreparaPesquisa := False;

  // Mostra Ação Atual
  SetarAcaoAtual;
end;

procedure TfrmCadastro.acInsertExecute(Sender: TObject);
begin
  if (dsMaster.DataSet.State in dsEditModes) then
    dsMaster.DataSet.Cancel;

  SetStatusFiltro(False);
  if (pgcManutencao.ActivePage <> tabsCadastro) and (tabsCadastro.Enabled) then
    pgcManutencao.ActivePage := tabsCadastro;
  dsMaster.DataSet.Append;

  // Estado Edição Campos
  VoltarEstadoEdicaoCampos;

  // Limpa Filtro Anterior
  FFiltroAnterior := EmptyStr;

  // Notifica Desabilitação Botões Salvar e Cancelar
  FPreparaPesquisa := False;

  // Mostra Ação Atual
  SetarAcaoAtual;
end;

procedure TfrmCadastro.BindColunsGrid;
begin
  // Cria Colunas Grid
  if Assigned(dsMaster.DataSet) and (grdMasterView.ColumnCount = 0) then
  begin
    grdMasterView.DataController.CreateAllItems;
    grdMasterView.DataController.KeyFieldNames := dsMaster.DataSet.Fields[0].FieldName;
  end;
end;

procedure TfrmCadastro.acHelpExecute(Sender: TObject);
begin
  ExibeHelp(HelpKeyword);
end;

procedure TfrmCadastro.acExportarTXTExecute(Sender: TObject);
begin
  if acSalvarExp.Execute then
    ExportGridToText(acSalvarExp.Dialog.FileName, grdMaster, True, True);
end;

procedure TfrmCadastro.acExportarHTMLExecute(Sender: TObject);
begin
  if acSalvarExp.Execute then
    ExportGridToHTML(acSalvarExp.Dialog.FileName, grdMaster);
end;

procedure TfrmCadastro.acExportarExcelExecute(Sender: TObject);
begin
  if acSalvarExp.Execute then
    ExportGridToExcel(acSalvarExp.Dialog.FileName, grdMaster, True, True);
end;

procedure TfrmCadastro.acExportarXMLExecute(Sender: TObject);
begin
  if acSalvarExp.Execute then
    ExportGridToXML(acSalvarExp.Dialog.FileName, grdMaster, True, True);
end;

procedure TfrmCadastro.acImprimirExecute(Sender: TObject);
begin
  prtMasterLink.Preview(True);
end;

procedure TfrmCadastro.acFecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastro.FormShow(Sender: TObject);
begin
  // Montar Colunas Grid
  BindColunsGrid;

  // Setar Títlo => Caption
  pnlCabecalho.LabelCaption := UpperCase(Self.Caption);
end;

procedure TfrmCadastro.FormCreate(Sender: TObject);
begin
  FValidarCoresControles := False;
  if tabsPesquisa.TabVisible then
    pgcManutencao.ActivePage := tabsPesquisa;
  SetStatusFiltro(False);
  FstlCamposSoLeitura := TStringList.Create;
  FFiltroAnterior := EmptyStr;
  SetLength(FCoresControles, Self.ComponentCount);
  SalvarCoresOriginaisControles;
  FPreparaPesquisa := False;
end;
// Informa Ação Atual

procedure TfrmCadastro.SetarAcaoAtual;
begin
  if Assigned(dsMaster.DataSet) then
  begin
    if dsMaster.DataSet.State = dsEdit then
      stsbManutencao.Panels[1].Text := 'Ação : Alterando'

    else if dsMaster.DataSet.State = dsInsert then
    begin
      if (FFiltroAtivo) or (FPreparaPesquisa) then
        stsbManutencao.Panels[1].Text := 'Ação : Pesquisando'
      else
        stsbManutencao.Panels[1].Text := 'Ação : Inserindo'
    end

    else if dsMaster.DataSet.State = dsBrowse then
    begin
      stsbManutencao.Panels[1].Text := 'Ação : Exibindo';
    end;
  end;
end;

procedure TfrmCadastro.dsMasterStateChange(Sender: TObject);
begin
  // Informa Ação Atual
  SetarAcaoAtual;
end;

procedure TfrmCadastro.SetarTotalRegistros;
begin
  if Assigned(dsMaster.DataSet) and (dsMaster.DataSet.Active) then
    stsbManutencao.Panels[0].Text := Format('Total de Registros: %d', [dsMaster.DataSet.RecordCount])
  else
    stsbManutencao.Panels[0].Text := 'Total de Registros: 0';
end;

procedure TfrmCadastro.VoltarEstadoEdicaoCampos;
var
  i: integer;
begin
  if Assigned(FstlCamposSoLeitura) then
  begin
    for i := 0 to FstlCamposSoLeitura.Count - 1 do
      dsMaster.DataSet.FindField(FstlCamposSoLeitura[i]).ReadOnly := True;
  end;
end;

procedure TfrmCadastro.RepesquisarDados(AplicarFiltroAnterior: Boolean = False);
var
  FRegAnterior: Integer;
begin
  // Repesquisa Critério Anterior
  if AplicarFiltroAnterior then
  begin
    SetStatusFiltro(False);

    // Guarda Posição Reg. Anterior
    FRegAnterior := TClientDataSet(dsMaster.DataSet).Recno;

    if Assigned(GetDados) then
      GetDados(FFiltroAnterior);

    // Volta Pos. Original Reg
    if (not dsMaster.DataSet.IsEmpty) and (FRegAnterior <= TClientDataSet(dsMaster.DataSet).RecordCount) then
      TClientDataSet(dsMaster.DataSet).Recno := FRegAnterior;

    // Total de Registros
    SetarTotalRegistros;

    // Volta Estado Edição Campos
    VoltarEstadoEdicaoCampos;

    // Notifica Desabilitação Botões Salvar e Cancelar
    FPreparaPesquisa := False;
  end
  else
  begin
    // Se Provider Associado
    if (TClientDataSet(dsMaster.DataSet).ProviderName <> EmptyStr) and (Pos(FiltroAnterior, FiltroInicial) > 0) then
    begin
      // Refresh Somente se não houver Alterações => Força CancelUpdates
      if (TClientDataSet(dsMaster.DataSet).ChangeCount > 0) then
        TClientDataSet(dsMaster.DataSet).CancelUpdates;
      TClientDataSet(dsMaster.DataSet).Refresh
    end
    else  // Remontar SQL
      acFiltro.Execute;
  end;
end;

procedure TfrmCadastro.grdMasterViewCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  acVisualizacao.Execute;
end;

procedure TfrmCadastro.grdMasterViewDataControllerFilterChanged(
  Sender: TObject);
begin
  SetarTotalRegistros;

  // Notifica Filtro
  SetStatusFiltro((grdMasterView.DataController.Filter.Active) and (grdMasterView.DataController.Filter.FilterText <> EmptyStr));
end;

procedure TfrmCadastro.SetStatusFiltro(const Value: Boolean);
begin
  FFiltroAtivo := Value;

  // Notifica Interface
  if FFiltroAtivo then
    stsbManutencao.Panels[2].Text := 'Filtro Ativo'
  else
    stsbManutencao.Panels[2].Text := EmptyStr;
end;

procedure TfrmCadastro.DestacarControlesSomenteLeitura;
var
  i: Integer;
  Componente: TComponent;
begin
  // Identificar Campos Somente Leitura
  for i := 0 to Self.ComponentCount - 1 do
  begin
    // TDBEdit
    Componente := Self.Components[i];
    if (Componente is TDBEdit) then
    begin
      if ((not TDBEdit(Componente).Enabled) or (TDBEdit(Componente).ReadOnly) or (Assigned(TDBEdit(Componente).Field) and (TDBEdit(Componente).Field.ReadOnly))) then
        TDBEdit(Componente).Color := clBtnFace
      else
        TDBEdit(Componente).Color := FCoresControles[Componente.ComponentIndex];
    end
    // TcxTextEdit
    else if (Componente is TcxTextEdit) then
    begin
      if ((not TcxTextEdit(Componente).Enabled) or (TcxTextEdit(Componente).Properties.ReadOnly)) then
        TcxTextEdit(Componente).Style.Color := clBtnFace
      else
        TcxTextEdit(Componente).Style.Color := FCoresControles[Componente.ComponentIndex];
    end
      // TcxButtonEdit
    else if (Componente is TcxButtonEdit) then
    begin
      if ((not TcxButtonEdit(Componente).Enabled) or (TcxButtonEdit(Componente).Properties.ReadOnly)) then
        TcxButtonEdit(Componente).Style.Color := clBtnFace
      else
        TcxButtonEdit(Componente).Style.Color := FCoresControles[Componente.ComponentIndex];
    end
      // TcxDBTextEdit
    else if (Componente is TcxDBTextEdit) then
    begin
      if ((not TcxDBTextEdit(Componente).Enabled) or (TcxDBTextEdit(Componente).Properties.ReadOnly) or (Assigned(TcxDBTextEdit(Componente).DataBinding.DataLink.Field) and
        (TcxDBTextEdit(Componente).DataBinding.DataLink.Field.ReadOnly))) then
        TcxDBTextEdit(Componente).Style.Color := clBtnFace
      else
        TcxDBTextEdit(Componente).Style.Color := FCoresControles[Componente.ComponentIndex];
    end
      // TcxDBDateEdit
    else if (Componente is TcxDBDateEdit) then
    begin
      if ((not TcxDBDateEdit(Componente).Enabled) or (TcxDBDateEdit(Componente).Properties.ReadOnly) or (Assigned(TcxDBDateEdit(Componente).DataBinding.DataLink.Field) and
        (TcxDBDateEdit(Componente).DataBinding.DataLink.Field.ReadOnly))) then
        TcxDBDateEdit(Componente).Style.Color := clBtnFace
      else
        TcxDBDateEdit(Componente).Style.Color := FCoresControles[Componente.ComponentIndex];
    end
      // TcxDBLookupComboBox
    else if (Componente is TcxDBLookupComboBox) then
    begin
      if ((not TcxDBLookupComboBox(Componente).Enabled) or (TcxDBLookupComboBox(Componente).Properties.ReadOnly) or (Assigned(TcxDBLookupComboBox(Componente).DataBinding.DataLink.Field) and
        (TcxDBLookupComboBox(Componente).DataBinding.DataLink.Field.ReadOnly))) then
        TcxDBLookupComboBox(Componente).Style.Color := clBtnFace
      else
        TcxDBLookupComboBox(Componente).Style.Color := FCoresControles[Componente.ComponentIndex];
    end
      // TcxDBButtonEdit
    else if (Componente is TcxDBButtonEdit) then
    begin
      if ((not TcxDBButtonEdit(Componente).Enabled) or (TcxDBButtonEdit(Componente).Properties.ReadOnly) or (Assigned(TcxDBButtonEdit(Componente).DataBinding.DataLink.Field) and
        (TcxDBButtonEdit(Componente).DataBinding.DataLink.Field.ReadOnly))) then
        TcxDBButtonEdit(Componente).Style.Color := clBtnFace
      else
        TcxDBButtonEdit(Componente).Style.Color := FCoresControles[Componente.ComponentIndex];
    end
    // TcxDBImageComboBox
    else if (Componente is TcxDBImageComboBox) then
    begin
      if (dsMaster.DataSet.State = dsBrowse) then
        TcxDBImageComboBox(Componente).Style.Color := clBtnFace
      else
        TcxDBImageComboBox(Componente).Style.Color := FCoresControles[Componente.ComponentIndex];
    end    
    // TcxDBBlobEdit
    else if (Componente is TcxDBBlobEdit) then
    begin
      if (dsMaster.DataSet.State = dsBrowse) then
        TcxDBBlobEdit(Componente).Style.Color := clBtnFace
      else
        TcxDBBlobEdit(Componente).Style.Color := FCoresControles[Componente.ComponentIndex];
    end;
  end;
end;
// Salvar Cores Originais Controles

procedure TfrmCadastro.SalvarCoresOriginaisControles;
var
  i: Integer;
  Componente: TComponent;
begin
  for i := 0 to Self.ComponentCount - 1 do
  begin
    Componente := Self.Components[i];
    // TDBEdit
    if (Componente is TDBEdit) then
      FCoresControles[i] := TDBEdit(Componente).Color
    // TcxTextEdit
    else if (Componente is TcxTextEdit) then
      FCoresControles[i] := TcxTextEdit(Componente).Style.Color
    // TcxButtonEdit
    else if (Componente is TcxButtonEdit) then
      FCoresControles[i] := TcxButtonEdit(Componente).Style.Color
    // TcxDBTextEdit
    else if (Componente is TcxDBTextEdit) then
      FCoresControles[i] := TcxDBTextEdit(Componente).Style.Color
    // TcxDBLookupComboBox
    else if (Componente is TcxDBLookupComboBox) then
      FCoresControles[i] := TcxDBLookupComboBox(Componente).Style.Color
    // TcxDBDateEdit
    else if (Componente is TcxDBDateEdit) then
      FCoresControles[i] := TcxDBDateEdit(Componente).Style.Color
    // TcxDBButtonEdit
    else if (Componente is TcxDBButtonEdit) then
      FCoresControles[i] := TcxDBButtonEdit(Componente).Style.Color
    // TcxDBImageComboBox
    else if (Componente is TcxDBImageComboBox) then
      FCoresControles[i] := TcxDBImageComboBox(Componente).Style.Color
    // TcxDBBlobEdit
    else if (Componente is TcxDBBlobEdit) then
      FCoresControles[i] := TcxDBBlobEdit(Componente).Style.Color;
  end;
end;

// Reposiciona Grid após Agrupamento
procedure TfrmCadastro.grdMasterViewDataControllerGroupingChanged(
  Sender: TObject);
begin
  grdMasterView.Controller.LeftPos := 0;
end;

procedure TfrmCadastro.acFirstGridExecute(Sender: TObject);
begin
  if grdMasterView.DataController.Active then
    grdMasterView.DataController.GotoFirst;
end;

procedure TfrmCadastro.acPriorGridExecute(Sender: TObject);
begin
  if grdMasterView.DataController.Active then
    grdMasterView.DataController.GotoPrev;
end;

procedure TfrmCadastro.acNextGridExecute(Sender: TObject);
begin
  if grdMasterView.DataController.Active then
    grdMasterView.DataController.GotoNext;
end;

procedure TfrmCadastro.acLastGridExecute(Sender: TObject);
begin
  if grdMasterView.DataController.Active then
    grdMasterView.DataController.GotoLast;
end;

procedure TfrmCadastro.acFirstExecute(Sender: TObject);
begin
  dsMaster.DataSet.First;
end;

procedure TfrmCadastro.acPriorExecute(Sender: TObject);
begin
  dsMaster.DataSet.Prior;
end;

procedure TfrmCadastro.acNextExecute(Sender: TObject);
begin
  dsMaster.DataSet.Next;
end;

procedure TfrmCadastro.acLastExecute(Sender: TObject);
begin
  dsMaster.DataSet.Last;
end;

procedure TfrmCadastro.EsconderTitulo;
begin
  pnlCabecalho.Visible := False;
end;

end.

