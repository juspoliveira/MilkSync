unit uMlkPrincipalDTM;

interface

uses
  SysUtils, Classes, DB, ADODB,Forms,uConexao, Messages, Dialogs, Provider,
  uS2SQLDataSet, DBClient, uConstantesComuns, Variants, JvScheduledEvents,
  ExtCtrls, JvAppInst, uVSSCLRotaComum, uJSON;


type
  TMlkPrincipalDTM = class(TDataModule)
    cnnMaster: TADOConnection;
    dspContas: TDataSetProvider;
    qryContas: TADOQuery;
    cdsContas: TClientDataSet;
    sqlContas: TS2SQLDataSet;
    cdsContasId: TAutoIncField;
    cdsContasNomeEmpresa: TStringField;
    cdsContasContaId: TIntegerField;
    cdsContasKeyId: TStringField;
    cdsContasAtiva: TStringField;
    cdsContasPathArqDescarga: TStringField;
    cdsContasPercAtesto: TFloatField;
    cdsContasHostURL: TStringField;
    cdsContasLog: TStringField;
    cdsContasProxyHost: TStringField;
    cdsContasProxyPorta: TStringField;
    cdsContasProxyUsuario: TStringField;
    cdsContasProxySenha: TStringField;
    cdsContasIntervalo: TFloatField;
    cdsContasProxyUsar: TStringField;
    cdsContasEnviarNotifAtesto: TStringField;
    cdsContasGeraTotvsDatasul: TStringField;
    cdsContasGeraTotvsRm: TStringField;
    cdsContasGeraMagis: TStringField;
    cdsContasGeraMeta: TStringField;
    cdsContasGeraSiga: TStringField;
    cdsContasVerDatasul: TStringField;
    cdsContasVerRm: TStringField;
    cdsContasVerMagis: TStringField;
    cdsContasVerMeta: TStringField;
    cdsContasVerSiga: TStringField;
    cdsContasGeraScl: TStringField;
    cdsContasVerScl: TStringField;
    cdsContasPathArqDatasul: TStringField;
    cdsContasPathArqRm: TStringField;
    cdsContasPathArqMagis: TStringField;
    cdsContasPathArqMeta: TStringField;
    cdsContasPathArqSiga: TStringField;
    cdsContasPathArqScl: TStringField;
    cdsContasParContaId1: TIntegerField;
    cdsContasPathArqCarga: TStringField;
    cdsContasIntervaloCarga: TFloatField;
    cdsContasCargaMultiEmpresa: TStringField;
    cdsContasPathCargaApi: TStringField;
    cdsContasDropTable: TStringField;
    cdsContasParColetasHoje: TStringField;
    cdsContasPathMapRota: TStringField;
    cdsContasPatMapColetor: TStringField;
    cdsContasPatMapAnalise: TStringField;
    cdsContasPatMapExtrato: TStringField;
    cdsContasPatMapFazenda: TStringField;
    cdsContasPatMapItinerario: TStringField;
    cdsContasPatMapLinha: TStringField;
    cdsContasPatMapMotivo: TStringField;
    cdsContasPatMapProdutor: TStringField;
    cdsContasPatMapGrupoRota: TStringField;
    cdsContasPatMapTanque: TStringField;
    cdsContasPatMapTag: TStringField;
    cdsContasPatMapTecnico: TStringField;
    cdsContasPatMapVinculado: TStringField;
    cdsContasPatMapVeiculo: TStringField;
    apiConsole: TJvAppInstances;
    tmrConsole: TTimer;
    sheConsole: TJvScheduledEvents;
    tmrSync: TTimer;
    qryViagem: TADOQuery;
    qryDescarga: TADOQuery;
    dspViagem: TDataSetProvider;
    dspDescarga: TDataSetProvider;
    cdsViagem: TClientDataSet;
    cdsDescarga: TClientDataSet;
    cdsViagemLovId: TAutoIncField;
    cdsViagemLovRotaId: TIntegerField;
    cdsViagemLovRotaCod: TStringField;
    cdsViagemLovEnviaNotif: TStringField;
    cdsViagemLovDataProc: TWideStringField;
    cdsViagemLovDifColeta: TFloatField;
    cdsViagemLovQtdeDescarga: TIntegerField;
    cdsViagemLovViagemId: TIntegerField;
    cdsViagemLovGerDatasul: TStringField;
    cdsViagemLovGerRm: TStringField;
    cdsViagemLovGerMagis: TStringField;
    cdsViagemLovGerMeta: TStringField;
    cdsViagemLovGerSiga: TStringField;
    cdsViagemLovColetor: TStringField;
    cdsViagemLovVeiculo: TStringField;
    cdsViagemLovDataViagem: TWideStringField;
    cdsViagemLovGerScl: TStringField;
    cdsViagemLovIndex: TIntegerField;
    cdsDescargaLodId: TAutoIncField;
    cdsDescargaLodDescargaId: TIntegerField;
    cdsDescargaLodRotaId: TIntegerField;
    cdsDescargaLodRotaCod: TStringField;
    cdsDescargaLodEnviaNota: TStringField;
    cdsDescargaLodDataProc: TWideStringField;
    cdsDescargaLodDifColeta: TFloatField;
    qrySql: TADOQuery;
    cdsContasSync: TStringField;
    cdsContasDatUltLeituraDescargaWS: TDateTimeField;
    cdsContasDatIniLeituraDescargaWS: TDateTimeField;
    qryControle: TADOQuery;
    dspControle: TDataSetProvider;
    cdsControle: TClientDataSet;
    cdsControleId: TAutoIncField;
    cdsControleIntervalo: TIntegerField;
    cdsControleIntervalocarga: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsContasBeforePost(DataSet: TDataSet);
    procedure tmrConsoleTimer(Sender: TObject);
    procedure tmrSyncTimer(Sender: TObject);

    function getServerData: Boolean;

  private
    FStrConexao: string;
    FConexaoBD: TConexao;
    FStatusTmrSync: string;
    FStatusTmrConsole: string;
    function IsContaInserted(Codigo: Integer): Boolean;
    function ResetSync: Boolean;

  public
    ShowStatusTmr:  procedure of object;
    property StatusTmrSync: string read FStatusTmrSync write FStatusTmrSync ;
    property StatusTmrConsole: string read FStatusTmrConsole write FStatusTmrConsole ;
    procedure PesquisarConta(Filtro: string);
    procedure SalvarConta;
    procedure InserirVlrDefaultConta;

    procedure SalvarControle;

    procedure SelectAllRecordsConta;
    procedure ExportarDescargas(ContaId: Integer; DataProcIni, DataProcFim : TDateTime;PersistirLog: Boolean = True);
    function GetDescargas(ContaId: Integer; DataInicio, DataTermino: TDateTime; FlgAtualizaUltDataLeitura: Boolean = False; PersistirLog: Boolean = True): string;

  end;

