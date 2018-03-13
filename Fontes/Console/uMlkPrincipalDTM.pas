unit uMlkPrincipalDTM;

interface

uses
  SysUtils, Classes, DB, ADODB,Forms,uConexao, Messages, Dialogs, Provider,
  uS2SQLDataSet, DBClient, uConstantesComuns, Variants, JvScheduledEvents,
  ExtCtrls, JvAppInst, uVSSCLRotaComum, uJSON, uSCLRCnExport, FMTBcd, SqlExpr,
  DateUtils, ImgList, Controls, ZAbstractConnection, ZConnection,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, FileCtrl, Windows, JvTFManager,
  RxTimerLst;


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
    cdsColetas: TClientDataSet;
    cdsColetasid: TIntegerField;
    cdsColetasdt_push: TDateTimeField;
    cdsColetasparada_id: TIntegerField;
    cdsColetascoletor_id: TIntegerField;
    cdsColetastanque_id: TIntegerField;
    cdsColetasviagem_id: TIntegerField;
    cdsColetasdt_coleta: TDateTimeField;
    cdsColetasCodigoFazenda: TWideStringField;
    cdsColetasFazenda: TWideStringField;
    cdsColetasCodigoProdutor: TWideStringField;
    cdsColetasProdutor: TWideStringField;
    cdsColetastanque: TWideStringField;
    cdsColetasquantidade: TIntegerField;
    cdsColetasregua: TFloatField;
    cdsColetasalizarol: TWideStringField;
    cdsColetasamostra: TWideStringField;
    cdsColetascontraprova: TWideStringField;
    cdsColetastemperatura: TFloatField;
    cdsColetasBoca: TStringField;
    cdsColetascoletada: TWideStringField;
    cdsColetasCodigoLinha: TWideStringField;
    cdsColetasNomeLinha: TWideStringField;
    cdsColetasCodigoRota: TWideStringField;
    cdsColetasRota: TWideStringField;
    cdsColetasVeiculo: TWideStringField;
    cdsColetasCodigoMotorista: TWideStringField;
    cdsColetasNomeMotorista: TWideStringField;
    cdsColetasdt_edicao: TDateTimeField;
    cdsRota: TClientDataSet;
    cdsRotaCodigo: TStringField;
    cdsRotaNome: TStringField;
    cdsRotatipo_descarga: TStringField;
    cdsRotagruporota: TStringField;
    cdsLinha: TClientDataSet;
    cdsLinhaCodigo: TStringField;
    cdsLinhaNome: TStringField;
    cdsLinhaRota: TStringField;
    cdsLinhadistancia: TIntegerField;
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
    cdsVeiculosid: TIntegerField;
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
    cdsViagensNumeroViagem: TIntegerField;
    cdsViagensdt_abertura: TDateTimeField;
    cdsViagensdt_fechamento: TDateTimeField;
    cdsViagenskm_inicial: TFloatField;
    cdsViagenskm_final: TFloatField;
    cdsViagensdt_liberacao: TDateTimeField;
    cdsViagenskm_distancia: TIntegerField;
    cdsViagenskm_padrao: TIntegerField;
    cdsViagenskm_real: TIntegerField;
    cdsViagenskm_justificativa: TWideStringField;
    cdsViagensrota: TWideStringField;
    cdsViagenscoletor: TWideStringField;
    cdsViagenslinha: TWideStringField;
    cdsViagensveiculo: TWideStringField;
    cdsViagensPlacaVeiculo: TStringField;
    cdsViagensNomeLinha: TStringField;
    cdsViagensNomeRota: TStringField;
    cdsViagensNomeColetor: TStringField;
    cdsViagenscomunitario_pendente: TStringField;
    cdsViagensbocas: TStringField;
    qryAux: TADOQuery;
    qryApoio: TADOQuery;
    cdsControleultimaiteracao: TDateTimeField;
    cdsViagemContaId: TIntegerField;
    cdsViagemLovDataViagem: TDateTimeField;
    ImageList1: TImageList;
    cnnDbMaster: TZConnection;
    qryDbAux: TZQuery;
    cdsItinerarios: TClientDataSet;
    cdsItinerarioscodigo: TStringField;
    cdsItinerarioslinha: TStringField;
    cdsItinerariosfazenda: TStringField;
    cdsItinerarioshorario: TStringField;
    cdsItinerarioscoleta_seletiva: TStringField;
    cdsItinerariosordem: TStringField;
    cdsTanques: TClientDataSet;
    cdsTanquestipo: TStringField;
    cdsTanquescodigo: TStringField;
    cdsTanquesfazenda: TStringField;
    cdsTanquesveiculo: TStringField;
    cdsTanquescapacidade: TIntegerField;
    cdsTanquesaltura: TIntegerField;
    cdsTanquesperimetro: TIntegerField;
    cdsTanquesvolume: TIntegerField;
    cdsTanquescomunitario: TStringField;
    cdsTanquesdistribuicao: TStringField;
    cdsTanquesdiferenca: TStringField;
    cdsTanquesimpressao: TStringField;
    cdsTanquesdivisao: TStringField;
    cdsTanquescoleta_seletiva: TStringField;
    cdsTanquesdeleted: TStringField;
    cdsContasDatUltSync: TDateTimeField;
    cdsContasDatUltCarga: TDateTimeField;
    cdsContasCarga: TStringField;
    cdsViagenstanques: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsContasBeforePost(DataSet: TDataSet);
    procedure tmrConsoleTimer(Sender: TObject);
    procedure tmrSyncTimer(Sender: TObject);

    function getServerData: TSatusSync;
    procedure DataModuleDestroy(Sender: TObject);
    procedure sheConsoleEvents1Execute(Sender: TJvEventCollectionItem;
      const IsSnoozeEvent: Boolean);

  private
    FStrConexao: string;
    FConexaoBD: TConexao;
    FStatusTmrSync: string;
    FStatusTmrConsole: string;
    function IsContaInserted(Codigo: Integer): Boolean;
    function ResetSync(Tipo:String): Boolean;

  public
    ShowStatusTmr:  procedure of object;
    property StatusTmrSync: string read FStatusTmrSync write FStatusTmrSync ;
    property StatusTmrConsole: string read FStatusTmrConsole write FStatusTmrConsole ;
    procedure PesquisarConta(Filtro: string);
    procedure SalvarConta;
    procedure InserirVlrDefaultConta;

    // Associacao dos mapas de carga
    function ValidarArquivoMapa(aContaId:Integer;aFile,aTabela: string): Boolean;
    function ValidarAssociacao:Boolean;
    function lodMapInformation(Contaid: Integer): TMapasCarga;



    procedure SetStatusLog(contaId: Integer; DataInicial: TDateTime);

    procedure SetLastIteration;


    procedure SalvarControle;

    procedure SelectAllRecordsConta;
    procedure ExportarDescargas(ContaId: Integer; DataProcIni, DataProcFim : TDateTime;PersistirLog: Boolean = True);
    function GetDescargas(ContaId: Integer; DataInicio, DataTermino: TDateTime; FlgAtualizaUltDataLeitura: Boolean = False; PersistirLog: Boolean = True): string;
    procedure PersistirLogViagem(Viagem: TViagem);

    procedure ExportarColetas(Layout: string; DataProcIni, DataProcFim : TDateTime);

    procedure AtualizarDatLeituraParam(ContaId: Integer; Data: TDateTime;Sync: string);
    procedure AtualizarDataCarga(ContaId: Integer; Data: TDateTime;Sync: string);

    // Gerar Coletas
    function GetColetas(DataInicio, DataTermino: TDateTime; Sync:string; Comunitario: string = '9'; FlgAtualizaUltDataLeitura: Boolean = False; Layout: string = 'Magis'): String;
    procedure PopulaAtoresColeta(DataInicio, DataTermino: TDateTime; Sync:string; Comunitario: string = '9');
    // Coletas
    function OrdenaCrescente(Par01, Par02: Pointer): Integer;
    function coletasToString(cds: TClientDataSet; separator: Char;colNames: Boolean): string;
    function coletasToStringInt(cds, Viagem: TClientDataSet; separator: Char;colNames: Boolean; Registro: Byte): string ; // Integrado com dados da viagem
    // Rastreabilidade SIGA
    function GetDadosSiga(DataInicio, DataTermino: TDateTime; Sync:string; Comunitario: string = '9'; FlgAtualizaUltDataLeitura: Boolean = False): String;

    // Cria ou conecta em banco de dados Sqlite (DB)
    function OpenDb(dbName: string): Boolean;
    function CloseDb(dbName: string): Boolean;
    function ExecDbCommand(dbName, cmdLine: string; Parametros, Valores: TStringList): Boolean;
    function GetDbData(dbName: string; createFile: Boolean = False): Boolean;

    // Desabilita sincronizacao das contas
    procedure desableAllSync(action:string);

    // Retorna a data de pesquisa das viagens no arquivo de contas
    function DateMenos(dias: Integer): Boolean;

    // Apaga a luz ao sair
    procedure Finish;

    procedure LiberaMemoria;

  end;

var
  MlkPrincipalDTM: TMlkPrincipalDTM;
  // Pesquisa Banco de dados
  FSQL: string;
  Fresultado: Variant;

  // Variaveis de operacao

  DadosRetornoColeta: TDadosRetorno;
  DadosRetornoRota, DadosRetornoLinha, DadosRetornoColetor, DadoRetornoVeiculo,
  DadosRetornoProdutor, DadosRetornoFazenda, DadosRetornoVeiculo, DadosRetornoVisita,
  DadosRetornoViagem: TDadosRetorno;

  IdDescarga: Integer;
  arqTexto, ArqRename,arqTmp, ArqSigaColetor, ArqSigaProdutor: string;
  _VerMagis : string;
  _MapasCarga : TMapasCarga;
  _FileMapName: string;

  i, j: Integer;
  _ArqSaida, _ArqCadSiga : TStringList;
  ColecaoDescarga, ColecaoViagem, ColecaoRota, ColecaoLinha, ColecaoColetor, ColecaoVeiculo,
  ColecaoProdutor, ColecaoFazenda, ColecaoColeta, ColecaoVisita : TJSONArray;
  Descarga, Viagem, Rota, Linha, Coleta, Coletor, Veiculo, Produtor, Fazenda, Visita: TJSONObject;
  DifQtdeColeta: Double;
  FlgGerarArq: Boolean;
  FlgGeraCabec: Boolean;
  FlgGeraArqDB: Boolean;
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
  NomePasta: string;


implementation

uses
  uGlobal, uVSSCLRCnExport;


{$R *.dfm}

// Atualiza dados das contas nas sincronizacoes
procedure TMlkPrincipalDTM.AtualizarDataCarga(ContaId: Integer; Data: TDateTime;
  Sync: string);
begin
  qrySQL.SQL.Text := 'update Contas set DatUltCarga = :DatUltCarga, '+
  ' Carga = :Carga Where ContaId = :ContaId';
  qrySQL.Parameters.ParamByName('DatUltCarga').Value :=  Data;
  qrySQL.Parameters.ParamByName('Carga').Value := Sync;
  qrySQL.Parameters.ParamByName('Contaid').Value := ContaId;
  qrySQL.ExecSQL;
end;

procedure TMlkPrincipalDTM.AtualizarDatLeituraParam(ContaId: Integer;Data: TDateTime; Sync: string);
begin
  qrySQL.SQL.Text := 'update Contas set DatIniLeituraDescargaWS = :DatIniLeituraDescargaWS, '+
  'DatUltLeituraDescargaWS = :DatUltLeituraDescargaWS, DatUltSync = :DatUltSync, Sync = :Sync Where ContaId = :ContaId';
  qrySQL.Parameters.ParamByName('DatIniLeituraDescargaWS').Value :=  Data;
  qrySQL.Parameters.ParamByName('DatUltLeituraDescargaWS').Value :=  Data;
  qrySQL.Parameters.ParamByName('DatUltSync').Value := Now();
  qrySQL.Parameters.ParamByName('Sync').Value := Sync;
  qrySQL.Parameters.ParamByName('Contaid').Value := ContaId;
  qrySQL.ExecSQL;

end;
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
  // Validar associacao dos mapas de integracao
  if (not ValidarAssociacao) then
    MostraMsgErro('Falha na associacao dos mapas de integracao, verifique !');
end;
// Desconecta banco de dados Sqlite
function TMlkPrincipalDTM.CloseDb(dbName: string): Boolean;
begin
  if FileExists(dbName) then
  begin
    // Se tiver conectado ,desconecta
    if cnnDbMaster.Connected then
      cnnDbMaster.Disconnect;
    // Testa se desconectou e devolve resultado
    if cnnDbMaster.Connected then
      Result := False
    else
      Result := True;
  end
  else
    Result := True;
end;

function TMlkPrincipalDTM.coletasToString(cds: TClientDataSet; separator: Char;
  colNames: Boolean): string;
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

