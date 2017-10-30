unit uVSSCLRotaComum;

interface

uses
  Windows, Messages, SysUtils, Classes, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, uJSON,
  JvStrings, JvScheduledEvents, IdMultiPartFormData, IdSNTP, DBClient, variants, DB ;

type

  TDadosProxy = record
    Host: string;
    Porta: string;
    Usuario: string;
    Senha: string;
  end;

  TDadosConta = record
    HostURL,
    IdConta: string;
    ChaveContas: array [1..6] of string;
    IdConta1: string;
    IdConta2: string;
    IdConta3: string;
    IdConta4: string;
    IdConta5: string;
    IdConta6: string;
    DatIniLeituraDescargaWS: TDateTime;
    DatUltLeituraDescargaWS: TDateTime;
    PathArqDatasul: string;
    PathArqRm: string;
    PathArqMagis: string;
    PathArqMeta: string;
    PathArqSiga: string;
    PathArqScl: string;
    PathArqDescarga: string;
    PercAtesto: Double;
    UsarProxy: Boolean;
    PathBase: string;
    TimerProcInterno: Integer;
    Versao: string;
    Log: Boolean;
    NomeUsuario,
    SenhaUsuario: string;
    EnviarNotifiAtesto: Boolean;
    DadosProxy: TDadosProxy;
    GeraTotvsDatasul : string[1];
    GeraTotvsRm : string[1];
    GeraMagis : string[1];
    GeraMeta : string[1];
    GeraSiga : string[1];
    GeraScl : string[1];
    VerDatasul : string[1];
    VerRm : string[1];
    VerMagis : string[1];
    VerMeta : string[1];
    VerSiga : string[1];
    VerScl : string[1];
  end;

  TDadosRetorno = record
    Metodo: string;
    Sucesso: Boolean;
    Mensagem: string;
    Dados: string;
    ToString: string;
    Excecao: Boolean;
    MsgExcecao: string;
    Parametros: string;
  end;

  TStatusConta = (scAtivo, scInativo, scInterrompido, scAtualizando);

procedure PopularDadosConta(cdsPar: TDataSet);
function RetornoMetodoWSPOST(URL: string; Parametros: TStringList): string;
function RetornoMetodoWSGET(URL: string): string;
function PostMetodoJSON(URL: string; Parametros: TStringList): TDadosRetorno;

// Chamadas REST
procedure AjustarHora;
function readDescarga(DataInicio, DataTermino: string): TDadosRetorno;
function readViagem(DataInicio, DataTermino: string): TDadosRetorno;
function sendNotificacaoRota(CodRota, Mensagem: string): TDadosRetorno;
function MakeParConsulta(aContaId: string;aDataInicio, aDataFinal:TDateTime; aSync: string; metodo: string; aComunitario:string = '9'): TDadosRetorno;

// Auxiliares
function InserirMsgLog(Msg: string): string;
function GetDadosContaStr: string;
function BooleanToStr(Valor: Boolean): string;

var
  DadosConta: TDadosConta;
  FSQL : string;
  FResultado: Variant;

const
  IdInfoRegProxyEscrever = 1;
  IdInfoRegProxyDesabEdicao = 2;
  IdInfoRegProxyRemover = 3;
  TamanhoMaxArqLog = 1000;
  ComandoSincronizacao = '[SINCRONIZAR]';
  ComandoAtivarRestricoes = '[ATIVAR_RESTRICOES]';
  ComandoRemoverRestricoes = '[REMOVER_RESTRICOES]';
  ComandoLiberarRestricoesTemp = '[LIBERAR_RESTRICOES_TEMP]';
  ComandoNotificarAtualizacao = '[NOTIFICAR_ATUALIZACAO_VERSAO]';
  ComandoAtualizarVersao = '[ATUALIZAR_VERSAO]';
  FlagSim = 'S';
  FlagNao = 'N';
  RetornaComunitario = '1';
  NaoRetornaComunitario = '0';

implementation

uses uRotinasComuns, Math, DateUtils;

function RetornoMetodoWSGET(URL: string): string;
var
  IdHTTP: TIdHTTP;
