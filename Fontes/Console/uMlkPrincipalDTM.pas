unit uMlkPrincipalDTM;

interface

uses
  SysUtils, Classes, DB, ADODB,Forms,uConexao, Messages, Dialogs, Provider,
  uS2SQLDataSet, DBClient, uConstantesComuns, Variants;


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
    cdsContasDatUltLeituraDescargaWS: TWideStringField;
    cdsContasDatIniLeituraDescargaWS: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsContasBeforePost(DataSet: TDataSet);
  private
    FStrConexao: string;
    FConexaoBD: TConexao;
    function IsContaInserted(Codigo: Integer): Boolean;
  public
    procedure PesquisarConta(Filtro: string);
    procedure SalvarConta;
    procedure InserirVlrDefaultConta;
    procedure SelectAllRecordsConta;
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

    cdsContas.Open;

    // Instancia da conex~ao
    FConexaoBD := TConexao.Create(FStrConexao);
  except
    ShowMessage('Falha so se conectar ao banco de dados, verifique !');
    Application.Terminate;
  end;

end;

procedure TMlkPrincipalDTM.InserirVlrDefaultConta;
begin
  if cdsContas.State in [dsInsert] then
  begin
    cdsContasHostURL.Value := 'http://app.sclrota.com.br/api/retaguardasync/';
    cdsContasAtiva.Value := FlagSim;
    cdsContasIntervalo.Value := 45;
    cdsContasIntervaloCarga.Value := 180;
   // cdsContasDatIniLeituraDescargaWS.Value := Date;
   // cdsContasDatUltLeituraDescargaWS.Value := Date;
    cdsContasParColetasHoje.Value := FlagSim;

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

procedure TMlkPrincipalDTM.SalvarConta;
begin
   cdsContas.ApplyUpdates(-1);
   cdsContas.Refresh;
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

end.
