{Fórmula :: Armazenado - Coletado}
unit uVSSCLRotaConsoleDTM;

interface

uses
  Windows, SysUtils, Classes, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, uJSON, JvTimer,
  JvAppInst, ExtCtrls, JvScheduledEvents, UCBase, UCZEOSConn, DBClient, WebAdapt,
  uVSSCLRotaComum, uRotinasComuns;

type
  TViagem = class
    Id: Integer;
    Index: Integer;
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
    motivo: string[255];
    cancelado: string[1];
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
  TVSSCLRotaConsoleDTM = class(TDataModule)
    zcnnRota: TZConnection;
    qryParametros: TZQuery;
    ucRota: TUCZEOSConn;
    qryDescarga: TZQuery;
    qryParametrosParContaId: TIntegerField;
    qryParametrosParDatUltLeituraDescargaWS: TDateField;
    qryParametrosParPathArqDescarga: TStringField;
    qrySQL: TZQuery;
    apiConsole: TJvAppInstances;
    qryParametrosParPercAtesto: TFloatField;
    qryParametrosParHostURL: TStringField;
    qryParametrosParLog: TStringField;
    qryParametrosParProxyHost: TStringField;
    qryParametrosParProxyPorta: TStringField;
    qryParametrosParProxyUsuario: TStringField;
    qryParametrosParProxySenha: TStringField;
    qryParametrosParIntervalo: TFloatField;
    qryParametrosParProxyUsar: TStringField;
    qryParametrosParEnviarNotifAtesto: TStringField;
    qryParametrosParDatIniLeituraDescargaWS: TDateField;
    tmrConsole: TTimer;
    sheConsole: TJvScheduledEvents;
    qryAux: TZQuery;
    cdsParametrosParGeraTotvsDatasul: TStringField;
    cdsParametrosParGeraTotvsRm: TStringField;
    cdsParametrosParGeraMagis: TStringField;
    cdsParametrosParGeraMeta: TStringField;
    cdsParametrosParGeraSiga: TStringField;
    cdsColetas: TClientDataSet;
    cdsColetasid: TIntegerField;
    cdsColetasdt_push: TDateTimeField;
    cdsColetasparada_id: TIntegerField;
    cdsColetascoletor_id: TIntegerField;
    cdsColetastanque_id: TIntegerField;
    cdsColetasdt_coleta: TDateTimeField;
    cdsColetasCodigoFazenda: TWideStringField;
    cdsColetasFazenda: TWideStringField;
    cdsColetasCodigoProdutor: TWideStringField;
    cdsColetasProdutor: TWideStringField;
    cdsColetastanque: TWideStringField;
    cdsColetasregua: TFloatField;
    cdsColetasalizarol: TWideStringField;
    cdsColetasamostra: TWideStringField;
    cdsColetascontraprova: TWideStringField;
    cdsColetastemperatura: TFloatField;
    cdsColetascoletada: TWideStringField;
    cdsColetasCodigoLinha: TWideStringField;
    cdsColetasNomeLinha: TWideStringField;
    cdsColetasCodigoRota: TWideStringField;
    cdsColetasRota: TWideStringField;
    cdsColetasVeiculo: TWideStringField;
    cdsColetasCodigoMotorista: TWideStringField;
    cdsColetasNomeMotorista: TWideStringField;
    cdsColetasdt_edicao: TDateTimeField;
    cdsColetasviagem_id: TIntegerField;
    cdsRota: TClientDataSet;
    cdsRotaCodigo: TStringField;
    cdsRotaNome: TStringField;
    cdsRotatipo_descarga: TStringField;
    cdsRotagruporota: TStringField;
    cdsLinha: TClientDataSet;
    cdsLinhaCodigo: TStringField;
    cdsLinhaNome: TStringField;
    cdsLinhaRota: TStringField;
    cdsProdutor: TClientDataSet;
    cdsProdutorInscricao: TStringField;
    cdsProdutorUltimaColeta: TStringField;
    cdsProdutorQtdColeta: TFloatField;
    cdsProdutorLinha: TStringField;
    cdsProdutorCodigo: TStringField;
    cdsProdutorNome: TStringField;
    cdsProdutordoc: TStringField;
    cdsProdutorLogradouro: TStringField;
    cdsProdutorNumero: TStringField;
    cdsProdutorBairro: TStringField;
    cdsProdutorCidade: TStringField;
    cdsProdutorUf: TStringField;
    cdsProdutorCep: TStringField;
    cdsColetor: TClientDataSet;
    cdsColetorCodigo: TStringField;
    cdsColetorNome: TStringField;
    cdsColetorcpf: TStringField;
    cdsColetorrg: TStringField;
    cdsColetorcnh: TStringField;
    cdsVeiculos: TClientDataSet;
    cdsVeiculosuf: TStringField;
    cdsVeiculosrntc: TStringField;
    cdsVeiculoscodigo: TStringField;
    cdsVeiculosplaca: TStringField;
    cdsVeiculostipo: TStringField;
    cdsVeiculospesobruto: TFloatField;
    cdsVeiculospesoliquido: TFloatField;
    cdsVeiculoscapacidade: TFloatField;
    cdsFazendas: TClientDataSet;
    cdsFazendascodigo: TStringField;
    cdsFazendasnome: TStringField;
    cdsFazendaslogradouro: TStringField;
    cdsFazendasnumero: TStringField;
    cdsFazendasbairro: TStringField;
    cdsFazendasmunicipio: TStringField;
    cdsFazendasuf: TStringField;
    cdsFazendascep: TStringField;
    cdsFazendasproducao: TFloatField;
    cdsFazendaslatitude: TStringField;
    cdsFazendaslongitude: TStringField;
    cdsFazendasprodutor: TStringField;
    cdsViagens: TClientDataSet;
    cdsViagensid: TIntegerField;
    cdsViagensveiculo_id: TIntegerField;
    cdsViagenscoletor_id: TIntegerField;
    cdsViagenslinha_id: TIntegerField;
    cdsViagensrota_id: TIntegerField;
    cdsViagensdt_push: TDateTimeField;
    cdsViagensdt_abertura: TDateTimeField;
    cdsViagensdt_fechamento: TDateTimeField;
    cdsViagenskm_inicial: TFloatField;
    cdsViagenskm_final: TFloatField;
    cdsViagensrota: TWideStringField;
    cdsViagensveiculo: TWideStringField;
    cdsViagenslinha: TWideStringField;
    cdsViagenscoletor: TWideStringField;
    cdsViagensdt_liberacao: TDateTimeField;
    cdsViagenskm_distancia: TIntegerField;
    cdsViagenskm_padrao: TIntegerField;
    cdsViagenskm_real: TIntegerField;
    cdsViagenskm_justificativa: TWideStringField;
    cdsVeiculosid: TIntegerField;
    cdsViagensNomeLinha: TStringField;
    cdsViagensNomeRota: TStringField;
    cdsViagensNomeColetor: TStringField;
    cdsLinhadistancia: TIntegerField;
    cdsViagensPlacaVeiculo: TStringField;
    cdsParametrosParVerDatasul: TStringField;
    cdsParametrosParVerRm: TStringField;
    cdsParametrosParVerMagis: TStringField;
    cdsParametrosParVerMeta: TStringField;
    cdsParametrosParVerSiga: TStringField;
    cdsViagensNumeroViagem: TIntegerField;
    cdsParametrosParGeraScl: TStringField;
    cdsParametrosParVerScl: TStringField;
    cdsParametrosParPathArqDatasul: TStringField;
    cdsParametrosParPathArqRm: TStringField;
    cdsParametrosParPathArqMagis: TStringField;
    cdsParametrosParPathArqMeta: TStringField;
    cdsParametrosParPathArqSiga: TStringField;
    cdsParametrosParPathArqScl: TStringField;
    qryApoio: TZQuery;
    cdsParametrosParContaId1: TIntegerField;
    cdsParametrosParContaId2: TIntegerField;
    cdsParametrosParContaId3: TIntegerField;
    cdsParametrosParContaId4: TIntegerField;
    cdsParametrosParContaId5: TIntegerField;
    cdsParametrosParContaId6: TIntegerField;
    cdsColetasquantidade: TIntegerField;
    cdsViagenscomunitario_pendente: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure tmrConsoleTimer(Sender: TObject);
    procedure sheConsoleEvents0Execute(Sender: TJvEventCollectionItem;
      const IsSnoozeEvent: Boolean);
  private
    FAplicacaoAtiva: Boolean;
    procedure PersistirLogViagem(Viagem: TViagem);
    procedure GerarArquivoViagem(Viagem: TViagem);
    procedure EnviarNotificacao(Viagem: TViagem; Mensagem: string);
    function GetData(Data: string): TDateTime;
    function GetDataHora(Data: string): TDateTime;
    function ValidaInt(Numero: string): Integer;
  public
    procedure PopulaAtoresColeta(DataInicio, DataTermino: TDateTime; Sync:string; Comunitario: string = '9');
    procedure ExportarDescargas;
    procedure ExportarColetas;
    procedure ExportaScl;
    procedure ExportaSiga;
    procedure AtualizarDatLeituraParam(Data: TDateTime);
    function GetDescargas(DataInicio, DataTermino: TDateTime; FlgAtualizaUltDataLeitura: Boolean = False): string;
    function GerarLinhaArquivo(ObjViagem: TViagem; TipoLinhaColeta: byte): string;
    procedure SalvarDadosParametros;
    function columnExistsSqlite(aTableName,aColumn, aDataType, aSize: string; create:Boolean = False):Boolean;

    // Coletas
    function GetColetas(DataInicio, DataTermino: TDateTime; Sync:string; Comunitario: string = '9'; FlgAtualizaUltDataLeitura: Boolean = False): String;
    function OrdenaCrescente(Par01, Par02: Pointer): Integer;
    function coletasToString(cds: TClientDataSet; separator: Char;colNames: Boolean): string;
    function coletasToStringInt(cds, Viagem: TClientDataSet; separator: Char;colNames: Boolean; Registro: Byte): string ; // Integrado com dados da viagem
    // Rastreabilidade SIGA
    function GetDadosSiga(DataInicio, DataTermino: TDateTime; Sync:string; Comunitario: string = '9'; FlgAtualizaUltDataLeitura: Boolean = False): String;

  end;

var
  VSSCLRotaConsoleDTM: TVSSCLRotaConsoleDTM;

  DadosRetornoColeta: TDadosRetorno;
  DadosRetornoRota, DadosRetornoLinha, DadosRetornoColetor, DadoRetornoVeiculo,
  DadosRetornoProdutor, DadosRetornoFazenda, DadosRetornoVeiculo, DadosRetornoVisita,
  DadosRetornoViagem: TDadosRetorno;

  IdDescarga: Integer;
  arqTexto, ArqRename, ArqSigaColetor, ArqSigaProdutor: string;
  _VerMagis : string;

  i, j: Integer;
  _ArqSaida, _ArqCadSiga : TStringList;
  ColecaoDescarga, ColecaoViagem, ColecaoRota, ColecaoLinha, ColecaoColetor, ColecaoVeiculo,
  ColecaoProdutor, ColecaoFazenda, ColecaoColeta, ColecaoVisita : TJSONArray;
  Descarga, Viagem, Rota, Linha, Coleta, Coletor, Veiculo, Produtor, Fazenda, Visita: TJSONObject;
  DifQtdeColeta: Double;
  FlgGerarArq: Boolean;
  FlgGeraCabec: Boolean;
  FlgExisteDescarga: Boolean;
  ArquivoDados: TStringList;
  DataInicioStr, DataTerminoStr: string;
  ObjViagem: TViagem;
  objRegViagem, AuxRegViagem: TRegViagem;
  objColeta, AuxColeta: TColeta;
  objRota, AuxRota: TRota;
  objLinha, AuxLinha: TLinha;
  objColetor, AuxColetor: TColetor;
  objVeiculo, AuxVeiculo: TVeiculo;
  objProdutor, AuxProdutor: TProdutor;
  objFazenda, AuxFazenda: TFazenda;
  objVisita, AuxVisita: TVisita;
  objTranspSiga : TSigaTransportador;
  objProutorSiga : TSigaProdutor;
  ListaColeta: TListaColeta;
  ListaRota: TListaRota;
  ListaLinha: TListaLinha;
  ListaColetor: TListaColetor;
  ListaProdutor: TListaProdutor;
  ListaFazenda: TListaFazenda;
  ListaVeiculo: TListaVeiculo;
  ListaVisita: TListaVisita;
  ListaRegViagem: TListaRegViagem;
  DatAultColeta: TDateTime;


implementation

uses
   uGlobal, DateUtils, Math, StrUtils,
  Contnrs;

  {$R *.dfm}


procedure TVSSCLRotaConsoleDTM.DataModuleCreate(Sender: TObject);
var
  PathBancoDados: string;
  PathAplicacao: string;
begin
 // Ativa conexão com o banco de dados
  PathAplicacao := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
  PathBancoDados := PathAplicacao + 'VSSCLRota.db';
  if FileExists(PathBancoDados) then
  begin
    try
      zcnnRota.Database := PathBancoDados;
      zcnnRota.LibraryLocation := PathAplicacao + 'sqlite3.dll';
      zcnnRota.Protocol := 'sqlite-3';
      zcnnRota.Connected := true;

      // Verifica a existencia de coluna novas
      columnExistsSqlite('parametros','ParGeraTotvsDatasul', 'Varchar(01)', EmptyStr, True);
      columnExistsSqlite('parametros','ParGeraTotvsRm', 'Varchar(01)', EmptyStr, True);
      columnExistsSqlite('parametros','ParGeraMagis', 'Varchar(01)', EmptyStr, True);
      columnExistsSqlite('parametros','ParGeraMeta', 'Varchar(01)', EmptyStr, True);
      columnExistsSqlite('parametros','ParGeraSiga', 'Varchar(01)', EmptyStr, True);
      columnExistsSqlite('parametros','ParGeraScl', 'Varchar(01)', EmptyStr, True);
      columnExistsSqlite('parametros','ParVerDatasul', 'Varchar(01)', EmptyStr, True);
      columnExistsSqlite('parametros','ParVerRm', 'Varchar(01)', EmptyStr, True);
      columnExistsSqlite('parametros','ParVerMagis', 'Varchar(01)', EmptyStr, True);
      columnExistsSqlite('parametros','ParVerMeta', 'Varchar(01)', EmptyStr, True);
      columnExistsSqlite('parametros','ParVerSiga', 'Varchar(01)', EmptyStr, True);
      columnExistsSqlite('parametros','ParVerScl', 'Varchar(01)', EmptyStr, True);
      columnExistsSqlite('parametros','ParContaId1', 'integer', EmptyStr, True);
      columnExistsSqlite('parametros','ParContaId2', 'integer', EmptyStr, True);
      columnExistsSqlite('parametros','ParContaId3', 'integer', EmptyStr, True);
      columnExistsSqlite('parametros','ParContaId4', 'integer', EmptyStr, True);
      columnExistsSqlite('parametros','ParContaId5', 'integer', EmptyStr, True);
      columnExistsSqlite('parametros','ParContaId6', 'integer', EmptyStr, True);

      // Parametros - Local de saida dos arquivos gerados
      columnExistsSqlite('parametros','ParPathArqDatasul', 'Varchar(255)', EmptyStr, True);
      columnExistsSqlite('parametros','ParPathArqRm', 'Varchar(255)', EmptyStr, True);
      columnExistsSqlite('parametros','ParPathArqMagis', 'Varchar(255)', EmptyStr, True);
      columnExistsSqlite('parametros','ParPathArqMeta', 'Varchar(255)', EmptyStr, True);
      columnExistsSqlite('parametros','ParPathArqSiga', 'Varchar(255)', EmptyStr, True);
      columnExistsSqlite('parametros','ParPathArqScl', 'Varchar(255)', EmptyStr, True);


      // LogViagem - Controle de Geração de arquivos
      columnExistsSqlite('LogViagem','LovGerDatasul', 'Varchar(01)', EmptyStr, True);
      columnExistsSqlite('LogViagem','LovGerRm', 'Varchar(01)', EmptyStr, True);
      columnExistsSqlite('LogViagem','LovGerMagis', 'Varchar(01)', EmptyStr, True);
      columnExistsSqlite('LogViagem','LovGerMeta', 'Varchar(01)', EmptyStr, True);
      columnExistsSqlite('LogViagem','LovGerSiga', 'Varchar(01)', EmptyStr, True);
      columnExistsSqlite('LogViagem','LovGerScl', 'Varchar(01)', EmptyStr, True);
      columnExistsSqlite('LogViagem','LovColetor', 'Varchar(15)', EmptyStr, True);
      columnExistsSqlite('LogViagem','LovVeiculo', 'Varchar(15)', EmptyStr, True);
      columnExistsSqlite('LogViagem','LovDataViagem', 'Date', EmptyStr, True);
      columnExistsSqlite('LogViagem','LovIndex', 'integer', EmptyStr, True);


    except
      MostraMsgErro('Falha ao abrir banco de dados');
    end;
  end
  else
  begin
    MostraMsgInfo('Arquivo de Banco de Dados [VSSCLRota.db] não localizado, Aplicativo Será Finalizado !');
    Halt;
  end;
  qryParametros.Open;
  qryDescarga.Open;
  PopularDadosConta(qryParametros);
  tmrConsole.Enabled := True;
  tmrConsole.Interval := Trunc(DadosConta.TimerProcInterno * 60000); // Minutos
