unit uConexao;

interface
uses ADODB, Provider, DBClient, DB, SysUtils;

type

  TConexao = class
  private
    FConnection: TADOConnection;
    procedure SetConnection(const Value: TADOConnection);
  protected
    MsgErro: string;
    FAmbiente: WideString;
    procedure cdsReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  public
    function ExecutarDataSet(SQL: string): string; overload;
    function ExecutarDataSet(SQL: string; Parametros: array of Variant): string; overload;
    function ExecutarComando(SQL: string): Integer; overload;
    function ExecutarComando(SQL: string; const Parametros: array of Variant): Integer; overload;
    function ExecutarComando(SQL: string; LevantaExceptMultSQL: Boolean): Integer; overload;
    function ExecutarProcedure(NomeProcedure: string; Parametros: array of Variant): string;
     // Executa DataSet e Retorna Valor Primeiro Campo
    function ExecutarValor(SQL: string; Parametros: array of Variant; ValorDefault: string = ''): Variant; overload;
    function ExecutarValor(SQL: string; ValorDefault: string = ''): Variant; overload;
    function ExisteValor(SQL: string; Parametros: array of Variant): Boolean; overload;
    function ExisteValor(SQL: string): Boolean; overload;
    constructor Create(strConexao: string); overload; virtual;
    constructor Create(ConexaoADO: TADOConnection); overload; virtual;
    destructor Destroy; override;
    procedure IniciaTransacao;
    procedure FinalizaTransacao;
    procedure CancelaTransacao;
    procedure SetClientDataSet(Tabela, Dados: WideString); overload; virtual;
    function TransacaoAtiva: Boolean;

    property Connection: TADOConnection read FConnection write SetConnection;
    property Ambiente: WideString read FAmbiente;
  end;

implementation

uses ConvUtils, Variants;

{ TConexaoADO }

procedure TConexao.CancelaTransacao;
begin
  FConnection.RollbackTrans;
end;

constructor TConexao.Create(strConexao: string);
begin
  inherited Create;
  FConnection := TADOConnection.Create(nil);
  FConnection.ConnectionString := strConexao;
  FConnection.CommandTimeout := 0;
  FConnection.ConnectionTimeout := 60;
  FConnection.LoginPrompt := False;
  FConnection.Open;
end;

constructor TConexao.Create(ConexaoADO: TADOConnection);
begin
  inherited Create;
  FConnection := ConexaoADO;
end;

destructor TConexao.Destroy;
begin
  FConnection.Free;
end;

function TConexao.ExecutarComando(SQL: string): Integer;
var
  Command: TADOCommand;
begin
  Command := TADOCommand.Create(nil);
  try
    // Desabilita Verficação de Parâmetros
    Command.Connection := FConnection;
    Command.ParamCheck := False;
    Command.CommandText := SQL;
    Command.CommandTimeout := 0;
    Command.Execute;
    Result := 0;
  finally
    Command.Free;
  end;
end;

function TConexao.ExecutarDataSet(SQL: string): string;
var
  dts: TADODataSet;
  dsp: TDataSetProvider;
  cds: TClientDataSet;
begin
  dts := TADODataSet.Create(nil);
  dsp := TDataSetProvider.Create(nil);
  cds := TClientDataSet.Create(nil);
  try
    dts.Connection := FConnection;
    // Desabilita Verficação de Parâmetros
    dts.ParamCheck := False;
    dts.CommandText := SQL;
    dts.CommandTimeout := 0;
    dsp.DataSet := dts;
    cds.SetProvider(dsp);
    // Otimização
    dts.CursorLocation := clUseServer;
    dts.CursorType := ctOpenForwardOnly;
    dts.LockType := ltReadOnly;
    cds.Open;
    Result := cds.XMLData;
  finally
    dts.Free;
    dsp.Free;
    cds.Free;
  end;
end;

function TConexao.ExecutarDataSet(SQL: string;
  Parametros: array of Variant): string;
var
  dts: TADODataSet;
  dsp: TDataSetProvider;
  cds: TClientDataSet;
  i: integer;
begin
  dts := TADODataSet.Create(nil);
  dsp := TDataSetProvider.Create(nil);
  cds := TClientDataSet.Create(nil);
  try
    dts.Connection := FConnection;
    dts.CommandText := SQL;
    dts.CommandTimeout := 0;
    dts.Parameters.ParseSQL(SQL, True);
    // Parâmetros
    for i := 0 to (dts.Parameters.Count - 1) do
    begin
      dts.Parameters[i].Value := Parametros[i];
      if dts.Parameters[i].DataType = ftUnknown then
        dts.Parameters[i].DataType := ftInteger;
    end;
    dsp.DataSet := dts;
    cds.SetProvider(dsp);
    // Otimização
    dts.CursorLocation := clUseServer;
    dts.CursorType := ctOpenForwardOnly;
    dts.LockType := ltReadOnly;
    cds.Open;
    Result := cds.XMLData;
  finally
    dts.Free;
    dsp.Free;
    cds.Free;
  end;
end;

function TConexao.ExecutarComando(SQL: string;
  const Parametros: array of Variant): Integer;
var
  Command: TADOCommand;
  i: integer;
