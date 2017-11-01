unit ufrmCadastroZeos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinSilver,
  dxSkinStardust, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxPC, cxControls, ExtCtrls,
  DBCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Menus, StdActns, DBActns, DBClientActns,
  ActnList, ImgList, JvComponentBase, JvBalloonHint, ComCtrls, Buttons,
  ZDataset, ZSqlUpdate, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxContainer, cxGroupBox, JvMenus, JvExControls, JvComponent,
  JvGradientHeaderPanel, ToolWin, JvExComCtrls, JvToolBar, DBClient,
  cxLookAndFeels;


type THackDBNavigator = class(TDBNavigator);

type
  TfrmCadastroZeos = class(TForm)
    pgcMaster: TcxPageControl;
    tabsRegistro: TcxTabSheet;
    tabsGrid: TcxTabSheet;
    dsMaster: TDataSource;
    imlCadastro: TImageList;
    acManutencao: TActionList;
    acFirst: TAction;
    acPrior: TAction;
    acNext: TAction;
    acLast: TAction;
    acInsert: TDataSetInsert;
    acDelete: TDataSetDelete;
    acPesquisar: TAction;
    acImprimir: TAction;
    acVisualizacao: TAction;
    acFiltro: TAction;
    acApply: TClientDataSetApply;
    acPost: TDataSetPost;
    acSalvar: TAction;
    acTotalReg: TAction;
    acPreparaFiltro: TAction;
    acFechar: TAction;
    acCancel: TAction;
    acPesqLookup: TAction;
    acConfirmacao: TAction;
    acHelp: TAction;
    acExportarHTML: TAction;
    acExportarTXT: TAction;
    acExportarExcel: TAction;
    acExportarXML: TAction;
    acSalvarExp: TFileSaveAs;
    acFirstGrid: TAction;
    acPriorGrid: TAction;
    acNextGrid: TAction;
    acLastGrid: TAction;
    pmnExportacao: TPopupMenu;
    ExportarHTML1: TMenuItem;
    ExportarHTML2: TMenuItem;
    ExportarTXT2: TMenuItem;
    ExportarExcel2: TMenuItem;
    ExportarXML2: TMenuItem;
    grdMaster: TcxGrid;
    grdMasterView: TcxGridDBTableView;
    grdMasterLevel: TcxGridLevel;
    stsbManutencao: TStatusBar;
    htnMaster: TJvBalloonHint;
    pnlCabecalho: TJvGradientHeaderPanel;
    pmnMaster: TPopupMenu;
    Fechar1: TMenuItem;
    Image1: TImage;
    lbDescricao: TLabel;
    tbMaster: TJvToolBar;
    btnFirist: TToolButton;
    btnPrior: TToolButton;
    btnNext: TToolButton;
    btnLast: TToolButton;
    btnNew: TToolButton;
    btnDelete: TToolButton;
    btnClearFilter: TToolButton;
    btnSave: TToolButton;
    btnCancel: TToolButton;
    btnExit: TToolButton;
    btnSearch: TToolButton;
    ToolButton12: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure dsMasterStateChange(Sender: TObject);
    procedure grdMasterViewDataControllerFilterChanged(Sender: TObject);
    procedure acFiltroExecute(Sender: TObject);
    procedure acPreparaFiltroExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acInsertExecute(Sender: TObject);
    procedure acFecharExecute(Sender: TObject);
    procedure grdMasterViewDblClick(Sender: TObject);
    procedure acManutencaoUpdate(Action: TBasicAction;
      var Handled: Boolean);
    procedure acSalvarExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure acFirstExecute(Sender: TObject);
    procedure acPriorExecute(Sender: TObject);
    procedure acNextExecute(Sender: TObject);
    procedure acLastExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
  private
    {SQL Original}
    FCommandText,
    FCmdTxtSelect,
    FCmdTxtWhere,
    FCmdTxtOrderBy : String;
    FPreparaFiltro: Boolean;
    FFiltroAnterior: string;
    FPreparaPesquisa: Boolean;
    // Personaliza Navigator
    procedure SetupHackedNavigator(const Navigator : TDBNavigator;
                                 const Glyphs : TImageList);
    procedure SetCommandText(const Value: String);
    procedure SetarAcaoAtual;
  public
     GetDados: procedure(Filtro: string = '') of object;
     SetDados: procedure of object;
     procedure SetarTotalRegistros;
     property CommandText : String read FCommandText write SetCommandText;
     property PreparaFiltro: Boolean read FPreparaFiltro;
     property PreparaPesquisa: Boolean read FPreparaPesquisa write FPreparaPesquisa;
     property FiltroAnterior: string read FFiltroAnterior write FFiltroAnterior;
  end;

