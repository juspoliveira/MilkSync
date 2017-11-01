unit uVSSCLSettingsDTM;

interface

uses
  SysUtils, Classes, DB, DBClient, uS2ZSQLDataSet, Provider,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, uGlobal, uConstantesComuns, Variants;

type
  TVSSCLSettingsDTM = class(TDataModule)
    qryContas: TZQuery;
    pvdContas: TDataSetProvider;
    sqlContas: TS2ZSQLDataSet;
    cdsContas: TClientDataSet;
    cdsContasId: TIntegerField;
    cdsContasContaId: TIntegerField;
    cdsContasKeyId: TStringField;
    cdsContasAtiva: TStringField;
    cdsContasDatUltLeituraDescargaWS: TDateField;
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
    cdsContasDatIniLeituraDescargaWS: TDateField;
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
    cdsContasNomeEmpresa: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsContasBeforePost(DataSet: TDataSet);

    function IsCodigoInserted(Codigo: Integer): Boolean;
  private
    { Private declarations }
  public
    procedure SalvarContas;
    procedure PesquisarContas(Filtro: string);
    procedure InserirValoresDefault;

  end;

var
  VSSCLSettingsDTM: TVSSCLSettingsDTM;

implementation

uses
  uVSSCLRotaConsoleDTM, uVSSCLRotaComum;

{$R *.dfm}

{ TVSSCLSettingsDTM }

procedure TVSSCLSettingsDTM.PesquisarContas(Filtro: string);
begin
  cdsContas.Close;
  sqlContas.Filtro := Filtro;
  cdsContas.Open;
end;

procedure TVSSCLSettingsDTM.SalvarContas;
begin
  cdsContas.ApplyUpdates(-1);
  cdsContas.Refresh;
end;

procedure TVSSCLSettingsDTM.DataModuleCreate(Sender: TObject);
begin
  PesquisarContas(EmptyStr);
end;
// Valida dados da digitacao.
procedure TVSSCLSettingsDTM.cdsContasBeforePost(DataSet: TDataSet);
begin

  if cdsContas.State in [dsInsert] then
  begin
    if IsCodigoInserted(cdsContasContaId.Value) then
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
// Verifica se o c'odigo da conta ja esta cadastrado
function TVSSCLSettingsDTM.IsCodigoInserted(Codigo: Integer): Boolean;
begin
  FSQL := 'Select Id from Contas where contaId = :p1';
  FResultado := ConexaoBanco.ExecutarValor(FSQL, [Codigo]);
  Result := not VarIsNull(FResultado);
end;

procedure TVSSCLSettingsDTM.InserirValoresDefault;
begin
  if cdsContas.State in [dsInsert] then
  begin
    cdsContasHostURL.Value := 'http://app.sclrota.com.br/api/retaguardasync/';
    cdsContasAtiva.Value := FlagSim;
    cdsContasIntervalo.Value := 45;
    cdsContasIntervaloCarga.Value := 180;
    cdsContasDatIniLeituraDescargaWS.Value := Date;
    cdsContasParColetasHoje.Value := FlagSim;
  end;
end;

end.