begin
  Result := 0;
  Command := TADOCommand.Create(nil);
  try
    Command.Connection := FConnection;
    Command.CommandText := SQL;
    Command.CommandTimeout := 0;
    //Montar parâmetros
    Command.Parameters.ParseSQL(SQL, True);
    for i := 0 to (Command.Parameters.Count - 1) do
    begin
      Command.Parameters[i].Value := Parametros[i];
      if Command.Parameters[i].DataType = ftUnknown then
        Command.Parameters[i].DataType := ftInteger;
    end;
    Command.Execute;
  finally
    Command.Free;
  end;
end;

procedure TConexao.FinalizaTransacao;
begin
  FConnection.CommitTrans;
end;

procedure TConexao.IniciaTransacao;
begin
  FConnection.BeginTrans;
end;

procedure TConexao.SetConnection(const Value: TADOConnection);
begin
  FConnection := Value;
end;

function TConexao.ExecutarProcedure(NomeProcedure: string;  Parametros: array of Variant): string;
var
  stp: TADOStoredProc;
  i: integer;
begin
  stp := TADOStoredProc.Create(nil);
  try
    stp.Connection := FConnection;
    stp.ProcedureName := NomeProcedure;
    stp.CommandTimeout := 0;
    
    // Popula Lista Parâmetros
    stp.Parameters.Refresh;

    for i := 0 to Length(Parametros) -1 do
      stp.Parameters[i+1].Value := Parametros[i];  // Desconsiderar RETURN_VALUE

    stp.ExecProc;

    Result := VarToStr(stp.Parameters.ParamByName('@RETURN_VALUE').Value);
  finally
    stp.Free;
  end;
end;

procedure TConexao.SetClientDataSet(Tabela, Dados: WideString);
var
  dts: TADODataSet;
  dsp: TDataSetProvider;
  cds,
    cdsNew: TClientDataSet;
  Erros: Integer;
begin
  dts := TADODataSet.Create(nil);
  dsp := TDataSetProvider.Create(nil);
  cds := TClientDataSet.Create(nil);
  cdsNew := TClientDataSet.Create(nil);
  try
    dts.Connection := Self.Connection;
    dts.CommandText := Format('SELECT * FROM %s WHERE 1=2', [Tabela]);
    dts.CommandTimeout := 0;
    dsp.DataSet := dts;
    cds.SetProvider(dsp);
    // Otimização
    dts.CursorLocation := clUseServer;
    dts.CursorType := ctOpenForwardOnly;
    dts.LockType := ltReadOnly;
    cds.Open;
    cdsNew.XmlData := Dados;
    cds.Data := cdsNew.Data;
    cds.SetProvider(dsp);
    if cds.ChangeCount > 0 then
    begin
      cds.OnReconcileError := cdsReconcileError;
      Erros := cds.ApplyUpdates(-1);
      if Erros <> 0 then
        raise Exception.Create(MsgErro);
    end;
  finally
    dts.Free;
    dsp.Free;
    cds.Free;
    cdsNew.Free;
  end;
end;

procedure TConexao.cdsReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  MsgErro := E.Message;
end;

function TConexao.TransacaoAtiva: Boolean;
begin
  Result := FConnection.InTransaction;
end;

function TConexao.ExecutarValor(SQL: string; Parametros: array of Variant; ValorDefault: string = ''): Variant;
var
  cdsValor: TClientDataSet;
begin
  Result := Null;
  cdsValor := TClientDataSet.Create(nil);
  try
    cdsValor.XMLData := ExecutarDataSet(SQL, Parametros);
    if (not cdsValor.IsEmpty) then
      Result := cdsValor.Fields[0].Value;
  finally
    cdsValor.Free;
  end;

  // Se Valor Null Aplicar Default
  if (VarIsNull(Result)) and (ValorDefault <> EmptyStr) then
    Result := ValorDefault;

end;

function TConexao.ExecutarValor(SQL: string; ValorDefault: string = ''): Variant;
var
  cdsValor: TClientDataSet;
begin
  Result := Null;
  cdsValor := TClientDataSet.Create(nil);
  try
    cdsValor.XMLData := ExecutarDataSet(SQL);
    if (not cdsValor.IsEmpty) then
      Result := cdsValor.Fields[0].Value;
  finally
    cdsValor.Free;
  end;

  // Se Valor Null Aplicar Default
  if (VarIsNull(Result)) and (ValorDefault <> EmptyStr) then
    Result := ValorDefault;
end;


function TConexao.ExecutarComando(SQL: string; LevantaExceptMultSQL: Boolean): Integer;
var
  Command: TADOCommand;
begin
  Command := TADOCommand.Create(nil);
  try
    // Desabilita Verficação de Parâmetros
    Command.Connection := FConnection;
    Command.ExecuteOptions := [eoExecuteNoRecords];
    Command.ParamCheck := False;
    Command.CommandText := SQL;
    Command.CommandTimeout := 0;
    Command.Execute;
    Result := 0;
  finally
    Command.Free;
  end;
end;

function TConexao.ExisteValor(SQL: string; Parametros: array of Variant): Boolean;
begin
  Result := (not VarIsNull(ExecutarValor(SQL, Parametros)));
end;

function TConexao.ExisteValor(SQL: string): Boolean;
begin
  Result := (not VarIsNull(ExecutarValor(SQL)));
end;


end.