var
  frmCadastroZeos: TfrmCadastroZeos;

implementation

uses uGlobal, uTraducaoDevExpressBR;

{$R *.dfm}

{ TfrmCadastroFB }
// personalização da NavBar
procedure TfrmCadastroZeos.SetupHackedNavigator(
  const Navigator: TDBNavigator; const Glyphs: TImageList);
const
  Captions : array[TNavigateBtn] of string =
      ('Primeiro', 'Anterior', 'Próximo', 'Último', 'Novo',
       'Apagar', 'Editar', 'Salvar', 'Cancelar', 'Pesquisar');
(*
  Captions : array[TNavigateBtn] of string =
      ('First', 'Prior', 'Next', 'Last', 'Insert',
       'Delete', 'Edit', 'Post', 'Cancel', 'Refresh');
*)
var
  btn : TNavigateBtn;
begin
  for btn := Low(TNavigateBtn) to High(TNavigateBtn) do
  with THackDBNavigator(Navigator).Buttons[btn] do
  begin
    //from the Captions const array
    Caption := Captions[btn];

    //the number of images in the Glyph property
    NumGlyphs := 1;
    // Remove the old glyph.
    Glyph := nil;
    // Assign the custom one
    Glyphs.GetBitmap(Integer(btn),Glyph);
    // gylph above text                                    
    Layout := blGlyphTop;
    // explained later
   // OnMouseUp := HackNavMouseUp;
   if (Caption = 'Pesquisar') then
   begin
     Action := acFiltro;
   end;
   if (Caption = 'Editar') then
   begin
     Action := acPreparaFiltro;
   end;
   if (Caption = 'Novo') then
   begin
     Action := acInsert;
   end;
  end;

end;

procedure TfrmCadastroZeos.FormCreate(Sender: TObject);
begin
 lbDescricao.Caption := self.Caption ;
 FFiltroAnterior := EmptyStr;
 FPreparaPesquisa := False;
 // tradução das mensagens do grid dev
 SetResorcePortugues;
end;
// Mostra estado atual do dataset
procedure TfrmCadastroZeos.SetarAcaoAtual;
begin
 if Assigned(dsMaster.DataSet) then
  begin
    if dsMaster.State = dsBrowse then
      stsbManutencao.Panels[0].Text := Format('Total de Registros : %d', [dsMaster.DataSet.RecordCount])
    else
      stsbManutencao.Panels[0].Text := 'Total de Registros : 0';

    if dsMaster.DataSet.State = dsEdit then
      stsbManutencao.Panels[1].Text := 'Ação : Alterando'

    else if dsMaster.DataSet.State = dsInsert then
    begin
      (*
      if (FFiltroAtivo) or (FPreparaPesquisa) then
        stsbManutencao.Panels[1].Text := 'Ação : Pesquisando'
      else
      *)
        stsbManutencao.Panels[1].Text := 'Ação : Inserindo';
    end

    else if dsMaster.DataSet.State = dsBrowse then
    begin
      stsbManutencao.Panels[1].Text := 'Ação : Exibindo';
    end;
  end;
end;

procedure TfrmCadastroZeos.dsMasterStateChange(Sender: TObject);
begin
 // Informa Ação Atual
  SetarAcaoAtual;
end;

procedure TfrmCadastroZeos.SetarTotalRegistros;
begin
  if Assigned(dsMaster.DataSet) and (dsMaster.DataSet.Active) then
    stsbManutencao.Panels[0].Text := Format('Total de Registros: %d', [dsMaster.DataSet.RecordCount])
  else
    stsbManutencao.Panels[0].Text := 'Total de Registros: 0';
end;

procedure TfrmCadastroZeos.grdMasterViewDataControllerFilterChanged(
  Sender: TObject);
begin
  // Mostra Total Registros
  SetarTotalRegistros;
end;

procedure TfrmCadastroZeos.SetCommandText(const Value: String);
var
  PosWhere,
  PosOrderBy : Integer;
begin
  FCommandText := Value;

  PosWhere := Pos('WHERE', UpperCase(FCommandText));
  PosOrderBy := Pos('ORDER BY', UpperCase(FCommandText));

  FCmdTxtSelect := Copy(FCommandText, 1, PosWhere - 1);
  FCmdTxtWhere := Copy(FCommandText, PosWhere, (PosOrderBy - PosWhere));
  FCmdTxtWhere := StringReplace(FCmdTxtWhere, '1=2', '1=1', []);
  if PosOrderBy > 0 then
     FCmdTxtOrderBy := Copy(FCommandText, PosOrderBy, Length(FCommandText));

end;

