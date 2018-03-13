unit uVSSCLRotaComum;

interface

uses
  Windows, Messages, SysUtils, Classes, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,uJSON,
  JvStrings, JvScheduledEvents, IdMultiPartFormData, IdSNTP, DBClient, variants, DB, IniFiles, Dialogs,
  JvComponentBase, JvCSVBaseControls, JvCsvData, Controls, ShellAPI, Forms, WebAdapt ;

type
  TViagem = class
    Id: Integer;
    Index: Integer;
    ContaId: Integer;
    DatUltColeta: TDateTime;
    QtdeColetado: Integer;
    QtdeArmazenado:   Integer;
    QtdeDescargas: Integer;
    RotaId: Integer;
    RotaCodigo: string;
    DatAbertura: TDateTime;
    DatFechamento: TDateTime;
    Liberada: Boolean;
    GerouDatasul: string;
    GerouRm: string;
    GerouMagis: string;
    GerouMeta: string;
    GerouSiga: string;
    GerouScl: string;
    Registrada: Boolean;
    Coletor: string;
    Veiculo: string;
    ComunitarioPendente: string;
  end;

  TListaViagem = class(TList)
  end;
type
  TVisita = class
    id: Integer;
    viagem_id: Integer;
    itinerario_id: Integer;
    conta_id: Integer;
    rota_id: Integer;
    linha_id: Integer;
    fazenda_id: Integer;
    dt_push: TDateTime;
    dt_inicio: TDateTime;
    dt_fim: TDateTime;
    motivo: string;
    cancelado: string;
    total_coleta: Integer;
  end;
  TListaVisita = class(TObjectList)
    public
      function getVisitaById(id: Integer): TVisita;
  end;

type
  TColeta = class
    Id: Integer;
    dt_push: TDateTime;
    parada_id: Integer;
    viagem_id: Integer;
    coletor_id: Integer;
    tanque_id: Integer;
    dt_coleta: TDateTime;
    CodigoFazenda: string[15];
    Fazenda: string[100];
    CodigoProdutor: string[15];
    Produtor: string[100];
    tanque: string[45];
    quantidade: Integer;
    regua: Double;
    alizarol: string[1];
    amostra: string[15];
    contraprova: string[45];
    temperatura: Double;
    coletada: string[1];
    CodigoLinha: string[15];
    NomeLinha: string[100];
    CodigoRota: string[15];
    Rota: string[100];
    Veiculo: string[08];
    CodigoMotorista: string[15];
    NomeMotorista: string[100];
    dt_edicao: TDateTime;
    boca: string[5];
    public
      function toString(separator: Char; colNames: Boolean = True): string;
  end;

  TListaColeta = Class(TObjectList)
    public
    function getColetaById(id: Integer):TColeta;
  end;

type
 TRota = class
   id: Integer;
   Codigo: string[15];
   Nome: string[100];
 end;
type
 TListaRota = class(TObjectList)
   public
   function getRotaByCodigo(Codigo: string):TRota;
 end;
type
 TLinha = class
   id: Integer;
   Codigo: string[15];
   Nome: string[100];
   Distancia : integer;
 end;
 TListaLinha = class(TObjectList)
   public
   function getLinhaByCodigo(Codigo: string):TLinha;
 end;
type
  TProdutor = class
  id: Integer;
  Codigo: string[15];
  Nome: string[100];
  Doc: String[15];
 end;
 TListaProdutor = class(TObjectList)
   public
   function getProdutorByCodigo(Codigo: string):TProdutor;
 end;
type
  TFazenda = class
  id: Integer;
  Codigo: string[15];
  Nome: string[100];
  produtor: string[15];
 end;
 TListaFazenda = class(TObjectList)
   public
   function getFazendaByCodigo(Codigo: string):TFazenda;
 end;
 type
  TColetor = class
  id: Integer;
  Codigo: string[15];
  Nome: string[100];
 end;
 TListaColetor = class(TObjectList)
   public
   function getColetorByCodigo(Codigo: string):TColetor;

 end;
type
  TVeiculo = class
  id: Integer;
  Codigo: string[15];
  Placa: string[08];
 end;
 TListaVeiculo = class(TObjectList)
   public
   function getVeiculoByCodigo(Codigo: string):TVeiculo;
 end;

 type
   TRegViagem = class
     id: Integer;
     index: Integer;
     veiculo_id: Integer;
     coletor_id: Integer;
     linha_id: Integer;
     rota_id: Integer;
     conta_id: Integer;
     tecnico_id: Integer;
     dt_fechamento: TDateTime;
     dt_push: TDateTime;
     dt_abertura: TDateTime;
     km_inicial: Integer;
     km_final: Integer;
     km_distancia: Integer;
     km_justificativa : String;
     descarrega: string[01];
     dt_descarga: TDateTime;
     liberada: string[1];
     dt_liberacao: TDateTime;
     Rota: string[15];
     Coletor: string[15];
     Linha: string[15];
     Veiculo: string[15];
     ComunitarioPendente: string;
     bocas: string;
     tanques: string;
   end;
   TListaRegViagem = class(TObjectList)
     public
       function getViagemById(id: Integer): TRegViagem;
   end;
type
  TSigaProdutor = class
    idRegistro: string[01];
    nomeProdutor: string;
    codigoProdutor: string;
    filiaProdutor: string;
    status: string[01];
    public
      function toString(separador: Char):string;
  end;
type
  TSigaTransportador = class
    idRegistro: string[01];
    codigoTransportador: string;
    nomeTransportador: string;
    public
      function toString(separador: Char):string;
  end;
type
  TSigaEquipamentos = class
    idRegistro: string[01];
    codigoEquipamento: string;
    placaChassi: string;
    tipo: string[30];
    capacidade: Integer;
    public
     function toString(separador: Char):string;
  end;
type
  TSigaColetaIndividual = class
    idRegistro: string[01];
    veiculo: string;
    recepcao: TDateTime;
    dtColeta: TDateTime;
    fornecedor: string;
    filial: string;
    volume: Integer;
    temperatura: Double;
    amostra: string[01];
    alizarol: string[01];
    amostraRede: string[01];
    public
      function toString(separador: Char): string;
  end;
type
  TSigaViagem = class
    idRegistro : string[01];
    rota: string;
    ramal: string;
    inicio: TDateTime;
    final: TDateTime;
    equipamento: string;
    transportador: string;
    volumecoleta: Integer;
    dtRecepcao: TDateTime;
    recebido: string;
    motivo: string;
    temperatura: Double;
    volumeEfetivo: Integer;
    alizarol: string;
    fimDescarga: TDateTime;
  public
    function toString(Separador: Char): string;
  end;

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
    ChaveERP : array [1..6] of string;
    KeyId  : string;   // Associação das chaves do getMilk com o ID do ERP cliente
    Ativa : string[1];
    Sync: string[1];
    DropTable: string[1]; // Zera tabelas antes da sincronização ??
    CargaMultiEmpresa: string[1];
    DatIniLeituraDescargaWS: TDateTime;
    DatUltLeituraDescargaWS: TDateTime;
    PathArqDatasul: string;
    PathArqCarga: string;
    PathArqCargaApi: string; // Local da carga de conferencia  vinda da API
    PathArqRm: string;
    PathArqMagis: string;
    PathArqMeta: string;
    PathArqSiga: string;
    PathArqScl: string;
    PathArqDescarga: string;
    PatMapColetor : string;
    PatMapRota : string;
    PatMapAnalise : string;
    PatMapExtrato : string;
    PatMapFazenda : string;
    PatMapItinerario : string;
    PatMapLinha : string;
    PatMapMotivo : string;
    PatMapProdutor : string;
    PatMapGrupoRota : string;
    PatMapTanque : string;
    PatMapTag : string;
    PatMapTecnico : string;
    PatMapVinculado : string;
    PatMapVeiculo : string;
    PercAtesto: Double;
    UsarProxy: Boolean;
    PathBase: string;
    TimerProcInterno: Integer;
    TimerProcCadastro: Integer;
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
    ColetasHoje: string[1];

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
    MsgWS: WideString;
    Monitor : string;
  end;

type
  TCdsImportado = record
    Dados : TClientDataSet;
    Sucesso : Boolean;
    Notificacao: string;
  end;
type
  TMapasCarga = record
    ContaId : Integer;
    Token: string;
    PathMapas: string;
    Mapas : array [1..20] of string;
    Metodos : array [1..20] of string;
    MetodosRead : array [1..20] of string;
    NomeArqSaida : array [1..20] of string;
    Notificacao : string;
  end;
type
  TMultiEmpresa = record
    IdConta : Integer;
    CodigoERP : string;
    NomeAtributo : string;
    CargaMultipla: Boolean;
  end;
type
   TTokenConta = record
     Token: string;
     Doc: string;
     conta_id: string;
   end;

type
  TSatusSync = record
    Result : Boolean;
    State : string ;   // E - Encerrado <> A - Andamento
  end;
TStatusConta = (scAtivo, scInativo, scInterrompido, scAtualizando);

procedure PopularDadosConta(cdsPar: TDataSet);
function RetornoMetodoWSPOST(URL: string; Parametros: TStringList): string;
function RetornoMetodoWSGET(URL: string): string;
function PostMetodoJSON(URL: string; Parametros: TStringList): TDadosRetorno;

// Chamadas REST
procedure AjustarHora;
function readDescarga(ContaId: Integer; DataInicio, DataTermino: string): TDadosRetorno;
function readViagem(ContaId: Integer; DataInicio, DataTermino: string): TDadosRetorno;
function sendNotificacaoRota(CodRota, Mensagem: string): TDadosRetorno;
function MakeParConsulta(aContaId: string;aDataInicio, aDataFinal:TDateTime; aSync: string; metodo: string; aComunitario:string = '9'): TDadosRetorno;
function xPostMetodoJSON(URL: string; Parametros: TStringList): TDadosRetorno;
function VRetornoMetodoWSPOST(URL: string; Parametros: TStringList): string;
function readMetodoApi(Conta, Metodo: string): TDadosRetorno;