var
  MlkPrincipalDTM: TMlkPrincipalDTM;
  // Pesquisa Banco de dados
  FSQL: string;
  Fresultado: Variant;
implementation

uses
  uGlobal;


{$R *.dfm}
// Valida digitacao dados da conta

procedure TMlkPrincipalDTM.cdsContasBeforePost(DataSet: TDataSet);
begin
  if cdsContas.State in [dsInsert] then
  begin
    if IsContaInserted(cdsContasContaId.Value) then
      MostraMsgErro('Codigo da conta ja inserido no Banco de Dados !');
  end;

  If (cdsContasHostURL.Value = EmptyStr) then
     MostraMsgErro('URI do Servidor e obrigatoria !');
  if (cdsContasContaId.Value <= 0) then
    MostraMsgErro('Por favor, preencha o ID da Conta !');
  if (cdsContasIntervalo.Value <= 0) then
    MostraMsgErro('Informe o intervalo de consulta dos dados no servidor !');
  if (cdsContasIntervaloCarga.Value <= 0) then
    MostraMsgErro('Informe o Intervalo de atualizacao dos dados cadastrais!');
  if (cdsContasProxyUsar.Value = FlagSim ) then
  begin
    if (cdsContasProxyHost.Value = EmptyStr) then
      MostraMsgErro('Informe o endereco do  servidor Proxy ');
    if (cdsContasProxyPorta.Value = EmptyStr) then
      MostraMsgErro('Informe a porta do Proxy');
    if (cdsContasProxyUsuario.Value = EmptyStr) then
      MostraMsgErro('Informe o nome do usuario Proxy');
    if (cdsContasProxySenha.Value = EmptyStr) then
      MostraMsgErro('Informe a senha de acesso ao servidor Proxy');
  end;
end;

procedure TMlkPrincipalDTM.DataModuleCreate(Sender: TObject);
var
  strConfig: TStringList;