begin
  IdHTTP := TIdHTTP.Create(nil);
  try
    // Proxy
    IdHTTP.ProxyParams.ProxyServer := DadosConta.DadosProxy.Host;
    if DadosConta.DadosProxy.Porta <> EmptyStr then
      IdHTTP.ProxyParams.ProxyPort := StrToIntDef(DadosConta.DadosProxy.Porta, 0);
    IdHTTP.ProxyParams.ProxyPassword := DadosConta.DadosProxy.Senha;
    IdHTTP.ProxyParams.ProxyUsername := DadosConta.DadosProxy.Usuario;

    InserirMsgLog('GET ' + URL);
    Result := IdHTTP.Get(URL);
    InserirMsgLog('#GET ' + Result);
  finally
    FreeAndNil(IdHTTP);
  end;
end;

function RetornoMetodoWSPOST(URL: string; Parametros: TStringList): string;
var
  IdHTTP: TIdHTTP;
begin
  IdHTTP := TIdHTTP.Create(nil);
  try
    // Proxy
    if DadosConta.UsarProxy then
    begin
      IdHTTP.ProxyParams.ProxyServer := DadosConta.DadosProxy.Host;
      if DadosConta.DadosProxy.Porta <> EmptyStr then
        IdHTTP.ProxyParams.ProxyPort := StrToIntDef(DadosConta.DadosProxy.Porta, 0);
      IdHTTP.ProxyParams.ProxyPassword := DadosConta.DadosProxy.Senha;
      IdHTTP.ProxyParams.ProxyUsername := DadosConta.DadosProxy.Usuario;
    end;
    InserirMsgLog('POST ' + URL);
    if Assigned(Parametros) then
      InserirMsgLog(Parametros.Text);
    Result := IdHTTP.Post(URL, Parametros);
    InserirMsgLog('#POST ' + Result);
  finally
    FreeAndNil(IdHTTP);
  end;
end;

procedure PopularDadosConta(cdsPar: TDataSet);
begin
  InserirMsgLog('PopularDadosConta');
  DadosConta.NomeUsuario := 'sclrota';
  DadosConta.SenhaUsuario := 'sclrota';
  DadosConta.IdConta := cdsPar.FieldByName('ParContaId').AsString;
  DadosConta.IdConta1 := cdsPar.FieldByName('ParContaId1').AsString;
  DadosConta.IdConta2 := cdsPar.FieldByName('ParContaId2').AsString;
  DadosConta.IdConta3 := cdsPar.FieldByName('ParContaId3').AsString;
  DadosConta.IdConta4 := cdsPar.FieldByName('ParContaId4').AsString;
  DadosConta.IdConta5 := cdsPar.FieldByName('ParContaId5').AsString;
  DadosConta.IdConta6 := cdsPar.FieldByName('ParContaId6').AsString;

  // insere numero das contas em um array do objeto
  DadosConta.ChaveContas[1] := DadosConta.IdConta1;
  DadosConta.ChaveContas[2] := DadosConta.IdConta2;
  DadosConta.ChaveContas[3] := DadosConta.IdConta3;
  DadosConta.ChaveContas[4] := DadosConta.IdConta4;
  DadosConta.ChaveContas[5] := DadosConta.IdConta5;
  DadosConta.ChaveContas[6] := DadosConta.IdConta6;

  DadosConta.DatIniLeituraDescargaWS := cdsPar.FieldByName('ParDatIniLeituraDescargaWS').AsFloat;
  DadosConta.DatUltLeituraDescargaWS := cdsPar.FieldByName('ParDatUltLeituraDescargaWS').AsFloat;
  DadosConta.PathArqDescarga := cdsPar.FieldByName('ParPathArqDescarga').AsString;
  DadosConta.PercAtesto := cdsPar.FieldByName('ParPercAtesto').AsFloat;
  DadosConta.HostURL := cdsPar.FieldByName('ParHostURL').AsString;
  DadosConta.DadosProxy.Host := cdsPar.FieldByName('ParProxyHost').AsString;
  DadosConta.DadosProxy.Porta := cdsPar.FieldByName('ParProxyPorta').AsString;
  DadosConta.DadosProxy.Usuario := cdsPar.FieldByName('ParProxyUsuario').AsString;
  DadosConta.DadosProxy.Senha := cdsPar.FieldByName('ParProxySenha').AsString;
  DadosConta.UsarProxy := cdsPar.FieldByName('ParProxyUsar').AsString = 'S';
  DadosConta.PathBase := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
  DadosConta.TimerProcInterno := cdsPar.FieldByName('ParIntervalo').AsInteger; // Minutos
  DadosConta.Versao := VersaoAplicativo(ParamStr(0));
  DadosConta.Log := (cdsPar.FieldByName('ParLog').AsString = 'S');
  DadosConta.EnviarNotifiAtesto := (cdsPar.FieldByName('ParEnviarNotifAtesto').AsString = 'S');
  DadosConta.GeraTotvsDatasul := cdsPar.FieldByName('ParGeraTotvsDatasul').AsString;
  DadosConta.GeraTotvsRm := cdsPar.FieldByName('ParGeraTotvsRm').AsString;
  DadosConta.GeraMagis := cdsPar.FieldByName('ParGeraMagis').AsString;
  DadosConta.GeraMeta := cdsPar.FieldByName('ParGeraMeta').AsString;
  DadosConta.GeraSiga := cdsPar.FieldByName('ParGeraSiga').AsString;
  DadosConta.GeraScl := cdsPar.FieldByName('ParGeraScl').AsString;
  DadosConta.VerDatasul := cdsPar.FieldByName('ParVerDatasul').AsString;
  DadosConta.VerRm := cdsPar.FieldByName('ParVerRm').AsString;
  DadosConta.VerMagis := cdsPar.FieldByName('ParVerMagis').AsString;
  DadosConta.VerMeta := cdsPar.FieldByName('ParVerMeta').AsString;
  DadosConta.VerSiga := cdsPar.FieldByName('ParVerSiga').AsString;
  DadosConta.VerScl := cdsPar.FieldByName('ParVerScl').AsString;
  // Local de arquivos de saída
  DadosConta.PathArqDatasul := cdsPar.FieldByName('ParPathArqDatasul').AsString;
  DadosConta.PathArqRm := cdsPar.FieldByName('ParPathArqRm').AsString;
  DadosConta.PathArqMagis := cdsPar.FieldByName('ParPathArqMagis').AsString;
  DadosConta.PathArqMeta := cdsPar.FieldByName('ParPathArqMeta').AsString;
  DadosConta.PathArqSiga := cdsPar.FieldByName('ParPathArqSiga').AsString;
  DadosConta.PathArqScl := cdsPar.FieldByName('ParPathArqScl').AsString;