// Auxiliares
function InserirMsgLog(Msg: string): string;
function GetDadosContaStr: string;
function BooleanToStr(Valor: Boolean): string;
function LimpaMascaras(Texto:string):string;
function RemoveAcento(Str: string): string;
function Elimina(Text,Busca : string) : string;
function TrocaVirgPPto(Valor: string): String;
function TrocaPtoPVirg(Valor: string): String;
// Mensagem
procedure MostraMsgErro(Msg :string);
procedure MostraMsgInfo(Msg :string);
function MostraMsgConf(msg :string) :Boolean;

// Manipulação de aruivos INI
procedure GravaIni(aArquivo,aChave, aTexto: string);
procedure LeIni(var aTexto: string; aArquivo, aSecao, aChave: string);
procedure LeSecaoIni(var aTexto: TStringList; aArquivo, aSecao: string);

// Geração de arquivos JOSN
function DataSetToJsonTxt(pDataSet:TDataSet; conta_id:Integer = 0; Token:string = ''; StartPoint:Integer = 0; Limit:Integer = 0):WideString;
//function JsontToDatat(LinhaDados: WideString): TClientDataSet;

// Consulta dados de cadastro na API e gera arquivos formatados
function ExportDataWs(xMapasCarga: TMapasCarga): TStringList;

// Atualiza dados no servidor (API) Integração
function LoadFromMapIni(owner: Char; conta_id : Integer; MasterMap: string): TMapasCarga;
function AtualizaTabelasWs (xMapasCarga: TMapasCarga) : TStringList;
function ExibeAmostraDados(aNomeArqivo, aSeparador: string): TJvCsvDataSet;
function ImportaArquivoMapeado(aPathBase, aFileMapa: string;MultiEmpresa:TMultiEmpresa ): TCdsImportado;
// Retorno o token e o doc da conta para limpeza de dados
function getToken(contaId: integer): TTokenConta;

// Comuns
// Retorna Versão Aplicativo
function VersaoAplicativo(Executavel: string): string;
// Liberar memoria
procedure TrimAppMemorySize(pReinicia: Boolean; Programa:string);

// Controle viagem, log e dataas

procedure GerarArquivoViagem(Viagem: TViagem);
function GerarLinhaArquivo(ObjViagem: TViagem; TipoLinhaColeta: byte): string;
procedure EnviarNotificacao(Viagem: TViagem; Mensagem: string);
function GetData(Data: string): TDateTime;
function GetDataHora(Data: string): TDateTime;
function ValidaInt(Numero: string): Integer;


var
  DadosConta: TDadosConta;
  CargaMultiEmpresa : TMultiEmpresa;
  FSQL : string;
  FResultado: Variant;
  FListaAux : TStringList;

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

  TableLancamentos =
  ' Create Table lancamentos(  '+
  ' id integer primary key autoincrement, '+
  ' codigo varchar(6), '+
  ' fazenda varchar(2),'+
  ' materia varchar(3),'+
  ' linha varchar(4),  '+
  ' data varchar(10),  '+
  ' hora varchar(10),  '+
  ' volume double,     '+
  ' ntanque integer,   '+
  ' temperatura double);';

implementation

uses uRotinasComuns, Math, DateUtils, uLkJSON , uGlobal;

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
 {
  // Chaves das contas no getMilk
  DadosConta.IdConta := cdsPar.FieldByName('ParContaId').AsString;
  DadosConta.IdConta1 := cdsPar.FieldByName('ParContaId1').AsString;
  DadosConta.IdConta2 := cdsPar.FieldByName('ParContaId2').AsString;
  DadosConta.IdConta3 := cdsPar.FieldByName('ParContaId3').AsString;
  DadosConta.IdConta4 := cdsPar.FieldByName('ParContaId4').AsString;
  DadosConta.IdConta5 := cdsPar.FieldByName('ParContaId5').AsString;
  DadosConta.IdConta6 := cdsPar.FieldByName('ParContaId6').AsString;

  // Associação das chaves do getMilk com o ERP Cliente
  DadosConta.KeyId1 := cdsPar.FieldByName('ParKeyId1').AsString;
  DadosConta.KeyId2 := cdsPar.FieldByName('ParKeyId2').AsString;
  DadosConta.KeyId3 := cdsPar.FieldByName('ParKeyId3').AsString;
  DadosConta.KeyId4 := cdsPar.FieldByName('ParKeyId4').AsString;
  DadosConta.KeyId5 := cdsPar.FieldByName('ParKeyId5').AsString;
  DadosConta.KeyId6 := cdsPar.FieldByName('ParKeyId6').AsString;

  // insere numero das contas em um array do objeto
  DadosConta.ChaveContas[1] := DadosConta.IdConta1;
  DadosConta.ChaveContas[2] := DadosConta.IdConta2;
  DadosConta.ChaveContas[3] := DadosConta.IdConta3;
  DadosConta.ChaveContas[4] := DadosConta.IdConta4;
  DadosConta.ChaveContas[5] := DadosConta.IdConta5;
  DadosConta.ChaveContas[6] := DadosConta.IdConta6;

  // Insere chaves das contas do ERP cliente em um array de objetos
  DadosConta.ChaveERP[1] := DadosConta.KeyId1;
  DadosConta.ChaveERP[2] := DadosConta.KeyId2;
  DadosConta.ChaveERP[3] := DadosConta.KeyId3;
  DadosConta.ChaveERP[4] := DadosConta.KeyId4;
  DadosConta.ChaveERP[5] := DadosConta.KeyId5;
  DadosConta.ChaveERP[6] := DadosConta.KeyId6;
 }
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
  DadosConta.TimerProcCadastro := cdsPar.FieldByName('ParIntervaloCarga').AsInteger; // Minutos
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

  // Tipo de carga - Verifica se arquivo de carga tem dados de mais de uma filial
  DadosConta.CargaMultiEmpresa := cdsPar.FieldByName('ParCargaMultiEmpresa').AsString;

  // Limpa tabela antes da carga no servidor
  DadosConta.DropTable := cdsPar.FieldByName('ParDropTable').AsString;

  // Local da base de dados de carga integração ERP
  DadosConta.PathArqCarga := cdsPar.FieldByName('ParPathArqCarga').AsString;
  // Local para retorno de arquivos de conferência vindos da API
  DadosConta.PathArqCargaApi := cdsPar.FieldByName('ParPathCargaApi').AsString;
  // Controle de geração de arquivos do dia
  DadosConta.ColetasHoje := cdsPar.FieldByName('ParColetasHoje').AsString;


end;

function PostMetodoJSON(URL: string; Parametros: TStringList): TDadosRetorno;
var
  ValorJSON: TJSONObject;
  xValue : TStringList;
  idxRemove : Integer;
  json : TlkJSON;
begin
(*
  json := TlkJSON.Create;
  json.ParseText(RetornoMetodoWSPOST(URL, Parametros));


  xValue := TStringList.Create;
  xValue.Add (json.ToString);
  xValue.SaveToFile('c:\temp\json.txt');

 // ValorJSON := TJSONObject.create(Copy(xValue.Text,0,Pos(xValue.Text,QuotedStr('monitor.time'))-1)+ '}');

 *)
  ValorJSON := TJSONObject.Create(RetornoMetodoWSPOST(URL, Parametros));
  try
    // Retorno
    if ValorJSON.has('success') then
      Result.Sucesso := ValorJSON.getBoolean('success');

    if ValorJSON.has('message') then
      Result.Mensagem := ValorJSON.getString('message');

    if ValorJSON.has('data') then
      Result.Dados := ValorJSON.getString('data');
    if ValorJSON.has('monitor.time') then
      Result.Monitor := (ValorJSON.getString('monitor.time'));
   // Result.Monitor := FloatToStr(ValorJSON.getDouble('monitor.time'));

    Result.ToString := Format('Metodo: %s - Sucesso: %s - Mensagem: %s - Parametros: %s - Dados: %s - Time: %s',
      [Result.Metodo, BoolToStr(Result.Sucesso), Result.Mensagem, Result.Parametros, Result.Dados, Result.Monitor]);
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
      if not FileExists(NomeArqLog) then
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


function readDescarga(ContaId: Integer; DataInicio, DataTermino: string): TDadosRetorno;
var
  memREST: TStringList;
  xtoken: TTokenConta;
begin
  xtoken := GetToken(ContaId);
  Result.Metodo := 'readDescarga';
  Result.Excecao := False;

  memREST := TStringList.Create;

  try

    memREST.Add('conta_id=' + IntToStr(ContaId));
    memREST.Add('dt_inicio=' + DataInicio);
    memREST.Add('dt_fim=' + DataTermino);
    memREST.Add('Token=' + xtoken.Token);
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

function readViagem(ContaId: Integer;DataInicio, DataTermino: string): TDadosRetorno;
var
  memREST: TStringList;
  xToken: TTokenConta;
begin
  xToken := GetToken(ContaId);
  Result.Metodo := 'readViagem';
  Result.Excecao := False;

  memREST := TStringList.Create;

  try
    memREST.Add('conta_id=' + IntToStr(ContaId));
    memREST.Add('dt_inicio=' + DataInicio);
    memREST.Add('dt_fim=' + DataTermino);
    memREST.Add('token='+ xToken.Token);
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
function readMetodoApi(Conta, Metodo: string): TDadosRetorno;
var
  memREST: TStringList;
  _token : TTokenConta;
begin
  Result.Metodo := Metodo;
  Result.Excecao := False;

  memREST := TStringList.Create;
  // Pega token de autorizaçao da conta
  _token := getToken(StrToInt(Conta));

  try
    memREST.Add('conta_id=' + Conta);
    memREST.Add('dt_inicio=' + FormatDateTime('yyyy-MM-dd', Date));
    memREST.Add('dt_fim=' + FormatDateTime('yyyy-MM-dd', Date));
    memREST.Add('sync=0');
    memREST.Add('token=' + _token.Token);

    Result.Parametros := memREST.Text;

    try
      Result := PostMetodoJSON(DadosConta.HostURL + Metodo, memREST);
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
   _token : TTokenConta;