end;

procedure TVSSCLRotaConsoleDTM.AtualizarDatLeituraParam(Data: TDateTime);
begin
  qrySQL.SQL.Text := 'update Parametros set ParDatIniLeituraDescargaWS = :ParDatIniLeituraDescargaWS, '+
    'ParDatUltLeituraDescargaWS = :ParDatUltLeituraDescargaWS';
  qrySQL.ParamByName('ParDatIniLeituraDescargaWS').Value := Data;
  qrySQL.ParamByName('ParDatUltLeituraDescargaWS').Value := Data;
  qrySQL.ExecSQL;
end;

function TVSSCLRotaConsoleDTM.GetDescargas(DataInicio, DataTermino: TDateTime; FlgAtualizaUltDataLeitura: Boolean = False): string;
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
    qrySQL.ParamByName('LodDescargaId').Value := IdDescarga;
    qrySQL.Open;

    Result := not qrySQL.IsEmpty;
  end;

  function ViagemJahProcessada(IdViagem: Integer): Boolean;
  begin
    qrySQL.Close;
    qrySQL.SQL.Text := 'SELECT 1 FROM LogViagem WHERE LovViagemId = :Id and LovGerDatasul = :LovGerDatasul';
    qrySQL.ParamByName('Id').Value := IdViagem;
    qrySQL.ParamByName('LovGerDatasul').Value := FlagSim;
    qrySQL.Open;

    Result := not qrySQL.IsEmpty;
  end;

  function ViagemJahRegistrada(idViagem: Integer): TViagem;
  begin
    Result := TViagem.Create;
    qrySQL.Close;
    qrySQL.SQL.Text := 'Select * from LogViagem WHERE LovViagemId = :Id';
    qrySQL.ParamByName('Id').Value := idViagem;
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
    DadosRetornoDescarga := readDescarga(DataInicioStr, DataTerminoStr);
    DadosRetornoViagem := readViagem(DataInicioStr, DataTerminoStr);
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

        //Atualizar Parâmetros
        if FlgAtualizaUltDataLeitura then
          AtualizarDatLeituraParam(DataTermino);
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

function TVSSCLRotaConsoleDTM.GerarLinhaArquivo(ObjViagem: TViagem; TipoLinhaColeta: byte): string;
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

procedure TVSSCLRotaConsoleDTM.ExportarDescargas;
var
  DataProcIni, DataProcFim : TDateTime;
begin
  InserirMsgLog('Início Get Descargas.');
  try
    qryParametros.Close;
    qryParametros.Open;
    DataProcIni := qryParametrosParDatIniLeituraDescargaWS.AsDateTime;
    DataProcFim := Date;
    GetDescargas(DataProcIni, DataProcFim, False);
    InserirMsgLog('Término Get Descargas');
  except on E:Exception do
    InserirMsgLog('ERRO : ' + E.Message);
  end;
end;

procedure TVSSCLRotaConsoleDTM.GerarArquivoViagem(Viagem: TViagem);
var
  ArquivoDados: TStringList;
  NomeArqViagem: string;
begin
  ArquivoDados := TStringList.Create;
  try
    ArquivoDados.Add(GerarLinhaArquivo(Viagem, 1));
    ArquivoDados.Add(GerarLinhaArquivo(Viagem, 2));
    //79120 = nº identificador da viagem 211015 = data do dia do arquivo 145559 = hr/min/seg
    NomeArqViagem := IncludeTrailingBackslash(qryParametrosParPathArqDescarga.AsString) +
      IntToStr(Viagem.id) + '_' + FormatDateTime('ddMMyy_hhmmss', Viagem.DatAbertura) + '.txt';
    ArquivoDados.SaveToFile(NomeArqViagem);
    InserirMsgLog('Arquivo Gerado ' + NomeArqViagem);
  finally
    ArquivoDados.Free;
  end;
end;

procedure TVSSCLRotaConsoleDTM.SalvarDadosParametros;
begin
  qrySQL.SQL.Text := 'UPDATE Parametros SET ParContaId = :ParContaId, '+
  '  ParPathArqDescarga = :ParPathArqDescarga, ParPercAtesto = :ParPercAtesto, '+
  '  ParHostURL = :ParHostURL, ParLog = :ParLog, ParProxyHost = :ParProxyHost, '+
  '  ParProxyPorta = :ParProxyPorta, ParProxyUsuario = :ParProxyUsuario, '+
  '  ParProxySenha = :ParProxySenha, ParIntervalo = :ParIntervalo, ' +
  '  ParProxyUsar = :ParProxyUsar, ParEnviarNotifAtesto = :ParEnviarNotifAtesto, '+
  '  ParDatIniLeituraDescargaWS = :ParDatIniLeituraDescargaWS, ParGeraTotvsDatasul = :ParGeraTotvsDatasul, ' +
  '  PargeraTotvsRm = :ParGeraTotvsRm, ParGeraMagis = :ParGeraMagis, ParGeraMeta = :ParGeraMeta, ' +
  '  ParGeraSiga = :ParGeraSiga, ParGeraScl = :ParGeraScl, ParVerDatasul = :ParVerDatasul, ParVerRm = :ParVerRm, ParVerMagis = :ParVerMagis, ' +
  '  ParVerMeta = :ParVerMeta, ParVerSiga = :ParVerSiga, ParVerScl = :ParVerScl, ' +
  '  ParPathArqDatasul = :ParPathArqDatasul, ParPathArqRm = :ParPathArqRm, ParPathArqMagis = :ParPathArqMagis, ' +
  '  ParPathArqMeta = :ParPathArqMeta, ParPathArqSiga = :ParPathArqSiga, ParPathArqScl = :ParPathArqScl, ' +
  '  ParContaId1 =  :ParContaId1, ParContaId2 =  :ParContaId2, ParContaId3 =  :ParContaId3, ParContaId4 =  :ParContaId4, ' +
  '  ParContaId5 =  :ParContaId5, ParContaId6 =  :ParContaId6  ';

  qrySQL.ParamByName('ParContaId').Value := DadosConta.IdConta;
  qrySQL.ParamByName('ParPathArqDescarga').Value := DadosConta.PathArqDescarga;
  qrySQL.ParamByName('ParPercAtesto').Value := DadosConta.PercAtesto;
  qrySQL.ParamByName('ParHostURL').Value := DadosConta.HostURL;
  qrySQL.ParamByName('ParLog').Value := BooleanToStr(DadosConta.Log);
  qrySQL.ParamByName('ParProxyHost').Value := DadosConta.DadosProxy.Host;
  qrySQL.ParamByName('ParProxyPorta').Value := DadosConta.DadosProxy.Porta;
  qrySQL.ParamByName('ParProxyUsuario').Value := DadosConta.DadosProxy.Usuario;
  qrySQL.ParamByName('ParProxySenha').Value := DadosConta.DadosProxy.Senha;
  qrySQL.ParamByName('ParIntervalo').Value := DadosConta.TimerProcInterno;
  qrySQL.ParamByName('ParProxyUsar').Value := DadosConta.UsarPRoxy;
  qrySQL.ParamByName('ParEnviarNotifAtesto').Value := BooleanToStr(DadosConta.EnviarNotifiAtesto);
  qrySQL.ParamByName('ParDatIniLeituraDescargaWS').Value := DadosConta.DatIniLeituraDescargaWS;
  qrySQL.ParamByName('ParGeraTotvsDatasul').Value := DadosConta.GeraTotvsDatasul;
  qrySQL.ParamByName('ParGeraTotvsRm').Value := DadosConta.GeraTotvsRm;
  qrySQL.ParamByName('ParGeraMagis').Value := DadosConta.GeraMagis;
  qrySQL.ParamByName('ParGeraMeta').Value := DadosConta.GeraMeta;
  qrySQL.ParamByName('ParGeraSiga').Value := DadosConta.GeraSiga;
  qrySQL.ParamByName('ParGeraScl').Value := DadosConta.GeraScl;
  qrySQL.ParamByName('ParVerDatasul').Value := DadosConta.VerDatasul;
  qrySQL.ParamByName('ParVerRm').Value := DadosConta.VerRm;
  qrySQL.ParamByName('ParVerMagis').Value := DadosConta.VerMagis;
  qrySQL.ParamByName('ParVerMeta').Value := DadosConta.VerMeta;
  qrySQL.ParamByName('ParVerSiga').Value := DadosConta.VerSiga;
  qrySQL.ParamByName('ParVerScl').Value := DadosConta.VerScl;
  qrySQL.ParamByName('ParPathArqDatasul').Value := DadosConta.PathArqDatasul;
  qrySQL.ParamByName('ParPathArqRm').Value := DadosConta.PathArqRm;
  qrySQL.ParamByName('ParPathArqMagis').Value := DadosConta.PathArqMagis;
  qrySQL.ParamByName('ParPathArqMeta').Value := DadosConta.PathArqMeta;
  qrySQL.ParamByName('ParPathArqSiga').Value := DadosConta.PathArqSiga;
  qrySQL.ParamByName('ParPathArqScl').Value := DadosConta.PathArqScl;
  qrySQL.ParamByName('ParContaId1').Value := DadosConta.IdConta1;
  qrySQL.ParamByName('ParContaId2').Value := DadosConta.IdConta2;
  qrySQL.ParamByName('ParContaId3').Value := DadosConta.IdConta3;
  qrySQL.ParamByName('ParContaId4').Value := DadosConta.IdConta4;
  qrySQL.ParamByName('ParContaId5').Value := DadosConta.IdConta5;
  qrySQL.ParamByName('ParContaId6').Value := DadosConta.IdConta6;

  qrySQL.ExecSQL;

  // Houve Mudança Data Inicial => Apagar Log Viagem
  if qryParametrosParDatIniLeituraDescargaWS.Value <> DadosConta.DatIniLeituraDescargaWS then
  begin
    if (DadosConta.GeraTotvsDatasul = FlagSim) then
    begin
      qrySQL.SQL.Text := 'Update Logviagem set LovGerDatasul = :p1 WHERE LovDataProc >= :LovDataProc';
      qrySQL.ParamByName('p1').Value := FlagNao;
      qrySQL.ParamByName('LovDataProc').Value := DadosConta.DatIniLeituraDescargaWS;
      qrySQL.ExecSQL;
    end;
    if (DadosConta.GeraTotvsRm = FlagSim) then
    begin
      qrySQL.SQL.Text := 'Update Logviagem set LovGerRm = :p1 WHERE LovDataProc >= :LovDataProc';
      qrySQL.ParamByName('p1').Value := FlagNao;
      qrySQL.ParamByName('LovDataProc').Value := DadosConta.DatIniLeituraDescargaWS;
      qrySQL.ExecSQL;
    end;
    if (DadosConta.GeraMagis = FlagSim) then
    begin
      qrySQL.SQL.Text := 'Update Logviagem set LovGerMagis = :p1 WHERE LovDataProc >= :LovDataProc';
      qrySQL.ParamByName('p1').Value := FlagNao;
      qrySQL.ParamByName('LovDataProc').Value := DadosConta.DatIniLeituraDescargaWS;
      qrySQL.ExecSQL;
    end;
    if (DadosConta.GeraMeta = FlagSim) then
    begin
      qrySQL.SQL.Text := 'Update Logviagem set LovGerMeta = :p1 WHERE LovDataProc >= :LovDataProc';
      qrySQL.ParamByName('p1').Value := FlagNao;
      qrySQL.ParamByName('LovDataProc').Value := DadosConta.DatIniLeituraDescargaWS;
      qrySQL.ExecSQL;
    end;
    if (DadosConta.GeraSiga = FlagSim) then
    begin
      qrySQL.SQL.Text := 'Update Logviagem set LovGerSiga = :p1 WHERE LovDataProc >= :LovDataProc';
      qrySQL.ParamByName('p1').Value := FlagNao;
      qrySQL.ParamByName('LovDataProc').Value := DadosConta.DatIniLeituraDescargaWS;
      qrySQL.ExecSQL;
    end;
    if (DadosConta.GeraScl = FlagSim) then
    begin
      qrySQL.SQL.Text := 'Update Logviagem set LovGerScl = :p1 WHERE LovDataProc >= :LovDataProc';
      qrySQL.ParamByName('p1').Value := FlagNao;
      qrySQL.ParamByName('LovDataProc').Value := DadosConta.DatIniLeituraDescargaWS;
      qrySQL.ExecSQL;
    end;
    {
    qrySQL.SQL.Text := 'DELETE FROM LogViagem WHERE LovDataProc >= :LovDataProc';
    qrySQL.ParamByName('LovDataProc').Value := DadosConta.DatIniLeituraDescargaWS;
    qrySQL.ExecSQL;
    }
  end;

end;