function TMlkPrincipalDTM.coletasToStringInt(cds, Viagem: TClientDataSet;
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
   else if DadosConta.IdConta = '20170' then
   begin
     CodEmpresa := '1';
     NomeEmpresa :=  'Laticinios Verde Campo';
   end
   else if DadosConta.IdConta = '156007' then
   begin
     CodEmpresa := '1';
     NomeEmpresa :=  'Celles Cordeiro Alimentos';
   end
     else if DadosConta.IdConta = '298668' then
   begin
     CodEmpresa := '1';
     NomeEmpresa :=  'Laticinios Sao Vicente';
   end
   else if DadosConta.IdConta = '308600' then
   begin
     CodEmpresa := '1';
     NomeEmpresa :=  'LSVTM - Filial Ritapolis';
   end
   else if DadosConta.IdConta = '318691' then
   begin
     CodEmpresa := '1';
     NomeEmpresa :=  'LSVTM- Filial Perdoes';
   end
   else if DadosConta.IdConta = '322200' then
   begin
     CodEmpresa := '1';
     NomeEmpresa :=  'LSVTM - Filial Sao Joao Del Rey';
   end
   else if DadosConta.IdConta = '322108' then
   begin
     CodEmpresa := '1';
     NomeEmpresa :=  'Laticinios PJ Ltda';
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
     StringReplace(Viagem.FieldByName('PlacaVeiculo').AsString,'-','',[rfReplaceAll]) + separator +
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

procedure TMlkPrincipalDTM.DataModuleCreate(Sender: TObject);
var
  strConfig, parametros, valores: TStringList;
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
    tmrSync.Interval := (cdsControleIntervalocarga.AsInteger * 60000);
    tmrConsole.Interval := (cdsControleIntervalo.AsInteger * 60000);
    tmrSync.Enabled := False;
    tmrConsole.Enabled := True;
    FStatusTmrSync := TmrInativo;
    FStatusTmrConsole := TmrHabilitado;
    sheConsole.StartAll;

    if Assigned(ShowStatusTmr) then
      ShowStatusTmr;

   // FSQL := 'C:\Users\jusce\Dropbox\MylkSync\SCA\280465\12018\003_18_01_2017_9.7.27.0--2018-01-18_2018-01-18.db';
   // OpenDb(FSQL);
    (*
    // Testar carga dados sca
    cdsLinha.CreateDataSet;
    cdsProdutor.CreateDataSet;
    cdsFazendas.CreateDataSet;
    cdsItinerarios.CreateDataSet;
    cdsTanques.CreateDataSet;
    GetDbData('captacaodbc1.db');
    GetDbData('captacaodbc2.db');
    GetDbData('captacaodbc3.db');
    GetDbData('captacaodbc5.db');
    GetDbData('captacaodbc6.db', True);

    try
      parametros := TStringList.Create;
      valores := TStringList.Create;
      // Testa exportacao dados SCA
      FSQL := '003_18_01_2017_9.7.27.0--2018-01-18_2018-01-18.db';
      if OpenDb(FSQL) then
      begin
        ExecDbCommand(FSQL, TableLancamentos, parametros, valores);
        parametros.Add('codigo');
        parametros.Add('fazenda');
        parametros.Add('materia');
        parametros.Add('linha');
        parametros.Add('data');
        parametros.Add('hora');
        parametros.Add('volume');
        parametros.Add('ntanque');
        parametros.Add('temperatura');

        valores.Add('001');
        valores.Add('1010');
        valores.Add('001');
        valores.Add('0003');
        valores.Add('2018-01-18');
        valores.Add('13:45:00');
        valores.Add('900');
        valores.Add('1');
        valores.Add('3.5');

        ExecDbCommand(FSQL,InsertTableRetornoSCA,parametros,valores);
      end;
    finally
      parametros.Free;
      valores.Free;
    end;
    *)
  except
    ShowMessage('Falha so se conectar ao banco de dados, verifique !');
    Application.Terminate;
  end;

end;
procedure TMlkPrincipalDTM.DataModuleDestroy(Sender: TObject);
begin
  if Assigned(FConexaoBD) then
    FConexaoBD.Destroy;
end;
// Retorna a data de pesquisa inicial das contas no banco para gerar viagens liberadas de datas anteriores
function TMlkPrincipalDTM.DateMenos(dias: Integer): Boolean;
begin
  Result := False;
  try
    qryAux.SQL.Clear;
    qryAux.SQL.Add('update contas set DatIniLeituraDescargaWS = :DtAnt where Ativa = :Ativa');
    qryAux.Parameters.ParamByName('DtAnt').Value := FormatDateTime('yyyy-MM-dd', (Date() - dias));
    qryAux.Parameters.ParamByName('Ativa').Value := FlagSim;
    qryAux.ExecSQL;
    Result := True;
  except on  E:Exception do
    InserirMsgLog('ERRO : ' + E.Message);
  end;
end;

// Desbilitas sincronizacao das contas
procedure TMlkPrincipalDTM.desableAllSync(action:string);
{action = Sim ou Nao: Ativa ou desativa}
begin
   qryAux.SQL.Clear;
   qryAux.SQL.Add('Update contas set Ativa = :ativa');
   qryAux.Parameters.ParamByName('ativa').Value := action;
   qryAux.ExecSQL;
   PesquisarConta(' and 1=1');
end;

// Executa comando sql no banco de dados sqlite(DB)
function TMlkPrincipalDTM.ExecDbCommand(dbName, cmdLine: string;Parametros, Valores: TStringList): Boolean;
var
  i: Integer;
begin

  if FileExists(dbName) then
  begin
    try
     // cnnDbMaster.Connected := False;
     // cnnDbMaster.Database := dbName;
     // cnnMaster.Connected := True;
      qryDbAux.SQL.Clear;
      qryDbAux.SQL.Add(cmdLine);
      qryDbAux.Prepare;
      // Verifica se tem
      if Parametros.Count > 0 then
      begin
        for i := 0 to Parametros.Count -1 do
        begin
          qryDbAux.ParamByName(Parametros[i]).Value := Valores[i];
        end;
      end;
      qryDbAux.ExecSQL;
      Result := True;
    except on E: Exception do
      Result := False;
    end;
  end
  else
    Result := False;
end;
// Exporta dados das descarga - Atesto e gera arquuivo
procedure TMlkPrincipalDTM.ExportarColetas(Layout: string;DataProcIni, DataProcFim : TDateTime);
begin
  InserirMsgLog('Início Get Coletas.');
  try
    GetColetas(DataProcIni, DataProcFim, '0',EmptyStr, True, Layout);
    InserirMsgLog('Término Get Coletas');
  except on E:Exception do
    InserirMsgLog('ERRO : ' + E.Message);
  end;
end;

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
// Libera conecxoes para sair.
procedure TMlkPrincipalDTM.Finish;
begin
  if tmrConsole.Enabled then
  begin
    tmrConsole.Enabled := False;
    tmrConsole.FreeOnRelease;
  end;
  if tmrSync.Enabled then
  begin
    tmrSync.Enabled := False;
    tmrSync.FreeOnRelease;
  end;
  sheConsole.StopAll;
  cnnMaster.Connected := False;
  cnnDbMaster.Connected := False;
  // Libera memoria
  LiberaMemoria;
end;

// Gera arquivos de descarga
function TMlkPrincipalDTM.GetColetas(DataInicio, DataTermino: TDateTime; Sync,
  Comunitario: string; FlgAtualizaUltDataLeitura: Boolean;
  Layout: string): String;
var
  i: Integer;
  DataTerminoAux: TDateTime;
  count, regPos : Integer;
  FolderSaida : string;
  FCargaRural : TCargaRural;
  FProdutorCarga : TProdutorCarga;
  FArqLog, FArqlogMaster : TStringList;
  FArqSaveLog: string;
  FolderLogMaster, NomeArqLogMaster : string;
  _RegistroMovimento : TMovimentoRM;
  _ItemRegistro : TItensMovimentoRM;
  _DocProdutor, _LinhaDados, _Separador, _Sincronizou : string;
  CplNome : string;  // Complemento do nome do arquivo de saida (Gerado com Random)


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

  function ViagemJahProcessada(IdViagem: Integer; Layout: string ): Boolean;
  begin
    qrySQL.Close;
    if Layout = 'Magis' then
    begin
      qrySQL.SQL.Text := 'SELECT 1 FROM LogViagem WHERE LovViagemId = :Id and LovGerMagis = :LovGerMagis';
      qrySQL.Parameters.ParamByName('Id').Value := IdViagem;
      qrySQL.Parameters.ParamByName('LovGerMagis').Value := FlagSim;
    end
    else if Layout = 'Datasul' then
    begin
      qrySQL.SQL.Text := 'SELECT 1 FROM LogViagem WHERE LovViagemId = :Id and LovGerDatasul = :LovGerDatasul';
      qrySQL.Parameters.ParamByName('Id').Value := IdViagem;
      qrySQL.Parameters.ParamByName('LovGerDatasul').Value := FlagSim;
    end
    else if Layout = 'RM' then
    begin
      qrySQL.SQL.Text := 'SELECT 1 FROM LogViagem WHERE LovViagemId = :Id and LovGerRM = :LovGerRM';
      qrySQL.Parameters.ParamByName('Id').Value := IdViagem;
      qrySQL.Parameters.ParamByName('LovGerRM').Value := FlagSim;
    end
    else if Layout = 'SCL' then
    begin
      qrySQL.SQL.Text := 'SELECT 1 FROM LogViagem WHERE LovViagemId = :Id and LovGerScl = :LovGerScl';
      qrySQL.Parameters.ParamByName('Id').Value := IdViagem;
      qrySQL.Parameters.ParamByName('LovGerScl').Value := FlagSim;
    end;

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
  procedure clearTables;
  begin

    if cdsColetas.Active then cdsColetas.EmptyDataSet;
    if cdsViagens.Active then cdsViagens.EmptyDataSet;
    if cdsRota.Active then cdsRota.EmptyDataSet;
    if cdsLinha.Active then cdsLinha.EmptyDataSet;
    if cdsColetor.Active then cdsColetor.EmptyDataSet;
    if cdsProdutor.Active then cdsProdutor.EmptyDataSet;
    if cdsFazendas.Active then cdsFazendas.EmptyDataSet;
    if cdsVeiculos.Active then cdsVeiculos.EmptyDataSet;
  end;
begin
  try
    // Lista de teste
    FListaAux := TStringList.Create;

    // Diretorio de log principal
    FolderLogMaster := ExtractFilePath(Application.ExeName) + '\Log\';
    // Nome do arquivo de log Master
    FArqlogMaster := TStringList.Create;
    NomeArqLogMaster := FolderLogMaster + 'Mys_' + FormatDateTime('dd-MM-yyyy_hh.mm.ss', Now) + '.txt';
    // Cria a estrutura de registro de ocorrências - Log de operação
    FArqLog := TStringList.Create;
    // Inicia o log de atividades
    FArqLog.Append('Milk´s Rota :: Log Geração de Arquivos - ' + FormatDateTime('dd/MM/yyyy hh:mm:ss', Now));
    FArqLog.Append('Conta: ' + DadosConta.IdConta );
    FArqLog.Append('Período : ' +  FormatDateTime('dd/MM/yyyy', DataInicio) +  ' Até ' + FormatDateTime('dd/MM/yyyy', DataTermino)  );
    FArqLog.Append('Layout Solicitado: ' + Layout);
    FArqLog.Append('*******************************************');

    // Versao da saída do arquivo Magistech
    _VerMagis :=  DadosConta.VerMagis;

    // Polula datasets
    clearTables; // Limpa estrutura dos datasets

    // Trata Coletas Hj
    if (DadosConta.ColetasHoje = FlagNao) then
    begin
      DataTerminoAux := DataTermino - 1;

      if (DataTerminoAux > DataInicio) then
        DataInicio := DataTermino;
    end
    else
      DataTerminoAux := DataTermino;


    // Popula colecoes de cadastro
    try
       PopulaAtoresColeta(DataInicio,DataTerminoAux, Sync, Comunitario);
    except
      on E: Exception do
      begin
        FArqlogMaster.Append('Conta: ' + DadosConta.IdConta);
        FArqlogMaster.Append('Hora registro : ' + FormatDateTime('dd-MM-yyyy hh:mm:ss', Now));
        FArqlogMaster.Append('<<<<< FALHA AO CARREGAR TABELAS >>>>' );
        FArqlogMaster.Append(E.Message);
        FArqlogMaster.Append('*******************************************');
        if not DirectoryExists(FolderLogMaster) then
        begin
          ForceDirectories(FolderLogMaster);
          FArqlogMaster.SaveToFile(NomeArqLogMaster);
        end
        else
        begin
          FArqlogMaster.SaveToFile(NomeArqLogMaster);
        end;
      end;
    end;
    _Sincronizou := FlagNao;
    // Arquivo com dados coleta formatado
    _ArqSaida := TStringList.Create;

    // Pasta para gravação dos arquivos
    if Layout = 'Datasul' then
    begin
      FolderSaida := DadosConta.PathArqDatasul + '\Datasul\' + DadosConta.IdConta;
    end
    else if Layout = 'Magis' then
    begin
      FolderSaida := DadosConta.PathArqMagis + '\MagisErp\' + DadosConta.IdConta;
    end
    else if Layout = 'RM' then
    begin
      FolderSaida := DadosConta.PathArqRm + '\TotvsRM\' + DadosConta.IdConta;
    end
    else if Layout = 'SCL' then
    begin
      _Separador := '|';
      if DadosConta.VerScl = 'A' then
      begin
        FolderSaida := DadosConta.PathArqScl + '\SCA\' + DadosConta.IdConta;
        FlgGeraArqDB := True;
      end
      else
        FolderSaida := DadosConta.PathArqScl + '\SCL\' + DadosConta.IdConta;
    end ;

    // ordena as viagem por id
    cdsViagens.IndexFieldNames := 'id';

    // Ordena as coletas por viagem
    cdsColetas.IndexFieldNames := 'viagem_id';

    // Insere no log os ids detectados das viagens
    FArqLog.Append('|<><> --- Viagens Localizadas  no perídodo <><> ---|');

    cdsViagens.First;
    while not cdsViagens.Eof do
    begin
      FArqLog.Append('|<><>| Viagem ' + IntToStr(cdsViagensid.Value) + ' |<><>| ');
      cdsViagens.Next;
    end;
    // Fim Lista de viagens detectadas
    FArqLog.Append('*******************************************');

    // Processa viagens
    cdsViagens.First;
    i := 0;
    try
      for i := 0 to (cdsViagens.RecordCount -1) do
      begin
        if (Layout <> 'RM') then
           _ArqSaida.Clear
        else if (DadosConta.VerRm <> 'U') then
          _ArqSaida.Clear;

        // Verifica se a viagem já foi processada
        if ViagemJahProcessada(cdsViagensid.Value, Layout) then
        begin
          FArqLog.Append('Viagem já processada: ' + IntToStr(cdsViagensid.Value));
          cdsViagens.Next;
          Continue;
        end;
        // Verifica se viagem tem distribuição de tanque comunitario pendente e não gera o arquivo
        if (cdsViagenscomunitario_pendente.Value = 'true') then
        begin
          FArqLog.Append('(*)VIAGEM COM TANQUE COMUNITARIO PENDENTE:  ' + IntToStr(cdsViagensid.Value));
          cdsViagens.Next;
          Continue;
        end;
        if (cdsViagenscoletor.Value = EmptyStr) or (VarIsNull(cdsViagenscoletor.AsVariant)) then
        begin
          FArqLog.Append('(*)VIAGEM COM CÓDIGO DO MOTORISTA INVÁLIDO PARA O ERP:  ' + IntToStr(cdsViagensid.Value));
          cdsViagens.Next;
          Continue;
        end;

        try
          // Layout de saida:
          if Layout = 'Datasul' then
          begin
            FCargaRural :=  TCargaRural.Create;
            FProdutorCarga := TProdutorCarga.Create;
          end;
          if Layout = 'RM' then
          begin
            _RegistroMovimento := TMovimentoRM.Create;
            _ItemRegistro := TItensMovimentoRM.Create;
          end;

          // Cria objeto viagem para persistencia no log
          ObjViagem := ViagemJahRegistrada(cdsViagensid.Value);
          ObjViagem.Id := cdsViagensid.Value;
          ObjViagem.ContaId := StrToInt(DadosConta.IdConta);
          ObjViagem.RotaId := cdsViagensrota_id.Value;
          ObjViagem.RotaCodigo := cdsViagensrota.Value;
          ObjViagem.DatAbertura := cdsViagensdt_abertura.Value;
          if not ValidarData(ObjViagem.DatAbertura) then
          begin
            ObjViagem.DatAbertura := Now;
          end;
          if Layout = 'Magis' then
            ObjViagem.GerouMagis := FlagSim;
          if Layout = 'Datasul' then
            ObjViagem.GerouDatasul := FlagSim;
          if Layout = 'RM' then
            ObjViagem.GerouRm := FlagSim;
          if Layout = 'SCL' then
            ObjViagem.GerouScl := FlagSim;

          // Completa dados da viagem
          regPos := cdsViagens.RecNo;
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
            qryAux.Parameters.ParamByName('LovColetor').Value := ObjViagem.Coletor;
            qryAux.Parameters.ParamByName('LovVeiculo').Value := ObjViagem.Veiculo;
            qryAux.Parameters.ParamByName('P1').Value := FormatDateTime('yyyy-MM-dd 00:00:00',ObjViagem.DatAbertura);
            qryAux.Parameters.ParamByName('P2').Value := FormatDateTime('yyyy-MM-dd 23:59:59',ObjViagem.DatAbertura);
            qryAux.Open;
            // qryAux.ParamByName('P1').Value := FormatDateTime('yyyy-MM-dd 00:00:00',GetData(DateToStr(ObjViagem.DatAbertura)));
            FResultado := (qryAux.FieldByName('Total').Value + 1);
            ObjViagem.Index := FResultado;
          end
          else if (ObjViagem.Index = 0) then // Viagem registrada sem indice - Seta Indice (Número sequencial das viagens na data)
          begin
            qryAux.SQL.Clear;
            qryAux.SQL.Add('Select LovViagemId, Ifnull(LovIndex,0) from LogViagem where LovColetor = :LovColetor and LovVeiculo = :LovVeiculo and LovDataViagem BETWEEN :P1 AND :P2 ORDER BY LovDataViagem ');
            qryAux.Parameters.ParamByName('LovColetor').Value := ObjViagem.Coletor;
            qryAux.Parameters.ParamByName('LovVeiculo').Value := ObjViagem.Veiculo;
            qryAux.Parameters.ParamByName('P1').Value := FormatDateTime('yyyy-MM-dd 00:00:00',ObjViagem.DatAbertura);
            qryAux.Parameters.ParamByName('P2').Value := FormatDateTime('yyyy-MM-dd 23:59:59',ObjViagem.DatAbertura);
            qryAux.Open;
            qryAux.First;
            // Atualiza todos os indices das viagens na data da viagem processa se o indece nao tiver sido setado
            while not qryAux.Eof do
            begin
               qryApoio.SQL.Clear;
               qryApoio.SQL.Add('update LogViagem Set LovIndex = :p1 where LovViagemId = :p2 and Ifnull(LovIndex,0) = 0');
               qryApoio.Parameters.ParamByName('p1').Value := qryAux.RecNo;
               qryApoio.Parameters.ParamByName('p2').Value  := qryAux.FieldByName('LovViagemId').Value;
               qryApoio.ExecSQL;
               qryAux.Next;
            end;
            // Busca o indice da viagem que esta sendo processada
            qryApoio.SQL.Clear;
            qryApoio.SQL.Add('Select LovIndex from LogViagem where LovViagemId = :p1');
            qryApoio.Parameters.ParamByName('p1').Value := ObjViagem.Id;
            qryApoio.Open;

            ObjViagem.Index := qryApoio.FieldByName('LovIndex').Value;
          end;
          cdsViagensNumeroViagem.Value := ObjViagem.Index;

          // Verifica se o codigo do coletor está configurado corretamente com (/) na composição
          if Layout = 'Datasul' then
          begin
            if (Pos('/',cdsViagenscoletor.AsString)) <= 0 then
            begin
              cdsViagenscoletor.Value := cdsViagenscoletor.Value + '/01';
            end;
            if cdsViagenscoletor.Value = 'null' then
            begin
              cdsViagenscoletor.Value := '001/01';
            end;
          end;

          cdsViagens.Post;

          // Retorna a posição que o cds viagem estava
          cdsViagens.RecNo := regPos;

          if Layout = 'Magis' then
          begin
            // Gera dados da viagem no arquivo de saída
            if _VerMagis = '2' then
            begin
              _ArqSaida.Add(coletasToStringInt(cdsColetas, cdsViagens,';',True,0)); // Registro 0 = cabeçalho de viagem
              // Dados da viagem
              _ArqSaida.Add(coletasToStringInt(cdsColetas,cdsViagens,';',False,1)); // Registro 1 = dados da viagem atual
            end;
          end;
          if Layout = 'Datasul' then
          begin
            // popula dados da viagem
            FCargaRural.setValoresDefaul;
            FCargaRural.Carga := IntToStr(cdsViagensid.Value);
            FCargaRural.Estabelecimento := cdsViagensrota.AsString;
            FCargaRural.Rota := cdsViagenslinha.Value;
            FCargaRural.NomeMotorista := cdsViagensNomeColetor.Value;
            FCargaRural.CodigoTransportador := StrToInt(Copy(cdsViagenscoletor.AsString,0,(Pos('/',cdsViagenscoletor.AsString)-1)) ); // cdsViagenscoletor.AsInteger;
            FCargaRural.CodigoVeiculo := cdsViagensveiculo.Value;
            FCargaRural.Placa := cdsViagensPlacaVeiculo.Value;
            FCargaRural.UfPlaca := 'MG';
            FCargaRural.QtdeCompartimentos :=  cdsViagenstanques.AsInteger; // cdsViagensbocas.AsInteger;
            FCargaRural.HodometroInicial := cdsViagenskm_inicial.Value;
            FCargaRural.HodometroFinal := cdsViagenskm_final.Value;
            FCargaRural.DataTransacao := FormatDateTime('dd/MM/yyyy',cdsViagensdt_abertura.Value);

            // Gera cabeçalho no arquivo de saída
            _ArqSaida.Add(FCargaRural.toString);
          end;
          // Gera nome do arquivo para o sistema SCA
          if ( (Layout = 'SCL') and (DadosConta.VerScl = 'A') ) then
          begin
            if FlgGeraArqDB then
            begin
               // Monta nome estutura de pasta do arquivo saida
               if not DirectoryExists(FolderSaida ) then  // DadosConta.PathArqMagis +'\MagisErp\'+ DadosConta.IdConta
               begin
                 NomePasta := FolderSaida + '\'+ IntToStr(MonthOfTheYear(Date())) + IntToStr(YearOf(Date()));
                 ForceDirectories(NomePasta);
               end
               else
               begin
                 if not  DirectoryExists(  FolderSaida + '\'+ IntToStr(MonthOfTheYear(Date())) +
                         IntToStr(YearOf(Date()))  ) then
                 begin
                   NomePasta := FolderSaida +'\'+  IntToStr(MonthOfTheYear(Date())) +
                         IntToStr(YearOf(Date()));
                   ForceDirectories(NomePasta);
                 end;
               end;

                // Nome do arquivo de saida no diretorio
               arqTexto := FolderSaida + '\' + IntToStr(MonthOfTheYear(Date())) +
                         IntToStr(YearOf(Date()))+ '\';

               // Nome do arquivo para backup de o arquivo existir
               ArqRename := arqTexto;

               // Somente nome do arquivo de saida que sera gravado temporariamente em outro diretorio, repois renomeado para o local padrao
               arqTmp :=  cdsViagenslinha.Value + '_' +
                            cdsViagenscoletor.Value + '_' +
                            FormatDateTime('dd_MM_yyyy_hh.mm.ss',Now) + '--'+
                            FormatDateTime('yyyy_MM_dd',cdsViagensdt_abertura.Value) + '-'+
                            FormatDateTime('yyyy_MM_dd',cdsViagensdt_fechamento.Value) + '.db';

               arqTexto := arqTexto + arqTmp;

               // Backup
               ArqRename := ArqRename + 'R_'+ arqTmp;

               // renomeia arquivo existente
                if FileExists(arqTmp) then
                begin
                  DeleteFile(Pchar(arqTmp));
                end;

                //cria o arquivo de saida para o sistema SCA
               if OpenDb(arqTmp) then
               begin
                 // Cria estrutura de paramentros de insercao dos registros
                 createParametros;
                 // Cria a tabela de dados no arquivo novo
                 ExecDbCommand(arqTmp,CreateTableRetornoSCA,TParametros, Tvalores);
                 // destroy os stringlists de parametros
                 destroiParametros;
               end;
               FlgGeraArqDB := False;
            end;
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
                 _DocProdutor := cdsProdutordoc.Value;
              end;
              // se o código da fazenda estiver vazio, tenta pegar pelo codigo do produtor
              if ((cdsColetasCodigoFazenda.AsString = EmptyStr) or (cdsColetasCodigoFazenda.AsString = 'null'))  then
              begin
                if (cdsColetasCodigoProdutor.Value <> EmptyStr) then
                begin
                  if cdsFazendas.Locate('produtor',cdsColetasCodigoProdutor.Value,[loPartialKey]) then
                  begin
                    cdsColetasCodigoFazenda.Value := cdsFazendascodigo.Value;
                    cdsColetasFazenda.Value := cdsFazendasnome.Value;
                  end;
                end;
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
              if Layout = 'Magis' then
              begin
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
              end;

              if Layout = 'Datasul' then
              begin

                FProdutorCarga.setValoresDefault;
                FProdutorCarga.Carga := IntToStr(cdsViagensid.Value);
                FProdutorCarga.Produtor := cdsColetasCodigoProdutor.AsString;
                FProdutorCarga.PontoColeta := Copy(cdsColetastanque.AsString,0,(Pos('/',cdsColetastanque.AsString)-1));
                if (cdsColetasBoca.AsString <> EmptyStr) then
                  FProdutorCarga.Compartimento :=  StrToInt(Copy(cdsColetasBoca.AsString,1,1))
                else
                  FProdutorCarga.Compartimento := 1;

                if (cdsColetasquantidade.AsFloat > 0) then
                  FProdutorCarga.QtdeColetada := cdsColetasquantidade.AsFloat
                else
                  FProdutorCarga.QtdeColetada := 0;

                FProdutorCarga.Temperatura := cdsColetastemperatura.Value;
                FProdutorCarga.Amostra := cdsColetasamostra.Value;
                FProdutorCarga.Regua := cdsColetasregua.Value;
                FProdutorCarga.Lacre := cdsColetascontraprova.AsString;
                FProdutorCarga.Propriedade := EmptyStr; //cdsColetasCodigoFazenda.AsString;
                FProdutorCarga.Repostiorio := StrToInt(Copy(cdsColetastanque.AsString,(Pos('/',cdsColetastanque.AsString)+1),1)); //1;
                FProdutorCarga.DataColeta := FormatDateTime('dd/MM/yyyy',cdsColetasdt_coleta.Value);
                FProdutorCarga.HoraColeta := FormatDateTime('hhmmss', cdsColetasdt_coleta.Value);

                // Gera registro de coleta no arquivo
                _ArqSaida.Add(FProdutorCarga.toString)

              end;
              if Layout = 'RM' then
              begin
                if cdsColetasquantidade.Value > 0 then
                begin
                  _RegistroMovimento.setValoresDefault;
                  _ItemRegistro.setValoresDefault;

                  // popula linha de movimento
                  _RegistroMovimento.codClienteFornecedor := cdsColetasCodigoProdutor.Value + PreencheEspacoDireita('',(25 - Length(cdsColetasCodigoProdutor.Value)));
                  _RegistroMovimento.numeroMovimento := RetZero(cdsColetasid.AsString,6)  + PreencheEspacoDireita('',(35 - Length(RetZero(cdsColetasid.AsString,6))));
                  _RegistroMovimento.dataEmissao := FormatDateTime('dd/MM/yyyy',cdsColetasdt_coleta.Value);
                  _RegistroMovimento.dataSaida := FormatDateTime('dd/MM/yyyy',cdsColetasdt_coleta.Value);
                  _RegistroMovimento.horaEmissaoMovimento := FormatDateTime('dd/MM/yyyy',cdsColetasdt_coleta.Value) + PreencheEspacoDireita('',10);
                  _RegistroMovimento.datalancamento := FormatDateTime('dd/MM/yyyy',cdsColetasdt_coleta.Value);
                  _RegistroMovimento.dataMovimento := FormatDateTime('dd/MM/yyyy',cdsColetasdt_coleta.Value);
                  _RegistroMovimento.quantidade := cdsColetasquantidade.Value;
                  _RegistroMovimento.codUsuario := 'LUCIANO.FREITAS' + PreencheEspacoDireita('',05);

                  // Pega documento do produtor
                  _RegistroMovimento.campoCnpj := _DocProdutor + PreencheEspacoDireita('',(20 - Length(_DocProdutor)));

                  // Popula linha de Item de movimento
                  _ItemRegistro.quantidade := cdsColetasquantidade.Value;
                  _ItemRegistro.quantidadeReceber := cdsColetasquantidade.Value;
                  _ItemRegistro.precoUnitario :=  1;
                  _ItemRegistro.precoTabela := 1;
                  _ItemRegistro.dataEmissao := FormatDateTime('dd/MM/yyyy',cdsColetasdt_coleta.Value);
                  _ItemRegistro.codUnidade := 'L' + PreencheEspacoDireita('',4);
                  _ItemRegistro.valorTotalItem := cdsColetasquantidade.Value;
                  _ItemRegistro.valorLiquidoItem := cdsColetasquantidade.Value;
                  _ItemRegistro.codigoProduto := '4.0000132' + PreencheEspacoDireita('',21);


                  // Adiciona registros ao arquivo
                  _ArqSaida.Add(_RegistroMovimento.toString);
                  _ArqSaida.Add(_ItemRegistro.toString);

                end;
              end;
              if Layout = 'SCL' then
              begin
                // Arquivo para integracao sistema Sistem2
                if DadosConta.VerScl = '2' then
                begin
                  _LinhaDados :=
                  cdsColetasdt_coleta.AsString + _Separador +
                  RetZero(cdsColetasCodigoLinha.AsString,4) + _Separador +
                  RetZero(cdsColetasCodigoRota.AsString,4)+ _Separador +
                  RetZero(cdsColetasCodigoMotorista.AsString,5) + _Separador +
                  RetZero(cdsColetasCodigoProdutor.AsString,15) + _Separador +
                  Retzero(cdsColetasquantidade.AsString, 5) + _Separador +
                  Retzero(FloatToStr(cdsColetastemperatura.AsFloat * 100),5) + _Separador +
                  RetZero(cdsColetastanque.AsString,18) + _Separador +
                  Retzero(cdsColetasAmostra.Value, 11) + _Separador +
                  Retzero(IntToStr(0), 11) + _Separador +
                  Retzero(FloatToStr(cdsColetasregua.AsFloat * 100),7) + _Separador  ;

                  _ArqSaida.Add(_LinhaDados);
                end;
                // Arquivo para integracao sistema SCA
                if DadosConta.VerScl = 'A' then
                begin
                  try
                    createParametros;
                    populaParametros;
                    TValores.Clear;
                    Tvalores.Add(cdsColetasCodigoProdutor.Value);
                    Tvalores.Add(cdsColetasCodigoFazenda.Value);
                    Tvalores.Add('001');  // Codigo da materia
                    Tvalores.Add(cdsColetasCodigoLinha.Value);
                    Tvalores.Add(FormatDateTime('yyyy-MM-dd',cdsColetasdt_coleta.Value));
                    Tvalores.Add(FormatDateTime('hh:mm:ss',cdsColetasdt_coleta.Value));
                    Tvalores.Add(cdsColetasquantidade.AsString);
                    Tvalores.Add(cdsColetastanque.Value);
                    Tvalores.Add(TrocaVirgPPto(cdsColetastemperatura.AsString));

                    ExecDbCommand(arqTmp,InsertTableRetornoSCA,Tparametros, Tvalores);
                    finally
                    destroiParametros;
                  end;
                end;
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

           // Arquivos para integra'cao sistema SCA
           if (Layout = 'SCL') and (DadosConta.VerScl = 'A') then
           begin
             if FileExists(arqTmp) then
             begin
                // renomeia arquivo existente
                if FileExists(arqTexto) then
                begin
                  if FileExists(ArqRename) then
                    DeleteFile(PChar(ArqRename));
                  RenameFile(arqTexto, ArqRename);
                end;

                // Move o arquivo temporario para a pasta da conta
                 CopyFile(PChar(arqTmp),PChar(arqTexto),false);
                 if CloseDb(arqTmp) then
                    DeleteFile(Pchar(arqTmp));

                 FlgGeraArqDB := True;
             end;
           end;

           if (_ArqSaida.Count > 0) then
           begin
             // Monta nome arquivo saida
             if not DirectoryExists(FolderSaida ) then  // DadosConta.PathArqMagis +'\MagisErp\'+ DadosConta.IdConta
             begin
               NomePasta := FolderSaida + '\'+ IntToStr(MonthOfTheYear(Date())) + IntToStr(YearOf(Date()));
               ForceDirectories(NomePasta);
             end
             else
             begin
               if not  DirectoryExists(  FolderSaida + '\'+ IntToStr(MonthOfTheYear(Date())) +
                       IntToStr(YearOf(Date()))  ) then
               begin
                 NomePasta := FolderSaida +'\'+  IntToStr(MonthOfTheYear(Date())) +
                       IntToStr(YearOf(Date()));
                 ForceDirectories(NomePasta);
               end;
             end;
             // Nome do arquivo de saida no diretorio
             arqTexto := FolderSaida + '\' + IntToStr(MonthOfTheYear(Date())) +
                       IntToStr(YearOf(Date()))+ '\';
             // Nome do arquivo para backup de o arquivo existir
             ArqRename := arqTexto;

             if ((Layout = 'RM') or (Layout = 'SCL')) then
             begin
               if Layout = 'RM' then
               begin
                 if DadosConta.VerRm = 'M' then  // Gera Multiplos arquivos, 1 por viagem
                 begin
                   arqTexto := arqTexto + IntToStr(cdsViagensid.Value)+ '_' + cdsViagenslinha.Value + '_'+
                             FormatDateTime('ddMMyyyy',cdsViagensdt_abertura.Value)+ '.txt';
                    // Renomear
                   ArqRename := ArqRename + IntToStr(cdsViagensid.Value)+ '_' + cdsViagenslinha.Value + '_'+
                             FormatDateTime('ddMMyyyy',cdsViagensdt_abertura.Value)+ '.tx_';
                 end
                 else if DadosConta.VerRm = 'U' then // Gera um único arquivo com todas as viagens
                 begin
                   arqTexto := arqTexto + 'RM'+ FormatDateTime('ddMMyyyy', DataInicio)+'.txt';

                    ArqRename := ArqRename + 'RM'+ FormatDateTime('ddMMyyyy', DataInicio)+'.tx_';
                 end;
               end;
               if ( (Layout = 'SCL') and (DadosConta.VerScl = '2') ) then
               begin
                 arqTexto := arqTexto + IntToStr(cdsViagensid.Value)+ '_' + cdsViagenslinha.Value + '_'+
                           FormatDateTime('ddMMyyyy',cdsViagensdt_abertura.Value)+ '.txt';
                  // Renomear
                 ArqRename := ArqRename + IntToStr(cdsViagensid.Value)+ '_' + cdsViagenslinha.Value + '_'+
                           FormatDateTime('ddMMyyyy',cdsViagensdt_abertura.Value)+ '.tx_';

                 if DadosConta.VerScl = '2' then  // S2
                 begin
                   CplNome := FormatDateTime('dd',Now) + RetZero(IntToStr(cdsViagensid.Value),6) ;
                    //arqTexto :=  's:\leite\mobile\'+  CplNome + '.txt';
                    arqTexto := FolderSaida + '\' +  CplNome + '.txt' ;
                    // Renomear
                   //ArqRename :=  's:\leite\mobile\'+  CplNome +'.tx_';
                   ArqRename := FolderSaida +  CplNome + '.txt';
                 end;
               end

             end
             else
             begin
               arqTexto := arqTexto + IntToStr(cdsViagensid.Value)+ '_' + cdsViagenslinha.Value + '_'+
                         FormatDateTime('ddMMyyyy',cdsViagensdt_abertura.Value)+ '.csv';
                // Renomear
               ArqRename := ArqRename + IntToStr(cdsViagensid.Value)+ '_' + cdsViagenslinha.Value + '_'+
                         FormatDateTime('ddMMyyyy',cdsViagensdt_abertura.Value)+ '.cs_';
             end;

              // renomeia arquivo existente
              if FileExists(arqTexto) then
              begin
                if FileExists(ArqRename) then
                  DeleteFile(PChar(ArqRename));
                RenameFile(arqTexto, ArqRename);
              end;

             // Salva Arquivo de saida
             if ((Layout <> 'RM') OR (DadosConta.VerRm <> 'U')) then
             begin
                _ArqSaida.SaveToFile(arqTexto);
             end;

             // Registra a geração do arquivo no log de atividades
             FArqLog.Append('Arquivo de saida gerado:  |<><>| Viagem ' + IntToStr(cdsViagensid.Value) + ' |<><>| ' + arqTexto + ' |<><>| data: ' + FormatDateTime('dd/MM/yyyy hh:mm:ss', Now) );


           end;
           if Layout = 'Datasul' then
           begin
             FCargaRural.Destroy;
             FProdutorCarga.Destroy;
           end;
           if Layout = 'RM' then
           begin
             _RegistroMovimento.Destroy;
             _ItemRegistro.Destroy;
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

      // Salva Arquivo de saida Único do RM
      if (Layout = 'RM') and (DadosConta.VerRm = 'U') and (_ArqSaida.Count > 0) then
      begin
        _ArqSaida.SaveToFile(arqTexto);
      end;

      // Avaliou todos os registros, considera sincronizada
      _Sincronizou := FlagSim;

      //Atualizar Parâmetros
      if FlgAtualizaUltDataLeitura then
      AtualizarDatLeituraParam(StrToInt(DadosConta.IdConta), Date(),_Sincronizou );

      // Fecha e salva registro de log
      FArqLog.Append('Milk´s Rota :: Fim Geração Arquivos - ' + FormatDateTime('dd/MM/yyyy hh:mm:ss', Now));
      FArqLog.Append('*******************************************');


      if DirectoryExists(FolderSaida + '\Logs') then
      begin
        FArqSaveLog := FolderSaida + '\Logs' + '\'+ 'Log_' + DadosConta.IdConta +'_' + FormatDateTime('dd_MM_yyyy_hh_mm_ss',Now) + '.txt';
        FArqLog.SaveToFile(FArqSaveLog);
      end
      else
      begin
        ForceDirectories(FolderSaida+ '\Logs');
        FArqSaveLog := FolderSaida +  '\Logs' +  '\'+ 'Log_' + DadosConta.IdConta +'_' + FormatDateTime('dd_MM_yyyy_hh_mm_ss',Now) + '.txt';
        FArqLog.SaveToFile(FArqSaveLog);
      end;

    finally
      clearTables;  // Empty dataset nas tabelas
      _ArqSaida.Free;
     // FArqLog.Destroy;
    end;

  except
    on E: Exception do
    begin
        FArqlogMaster.Append('Conta: ' + DadosConta.IdConta);
        FArqlogMaster.Append('Hora registro : ' + FormatDateTime('dd-MM-yyyy hh:mm:ss', Now));
        FArqlogMaster.Append('<<<<< FALHA AO GERAR ARQUIVOS >>>>' );
        FArqlogMaster.Append(E.Message);
        FArqlogMaster.Append(E.ClassName);
        FArqlogMaster.Append(E.UnitName);
        FArqlogMaster.Append('___________________________________________');
        FArqlogMaster.Append('OBJETO DE VIAGEM SENDO PROCESSADO NO MOMENTO');
        FArqlogMaster.Append('ID: ' +  IntToStr(objViagem.Id));
        FArqlogMaster.Append('Abertura: ' +  FormatDateTime('dd/MM/yyyy hh:mm:ss',objViagem.DatAbertura));
        FArqlogMaster.Append('Ult. coleta: ' + FormatDateTime('dd/MM/yyyy hh:mm:ss',objViagem.DatUltColeta));
        FArqlogMaster.Append('Fechamento: ' +  FormatDateTime('dd/MM/yyyy hh:mm:ss',objViagem.DatFechamento));
        FArqlogMaster.Append('Ultima Posicao:  ' + Fresultado);
        FArqlogMaster.Append('___________________________________________');

        FArqlogMaster.Append('*******************************************');
        FArqlogMaster.Append('REGSITRO DAS OPERACOES REALIADAS ATE O ERRO');
        FArqlogMaster.Append('*******************************************');
        FArqlogMaster.Append(FArqLog.Text);

        if not DirectoryExists(FolderLogMaster) then
        begin
          ForceDirectories(FolderLogMaster);
          FArqlogMaster.SaveToFile(NomeArqLogMaster);
        end
        else
        begin
          FArqlogMaster.SaveToFile(NomeArqLogMaster);
        end;
        Result := 'Erro: ' + E.message;
     end;
  end;
  FListaAux.SaveToFile('RegViagem.txt');
  FListaAux.Destroy;
  FArqLog.Destroy;
  FArqlogMaster.Destroy;

end;

function TMlkPrincipalDTM.GetDadosSiga(DataInicio, DataTermino: TDateTime; Sync,
  Comunitario: string; FlgAtualizaUltDataLeitura: Boolean): String;
  var
    objColetaSiga: TSigaColetaIndividual;
    objViagemSiga: TSigaViagem;

  function ViagemJahProcessada(IdViagem: Integer): Boolean;
  begin
    qrySQL.Close;
    qrySQL.SQL.Text := 'SELECT 1 FROM LogViagem WHERE LovViagemId = :Id and LovGerSiga = :LovGerSiga';
    qrySQL.Parameters.ParamByName('Id').Value := IdViagem;
    qrySQL.Parameters.ParamByName('LovGerSiga').Value := FlagSim;
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
          qryAux.Parameters.ParamByName('LovColetor').Value := ObjViagem.Coletor;
          qryAux.Parameters.ParamByName('LovVeiculo').Value := ObjViagem.Veiculo;
          qryAux.Parameters.ParamByName('LovDataViagem').Value := GetData(DateToStr(ObjViagem.DatAbertura));
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
               NomePasta := DadosConta.PathArqSiga + '\Siga\' + DadosConta.IdConta;
               ForceDirectories(NomePasta);
               NomePasta :=DadosConta.PathArqSiga + '\Siga\'+ DadosConta.IdConta +'\' +
                       IntToStr(MonthOfTheYear(Date())) +
                       IntToStr(YearOf(Date()));

               ForceDirectories(NomePasta);

               // Diretorio de Cadastros basicos Siga
               NomePasta := DadosConta.PathArqSiga + '\Siga\'+ DadosConta.IdConta +'\Cadastros';

               ForceDirectories(NomePasta);

             end
             else
             begin
               if not  DirectoryExists(  DadosConta.PathArqSiga + '\Siga\'+ DadosConta.IdConta + '\' +
                       IntToStr(MonthOfTheYear(Date())) +
                       IntToStr(YearOf(Date()))  ) then
               begin

                 NomePasta := DadosConta.PathArqSiga + '\Siga\'+ DadosConta.IdConta +'\'+
                       IntToStr(MonthOfTheYear(Date())) +
                       IntToStr(YearOf(Date()));
                 ForceDirectories(NomePasta);
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
                  DeleteFile(PChar(ArqRename));
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
     // AtualizarDatLeituraParam(DataTermino);
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
// Carrega dados das tabelas SQLite (DB) - Sistema SCA
function TMlkPrincipalDTM.GetDbData(dbName: string; createFile: Boolean): Boolean;
var
  ListaAux : TStringList;
begin
  if FileExists(dbName) then
  begin
    try
     // Conecta com o arquivo de dados
     cnnDbMaster.Connected := False;
     cnnDbMaster.Database := dbName;
     cnnDbMaster.Connected := True;

     // pega dados das linhas:
     qryDbAux.SQL.Clear;
     qryDbAux.SQL.Add('Select * from linha');
     qryDbAux.Open;
     qryDbAux.First;
     while not( qryDbAux.Eof) do
     begin
       if not (cdsLinha.Locate('codigo',qryDbAux.FieldByName('lincodigo').AsString, [loPartialKey])) then
       begin
         cdsLinha.Append;
         cdsLinhaCodigo.Value := qryDbAux.FieldByName('lincodigo').AsString;
         cdsLinhaNome.Value := qryDbAux.FieldByName('lindescri').AsString;
         cdsLinha.Post;
       end;
       qryDbAux.Next;
     end;
     // pega dados dos produtores:
     qryDbAux.SQL.Clear;
     qryDbAux.SQL.Add('Select * from produtor');
     qryDbAux.Open;
     qryDbAux.First;
     while not( qryDbAux.Eof) do
     begin
       if not (cdsProdutor.Locate('codigo',qryDbAux.FieldByName('codigo').AsString,[loPartialKey])) then
       begin
         cdsProdutor.Append;
         cdsProdutorCodigo.Value := qryDbAux.FieldByName('codigo').AsString;
         cdsProdutorNome.Value := qryDbAux.FieldByName('nome').AsString;
         cdsProdutor.Post;
       end;
       qryDbAux.Next;
     end;
     // pega dados das fazendas:
     qryDbAux.SQL.Clear;
     qryDbAux.SQL.Add('Select * from fazenda');
     qryDbAux.Open;
     qryDbAux.First;
     while not( qryDbAux.Eof) do
     begin
       if not (cdsFazendas.Locate('codigo',qryDbAux.FieldByName('codigo').AsString,[loPartialKey])) then
       begin
         cdsFazendas.Append;
         cdsFazendascodigo.Value := qryDbAux.FieldByName('codigo').AsString;
         if cdsProdutor.Locate('codigo',qryDbAux.FieldByName('codigo').AsString,[loPartialKey]) then
           cdsFazendasnome.Value := Trim(qryDbAux.FieldByName('descri').AsString) + ' - ('+ cdsProdutorNome.AsString +')'
         else
           cdsFazendasnome.Value := qryDbAux.FieldByName('descri').AsString;
         cdsFazendasprodutor.Value := qryDbAux.FieldByName('codigo').AsString;
         cdsFazendas.Post;
         // Tanques
         cdsTanques.Append;
         cdsTanquescodigo.Value := qryDbAux.FieldByName('codigo').AsString;
         cdsTanquestipo.Value := 'F';
         cdsTanquesfazenda.Value := qryDbAux.FieldByName('codigo').AsString;
         cdsTanquesaltura.Value := 0;
         cdsTanquesperimetro.Value := 0;
         cdsTanquesvolume.Value := 1000;
         cdsTanquescapacidade.Value := 1000;
         cdsTanquesveiculo.Value := EmptyStr;
         cdsTanquesdiferenca.Value := 'D';
         cdsTanquesdivisao.Value := 'M';
         cdsTanquescomunitario.Value :='0';
         cdsTanquesimpressao.Value := 'D';
         cdsTanquesdistribuicao.Value := 'DC';
         cdsTanquescoleta_seletiva.Value := '0';
         cdsTanques.Post;

       end;
       qryDbAux.Next;
     end;

     // pega dados dos Itinerarios:
     qryDbAux.SQL.Clear;
     qryDbAux.SQL.Add('Select * from fazenda');
     qryDbAux.Open;
     qryDbAux.First;
     while not( qryDbAux.Eof) do
     begin
       cdsItinerarios.Append;
       cdsItinerarioscodigo.Value := qryDbAux.FieldByName('codigo').AsString +
                                      '/' + qryDbAux.FieldByName('codlinha').AsString;
       cdsItinerarioslinha.Value := qryDbAux.FieldByName('codlinha').AsString;
       cdsItinerariosfazenda.Value := qryDbAux.FieldByName('codigo').AsString;
       cdsItinerariosordem.Value := qryDbAux.FieldByName('sequencia').AsString;
       cdsItinerarioscoleta_seletiva.Value := '0';
       cdsItinerarios.Post;

       qryDbAux.Next;
     end;



     Result := True;
    finally
      if createFile then
      begin
         // Exporta Linhas
         ListaAux := TStringList.Create;
         ListaAux.Clear;
         ListaAux.Add('codigo|nome|rota');
         cdsLinha.First;
         while not (cdsLinha.Eof) do
         begin
           ListaAux.Add(cdsLinhaCodigo.Value+'|'+ cdsLinhaNome.Value + '|1|');
           cdsLinha.Next;
         end;
         if ListaAux.Count > 0 then
           ListaAux.SaveToFile('Linhas.txt');

         // Exporta Produtores
         ListaAux.Clear;
         ListaAux.Add('codigo|nome');
         cdsProdutor.First;
         while not (cdsProdutor.Eof) do
         begin
           ListaAux.Add(cdsProdutorCodigo.Value+'|'+ cdsProdutorNome.Value + '|');
           cdsProdutor.Next;
         end;
         if ListaAux.Count > 0 then
           ListaAux.SaveToFile('Produtores.txt');

         // Exporta Fazendas
         ListaAux.Clear;
         ListaAux.Add('codigo|nome|produtor');
         cdsFazendas.First;
         while not (cdsFazendas.Eof) do
         begin
           ListaAux.Add(cdsFazendascodigo.Value + '|' + cdsFazendasnome.Value + '|' + cdsFazendasprodutor.Value + '|');
           cdsFazendas.Next;
         end;
         if ListaAux.Count > 0 then
           ListaAux.SaveToFile('Fazendas.txt');
         // Exporta Itinerarios
         ListaAux.Clear;
         ListaAux.Add('codigo|linha|fazenda|ordem|horario|seletiva');
         cdsItinerarios.First;
         while not (cdsItinerarios.Eof) do
         begin
           ListaAux.Add(cdsItinerarioscodigo.AsString +
            '|' + cdsItinerarioslinha.AsString +
            '|' + cdsItinerariosfazenda.AsString +
            '|' + cdsItinerariosordem.AsString +
            '|' + cdsItinerarioshorario.AsString +
            '|' + cdsItinerarioscoleta_seletiva.AsString + '|');

           cdsItinerarios.Next;
         end;
         if ListaAux.Count > 0 then
           ListaAux.SaveToFile('Itinerarios.txt');

         // Exporta Tanques
         ListaAux.Clear;
         ListaAux.Add('Tipo|codigo|fazenda|veiculo|capacidade|altura|perimetro|volume|comunitario|distribuicao|diferenca|impressao|divisao|Coleta_Seletiva|deleted');
         cdsTanques.First;
         while not (cdsTanques.Eof) do
         begin
           ListaAux.Add(cdsTanquestipo.AsString +
            '|' + cdsTanquescodigo.AsString +
            '|' + cdsTanquesfazenda.AsString +
            '|' + cdsTanquesveiculo.AsString +
            '|' + cdsTanquescapacidade.AsString +
            '|' + cdsTanquesaltura.AsString +
            '|' + cdsTanquesperimetro.AsString +
            '|' + cdsTanquesvolume.AsString +
            '|' + cdsTanquescomunitario.AsString +
            '|' + cdsTanquesdistribuicao.AsString +
            '|' + cdsTanquesdiferenca.AsString +
            '|' + cdsTanquesimpressao.AsString +
            '|' + cdsTanquesdivisao.AsString +
            '|' + cdsTanquescoleta_seletiva.AsString +
            '|' + cdsTanquesdeleted.AsString +
            '|');

           cdsTanques.Next;
         end;
         if ListaAux.Count > 0 then
           ListaAux.SaveToFile('tanques.txt');
         // Destroy a lista auxiliar
        ListaAux.Destroy;
      end;
    end;
  end
  else
    Result := False;
end;

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
  DataInicioStr, DataTerminoStr, Sync: string;
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
            ObjViagem.ContaId := ContaId;
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
              // Sinaliza que sincronizou a conta
              Sync := FlagSim;
              // Empilha Viagem
              ListaViagem.Add(ObjViagem);
            end;
          finally
            ObjViagem.Free;
          end;
        end; //Loop Dados Viagem

        //Atualizar Parâmetros
        if FlgAtualizaUltDataLeitura then
           AtualizarDatLeituraParam(ContaId, Now, Sync);
      end; //DadosRetornoDescarga.Sucesso
    finally
      while ListaViagem.Count > 0 do
        ListaViagem.Delete(0);
      ListaViagem.Free;
      ColecaoViagem.Free;
      ColecaoDescarga.Free;
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
function TMlkPrincipalDTM.getServerData: TSatusSync;
  function clearDadosConta() : Boolean ;
  begin
    try
      DadosConta.HostURL := EmptyStr;
      DadosConta.IdConta := EmptyStr;
      DadosConta.Log := False;
      DadosConta.PathArqDatasul := EmptyStr;
      DadosConta.PathArqCarga := EmptyStr;
      DadosConta.PathArqDescarga := EmptyStr;
      DadosConta.PathArqMagis := EmptyStr;
      DadosConta.PathArqRm := EmptyStr;
      DadosConta.PathArqMeta := EmptyStr;
      DadosConta.PathArqScl := EmptyStr;
      DadosConta.ColetasHoje := EmptyStr;
      DadosConta.VerDatasul :=  EmptyStr;
      DadosConta.VerRm := EmptyStr;
      DadosConta.VerMagis := EmptyStr;
      DadosConta.VerScl := EmptyStr;
      DadosConta.VerSiga := EmptyStr;
      dadosconta.VerMeta := EmptyStr;

      Result := True;
    except
      Result := False;
    end;
  end;
var
  dtInicio, dtFim : TDateTime;
begin
  try
    // Seta status
    FStatusTmrConsole := TmrAtivo;
    if Assigned(ShowStatusTmr) then
      ShowStatusTmr;

    // Reseta status de sincronizacaode todas as contas
    if not ResetSync('Sync') then
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
      // Limpa estrutura da conta para receber os dados
      if clearDadosConta then
      begin
        // Dados da conta
        DadosConta.HostURL := cdsContasHostURL.Value;
        DadosConta.IdConta := IntToStr(cdsContasContaId.Value);
        DadosConta.Log := (cdsContasLog.Value = FlagSim);
        DadosConta.PathArqDatasul := cdsContasPathArqDatasul.Value;
        DadosConta.PathArqCarga := cdsContasPathArqCarga.Value;
        DadosConta.PathArqDescarga := cdsContasPathArqDescarga.Value;
        DadosConta.PathArqMagis := cdsContasPathArqMagis.Value;
        DadosConta.PathArqRm := cdsContasPathArqRm.Value;
        DadosConta.PathArqMeta := cdsContasPathArqMeta.Value;
        DadosConta.PathArqScl := cdsContasPathArqScl.Value;
        DadosConta.ColetasHoje := cdsContasParColetasHoje.Value;
        DadosConta.VerDatasul :=  cdsContasVerDatasul.Value;
        DadosConta.VerRm := cdsContasVerRm.Value;
        DadosConta.VerMagis := cdsContasVerMagis.Value;
        DadosConta.VerScl := cdsContasVerScl.Value;
        DadosConta.VerSiga := cdsContasVerSiga.Value;
        dadosconta.VerMeta := cdsContasVerMeta.Value;
      end
      else
      begin
        Continue;
      end;

      // Totvs Datasul
      if (cdsContasGeraTotvsDatasul.AsString = FlagSim) then
      begin
       // ExportarDescargas(cdsContasContaId.Value,dtInicio, dtFim);
        ExportarColetas('Datasul',dtInicio,dtFim);
      end;
      // Totvs Rm
       if (cdsContasGeraTotvsRm.AsString = FlagSim) then
      begin
       // ExportarDescargas(cdsContasContaId.Value,dtInicio, dtFim);
        ExportarColetas('RM',dtInicio,dtFim);
      end;
      // Magistech
      if (cdsContasGeraMagis.AsString = FlagSim) then
      begin
       // ExportarDescargas(cdsContasContaId.Value,dtInicio, dtFim);
        ExportarColetas('Magis',dtInicio,dtFim);
      end;
      // Scl
      if (cdsContasGeraScl.AsString = FlagSim) then
      begin
       // ExportarDescargas(cdsContasContaId.Value,dtInicio, dtFim);
        ExportarColetas('SCL',dtInicio,dtFim);
      end;

      cdsContas.Next;
      Application.ProcessMessages;
    end;
    Result.Result := True;
    Result.State := 'E';
  finally
    FStatusTmrConsole := TmrInativo;
    if Assigned(ShowStatusTmr) then
      ShowStatusTmr;
    Result.Result := True;
    Result.State := 'E';
    // Seleciona todas as contas cadastradas
    SelectAllRecordsConta;
    cdsContas.First;

    // Atualiza interface
    if Assigned(ShowStatusTmr) then
      ShowStatusTmr;
    Application.ProcessMessages;

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
procedure TMlkPrincipalDTM.LiberaMemoria;
var
MainHandle : THandle;
begin
  try
    MainHandle := OpenProcess(PROCESS_ALL_ACCESS, false, GetCurrentProcessID) ;
    SetProcessWorkingSetSize(MainHandle, $FFFFFFFF, $FFFFFFFF) ;
    CloseHandle(MainHandle) ;
  except
  end;
  Application.ProcessMessages;
end;


function TMlkPrincipalDTM.lodMapInformation(Contaid: Integer): TMapasCarga;
begin
  Result.ContaId := Contaid;

  Result.Mapas[1]      := cdsContasPatMapGrupoRota.Value;
  Result.Metodos[1]     := 'writeGrupoRota';
  Result.MetodosRead[1] := 'readGrupoRota';
  Result.NomeArqSaida[1] := 'SclGrpRota.txt';

  Result.Mapas[2] := cdsContasPathMapRota.Value;
  Result.Metodos[2] := 'writeRota';
  Result.MetodosRead[2] := 'readRota';
  Result.NomeArqSaida[2] := 'SclRota.txt';


  Result.Mapas[3] := cdsContasPatMapLinha.Value;
  Result.Metodos[3] := 'writeLinha';
  Result.MetodosRead[3] := 'readLinha';
  Result.NomeArqSaida[3] := 'ScLinha.txt';

  Result.Mapas[4] := cdsContasPatMapProdutor.Value;
  Result.Metodos[4] := 'writeProdutor';
  Result.MetodosRead[4] := 'readProdutor';
  Result.NomeArqSaida[4] := 'SclProd.txt';

  Result.Mapas[5] := cdsContasPatMapFazenda.Value;
  Result.Metodos[5] := 'writeFazenda';
  Result.MetodosRead[5] := 'readFazenda';
  Result.NomeArqSaida[5] := 'SclFaz.txt';

  Result.Mapas[6] := cdsContasPatMapVeiculo.Value;
  Result.Metodos[6] := 'writeVeiculo';
  Result.MetodosRead[6] := 'readVeiculo';
  Result.NomeArqSaida[6] := 'SclVeic.txt';

  Result.Mapas[7] := cdsContasPatMapTanque.Value;
  Result.Metodos[7] := 'writeTanque';
  Result.MetodosRead[7] := 'readTanque';
  Result.NomeArqSaida[7] := 'SclTaq.txt';

  Result.Mapas[8] := cdsContasPatMapVinculado.Value;
  Result.Metodos[8] := 'writeVinculado';
  Result.MetodosRead[8] := 'readVinculado';
  Result.NomeArqSaida[8] := 'SclVincu.txt';

  Result.Mapas[9] := cdsContasPatMapColetor.Value;
  Result.Metodos[9] := 'writeColetor';
  Result.MetodosRead[9] := 'readColetor';
  Result.NomeArqSaida[9] := 'SclCol.txt';

  Result.Mapas[10] := cdsContasPatMapTecnico.Value;
  Result.Metodos[10] := 'writeTecnico';
  Result.MetodosRead[10] := 'readTecnico';
  Result.NomeArqSaida[10] := 'SclTec.txt';

  Result.Mapas[11] := cdsContasPatMapTag.Value;
  Result.Metodos[11] := 'writeTag';
  Result.MetodosRead[11] := 'readTag';
  Result.NomeArqSaida[11] := 'SclTag.txt';

  Result.Mapas[12] := cdsContasPatMapItinerario.Value;
  Result.Metodos[12] := 'writeItinerario';
  Result.MetodosRead[12] := 'readItinerario';
  Result.NomeArqSaida[12] := 'SclItiner.txt';

  Result.Mapas[13] := cdsContasPatMapAnalise.Value;
  Result.Metodos[13] := 'writeAnalise';
  Result.MetodosRead[13] := 'readAnalise';
  Result.NomeArqSaida[13] := 'SclAna.txt';

  Result.Mapas[14] := cdsContasPatMapExtrato.Value;
  Result.Metodos[14] := 'writeExtrato';
  Result.MetodosRead[14] := 'readExtrato';
  Result.NomeArqSaida[14] := 'SclExt.txt';

  Result.Mapas[15] := cdsContasPatMapMotivo.Value;
  Result.Metodos[15] := 'writeMotivo';
  Result.MetodosRead[15] := 'readMotivo';
  Result.NomeArqSaida[15] := 'SclJust.txt';
end;

// abre conexao ou cria banco de dados SQLITE(DB)
function TMlkPrincipalDTM.OpenDb(dbName: string): Boolean;
begin
  Result := False;
  if FileExists(dbName) then
  begin
    try
     if cnnDbMaster.Connected then
       cnnDbMaster.Disconnect;
     cnnDbMaster.Database := dbName;
     cnnDbMaster.Connected := True;
     Result := True;
    except
      result := False;
    end;
  end
  else // Banco de dados novo, cria a estrutura basica
  begin
    if cnnDbMaster.Connected then
       cnnDbMaster.Disconnect;
    cnnDbMaster.Database := dbName;
    cnnDbMaster.Connected := True;
    if FileExists(dbName) then
      Result := True
    else
      Result := False;
  end;
end;
// Carrega informacoes do mapa de exportacao
function TMlkPrincipalDTM.OrdenaCrescente(Par01, Par02: Pointer): Integer;
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
// Persiste dados da viagem processada
procedure TMlkPrincipalDTM.PersistirLogViagem(Viagem: TViagem);
var
  FlgEnviarNotificacao: Boolean;
  ViagemCadastrada : Boolean;
  i: Integer;


  function NotificaDifAtesto(Viagem: TViagem): Boolean;
  var
    PercDif: Double;
  begin
    if Viagem.QtdeArmazenado > 0 then
      PercDif := Abs((Viagem.QtdeArmazenado - Viagem.QtdeColetado)/Viagem.QtdeArmazenado)
    else
      PercDif := Abs((Viagem.QtdeArmazenado - Viagem.QtdeColetado));

   // Result := (PercDif > qryParametrosParPercAtesto.AsFloat) and
    //  (Abs(PercDif - qryParametrosParPercAtesto.AsFloat) > 0.0001);
  end;

begin

  // Verifica se a viagem já esta cadastrada no log
  qrySQL.SQL.Clear;
  qrySQL.SQL.Text := 'Select LovViagemId from LogViagem Where LovViagemId = :LovViagemId';
  qrySQL.Parameters.ParamByName('LovViagemId').Value := Viagem.Id;
  qrySQL.Open;
  ViagemCadastrada := not qrySQL.IsEmpty ;
  qrySQL.SQL.Clear;

  FlgEnviarNotificacao := NotificaDifAtesto(Viagem);
  // Persistir Log
  if ViagemCadastrada then
  begin
    qrySQL.SQL.Text := 'UPDATE LogViagem Set LovGerDatasul = :LovGerDatasul, LovGerRm = :LovGerRm , LovGerMagis = :LovGerMagis, ' +
                       ' LovGerMeta = :LovGerMeta , LovGerSiga = :LovGerSiga , '+
                       ' LovGerScl = :LovGerScl, ContaId = :ContaId Where LovViagemId = :LovViagemId ' ;
    qrySQL.Parameters.ParamByName('LovGerDatasul').Value := Viagem.GerouDatasul;
    qrySQL.Parameters.ParamByName('LovGerRm').Value :=  Viagem.GerouRm;
    qrySQL.Parameters.ParamByName('LovGerMagis').Value := Viagem.GerouMagis;
    qrySQL.Parameters.ParamByName('LovGerMeta').Value := Viagem.GerouMeta;
    qrySQL.Parameters.ParamByName('LovGerSiga').Value := Viagem.GerouSiga;
    qrySQL.Parameters.ParamByName('LovGerScl').Value := Viagem.GerouScl;
    qrySQL.Parameters.ParamByName('LovViagemId').Value := Viagem.Id;
    qrySQL.Parameters.ParamByName('ContaId').Value := Viagem.ContaId;


    qrySQL.ExecSQL;

  end
  else
  begin
    qrySQL.SQL.Text := 'INSERT INTO LogViagem (LovRotaCod, LovRotaId, LovEnviaNotif, LovDataProc, LovDifColeta, ' +
      'LovQtdeDescarga, LovViagemId, LovGerDatasul, LovGerRm, LovGerMagis, LovGerMeta, LovGerSiga, '+
      'LovGerScl,  LovColetor, LovVeiculo, LovIndex, ContaId) ' +
      'VALUES (:LovRotaCod, :LovRotaId, :LovEnviaNotif, :LovDataProc, :LovDifColeta, :LovQtdeDescarga,' +
      ' :LovViagemId, :LovGerDatasul, :LovGerRm, :LovGerMagis, :LovGerMeta, :LovGerSiga, :LovGerScl, :LovColetor, ' +
      ' :LovVeiculo, :LovIndex, :ContaId)';
    qrySQL.Parameters.ParamByName('LovRotaCod').Value := Viagem.RotaCodigo;
    qrySQL.Parameters.ParamByName('LovRotaId').Value := Viagem.RotaId;
    qrySQL.Parameters.ParamByName('LovDataProc').Value := FormatDateTime('yyyy-MM-dd hh:mm:ss', Date());
    qrySQL.Parameters.ParamByName('LovDifColeta').Value := (Viagem.QtdeArmazenado - Viagem.QtdeColetado);
    qrySQL.Parameters.ParamByName('LovQtdeDescarga').Value := Viagem.QtdeDescargas;
    qrySQL.Parameters.ParamByName('LovViagemId').Value := Viagem.Id;
    qrySQL.Parameters.ParamByName('LovEnviaNotif').Value := BooleanToStr(FlgEnviarNotificacao);
    qrySQL.Parameters.ParamByName('LovGerDatasul').Value := Viagem.GerouDatasul;
    qrySQL.Parameters.ParamByName('LovGerRm').Value :=  Viagem.GerouRm;
    qrySQL.Parameters.ParamByName('LovGerMagis').Value := Viagem.GerouMagis;
    qrySQL.Parameters.ParamByName('LovGerMeta').Value := Viagem.GerouMeta;
    qrySQL.Parameters.ParamByName('LovGerSiga').Value := Viagem.GerouSiga;
    qrySQL.Parameters.ParamByName('LovGerScl').Value := Viagem.GerouScl;
    qrySQL.Parameters.ParamByName('LovColetor').Value := Viagem.Coletor;
    qrySQL.Parameters.ParamByName('LovVeiculo').Value := Viagem.Veiculo;
   // qrySQL.Parameters.ParamByName('LovDataViagem').Value := FormatDateTime('yyyy-MM-dd hh:mm:ss',Viagem.DatAbertura ); // GetDataHora( FormatDateTime('yyyy-MM-dd hh:mm:ss',Viagem.DatAbertura))
    qrySQL.Parameters.ParamByName('LovIndex').Value := Viagem.Index;
    qrySQL.Parameters.ParamByName('ContaId').Value := Viagem.ContaId;

    try
      qrySQL.ExecSQL;
    except
      on E: Exception do
      begin
        FListaAux.Add(e.Message);
        FListaAux.Add(qrySql.SQL.Text);
        for i := 0 to qrySql.Parameters.Count - 1 do
        begin
          FListaAux.Append(qrySql.Parameters[i].Value);
        end;

      end;
     end;
  end;
  {
  // Envia Mensagem
  if FlgEnviarNotificacao and (qryParametrosParEnviarNotifAtesto.AsString = 'S') then
    EnviarNotificacao(Viagem, Format('Descarga da Viagem %d excedeu o percentual de atesto permitido.', [Viagem.Id]));
 }
end;

procedure TMlkPrincipalDTM.PesquisarConta(Filtro: string);
begin
  cdsContas.Close;
  sqlContas.Filtro := Filtro;
  cdsContas.Open;
end;

procedure TMlkPrincipalDTM.PopulaAtoresColeta(DataInicio,
  DataTermino: TDateTime; Sync, Comunitario: string);
 function getRotas(): Boolean; //  TListaRota;
  var
    i: Integer;
  begin
    Result := False; //TListaRota.Create;

    DataInicioStr := FormatDateTime('YYYY-MM-dd', DataInicio);
    DataTerminoStr := FormatDateTime('YYYY-MM-dd', DataTermino);
    try
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
            objRota.Free;
          end;
        end;
        ColecaoRota.Free;
      end;
      Result := True;
    except
      Result := False;
    end;
  end;

  function getLinhas(): Boolean; // TListaLinha;
  var
    i: Integer;
  begin
    Result := False; // TListaLinha.Create;

    DataInicioStr := FormatDateTime('YYYY-MM-dd', DataInicio);
    DataTerminoStr := FormatDateTime('YYYY-MM-dd', DataTermino);
    try
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
           objLinha.Free;
          end;
        end;
        ColecaoLinha.Free;
      end;
      Result := True;
    except
      Result := False;
    end;
  end;

  function getProdutores(): Boolean; // TListaProdutor;
  var
    i: Integer;
  begin
    Result := False; //  TListaProdutor.Create;

    DataInicioStr := FormatDateTime('YYYY-MM-dd', DataInicio);
    DataTerminoStr := FormatDateTime('YYYY-MM-dd', DataTermino);
    try
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
             objProdutor.Doc := Produtor.getString('doc');

             // Empilha produtor
            // Result.Add(objProdutor);

            // popula cds produtor
             cdsProdutor.Insert;

             cdsProdutorCodigo.Value := objProdutor.Codigo;
             cdsProdutorNome.Value := objProdutor.Nome;
             cdsProdutordoc.Value := objProdutor.Doc;

             cdsProdutor.Post;

          finally
           objProdutor.Free;
          end;
        end;
        ColecaoProdutor.Free;
      end;
      Result := True;
    except
      Result := False;
    end;
  end;

  function getFazendas(): Boolean; // TListaFazenda;
  var
    i: Integer;
  begin
    Result := False; //TListaFazenda.Create;

    DataInicioStr := FormatDateTime('YYYY-MM-dd', DataInicio);
    DataTerminoStr := FormatDateTime('YYYY-MM-dd', DataTermino);
    try
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
             objFazenda.produtor := Fazenda.getString('produtor');
             // Empilha Fazenda
             //Result.Add(objFazenda);

             // popula dataset fazendas
             cdsFazendas.Insert;

             cdsFazendascodigo.Value := objFazenda.Codigo;
             cdsFazendasnome.Value := objFazenda.Nome;
             cdsFazendasprodutor.Value := objFazenda.produtor;

             cdsFazendas.Post;

          finally
           objFazenda.Free;
          end;
        end;
        ColecaoFazenda.Free;
      end;
      Result := True;
    except
      Result := False;
    end;
  end;

  function getColetores(): Boolean; // TListaColetor;
  var
    i: Integer;
  begin
    Result := False; //TListaColetor.Create;

    DataInicioStr := FormatDateTime('YYYY-MM-dd', DataInicio);
    DataTerminoStr := FormatDateTime('YYYY-MM-dd', DataTermino);
    try
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
           objColetor.Free;
          end;
        end;
        ColecaoColetor.Free;
      end;
      Result := True;
    except
      Result := False;
    end;
  end;

  function getVeiculos(): Boolean; // TListaVeiculo;
  var
    i: Integer;
  begin
    Result := False; // TListaVeiculo.Create;

    DataInicioStr := FormatDateTime('YYYY-MM-dd', DataInicio);
    DataTerminoStr := FormatDateTime('YYYY-MM-dd', DataTermino);
    try
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
           objVeiculo.Free;
          end;
        end;
        ColecaoVeiculo.Free;
      end;
      Result := True
    except
      Result := False;
    end;
  end;
  {Carrega viagens}

  function getViagens(): Boolean; // TListaRegViagem;
  var
    i: Integer;
    ExtFile: TStringList;
  begin
    Result := False; // TListaRegViagem.Create;

    DataInicioStr := FormatDateTime('YYYY-MM-dd', DataInicio);
    DataTerminoStr := FormatDateTime('YYYY-MM-dd', DataTermino);
    try
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
             if (objRegViagem.Coletor = 'null') then
             begin
               objRegViagem.Coletor := '001';
             end;
             objRegViagem.Veiculo := Viagem.getString('veiculo');
             objRegViagem.ComunitarioPendente :=  Viagem.getString('comunitario_pendente');
             if Viagem.has('bocas') then
               objRegViagem.bocas := Viagem.getString('bocas');
             if Viagem.has('tanques') then
               objRegViagem.tanques := Viagem.getString('tanques');

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
             cdsViagensbocas.Value := objRegViagem.bocas;
             cdsViagenstanques.Value :=objRegViagem.tanques;

             cdsViagens.Post;
          finally
            objRegViagem.Free;
          end;
        end;
        ColecaoViagem.Free;
      end;
      Result := True;
    except
      Result := False;
    end;
  end;
  {Carrega coletas }
  function getColetas(): Boolean; // TListaColeta;
  var
    i: Integer;
  begin
    Result := False; // TListaColeta.Create;

    DataInicioStr := FormatDateTime('YYYY-MM-dd', DataInicio);
    DataTerminoStr := FormatDateTime('YYYY-MM-dd', DataTermino);
    try
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
             if (Coleta.getString('regua')<> 'null') then
               objColeta.regua := Coleta.optDouble('regua',0)
             else
               objColeta.regua := 0;
             objColeta.alizarol := Coleta.getString('alizarol');
             objColeta.amostra := Coleta.getString('amostra');
             objColeta.contraprova := Coleta.getString('contraprova');
             if (Coleta.getString('temperatura')<> 'null') then
               objColeta.temperatura := Coleta.optDouble('temperatura',0)
             else
               objcoleta.temperatura := 0;
             objColeta.coletada := Coleta.getString('coletada');
             objColeta.dt_edicao := GetDataHora(Coleta.getString('dt_edicao'));
             objColeta.CodigoMotorista := Coleta.getString('coletor');
             objColeta.boca := Coleta.getString('boca');
             // Empilha Coleta
           //  Result.Add(objColeta);

             // Popula dataset de coleta
             cdsColetas.Append;

             cdsColetasid.Value := objColeta.Id;
             cdsColetasviagem_id.Value := objColeta.viagem_id;
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
             cdsColetasCodigoFazenda.Value := objColeta.CodigoFazenda;
             cdsColetastanque.Value := objColeta.tanque;
             cdsColetasBoca.Value := objColeta.boca;

             cdsColetas.Post;
          finally
           objColeta.Free;
          end;
        end;
        ColecaoColeta.Free;
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
             objColeta.quantidade := ValidaInt(Coleta.getString('quantidade'));
             objColeta.regua := Coleta.optDouble('regua',0);
             objColeta.alizarol := Coleta.getString('alizarol');
             objColeta.amostra := Coleta.getString('amostra');
             objColeta.contraprova := Coleta.getString('contraprova');
             objColeta.temperatura := Coleta.optDouble('temperatura',0);
             objColeta.coletada := Coleta.getString('coletada');
             objColeta.dt_edicao := GetDataHora(Coleta.getString('dt_edicao'));
             objColeta.CodigoMotorista := Coleta.getString('coletor');
             objColeta.boca := Coleta.getString('boca');
             // Empilha Coleta
           //  Result.Add(objColeta);

             // Popula dataset de coleta
             cdsColetas.Append;

             cdsColetasid.Value := objColeta.Id;
             cdsColetasviagem_id.Value := objColeta.viagem_id;
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
             cdsColetasBoca.Value := objColeta.boca;

             cdsColetas.Post;
          finally
           objColeta.Free;
          end;
        end;
        ColecaoColeta.Free;
      end;
      Result := True;
    except
      Result := False;
    end;
  end;

  {Visitas em uma periodo}

  function getVisitas(): Boolean; //TListaVisita;
  var
    i: Integer;
  begin
    Result := False; // TListaVisita.Create;

    DataInicioStr := FormatDateTime('YYYY-MM-dd', DataInicio);
    DataTerminoStr := FormatDateTime('YYYY-MM-dd', DataTermino);
    try
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
             // Result.Add(objVisita);
          finally
            objVisita.Free;
          end;
        end;
        ColecaoVisita.Free;
      end;
      Result := True;
    except
      Result := False;
    end;
  end;
begin
    getRotas;
    getLinhas;
    getProdutores;
    getFazendas;
    getColetores;
    getVeiculos;
    getViagens;
    getColetas;

end;

function TMlkPrincipalDTM.ResetSync(Tipo:String): Boolean;
begin
  try
    if Tipo = 'Sync' then
    begin
      FSQL := 'Update contas set sync = :p1' ;
      FConexaoBD.ExecutarComando(FSQL,[FlagNao]);
    end
    else if Tipo = 'Carga' then
    begin
       FSQL := 'Update contas set Carga = :p1' ;
      FConexaoBD.ExecutarComando(FSQL,['0']);
    end;
    Result := True;
  except
    Result := False;
  end;
end;

procedure TMlkPrincipalDTM.SalvarConta;
begin
   cdsContas.ApplyUpdates(-1);
   cdsContas.Refresh;
  // Reseta log de viagens caso a data de leitura inicial da conta seja retroagida
  if cdsContasDatIniLeituraDescargaWS.Value < cdsContasDatUltLeituraDescargaWS.Value then
  begin
    SetStatusLog(cdsContasContaId.Value,cdsContasDatIniLeituraDescargaWS.Value);
  end;
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
  qryContas.Close;
  FSQL := 'Select * from Contas Where 1=1';  //StringReplace(qryContas.SQL.Text, FResultado, '1=1', []);
  qryContas.SQL.Clear;
  qryContas.SQL.Add(FSQL);
  qryContas.Open;
  cdsContas.Refresh;
end;

// Seta data e hora da ultima iteracao de sincronizacao
procedure TMlkPrincipalDTM.SetLastIteration;
begin
  FSQL := 'UPDATE Controle SET UltimaIteracao = :p1';
  try
     FConexaoBD.ExecutarComando(FSQL,[Now]);
     cdsControle.Refresh;
     Application.ProcessMessages;
  except on E: Exception do
    MostraMsgInfo(e.Message);
  end;
end;
// Ajusta log de viagens caso o data inicial de leitura seja alterada.
procedure TMlkPrincipalDTM.SetStatusLog(contaId: Integer;
  DataInicial: TDateTime);
begin
    // Atualizar o arquivo de contas
  FSQL := 'Update contas set DatIniLeituraDescargaWS = :p1 where ContaId = :p2';
  try
    FConexaoBD.ExecutarComando(FSQL,[DataInicial,contaId]);
  except
   raise Exception.Create('Falha ao atualizar os dados da conta: ' + IntToStr(contaId));
  end;
  // Atualiza arquivo de log de viagens
  FSQL := 'Update Logviagem set ' +
          ' LovGerDatasul = :p1, ' +
          ' LovGerRm = :p2, ' +
          ' LovGerMagis = :p3, ' +
          ' LovGerMeta = :p4, ' +
          ' LovGerSiga = :p5, ' +
          ' LovGerScl = :p6 ' +
          ' WHERE LovDataProc >= :LovDataProc AND ContaId = :contaId';

  try
    FConexaoBD.ExecutarComando(FSQL,[FlagNao,FlagNao, FlagNao,
                                     FlagNao,FlagNao,FlagNao,DataInicial,contaId]);
  except
   raise Exception.Create('Falha ao atualizar Log da conta: ' + IntToStr(contaId));
  end;
end;

procedure TMlkPrincipalDTM.sheConsoleEvents1Execute(
  Sender: TJvEventCollectionItem; const IsSnoozeEvent: Boolean);
begin
 // Faz Exportação Extra 3 Últimos Dias ::  De 3 em 3 horas
  InserirMsgLog('Início Get Registros :: EXTRA');
  try
    try
       // Verifica e gera arquivos de viagens de at'e 3 dias anteriores
      if (FStatusTmrConsole <> TmrAtivo)  then
      begin
        if DateMenos(3) then
        begin
          getServerData;
        end;
      end;
    except
      on E: Exception do
      InserirMsgLog('Erro: ' + E.message);
    end;
  finally
    InserirMsgLog('Término Get Registros :: EXTRA');
    // Limpa Memória e Reinicia a aplicação
     TrimAppMemorySize(True,Application.ExeName);
  end;

end;

// Gera Arquivos
procedure TMlkPrincipalDTM.tmrConsoleTimer(Sender: TObject);
var
  dtInicio, dtFim : TDateTime;
  Success: Boolean;
begin
  FStatusTmrConsole := TmrAtivo;
  FStatusTmrSync := TmrInabilitado;
  Success := False;
  try
    if not tmrSync.Enabled then
    begin
      tmrSync.OnTimer := nil;
      tmrSync.Enabled := False;
      Success := True;
      if Assigned(ShowStatusTmr) then
        ShowStatusTmr;
      getServerData();
      // libera a memoria
      LiberaMemoria;
    end;
  finally
    // reabilita evento timer de console
    if Success then
    begin
      tmrSync.OnTimer := tmrSyncTimer;
      tmrSync.Enabled := True;
      FStatusTmrSync := TmrInativo;
      FStatusTmrConsole := TmrInativo;
      if Assigned(ShowStatusTmr) then
        ShowStatusTmr;
    end;
  end;
end;
// Timer para sincronizacao da carga nas tabelas de cadastro
procedure TMlkPrincipalDTM.tmrSyncTimer(Sender: TObject);
var
  x: Integer;
  FLogAtu : TStringList;
  FNomeArqLog, Carga_OK : string;
  dtInicio, dtFim : TDateTime;
begin

  try
    try

      if not (tmrConsole.Enabled) then
      begin
        // Desabilita envento do timer de geracao de arquivos
        tmrConsole.OnTimer := nil;

        tmrConsole.Enabled := False;
        sheConsole.StopAll;

        // Inicia log de envio de dados ao servidor
        FLogAtu := TStringList.Create;
        FLogAtu.Append('Milk´s Rota :: Log Envio de Arquivos API Milk´s Rota - Início Operação: ' + FormatDateTime('dd/MM/yyyy hh:mm:ss', Now));
        FLogAtu.Append('*******************************************');

        // Seta status
        FStatusTmrSync := TmrAtivo;
        FStatusTmrConsole := TmrInabilitado;
        if Assigned(ShowStatusTmr) then
          ShowStatusTmr;

        // Reseta status de sincronizacaode todas as contas
        if not ResetSync('Carga') then
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

           // Popula dados da conta
           DadosConta.HostURL := cdsContasHostURL.Value;
           DadosConta.IdConta := IntToStr(cdsContasContaId.Value);
           DadosConta.Log := (cdsContasLog.Value = FlagSim);
           DadosConta.CargaMultiEmpresa := cdsContasCargaMultiEmpresa.Value;
           DadosConta.PathArqDatasul := cdsContasPathArqDatasul.Value;
           DadosConta.PathArqCarga := cdsContasPathArqCarga.Value;
           DadosConta.PathArqDescarga := cdsContasPathArqDescarga.Value;
           DadosConta.PathArqCargaApi := cdsContasPathCargaApi.Value;
           DadosConta.PathArqMagis := cdsContasPathArqMagis.Value;
           DadosConta.PathArqRm := cdsContasPathArqRm.Value;
           DadosConta.PathArqMeta := cdsContasPathArqMeta.Value;
           DadosConta.PathArqScl := cdsContasPathArqScl.Value;
           DadosConta.ColetasHoje := cdsContasParColetasHoje.Value;
           DadosConta.VerDatasul :=  cdsContasVerDatasul.Value;
           DadosConta.VerRm := cdsContasVerRm.Value;
           DadosConta.VerMagis := cdsContasVerMagis.Value;
           DadosConta.VerScl := cdsContasVerScl.Value;
           DadosConta.VerSiga := cdsContasVerSiga.Value;
           dadosconta.VerMeta := cdsContasVerMeta.Value;

           // Gerencia envio de dados com arquivos gerados para multiplas empresas ou filiais
           if (DadosConta.CargaMultiEmpresa = FlagSim) then
           begin
             CargaMultiEmpresa.IdConta := StrToInt(DadosConta.IdConta);
             CargaMultiEmpresa.CodigoERP := cdsContasKeyId.Value; //  DadosConta.ChaveERP[x]
             CargaMultiEmpresa.NomeAtributo := 'rota';
             CargaMultiEmpresa.CargaMultipla := True;
           end;

           // Log
           FLogAtu.Append('Conta: ' + DadosConta.IdConta );

           // Se não houver numero de conta, pula para proxima posição
           if DadosConta.IdConta = EmptyStr then
           begin
              cdsContas.Next;
              Continue;
           end;

           // Carrega dados do mapa;
           _MapasCarga :=  lodMapInformation(cdsContasContaId.Value);
           // Atualiza Tabelas no servidor MilkRota
           FLogAtu.Append('Atualizando dados da conta na API Milk´s Rota ... |<><>| ' + FormatDateTime('dd/MM/yyyy hh:mm:ss',Now));

           // Envia arquivos para servidor Milk's Rota
           try
             // AtualizaTabelasWs(_MapasCarga);
            // Registra log de atividades.
            FLogAtu.Append('-------------------<>------------------------');
            FLogAtu.Append('Log de Atividades de Atualizacao-------------');
            FLogAtu.Append('-------------------<>------------------------');
            // Executa o envio dos dados e retorna o log
            FLogAtu.Append(AtualizaTabelasWs(_MapasCarga).Text);
           except
             on e: Exception do
             begin
              FLogAtu.Append('-------------------<>------------------------');
              FLogAtu.Append('FALHA AO ATUALIZAR BASE DE DADOS NO SERVIDOR ');
              FLogAtu.Append('-------------------<>------------------------');
              FLogAtu.Append('-----Mensagem de Erro Reportada--------------');
              FLogAtu.Append(e.Message);
              FLogAtu.Append('-------------------<>------------------------');
             end;
           end;
           FLogAtu.Append('Fim Atualização dados da conta na API Milk´s Rota ...|<><>| ' + FormatDateTime('dd/MM/yyyy hh:mm:ss', Now));
           // Gera arquivos para conferencia com dados baixados do servidor e grava no local espeficico
           FLogAtu.Append('Inicio Consulta de arquivos para conferência ...|<><>| ' + FormatDateTime('dd/MM/yyyy hh:mm:ss', Now));
           try
             // Registra log de atividades.
             FLogAtu.Append('-------------------<>------------------------');
             FLogAtu.Append('Log de Atividades de Consulta Registros -----');
             FLogAtu.Append('-------------------<>------------------------');
            // Executa a consulta dos dados e retorna o log
             FLogAtu.Append(ExportDataWs(_MapasCarga).Text);
           except
             on e: Exception do
             begin
               FLogAtu.Append('-------------------<>------------------------');
               FLogAtu.Append('FALHA AO CONSULTAR BASE DE DADOS NO SERVIDOR ');
               FLogAtu.Append('-------------------<>------------------------');
               FLogAtu.Append('-----Mensagem de Erro Reportada--------------');
               FLogAtu.Append(e.Message);
               FLogAtu.Append('-------------------<>------------------------');
             end;
           end;
           FLogAtu.Append('Fim Consulta de arquivos para conferência ...|<><>| ' + FormatDateTime('dd/MM/yyyy hh:mm:ss', Now));

           // Proxima Conta
           cdsContas.Next;
        end;
      end;
      Carga_OK := '1';
     except
       on E: Exception do
       begin
         FLogAtu.Append('Falha ao enviar arquivos: Msg. Erro: ' +  E.Message);
         Carga_OK := '0';
       end;
    end;
   finally
    // Fecha e salva registro de log
    FLogAtu.Append('Milk´s Rota :: Fim Envio de Arquivos - ' + FormatDateTime('dd/MM/yyyy hh:mm:ss', Now));
    FLogAtu.Append('*******************************************');


    if DirectoryExists( DadosConta.PathArqCargaApi + '\Log\' + DadosConta.IdConta) then
    begin
      FNomeArqLog := DadosConta.PathArqCargaApi + '\Log\' + DadosConta.IdConta +  '\'+ 'LogEnv_' + FormatDateTime('dd_MM_yyyy_hh_mm_ss',Now) + '.txt';
      FLogAtu.SaveToFile(FNomeArqLog);
    end
    else
    begin
      ForceDirectories(DadosConta.PathArqCargaApi + '\Log\' + DadosConta.IdConta);
      FNomeArqLog := DadosConta.PathArqCargaApi + '\Log\' + DadosConta.IdConta +   '\'+ 'LogEnv_' + FormatDateTime('dd_MM_yyyy_hh_mm_ss',Now) + '.txt';
      FLogAtu.SaveToFile(FNomeArqLog);
    end;

    // Atualiza dados da sincronizacao na tabela de contas
    AtualizarDataCarga(StrToInt(DadosConta.IdConta),Now,Carga_OK);

    FLogAtu.Destroy;
    FStatusTmrConsole := TmrInativo;
    FStatusTmrSync := TmrInativo;

    // Seleciona todas as contas cadastradas
    SelectAllRecordsConta;
    cdsContas.First;

    if Assigned(ShowStatusTmr) then
      ShowStatusTmr;
    tmrConsole.OnTimer := tmrConsoleTimer;
    tmrConsole.Enabled := True;
    sheConsole.StartAll;
   end;
end;
// Valida arquivos de mapa de carga
function TMlkPrincipalDTM.ValidarArquivoMapa(aContaId: Integer; aFile,
  aTabela: string): Boolean;
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

function TMlkPrincipalDTM.ValidarAssociacao: Boolean;
var
  _Conta : Integer;
begin
  if Assigned(cdsContas) then
  begin
    _Conta := cdsContasContaId.Value;
    Result := True;
     if (cdsContasPatMapAnalise.Value <> EmptyStr) then
    begin
      if not ValidarArquivoMapa(_Conta,cdsContasPatMapAnalise.Value, 'Analise') then
      begin
        Result := False;
        Abort;
      end;
    end;
    if (cdsContasPatMapColetor.Value <> EmptyStr) then
    begin
      if not ValidarArquivoMapa(_Conta,cdsContasPatMapColetor.Value, 'Coletor') then
      begin
        Result := False;
        Abort;
      end;
    end;
    if (cdsContasPatMapExtrato.Value <> EmptyStr) then
    begin
      if not ValidarArquivoMapa(_Conta,cdsContasPatMapExtrato.Value, 'Extrato') then
      begin
        Result := False;
        Abort;
      end;
    end;
    if (cdsContasPatMapFazenda.Value <> EmptyStr) then
    begin
      if not ValidarArquivoMapa(_Conta,cdsContasPatMapFazenda.Value, 'Fazenda') then
      begin
        Result := False;
        Abort;
      end;
    end;
    if (cdsContasPatMapItinerario.Value <> EmptyStr) then
    begin
      if not ValidarArquivoMapa(_Conta,cdsContasPatMapItinerario.Value, 'Itinerario') then
      begin
        Result := False;
        Abort;
      end;
    end;
    if (cdsContasPatMapLinha.Value <> EmptyStr) then
    begin
      if not ValidarArquivoMapa(_Conta,cdsContasPatMapLinha.Value, 'Linha') then
      begin
        Result := False;
        Abort;
      end;
    end;
    if (cdsContasPatMapMotivo.Value <> EmptyStr) then
    begin
      if not ValidarArquivoMapa(_Conta,cdsContasPatMapMotivo.Value, 'MotivoClto') then
      begin
        Result := False;
        Abort;
      end;
    end;
    if (cdsContasPatMapProdutor.Value <> EmptyStr) then
    begin
      if not ValidarArquivoMapa(_Conta,cdsContasPatMapProdutor.Value, 'Produtor') then
      begin
        Result := False;
        Abort;
      end;
    end;
    if (cdsContasPatMapGrupoRota.Value <> EmptyStr) then
    begin
      if not ValidarArquivoMapa(_Conta,cdsContasPatMapGrupoRota.Value, 'grupo_rota') then
      begin
        Result := False;
        Abort;
      end;
    end;
    if (cdsContasPathMapRota.Value <> EmptyStr) then
    begin
      if not ValidarArquivoMapa(_Conta,cdsContasPathMapRota.Value, 'Rota') then
      begin
        Result := False;
        Abort;
      end;
    end;
    if (cdsContasPatMapTecnico.Value <> EmptyStr) then
    begin
      if not ValidarArquivoMapa(_Conta,cdsContasPatMapTecnico.Value, 'Tecnico') then
      begin
        Result := False;
        Abort;
      end;
    end;
    if (cdsContasPatMapTanque.Value <> EmptyStr) then
    begin
      if not ValidarArquivoMapa(_Conta,cdsContasPatMapTanque.Value, 'Tanque') then
      begin
        Result := False;
        Abort;
      end;
    end;
    if (cdsContasPatMapVinculado.Value <> EmptyStr) then
    begin
      if not ValidarArquivoMapa(_Conta,cdsContasPatMapVinculado.Value, 'tanque_vinculado') then
      begin
        Result := False;
        Abort;
      end;
    end;
    if (cdsContasPatMapTag.Value <> EmptyStr) then
    begin
      if not ValidarArquivoMapa(_Conta,cdsContasPatMapTag.Value, 'Tag') then
      begin
        Result := False;
        Abort;
      end;
    end;
    if (cdsContasPatMapVeiculo.Value <> EmptyStr) then
    begin
      if not ValidarArquivoMapa(_Conta,cdsContasPatMapVeiculo.Value, 'Veiculo') then
      begin
        Result := False;
        Abort;
      end;
    end;
  end;
end;

end.