begin

   // Pega token da conta
    _token := getToken(StrToInt(aContaId));


  Result.Metodo := metodo;
  Result.Excecao := False;

  memREST := TStringList.Create;

  try
    memREST.Add('conta_id='+DadosConta.IdConta);
    memREST.Add('dt_inicio='+ (FormatDateTime('yyyy-MM-dd',aDataInicio)));
    memREST.Add('dt_fim='+ (FormatDateTime('yyyy-MM-dd',aDataFinal)));
    memREST.Add('token=' + _token.Token);

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
procedure GravaIni(aArquivo,aChave, aTexto: string);

var

  ArqIni: TIniFile;

begin

  ArqIni := TIniFile.Create(aArquivo);

  try

    ArqIni.WriteString('Dados',aChave, aTexto);

  finally

    ArqIni.Free;

  end;

end;

procedure LeIni(var aTexto: string; aArquivo, aSecao, aChave: string);
var
  ArqIni: TIniFile;
begin
  ArqIni := TIniFile.Create(aArquivo);
  try
    aTexto := ArqIni.ReadString(aSecao, aChave, aTexto);
  finally
    ArqIni.Free;
  end;
end;
procedure LeSecaoIni(var aTexto: TStringList; aArquivo, aSecao: string);
var
  ArqIni: TIniFile;
begin
  ArqIni := TIniFile.Create(aArquivo);
  try
    ArqIni.ReadSectionValues(aSecao,aTexto);
  finally
    ArqIni.Free;
  end;
end;
function RemoveAcento(Str: string): string;
const
  ComAcento = 'àâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜ';
  SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
var
   x: Integer;
begin;
  for x := 1 to Length(Str) do
  if Pos(Str[x], ComAcento) <> 0 then
    Str[x] := SemAcento[Pos(Str[x], ComAcento)];
  Result := Str;
end;
function LimpaMascaras(Texto:string):string;
var
 _Aux: string;
begin
  // Limpa cnpj /Cpf / Cep
  _Aux := Elimina(Texto,'.');
  _Aux := Elimina(_Aux,'/');
  _Aux := Elimina(_Aux,'-');
  // Limpa Mascara Fone
  _Aux := Elimina(_Aux,'(');
  _Aux := Elimina(_Aux,')');

  Result := _Aux;
end;
function Elimina(Text,Busca : string) : string;
{ Substitui um caractere dentro da string}
var n : integer;
begin
  for n := 1 to length(Text) do
   begin
   if Copy(Text,n,1) = Busca then
      begin
      Delete(Text,n,1);
      end;
   end;
   Result := Text;
end;
function DataSetToJsonTxt(pDataSet: TDataSet; conta_id:Integer = 0; Token: string = ''; StartPoint:Integer = 0; Limit:Integer = 0): WideString;
var
    ArrayData: TStringList;
    I: Integer;
    pField:TField;
    LimitCount:Integer;
    xData, xRegistro: string;
    _aspas : Char;
begin
  try
    _aspas := '"';
    ArrayData := TStringList.Create;
    // Caracter inicial do arquivo
    ArrayData.Append('{');
    xRegistro := AnsiQuotedStr('conta_id',_aspas) + ':' + IntToStr(conta_id)+ ',';
    ArrayData.Append(xRegistro);

    // Envia o token de autorizaçao
    if Token <> EmptyStr then
    begin
      xRegistro := AnsiQuotedStr('token',_aspas) + ':' + AnsiQuotedStr(Token,_aspas) + ',';
      ArrayData.Append(xRegistro);
    end;

    // Array com valores - abertura
    xRegistro := AnsiQuotedStr('data',_aspas) + ':' + '[';
    ArrayData.Append(xRegistro);

      pDataSet.First;
      pDataSet.MoveBy(StartPoint);
      while not pDataSet.Eof do
      begin
         xRegistro := '{' ;
        for I := 0 to pDataSet.FieldCount -1 do
        begin
          pField := pDataSet.Fields[I];
          if pField.Tag = 0 then
          begin
            case pField.DataType of
              ftString:
                begin
                  xRegistro := xRegistro + AnsiQuotedStr(pField.FieldName,_aspas) + ':' +
                  AnsiQuotedStr(pField.AsString, _aspas);
                end;
              ftFloat:
                begin
                  xRegistro := xRegistro + AnsiQuotedStr(pField.FieldName,_aspas) + ':' +
                  AnsiQuotedStr(TrocaVirgPPto(pField.AsString), _aspas);
                end;
              ftInteger:
                begin
                 xRegistro := xRegistro + AnsiQuotedStr(pField.FieldName, _aspas) + ':' +
                 IntToStr(pField.AsInteger);
                end;
             ftSmallint :
                begin
                 xRegistro := xRegistro + AnsiQuotedStr(pField.FieldName,_aspas) + ':' +
                 IntToStr(pField.AsInteger);
                end;
             ftBoolean:
               if pField.Value then
                 begin
                   xRegistro := xRegistro + AnsiQuotedStr(pField.FieldName,_aspas) + ':' +
                   'True';
                 end
               else
               begin
                 xRegistro := xRegistro + AnsiQuotedStr(pField.FieldName, _aspas) + ':' +
                 'True';
               end;
             ftDateTime:
               begin
                 xData := Copy(pField.AsString,7,4)+ '-' + Copy(pField.AsString,4,2) + '-' + Copy(pField.AsString,1,2);
                 xRegistro := xRegistro + AnsiQuotedStr(pField.FieldName, _aspas) + ':' +
                 AnsiQuotedStr(xData,_aspas);
               end

            else //casos gerais são tratados como string
              begin
                xRegistro := xRegistro + AnsiQuotedStr(pField.FieldName,_aspas) + ':' +
                AnsiQuotedStr(pField.AsString,_aspas);
              end;
            end;
          end;
          if i < pDataSet.FieldCount - 1 then
          begin
            xRegistro := xRegistro + ','
          end
          else
            xRegistro := xRegistro + '}'
        end;
       // ArrayData.Append(xRegistro);
        pDataSet.next;
        if pDataSet.Eof then
        begin
          xRegistro := xRegistro + ']}';
          ArrayData.Append(xRegistro);
        end
        else
        begin
         xRegistro := xRegistro + ',';
         ArrayData.Append(xRegistro);
        end;
        LimitCount := LimitCount +1;
        // Finaliza a geração do arquivo quanto atingir o limite de registro solicitado
        if (Limit <> 0) and (LimitCount = Limit) then
          Break;
      end;

   //   result := StringReplace(ArrayData.Text,#13#10,'',[rfReplaceAll]) ;
      result := ArrayData.Text;
  finally
    ArrayData.Destroy;
  end;
end;

// Posta dados para o servidor
function xPostMetodoJSON(URL: string; Parametros: TStringList): TDadosRetorno;
var
  ValorJSON: TJSONObject;
begin
   ValorJSON := TJSONObject.Create(RetornoMetodoWSPOST(URL, Parametros));
   Result.MsgWS := VRetornoMetodoWSPOST(URL, Parametros);
  // Retorno
  if ValorJSON.has('success') then
    Result.Sucesso := ValorJSON.getBoolean('success');

  if ValorJSON.has('message') then
    Result.Mensagem := ValorJSON.getString('message');

  if ValorJSON.has('data') then
  begin
    Result.Dados := ValorJSON.getString('data');
  end;
  if ValorJSON.has('monitor.time') then
  begin
    Result.Monitor := (ValorJSON.getString('monitor.time'));
    //Result.Monitor := FloatToStr (ValorJSON.getDouble('monitor.time'));
  end;

  Result.ToString := Format('Metodo: %s - Sucesso: %s - Mensagem: %s - Dados: %s',
    [Result.Metodo, BoolToStr(Result.Sucesso), Result.Mensagem, Result.Dados]);
end;

function VRetornoMetodoWSPOST(URL: string; Parametros: TStringList): string;
var
  IdHTTP: TIdHTTP;
  DataToSend : TStringStream;
begin
  IdHTTP := TIdHTTP.Create(nil);
  DataToSend := TStringStream.Create( UTF8Encode(Parametros.Text));
  try
    if Assigned(Parametros) then
    begin
      IdHTTP.Request.Clear;
      IdHTTP.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Acoo Browser; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; Maxthon; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618)';
      IdHTTP.Request.ContentType := 'application/json';
      IdHTTP.Request.CharSet := 'utf-8';
      IdHTTP.Request.Method := 'POST';
      Result := IdHTTP.Post(URL, DataToSend);
    end;
  finally
    FreeAndNil(IdHTTP);
    FreeAndNil(DataToSend);
  end;
end;
// Atualiza tabelas no Serdor (API) Integração

function LoadFromMapIni(owner: Char; conta_id : Integer; MasterMap: string ): TMapasCarga;
var
 _ChaveConta, _ArquivoMapa : string;