procedure TVSSCLRotaConsoleDTM.PersistirLogViagem(Viagem: TViagem);
var
  FlgEnviarNotificacao: Boolean;
  ViagemCadastrada : Boolean;

  function NotificaDifAtesto(Viagem: TViagem): Boolean;
  var
    PercDif: Double;
  begin
    if Viagem.QtdeArmazenado > 0 then
      PercDif := Abs((Viagem.QtdeArmazenado - Viagem.QtdeColetado)/Viagem.QtdeArmazenado)
    else
      PercDif := Abs((Viagem.QtdeArmazenado - Viagem.QtdeColetado));

    Result := (PercDif > qryParametrosParPercAtesto.AsFloat) and
      (Abs(PercDif - qryParametrosParPercAtesto.AsFloat) > 0.0001);
  end;

begin
  // Verifica se a viagem já esta cadastrada no log
  qrySQL.SQL.Clear;
  qrySQL.SQL.Text := 'Select LovViagemId from LogViagem Where LovViagemId = :LovViagemId';
  qrySQL.ParamByName('LovViagemId').Value := Viagem.Id;
  qrySQL.Open;
  ViagemCadastrada := not qrySQL.IsEmpty ;
  qrySQL.SQL.Clear;

  FlgEnviarNotificacao := NotificaDifAtesto(Viagem);
  // Persistir Log
  if ViagemCadastrada then
  begin
    qrySQL.SQL.Text := 'UPDATE LogViagem Set LovGerDatasul = :LovGerDatasul, LovGerRm = :LovGerRm , LovGerMagis = :LovGerMagis, ' +
                       ' LovGerMeta = :LovGerMeta , LovGerSiga = :LovGerSiga , '+
                       ' LovGerScl = :LovGerScl Where LovViagemId = :LovViagemId ' ;
    qrySQL.ParamByName('LovGerDatasul').Value := Viagem.GerouDatasul;
    qrySQL.ParamByName('LovGerRm').Value :=  Viagem.GerouRm;
    qrySQL.ParamByName('LovGerMagis').Value := Viagem.GerouMagis;
    qrySQL.ParamByName('LovGerMeta').Value := Viagem.GerouMeta;
    qrySQL.ParamByName('LovGerSiga').Value := Viagem.GerouSiga;
    qrySQL.ParamByName('LovGerScl').Value := Viagem.GerouScl;
    qrySQL.ParamByName('LovViagemId').Value := Viagem.Id;

    qrySQL.ExecSQL;
  end
  else
  begin
    qrySQL.SQL.Text := 'INSERT INTO LogViagem (LovRotaCod, LovRotaId, LovEnviaNotif, LovDataProc, LovDifColeta, ' +
      'LovQtdeDescarga, LovViagemId, LovGerDatasul, LovGerRm, LovGerMagis, LovGerMeta, LovGerSiga, '+
      'LovGerScl,  LovColetor, LovVeiculo, LovDataViagem) ' +
      'VALUES (:LovRotaCod, :LovRotaId, :LovEnviaNotif, :LovDataProc, :LovDifColeta, :LovQtdeDescarga,' +
      ' :LovViagemId, :LovGerDatasul, :LovGerRm, :LovGerMagis, :LovGerMeta, :LovGerSiga, :LovGerScl, :LovColetor, ' +
      ' :LovVeiculo, :LovDataViagem)';
    qrySQL.ParamByName('LovRotaCod').Value := Viagem.RotaCodigo;
    qrySQL.ParamByName('LovRotaId').Value := Viagem.RotaId;
    qrySQL.ParamByName('LovDataProc').Value := Now;
    qrySQL.ParamByName('LovDifColeta').Value := (Viagem.QtdeArmazenado - Viagem.QtdeColetado);
    qrySQL.ParamByName('LovQtdeDescarga').Value := Viagem.QtdeDescargas;
    qrySQL.ParamByName('LovViagemId').Value := Viagem.Id;
    qrySQL.ParamByName('LovEnviaNotif').Value := BooleanToStr(FlgEnviarNotificacao);
    qrySQL.ParamByName('LovGerDatasul').Value := Viagem.GerouDatasul;
    qrySQL.ParamByName('LovGerRm').Value :=  Viagem.GerouRm;
    qrySQL.ParamByName('LovGerMagis').Value := Viagem.GerouMagis;
    qrySQL.ParamByName('LovGerMeta').Value := Viagem.GerouMeta;
    qrySQL.ParamByName('LovGerSiga').Value := Viagem.GerouSiga;
    qrySQL.ParamByName('LovGerScl').Value := Viagem.GerouScl;
    qrySQL.ParamByName('LovColetor').Value := Viagem.Coletor;
    qrySQL.ParamByName('LovVeiculo').Value := Viagem.Veiculo;
    qrySQL.ParamByName('LovDataViagem').Value :=  GetData( FormatDateTime('yyyy-MM-dd',Viagem.DatAbertura));

    qrySQL.ExecSQL;
  end;


  // Envia Mensagem
  if FlgEnviarNotificacao and (qryParametrosParEnviarNotifAtesto.AsString = 'S') then
    EnviarNotificacao(Viagem, Format('Descarga da Viagem %d excedeu o percentual de atesto permitido.', [Viagem.Id]));
end;

procedure TVSSCLRotaConsoleDTM.EnviarNotificacao(Viagem: TViagem; Mensagem: string);
var
  DadosRetorno: TDadosRetorno;
begin
  DadosRetorno := sendNotificacaoRota(Viagem.RotaCodigo, Mensagem);
  if not DadosRetorno.Sucesso then
    raise Exception.Create('Erro Enviar Notificação Rota:' + DadosRetorno.Mensagem);
end;

function TVSSCLRotaConsoleDTM.GetData(Data: string): TDateTime; //2015-09-29
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

procedure TVSSCLRotaConsoleDTM.tmrConsoleTimer(Sender: TObject);
var
  x: Integer;
begin
  for x := 1 to 6 do
  begin
    DadosConta.IdConta := DadosConta.ChaveContas[x];
    // Se não houver numero de conta, pula para proxima posição
    if DadosConta.IdConta = EmptyStr then
      Continue;

    if (DadosConta.GeraTotvsDatasul = FlagSim) then
    begin
      ExportarDescargas; // Arquivo de atesto do datasul

    end;
    if (DadosConta.GeraMagis = FlagSim) then
    begin
      ExportarColetas; // Arquuivo de coletas
    end;
    if (DadosConta.GeraScl = FlagSim) then
    begin
      ;
    end;
    if (DadosConta.GeraSiga = FlagSim) then
    begin
      ExportaSiga; // Arquivo de coletas
    end;
  end;
  // Atualizaq parametros
  AtualizarDatLeituraParam(Date);
end;

procedure TVSSCLRotaConsoleDTM.sheConsoleEvents0Execute(Sender: TJvEventCollectionItem;
  const IsSnoozeEvent: Boolean);
begin
  // Faz Exportação Extra 3 Últimos Dias ::  De 3 em 3 horas
  InserirMsgLog('Início Get Registros :: EXTRA');
  try
    if (DadosConta.GeraTotvsDatasul = FlagSim) then
      GetDescargas(Date - 3, Date, False);
    if (DadosConta.GeraMagis = FlagSim) then
      GetColetas(Date - 3, Date,'0',EmptyStr,False);
    if (DadosConta.GeraSiga = FlagSim) then
      GetDadosSiga(Date - 3, Date,'0',EmptyStr,False);
  finally
    InserirMsgLog('Término Get Registros :: EXTRA');
  end;
end;
// Veririca se existe coluna na tabela do banco de dados, caso contrario, cria
function TVSSCLRotaConsoleDTM.columnExistsSqlite(aTableName, aColumn,
  aDataType, aSize: string; create: Boolean): Boolean;
var
 Campo : TFieldDef;
 I: Integer;
 FSQl : Variant;
begin
  Result := False;
  FSQL := 'PRAGMA table_info( '+ aTableName + ' )';
  qryAux.SQL.Clear;
  qryAux.SQL.Add(FSQL);
  qryAux.ExecSQL;
  qryAux.Open;
  qryAux.First;
  if qryAux.Locate('name',aColumn,[]) then
  begin
    Result := True
  end
  else
  begin
    if create then
    begin
     qryAux.Close;
     qryAux.SQL.Clear;
     FSQL := 'Alter table ' + aTableName + ' add column ' + aColumn + ' ' + aDataType + ' ';
     qryAux.SQL.Add(FSQL);
     qryAux.ExecSQL;
    end;
  end;
end;
// Exportar coletas
procedure TVSSCLRotaConsoleDTM.ExportarColetas;
var
  DataProcIni, DataProcFim : TDateTime;
begin
  InserirMsgLog('Início Get Coletas.');
  try
    qryParametros.Close;
    qryParametros.Open;
    DataProcIni := qryParametrosParDatIniLeituraDescargaWS.AsDateTime;
    DataProcFim := Date;
    GetColetas(DataProcIni, DataProcFim, '0',EmptyStr, False);
    InserirMsgLog('Término Get Coletas');
  except on E:Exception do
    InserirMsgLog('ERRO : ' + E.Message);
  end;
end;
// Recebe Dados das coletas
function TVSSCLRotaConsoleDTM.GetColetas(DataInicio,
  DataTermino: TDateTime; Sync, Comunitario: string;
  FlgAtualizaUltDataLeitura: Boolean): string;
