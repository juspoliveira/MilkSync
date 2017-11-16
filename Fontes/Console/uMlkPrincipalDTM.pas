unit uMlkPrincipalDTM;

interface

uses
  SysUtils, Classes, DB, ADODB,Forms,uConexao, Messages, Dialogs, Provider,
  uS2SQLDataSet, DBClient, uConstantesComuns, Variants, JvScheduledEvents,
  ExtCtrls, JvAppInst, uVSSCLRotaComum, uJSON, uSCLRCnExport, FMTBcd, SqlExpr,
  DateUtils;


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

    procedure ExportarColetas(Layout: string; DataProcIni, DataProcFim : TDateTime);

    procedure AtualizarDatLeituraParam(Data: TDateTime);

    // Gerar Coletas
    function GetColetas(DataInicio, DataTermino: TDateTime; Sync:string; Comunitario: string = '9'; FlgAtualizaUltDataLeitura: Boolean = False; Layout: string = 'Magis'): String;
    procedure PopulaAtoresColeta(DataInicio, DataTermino: TDateTime; Sync:string; Comunitario: string = '9');
    // Coletas
    function OrdenaCrescente(Par01, Par02: Pointer): Integer;
    function coletasToString(cds: TClientDataSet; separator: Char;colNames: Boolean): string;
    function coletasToStringInt(cds, Viagem: TClientDataSet; separator: Char;colNames: Boolean; Registro: Byte): string ; // Integrado com dados da viagem
    // Rastreabilidade SIGA
    function GetDadosSiga(DataInicio, DataTermino: TDateTime; Sync:string; Comunitario: string = '9'; FlgAtualizaUltDataLeitura: Boolean = False): String;


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
  arqTexto, ArqRename, ArqSigaColetor, ArqSigaProdutor: string;
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
// Valida digitacao dados da conta

procedure TMlkPrincipalDTM.AtualizarDatLeituraParam(Data: TDateTime);
begin
  qrySQL.SQL.Text := 'update Parametros set ParDatIniLeituraDescargaWS = :ParDatIniLeituraDescargaWS, '+
  'ParDatUltLeituraDescargaWS = :ParDatUltLeituraDescargaWS';
  qrySQL.Parameters.ParamByName('ParDatIniLeituraDescargaWS').Value := Data;
  qrySQL.Parameters.ParamByName('ParDatUltLeituraDescargaWS').Value := Data;
  qrySQL.ExecSQL;

end;

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
procedure TMlkPrincipalDTM.ExportarColetas(Layout: string;DataProcIni, DataProcFim : TDateTime);
begin
  InserirMsgLog('Início Get Coletas.');
  try
    GetColetas(DataProcIni, DataProcFim, '0',EmptyStr, False, Layout);
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
  FArqLog : TStringList;
  FArqSaveLog: string;
  _RegistroMovimento : TMovimentoRM;
  _ItemRegistro : TItensMovimentoRM;
  _DocProdutor, _LinhaDados, _Separador : string;
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



    PopulaAtoresColeta(DataInicio,DataTerminoAux, Sync, Comunitario);


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

    // FArqLog.SaveToFile('viagens.txt');

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
          ObjViagem.RotaId := cdsViagensrota_id.Value;
          ObjViagem.RotaCodigo := cdsViagensrota.Value;
          ObjViagem.DatAbertura := cdsViagensdt_abertura.Value;
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
            FCargaRural.QtdeCompartimentos := cdsViagensbocas.AsInteger;
            FCargaRural.HodometroInicial := cdsViagenskm_inicial.Value;
            FCargaRural.HodometroFinal := cdsViagenskm_final.Value;
            FCargaRural.DataTransacao := FormatDateTime('dd/MM/yyyy',cdsViagensdt_abertura.Value);

            // Gera cabeçalho no arquivo de saída
            _ArqSaida.Add(FCargaRural.toString);
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

                FProdutorCarga.QtdeColetada := cdsColetasquantidade.AsFloat;
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
               if Layout = 'SCL' then
               begin
                 arqTexto := arqTexto + IntToStr(cdsViagensid.Value)+ '_' + cdsViagenslinha.Value + '_'+
                           FormatDateTime('ddMMyyyy',cdsViagensdt_abertura.Value)+ '.txt';
                  // Renomear
                 ArqRename := ArqRename + IntToStr(cdsViagensid.Value)+ '_' + cdsViagenslinha.Value + '_'+
                           FormatDateTime('ddMMyyyy',cdsViagensdt_abertura.Value)+ '.tx_';

                 if DadosConta.VerScl = '2' then  // S2
                 begin
                   CplNome := FormatDateTime('dd',Now) + RetZero(IntToStr(cdsViagensid.Value),6) ;
                    arqTexto :=  's:\leite\mobile\'+  CplNome + '.txt';
                    // Renomear
                   ArqRename :=  's:\leite\mobile\'+  CplNome +'.tx_';
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
                  DeleteFile(ArqRename);
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
      if (Layout = 'RM') AND (DadosConta.VerRm = 'U') then
      begin
        _ArqSaida.SaveToFile(arqTexto);
      end;

      //Atualizar Parâmetros
      if FlgAtualizaUltDataLeitura then
      AtualizarDatLeituraParam(DataTermino);

      // Fecha e salva registro de log
      FArqLog.Append('Milk´s Rota :: Fim Geração Arquivos - ' + FormatDateTime('dd/MM/yyyy hh:mm:ss', Now));
      FArqLog.Append('*******************************************');


      if DirectoryExists(FolderSaida) then
      begin
        FArqSaveLog := FolderSaida +  '\'+ 'Log_' + DadosConta.IdConta +'_' + FormatDateTime('dd_MM_yyyy_hh_mm_ss',Now) + '.txt';
        FArqLog.SaveToFile(FArqSaveLog);
      end
      else
      begin
        ForceDirectories(FolderSaida);
        FArqSaveLog := FolderSaida +  '\'+ 'Log_' + DadosConta.IdConta +'_' + FormatDateTime('dd_MM_yyyy_hh_mm_ss',Now) + '.txt';
        FArqLog.SaveToFile(FArqSaveLog);
      end;

    finally
      clearTables;  // Empty dataset nas tabelas
      _ArqSaida.Free;
      FArqLog.Destroy;
    end;

  except
    on E: Exception do
    begin
      Result := 'Erro: ' + E.message;
    end;
  end;

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
      DadosConta.ColetasHoje := cdsContasParColetasHoje.Value;


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

procedure TMlkPrincipalDTM.PesquisarConta(Filtro: string);
begin
  cdsContas.Close;
  sqlContas.Filtro := Filtro;
  cdsContas.Open;
end;

procedure TMlkPrincipalDTM.PopulaAtoresColeta(DataInicio,
  DataTermino: TDateTime; Sync, Comunitario: string);
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
    ExtFile: TStringList;
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
           objRegViagem.bocas := Viagem.getString('bocas');

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
           cdsColetasCodigoFazenda.Value := objColeta.CodigoFazenda;
           cdsColetastanque.Value := objColeta.tanque;
           cdsColetasBoca.Value := objColeta.boca;

           cdsColetas.Post;
        finally
         objColeta.Free;
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
    getViagens;
    getColetas;

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
