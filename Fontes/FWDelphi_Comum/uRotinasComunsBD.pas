// Evanio R. Silva
// Rotinas Comuns para Banco Dados
unit uRotinasComunsBD;

interface
uses
  Windows, SysUtils, MidasLib, DBClient, DB, Classes, ADODB;

type
  TRotinasComunsBD = class
  private
    FqryRotinas: TADOQuery;
  public
    constructor Create;
    destructor Destroy; override;

    // Verifica Existência de um BD em um Servidor MSSQL
    function ExisteBancoDadosMSSQLServer(Conexao: TADOConnection; Banco: String): Boolean;
    // Data Hora Servidor MSSQLServer
    function DataHoraServidorMSSQLServer(Conexao: TADOConnection): TDateTime;
    function DataHoraServidorMSSQLServerStr(Conexao: TADOConnection; Mascara: string = ''): string;
    // Backup Banco MSSQLServer
    function ExecutarBackupBDMSSQLServer(Conexao: TADOConnection; Banco, ArqBackup: string): Boolean;
    // Nome Serviço SQLServer
    function NomeServicoSQLServer(Conexao: TADOConnection): string;

    // Versão SQL Server
    function VersaoServidorSQLServer(Conexao: TADOConnection): string;

  end;


function RotinasComunsBD: TRotinasComunsBD;

implementation
uses uRotinasComuns;
var
  FRotinasComuns: TRotinasComunsBD;

constructor TRotinasComunsBD.Create;
begin
  FqryRotinas := TADOQuery.Create(nil);
end;

function TRotinasComunsBD.DataHoraServidorMSSQLServer(Conexao: TADOConnection): TDateTime;
begin
  FqryRotinas.Connection := Conexao;
  FqryRotinas.SQL.Text := 'SELECT GETDATE()';
  FqryRotinas.Open;

  Result := FqryRotinas.Fields[0].AsDateTime;
end;

function TRotinasComunsBD.DataHoraServidorMSSQLServerStr(Conexao: TADOConnection; Mascara: string  = ''): string;
begin
  if Mascara = EmptyStr then
   Mascara := 'dd/MM/yyyy hh:MM:ss';
  Result := FormatDateTime(Mascara, DataHoraServidorMSSQLServer(Conexao));
end;

destructor TRotinasComunsBD.Destroy;
begin
  FqryRotinas.Free;
end;
// Retorna a primeira instância criada
function RotinasComunsBD: TRotinasComunsBD;
begin
  if FRotinasComuns = nil then
    FRotinasComuns := TRotinasComunsBD.Create;

  Result := FRotinasComuns;
end;

function TRotinasComunsBD.ExecutarBackupBDMSSQLServer(Conexao: TADOConnection; Banco, ArqBackup: string): Boolean;
begin 
  Result := True;
  try
    FqryRotinas.Connection := Conexao;
    FqryRotinas.SQL.Text := Format('BACKUP DATABASE %s TO DISK = %s WITH INIT', [Banco, QuotedStr(ArqBackup)]);
    FqryRotinas.ExecSQL;
  except
    Result := False;
  end;
end;

function TRotinasComunsBD.ExisteBancoDadosMSSQLServer(Conexao: TADOConnection; Banco: String): Boolean;
begin
  FqryRotinas.Connection := Conexao;
  FqryRotinas.SQL.Text := Format('SELECT DB_ID(%s)', [QuotedStr(Banco)]);
  FqryRotinas.Open;

  Result := (not FqryRotinas.Fields[0].IsNull);
end;

function TRotinasComunsBD.NomeServicoSQLServer(Conexao: TADOConnection): string;
begin
  FqryRotinas.Connection := Conexao;
  FqryRotinas.SQL.Text := 'SELECT @@SERVICENAME';
  FqryRotinas.Open;

  if (FqryRotinas.Fields[0].AsString <> 'MSSQLSERVER') then
    Result := 'MSSQL$' +  FqryRotinas.Fields[0].AsString
  else
    Result := FqryRotinas.Fields[0].AsString;
end;

function TRotinasComunsBD.VersaoServidorSQLServer(Conexao: TADOConnection): string;
begin
  FqryRotinas.Connection := Conexao;
  FqryRotinas.SQL.Text := 'SELECT CAST(SERVERPROPERTY(''productversion'') AS CHAR(4))';
  FqryRotinas.Open;

  Result := FqryRotinas.Fields[0].AsString;
end;

end.