var
  count : Integer;

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
    qrySQL.ParamByName('LodDescargaId').Value := IdDescarga;
    qrySQL.Open;

    Result := not qrySQL.IsEmpty;
  end;

  function ViagemJahProcessada(IdViagem: Integer): Boolean;
  begin
    qrySQL.Close;
    qrySQL.SQL.Text := 'SELECT 1 FROM LogViagem WHERE LovViagemId = :Id and LovGerMagis = :LovGerMagis';
    qrySQL.ParamByName('Id').Value := IdViagem;
    qrySQL.ParamByName('LovGerMagis').Value := FlagSim;
    qrySQL.Open;

    Result := not qrySQL.IsEmpty;
  end;
  function ViagemJahRegistrada(idViagem: Integer): TViagem;
  begin
    Result := TViagem.Create;
    qrySQL.Close;
    qrySQL.SQL.Text := 'Select * from LogViagem WHERE LovViagemId = :Id';
    qrySQL.ParamByName('Id').Value := idViagem;
    qrySQL.Open;
    if not qrySQL.IsEmpty then
    begin
      Result.Id := qrySQL.FieldByName('LovId').AsInteger;
      Result.Index := qrySQL.FieldByName('LovIndex').AsInteger;
      Result.RotaId := qrySQL.FieldByName('LovRotaId').AsInteger;
      Result.RotaCodigo := qrySQL.FieldByName('LovRotaCod').AsString;
      Result.DatAbertura := qrySQL.FieldByName('LovDataViagem').AsDateTime;
      Result.Liberada := True;
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
      Result.Index := 1;
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

  function getRotas(): TListaRota;
  var
    i: Integer;
  begin
    Result := TListaRota.Create;

    DataInicioStr := FormatDateTime('YYYY-MM-dd', DataInicio);
    DataTerminoStr := FormatDateTime('YYYY-MM-dd', DataTermino);
    DadosRetornoRota :=  MakeParConsulta(DadosConta.IdConta,DataInicio,DataTermino,'0','readRota');
    if DadosRetornoRota.Sucesso then
    begin
      ColecaoRota := TJSONArray.create(DadosRetornoRota.Dados);
      if cdsRota.Active then
        cdsRota.Close;
      cdsRota.CreateDataSet;
      for i := 0 to ColecaoRota.length -1 do
      begin
        Rota := ColecaoRota.getJSONObject(i);
        objRota := TRota.Create;
        try
           objRota.id := Rota.getInt('id');
           objRota.Codigo :=  Rota.getString('codigo');
           objRota.Nome := Rota.getString('nome');
           // Empilha rota
           //Result.Add(objRota);

           // popula dataset rota
           cdsRota.Insert;

           cdsRotaCodigo.Value := objRota.Codigo;
           cdsRotaNome.Value := objRota.Nome;

           cdsRota.Post;
        finally
          ;
        end;
      end;
    end;
  end;

  function getLinhas(): TListaLinha;
  var
    i: Integer;
  begin
    Result := TListaLinha.Create;

    DataInicioStr := FormatDateTime('YYYY-MM-dd', DataInicio);
    DataTerminoStr := FormatDateTime('YYYY-MM-dd', DataTermino);
    DadosRetornoLinha :=  MakeParConsulta(DadosConta.IdConta,DataInicio,DataTermino,'0','readLinha');
    if DadosRetornoLinha.Sucesso then
    begin
      ColecaoLinha := TJSONArray.create(DadosRetornoLinha.Dados);
      if cdsLinha.Active then
        cdsLinha.Close;
      cdsLinha.CreateDataSet;
      for i := 0 to ColecaoLinha.length -1 do
      begin
        Linha := ColecaoLinha.getJSONObject(i);
        objLinha := TLinha.Create;

        try
           objLinha.id := Linha.getInt('id');
           objLinha.Codigo :=  Linha.getString('codigo');
           objLinha.Nome := Linha.getString('nome');
           // objLinha.Distancia :=  StrToInt(Linha.getString('distancia'));
           TryStrToInt(Linha.getString('distancia'),objLinha.Distancia);
           // Empilha Linha
           //Result.Add(objLinha);

           // popula dataset linhas
           cdsLinha.Insert;

           cdsLinhaCodigo.Value := objLinha.Codigo;
           cdsLinhaNome.Value := objLinha.Nome;
           cdsLinhadistancia.Value := objLinha.Distancia;

           cdsLinha.Post;

        finally
         ;
        end;
      end;
    end;
  end;

  function getProdutores(): TListaProdutor;
  var
    i: Integer;
  begin
    Result := TListaProdutor.Create;

    DataInicioStr := FormatDateTime('YYYY-MM-dd', DataInicio);
    DataTerminoStr := FormatDateTime('YYYY-MM-dd', DataTermino);
    DadosRetornoProdutor :=  MakeParConsulta(DadosConta.IdConta,DataInicio,DataTermino,'0','readProdutor');
    if DadosRetornoProdutor.Sucesso then
    begin
      ColecaoProdutor := TJSONArray.create(DadosRetornoProdutor.Dados);
      if cdsProdutor.Active then
        cdsProdutor.Close;
      cdsProdutor.CreateDataSet;
      for i := 0 to ColecaoProdutor.length -1 do
      begin
        Produtor := ColecaoProdutor.getJSONObject(i);
        objProdutor := TProdutor.Create;
        try
           objProdutor.id := Produtor.getInt('id');
           objProdutor.Codigo :=  Produtor.getString('codigo');
           objProdutor.Nome := Produtor.getString('nome');
           // Empilha produtor
          // Result.Add(objProdutor);

          // popula cds produtor
           cdsProdutor.Insert;

           cdsProdutorCodigo.Value := objProdutor.Codigo;
           cdsProdutorNome.Value := objProdutor.Nome;

           cdsProdutor.Post;

        finally
         ;
        end;
      end;
    end;
  end;

  function getFazendas(): TListaFazenda;
  var
    i: Integer;
  begin
    Result := TListaFazenda.Create;

    DataInicioStr := FormatDateTime('YYYY-MM-dd', DataInicio);
    DataTerminoStr := FormatDateTime('YYYY-MM-dd', DataTermino);
    DadosRetornoFazenda :=  MakeParConsulta(DadosConta.IdConta,DataInicio,DataTermino,'0','readFazenda');
    if DadosRetornoFazenda.Sucesso then
    begin
      ColecaoFazenda := TJSONArray.create(DadosRetornoFazenda.Dados);
      if cdsFazendas.Active then
        cdsFazendas.Close;
      cdsFazendas.CreateDataSet;
      for i := 0 to ColecaoFazenda.length -1 do
      begin
        Fazenda := ColecaoFazenda.getJSONObject(i);
        objFazenda := TFazenda.Create;

        try
           objFazenda.id := Fazenda.getInt('id');
           objFazenda.Codigo :=  Fazenda.getString('codigo');
           objFazenda.Nome := Fazenda.getString('nome');
           // Empilha Fazenda
           //Result.Add(objFazenda);

           // popula dataset fazendas
           cdsFazendas.Insert;

           cdsFazendascodigo.Value := objFazenda.Codigo;
           cdsFazendasnome.Value := objFazenda.Nome;

           cdsFazendas.Post;

        finally
         ;
        end;
      end;
    end;
  end;

  function getColetores(): TListaColetor;
  var
    i: Integer;
  begin
    Result := TListaColetor.Create;

    DataInicioStr := FormatDateTime('YYYY-MM-dd', DataInicio);
    DataTerminoStr := FormatDateTime('YYYY-MM-dd', DataTermino);
    DadosRetornoColetor :=  MakeParConsulta(DadosConta.IdConta,DataInicio,DataTermino,'0','readColetor');
    if DadosRetornoColetor.Sucesso then
    begin
      ColecaoColetor := TJSONArray.create(DadosRetornoColetor.Dados);
      if cdsColetor.Active then
        cdsColetor.Close;
      cdsColetor.CreateDataSet;
      for i := 0 to ColecaoColetor.length -1 do
      begin
        Coletor := ColecaoColetor.getJSONObject(i);
        objColetor := TColetor.Create;
        try
           objColetor.id := Coletor.getInt('id');
           objColetor.Codigo :=  Coletor.getString('codigo');
           objColetor.Nome := Coletor.getString('nome');
           // Empilha Coletor
          //  Result.Add(objColetor);

          // popula dataset de coletores
           cdsColetor.Insert;

           cdsColetorCodigo.Value := objColetor.Codigo;
           cdsColetorNome.Value := objColetor.Nome;

           cdsColetor.Post;


        finally
         ;
        end;
      end;
    end;
  end;

  function getVeiculos(): TListaVeiculo;
  var
    i: Integer;
  begin
    Result := TListaVeiculo.Create;

    DataInicioStr := FormatDateTime('YYYY-MM-dd', DataInicio);
    DataTerminoStr := FormatDateTime('YYYY-MM-dd', DataTermino);
    DadosRetornoVeiculo :=  MakeParConsulta(DadosConta.IdConta,DataInicio,DataTermino,'0','readVeiculo');
    if DadosRetornoVeiculo.Sucesso then
    begin
      ColecaoVeiculo := TJSONArray.create(DadosRetornoVeiculo.Dados);
      if cdsVeiculos.Active then
        cdsVeiculos.Close;
      cdsVeiculos.CreateDataSet;
      for i := 0 to ColecaoVeiculo.length -1 do
      begin
        Veiculo := ColecaoVeiculo.getJSONObject(i);
        objVeiculo := TVeiculo.Create;
        try
           objVeiculo.id := Veiculo.getInt('id');
           objVeiculo.Codigo :=  Veiculo.getString('codigo');
           objVeiculo.Placa := Veiculo.getString('placa');
           // Empilha Veiculo
           //  Result.Add(objVeiculo);

           // popula dataset de veiculo
           cdsVeiculos.Insert;

           cdsVeiculoscodigo.Value := objVeiculo.Codigo;
           cdsVeiculosid.Value := objVeiculo.id;
           cdsVeiculosplaca.Value := objVeiculo.Placa;

           cdsVeiculos.Post;
        finally
         ;
        end;
      end;
    end;
  end;
  {Carrega viagens}

  function getViagens(): TListaRegViagem;
  var
    i: Integer;
  begin
    Result := TListaRegViagem.Create;

    DataInicioStr := FormatDateTime('YYYY-MM-dd', DataInicio);
    DataTerminoStr := FormatDateTime('YYYY-MM-dd', DataTermino);
    DadosRetornoViagem :=  MakeParConsulta(DadosConta.IdConta,DataInicio,DataTermino,'0','readViagem');
    if DadosRetornoViagem.Sucesso then
    begin
      ColecaoViagem := TJSONArray.create(DadosRetornoViagem.Dados);
      if cdsViagens.Active then
        cdsViagens.Close;
      cdsViagens.CreateDataSet;
      for i := 0 to ColecaoViagem.length -1 do
      begin
        Viagem := ColecaoViagem.getJSONObject(i);
        objRegViagem := TRegViagem.Create;
        try
           objRegViagem.id := ValidaInt(Viagem.getString('id'));
           objRegViagem.veiculo_id := ValidaInt(Viagem.getString('veiculo_id'));
           objRegViagem.coletor_id := ValidaInt(Viagem.getString('coletor_id'));
           objRegViagem.linha_id := ValidaInt(Viagem.getString('linha_id'));
           objRegViagem.rota_id := ValidaInt(Viagem.getString('rota_id'));
           objRegViagem.conta_id := ValidaInt(Viagem.getString('conta_id'));
           objRegViagem.tecnico_id := ValidaInt(Viagem.getString('tecnico_id'));
           objRegViagem.dt_fechamento := GetDataHora(Viagem.getString('dt_fechamento'));
           objRegViagem.dt_push := GetDataHora(Viagem.getString('dt_push'));
           objRegViagem.dt_abertura := GetDataHora(Viagem.getString('dt_abertura'));
           objRegViagem.dt_descarga := GetDataHora(Viagem.getString('dt_descarga'));
           objRegViagem.dt_liberacao := GetDataHora(Viagem.getString('dt_liberacao'));
           objRegViagem.km_inicial := Viagem.getInt('km_inicial');
           objRegViagem.km_final := Viagem.getInt('km_final');
           objRegViagem.km_distancia := Viagem.getInt('km_distancia');
           objRegViagem.km_justificativa := Viagem.getString('km_justificativa');
           objRegViagem.descarrega := Viagem.getString('descarregada');
           objRegViagem.liberada := Viagem.getString('liberada');
           objRegViagem.Rota := Viagem.getString('rota');
           objRegViagem.Linha := Viagem.getString('linha');
           objRegViagem.Coletor := Viagem.getString('coletor');
           objRegViagem.Veiculo := Viagem.getString('veiculo');

           // Empilha Viagem
          // Result.Add(objRegViagem);

           // popula dataset de viagens

           cdsViagens.Insert;

           cdsViagensid.Value            :=  objRegViagem.id ;
           cdsViagensveiculo_id.Value    :=  objRegViagem.veiculo_id;
           cdsViagenscoletor_id.Value    :=  objRegViagem.coletor_id;
           cdsViagenslinha_id.Value      :=  objRegViagem.linha_id;
           cdsViagensrota_id.Value       :=  objRegViagem.rota_id;
           cdsViagensdt_push.Value       :=  objRegViagem.dt_push;
           cdsViagensdt_abertura.Value   :=  objRegViagem.dt_abertura;
           cdsViagensdt_fechamento.Value :=  objRegViagem.dt_fechamento;
           cdsViagenskm_inicial.Value    :=  objRegViagem.km_inicial;
           cdsViagenskm_final.Value      :=  objRegViagem.km_final;
           cdsViagensdt_liberacao.Value  :=  objRegViagem. dt_liberacao;
           cdsViagensrota.Value          :=  objRegViagem.Rota;
           cdsViagenslinha.Value         :=  objRegViagem.Linha;
           cdsViagenscoletor.Value       :=  objRegViagem.Coletor;
           cdsViagensveiculo.Value       :=  objRegViagem.Veiculo;
           cdsViagenskm_distancia.Value  :=  objRegViagem.km_distancia;
           cdsViagenskm_real.Value       :=  objRegViagem.km_distancia;

           cdsViagens.Post;
        finally
         ;
        end;
      end;
    end;
  end;
  {Carrega coletas }
  function getColetas(): TListaColeta;
  var
    i: Integer;
  begin
    Result := TListaColeta.Create;

    DataInicioStr := FormatDateTime('YYYY-MM-dd', DataInicio);
    DataTerminoStr := FormatDateTime('YYYY-MM-dd', DataTermino);

    // Coletas tanques individuais
    DadosRetornoColeta :=  MakeParConsulta(DadosConta.IdConta,DataInicio,DataTermino,'0','readColeta', NaoRetornaComunitario);
    if DadosRetornoColeta.Sucesso then
    begin
      ColecaoColeta := TJSONArray.create(DadosRetornoColeta.Dados);
      // Ativa dataset
      if cdsColetas.Active then
        cdsColetas.Close;
      cdsColetas.CreateDataSet;

      for i := 0 to ColecaoColeta.length -1 do
      begin
        Coleta := ColecaoColeta.getJSONObject(i);
        objColeta := TColeta.Create;
        try
           objColeta.id := Coleta.getInt('id');
           objColeta.dt_push :=  GetDataHora(Coleta.getString('dt_push'));
           objColeta.viagem_id := ValidaInt(Coleta.getString('viagem_id'));
           objColeta.parada_id := ValidaInt(Coleta.getString('parada_id'));
           objColeta.coletor_id := ValidaInt(Coleta.getString('coletor_id'));
           objColeta.tanque_id := ValidaInt(Coleta.getString('tanque_id'));
           objColeta.dt_coleta := GetDataHora(Coleta.getString('dt_coleta'));
           objColeta.CodigoFazenda := Coleta.getString('fazenda');
           objColeta.CodigoProdutor := Coleta.getString('produtor');
           objColeta.tanque := Coleta.getString('tanque');
           objColeta.quantidade := Coleta.getInt('quantidade');
           objColeta.regua := Coleta.getDouble('regua');
           objColeta.alizarol := Coleta.getString('alizarol');
           objColeta.amostra := Coleta.getString('amostra');
           objColeta.contraprova := Coleta.getString('contraprova');
           objColeta.temperatura := Coleta.getDouble('temperatura');
           objColeta.coletada := Coleta.getString('coletada');
           objColeta.dt_edicao := GetDataHora(Coleta.getString('dt_edicao'));
           objColeta.CodigoMotorista := Coleta.getString('coletor');
           // Empilha Coleta
         //  Result.Add(objColeta);

           // Popula dataset de coleta
           cdsColetas.Append;

           cdsColetasid.Value := objColeta.Id;
           cdsColetasdt_push.Value := objColeta.dt_push;
           cdsColetascoletor_id.Value := objColeta.coletor_id;
           cdsColetasparada_id.Value := objColeta.parada_id;
           cdsColetastanque_id.Value := objColeta.tanque_id;
           cdsColetasdt_coleta.Value := objColeta.dt_coleta ;
           cdsColetasCodigoProdutor.Value := objColeta.CodigoProdutor;
           cdsColetasquantidade.Value := objColeta.quantidade;
           cdsColetasregua.Value := objColeta.regua;
           cdsColetasalizarol.Value := objColeta.alizarol;
           cdsColetasamostra.Value := objColeta.amostra;
           cdsColetascontraprova.Value := objColeta.contraprova;
           cdsColetastemperatura.Value := objColeta.temperatura;
           cdsColetascoletada.Value := objColeta.coletada;
           cdsColetasdt_edicao.Value := objColeta.dt_edicao;
           cdsColetasviagem_id.Value := objColeta.viagem_id;
           cdsColetasCodigoFazenda.Value := objColeta.CodigoFazenda;
           cdsColetastanque.Value := objColeta.tanque;

           cdsColetas.Post;
        finally
         ;
        end;
      end;
    end;

    // Coletas Distribuicao dos tanques coletivos
    DadosRetornoColeta :=  MakeParConsulta(DadosConta.IdConta,DataInicio,DataTermino,'0','readColetaComunitaria',RetornaComunitario );
    if DadosRetornoColeta.Sucesso then
    begin
      ColecaoColeta := TJSONArray.create(DadosRetornoColeta.Dados);
      // Ativa dataset
     // cdsColetas.CreateDataSet;
      for i := 0 to ColecaoColeta.length -1 do
      begin
        Coleta := ColecaoColeta.getJSONObject(i);
        objColeta := TColeta.Create;
        try
           objColeta.id := Coleta.getInt('id');
           objColeta.dt_push :=  GetDataHora(Coleta.getString('dt_push'));
           objColeta.viagem_id := ValidaInt(Coleta.getString('viagem_id'));
           objColeta.parada_id := ValidaInt(Coleta.getString('parada_id'));
           objColeta.coletor_id := ValidaInt(Coleta.getString('coletor_id'));
           objColeta.tanque_id := ValidaInt(Coleta.getString('tanque_id'));
           objColeta.dt_coleta := GetDataHora(Coleta.getString('dt_coleta'));
           objColeta.CodigoFazenda := Coleta.getString('fazenda');
           objColeta.CodigoProdutor := Coleta.getString('produtor');
           objColeta.tanque := Coleta.getString('tanque');
           objColeta.quantidade := Coleta.getInt('quantidade');
           objColeta.regua := Coleta.getDouble('regua');
           objColeta.alizarol := Coleta.getString('alizarol');
           objColeta.amostra := Coleta.getString('amostra');
           objColeta.contraprova := Coleta.getString('contraprova');
           objColeta.temperatura := Coleta.getDouble('temperatura');
           objColeta.coletada := Coleta.getString('coletada');
           objColeta.dt_edicao := GetDataHora(Coleta.getString('dt_edicao'));
           objColeta.CodigoMotorista := Coleta.getString('coletor');
           // Empilha Coleta
         //  Result.Add(objColeta);

           // Popula dataset de coleta
           cdsColetas.Append;

           cdsColetasid.Value := objColeta.Id;
           cdsColetasdt_push.Value := objColeta.dt_push;
           cdsColetascoletor_id.Value := objColeta.coletor_id;
           cdsColetasparada_id.Value := objColeta.parada_id;
           cdsColetastanque_id.Value := objColeta.tanque_id;
           cdsColetasdt_coleta.Value := objColeta.dt_coleta ;
           cdsColetasCodigoProdutor.Value := objColeta.CodigoProdutor;
           cdsColetasquantidade.Value := objColeta.quantidade;
           cdsColetasregua.Value := objColeta.regua;
           cdsColetasalizarol.Value := objColeta.alizarol;
           cdsColetasamostra.Value := objColeta.amostra;
           cdsColetascontraprova.Value := objColeta.contraprova;
           cdsColetastemperatura.Value := objColeta.temperatura;
           cdsColetascoletada.Value := objColeta.coletada;
           cdsColetasdt_edicao.Value := objColeta.dt_edicao;
           cdsColetasviagem_id.Value := objColeta.viagem_id;
           cdsColetasCodigoFazenda.Value := objColeta.CodigoFazenda;
           cdsColetastanque.Value := objColeta.tanque;

           cdsColetas.Post;
        finally
         ;
        end;
      end;
    end;
  end;

  {Visitas em uma periodo}

  function getVisitas(): TListaVisita;
  var
    i: Integer;
  begin
    Result := TListaVisita.Create;

    DataInicioStr := FormatDateTime('YYYY-MM-dd', DataInicio);
    DataTerminoStr := FormatDateTime('YYYY-MM-dd', DataTermino);
    DadosRetornoVisita :=  MakeParConsulta(DadosConta.IdConta,DataInicio,DataTermino,'0','readVisita');
    if DadosRetornoVisita.Sucesso then
    begin
      ColecaoVisita := TJSONArray.create(DadosRetornoVisita.Dados);
      for i := 0 to ColecaoVisita.length -1 do
      begin
        Visita := ColecaoVisita.getJSONObject(i);
        objVisita := TVisita.Create;
        try
           objVisita.id := Visita.getInt('id');
           objVisita.viagem_id := ValidaInt(Visita.getString('viagem_id'));
           objVisita.conta_id := ValidaInt(Visita.getString('conta_id'));
           objVisita.rota_id := ValidaInt(Visita.getString('rota_id'));
           objVisita.linha_id := ValidaInt(Visita.getString('linha_id'));
           objVisita.fazenda_id := ValidaInt(Visita.getString('fazenda_id'));
           objVisita.dt_push := GetData(Visita.getString('dt_push'));
           objVisita.dt_inicio := GetData(Visita.getString('dt_inicio'));
           objVisita.dt_fim := GetData(Visita.getString('dt_fim'));
           objVisita.motivo := Visita.getString('motivo');
           objVisita.cancelado := Visita.getString('cancelado');
           objVisita.total_coleta := Visita.getInt('total_coleta');
           // Empilha Visita
           Result.Add(objVisita);
        finally
         ;
        end;
      end;
    end;
  end;