procedure TfrmCadastroZeos.acFiltroExecute(Sender: TObject);
var
  i : Integer;
  Campo : TField;
  CommandTextFiltro,
  CmdTxtWhereFiltro,
  NomeCampo,
  ValorCampo : String;
  _DataInicial, _DataFinal : string;
begin

  FPreparaFiltro := False;
  ActiveControl := Nil;
  CmdTxtWhereFiltro := FCmdTxtWhere;

  for i := 0 to dsMaster.DataSet.Fields.Count - 1 do
  begin

    Campo := dsMaster.DataSet.Fields[i];
    {Nome Campo}
    if Campo.Origin <> '' then
      NomeCampo := Campo.Origin
    else
      NomeCampo := Campo.FieldName;

    if (not Campo.IsNull)  and (Campo.Visible)  and  (Campo.ClassName <> 'TDataSetField') and
       (Campo.FieldKind <> fkCalculated) and  (Campo.FieldKind <> fkInternalCalc) and (Campo.DataType <> ftBlob) and
       (Campo.DataType <> ftGraphic) and (not Campo.ReadOnly) and ((Campo.Tag = 0) or (Campo.DefaultExpression = 'X') ) and ((Campo.DefaultExpression = '') or (Campo.DefaultExpression = 'X') ) then
    begin
      if Campo.DataType in [ftDate, ftDateTime] then
        begin
           _DataInicial := FormatDateTime('yyyy-MM-dd', Campo.Value) + ' 00:00:00';
           _DataFinal := FormatDateTime('yyyy-MM-dd', Campo.Value) + ' 23:59:59';

           CmdTxtWhereFiltro := CmdTxtWhereFiltro + Format(' and %s Between %s and %s ',
          [NomeCampo, QuotedStr(_DataInicial),QuotedStr(_DataFinal)]);

         // CmdTxtWhereFiltro := CmdTxtWhereFiltro + Format(' and Cast(%s as TimeStamp) = %s ',
         // [NomeCampo, QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', Campo.Value))])
        end
      else if Campo.FieldKind = fkLookup then
      begin
        {Nome Campo Lookup}
        if (dsMaster.DataSet.Fields.FindField(Campo.KeyFields).Origin <> '') then
          NomeCampo := dsMaster.DataSet.Fields.FindField(Campo.KeyFields).Origin
        else
          NomeCampo := Campo.KeyFields;

        if not (dsMaster.DataSet.Fields.FindField(Campo.KeyFields).IsNull) then
          CmdTxtWhereFiltro := CmdTxtWhereFiltro + Format(' and %s = %s ',
            [NomeCampo, QuotedStr(dsMaster.DataSet.Fields.FindField(Campo.KeyFields).AsString)])
      end
      else if ((Campo.DataType <> ftString ) and (Campo.DataType <> ftWideString )) or (Pos('CODIGO', UpperCase(Campo.FieldName)) > 0)then
      begin
        ValorCampo := StringReplace(Campo.AsString, ',', '.', []);
        CmdTxtWhereFiltro := CmdTxtWhereFiltro + Format(' and %s = %s ',
          [NomeCampo, QuotedStr(ValorCampo)]);
      end
      else
        CmdTxtWhereFiltro := CmdTxtWhereFiltro + Format(' and UPPER(%s) Like UPPER(%s) ',
          [NomeCampo, QuotedStr('%' + AnsiLowerCase(Campo.AsString) + '%')])
    end;

  end;

  CommandTextFiltro := FCmdTxtSelect + CmdTxtWhereFiltro + FCmdTxtOrderBy;

  // Notifica Desabilitação Botões Salvar e Cancelar
   FPreparaPesquisa := False;

  dsMaster.DataSet.Close;
  TClientDataSet(dsMaster.DataSet).CommandText := CommandTextFiltro;
//  TZQuery(dsMaster.DataSet).SQL.Clear;
//  TZQuery(dsMaster.DataSet).SQL.Add (CommandTextFiltro);
  dsMaster.DataSet.Open;
  pgcMaster.ActivePage := tabsGrid;
end;

procedure TfrmCadastroZeos.acPreparaFiltroExecute(Sender: TObject);
begin
// Notifica Desabilitação Botões Salvar e Cancelar
  FPreparaPesquisa := True;
  pgcMaster.ActivePage := tabsRegistro;
  FPreparaFiltro := True;
  acFirst.Execute;
  dsMaster.DataSet.Close;
  TClientDataSet(dsMaster.DataSet).CommandText := StringReplace(FCommandText,'1=1','1=2',[rfReplaceAll]);
//  TZQuery(dsMaster.DataSet).SQL.Clear;
//  TZQuery(dsMaster.DataSet).SQL.Add (StringReplace(FCommandText,'1=1','1=2',[rfReplaceAll]));
  dsMaster.DataSet.Open;
  dsMaster.DataSet.Refresh;