end;

function PostMetodoJSON(URL: string; Parametros: TStringList): TDadosRetorno;
var
  ValorJSON: TJSONObject;
begin
  ValorJSON := TJSONObject.Create(RetornoMetodoWSPOST(URL, Parametros));
  try
    // Retorno
    if ValorJSON.has('success') then
      Result.Sucesso := ValorJSON.getBoolean('success');

    if ValorJSON.has('message') then
      Result.Mensagem := ValorJSON.getString('message');

    if ValorJSON.has('data') then
      Result.Dados := ValorJSON.getString('data');

    Result.ToString := Format('Metodo: %s - Sucesso: %s - Mensagem: %s - Parametros: %s - Dados: %s',
      [Result.Metodo, BoolToStr(Result.Sucesso), Result.Mensagem, Result.Parametros, Result.Dados]);
  finally
    ValorJSON.Free;
  end;
end;

procedure AjustarHora;
var
  DadosRetorno: TDadosRetorno;
  DataHoraAtual: TDateTime;
  DataHoraSistema: TSystemTime;
  DadosAux: string;
  Ano,
  Mes,
  Dia,
  Hora,
  Min,
  Seg: Word;
begin
  InserirMsgLog('AjustarHora');
//  DadosRetorno := getCurrentTime;

  if DadosRetorno.Sucesso then
  begin
    DadosAux := DadosRetorno.Dados;
    Ano := StrToInt(Copy(DadosAux, 1, 4));
    Mes := StrToInt(Copy(DadosAux, 6, 2));
    Dia := StrToInt(Copy(DadosAux, 9, 2));
    Hora := StrToInt(Copy(DadosAux, 12, 2));
    Min := StrToInt(Copy(DadosAux, 15, 2));
    Seg := StrToInt(Copy(DadosAux, 18, 2));

    if TryEncodeDateTime(Ano, Mes, Dia, Hora, Min, Seg, 0, DataHoraAtual) then
    begin
      if Abs(MinutesBetween(DataHoraAtual, Now)) >= 5 then
      begin
        DateTimeToSystemTime(DataHoraAtual, DataHoraSistema);
        SetLocalTime(DataHoraSistema);
      end;
    end;
  end;
end;


function getCurrentTime: TDadosRetorno;
begin
  Result.Metodo := 'getCurrentTime';
  Result.Excecao := False;

  try
    Result := PostMetodoJSON(DadosConta.HostURL + 'getCurrentTime', nil);
  except on E:Exception do
    begin
      Result.Excecao := True;
      Result.MsgExcecao := E.message;
    end;
  end;