begin
  strConfig := TStringList.Create;
  try
    strConfig.LoadFromFile(ExtractFilePath(Application.ExeName) + 'MilkSync.ini');
    FStrConexao := strConfig.Values['ConexaoBD'];
  finally
    strConfig.Free;
  end;
  try
    cnnMaster.Connected := False;

    cnnMaster.ConnectionString := FStrConexao;
    cnnMaster.Connected := True;

    // Ativa Datasets
    cdsControle.Open;
    cdsContas.Open;

    // Instancia da conex~ao
    FConexaoBD := TConexao.Create(FStrConexao);

    // Seta timers de sincronizacao e geracao de arquivos
    tmrSync.Interval := (cdsControleIntervalocarga.AsInteger * 1000);
    tmrConsole.Interval := (cdsControleIntervalo.AsInteger * 1000);
    tmrSync.Enabled := True;
    tmrConsole.Enabled := True;
    FStatusTmrSync := TmrHabilitado;
    FStatusTmrConsole := TmrHabilitado;

    if Assigned(ShowStatusTmr) then
      ShowStatusTmr;

  except
    ShowMessage('Falha so se conectar ao banco de dados, verifique !');
    Application.Terminate;
  end;

end;
// Exporta dados das descarga - Atesto e gera arquuivo
procedure TMlkPrincipalDTM.ExportarDescargas(ContaId: Integer; DataProcIni, DataProcFim : TDateTime ;PersistirLog: Boolean);
begin
  InserirMsgLog('Início Get Descargas.');
  try
     GetDescargas(ContaId, DataProcIni, DataProcFim, False, PersistirLog);
    InserirMsgLog('Término Get Descargas');
  except on E:Exception do
    InserirMsgLog('ERRO : ' + E.Message);
  end;

end;
// Gera arquivos de descarga
function TMlkPrincipalDTM.GetDescargas(ContaId:Integer; DataInicio, DataTermino: TDateTime;
  FlgAtualizaUltDataLeitura, PersistirLog: Boolean): string;
var
  DadosRetornoDescarga: TDadosRetorno;
  DadosRetornoViagem: TDadosRetorno;
  IdDescarga: Integer;
  i, j: Integer;
  ColecaoDescarga, ColecaoViagem: TJSONArray;
  Descarga, Viagem: TJSONObject;
  DifQtdeColeta: Double;
  FlgGerarArq: Boolean;
  FlgExisteDescarga: Boolean;
  ArquivoDados: TStringList;
  DataInicioStr, DataTerminoStr: string;
  ObjViagem: TViagem;
  ListaViagem: TListaViagem;
  DatAultColeta: TDateTime;

  function GetViagem(Id: Integer): TJSONObject;
  var
    i: Integer;
  begin
    Result := nil;
    for i := 0 to ColecaoViagem.length - 1 do
    begin
      Viagem := ColecaoViagem.getJSONObject(i);

      if Viagem.getInt('id') = Id then
      begin
        Result := Viagem;
        break;
      end;
    end;
  end;

  function DescargaJahProcessada(IdDescarga: Integer): Boolean;
  begin
    qrySQL.Close;
    qrySQL.SQL.Text := 'SELECT 1 FROM LogDescarga WHERE LodDescargaId = :LodDescargaId';
    qrySQL.Parameters.ParamByName('LodDescargaId').Value := IdDescarga;
    qrySQL.Open;

    Result := not qrySQL.IsEmpty;
  end;

  function ViagemJahProcessada(IdViagem: Integer): Boolean;
  begin
    qrySQL.Close;
    qrySQL.SQL.Text := 'SELECT 1 FROM LogViagem WHERE LovViagemId = :Id and LovGerDatasul = :LovGerDatasul';
    qrySQL.Parameters.ParamByName('Id').Value := IdViagem;
    qrySQL.Parameters.ParamByName('LovGerDatasul').Value := FlagSim;
    qrySQL.Open;

    Result := not qrySQL.IsEmpty;
  end;

  function ViagemJahRegistrada(idViagem: Integer): TViagem;
  begin
    Result := TViagem.Create;
    qrySQL.Close;
    qrySQL.SQL.Text := 'Select * from LogViagem WHERE LovViagemId = :Id';
    qrySQL.Parameters.ParamByName('Id').Value := idViagem;
    qrySQL.Open;
    if not qrySQL.IsEmpty then
    begin
      Result.Id := qrySQL.FieldByName('LovViagemId').AsInteger;
      Result.RotaId := qrySQL.FieldByName('LovRotaId').AsInteger;
      Result.RotaCodigo := qrySQL.FieldByName('LovRotaCod').AsString;
      Result.DatAbertura := qrySQL.FieldByName('LovDataViagem').AsDateTime;
      Result.Liberada := True; // qrySQL.FieldByName('Liberada').AsBoolean;
      Result.GerouDatasul := qrySQL.FieldByName('LovGerDatasul').AsString;
      Result.GerouRm := qrySQL.FieldByName('LovGerRm').AsString;
      Result.GerouMagis := qrySQL.FieldByName('LovGerMagis').AsString;
      Result.GerouMeta := qrySQL.FieldByName('LovGerMeta').AsString;
      Result.GerouSiga := qrySQL.FieldByName('LovGerSiga').AsString;
      Result.GerouScl := qrySQL.FieldByName('LovGerScl').AsString;
      Result.Registrada := True;
    end
    else
    begin
      Result.GerouDatasul := FlagNao;
      Result.GerouRm := FlagNao;
      Result.GerouMagis := FlagNao;
      Result.GerouMeta := FlagNao;
      Result.GerouSiga := FlagNao;
      Result.GerouScl := FlagNao;
      Result.Liberada := False;
      Result.Registrada := False;
    end;
  end;