begin

  if not FileExists(MasterMap) then
  begin
    if owner = '1' then
      ShowMessage('Arquivo [ ' + MasterMap + ' ] não localizado, será necessário associar os arquivos de importação !')
    else
      Result.Notificacao := ('Arquivo [ ' + MasterMap + ' ] não localizado, será necessário associar os arquivos de importação !');
    Exit;
  end;

  LeIni(_ChaveConta, MasterMap, 'Conta', 'ChaveConta');
  if (_ChaveConta <> IntToStr(conta_id) ) then
  begin
    if owner = '1' then
      ShowMessage('Arquivo de localização de mapas [ ' + MasterMap + ' ] não pertence a conta ativa !')
    else
      Result.Notificacao := ('Arquivo de localização de mapas [ ' + MasterMap + ' ] não pertence a conta ativa !');
    Exit;
  end;

  // Pega chave da conta Ativa
  Result.ContaId := StrToInt(_ChaveConta);

  // Pega localização dos arquivos de dados
  LeIni(_ArquivoMapa,MasterMap,'Dados','GRUPO_ROTA');
  Result.Mapas[1] := _ArquivoMapa;
  Result.Metodos[1]     := 'writeGrupoRota';
  Result.MetodosRead[1] := 'readGrupoRota';
  Result.NomeArqSaida[1]:= 'SclGrpRota.txt';

  LeIni(_ArquivoMapa,MasterMap,'Dados','ROTA');
  Result.Mapas[2] := _ArquivoMapa;
  Result.Metodos[2] := 'writeRota';
  Result.MetodosRead[2] := 'readRota';
  Result.NomeArqSaida[2] := 'SclRota.txt';

  LeIni(_ArquivoMapa,MasterMap,'Dados','LINHA');
  Result.Mapas[3] := _ArquivoMapa;
  Result.Metodos[3] := 'writeLinha';
  Result.MetodosRead[3] := 'readLinha';
  Result.NomeArqSaida[3] := 'ScLinha.txt';

  LeIni(_ArquivoMapa,MasterMap,'Dados','PRODUTOR');
  Result.Mapas[4] := _ArquivoMapa;
  Result.Metodos[4] := 'writeProdutor';
  Result.MetodosRead[4] := 'readProdutor';
  Result.NomeArqSaida[4] := 'SclProd.txt';

  LeIni(_ArquivoMapa,MasterMap,'Dados','FAZENDA');
  Result.Mapas[5] := _ArquivoMapa;
  Result.Metodos[5] := 'writeFazenda';
  Result.MetodosRead[5] := 'readFazenda';
  Result.NomeArqSaida[5] := 'SclFaz.txt';

  LeIni(_ArquivoMapa,MasterMap,'Dados','VEICULO');
  Result.Mapas[6] := _ArquivoMapa;
  Result.Metodos[6] := 'writeVeiculo';
  Result.MetodosRead[6] := 'readVeiculo';
  Result.NomeArqSaida[6] := 'SclVeic.txt';

  LeIni(_ArquivoMapa,MasterMap,'Dados','TANQUE');
  Result.Mapas[7] := _ArquivoMapa;
  Result.Metodos[7] := 'writeTanque';
  Result.MetodosRead[7] := 'readTanque';
  Result.NomeArqSaida[7] := 'SclTaq.txt';

  LeIni(_ArquivoMapa,MasterMap,'Dados','VINCULADO');
  Result.Mapas[8] := _ArquivoMapa;
  Result.Metodos[8] := 'writeVinculado';
  Result.MetodosRead[8] := 'readVinculado';
  Result.NomeArqSaida[8] := 'SclVincu.txt';

  LeIni(_ArquivoMapa,MasterMap,'Dados','COLETOR');
  Result.Mapas[9] := _ArquivoMapa;
  Result.Metodos[9] := 'writeColetor';
  Result.MetodosRead[9] := 'readColetor';
  Result.NomeArqSaida[9] := 'SclCol.txt';

  LeIni(_ArquivoMapa,MasterMap,'Dados','TECNICO');
  Result.Mapas[10] := _ArquivoMapa;
  Result.Metodos[10] := 'writeTecnico';
  Result.MetodosRead[10] := 'readTecnico';
  Result.NomeArqSaida[10] := 'SclTec.txt';

  LeIni(_ArquivoMapa,MasterMap,'Dados','TAGNFC');
  Result.Mapas[11] := _ArquivoMapa;
  Result.Metodos[11] := 'writeTag';
  Result.MetodosRead[11] := 'readTag';
  Result.NomeArqSaida[11] := 'SclTag.txt';

  LeIni(_ArquivoMapa,MasterMap,'Dados','ITINERARIO');
  Result.Mapas[12] := _ArquivoMapa;
  Result.Metodos[12] := 'writeItinerario';
  Result.MetodosRead[12] := 'readItinerario';
  Result.NomeArqSaida[12] := 'SclItiner.txt';

  LeIni(_ArquivoMapa,MasterMap,'Dados','ANALISE');
  Result.Mapas[13] := _ArquivoMapa;
  Result.Metodos[13] := 'writeAnalise';
  Result.MetodosRead[13] := 'readAnalise';
  Result.NomeArqSaida[13] := 'SclAna.txt';

  LeIni(_ArquivoMapa,MasterMap,'Dados','EXTRATO');
  Result.Mapas[14] := _ArquivoMapa;
  Result.Metodos[14] := 'writeExtrato';
  Result.MetodosRead[14] := 'readExtrato';
  Result.NomeArqSaida[14] := 'SclExt.txt';

  LeIni(_ArquivoMapa,MasterMap,'Dados','MOTIVOCLTO');
  Result.Mapas[15] := _ArquivoMapa;
  Result.Metodos[15] := 'writeMotivo';
  Result.MetodosRead[15] := 'readMotivo';
  Result.NomeArqSaida[15] := 'SclJust.txt';
end;


function AtualizaTabelasWs (xMapasCarga: TMapasCarga) : TStringList;
var
  _wsParametros : TStringList;
  _CdsImportado : TCdsImportado;
  _wsDadosRetorno : TDadosRetorno;
  x : Integer;
  xSalvaJson : Boolean;
  _Token : TTokenConta;

  // Limpa tabelas no servidor, antes de sincronizar os dados
  function dropTablesWs : TStringList;
  var
    _Parameters : string;
    _Separador  : string;
    _Aspas : Char;

  begin
    if (DadosConta.DropTable = FlagSim ) then
    begin
      try
        Result := TStringList.Create;
        _Separador := ',' ;
        _Aspas := '"';

        { prepara Json com parametros para enviar ao servidor milks rota
        }
          // Pega token da conta
          _Token := getToken(xMapasCarga.ContaId);

          _wsParametros.Clear;
          // Parametros enviados ao servidor
          _Parameters := '{"conta_id": ' +
                          AnsiQuotedStr(IntToStr(xMapasCarga.ContaId),_Aspas) + _Separador +
                          AnsiQuotedStr('token',_Aspas) + ':' + AnsiQuotedStr(_Token.Token, _Aspas) + _Separador +
                          AnsiQuotedStr('doc', _Aspas) + ':' + AnsiQuotedStr(_Token.Doc, _Aspas)+
                          '}';
          _wsParametros.Add(_Parameters);

        // Apaga arquivos de tag no servidor
        if FileExists(DadosConta.PathArqCarga + '\dropTag.txt') then
        begin
          // Invoca metodo na API
          _wsDadosRetorno :=  xPostMetodoJSON(DadosConta.HostURL + 'clearTag', _wsParametros);
          if _wsDadosRetorno.Sucesso then
          begin
             Result.Append('Limpeza Tabela de Tags Executado com sucesso');
             Deletefile(DadosConta.PathArqCarga + '\dropTag.txt');
          end
          else
          begin
            Result.Append('Falha na limpeza da tabela de Tags');
            Result.Append(_wsDadosRetorno.Mensagem);
          end;
        end;
        if FileExists(DadosConta.PathArqCarga + '\dropItinerario.txt') then
        begin
          // Invoca metodo na API
          _wsDadosRetorno :=  xPostMetodoJSON(DadosConta.HostURL + 'clearItinerario', _wsParametros);
          if _wsDadosRetorno.Sucesso then
          begin
             Result.Append('Limpeza Tabela de Itinerarios Executado com sucesso');
             Deletefile(DadosConta.PathArqCarga + '\dropItinerario.txt');
          end
          else
          begin
            Result.Append('Falha na limpeza da tabela de Itinerarios');
            Result.Append(_wsDadosRetorno.Mensagem);
          end;
        end;
        if FileExists(DadosConta.PathArqCarga + '\dropVinculado.txt') then
        begin
          // Invoca metodo na API
          _wsDadosRetorno :=  xPostMetodoJSON(DadosConta.HostURL + 'clearVinculado', _wsParametros);
          if _wsDadosRetorno.Sucesso then
          begin
             Result.Append('Limpeza Tabela de Tanques Comunitarios Executado com sucesso');
             Deletefile(DadosConta.PathArqCarga + '\dropVinculado.txt');
          end
          else
          begin
            Result.Append('Falha na limpeza da tabela de Tanques Comunitarios');
            Result.Append(_wsDadosRetorno.Mensagem);
          end;
        end;
        if FileExists(DadosConta.PathArqCarga + '\dropGrupoRota.txt') then
        begin
          // Invoca metodo na API
          _wsDadosRetorno :=  xPostMetodoJSON(DadosConta.HostURL + 'clearGrupoRota', _wsParametros);
          if _wsDadosRetorno.Sucesso then
          begin
             Result.Append('Limpeza Tabela de Grupos de Rotas Executado com sucesso');
             Deletefile(DadosConta.PathArqCarga + '\dropGrupoRota.txt');
          end
          else
          begin
            Result.Append('Falha na limpeza da tabela de Grupos de Rotas');
            Result.Append(_wsDadosRetorno.Mensagem);
          end;
        end;
        if FileExists(DadosConta.PathArqCarga + '\dropTag.txt') then
        begin
          // Invoca metodo na API
          _wsDadosRetorno :=  xPostMetodoJSON(DadosConta.HostURL + 'clearExtrato', _wsParametros);
          if _wsDadosRetorno.Sucesso then
          begin
             Result.Append('Limpeza Tabela de Extrato Executado com sucesso');
             Deletefile(DadosConta.PathArqCarga + '\dropExtrato.txt');
          end
          else
          begin
            Result.Append('Falha na limpeza da tabela de Extrato');
            Result.Append(_wsDadosRetorno.Mensagem);
          end;
        end;
        if FileExists(DadosConta.PathArqCarga + '\dropAnalise.txt') then
        begin
          // Invoca metodo na API
          _wsDadosRetorno :=  xPostMetodoJSON(DadosConta.HostURL + 'clearAnalise', _wsParametros);
          if _wsDadosRetorno.Sucesso then
          begin
             Result.Append('Limpeza Tabela de Analises Executado com sucesso');
             Deletefile(DadosConta.PathArqCarga + '\dropAnalise.txt');
          end
          else
          begin
            Result.Append('Falha na limpeza da tabela de Analises');
            Result.Append(_wsDadosRetorno.Mensagem);
          end;
        end;
      finally
        Result.Append('(-) Fim Limpeza Tabelas no Servidor (-)');
      end;
    end;
  end;