end;
function InserirMsgLog(Msg: string): string;
var
  ArqLog: TextFile;
  NomeArqLog: string;
begin
  Result := EmptyStr;
  if DadosConta.Log then
  begin
    NomeArqLog := ParamStr(0);
    NomeArqLog := Format('%sLog_%s.txt', [StringReplace(NomeArqLog, '.exe', EmptyStr, []),
      FormatDateTime('dd', Date)]);

    Result := NomeArqLog;

    AssignFile(ArqLog, NomeArqLog);

    try
      if not ExisteArquivo(NomeArqLog) then
        ReWrite(ArqLog);
      try
        Append(ArqLog);

        WriteLn(ArqLog, FormatDateTime('dd/MM HH:mm:ss ', now) + Msg);
      finally
        CloseFile(ArqLog);
      end;
    except
      ;
    end;
  end;
end;

function GetDadosContaStr: string;
begin
  InserirMsgLog('DadosConta ');
  InserirMsgLog('DadosConta#');
end;


function readDescarga(DataInicio, DataTermino: string): TDadosRetorno;
var
  memREST: TStringList;
begin
  Result.Metodo := 'readDescarga';
  Result.Excecao := False;

  memREST := TStringList.Create;

  try
    memREST.Add('conta_id=' + DadosConta.IdConta);
    memREST.Add('dt_inicio=' + DataInicio);
    memREST.Add('dt_fim=' + DataTermino);
    memREST.Add('sync=0');

    Result.Parametros := memREST.Text;

    try
      Result := PostMetodoJSON(DadosConta.HostURL + 'readDescarga', memREST);
    except on E:Exception do
      begin
        Result.Excecao := True;
        Result.MsgExcecao := E.message;
      end;
    end;

  finally
    memREST.Free;
  end;
end;

function readViagem(DataInicio, DataTermino: string): TDadosRetorno;
var
  memREST: TStringList;
begin
  Result.Metodo := 'readViagem';
  Result.Excecao := False;

  memREST := TStringList.Create;

  try
    memREST.Add('conta_id=' + DadosConta.IdConta);
    memREST.Add('dt_inicio=' + DataInicio);
    memREST.Add('dt_fim=' + DataTermino);
    memREST.Add('sync=0');

    Result.Parametros := memREST.Text;

    try
      Result := PostMetodoJSON(DadosConta.HostURL + 'readViagem', memREST);
    except on E:Exception do
      begin
        Result.Excecao := True;
        Result.MsgExcecao := E.message;
      end;
    end;

  finally
    memREST.Free;
  end;
end;

function sendNotificacaoRota(CodRota, Mensagem: string): TDadosRetorno;
var
  memREST: TStringList;
begin
  Result.Metodo := 'sendNotificacaoRota';
  Result.Excecao := False;

  memREST := TStringList.Create;

  try
    memREST.Add('conta_id=' + DadosConta.IdConta);
    memREST.Add('rota=' + CodRota);
    memREST.Add('message='+ Mensagem);

    try
      Result := PostMetodoJSON(DadosConta.HostURL + 'sendNotificacaoRota', memREST);
    except on E:Exception do
      begin
        Result.Excecao := True;
        Result.MsgExcecao := E.message;
      end;
    end;

  finally
    memREST.Free;
  end;
end;

function BooleanToStr(Valor: Boolean): string;
begin
  if Valor then
    Result := 'S'
  else
    Result := 'N';
end;

function MakeParConsulta(aContaId: string; aDataInicio, aDataFinal:TDateTime; aSync: string; metodo: string; aComunitario:string): TDadosRetorno;
var
   memREST: TStringList;
   memJson : TJSONObject;
begin

  Result.Metodo := metodo;
  Result.Excecao := False;

  memREST := TStringList.Create;

  try
    memREST.Add('conta_id='+DadosConta.IdConta);
    memREST.Add('dt_inicio='+ (FormatDateTime('yyyy-MM-dd',aDataInicio)));
    memREST.Add('dt_fim='+ (FormatDateTime('yyyy-MM-dd',aDataFinal)));

    if aComunitario <> '9' then
      memRest.Add('comunitario=' + aComunitario);
    memREST.Add('sync='+ aSync);

    Result.Parametros := memREST.Text;

    try
      Result := PostMetodoJSON(DadosConta.HostURL + metodo, memREST);
    except on E:Exception do
      begin
        Result.Excecao := True;
        Result.MsgExcecao := E.message;
      end;
    end;

  finally
    memREST.Free;
  end;
end;
end.