begin
  try
    DataInicioStr := FormatDateTime('YYYY-MM-dd', DataInicio);
    DataTerminoStr := FormatDateTime('YYYY-MM-dd', DataTermino);
    FlgGerarArq := False;
    DadosRetornoDescarga := readDescarga(ContaId, DataInicioStr, DataTerminoStr);
    DadosRetornoViagem := readViagem(ContaId, DataInicioStr, DataTerminoStr);
    ColecaoDescarga := TJSONArray.Create(DadosRetornoDescarga.Dados);
    ColecaoViagem := TJSONArray.Create(DadosRetornoViagem.Dados);
    ListaViagem := TListaViagem.Create;
    try
      if DadosRetornoDescarga.Sucesso then
      begin
        // Loop Dados Viagem
        for i := 0 to ColecaoViagem.Length - 1 do
        begin
          Viagem := ColecaoViagem.getJSONObject(i);
          if ViagemJahProcessada(Viagem.getInt('id')) then
          begin
            FreeAndNil(Viagem);
            Continue;
          end;
          // Nova Instância
          // ObjViagem := TViagem.Create;
          ObjViagem := ViagemJahRegistrada(Viagem.getInt('id'));
          try
            ObjViagem.Id := Viagem.getInt('id');
            ObjViagem.Liberada := (Viagem.getInt('liberada') = 1);
            for j := 0 to ColecaoDescarga.Length - 1 do
            begin
              Descarga := ColecaoDescarga.getJSONObject(j);
              DatAultColeta := GetData(Descarga.getString('dt_descarga'));
              // Ignora Descarga que não pertence à viagem
              if (Descarga.getInt('viagem_id') <> ObjViagem.Id) or (not ObjViagem.Liberada) then  //Somente Viagens Liberadas
                Continue;

              {Dados Viagem}
              ObjViagem.RotaId := Viagem.getInt('rota_id');
              ObjViagem.RotaCodigo := Viagem.getString('rota');
              // Sumarizar
              Inc(ObjViagem.QtdeDescargas);
              ObjViagem.QtdeColetado := ObjViagem.QtdeColetado + Descarga.getInt('qtd_coletado');
              ObjViagem.QtdeArmazenado := ObjViagem.QtdeArmazenado + Descarga.getInt('qtd_armazenado');
              if (DatAultColeta > ObjViagem.DatUltColeta) then
                ObjViagem.DatUltColeta := DatAultColeta;
              ObjViagem.DatAbertura := GetData(Viagem.getString('dt_abertura'));
            end;

            // Arquivo
            if ObjViagem.QtdeDescargas > 0 then
            begin
              // Persistir
              ObjViagem.GerouDatasul := FlagSim;
              ObjViagem.Registrada := True;
              if PersistirLog then
                PersistirLogViagem(ObjViagem);
              // Arquivo
              GerarArquivoViagem(ObjViagem);
              // Empilha Viagem
              ListaViagem.Add(ObjViagem);
            end;
          finally
            ObjViagem.Free;
          end;
        end; //Loop Dados Viagem

        (*
          ATUALIAR A ULTIMA DATA DE LEITURA NO CDSCONTA AQUI....
        *)

        //Atualizar Parâmetros
        if FlgAtualizaUltDataLeitura then
       //   AtualizarDatLeituraParam(DataTermino);
      end; //DadosRetornoDescarga.Sucesso
    finally
      while ListaViagem.Count > 0 do
        ListaViagem.Delete(0);
      ListaViagem.Free;
    end;

    if FlgGerarArq then
      Result := 'Sucesso:: Arquivo Gerado'
    else
      Result := 'Sucesso:: Nenhum Arquivo Gerado';
  except
    on E: Exception do
      Result := 'Erro: ' + E.message;
  end;