begin
  try
    // Versao da saída do arquivo Magistech
    _VerMagis :=  DadosConta.VerMagis;
    // Polula datasets
    PopulaAtoresColeta(DataInicio,DataTermino,Sync,Comunitario);

    // Arquivo com dados coleta formatado
    _ArqSaida := TStringList.Create;

    // ordena as viagem por id
    cdsViagens.IndexFieldNames := 'id';

    // Ordena as coletas por viagem
    cdsColetas.IndexFieldNames := 'viagem_id';

    cdsViagens.First;
    i := 0;
    try

      for i := 0 to (cdsViagens.RecordCount -1) do
      begin
        try
          _ArqSaida.Clear;

          // Verifica se a viagem já foi processada
          if ViagemJahProcessada(cdsViagensid.Value) then
          begin
            cdsViagens.Next;
            Continue;
          end;

          // Verifica se viagem tem distribuição de tanque comunitario pendente e não gera o arquivo
          if (cdsViagenscomunitario_pendente.Value = 'true') then
          begin
            cdsViagens.Next;
            Continue;
          end;

          // Cria objeto viagem para persistencia no log
          ObjViagem := ViagemJahRegistrada(cdsViagensid.Value);
          ObjViagem.Id := cdsViagensid.Value;
          ObjViagem.RotaId := cdsViagensrota_id.Value;
          ObjViagem.RotaCodigo := cdsViagensrota.Value;
          ObjViagem.DatAbertura := cdsViagensdt_abertura.Value;
          ObjViagem.GerouMagis := FlagSim;

          // Completa dados da viagem
          cdsViagens.Edit;
          if cdsLinha.Locate('codigo', cdsViagenslinha.Value,[loPartialKey]) then
          begin
            cdsViagensNomeLinha.Value := cdsLinhaNome.Value;
            cdsViagenskm_padrao.Value := cdsLinhadistancia.Value;
          end;
          if cdsRota.Locate('codigo', cdsViagensrota.Value,[loPartialKey]) then
          begin
            cdsViagensNomeRota.Value := cdsRotaNome.Value;
          end;
          if cdsColetor.Locate('codigo', cdsViagenscoletor.Value,[loPartialKey])then
          begin
            cdsViagensNomeColetor.Value := cdsColetorNome.Value;
          end;
          if cdsVeiculos.Locate('codigo',cdsViagensveiculo.Value,[loPartialKey])then
          begin
            cdsViagensPlacaVeiculo.Value := cdsVeiculosplaca.Value;
          end;
          ObjViagem.Coletor := cdsViagenscoletor.Value;
          ObjViagem.Veiculo := cdsViagensPlacaVeiculo.Value;

          // Numero da viagem para o veículo e motorista coletor
          if (not ObjViagem.Registrada) then
          begin
            qryAux.SQL.Clear;
            qryAux.SQL.Add('Select Count(LovId) Total from LogViagem where LovColetor = :LovColetor and LovVeiculo = :LovVeiculo and LovDataViagem BETWEEN :P1 AND :P2');
            qryAux.ParamByName('LovColetor').Value := ObjViagem.Coletor;
            qryAux.ParamByName('LovVeiculo').Value := ObjViagem.Veiculo;
            qryAux.ParamByName('P1').Value := FormatDateTime('yyyy-MM-dd 00:00:00',ObjViagem.DatAbertura);
            qryAux.ParamByName('P2').Value := FormatDateTime('yyyy-MM-dd 23:59:59',ObjViagem.DatAbertura);
            qryAux.Open;
            // qryAux.ParamByName('P1').Value := FormatDateTime('yyyy-MM-dd 00:00:00',GetData(DateToStr(ObjViagem.DatAbertura)));
            FResultado := (qryAux.FieldByName('Total').Value + 1);
            ObjViagem.Index := FResultado;
          end
          else if (ObjViagem.Index = 0) then // Viagem registrada sem indice - Seta Indice (Número sequencial das viagens na data)
          begin
            qryAux.SQL.Clear;
            qryAux.SQL.Add('Select LovViagemId, Ifnull(LovIndex,0) from LogViagem where LovColetor = :LovColetor and LovVeiculo = :LovVeiculo and LovDataViagem BETWEEN :P1 AND :P2 ORDER BY LovDataViagem ');
            qryAux.ParamByName('LovColetor').Value := ObjViagem.Coletor;
            qryAux.ParamByName('LovVeiculo').Value := ObjViagem.Veiculo;
            qryAux.ParamByName('P1').Value := FormatDateTime('yyyy-MM-dd 00:00:00',ObjViagem.DatAbertura);
            qryAux.ParamByName('P2').Value := FormatDateTime('yyyy-MM-dd 23:59:59',ObjViagem.DatAbertura);
            qryAux.Open;
            qryAux.First;
            // Atualiza todos os indices das viagens na data da viagem processa se o indece nao tiver sido setado
            while not qryAux.Eof do
            begin
               qryApoio.SQL.Clear;
               qryApoio.SQL.Add('update LogViagem Set LovIndex = :p1 where LovViagemId = :p2 and Ifnull(LovIndex,0) = 0');
               qryApoio.Params.ParamByName('p1').Value := qryAux.RecNo;
               qryApoio.Params.ParamByName('p2').Value  := qryAux.FieldByName('LovViagemId').Value;
               qryApoio.ExecSQL;
               qryAux.Next;
            end;
            // Busca o indice da viagem que esta sendo processada
            qryApoio.SQL.Clear;
            qryApoio.SQL.Add('Select LovIndex from LogViagem where LovViagemId = :p1');
            qryApoio.Params.ParamByName('p1').Value := ObjViagem.Id;
            qryApoio.Open;

            ObjViagem.Index := qryApoio.FieldByName('LovIndex').Value;

          end;
          cdsViagensNumeroViagem.Value := ObjViagem.Index;

          cdsViagens.Post;

          // Gera dados da viagem no arquivo de saída
          if _VerMagis = '2' then
          begin
            _ArqSaida.Add(coletasToStringInt(cdsColetas, cdsViagens,';',True,0)); // Registro 0 = cabeçalho de viagem
            // Dados da viagem
            _ArqSaida.Add(coletasToStringInt(cdsColetas,cdsViagens,';',False,1)); // Registro 1 = dados da viagem atual
          end;

          FlgGeraCabec := True;
          cdsColetas.First;
          for j := 0 to (cdsColetas.RecordCount -1 )  do
          begin
            // se a coleta não for desta viagem, pula..
            if (cdsColetasviagem_id.Value <> cdsViagensid.Value) then
            begin
              cdsColetas.Next;
              Continue;
            end;
            try
              // Completa Dados dos atores na coleta atual
              cdsColetas.Edit;
              // Localiza dados dos atores na coleta
              if cdsFazendas.Locate('codigo',cdsColetasCodigoFazenda.Value,[loPartialKey]) then
              begin
                cdsColetasCodigoFazenda.Value := cdsFazendascodigo.Value;
                cdsColetasFazenda.Value := cdsFazendasnome.Value;
              end;
              if cdsProdutor.Locate('codigo',cdsColetasCodigoProdutor.Value,[loCaseInsensitive]) then
              begin
                 cdsColetasCodigoProdutor.Value := cdsProdutorCodigo.Value;
                 cdsColetasProdutor.Value := cdsProdutorNome.Value;
              end;
              if cdsLinha.Locate('codigo',cdsViagenslinha.Value,[loPartialKey])then
              begin
                cdsColetasCodigoLinha.Value := cdsLinhaCodigo.Value;
                cdsColetasNomeLinha.Value := cdsLinhaNome.Value;
              end;
              if cdsRota.Locate('codigo',cdsViagensrota.Value,[loPartialKey]) then
              begin
                cdsColetasCodigoRota.Value := cdsRotaCodigo.Value;
                cdsColetasRota.Value := cdsRotaNome.Value;
              end;
              if cdsColetor.Locate('codigo',cdsViagenscoletor.Value,[loPartialKey]) then
              begin
                cdsColetasCodigoMotorista.Value := cdsColetorCodigo.Value;
                cdsColetasNomeMotorista.Value := cdsColetorNome.Value;
              end;
              if cdsVeiculos.Locate('codigo',cdsViagensveiculo.Value,[loPartialKey]) then
              begin
                cdsColetasVeiculo.Value := cdsVeiculosplaca.Value;
              end;
              // Atualiza registro
              cdsColetas.Post;

              // Insere registro de coleta no arquivo texto
              if FlgGeraCabec then
              begin
                if _VerMagis = '2' then // Modelo novo de arquivo
                  begin
                    _ArqSaida.Add( coletasToStringInt(cdsColetas, cdsViagens,';',True,2)); // Registro 2 = Cabeçalho da coleta
                    _ArqSaida.Add(coletasToStringInt(cdsColetas, cdsViagens,';',False,3)); // registro 3 = dados das coletas
                  end
                else // Modelo antigo de arquivo
                  _ArqSaida.Add( coletasToString(cdsColetas,';',True));

                FlgGeraCabec := False;
              end
              else
              begin
                if _VerMagis = '2' then // Modelo novo de arquivo
                  _ArqSaida.Add(coletasToStringInt(cdsColetas, cdsViagens,';',False,3)) // registro 3 = dados das coletas
                else // Modelo antigo de arquivo
                  _ArqSaida.Add( coletasToString(cdsColetas,';',False));
              end;
               // Acumula total descarregado no objeto viagem persistencia log
               ObjViagem.QtdeColetado := ObjViagem.QtdeColetado + cdsColetasquantidade.Value;

              // Proxima coleta
              cdsColetas.Next;
            finally
               {

               AuxFazenda.Free;
               AuxProdutor.Free;
               AuxColetor.Free;
               AuxLinha.Free;
               AuxRota.Free;
               AuxVeiculo.Free;
               AuxColeta.Free;
               }
            end;
          end;
        finally
           if (_ArqSaida.Count > 0) then
           begin
             // Monta nome arquivo saida

             if not DirectoryExists(DadosConta.PathArqMagis+'\MagisErp\'+ DadosConta.IdConta) then
             begin
               CreateDir(DadosConta.PathArqMagis+'\MagisErp\'+ DadosConta.IdConta );

               CreateDir( DadosConta.PathArqMagis+'\MagisErp\' + DadosConta.IdConta +'\'+
                       IntToStr(MonthOfTheYear(Date())) +
                       IntToStr(YearOf(Date())) );
             end
             else
             begin
               if not  DirectoryExists(  DadosConta.PathArqMagis+'\MagisErp\'+ DadosConta.IdConta + '\'+
                       IntToStr(MonthOfTheYear(Date())) +
                       IntToStr(YearOf(Date()))  ) then
               begin
                 CreateDir( DadosConta.PathArqMagis+'\MagisErp\'+ DadosConta.IdConta +'\'+
                       IntToStr(MonthOfTheYear(Date())) +
                       IntToStr(YearOf(Date())) );
               end;

             end;
             // Nome do arquivo de saida no diretorio
             arqTexto := DadosConta.PathArqMagis+'\MagisErp\'+ DadosConta.IdConta +'\' +
                       IntToStr(MonthOfTheYear(Date())) +
                       IntToStr(YearOf(Date()))+ '\';
             // Nome do arquivo para backup de o arquivo existir
             ArqRename := arqTexto;


             arqTexto := arqTexto + IntToStr(cdsViagensid.Value)+ '_' + cdsViagenslinha.Value + '_'+
                         FormatDateTime('ddMMyyyy',cdsViagensdt_abertura.Value)+ '.csv';
              // Renomear
              ArqRename := ArqRename + IntToStr(cdsViagensid.Value)+ '_' + cdsViagenslinha.Value + '_'+
                         FormatDateTime('ddMMyyyy',cdsViagensdt_abertura.Value)+ '.cs_';


              // renomeia arquivo existente
              if FileExists(arqTexto) then
              begin
                if FileExists(ArqRename) then
                  DeleteFile(ArqRename);
                RenameFile(arqTexto, ArqRename);
              end;

             // Salva Arquivo de saida
             _ArqSaida.SaveToFile(arqTexto);
           end;
        end;

         // Persistir log viagem
         if Assigned(ObjViagem) then
         begin
           ObjViagem.Registrada := True;
           PersistirLogViagem(ObjViagem);
           FreeAndNil(ObjViagem);
         end;

         cdsViagens.Next;
      end;

      //Atualizar Parâmetros
      if FlgAtualizaUltDataLeitura then
      AtualizarDatLeituraParam(DataTermino);
    finally
      cdsColetas.EmptyDataSet;
      cdsViagens.EmptyDataSet;
      cdsRota.EmptyDataSet;
      cdsLinha.EmptyDataSet;
      cdsColetor.EmptyDataSet;
      cdsProdutor.EmptyDataSet;
      cdsFazendas.EmptyDataSet;
      cdsVeiculos.EmptyDataSet;
      _ArqSaida.Free;
    end;

  except
    on E: Exception do
    Result := 'Erro: ' + E.message;
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

function TVSSCLRotaConsoleDTM.ValidaInt(Numero: string): Integer;
var
  _Saida: Integer;
begin
  if TryStrToInt(numero,_Saida) then
    Result := _Saida
  else
    Result := -1;
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

function TVSSCLRotaConsoleDTM.OrdenaCrescente(Par01,
  Par02: Pointer): Integer;
var
 obj1, obj2: TColeta;
begin
  obj1 := TColeta(Par01);
  obj2 := TColeta(Par02);
  if obj1.parada_id > obj2.parada_id then
    Result := + 1
  else if obj1.parada_id < obj2.parada_id then
    Result := -1
  else
    Result := 0;
end;

function TVSSCLRotaConsoleDTM.GetDataHora(Data: string): TDateTime; // 2016-12-05 16:43:55
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
// Gera linha de dados do arquivo de coletas
function TVSSCLRotaConsoleDTM.coletasToString(cds: TClientDataSet;separator: Char;colNames: Boolean): string;
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
     'tanque' + Separator +
     'quantidade' + separator +
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
    IntToStr(cds.FieldByName('Id').AsInteger) + separator +
    FormatDateTime('dd/MM/yyy hh:mm:ss', cds.FieldByName('dt_push').AsDateTime) + separator +
    IntToStr(cds.FieldByName('parada_id').AsInteger) + separator +
    IntToStr(cds.FieldByName('coletor_id').AsInteger) + separator +
    IntToStr(cds.FieldByName('tanque_id').AsInteger) + separator +
    FormatDateTime('dd/MM/yyy hh:mm:ss', cds.FieldByName('dt_coleta').AsDateTime) + separator +
    cds.FieldByName('CodigoFazenda').AsString + separator +
    cds.FieldByName('Fazenda').AsString + separator +
    cds.FieldByName('CodigoProdutor').AsString + separator +
    cds.FieldByName('Produtor').AsString + separator +
    cds.FieldByName('tanque').AsString + separator +
    IntToStr(cds.FieldByName('quantidade').AsInteger) + separator +
    FormatFloat('###.##', cds.FieldByName('regua').AsFloat) + separator +
    cds.FieldByName('alizarol').AsString + separator +
    cds.FieldByName('amostra').AsString + separator +
    cds.FieldByName('contraprova').AsString + Separator +
    FormatFloat('##.##', cds.FieldByName('temperatura').AsFloat) + Separator +
    cds.FieldByName('coletada').AsString + separator +
    cds.FieldByName('CodigoLinha').AsString + separator +
    cds.FieldByName('NomeLinha').AsString + Separator +
    cds.FieldByName('CodigoRota').AsString + separator +
    cds.FieldByName('Rota').AsString + Separator +
    cds.FieldByName('Veiculo').AsString + Separator +
    cds.FieldByName('CodigoMotorista').AsString + separator +
    cds.FieldByName('NomeMotorista').AsString + separator +
    FormatDateTime('dd/MM/yyy hh:mm:ss',cds.FieldByName('dt_edicao').AsDateTime);

end;
// Gera arquivo de coletas integrado com dados da viagem
function TVSSCLRotaConsoleDTM.coletasToStringInt(cds, Viagem: TClientDataSet;
  separator: Char; colNames: Boolean; Registro: Byte): string;
var
  CodEmpresa, NomeEmpresa: string;
begin

   if DadosConta.IdConta = '66603' then
   begin
     CodEmpresa := '1';
     NomeEmpresa := 'Porto Alegre - Matriz';
   end
   else if DadosConta.IdConta = '176630' then
   begin
     CodEmpresa := '2' ;
     NomeEmpresa :=  'Porto Alegre - Filial Mutum';
   end
   else if DadosConta.IdConta = '176640' then
   begin
     CodEmpresa := '4';
     NomeEmpresa :=  'Porto Alegre - Filial Rio Pomba';
   end
   else if DadosConta.IdConta = '176650' then
   begin
     CodEmpresa :=  '5';
     NomeEmpresa :=  'Porto Alegre - Filial Bicas';
   end
   else if DadosConta.IdConta = '176660' then
   begin
     CodEmpresa := '6';
     NomeEmpresa :=  'Porto Alegre - Filial São Gotardo';
   end
   else if DadosConta.IdConta = '156007' then
   begin
     CodEmpresa := '1';
     NomeEmpresa :=  'Celles Cordeiro Alimentos';
   end;


   Result := EmptyStr;
   if colNames then
   begin
     if Registro = 0 then // Cabeçalho da viagem
     begin
       Result :=
       '0' + separator +
       'Id' + separator +
       'Viagem' + separator +
       'CodEmpresa' + separator +
       'NomeEmpresa' + separator +
       'CodRota' + separator +
       'NomeRota' + separator +
       'CodLinha' + separator +
       'NomeLinha' + separator +
       'CodColetor' + separator +
       'NomeColetor' + separator +
       'Veiculo' + separator +
       'Dt_Abertura' + separator +
       'Dt_Fechamento' + separator +
       'Km_Inicial' + separator +
       'Km_Final ' + separator +
       'Distancia_Percorrida' + separator +
       'Distancia_Prevista' + separator +
       'Distancia_Assumida' + separator +
       'Data_Liberacao' + separator +
       'Observacoes';
     end;
     if Registro = 2 then  // Cabeçalho da coleta
     begin
       Result :=
       '2' + separator +
       'id' + separator +
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
       'Coletada' + Separator;

       {
       'CodigoLinha' + Separator +
       'NomeLinha' + Separator +
       'CodigoRota'+ separator +
       'Rota' + separator +
       'Veiculo' + separator +
       'CodigoMotorista' + separator +
       'NomeMotorista' + Separator +
       }

     end;
   end;
   if Registro = 1 then // Dados Viagem
   begin
     Result := Result +
     '1' + separator +
     IntToStr(Viagem.FieldByName('Id').AsInteger) + separator +
     Viagem.FieldByName('NumeroViagem').AsString + separator +
     CodEmpresa + separator +
     NomeEmpresa + separator +
     Viagem.FieldByName('Rota').AsString + separator +
     Viagem.FieldByName('NomeRota').AsString + separator +
     Viagem.FieldByName('Linha').AsString + separator +
     Viagem.FieldByName('NomeLinha').AsString + separator +
     Viagem.FieldByName('Coletor').AsString + separator +
     Viagem.FieldByName('NomeColetor').AsString + separator +
     Viagem.FieldByName('PlacaVeiculo').AsString + separator +
     FormatDateTime('dd/MM/yyy hh:mm:ss', Viagem.FieldByName('dt_abertura').AsDateTime) + separator +
     FormatDateTime('dd/MM/yyy hh:mm:ss', Viagem.FieldByName('dt_fechamento').AsDateTime) + separator +
     IntToStr(Viagem.FieldByName('km_inicial').AsInteger) + separator +
     IntToStr(Viagem.FieldByName('km_final').AsInteger) + separator +
     IntToStr(Viagem.FieldByName('km_distancia').AsInteger) + separator +
     IntToStr(Viagem.FieldByName('km_padrao').AsInteger) + separator +
     IntToStr(Viagem.FieldByName('km_real').AsInteger) + separator +
     FormatDateTime('dd/MM/yyy hh:mm:ss', Viagem.FieldByName('dt_liberacao').AsDateTime) + separator +
     Viagem.FieldByName('km_justificativa').AsString;
   end;
   if Registro = 3 then // Dados da coleta
   begin
     Result := Result +
      '3' + separator +
      IntToStr(cds.FieldByName('Id').AsInteger) + separator +
      FormatDateTime('dd/MM/yyy hh:mm:ss', cds.FieldByName('dt_coleta').AsDateTime) + separator +
      cds.FieldByName('CodigoFazenda').AsString + separator +
      cds.FieldByName('Fazenda').AsString + separator +
      cds.FieldByName('CodigoProdutor').AsString + separator +
      cds.FieldByName('Produtor').AsString + separator +
      cds.FieldByName('tanque').AsString + separator +
      IntToStr(cds.FieldByName('quantidade').AsInteger) + separator +
      FormatFloat('###.##', cds.FieldByName('regua').AsFloat) + separator +
      cds.FieldByName('alizarol').AsString + separator +
      cds.FieldByName('amostra').AsString + separator +
      cds.FieldByName('contraprova').AsString + Separator +
      FormatFloat('##.##', cds.FieldByName('temperatura').AsFloat) + Separator +
      cds.FieldByName('coletada').AsString + separator;
    end;
end;
// Exporta as coletas para o formato do sistema  SCL - Sistem2
procedure TVSSCLRotaConsoleDTM.ExportaScl;
var
  DataProcIni, DataProcFim : TDateTime;
begin
  InserirMsgLog('Início Get Coletas - SCL (Sistem2)');
  try
    qryParametros.Close;
    qryParametros.Open;
    DataProcIni := qryParametrosParDatIniLeituraDescargaWS.AsDateTime;
    DataProcFim := Date;
    GetColetas(DataProcIni, DataProcFim, '0',EmptyStr, True);
    InserirMsgLog('Término Get Coletas - SCL (Sistem2)');
  except on E:Exception do
    InserirMsgLog('ERRO : ' + E.Message);
  end;
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

// Popula coleçoes com os atores das coletas em um período
procedure TVSSCLRotaConsoleDTM.PopulaAtoresColeta(DataInicio, DataTermino: TDateTime; Sync:string; Comunitario: string = '9');

 function getRotas(): TListaRota;
  var
    i: Integer;
  begin
    Result := TListaRota.Create;

    DataInicioStr := FormatDateTime('YYYY-MM-dd', DataInicio);
    DataTerminoStr := FormatDateTime('YYYY-MM-dd', DataTermino);
    DadosRetornoRota :=  MakeParConsulta(DadosConta.IdConta,DataInicio,DataTermino,'0','readRota');
    if DadosRetornoRota.Sucesso then
    begin
      ColecaoRota := TJSONArray.create(DadosRetornoRota.Dados);
      if cdsRota.Active then
        cdsRota.Close;
      cdsRota.CreateDataSet;
      for i := 0 to ColecaoRota.length -1 do
      begin
        Rota := ColecaoRota.getJSONObject(i);
        objRota := TRota.Create;
        try
           objRota.id := Rota.getInt('id');
           objRota.Codigo :=  Rota.getString('codigo');
           objRota.Nome := Rota.getString('nome');
           // Empilha rota
           //Result.Add(objRota);

           // popula dataset rota
           cdsRota.Insert;

           cdsRotaCodigo.Value := objRota.Codigo;
           cdsRotaNome.Value := objRota.Nome;

           cdsRota.Post;
        finally
          ;
        end;
      end;
    end;
  end;

  function getLinhas(): TListaLinha;
  var
    i: Integer;
  begin
    Result := TListaLinha.Create;

    DataInicioStr := FormatDateTime('YYYY-MM-dd', DataInicio);
    DataTerminoStr := FormatDateTime('YYYY-MM-dd', DataTermino);
    DadosRetornoLinha :=  MakeParConsulta(DadosConta.IdConta,DataInicio,DataTermino,'0','readLinha');
    if DadosRetornoLinha.Sucesso then
    begin
      ColecaoLinha := TJSONArray.create(DadosRetornoLinha.Dados);
      if cdsLinha.Active then
        cdsLinha.Close;
      cdsLinha.CreateDataSet;
      for i := 0 to ColecaoLinha.length -1 do
      begin
        Linha := ColecaoLinha.getJSONObject(i);
        objLinha := TLinha.Create;

        try
           objLinha.id := Linha.getInt('id');
           objLinha.Codigo :=  Linha.getString('codigo');
           objLinha.Nome := Linha.getString('nome');
           // objLinha.Distancia :=  StrToInt(Linha.getString('distancia'));
           TryStrToInt(Linha.getString('distancia'),objLinha.Distancia);
           // Empilha Linha
           //Result.Add(objLinha);

           // popula dataset linhas
           cdsLinha.Insert;

           cdsLinhaCodigo.Value := objLinha.Codigo;
           cdsLinhaNome.Value := objLinha.Nome;
           cdsLinhadistancia.Value := objLinha.Distancia;

           cdsLinha.Post;

        finally
         ;
        end;
      end;
    end;
  end;

  function getProdutores(): TListaProdutor;
  var
    i: Integer;
  begin
    Result := TListaProdutor.Create;

    DataInicioStr := FormatDateTime('YYYY-MM-dd', DataInicio);
    DataTerminoStr := FormatDateTime('YYYY-MM-dd', DataTermino);
    DadosRetornoProdutor :=  MakeParConsulta(DadosConta.IdConta,DataInicio,DataTermino,'0','readProdutor');
    if DadosRetornoProdutor.Sucesso then
    begin
      ColecaoProdutor := TJSONArray.create(DadosRetornoProdutor.Dados);
      if cdsProdutor.Active then
        cdsProdutor.Close;
      cdsProdutor.CreateDataSet;
      for i := 0 to ColecaoProdutor.length -1 do
      begin
        Produtor := ColecaoProdutor.getJSONObject(i);
        objProdutor := TProdutor.Create;
        try
           objProdutor.id := Produtor.getInt('id');
           objProdutor.Codigo :=  Produtor.getString('codigo');
           objProdutor.Nome := Produtor.getString('nome');
           // Empilha produtor
          // Result.Add(objProdutor);

          // popula cds produtor
           cdsProdutor.Insert;

           cdsProdutorCodigo.Value := objProdutor.Codigo;
           cdsProdutorNome.Value := objProdutor.Nome;

           cdsProdutor.Post;

        finally
         ;
        end;
      end;
    end;
  end;

  function getFazendas(): TListaFazenda;
  var
    i: Integer;
  begin
    Result := TListaFazenda.Create;

    DataInicioStr := FormatDateTime('YYYY-MM-dd', DataInicio);
    DataTerminoStr := FormatDateTime('YYYY-MM-dd', DataTermino);
    DadosRetornoFazenda :=  MakeParConsulta(DadosConta.IdConta,DataInicio,DataTermino,'0','readFazenda');
    if DadosRetornoFazenda.Sucesso then
    begin
      ColecaoFazenda := TJSONArray.create(DadosRetornoFazenda.Dados);
      if cdsFazendas.Active then
        cdsFazendas.Close;
      cdsFazendas.CreateDataSet;
      for i := 0 to ColecaoFazenda.length -1 do
      begin
        Fazenda := ColecaoFazenda.getJSONObject(i);
        objFazenda := TFazenda.Create;

        try
           objFazenda.id := Fazenda.getInt('id');
           objFazenda.Codigo :=  Fazenda.getString('codigo');
           objFazenda.Nome := Fazenda.getString('nome');
           // Empilha Fazenda
           //Result.Add(objFazenda);

           // popula dataset fazendas
           cdsFazendas.Insert;

           cdsFazendascodigo.Value := objFazenda.Codigo;
           cdsFazendasnome.Value := objFazenda.Nome;

           cdsFazendas.Post;

        finally
         ;
        end;
      end;
    end;
  end;

  function getColetores(): TListaColetor;
  var
    i: Integer;
  begin
    Result := TListaColetor.Create;

    DataInicioStr := FormatDateTime('YYYY-MM-dd', DataInicio);
    DataTerminoStr := FormatDateTime('YYYY-MM-dd', DataTermino);
    DadosRetornoColetor :=  MakeParConsulta(DadosConta.IdConta,DataInicio,DataTermino,'0','readColetor');
    if DadosRetornoColetor.Sucesso then
    begin
      ColecaoColetor := TJSONArray.create(DadosRetornoColetor.Dados);
      if cdsColetor.Active then
        cdsColetor.Close;
      cdsColetor.CreateDataSet;
      for i := 0 to ColecaoColetor.length -1 do
      begin
        Coletor := ColecaoColetor.getJSONObject(i);
        objColetor := TColetor.Create;
        try
           objColetor.id := Coletor.getInt('id');
           objColetor.Codigo :=  Coletor.getString('codigo');
           objColetor.Nome := Coletor.getString('nome');
           // Empilha Coletor
          //  Result.Add(objColetor);

          // popula dataset de coletores
           cdsColetor.Insert;

           cdsColetorCodigo.Value := objColetor.Codigo;
           cdsColetorNome.Value := objColetor.Nome;

           cdsColetor.Post;


        finally
         ;
        end;
      end;
    end;
  end;

  function getVeiculos(): TListaVeiculo;
  var
    i: Integer;
  begin
    Result := TListaVeiculo.Create;

    DataInicioStr := FormatDateTime('YYYY-MM-dd', DataInicio);
    DataTerminoStr := FormatDateTime('YYYY-MM-dd', DataTermino);
    DadosRetornoVeiculo :=  MakeParConsulta(DadosConta.IdConta,DataInicio,DataTermino,'0','readVeiculo');
    if DadosRetornoVeiculo.Sucesso then
    begin
      ColecaoVeiculo := TJSONArray.create(DadosRetornoVeiculo.Dados);
      if cdsVeiculos.Active then
        cdsVeiculos.Close;
      cdsVeiculos.CreateDataSet;
      for i := 0 to ColecaoVeiculo.length -1 do
      begin
        Veiculo := ColecaoVeiculo.getJSONObject(i);
        objVeiculo := TVeiculo.Create;
        try
           objVeiculo.id := Veiculo.getInt('id');
           objVeiculo.Codigo :=  Veiculo.getString('codigo');
           objVeiculo.Placa := Veiculo.getString('placa');
           // Empilha Veiculo
           //  Result.Add(objVeiculo);

           // popula dataset de veiculo
           cdsVeiculos.Insert;

           cdsVeiculoscodigo.Value := objVeiculo.Codigo;
           cdsVeiculosid.Value := objVeiculo.id;
           cdsVeiculosplaca.Value := objVeiculo.Placa;

           cdsVeiculos.Post;
        finally
         ;
        end;
      end;
    end;
  end;
  {Carrega viagens}

  function getViagens(): TListaRegViagem;
  var
    i: Integer;
  begin
    Result := TListaRegViagem.Create;

    DataInicioStr := FormatDateTime('YYYY-MM-dd', DataInicio);
    DataTerminoStr := FormatDateTime('YYYY-MM-dd', DataTermino);
    DadosRetornoViagem :=  MakeParConsulta(DadosConta.IdConta,DataInicio,DataTermino,'0','readViagem');
    if DadosRetornoViagem.Sucesso then
    begin
      ColecaoViagem := TJSONArray.create(DadosRetornoViagem.Dados);
      if cdsViagens.Active then
        cdsViagens.Close;
      cdsViagens.CreateDataSet;
      for i := 0 to ColecaoViagem.length -1 do
      begin
        Viagem := ColecaoViagem.getJSONObject(i);
        objRegViagem := TRegViagem.Create;
        try
           objRegViagem.id := ValidaInt(Viagem.getString('id'));
           objRegViagem.veiculo_id := ValidaInt(Viagem.getString('veiculo_id'));
           objRegViagem.coletor_id := ValidaInt(Viagem.getString('coletor_id'));
           objRegViagem.linha_id := ValidaInt(Viagem.getString('linha_id'));
           objRegViagem.rota_id := ValidaInt(Viagem.getString('rota_id'));
           objRegViagem.conta_id := ValidaInt(Viagem.getString('conta_id'));
          // objRegViagem.tecnico_id := ValidaInt(Viagem.getString('tecnico_id'));
           objRegViagem.dt_fechamento := GetDataHora(Viagem.getString('dt_fechamento'));
           objRegViagem.dt_push := GetDataHora(Viagem.getString('dt_push'));
           objRegViagem.dt_abertura := GetDataHora(Viagem.getString('dt_abertura'));
           objRegViagem.dt_descarga := GetDataHora(Viagem.getString('dt_descarga'));
           objRegViagem.dt_liberacao := GetDataHora(Viagem.getString('dt_liberacao'));
           objRegViagem.km_inicial := Viagem.getInt('km_inicial');
           objRegViagem.km_final := Viagem.getInt('km_final');
           objRegViagem.km_distancia := Viagem.getInt('km_distancia');
           objRegViagem.km_justificativa := Viagem.getString('km_justificativa');
           objRegViagem.descarrega := Viagem.getString('descarregada');
           objRegViagem.liberada := Viagem.getString('liberada');
           objRegViagem.Rota := Viagem.getString('rota');
           objRegViagem.Linha := Viagem.getString('linha');
           objRegViagem.Coletor := Viagem.getString('coletor');
           objRegViagem.Veiculo := Viagem.getString('veiculo');
           objRegViagem.ComunitarioPendente :=  Viagem.getString('comunitario_pendente');

           // Empilha Viagem
          // Result.Add(objRegViagem);

           // popula dataset de viagens

           cdsViagens.Insert;

           cdsViagensid.Value            :=  objRegViagem.id ;
           cdsViagensveiculo_id.Value    :=  objRegViagem.veiculo_id;
           cdsViagenscoletor_id.Value    :=  objRegViagem.coletor_id;
           cdsViagenslinha_id.Value      :=  objRegViagem.linha_id;
           cdsViagensrota_id.Value       :=  objRegViagem.rota_id;
           cdsViagensdt_push.Value       :=  objRegViagem.dt_push;
           cdsViagensdt_abertura.Value   :=  objRegViagem.dt_abertura;
           cdsViagensdt_fechamento.Value :=  objRegViagem.dt_fechamento;
           cdsViagenskm_inicial.Value    :=  objRegViagem.km_inicial;
           cdsViagenskm_final.Value      :=  objRegViagem.km_final;
           cdsViagensdt_liberacao.Value  :=  objRegViagem. dt_liberacao;
           cdsViagensrota.Value          :=  objRegViagem.Rota;
           cdsViagenslinha.Value         :=  objRegViagem.Linha;
           cdsViagenscoletor.Value       :=  objRegViagem.Coletor;
           cdsViagensveiculo.Value       :=  objRegViagem.Veiculo;
           cdsViagenskm_distancia.Value  :=  objRegViagem.km_distancia;
           cdsViagenskm_real.Value       :=  objRegViagem.km_distancia;
           cdsViagenscomunitario_pendente.Value := objRegViagem.ComunitarioPendente;

           cdsViagens.Post;
        finally
         ;
        end;
      end;
    end;
  end;
  {Carrega coletas }
  function getColetas(): TListaColeta;
  var
    i: Integer;
  begin
    Result := TListaColeta.Create;

    DataInicioStr := FormatDateTime('YYYY-MM-dd', DataInicio);
    DataTerminoStr := FormatDateTime('YYYY-MM-dd', DataTermino);

    // Coletas tanques individuais
    DadosRetornoColeta :=  MakeParConsulta(DadosConta.IdConta,DataInicio,DataTermino,'0','readColeta', NaoRetornaComunitario);
    if DadosRetornoColeta.Sucesso then
    begin
      ColecaoColeta := TJSONArray.create(DadosRetornoColeta.Dados);
      // Ativa dataset
      if cdsColetas.Active then
        cdsColetas.Close;
      cdsColetas.CreateDataSet;

      for i := 0 to ColecaoColeta.length -1 do
      begin
        Coleta := ColecaoColeta.getJSONObject(i);
        objColeta := TColeta.Create;
        try
           objColeta.id := Coleta.getInt('id');
           objColeta.dt_push :=  GetDataHora(Coleta.getString('dt_push'));
           objColeta.viagem_id := ValidaInt(Coleta.getString('viagem_id'));
           objColeta.parada_id := ValidaInt(Coleta.getString('parada_id'));
           objColeta.coletor_id := ValidaInt(Coleta.getString('coletor_id'));
           objColeta.tanque_id := ValidaInt(Coleta.getString('tanque_id'));
           objColeta.dt_coleta := GetDataHora(Coleta.getString('dt_coleta'));
           objColeta.CodigoFazenda := Coleta.getString('fazenda');
           objColeta.CodigoProdutor := Coleta.getString('produtor');
           objColeta.tanque := Coleta.getString('tanque');
           objColeta.quantidade := Coleta.getInt('quantidade');
           objColeta.regua := Coleta.getDouble('regua');
           objColeta.alizarol := Coleta.getString('alizarol');
           objColeta.amostra := Coleta.getString('amostra');
           objColeta.contraprova := Coleta.getString('contraprova');
           objColeta.temperatura := Coleta.getDouble('temperatura');
           objColeta.coletada := Coleta.getString('coletada');
           objColeta.dt_edicao := GetDataHora(Coleta.getString('dt_edicao'));
           objColeta.CodigoMotorista := Coleta.getString('coletor');
           // Empilha Coleta
         //  Result.Add(objColeta);

           // Popula dataset de coleta
           cdsColetas.Append;

           cdsColetasid.Value := objColeta.Id;
           cdsColetasdt_push.Value := objColeta.dt_push;
           cdsColetascoletor_id.Value := objColeta.coletor_id;
           cdsColetasparada_id.Value := objColeta.parada_id;
           cdsColetastanque_id.Value := objColeta.tanque_id;
           cdsColetasdt_coleta.Value := objColeta.dt_coleta ;
           cdsColetasCodigoProdutor.Value := objColeta.CodigoProdutor;
           cdsColetasquantidade.Value := objColeta.quantidade;
           cdsColetasregua.Value := objColeta.regua;
           cdsColetasalizarol.Value := objColeta.alizarol;
           cdsColetasamostra.Value := objColeta.amostra;
           cdsColetascontraprova.Value := objColeta.contraprova;
           cdsColetastemperatura.Value := objColeta.temperatura;
           cdsColetascoletada.Value := objColeta.coletada;
           cdsColetasdt_edicao.Value := objColeta.dt_edicao;
           cdsColetasviagem_id.Value := objColeta.viagem_id;
           cdsColetasCodigoFazenda.Value := objColeta.CodigoFazenda;
           cdsColetastanque.Value := objColeta.tanque;

           cdsColetas.Post;
        finally
         ;
        end;
      end;
    end;

    // Coletas Distribuicao dos tanques coletivos
    DadosRetornoColeta :=  MakeParConsulta(DadosConta.IdConta,DataInicio,DataTermino,'0','readColetaComunitaria',RetornaComunitario );
    if DadosRetornoColeta.Sucesso then
    begin
      ColecaoColeta := TJSONArray.create(DadosRetornoColeta.Dados);
      // Ativa dataset
     // cdsColetas.CreateDataSet;
      for i := 0 to ColecaoColeta.length -1 do
      begin
        Coleta := ColecaoColeta.getJSONObject(i);
        objColeta := TColeta.Create;
        try
           objColeta.id := Coleta.getInt('id');
           objColeta.dt_push :=  GetDataHora(Coleta.getString('dt_push'));
           objColeta.viagem_id := ValidaInt(Coleta.getString('viagem_id'));
           objColeta.parada_id := ValidaInt(Coleta.getString('parada_id'));
           objColeta.coletor_id := ValidaInt(Coleta.getString('coletor_id'));
           objColeta.tanque_id := ValidaInt(Coleta.getString('tanque_id'));
           objColeta.dt_coleta := GetDataHora(Coleta.getString('dt_coleta'));
           objColeta.CodigoFazenda := Coleta.getString('fazenda');
           objColeta.CodigoProdutor := Coleta.getString('produtor');
           objColeta.tanque := Coleta.getString('tanque');
           objColeta.quantidade := Coleta.getInt('quantidade');
           objColeta.regua := Coleta.getDouble('regua');
           objColeta.alizarol := Coleta.getString('alizarol');
           objColeta.amostra := Coleta.getString('amostra');
           objColeta.contraprova := Coleta.getString('contraprova');
           objColeta.temperatura := Coleta.getDouble('temperatura');
           objColeta.coletada := Coleta.getString('coletada');
           objColeta.dt_edicao := GetDataHora(Coleta.getString('dt_edicao'));
           objColeta.CodigoMotorista := Coleta.getString('coletor');
           // Empilha Coleta
         //  Result.Add(objColeta);

           // Popula dataset de coleta
           cdsColetas.Append;

           cdsColetasid.Value := objColeta.Id;
           cdsColetasdt_push.Value := objColeta.dt_push;
           cdsColetascoletor_id.Value := objColeta.coletor_id;
           cdsColetasparada_id.Value := objColeta.parada_id;
           cdsColetastanque_id.Value := objColeta.tanque_id;
           cdsColetasdt_coleta.Value := objColeta.dt_coleta ;
           cdsColetasCodigoProdutor.Value := objColeta.CodigoProdutor;
           cdsColetasquantidade.Value := objColeta.quantidade;
           cdsColetasregua.Value := objColeta.regua;
           cdsColetasalizarol.Value := objColeta.alizarol;
           cdsColetasamostra.Value := objColeta.amostra;
           cdsColetascontraprova.Value := objColeta.contraprova;
           cdsColetastemperatura.Value := objColeta.temperatura;
           cdsColetascoletada.Value := objColeta.coletada;
           cdsColetasdt_edicao.Value := objColeta.dt_edicao;
           cdsColetasviagem_id.Value := objColeta.viagem_id;
           cdsColetasCodigoFazenda.Value := objColeta.CodigoFazenda;
           cdsColetastanque.Value := objColeta.tanque;

           cdsColetas.Post;
        finally
         ;
        end;
      end;
    end;
  end;

  {Visitas em uma periodo}

  function getVisitas(): TListaVisita;
  var
    i: Integer;
  begin
    Result := TListaVisita.Create;

    DataInicioStr := FormatDateTime('YYYY-MM-dd', DataInicio);
    DataTerminoStr := FormatDateTime('YYYY-MM-dd', DataTermino);
    DadosRetornoVisita :=  MakeParConsulta(DadosConta.IdConta,DataInicio,DataTermino,'0','readVisita');
    if DadosRetornoVisita.Sucesso then
    begin
      ColecaoVisita := TJSONArray.create(DadosRetornoVisita.Dados);
      for i := 0 to ColecaoVisita.length -1 do
      begin
        Visita := ColecaoVisita.getJSONObject(i);
        objVisita := TVisita.Create;
        try
           objVisita.id := Visita.getInt('id');
           objVisita.viagem_id := ValidaInt(Visita.getString('viagem_id'));
           objVisita.conta_id := ValidaInt(Visita.getString('conta_id'));
           objVisita.rota_id := ValidaInt(Visita.getString('rota_id'));
           objVisita.linha_id := ValidaInt(Visita.getString('linha_id'));
           objVisita.fazenda_id := ValidaInt(Visita.getString('fazenda_id'));
           objVisita.dt_push := GetData(Visita.getString('dt_push'));
           objVisita.dt_inicio := GetData(Visita.getString('dt_inicio'));
           objVisita.dt_fim := GetData(Visita.getString('dt_fim'));
           objVisita.motivo := Visita.getString('motivo');
           objVisita.cancelado := Visita.getString('cancelado');
           objVisita.total_coleta := Visita.getInt('total_coleta');
           // Empilha Visita
           Result.Add(objVisita);
        finally
         ;
        end;
      end;
    end;
  end;
begin
    getRotas;
    getLinhas;
    getProdutores;
    getFazendas;
    getColetores;
    getVeiculos;
    getColetas;
    getViagens;
end;
// Exporta dados para o sistema de rasteabilidade SIGA
procedure TVSSCLRotaConsoleDTM.ExportaSiga;
var
  DataProcIni, DataProcFim : TDateTime;
begin
  InserirMsgLog('Início Exporta SIGA.');
  try
    qryParametros.Close;
    qryParametros.Open;
    DataProcIni := qryParametrosParDatIniLeituraDescargaWS.AsDateTime;
    DataProcFim := Date;
    GetDadosSiga(DataProcIni, DataProcFim, '0',EmptyStr, False);
    InserirMsgLog('Término Siga');
  except on E:Exception do
    InserirMsgLog('ERRO : ' + E.Message);
  end;

end;

function TVSSCLRotaConsoleDTM.GetDadosSiga(DataInicio,
  DataTermino: TDateTime; Sync, Comunitario: string;
  FlgAtualizaUltDataLeitura: Boolean): String;
  var
    objColetaSiga: TSigaColetaIndividual;
    objViagemSiga: TSigaViagem;

  function ViagemJahProcessada(IdViagem: Integer): Boolean;
  begin
    qrySQL.Close;
    qrySQL.SQL.Text := 'SELECT 1 FROM LogViagem WHERE LovViagemId = :Id and LovGerSiga = :LovGerSiga';
    qrySQL.ParamByName('Id').Value := IdViagem;
    qrySQL.ParamByName('LovGerSiga').Value := FlagSim;
    qrySQL.Open;

    Result := not qrySQL.IsEmpty;
  end;

  function ViagemJahRegistrada(idViagem: Integer): TViagem;
  begin
    Result := TViagem.Create;
    qrySQL.Close;
    qrySQL.SQL.Text := 'Select * from LogViagem WHERE LovViagemId = :Id';
    qrySQL.ParamByName('Id').Value := idViagem;
    qrySQL.Open;
    if not qrySQL.IsEmpty then
    begin
      Result.Id := qrySQL.FieldByName('LovId').AsInteger;
      Result.RotaId := qrySQL.FieldByName('LovRotaId').AsInteger;
      Result.RotaCodigo := qrySQL.FieldByName('LovRotaCod').AsString;
      Result.DatAbertura := qrySQL.FieldByName('LovDataViagem').AsDateTime;
      Result.Liberada := True;
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
    // Polula datasets
    PopulaAtoresColeta(DataInicio,DataTermino,Sync,Comunitario);

    // Gera Arquivos de Agendes Siga
    _ArqCadSiga := TStringList.Create;
    _ArqCadSiga.Clear;

    cdsColetor.First;
    while not cdsColetor.Eof do
    begin
      try
         objTranspSiga := TSigaTransportador.Create;
         objTranspSiga.idRegistro := 'T';
         objTranspSiga.codigoTransportador := cdsColetorCodigo.Value;
         objTranspSiga.nomeTransportador := cdsColetorNome.Value;

         if ((objTranspSiga.codigoTransportador = EmptyStr) or (objTranspSiga.nomeTransportador = EmptyStr)) then
         begin
           cdsColetor.Next;
           Continue;
         end;

         // Adiciona registro no arquivo
         _ArqCadSiga.Add(objTranspSiga.toString(';'));

        // proximo registro
        cdsColetor.Next;
      finally
       objTranspSiga.Free;
      end;
    end;

    // Arquivo com dados coleta formatado
    _ArqSaida := TStringList.Create;

    // ordena as viagem por id
    cdsViagens.IndexFieldNames := 'id';

    // Ordena as coletas por viagem
    cdsColetas.IndexFieldNames := 'viagem_id';

    cdsViagens.First;
    i := 0;
    try
      for i := 0 to (cdsViagens.RecordCount -1) do
      begin
        try
          _ArqSaida.Clear;

          // Verifica se a viagem já foi processada
          if ViagemJahProcessada(cdsViagensid.Value) then
          begin
            cdsViagens.Next;
            Continue;
          end;

          // Verifica se a distribuição do tanque comunitario esta pendente e não gera o arquivo
          if (cdsViagenscomunitario_pendente.Value = 'true') then
          begin
            cdsViagens.Next;
            Continue;   
          end;

          // Cria objeto viagem para persistencia no log
          ObjViagem := ViagemJahRegistrada(cdsViagensid.Value);
          ObjViagem.Id := cdsViagensid.Value;
          ObjViagem.RotaId := cdsViagensrota_id.Value;
          ObjViagem.RotaCodigo := cdsViagensrota.Value;
          ObjViagem.DatAbertura := cdsViagensdt_abertura.Value;
          ObjViagem.DatFechamento := cdsViagensdt_fechamento.Value;
          ObjViagem.GerouSiga := FlagSim;

          // Completa dados da viagem
          cdsViagens.Edit;
          if cdsLinha.Locate('codigo', cdsViagenslinha.Value,[loPartialKey]) then
          begin
            cdsViagensNomeLinha.Value := cdsLinhaNome.Value;
            cdsViagenskm_padrao.Value := cdsLinhadistancia.Value;
          end;
          if cdsRota.Locate('codigo', cdsViagensrota.Value,[loPartialKey]) then
          begin
            cdsViagensNomeRota.Value := cdsRotaNome.Value;
          end;
          if cdsColetor.Locate('codigo', cdsViagenscoletor.Value,[loPartialKey])then
          begin
            cdsViagensNomeColetor.Value := cdsColetorNome.Value;
          end;
          if cdsVeiculos.Locate('codigo',cdsViagensveiculo.Value,[loPartialKey])then
          begin
            cdsViagensPlacaVeiculo.Value := cdsVeiculosplaca.Value;
          end;
          ObjViagem.Coletor := cdsViagenscoletor.Value;
          ObjViagem.Veiculo := cdsViagensPlacaVeiculo.Value;

          // Numero da viagem para o veículo e motorista coletor
          qryAux.SQL.Clear;
          qryAux.SQL.Add('Select Count(LovId) Total from LogViagem where LovColetor = :LovColetor and LovVeiculo = :LovVeiculo and LovDataViagem = :LovDataViagem');
          qryAux.ParamByName('LovColetor').Value := ObjViagem.Coletor;
          qryAux.ParamByName('LovVeiculo').Value := ObjViagem.Veiculo;
          qryAux.ParamByName('LovDataViagem').Value := GetData(DateToStr(ObjViagem.DatAbertura));
          qryAux.Open;
          FResultado := (qryAux.FieldByName('Total').Value + 1);
          cdsViagensNumeroViagem.Value := FResultado;

          cdsViagens.Post;

          // Popula linha de cabecalho no arquivo de integração SIGA - REgistro C
          objViagemSiga := TSigaViagem.Create;

          objViagemSiga.idRegistro := 'C';
          objViagemSiga.rota := cdsViagenslinha.Value;
          objViagemSiga.ramal := 'N';
          objViagemSiga.inicio := ObjViagem.DatAbertura;
          objViagemSiga.final := ObjViagem.DatFechamento;
          objViagemSiga.equipamento := ObjViagem.Veiculo;
          objViagemSiga.transportador := ObjViagem.Coletor;
          objViagemSiga.volumecoleta :=  ObjViagem.QtdeColetado;
          objViagemSiga.dtRecepcao := ObjViagem.DatFechamento; // Substituir para data entrada na plataforma para descarga
          objViagemSiga.recebido := 's';  // substituir pelo status descarga - realizada (s)  nao realizada (n) - minúsculo;
          objViagemSiga.motivo := ' '; // motivo pre-cadaastrado de não recebimento do leite na descarga
          objViagemSiga.temperatura := 5; // Temperatura do produto no inicio da descarga;
          objViagemSiga.volumeEfetivo := ObjViagem.QtdeArmazenado;
          objViagemSiga.alizarol := 'n';  // negativo (N - Leite bom)  positivo (S - Leite acido)
          objViagemSiga.fimDescarga := ObjViagem.DatFechamento; // Substituir pelo horario real de final de descarga

          // insere o registro de cabeçalho da viagem no arquivo
          _ArqSaida.Add(objViagemSiga.toString(';'));


          cdsColetas.First;
          for j := 0 to (cdsColetas.RecordCount -1 )  do
          begin
            // se a coleta não for desta viagem, pula..
            if (cdsColetasviagem_id.Value <> cdsViagensid.Value) then
            begin
              cdsColetas.Next;
              Continue;
            end;
            try
              // Completa Dados dos atores na coleta atual
              cdsColetas.Edit;
              // Localiza dados dos atores na coleta
              if cdsFazendas.Locate('codigo',cdsColetasCodigoFazenda.Value,[loPartialKey]) then
              begin
                cdsColetasCodigoFazenda.Value := cdsFazendascodigo.Value;
                cdsColetasFazenda.Value := cdsFazendasnome.Value;
              end;
              if cdsProdutor.Locate('codigo',cdsColetasCodigoProdutor.Value,[loCaseInsensitive]) then
              begin
                 cdsColetasCodigoProdutor.Value := cdsProdutorCodigo.Value;
                 cdsColetasProdutor.Value := cdsProdutorNome.Value;
              end;
              if cdsLinha.Locate('codigo',cdsViagenslinha.Value,[loPartialKey])then
              begin
                cdsColetasCodigoLinha.Value := cdsLinhaCodigo.Value;
                cdsColetasNomeLinha.Value := cdsLinhaNome.Value;
              end;
              if cdsRota.Locate('codigo',cdsViagensrota.Value,[loPartialKey]) then
              begin
                cdsColetasCodigoRota.Value := cdsRotaCodigo.Value;
                cdsColetasRota.Value := cdsRotaNome.Value;
              end;
              if cdsColetor.Locate('codigo',cdsViagenscoletor.Value,[loPartialKey]) then
              begin
                cdsColetasCodigoMotorista.Value := cdsColetorCodigo.Value;
                cdsColetasNomeMotorista.Value := cdsColetorNome.Value;
              end;
              if cdsVeiculos.Locate('codigo',cdsViagensveiculo.Value,[loPartialKey]) then
              begin
                cdsColetasVeiculo.Value := cdsVeiculosplaca.Value;
              end;
              // Atualiza registro
              cdsColetas.Post;

              // Cria instancia do objeto de coleta individual siga
              objColetaSiga := TSigaColetaIndividual.Create;

              objColetaSiga.idRegistro := 'L';
              objColetaSiga.veiculo := ObjViagem.Veiculo;
              objColetaSiga.recepcao := ObjViagem.DatFechamento;
              objColetaSiga.dtColeta := cdsColetasdt_coleta.Value;
              objColetaSiga.fornecedor := cdsColetasCodigoProdutor.Value;
              objColetaSiga.filial := '0';
              objColetaSiga.volume := cdsColetasquantidade.AsInteger;
              objColetaSiga.temperatura := cdsColetastemperatura.Value;
              objColetaSiga.amostra := FlagNao;
              objColetaSiga.alizarol := FlagNao;
              objColetaSiga.amostraRede := FlagNao;


              // Insere registro de coleta no arquivo texto
               _ArqSaida.Add( objColetaSiga.toString(';'));

              // Proxima coleta
              cdsColetas.Next;
            finally
              objColetaSiga.Destroy;
            end;
          end;
        finally
           if (_ArqSaida.Count > 0) then
           begin
             // Monta nome arquivo saida

             if not DirectoryExists(DadosConta.PathArqSiga + '\Siga' + DadosConta.IdConta) then
             begin
               CreateDir(DadosConta.PathArqSiga + '\Siga\' + DadosConta.IdConta);

               CreateDir( DadosConta.PathArqSiga + '\Siga\'+ DadosConta.IdConta +'\' +
                       IntToStr(MonthOfTheYear(Date())) +
                       IntToStr(YearOf(Date())) );
               // Diretorio de Cadastros basicos Siga
               CreateDir( DadosConta.PathArqSiga + '\Siga\'+ DadosConta.IdConta +'\Cadastros');

             end
             else
             begin
               if not  DirectoryExists(  DadosConta.PathArqSiga + '\Siga\'+ DadosConta.IdConta + '\' +
                       IntToStr(MonthOfTheYear(Date())) +
                       IntToStr(YearOf(Date()))  ) then
               begin
                 CreateDir( DadosConta.PathArqSiga + '\Siga\'+ DadosConta.IdConta +'\'+
                       IntToStr(MonthOfTheYear(Date())) +
                       IntToStr(YearOf(Date())) );
               end;

             end;
             // Nome do arquivo de saida no diretorio
             arqTexto := DadosConta.PathArqSiga + '\Siga\'+ DadosConta.IdConta + '\'+
                       IntToStr(MonthOfTheYear(Date())) +
                       IntToStr(YearOf(Date()))+ '\';
             // Nome do arquivo para backup de o arquivo existir
             ArqRename := arqTexto;

             // Nome Arquivo de Cadastro Coletores
             ArqSigaColetor := DadosConta.PathArqSiga + '\Siga\'+ DadosConta.IdConta + '\Cadastros\TransSiga.txt';


             arqTexto := arqTexto + IntToStr(cdsViagensid.Value)+ '_' + cdsViagenslinha.Value + '_'+
                         FormatDateTime('ddMMyyyy',cdsViagensdt_abertura.Value)+ '.txt';
              // Renomear
              ArqRename := ArqRename + IntToStr(cdsViagensid.Value)+ '_' + cdsViagenslinha.Value + '_'+
                         FormatDateTime('ddMMyyyy',cdsViagensdt_abertura.Value)+ '.tx_';

              // renomeia arquivo existente
              if FileExists(arqTexto) then
              begin
                if FileExists(ArqRename) then
                  DeleteFile(ArqRename);
                RenameFile(arqTexto, ArqRename);
              end;

             // Salva Arquivo de saida
             _ArqSaida.SaveToFile(arqTexto);

           end;
        end;

         // Persistir log viagem
         if Assigned(ObjViagem) then
         begin
           ObjViagem.Registrada := True;
           PersistirLogViagem(ObjViagem);
           FreeAndNil(ObjViagem);
         end;

         cdsViagens.Next;
      end;

      // Gera cadastratos
      _ArqCadSiga.SaveToFile(ArqSigaColetor);

      //Atualizar Parâmetros
      if FlgAtualizaUltDataLeitura then
      AtualizarDatLeituraParam(DataTermino);
    finally
      cdsColetas.EmptyDataSet;
      cdsViagens.EmptyDataSet;
      cdsRota.EmptyDataSet;
      cdsLinha.EmptyDataSet;
      cdsColetor.EmptyDataSet;
      cdsProdutor.EmptyDataSet;
      cdsFazendas.EmptyDataSet;
      cdsVeiculos.EmptyDataSet;
      _ArqSaida.Free;
      _ArqCadSiga.Free;
    end;
  except
    on E: Exception do
    Result := 'Erro: ' + E.message;
  end;
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

end.