begin
  try
    _CdsImportado.Dados := TClientDataSet.Create(nil);
    // Inicializa log de envio
    Result := TStringList.Create;
    Result.Add('# Início de Atualização Tabelas Servidor :: ' + FormatDateTime('dd/MM/yyyy hh:mm:ss',Now));
    Result.Append('Conta : ' + IntToStr(xMapasCarga.ContaId));

    // Cria array de parametro para envio
    _wsParametros := TStringList.Create;

    // Limpa tabelas no servidor, antes de enviar os arquivos
    if (DadosConta.DropTable = FlagSim) then
    begin
      Result.Add(EmptyStr);
      Result.Add('(-) Apaga registros nas tabelas no servidor (-)');
      // Apaga tabelas
      Result.Add(dropTablesWs.Text);
    end;

    xSalvaJson := True;

    {* Importa dados dos aruqivos e envia para a respectiva conta no Servidor *}
    for x := 1 to 15 do
    begin
      // não processa posição vazia do array com nomes dos mapas
      if (xMapasCarga.Mapas[x] = EmptyStr) then
        Continue;

      // Log do metodo invocado
      Result.Append('#' + xMapasCarga.Metodos[x] + '#');
      _wsParametros.Clear;
      _CdsImportado := ImportaArquivoMapeado(DadosConta.PathArqCargaApi,xMapasCarga.Mapas[x],CargaMultiEmpresa);
      if _CdsImportado.Sucesso then
      begin
        // Pega token da conta
        _Token := getToken(xMapasCarga.ContaId);

        _wsParametros.Add( DataSetToJsonTxt(_CdsImportado.Dados, xMapasCarga.ContaId, _Token.Token)) ;
        if xSalvaJson then
        begin
          // Cria pasta se não existir
          if not DirectoryExists(DadosConta.PathArqCargaApi + '\Api\'+ IntToStr(xMapasCarga.ContaId)) then
            ForceDirectories(DadosConta.PathArqCargaApi + '\Api\' + IntToStr(xMapasCarga.ContaId));
          // Salva Json do arquivo
          _wsParametros.SaveToFile(DadosConta.PathArqCargaApi + '\Api\'+ IntToStr(xMapasCarga.ContaId) + '\' + StringReplace(xMapasCarga.NomeArqSaida[x],'.txt','.json',[]));
        end;
        if (_CdsImportado.Dados.RecordCount > 0) then
        // if _wsParametros.Count > 0 then
        begin
         // Eniva dados ao servidor SclRota
          _wsDadosRetorno :=  xPostMetodoJSON(DadosConta.HostURL + xMapasCarga.Metodos[x], _wsParametros);
          if _wsDadosRetorno.Sucesso then
          begin
             Result.Append('Dados enviados com sucesso !')
          end
          else
          begin
            Result.Append('?? Falha ao enviar :' + xMapasCarga.Metodos[x]);
            Result.Append(_wsDadosRetorno.MsgWS);
          end;
        end;
      end
      else // Não conseguiu abrir o arquivo
      begin
        Result.Append('Falha ao abrir o arquivo: ' + _CdsImportado.Notificacao);
      end;
    end;
  finally
     Result.Add('# Final de Atualização Tabelas Servidor :: ' + FormatDateTime('dd/MM/yyyy hh:mm:ss',Now));
    _wsParametros.Destroy;
  end;
end;
// carrega dados do arquivo txt para dataset
function ExibeAmostraDados(aNomeArqivo, aSeparador: string): TJvCsvDataSet;
var
 xColunas, xNomeColuna : TStringList;
 I: Integer;
 Separador : Char;
 csvDataset : TJvCsvDataSet;
 csvFileBase : TJvCSVBase;

begin
  if aNomeArqivo <> EmptyStr then
  begin
    csvDataset := TJvCsvDataSet.Create(nil);
    csvFileBase := TJvCSVBase.Create(nil);

    csvDataset.SavesChanges := False;
    csvDataset.LoadsFromFile := True;

    try
      Separador := aSeparador[1];
      xColunas := TStringList.Create;
      xNomeColuna := TStringList.Create;
      csvFileBase.DataBaseClose;
      csvFileBase.CSVFieldNames.Clear;
      csvFileBase.CSVFileName := EmptyStr;
      csvFileBase.CSVFileName := aNomeArqivo;
      xColunas := arraystring(LimpaMascaras(RemoveAcento(Trim(csvFileBase.CSVFieldNames.Text))), aSeparador[1]);
      csvDataSet.FieldDefs.Clear;

      csvDataSet.Separator := Separador;
      csvDataSet.Close;

      for I := 0 to xColunas.Count -1  do
      begin
        csvDataSet.FieldDefs.Add(xColunas[i],ftString,80);
      end;
      csvDataSet.FileName := aNomeArqivo;
      csvDataSet.CsvFieldDef := Trim(csvFileBase.CSVFieldNames.Text);

      csvDataSet.Open;
      Result := csvDataset;
    finally
      xColunas.Destroy;
      xNomeColuna.Destroy;
    end;
  end;

end;
// Importa arquivo mapeado
function ImportaArquivoMapeado(aPathBase,aFileMapa: string; MultiEmpresa:TMultiEmpresa): TCdsImportado;
var
  _lista,_Linha: TStringList;
  _Aux, _Conta, _ArqOrgem, _TabelaDestino, _Separador, _TipoArquivo, _CDS, _TipoCampo, _ChaveObrigatoria : string;
  _Mapa, _FK,  _Atributos, _CamposSclRota, _CamposArquivo, _Datatypes, _ChavesFk, _TabelasFk, _TipoDadosSclRota : TStringList;
  i, _indiceCampo : Integer;
  _CdsTabelaSclRota : TClientDataSet;
  _ArrayParametro: array of Variant;
  _RequerIdContrato, _Cancela : Boolean;
  BaseCarga : TJvCsvDataSet;
  _aspas : Char;
begin
  if FileExists(aFileMapa) then
  begin
    _aspas := '"';
    _RequerIdContrato := False;
    LeIni(_Conta,aFileMapa,'CONTA','ChaveConta');
    LeIni(_ChaveObrigatoria,aFileMapa,'CONTA','ChaveObrigatoria');
    if _ChaveObrigatoria = FlagSim then
          _RequerIdContrato := True;
    LeIni(_ArqOrgem,aFileMapa,'FONTE','Arquivo');
    // Monta caminho completo da localizacao do arquivo origem
    _ArqOrgem := aPathBase + '\' + _ArqOrgem;
    // Tabela Destino
    LeIni(_TabelaDestino,aFileMapa,'DESTINO','Tabela');
    // Tipo de Arquivo
    LeIni(_TipoArquivo,aFileMapa,'TIPOARQUIVO','Extensao');
    // Caracter separador arquivo orgiem de dados
    LeIni(_Separador,aFileMapa,'SEPARADOR','Caracter');
    // Mapeamento
    _Mapa := TStringList.Create;
    _Datatypes := TStringList.Create;
    _TipoDadosSclRota := TStringList.Create;
    _Atributos := TStringList.Create;
    _CamposSclRota := TStringList.Create;
    _CamposArquivo := TStringList.Create;
    _FK := TStringList.Create;
    _ChavesFk := TStringList.Create;
    _TabelasFk := TStringList.Create;
    Result.Dados := TClientDataSet.Create(nil);
   // fNomeTabela := _TabelaDestino;

   // Verifica se a fonte de dados existe
    if not FileExists(_ArqOrgem) then
    begin
      Result.Sucesso := False;
      Result.Notificacao := 'Arquivo Não Encontrado ' + _ArqOrgem;
      Exit;
    end;

    LeSecaoIni(_Mapa,aFileMapa,'MAPA');
    // Extrai atributos do mapa
    for i := 0 to _Mapa.Count - 1 do
    begin
      _Atributos := arraystring(_Mapa.Strings[i],'=');
      _CamposArquivo.Add(Trim(_Atributos[0]));
      _CamposSclRota.Add(Trim(_Atributos[1]));
      _Atributos.Clear;
    end;

    LeSecaoIni(_Datatypes,aFileMapa,'DATATYPE');
    // Extrai tipo de dados dos atributos do mapa
    for i := 0 to _Datatypes.Count - 1 do
    begin
      _Atributos := arraystring(_Datatypes.Strings[i],'=');
      _TipoDadosSclRota.Add(Trim(_Atributos[0]));
      _TipoDadosSclRota.Add(Trim(_Atributos[1]));
      _Atributos.Clear;
    end;

    LeSecaoIni(_FK,aFileMapa,'FK');
    _Atributos.Clear;
    // Extrai Chaves estrangeiras requeridas dos atributos do mapa
    for i := 0 to _FK.Count - 1 do
    begin
      _Atributos := arraystring(_FK.Strings[i],'=');
      _ChavesFk.Add(Trim(_Atributos[0]));
      _TabelasFk.Add(Trim(_Atributos[1]));
      _Atributos.Clear;
    end;


    // Cria Dataset da tabela destino
    _CdsTabelaSclRota := TClientDataSet.Create(nil);
    _CdsTabelaSclRota.Close;
    for i := 0 to _CamposSclRota.Count - 1 do
    begin
      // Localiza o indice do campo na tabela de tipo de dados
      _indiceCampo := _TipoDadosSclRota.IndexOf(_CamposSclRota.Strings[i]);
      // Pega o nome do tipo de dados na coluna abaixo do nome do campo na tabela de tipo de dados
      _TipoCampo := _TipoDadosSclRota.Strings[_indiceCampo +1];
      if _TipoCampo = 'String' then
        _CdsTabelaSclRota.FieldDefs.Add(_CamposSclRota[i],ftString,80);
      if _TipoCampo = 'Float' then
        _CdsTabelaSclRota.FieldDefs.Add(_CamposSclRota[i],ftFloat);
      if _TipoCampo = 'Integer' then
        _CdsTabelaSclRota.FieldDefs.Add(_CamposSclRota[i],ftInteger);
      if _TipoCampo = 'Date' then
        _CdsTabelaSclRota.FieldDefs.Add(_CamposSclRota[i],ftDate);
      if _TipoCampo = 'DateTime' then
        _CdsTabelaSclRota.FieldDefs.Add(_CamposSclRota[i],ftDateTime);


    end;
    // Insere atributo do id obrigatorio do contrato
    (*
    if _RequerIdContrato then
     _CdsTabelaSclRota.FieldDefs.Add('Conta_id',ftInteger);
     *)
   _CdsTabelaSclRota.CreateDataSet;
    try
       // Carrega dataset com dados do arquivo origem
       BaseCarga := TJvCsvDataSet.Create(nil);
       BaseCarga := ExibeAmostraDados(_ArqOrgem,_Separador);
       if BaseCarga.RecordCount = 0   then
       begin
         Result.Sucesso := False;
         Result.Notificacao := ('Não foi possível abrir arquivo origem de dados: ' + _ArqOrgem );
         Exit;
       end;

       // Total de Registros Lidos do arquivo origem
      // FTotalRegistros := VSSCLRotaConsoleDTM.csvDataSet.RecordCount;


       // Carrega dados do arquivo origem para o cds da tabela sclrota
       BaseCarga.First;
       while not BaseCarga.Eof do
       begin
         // Arquivo de carga com dados de multiplas empresa, carrega somente dados da empresa ou filial selecionada
         if ( (MultiEmpresa.CargaMultipla) and (_TabelaDestino <> 'MotivoClto') ) then
         begin
           if (BaseCarga.FieldByName(_CamposArquivo.Strings[_CamposArquivo.IndexOf(MultiEmpresa.NomeAtributo)]).AsString <> MultiEmpresa.CodigoERP) then
           begin
             BaseCarga.Next;
             Continue;
           end;
         end;

         _CdsTabelaSclRota.Append;
         for i:= 0 to _CamposSclRota.Count -1 do
         begin
           // Localiza o indice do campo na tabela de tipo de dados
            _indiceCampo := _TipoDadosSclRota.IndexOf(_CamposSclRota.Strings[i]);
            // Pega o nome do tipo de dados na coluna abaixo do nome do campo na tabela de tipo de dados
            _TipoCampo := _TipoDadosSclRota.Strings[_indiceCampo +1];
            if _TipoCampo = 'String' then
              _CdsTabelaSclRota.FieldByName(_CamposSclRota[i]).AsString := Elimina(RemoveAcento(BaseCarga.FieldByName(_CamposArquivo.Strings[i]).AsString),_aspas);
            if _TipoCampo = 'Float' then
              if (not VarIsNull(BaseCarga.FieldByName(_CamposArquivo.Strings[i]).AsVariant)) then
              begin
                _CdsTabelaSclRota.FieldByName(_CamposSclRota[i]).AsFloat := BaseCarga.FieldByName(_CamposArquivo.Strings[i]).AsFloat;
              end;
            if _TipoCampo = 'Integer' then
              _CdsTabelaSclRota.FieldByName(_CamposSclRota[i]).AsInteger := BaseCarga.FieldByName(_CamposArquivo.Strings[i]).AsInteger;
            if _TipoCampo = 'Date' then
              _CdsTabelaSclRota.FieldByName(_CamposSclRota[i]).AsDateTime := BaseCarga.FieldByName(_CamposArquivo.Strings[i]).AsDateTime;
            if _TipoCampo = 'DateTime' then
              _CdsTabelaSclRota.FieldByName(_CamposSclRota[i]).AsDateTime := BaseCarga.FieldByName(_CamposArquivo.Strings[i]).AsDateTime;
           // Se o id da conta é requerido, popula atributo
          // if _RequerIdContrato then
          //    _CdsTabelaSclRota.FieldByName('Conta_id').AsInteger := StrToInt(DadosConta.IdConta);
         end;
         _CdsTabelaSclRota.Post;
         BaseCarga.Next;
       end;

        // Contador de Registros Inseridos
        // FContadorAtual := ContadorAtual + 1;
      (*
        // Atualiza totalizadores na interface de leitura
       if Assigned(NotificaInterface) then
         NotificaInterface;
       *)
       Result.Sucesso := True;
       Result.Dados := _CdsTabelaSclRota;
    finally
      _lista.Free;
      _Linha.Free;
      _Mapa.Free;
      _CamposSclRota.Free;
      _CamposArquivo.Free;
      _Datatypes.Free;
      _TipoDadosSclRota.Free;
      _FK.Free;
      _ChavesFk.Free;
      _TabelasFk.Free;
      BaseCarga.Free;
    end;
  end
  else // Não Localizou o arquivo mapeado
  begin
    Result.Sucesso := False;
    Result.Notificacao := 'Arquivo ' + aFileMapa + ' Não Encontrado na pasta origem!';
  end;
end;
function TrocaVirgPPto(Valor: string): String;
const
  CPonto = '.';
  CVirugula = ',';
var
  i:integer;
begin
  for i := 1 to Length(Valor) do
  if Pos(Valor[i], CVirugula) <> 0 then
    Valor[i] := CPonto;
  Result := Valor;
end;
function TrocaPtoPVirg(Valor: string): String;
const
  CPonto = '.';
  CVirugula = ',';
var
  i:integer;
begin
  for i := 1 to Length(Valor) do
  if Pos(Valor[i], CPonto) <> 0 then
    Valor[i] := CVirugula;
  Result := Valor;
end;
procedure MostraMsgErro(Msg :string);
begin
  MessageDlg(Msg, mtError, [mbOk], 0);
  abort;
end;

procedure MostraMsgInfo(Msg :string);
begin
  MessageDlg(Msg, mtInformation, [mbOk], 0);
end;

function MostraMsgConf(msg :string) :Boolean;
begin
  Result := (MessageDlg(Msg, mtConfirmation, [mbYes, mbNo], 0) = mrYes);
end;

// Consulta e exporta dados de cadastro da api do ws
function ExportDataWs(xMapasCarga: TMapasCarga): TStringList;
var
  xDataRetorno : TDadosRetorno;
  i, j, k, l: Integer;
  xData : TJSONArray;
  Registro: TJSONObject;
  keys, ArqSaida : TStringList;
  LinhaDados, NomeArquivo: string;

begin
  try
    // se a posição não estiver preenchida, avalia a proxima
    if (DadosConta.IdConta = EmptyStr) then
    Exit;
    Result := TStringList.Create;
    try
      Result.Append('--------------------------------------------------');
      Result.Append('Inicio da consulda dos dados no servidor: - ' + FormatDateTime('dd-MM-yyyy hh:mm:ss', Now()));
      Result.Append('--------------------------------------------------');
      // Exporta os arquivos da conta, metodo a metodo
      ArqSaida := TStringList.Create;
      for k := 1 to 15 do
      begin
        // Nome do arquivo de saída
        NomeArquivo := xMapasCarga.NomeArqSaida[k];

        if NomeArquivo = EmptyStr then
          Continue;

        // Le dados na API do WS
        xDataRetorno.Dados := EmptyStr;
        xDataRetorno.Sucesso := False;
        xDataRetorno := readMetodoApi(DadosConta.IdConta,xMapasCarga.MetodosRead[k]);
        if xDataRetorno.Sucesso then
        begin
          // Formata dados e gera o arquivo na pasta da conta ativa
          xData := TJSONArray.create(xDataRetorno.Dados);
          keys := TStringList.Create;
          keys.Clear;
          ArqSaida.Delimiter := '|';
          for j:= 0 to xData.length -1 do
          begin
             Registro := xData.getJSONObject(j);
             keys := Registro.keys;
             keys.Delimiter := '|';
             if (j = 0) then
               ArqSaida.Add(keys.DelimitedText);
             LinhaDados := EmptyStr;
             for l:= 0 to keys.Count -1 do
             begin
               LinhaDados := LinhaDados + Registro.getString(keys.Strings[l]) + '|';
             end;
             ArqSaida.Add(LinhaDados);
          end;
          // Gera o arquivo no diretório específico
          if DirectoryExists(DadosConta.PathArqCargaApi + '\Dump\' + DadosConta.IdConta) then
          begin
            NomeArquivo := DadosConta.PathArqCargaApi + '\Dump\' + DadosConta.IdConta + '\' +  NomeArquivo;
            ArqSaida.SaveToFile(NomeArquivo);
          end
          else
          begin
            ForceDirectories(DadosConta.PathArqCargaApi + '\Dump\' + DadosConta.IdConta);
            NomeArquivo := DadosConta.PathArqCargaApi + '\Dump\'+ DadosConta.IdConta + '\' + NomeArquivo;
            ArqSaida.SaveToFile(NomeArquivo);
          end;
          Result.Append('Arquivo gerado: '+ NomeArquivo);
          // Limpa dados do arquivo
          ArqSaida.Clear;
        end;
      end;
    except
      on e: Exception do
      begin
        Result.Append('Falha ao consultar arquivos no servidor');
        Result.Append('Mensagem de erro reportada:' + e.Message);
      end;
    end;
  finally
    xData.destroy;
    ArqSaida.Destroy;
    keys.Destroy;

  end;

end;
// Extrai versão do executável
function VersaoAplicativo(Executavel: string): string;
var
  S: string;
  n: Cardinal;
  Len: Cardinal;
  Buf: PChar;
  Value: PChar;
begin
  result := '';
  S := Executavel;
  n := GetFileVersionInfoSize(PChar(S), n);
  if n > 0 then
  begin
    Buf := AllocMem(n);
    try
      GetFileVersionInfo(PChar(S), 0, n, Buf);
      if VerQueryValue(Buf, PChar('StringFileInfo\041604E4\FileVersion'), Pointer(Value), Len) then
        Result := Value;
    finally
      FreeMem(Buf, n);
    end;
  end;
end;
procedure TrimAppMemorySize(pReinicia: Boolean; Programa:string);
var
MainHandle : THandle;
begin
 try
    try
      MainHandle := OpenProcess(PROCESS_ALL_ACCESS, false, GetCurrentProcessID) ;
      SetProcessWorkingSetSize(MainHandle, $FFFFFFFF, $FFFFFFFF) ;
      CloseHandle(MainHandle) ;
    except
    end;
    //Application.ProcessMessages;
 finally
   if pReinicia then
   begin
    ShellExecute(0,'open',PChar(Programa),nil,nil,SW_SHOWMINIMIZED);
    Application.Terminate;
   end;
 end;
end;

// Retorno o token e o doc da conta para limpeza de dados
function getToken(contaId: integer): TTokenConta;
begin
  case contaId  of
    30001:
    begin
      Result.Token := 's0456r';
      Result.Doc := '10.217.940/0001-90';
    end;
    40001:
    begin
      Result.Token := 's0637r';
      Result.Doc := '10.217.940/0001-90';
    end;
    70387:
    Result.Token := 's8796r';
    66603:
    begin
      Result.Token := 's7683r';
      Result.Doc := '66.301.334/0001-03';
    end;
    156007:
    begin
      Result.Token := 'hj1267l';
      Result.Doc := '60.963.972/0007-07';
    end;
    161908:
    begin
      Result.Token := 'hf1365';
      Result.Doc := '19.278.613/0016-08';
    end;
    191610:
    begin
      Result.Token := 'hg1209';
      Result.Doc := '16.568.348/0001-10';
    end;
    216647:
    begin
      Result.Token := 'ju9867';
      Result.Doc := '66.309.329/0001-47';
    end;
    176630:
    begin
      Result.Token := 'ghjl09';
      Result.Doc := '66.301.334/0002-94';
    end;
    246618:
    begin
      Result.Token := 'iuy1721';
      Result.Doc := '66.301.334/0006-18';
    end;
    111835:
    begin
      Result.Token := '9e7d-829f-1c0e-4818'; //'p8194h';
      Result.Doc := '18.780.254/0001-35';
    end;
    222647:
    begin
      Result.Token := 'ugh1876';
      Result.Doc := '26.189.084/0001-47';
    end;
    261679:
    begin
      Result.Token := 'qwc7612';
      Result.Doc := '16.736.928/0001-79';
    end;
    256656:
    begin
      Result.Token := 'hgs0912';
      Result.Doc := '66.301.334/0004-56';
    end;
    276607:
    begin
      Result.Token := 'hjs8745';
      Result.Doc := '66.301.334/0007-07';
    end;
    196680:
    begin
      Result.Token := 'hg1209';
      Result.Doc := '66.301.334/0008-80';
    end;
    20170:
    begin
      Result.Token := 'mi12-fg19-d154-4910'  ;
      Result.Doc := '01.405.821/0001-70';
    end;
    200465:
    begin
      Result.Token:= '6d696e61736d696c6b';
      Result.Doc  := '04.072.760/0001-65';
    end;
    298668:
    begin
      Result.Token:= '73616f766963656e74656d617472697a';
      Result.Doc  := '86.454.741/0001-68' ;
    end;
    308600:
    begin
     Result.Token:= '73616f766963656e746572697461706f6c6973';
     Result.Doc  := '86.454.741/0004-00';
    end;
    318691:
    begin
      Result.Token:= '73616f766963656e7465706572646f6573';
      Result.Doc  := '86.454.741/0005-91';
    end;
    322200:
    begin
     Result.Token:= '64656c7265796c61746963696e696f73';
     Result.Doc  := '22.430.532/0001-00';
    end;
    322108:
    begin
      Result.Token :=  '1g2j-819a-010y-4713';
      Result.Doc := '21.601.281/0001-08';
    end;
    11132:
    Result.Token := 's0167r';
    82009:
    Result.Token := 's9087c';
  end;
end;
// Funcoes das classes
{ TListaVisita }

function TListaVisita.getVisitaById(id: Integer): TVisita;
var
  _Index,i: Integer;
  _objVisita: TVisita;
begin
  if Assigned(Self) then
  begin
    Self.First;
    for i := 0 to Self.Count -1 do
    begin
      try
        _objVisita := TVisita.Create;
        Result := _objVisita;
        _objVisita := Self.GetItem(i) as TVisita;
        if _objVisita.Id = id then
        begin
          Result := _objVisita;
          Break;
        end
      finally
        ;
      end;
    end;
  end;

end;
{ TColeta }
function TColeta.toString( separator: Char;colNames: Boolean) : string;
begin
   Result := EmptyStr;
   if colNames then
   begin
     Result :=
     'id' + separator +
     'dt_push' + separator +
     'parada_id' + separator +
     'coletor_id' + separator +
     'tanque_id' + separator +
     'dt_coleta' + separator +
     'CodigoFazenda' + separator +
     'Fazenda'+ separator +
     'CodigoProdutor' + separator +
     'Produtor' + separator +
     'Tanque' + Separator +
     'Quantidade' + separator +
     'Regua' + separator +
     'Alizarol' + separator +
     'Amostra' + separator +
     'Contraprova' + separator +
     'Temperatura' + separator +
     'Coletada' + Separator +
     'CodigoLinha' + Separator +
     'NomeLinha' + Separator +
     'CodigoRota'+ separator +
     'Rota' + separator +
     'Veiculo' + separator +
     'CodigoMotorista' + separator +
     'NomeMotorista' + Separator +
     'dt_edicao' +  #13+#10;
   end;
   Result := Result +
    IntToStr(Self.Id) + separator +
    FormatDateTime('dd/MM/yyy hh:mm:ss', Self.dt_push)+ separator +
    IntToStr(Self.parada_id)+ separator +
    IntToStr(Self.coletor_id) + separator +
    IntToStr(Self.tanque_id) + separator +
    FormatDateTime('dd/MM/yyy hh:mm:ss', Self.dt_coleta)+ separator +
    Self.CodigoFazenda + separator +
    Self.Fazenda + separator +
    Self.CodigoProdutor + separator +
    Self.Produtor + separator +
    Self.tanque + separator +
    IntToStr(Self.quantidade) + separator +
    FormatFloat('###.##', Self.regua) + separator +
    Self.alizarol + separator +
    Self.amostra + separator +
    Self.contraprova + Separator +
    FormatFloat('##.##', Self.temperatura) + Separator +
    Self.coletada + separator +
    Self.CodigoLinha + separator +
    Self.NomeLinha + Separator +
    Self.CodigoRota + separator +
    Self.Rota + Separator +
    Self.Veiculo + Separator +
    Self.CodigoMotorista + separator +
    Self.NomeMotorista + separator +
    FormatDateTime('dd/MM/yyy hh:mm:ss',Self.dt_edicao);
end;
{ TListaColeta }

function TListaColeta.getColetaById(id: Integer): TColeta;
var
  _Index,i: Integer;
  _objColeta: TColeta;
begin
  if Assigned(Self) then
  begin
    Self.First;
    for i := 0 to Self.Count -1 do
    begin
      try
        _objColeta := TColeta.Create;
        Result := _objColeta;
        _objColeta := Self.GetItem(i) as TColeta;
        if _objColeta.Id = id then
        begin
          Result := _objColeta;
          Break;
        end
      finally
        ;
      end;
    end;

  end;
end;
{ TListaRota }
// Retorna o nome da rota
function TListaRota.getRotaByCodigo(Codigo: string): TRota;
var
  _Index: Integer;
  _objRota: TRota;
  i: Integer;
begin

  if Assigned(Self) then
  begin
    Self.First;
    for i := 0 to Self.Count -1 do
    begin
      try
        _objRota := TRota.Create;
        Result := _objRota;

        _objRota := Self.GetItem(i) as TRota;

        if _objRota.Codigo = Codigo then
        begin
          Result := _objRota;
          Break;
        end
      finally
        ;
      end;
    end;
  end;
end;
{ TListaLinha }

function TListaLinha.getLinhaByCodigo(Codigo: string): TLinha;
var
  _Index,i: Integer;
  _objLinha: TLinha;
begin
  if Assigned(Self) then
  begin
    Self.First;
    for i := 0 to Self.Count -1 do
    begin
      try
        _objLinha := TLinha.Create;
        Result := _objLinha;

        _objLinha := Self.GetItem(i) as TLinha;

        if _objLinha.Codigo = Codigo then
        begin
          Result := _objLinha;
          Break;
        end
      finally
        ;
      end;
    end;
  end;
end;

{ TListaProdutor }

function TListaProdutor.getProdutorByCodigo(Codigo: string): TProdutor;
var
  _Index,i: Integer;
  _objProdutor: TProdutor;
begin
  if Assigned(Self) then
  begin
    Self.First;
    for i := 0 to Self.Count -1 do
    begin
      try
        _objProdutor := TProdutor.Create;
        Result := _objProdutor;

        _objProdutor := Self.GetItem(i) as TProdutor;

        if _objProdutor.Codigo = Codigo then
        begin
          Result := _objProdutor;
          Break;
        end
      finally
        ;
      end;
    end;
  end;

end;

{ TListaFazenda }
function TListaFazenda.getFazendaByCodigo(Codigo: string): TFazenda;
var
  _Index,i: Integer;
  _objFazenda: TFazenda;
begin
  if Assigned(Self) then
  begin
    Self.First;
    for i := 0 to Self.Count -1 do
    begin
      try
        _objFazenda := TFazenda.Create;
        Result := _objFazenda;

        _objFazenda := Self.GetItem(i) as TFazenda;

        if _objFazenda.Codigo = Codigo then
        begin
          Result := _objFazenda;
          Break;
        end
      finally
        ;
      end;
    end;
  end;
end;

{ TListaColetor }

function TListaColetor.getColetorByCodigo(Codigo: string): TColetor;
var
  _Index,i: Integer;
  _objColetor: TColetor;
begin
  if Assigned(Self) then
  begin
    Self.First;
    for i := 0 to Self.Count -1 do
    begin
      try
        _objColetor := TColetor.Create;
        Result := _objColetor;

        _objColetor := Self.GetItem(i) as TColetor;

        if _objColetor.Codigo = Codigo then
        begin
          Result := _objColetor;
          Break;
        end
      finally
        ;
      end;
    end;
  end;

end;

{ TListaVeiculo }

function TListaVeiculo.getVeiculoByCodigo(Codigo: string): TVeiculo;
var
  _Index,i: Integer;
  _objVeiculo: TVeiculo;
begin
  if Assigned(Self) then
  begin
    Self.First;
    for i := 0 to Self.Count -1 do
    begin
      try
        _objVeiculo := TVeiculo.Create;
        Result := _objVeiculo;

        _objVeiculo := Self.GetItem(i) as TVeiculo;

        if _objVeiculo.Codigo = Codigo then
        begin
          Result := _objVeiculo;
          Break;
        end
      finally
        ;
      end;
    end;
  end;

end;
{ TListaRegViagem }

function TListaRegViagem.getViagemById(id: Integer): TRegViagem;
var
  _Index,i: Integer;
  _objRegViagem: TRegViagem;
begin
  if Assigned(Self) then
  begin
    Self.First;
    for i := 0 to Self.Count -1 do
    begin
      try
        _objRegViagem := TRegViagem.Create;
        Result := _objRegViagem;
        _objRegViagem := Self.GetItem(i) as TRegViagem;
        if _objRegViagem.id = id then
        begin
          Result := _objRegViagem;
          Break;
        end
      finally
        ;
      end;
    end;
  end;
end;
{ TSigaProdutor }
// Gera linha de dados com informações do cadastro de produtores SIGA
function TSigaProdutor.toString(separador: Char): string;
begin
  Result :=
    Self.idRegistro + separador +
    Self.nomeProdutor + separador +
    Self.codigoProdutor + separador +
    Self.filiaProdutor + separador +
    Self.status
end;

{ TSigaTransportador }
// Gera linha de dados com cadastro dos transportadores SIGA
function TSigaTransportador.toString(separador: Char): string;
begin
  Result :=
    Self.idRegistro + separador +
    Self.codigoTransportador + separador +
    Self.nomeTransportador;
end;
{ TSigaEquipamentos }
// Gera linha de dados dos registros dos equipamentos para o sistema SIGA
function TSigaEquipamentos.toString(separador: Char): string;
begin
  Result :=
    Self.idRegistro + separador +
    Self.codigoEquipamento + separador +
    Self.placaChassi + separador +
    Self.tipo ;
end;
{ TSigaColetaIndividual }
// Gera linha de dados com informações da coleta para o sistema SIGA
function TSigaColetaIndividual.toString(separador: Char): string;
begin
  Result :=
    Self.idRegistro + separador +
    Self.veiculo + separador +
    FormatDateTime('dd/MM/yyy hh:mm',Self.recepcao) + separador +
    FormatDateTime('dd/MM/yyy hh:mm',Self.dtColeta) + separador +
    Self.fornecedor + separador +
    Self.filial + separador +
    IntToStr(Self.volume) + separador +
    FloatToStr(Self.temperatura) + separador +
    Self.amostra + separador +
    Self.alizarol + separador +
    Self.amostraRede
end;
{ TSigaViagem }

function TSigaViagem.toString(Separador: Char): string;
begin
  Result := Self.idRegistro + Separador +

            Self.rota + Separador  +
            Self.ramal + Separador +
            FormatDateTime('dd/MM/yyy hh:mm',Self.inicio) + separador +
            FormatDateTime('dd/MM/yyy hh:mm',Self.final) + separador +
            Self.equipamento + Separador +
            Self.transportador + Separador +
            IntToStr(Self.volumecoleta) + separador +
            FormatDateTime('dd/MM/yyy hh:mm',Self.dtRecepcao) + separador +
            Self.recebido + Separador +
            Self.motivo + Separador +
            FloatToStr(Self.temperatura) + separador +
            IntToStr(Self.volumeEfetivo) + separador +
            Self.alizarol + Separador +
            FormatDateTime('dd/MM/yyy hh:mm',Self.fimDescarga);
end;

// Auxiliares

procedure GerarArquivoViagem(Viagem: TViagem);
var
  ArquivoDados: TStringList;
  NomeArqViagem: string;
  NomePasta: string;
begin
  ArquivoDados := TStringList.Create;
  try
    ArquivoDados.Add(GerarLinhaArquivo(Viagem, 1));
    ArquivoDados.Add(GerarLinhaArquivo(Viagem, 2));
    //79120 = nº identificador da viagem 211015 = data do dia do arquivo 145559 = hr/min/seg
    NomePasta := IncludeTrailingBackslash(DadosConta.PathArqDescarga) + DadosConta.IdConta + '\' + 'atesto\'+
    FormatDateTime('yyyyMM',Date()) + '\' ;
    NomeArqViagem :=  NomePasta + IntToStr(Viagem.id) + '_' + FormatDateTime('ddMMyy_hhmmss', Viagem.DatAbertura) + '.txt';
    if not DirectoryExists(NomePasta) then
    begin
      ForceDirectories(NomePasta);
    end;

    ArquivoDados.SaveToFile(NomeArqViagem);
    InserirMsgLog('Arquivo Gerado ' + NomeArqViagem);
  finally
    ArquivoDados.Free;
  end;
end;
function GerarLinhaArquivo(ObjViagem: TViagem; TipoLinhaColeta: byte): string;
var
  CodigoItem, CodigoDeposito, Conta: string;
  DescColeta: string;
  Linha: string;
  DataAux: string;
  Quantidade: Double;
  TipoTransacao: string;
begin
  CodigoDeposito := 'CQ';
  CodigoItem := '01.001.0001';

  if TipoLinhaColeta = 1 then
  begin
    // Tipo COLETA
    Conta := '90000013';
    DescColeta := PreencheEspacoDireita('COLETA', 16);
    Quantidade := ObjViagem.QtdeColetado;
    TipoTransacao := '1';
  end
  else
  begin
    // Tipo COLETA
    Conta := '42010102';
    DescColeta := PreencheEspacoDireita('COLETA-A', 16);
    // Dif. Atesto
    Quantidade := (ObjViagem.QtdeArmazenado - ObjViagem.QtdeColetado);
    if Quantidade >= 0 then
      TipoTransacao := '1'
    else
      TipoTransacao := '2';
  end;
  Linha := CodigoItem;
  Linha := Linha + ';' + StringOfChar(' ', 3);
  Linha := Linha + ';' + CodigoDeposito;
  Linha := Linha + ';' + StringOfChar(' ', 10);
  Linha := Linha + ';' + IntToStr(ObjViagem.id);
  Linha := Linha + ';' + FormatDateTime('MM/dd/YYYY', ObjViagem.DatAbertura + 3);
  Linha := Linha + ';' + StringOfChar(' ', 10);
  Linha := Linha + ';' + StringOfChar(' ', 11);
  Linha := Linha + ';' + Conta;
  Linha := Linha + ';' + StringOfChar('0', 9);
  Linha := Linha + ';' + StringOfChar(' ', 5);
  Linha := Linha + ';' + DescColeta;
  Linha := Linha + ';' + TipoTransacao;
  Linha := Linha + ';' + StringReplace(FloatToStrF(Abs(Quantidade), ffFixed, 12, 4), '.', ',', []);
  Linha := Linha + ';' + 'LT';
  Linha := Linha + ';' + '0,01';
  Linha := Linha + ';' + '0,00';
  Linha := Linha + ';' + '0,00';
  Linha := Linha + ';' + '0,00';
  Linha := Linha + ';' + '0,00';
  Linha := Linha + ';' + '0,00';
  Linha := Linha + ';' + '0,00';
  Linha := Linha + ';' + '0,00';
  Linha := Linha + ';' + '0,00';
  Linha := Linha + ';' + StringOfChar(' ', 8);
  Linha := Linha + ';' + StringOfChar(' ', 20);
  Linha := Linha + ';' + StringOfChar(' ', 20);
  Linha := Linha + ';' + 'N';
  Linha := Linha + ';' + '0';
  // Mes/Dia/Ano
  DataAux := FormatDateTime('MM/dd/YYYY', ObjViagem.DatAbertura);
  Linha := Linha + ';' + DataAux;
  Linha := Linha + ';' + 'PL';
  Linha := Linha + ';' + StringOfChar(' ', 3);
  Linha := Linha + ';' + '101';
  Linha := Linha + ';' + StringOfChar(' ', 5);
  Linha := Linha + ';';
  Result := Linha;
end;

procedure EnviarNotificacao(Viagem: TViagem; Mensagem: string);
var
  DadosRetorno: TDadosRetorno;
begin
  DadosRetorno := sendNotificacaoRota(Viagem.RotaCodigo, Mensagem);
  if not DadosRetorno.Sucesso then
    raise Exception.Create('Erro Enviar Notificação Rota:' + DadosRetorno.Mensagem);
end;

function GetData(Data: string): TDateTime; //2015-09-29
var
  Ano, Mes, Dia: Integer;
begin
  if (Data <> EmptyStr) and (Data <> 'null') then
  begin
    Ano := StrToIntDef(Copy(Data, 1, 4), 1);
    Mes := StrToIntDef(Copy(Data, 6, 2), 1);
    Dia := StrToIntDef(Copy(Data, 9, 2), 2000);
    if (Ano > 0) and (Mes > 0) and (Dia > 0) then
      Result := EncodeDate(Ano, Mes, Dia);
  end;
end;
function GetDataHora(Data: string): TDateTime; // 2016-12-05 16:43:55
var
  Ano, Mes, Dia: Integer;
  Hora, Minuto, Segundo, ms: Word;
begin
  if (Data <> EmptyStr) and (Data <> 'null') then
  begin
    Ano := StrToIntDef(Copy(Data, 1, 4), 1);
    Mes := StrToIntDef(Copy(Data, 6, 2), 1);
    Dia := StrToIntDef(Copy(Data, 9, 2), 2000);
    hora := StrToIntDef(Copy(Data, 12, 2), 1);
    Minuto := StrToIntDef(Copy(Data, 15, 2), 1);
    Segundo := StrToIntDef(Copy(Data, 18, 2), 1);
    ms := 0;
    if (Ano > 0) and (Mes > 0) and (Dia > 0) then
      Result := EncodeDateTime(Ano, Mes, Dia,Hora,Minuto,Segundo,ms) ;
  end;
end;
function ValidaInt(Numero: string): Integer;
var
  _Saida: Integer;
begin
  if TryStrToInt(numero,_Saida) then
    Result := _Saida
  else
    Result := 0;
end;

end.