end;
// Comunica com servidor MilksRota e gerar arquivos
function TMlkPrincipalDTM.getServerData: Boolean;
var
  dtInicio, dtFim : TDateTime;
begin
  try
    // Seta status
    FStatusTmrConsole := TmrAtivo;
    if Assigned(ShowStatusTmr) then
      ShowStatusTmr;

    // Reseta status de sincronizacaode todas as contas
    if not ResetSync then
      Abort;
    // Seleciona todas as contas cadastradas
    SelectAllRecordsConta;
    cdsContas.First;

    // gera os arquivos de cada conta
    while not (cdsContas.Eof) do
    begin
      // Nao gerar arquivos se a conta estiver inativa
      if (cdsContasAtiva.AsString = FlagNao) then
      begin
        cdsContas.Next;
        Continue;
      end;

      // Periodo de geracao dos arquivos
      dtInicio := cdsContasDatIniLeituraDescargaWS.Value;;
      if (cdsContasParColetasHoje.Value = FlagSim) then
        dtFim := Date()
      else
        dtFim := (Date() -1);

      // Dados da conta
      DadosConta.HostURL := cdsContasHostURL.Value;
      DadosConta.IdConta := IntToStr(cdsContasContaId.Value);
      DadosConta.Log := (cdsContasLog.Value = FlagSim);
      DadosConta.PathArqDatasul := cdsContasPathArqDatasul.Value;
      DadosConta.PathArqCarga := cdsContasPathArqCarga.Value;
      DadosConta.PathArqDescarga := cdsContasPathArqDescarga.Value;


      // Totvs Datasul
      if (cdsContasGeraTotvsDatasul.AsString = FlagSim) then
      begin
        ExportarDescargas(cdsContasContaId.Value,dtInicio, dtFim);
      end;

      cdsContas.Next;
    end;
  finally
    FStatusTmrConsole := TmrInativo;
    if Assigned(ShowStatusTmr) then
      ShowStatusTmr;
  end;
end;

// Dados default do arquivo de contas
procedure TMlkPrincipalDTM.InserirVlrDefaultConta;
begin
  if cdsContas.State in [dsInsert] then
  begin
    cdsContasHostURL.Value := 'http://app.sclrota.com.br/api/retaguardasync/';
    cdsContasAtiva.Value := FlagSim;
    cdsContasIntervalo.Value := 45;
    cdsContasIntervaloCarga.Value := 180;
    cdsContasDatIniLeituraDescargaWS.Value := Date;
    cdsContasDatUltLeituraDescargaWS.Value := Date;
    cdsContasParColetasHoje.Value := FlagSim;
    cdsContasSync.Value := FlagNao;

  end;
end;

function TMlkPrincipalDTM.IsContaInserted(Codigo: Integer): Boolean;
begin
  FSQL := 'Select Id from Contas where contaId = :p1';
  FResultado := FConexaoBD.ExecutarValor(FSQL, [Codigo]);
  Result := not VarIsNull(FResultado);
end;

procedure TMlkPrincipalDTM.PesquisarConta(Filtro: string);
begin
  cdsContas.Close;
  sqlContas.Filtro := Filtro;
  cdsContas.Open;
end;

function TMlkPrincipalDTM.ResetSync: Boolean;
begin
  try
    FSQL := 'Update contas set sync = :p1' ;
    FConexaoBD.ExecutarComando(FSQL,[FlagNao]);
    Result := True;
  except
    Result := False;
  end;
end;

procedure TMlkPrincipalDTM.SalvarConta;
begin
   cdsContas.ApplyUpdates(-1);
   cdsContas.Refresh;
end;
// Salvar Controle
procedure TMlkPrincipalDTM.SalvarControle;
begin
  cdsControle.ApplyUpdates(-1);
  cdsControle.Refresh;
end;

procedure TMlkPrincipalDTM.SelectAllRecordsConta;
begin
  FResultado := '1=2';
  FSQL := StringReplace(sqlContas.SQL.Text, FResultado, '1=1', []);
  qryContas.SQL.Clear;
  qryContas.SQL.Add(FSQL);
  qryContas.Open;
  cdsContas.Refresh;
end;

// Gera Arquivos
procedure TMlkPrincipalDTM.tmrConsoleTimer(Sender: TObject);
var
  dtInicio, dtFim : TDateTime;
begin
 // getServerData();
end;

procedure TMlkPrincipalDTM.tmrSyncTimer(Sender: TObject);
begin
   FStatusTmrSync := TmrAtivo;
end;

end.