end;
 // Libera o formulario
procedure TfrmCadastroZeos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;
// Inserir Novo Registro
procedure TfrmCadastroZeos.acInsertExecute(Sender: TObject);
begin
  dsMaster.DataSet.Append;
  // Limpa Filtro Anterior
  FFiltroAnterior := EmptyStr;
  pgcMaster.ActivePage := tabsRegistro;
  // Notifica Desabilitação Botões Salvar e Cancelar
  FPreparaPesquisa := False;
end;
// Fechar
procedure TfrmCadastroZeos.acFecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastroZeos.grdMasterViewDblClick(Sender: TObject);
begin
  // Duplo clique no grid leva para registro
  pgcMaster.ActivePage := tabsRegistro;
end;

procedure TfrmCadastroZeos.acManutencaoUpdate(Action: TBasicAction;
  var Handled: Boolean);
var
  FlgNavegacao: Boolean;
begin
  if Assigned(dsMaster) and Assigned(dsMaster.DataSet) then
  begin
    // Salvar
    //acSalvar.Enabled := ((dsMaster.DataSet.State in [dsEdit, dsInsert]) or ((TClientDataSet(dsMaster.DataSet).Active) and
     // (TZQuery(dsMaster.DataSet).Modified))) and (not FPreparaPesquisa);
     acSalvar.Enabled := ((dsMaster.DataSet.State in [dsEdit, dsInsert])and (not FPreparaPesquisa)) ;

    // Cancelar
    acCancel.Enabled := ((dsMaster.DataSet.State in dsEditModes) or ((TClientDataSet(dsMaster.DataSet).Active) and
      (TClientDataSet(dsMaster.DataSet).UpdateStatus = usModified))) and (not FPreparaPesquisa);

    // Visualizar
    acVisualizacao.Enabled := (dsMaster.DataSet.State = dsBrowse);

    // Ações Navegação
    if pgcMaster.ActivePage = tabsGrid then
    begin
      acFirst.Enabled := (not grdMasterView.DataController.IsBOF);
      acNext.Enabled := (not grdMasterView.DataController.IsEOF);
      acLast.Enabled := (not grdMasterView.DataController.IsEOF);
      acPrior.Enabled := (not grdMasterView.DataController.IsBOF);
              (*
      if Assigned(btnFirist.Action) then
        btnFirist.Action := acFirstGrid;
      if Assigned(btnPrior.Action) then
        btnPrior.Action := acPriorGrid;
      if Assigned(btnNext.Action) then
        btnNext.Action := acNextGrid;
      if Assigned(btnLast.Action) then
        btnLast.Action := acLastGrid;
        *)
    end
    else
    begin
      // Estado Navegação
      FlgNavegacao := (dsMaster.DataSet.Active) and (dsMaster.DataSet.RecordCount > 1);
      acFirst.Enabled := FlgNavegacao and (dsMaster.DataSet.RecNo > 1);
      acPrior.Enabled := FlgNavegacao and (dsMaster.DataSet.RecNo > 1);
      acLast.Enabled := FlgNavegacao and (dsMaster.DataSet.RecNo < dsMaster.DataSet.RecordCount);
      acNext.Enabled := FlgNavegacao and (dsMaster.DataSet.RecNo < dsMaster.DataSet.RecordCount);

      if Assigned(btnFirist.Action) then
        btnFirist.Action := acFirst;
      if Assigned(btnPrior.Action) then
        btnPrior.Action := acPrior;
      if Assigned(btnNext.Action) then
        btnNext.Action := acNext;
      if Assigned(btnLast.Action) then
        btnLast.Action := acLast;
    end;
  end;
end;
// Salvar
procedure TfrmCadastroZeos.acSalvarExecute(Sender: TObject);
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
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadastroZeos.acCancelExecute(Sender: TObject);
begin
  dsMaster.DataSet.Cancel;
end;

procedure TfrmCadastroZeos.acFirstExecute(Sender: TObject);
begin
 dsMaster.DataSet.First;
end;

procedure TfrmCadastroZeos.acPriorExecute(Sender: TObject);
begin
dsMaster.DataSet.Prior;
end;

procedure TfrmCadastroZeos.acNextExecute(Sender: TObject);
begin
 dsMaster.DataSet.Next;
end;

procedure TfrmCadastroZeos.acLastExecute(Sender: TObject);
begin
  dsMaster.DataSet.Last;
end;

procedure TfrmCadastroZeos.acDeleteExecute(Sender: TObject);
begin
{Aplica Alterações}
  if MessageDlg('Confirma Exclusão do Registro ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dsMaster.DataSet.Delete;
    if Assigned(SetDados) then
      SetDados;
  end;
end;

end.


