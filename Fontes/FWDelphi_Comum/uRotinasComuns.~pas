// Evanio R. Silva
// Obs: Estas rotinas são utilizadas também em WebServices. Units que referenciam controles visuais não devem ser utilizadas.
unit uRotinasComuns;

interface

uses
  Windows, SysUtils, MidasLib, DBClient, DB, HtmlHlp, uMSWord, Classes, JvCreateProcess, JclSvcCtrl, XMLxform,
  IdSMTP, IdMessage, JvZlibMultiple, JvSHFileOperation, JvRegistry, JwaLMShare, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, JvComponentBase, JvSearchFiles, IdFTP, IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL, IdText, IdExplicitTLSClientServerBase,
  IdAttachment, IdAttachmentFile, WinInet, ZipMstr, JclSysInfo, JwaWinBase, JwaWtsApi32, JwaWinCrypt, IdSNTP,
  IdFTPCommon, JvgProcessUtils, JclMiscel;

const
  ChaveCripto = 255;
  MesExtenso: array[1..12] of string = ('Janeiro', 'Fevereiro', 'Março', 'Abril',
    'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro');
  MesAbrev: array[1..12] of string = ('Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun',
    'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez');

  //Dias da Semana
  DiaSemana: array[1..7] of string = ('Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado');
  DiaSemanaAbrev: array[1..7] of string = ('Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab');
  DiaSemanaExtenso: array[1..7] of string = ('Domingo', 'Segunda-Feira', 'Terça-Feira', 'Quarta-Feira', 'Quinta-Feira', 'Sexta-Feira', 'Sábado');

  //Versão Windows
  Windows311 = 0;
  Windows95 = 1;
  Windows98 = 2;
  WindowsMe = 3;
  WindowsNT351 = 4;
  WindowsNT40 = 5;
  Windows2000 = 6;
  WindowsXP = 7;
  Windows2003Server = 8;
  WindowsVista = 9;
  Windows7 = 10;
  Windows8 = 11;
  Windows9 = 12;
  Windows10 = 13;

  DescVersaoWindows: array[0..12] of string =
  (
    'Windows311',
    'Windows95',
    'Windows98',
    'WindowsMe',
    'WindowsNT351',
    'WindowsNT40',
    'Windows2000',
    'WindowsXP',
    'Windows2003Server',
    'Windows7',
    'Windows8',
    'Windows9',
    'Windows10'
  );

  //Nomes Serviços
  ServSQLServer = 'MSSQLSERVER';
  ServSQLServerAgent = 'SQLSERVERAGENT';
  ServAdmIIS = 'IISADMIN';
  ServPublicWWW = 'W3SVC';

  AcaoAtivarServico = 1;
  AcaoDesativarServico = 2;

  // % CPU
  SystemBasicInformation = 0;
  SystemPerformanceInformation = 2;
  SystemTimeInformation = 3;

  KEY_WOW64_32KEY = $0200;   // Compatibilidade Win64/Win32
var
  UrlHelp: string; // Path Arquivo Help

type
  
  // EMAIL
  TParametrosEmail = record
    Servidor: string;
    Porta: string;
    Usuario: string;
    Senha: string;
    EmailOrigem: string;
    NomeEmailOrigem: string;
    Autenticacao: Boolean;
    SSL: Boolean;
  end;

  TMetodoAppProcessMessage = procedure of object; // Atribui Método Application.ProcessMessage

  TPDWord = ^DWORD;

  TSystem_Basic_Information = packed record
    dwUnknown1: DWORD;
    uKeMaximumIncrement: ULONG;
    uPageSize: ULONG;
    uMmNumberOfPhysicalPages: ULONG;
    uMmLowestPhysicalPage: ULONG;
    uMmHighestPhysicalPage: ULONG;
    uAllocationGranularity: ULONG;
    pLowestUserAddress: Pointer;
    pMmHighestUserAddress: Pointer;
    uKeActiveProcessors: ULONG;
    bKeNumberProcessors: byte;
    bUnknown2: byte;
    wUnknown3: word;
  end;

  TSystem_Performance_Information = packed record
    liIdleTime: LARGE_INTEGER; {LARGE_INTEGER}
    dwSpare: array[0..75] of DWORD;
  end;

  TSystem_Time_Information = packed record
    liKeBootTime: LARGE_INTEGER;
    liKeSystemTime: LARGE_INTEGER;
    liExpTimeZoneBias: LARGE_INTEGER;
    uCurrentTimeZoneId: ULONG;
    dwReserved: DWORD;
  end;

var
  // % CPU
  NtQuerySystemInformation: function(infoClass: DWORD;
    buffer: Pointer;
    bufSize: DWORD;
    returnSize: TPDword): DWORD; stdcall = nil;

  liOldIdleTime: LARGE_INTEGER = ();
  liOldSystemTime: LARGE_INTEGER = ();

  // Criptografia
function CriptoDescriptoString(Valor: string): string;

function ValidarCNPJ(CNPJ: string): Boolean;

function ValidarCPF(CPF: string): Boolean;

function ConverteAnsiAscii(Str: string): string;

// Física/Jurídica
function PreencheCdsTipoPessoa(FlgAmbos: Boolean = False): string;

// Help
procedure ExibeHelp(Topico: string); overload;

procedure ExibeHelp(Path, Topico: string); overload;

// Devolve cds Dias da Semana
function PreencheCdsDiaSemana: string;

//Exibe a data por extenso
function DataPorExtenso(Data: TDateTime): string;

//Validação de Email
function ValidarEmail(email: string): Boolean;

//Remover acentos
function RemoveAcento(Str: string): string;

//Verifica se a string possui acentos
function PossuiAcento(Str: string): Boolean;

// Remove Carac. Especiais
function RemoverCaracteresEspeciais(Str: string): string;

// Retorna Versão Windows
function VersaoWindows: Integer; 
                         
// Retorna Versão Aplicativo
function VersaoAplicativo(Executavel: string): string;

//Retorna o Mês por Extenso
function MesPorExtenso(Data: TDateTime; Abrev: Boolean = False): string;

// Criar Arquivo Word
function CriarArquivoWord(Path, Nome: string; ModeloDoc: string = ''; Substituir: Boolean = False): string;

function ExcluirArquivo(Arquivo: string): Boolean;

// Recebe o nome de um arquivo e devolve o nome SEM a extensão
function NomeArquivoSemExtensao(Arquivo: string): string;

function GetWindowsTemp: string;

//Retorna uma string com zeros preenchidos à esquerda
function StrZero(Numero: Integer; Digitos: Integer): string;

//Executa Comando e continua processamento
procedure ExecutarComando(Comando: string; Visivel: Boolean = True);

//Executa Comando e espera até finalizar
function ExecutarComandoEAguardar(Comando: string; MetodoAppProcMsg: TMetodoAppProcessMessage = nil; Visivel: Boolean = false): Boolean;

//Executa Comando Contexto Usuário Logado
procedure ExecutarComandoContextoUsuLogado(Comando: string; Visivel: Boolean = True);

// Habilita AutoStart MSSQL
function HabilitarAutoStartMSSQL: Boolean;
// Ativar Servico MSSQL
function AtivarServicoMSSQL: Boolean;
// Verifica Ativação MSSSQLServer - MSDE
function ServicoMSSSQLServerAtivado: Boolean;
// Verifica Instalação MSSSQLServer - MSDE
function ServicoMSSSQLServerInstalado: Boolean;

function GetTmpDir: string;
function GetTmpFileName(ext: string): string;

//Ativar desativar serviços
function AtivarDesativarServico(NomeServico: string; Acao: Integer): Boolean;

function ServicoAtivo(DescServico: string): Boolean;

function DescServidorBanco(StringConexao: string): string;

function TransformarCdsXml(PathXML, NomeArquivo, Dados: string): string;

function ServidorEmailConectado(ParamEmail: TParametrosEmail; var MsgErro: string): Boolean;

function EnviarEmail(ParamEmail: TParametrosEmail; EmailsDestino, Assunto, Msg: string; ConfLeitura: Boolean = False;
  Anexos: string = ''; CopiasOcultas: string = ''): string;
// Uso CPU
function PercentualUsoCPU(MetodoAppProcMsg: TMetodoAppProcessMessage): Integer;

function AplicativoEmExecucao(ClassePrincipal: string): Boolean;
// Compatar Arqs. Não compatível com WINZIP
procedure CompactarArquivos(ArquivosOrigem: TStrings; ArquivoDestino: string); overload;
procedure CompactarArquivos(PastaOrigem: string; ArquivoDestino: string); overload;
// Descompatar Arqs. Não compatível com WINZIP
procedure DescompactarArquivos(ArquivoOrigem: string; PathDestino: string);
// Verifica Existência Arq. na Pasta
function PastaVazia(Pasta: string): Boolean;
// Excluir Arqs Pasta
procedure EsvaziarPasta(Pasta: string);
// Valor Chave Registro Windows
function ValorChaveRegistroStr(Chave: HKEY; SubChave, Atributo: string; ValorDefault: string = ''): string; overload;
function ValorChaveRegistroInt(Chave: HKEY; SubChave, Atributo: string; ValorDefault: Integer = 0): integer; overload;
// Persistir Chave Registro Windows
function PersistirChaveRegistroStr(Chave: HKEY; SubChave, Atributo, NovoValor: string): string; overload;
function PersistirChaveRegistroInt(Chave: HKEY; SubChave, Atributo: string; NovoValor: integer): string; overload;
procedure ExcluirChaveRegistroStr(Chave: HKEY; SubChave, Atributo: string); overload;
procedure ExcluirChaveRegistroStr(Chave: HKEY; SubChave: string); overload;

// Retorna Valor Numérico de uma String
function ValorNumerico(Str: string; VlrDefault: Integer = -1): Int64;

// Compartilhar Pasta Computador
function CompartilharPasta(Servidor, Pasta, NomeRecurso, Descricao: string): Boolean;

function Split(Str: string; Separador: Char; Posicao: Integer): string;

function ListaArquivosPasta(Pasta: string; Mascaras: string = ''): string;

function WebConectado: boolean;

function MacAdress: string;

function UploadArquivo(HostProxy, UsuarioProxy, SenhaProxy, Host, Usuario, Senha, NomeArqOrigem, NomeArqDestino: string): Boolean;

function DownloadArquivo(HostProxy, UsuarioProxy, SenhaProxy, Host, Usuario, Senha, NomeArqOrigem, NomeArqDestino: string; Substituir: Boolean = True): Boolean;

function MD5(const Input: String): string;

// Devolve Array de string
function ArrayString(S: String; Separador: char): TStringList;

function ConteudoArqTexto(Path: string): string;

function NomeComputador: string;

function StreamToString(Stream: TStream): string;

procedure SincronizarHora(Servidor: string); // SNTP:Porta

function PastaWindows: string;

function ExisteServico(Nome: string): Boolean;

function ProcessoCarregado(PathExeProc: string): Boolean;

procedure EncerrarProcesso(NomeProc: string);

procedure Boot;

function ExisteArquivo(Arquivo: string): Boolean;

function GetCurrentUserSid: string;

implementation

uses
  DateUtils, uConstantesComuns;

function CriptoDescriptoString(Valor: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(Valor) do
    Result := Result + Char(not (ord(Valor[I]) - ChaveCripto));
end;

function ValidarCNPJ(CNPJ: string): Boolean;
var
  n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12: integer;
  d1, d2: integer;
  digitado, calculado: string;
begin
  Result := False;

  if Length(CNPJ) < 14 then
    Exit;

  n1 := StrToIntDef(CNPJ[1], 0);
  n2 := StrToIntDef(CNPJ[2], 0);
  n3 := StrToIntDef(CNPJ[3], 0);
  n4 := StrToIntDef(CNPJ[4], 0);
  n5 := StrToIntDef(CNPJ[5], 0);
  n6 := StrToIntDef(CNPJ[6], 0);
  n7 := StrToIntDef(CNPJ[7], 0);
  n8 := StrToIntDef(CNPJ[8], 0);
  n9 := StrToIntDef(CNPJ[9], 0);
  n10 := StrToIntDef(CNPJ[10], 0);
  n11 := StrToIntDef(CNPJ[11], 0);
  n12 := StrToIntDef(CNPJ[12], 0);
  d1 := n12 * 2 + n11 * 3 + n10 * 4 + n9 * 5 + n8 * 6 + n7 * 7 + n6 * 8 + n5 * 9 + n4 * 2 + n3 * 3 + n2 * 4 + n1 * 5;
  d1 := 11 - (d1 mod 11);
  if d1 >= 10 then
    d1 := 0;
  d2 := d1 * 2 + n12 * 3 + n11 * 4 + n10 * 5 + n9 * 6 + n8 * 7 + n7 * 8 + n6 * 9 + n5 * 2 + n4 * 3 + n3 * 4 + n2 * 5 + n1 * 6;
  d2 := 11 - (d2 mod 11);
  if d2 >= 10 then
    d2 := 0;
  calculado := inttostr(d1) + inttostr(d2);
  digitado := CNPJ[13] + CNPJ[14];

  Result := (calculado = digitado);
end;

function ValidarCPF(CPF: string): Boolean;
var
  n1, n2, n3, n4, n5, n6, n7, n8, n9: integer;
  d1, d2: integer;
  digitado, calculado: string;
begin
  Result := False;

  if Length(CPF) < 11 then
    Exit;

  n1 := StrToIntDef(CPF[1], 0);
  n2 := StrToIntDef(CPF[2], 0);
  n3 := StrToIntDef(CPF[3], 0);
  n4 := StrToIntDef(CPF[4], 0);
  n5 := StrToIntDef(CPF[5], 0);
  n6 := StrToIntDef(CPF[6], 0);
  n7 := StrToIntDef(CPF[7], 0);
  n8 := StrToIntDef(CPF[8], 0);
  n9 := StrToIntDef(CPF[9], 0);
  d1 := n9 * 2 + n8 * 3 + n7 * 4 + n6 * 5 + n5 * 6 + n4 * 7 + n3 * 8 + n2 * 9 + n1 * 10;
  d1 := 11 - (d1 mod 11);
  if d1 >= 10 then
    d1 := 0;
  d2 := d1 * 2 + n9 * 3 + n8 * 4 + n7 * 5 + n6 * 6 + n5 * 7 + n4 * 8 + n3 * 9 + n2 * 10 + n1 * 11;
  d2 := 11 - (d2 mod 11);
  if d2 >= 10 then
    d2 := 0;
  calculado := inttostr(d1) + inttostr(d2);
  digitado := CPF[10] + CPF[11];
  Result := (calculado = digitado);
end;

function ConverteAnsiAscii(Str: string): string;
var
  i: Integer;
begin
  for i := 1 to Length(str) do
  begin
    case str[i] of
      'á': str[i] := 'a';
      'é': str[i] := 'e';
      'í': str[i] := 'i';
      'ó': str[i] := 'o';
      'ú': str[i] := 'u';
      'à': str[i] := 'a';
      'è': str[i] := 'e';
      'ì': str[i] := 'i';
      'ò': str[i] := 'o';
      'ù': str[i] := 'u';
      'â': str[i] := 'a';
      'ê': str[i] := 'e';
      'î': str[i] := 'i';
      'ô': str[i] := 'o';
      'û': str[i] := 'u';
      'ä': str[i] := 'a';
      'ë': str[i] := 'e';
      'ï': str[i] := 'i';
      'ö': str[i] := 'o';
      'ü': str[i] := 'u';
      'ã': str[i] := 'a';
      'õ': str[i] := 'o';
      'ñ': str[i] := 'n';
      'ç': str[i] := 'c';
      'Á': str[i] := 'A';
      'É': str[i] := 'E';
      'Í': str[i] := 'I';
      'Ó': str[i] := 'O';
      'Ú': str[i] := 'U';
      'À': str[i] := 'A';
      'È': str[i] := 'E';
      'Ì': str[i] := 'I';
      'Ò': str[i] := 'O';
      'Ù': str[i] := 'U';
      'Â': str[i] := 'A';
      'Ê': str[i] := 'E';
      'Î': str[i] := 'I';
      'Ô': str[i] := 'O';
      'Û': str[i] := 'U';
      'Ä': str[i] := 'A';
      'Ë': str[i] := 'E';
      'Ï': str[i] := 'I';
      'Ö': str[i] := 'O';
      'Ü': str[i] := 'U';
      'Ã': str[i] := 'A';
      'Õ': str[i] := 'O';
      'Ñ': str[i] := 'N';
      'Ç': str[i] := 'C';
    end;
  end;
  Result := Str;
end;

function PreencheCdsDiaSemana: string;
var
  cdsDiaSemana: TClientDataSet;
begin
  cdsDiaSemana := TClientDataSet.Create(nil);
  try
    cdsDiaSemana.FieldDefs.Add('ID', ftAutoInc);
    cdsDiaSemana.FieldDefs.Add('Dia', ftString, 10);
    cdsDiaSemana.FieldDefs.Add('DiaAbrev', ftString, 10);
    cdsDiaSemana.CreateDataSet;
    // Dias
    cdsDiaSemana.Append;
    cdsDiaSemana.FieldByName('Dia').Value := 'Domingo';
    cdsDiaSemana.FieldByName('DiaAbrev').Value := 'Dom';

    cdsDiaSemana.Append;
    cdsDiaSemana.FieldByName('Dia').Value := 'Segunda';
    cdsDiaSemana.FieldByName('DiaAbrev').Value := 'Seg';

    cdsDiaSemana.Append;
    cdsDiaSemana.FieldByName('Dia').Value := 'Terça';
    cdsDiaSemana.FieldByName('DiaAbrev').Value := 'Ter';

    cdsDiaSemana.Append;
    cdsDiaSemana.FieldByName('Dia').Value := 'Quarta';
    cdsDiaSemana.FieldByName('DiaAbrev').Value := 'Qua';

    cdsDiaSemana.Append;
    cdsDiaSemana.FieldByName('Dia').Value := 'Quinta';
    cdsDiaSemana.FieldByName('DiaAbrev').Value := 'Qui';

    cdsDiaSemana.Append;
    cdsDiaSemana.FieldByName('Dia').Value := 'Sexta';
    cdsDiaSemana.FieldByName('DiaAbrev').Value := 'Sex';

    cdsDiaSemana.Append;
    cdsDiaSemana.FieldByName('Dia').Value := 'Sábado';
    cdsDiaSemana.FieldByName('DiaAbrev').Value := 'Sáb';
    cdsDiaSemana.Post;

    Result := cdsDiaSemana.XMLData;

  finally
    cdsDiaSemana.Free;
  end;
end;

function PreencheCdsTipoPessoa(FlgAmbos: Boolean = False): string;
var
  cdsTipoPessoa: TClientDataSet;
begin
  cdsTipoPessoa := TClientDataSet.Create(nil);
  try
    // Campos
    cdsTipoPessoa.FieldDefs.Add('ID', ftAutoInc);
    cdsTipoPessoa.FieldDefs.Add('TipoPes', ftString, 1);
    cdsTipoPessoa.FieldDefs.Add('DesTipo', ftString, 10);
    cdsTipoPessoa.CreateDataSet;

    if FlgAmbos then
    begin
      cdsTipoPessoa.Append;
      cdsTipoPessoa.FieldByName('TipoPes').Value := 'A';
      cdsTipoPessoa.FieldByName('DesTipo').Value := 'Ambos';
      cdsTipoPessoa.Post;
    end;

    cdsTipoPessoa.Append;
    cdsTipoPessoa.FieldByName('TipoPes').Value := 'F';
    cdsTipoPessoa.FieldByName('DesTipo').Value := 'Física';
    cdsTipoPessoa.Post;

    cdsTipoPessoa.Append;
    cdsTipoPessoa.FieldByName('TipoPes').Value := 'J';
    cdsTipoPessoa.FieldByName('DesTipo').Value := 'Jurídica';
    cdsTipoPessoa.Post;

    Result := cdsTipoPessoa.XMLData;
  finally
    cdsTipoPessoa.Free;
  end;
end;
// Help

procedure ExibeHelp(Topico: string);
begin
//  HtmlHelp(0, PChar(Format('%s::\%s.htm', [UrlHelp, Topico])), HH_DISPLAY_TOPIC, 0);
end;

function DataPorExtenso(Data: TDateTime): string;
begin
  Result := FormatDateTime('dd "de" mmmm "de" yyyy', Data);
end;

function ValidarEmail(email: string): Boolean;
// Retorna True se o email for válido
const
  // Valid characters in an "atom"
  atom_chars = [#33..#255] - ['(', ')', '<', '>', '@', ',', ';', ':',
    '\', '/', '"', '.', '[', ']', #127];
  // Valid characters in a "quoted-string"
  quoted_string_chars = [#0..#255] - ['"', #13, '\'];
  // Valid characters in a subdomain
  letters = ['A'..'Z', 'a'..'z'];
  letters_digits = ['0'..'9', 'A'..'Z', 'a'..'z'];
  subdomain_chars = ['-', '0'..'9', 'A'..'Z', 'a'..'z'];
type
  States = (STATE_BEGIN, STATE_ATOM, STATE_QTEXT, STATE_QCHAR,
    STATE_QUOTE, STATE_LOCAL_PERIOD, STATE_EXPECTING_SUBDOMAIN,
    STATE_SUBDOMAIN, STATE_HYPHEN);
var
  State: States;
  i, n, subdomains: Integer;
  c: Char;
begin
  State := STATE_BEGIN;
  n := Length(email);
  i := 1;
  subdomains := 1;
  while (i <= n) do
  begin
    c := email[i];
    case State of
      STATE_BEGIN:
        if c in atom_chars then
          State := STATE_ATOM
        else if c = '"' then
          State := STATE_QTEXT
        else
          break;
      STATE_ATOM:
        if c = '@' then
          State := STATE_EXPECTING_SUBDOMAIN
        else if c = '.' then
          State := STATE_LOCAL_PERIOD
        else if not (c in atom_chars) then
          break;
      STATE_QTEXT:
        if c = '\' then
          State := STATE_QCHAR
        else if c = '"' then
          State := STATE_QUOTE
        else if not (c in quoted_string_chars) then
          break;
      STATE_QCHAR:
        State := STATE_QTEXT;
      STATE_QUOTE:
        if c = '@' then
          State := STATE_EXPECTING_SUBDOMAIN
        else if c = '.' then
          State := STATE_LOCAL_PERIOD
        else
          break;
      STATE_LOCAL_PERIOD:
        if c in atom_chars then
          State := STATE_ATOM
        else if c = '"' then
          State := STATE_QTEXT
        else
          break;
      STATE_EXPECTING_SUBDOMAIN:
        if c in letters then
          State := STATE_SUBDOMAIN
        else
          break;
      STATE_SUBDOMAIN:
        if c = '.' then
        begin
          inc(subdomains);
          State := STATE_EXPECTING_SUBDOMAIN
        end
        else if c = '-' then
          State := STATE_HYPHEN
        else if not (c in letters_digits) then
          break;
      STATE_HYPHEN:
        if c in letters_digits then
          State := STATE_SUBDOMAIN
        else if c <> '-' then
          break;
    end;
    inc(i);
  end;
  if i <= n then
    Result := False
  else
    Result := (State = STATE_SUBDOMAIN) and (subdomains >= 2);
end;

function RemoveAcento(Str: string): string;
const
  ComAcento = 'àâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜ';
  SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
var
  x: Integer;
begin
  ;
  for x := 1 to Length(Str) do
    if Pos(Str[x], ComAcento) <> 0 then
      Str[x] := SemAcento[Pos(Str[x], ComAcento)];
  Result := Str;
end;

function PossuiAcento(Str: string): Boolean;
const
  ComAcento = 'àâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜ';
  SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
var
  x: Integer;
begin
  ;
  Result := False;
  for x := 1 to Length(Str) do
  begin
    if Pos(Str[x], ComAcento) <> 0 then
    begin
      Result := True;
      Break;
    end;
  end;
end;

function VersaoWindows: Integer;
var
  VersionInfo: TOSVersionInfo;
begin
  Result := -1;
  VersionInfo.dwOSVersionInfoSize := SizeOf(VersionInfo);
  Windows. GetVersionEx(VersionInfo);
  case VersionInfo.dwPlatformId of
    0: Result := Windows311;
    1:
      case VersionInfo.dwMinorVersion of
        0: Result := Windows95;
        10: Result := Windows98;
        90: Result := WindowsMe;
      end;
    2:
      case VersionInfo.dwMajorVersion of
        3: Result := WindowsNT351;
        4: Result := WindowsNT40;
        5:
          case VersionInfo.dwMinorVersion of
            0: Result := Windows2000;
            1: Result := WindowsXP;
            2: Result := Windows2003Server;
          end;
        6: Result := WindowsVista;
        7: Result := Windows7;
        8: Result := Windows8;
        9: Result := Windows9;
        10: Result := Windows10;
      end;
  end;
end;

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

function MesPorExtenso(Data: TDateTime; Abrev: Boolean = False): string;
begin
  if Abrev then
    Result := MesAbrev[MonthOf(Data)]
  else
    Result := MesExtenso[MonthOf(Data)];
end;

procedure ExibeHelp(Path, Topico: string);
begin
  if Topico = EmptyStr then
    HtmlHelp(0, PChar(Format('%s', [Path])), HH_DISPLAY_TOPIC, 0)
  else
    HtmlHelp(0, PChar(Format('%s::\%s.htm', [Path, Topico])), HH_DISPLAY_TOPIC, 0);
end;


function CriarArquivoWord(Path, Nome: string; ModeloDoc: string = ''; Substituir: Boolean = False): string;
var
  FPath, FArquivo: string;
  FWord: TWord;
begin
  Result := EmptyStr;
  FWord := TWord.Create;
  try
    FPath := Trim(Path);
    if not FileExists(ModeloDoc) then
      ModeloDoc := 'normal';
    FArquivo := FPath + '\' + Nome + '.doc';
    if (not Substituir) and (FileExists(FArquivo)) then
    begin
      raise Exception.Create('Arquivo já existe. Escolha outro nome.');
    end
    else
    begin
      try
        FWord.Novo(ModeloDoc);
        FWord.SalvarComo(FArquivo);
        FWord.Fechar;

        // Devolve Path Completo Arquivo
        Result := FArquivo;
      except
        raise Exception.Create('Arquivo Word não foi criado.');
      end;
    end
  finally
    FWord.Destroy;
  end;
end;

function ExcluirArquivo(Arquivo: string): Boolean;
begin
  Result := (FileExists(Arquivo)) and (DeleteFile(PChar(Arquivo)));
end;

function GetWindowsTemp: string;
var
  Buffer: array[0..MAX_PATH] of Char;
  FDir: string;
begin
  GetTempPath(SizeOf(Buffer), Buffer);
  FDir := Buffer;
  FDir := Trim(FDir);
  if Copy(FDir, Length(FDir), 1) = '\' then
    FDir := Copy(FDir, 1, Length(FDir) - 1);

  Result := FDir;
end;

function NomeArquivoSemExtensao(Arquivo: string): string;
var
  Ext : string;
  Posicao : Integer;
begin
  Ext    := ExtractFileExt(Arquivo);
  Result := ExtractFileName(Arquivo);
  if Ext <> '' then
  begin
    Posicao := Pos(Ext, Result);
    if (Posicao > 0) then
    begin
      Delete(Result, Posicao, Length(Ext));
    end;
  end;
end;

function StrZero(Numero: Integer; Digitos: Integer): string;
var
  i: Integer;
  Texto: string;
  Tamanho: integer;
begin
  Texto := InttoStr(Numero);
  Tamanho := Digitos - Length(Texto);
  for i := 1 to Tamanho do
  begin
    Texto := '0' + Texto;
  end;
  Result := Texto;
end;

procedure ExecutarComando(Comando: string; Visivel: Boolean);
var
  Processo: TJvCreateProcess;
begin
  Processo := TJvCreateProcess.Create(nil);
  try
    if not Visivel then
    begin
      Processo.StartupInfo.DefaultWindowState := False;
      Processo.StartupInfo.ShowWindow := swHide;
    end;
    Processo.CommandLine := Comando;
    Processo.Run;
  finally
    Processo.Free;
  end;
end;

procedure ExecutarComandoContextoUsuLogado(Comando: string; Visivel: Boolean);
var
  hToken: THandle;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  Retorno: Boolean;
  Contador: Integer;
begin
  Contador := 100;
  GetStartupInfo(StartupInfo);

  if WTSQueryUserToken(WTSGetActiveConsoleSessionId, hToken) then
  begin
    Retorno := CreateProcessAsUser(hToken, PAnsiChar(Comando), nil, nil, nil, False, CREATE_NEW_CONSOLE, nil, nil, StartupInfo, ProcessInfo);

    while Contador > 0 do
    begin
      if Retorno then
      begin
        WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
        Break;
      end;
      Dec(Contador);
    end;
  end;
end;

function ExecutarComandoEAguardar(Comando: string; MetodoAppProcMsg: TMetodoAppProcessMessage = nil; Visivel: Boolean = false): Boolean;
var
  zAppName: array[0..768] of Char;
  zCurDir: array[0..255] of Char;
  WorkDir: string;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  Retorno: Cardinal;
begin
  Retorno := 1;
  StrPCopy(zAppName, Comando);
  GetDir(0, WorkDir);
  StrPCopy(zCurDir, WorkDir);
  FillChar(StartupInfo, SizeOf(StartupInfo), #0);
  StartupInfo.cb := SizeOf(StartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  if Visivel then
    StartupInfo.wShowWindow := SW_SHOW
  else
    StartupInfo.wShowWindow := SW_HIDE;
  if CreateProcess(nil, zAppName, nil, nil, False, (CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS), nil, nil, StartupInfo, ProcessInfo) then
  begin
    while Assigned(MetodoAppProcMsg) and (WaitForSingleObject(ProcessInfo.hProcess, 0) = WAIT_TIMEOUT) do
    begin
      MetodoAppProcMsg;
      Sleep(50);
    end;
    WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
    GetExitCodeProcess(ProcessInfo.hProcess, Retorno);
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);
  end;
  Result := (Retorno = 0);
end;

function HabilitarAutoStartMSSQL: Boolean;
var
  FSCManager: TJclSCManager; // Container de Serviços
  Servico: TJCLNTService;
begin
  Result := False;
  FSCManager := TJclSCManager.Create;
  try
    FSCManager.Active := True;
    FSCManager.Refresh(True);
    // SQL
    FSCManager.FindService('MSSQL$SQLEXPRESS', Servico);
    if Assigned(Servico) then
    begin
      Servico.StartType := sstAuto;
      Servico.Commit;
      Result := True;
    end;
    // Agente
    FSCManager.FindService('SQLAgent$SQLEXPRESS', Servico);
    if Assigned(Servico) then
    begin
      Servico.StartType := sstAuto;
      Servico.Commit;
    end;
  finally
    FSCManager.Free;
  end;
end;

function AtivarServicoMSSQL: Boolean;
var
  FSCManager: TJclSCManager; // Container de Serviços
  Servico: TJCLNTService;
begin
  Result := False;
  FSCManager := TJclSCManager.Create;
  try
    // SQL
    FSCManager.Active := True;
    FSCManager.Refresh(True);
    FSCManager.FindService('MSSQL$SQLEXPRESS', Servico);
    if Assigned(Servico) then
    begin
      if Servico.ServiceState <> ssRunning then
        Servico.Start;
      Result := True;
    end;
    // Agente
    FSCManager.Refresh(True);
    FSCManager.FindService('SQLAgent$SQLEXPRESS', Servico);
    if Assigned(Servico) then
    begin
      if Servico.ServiceState <> ssRunning then
        Servico.Start;
    end;
  finally
    FSCManager.Free;
  end;
end;

function ServicoMSSSQLServerAtivado: Boolean;
var
  FSCManager: TJclSCManager; // Container de Serviços
  Servico: TJCLNTService;
begin
  FSCManager := TJclSCManager.Create;
  try
    // SQL
    FSCManager.Active := True;
    FSCManager.Refresh(True);
    FSCManager.FindService('MSSQL$SQLEXPRESS', Servico);
    Result := (Assigned(Servico)) and (Servico.ServiceState = ssRunning);
  finally
    FSCManager.Free;
  end;
end;

function ServicoMSSSQLServerInstalado: Boolean;
var
  FSCManager: TJclSCManager; // Container de Serviços
  Servico: TJCLNTService;
begin
  FSCManager := TJclSCManager.Create;
  try
    // SQL
    FSCManager.Active := True;
    FSCManager.Refresh(True);
    FSCManager.FindService('MSSQL$SQLEXPRESS', Servico);
    Result := (Assigned(Servico));
  finally
    FSCManager.Free;
  end;
end;

function GetTmpDir: string;
var
  pc: PChar;
begin
  pc := StrAlloc(MAX_PATH + 1);
  GetTempPath(MAX_PATH, pc);
  Result := string(pc);
  StrDispose(pc);
end;

function GetTmpFileName(ext: string): string;
var
  pc: PChar;
begin
  pc := StrAlloc(MAX_PATH + 1);
  GetTempFileName(PChar(GetTmpDir), 'EZC', 0, pc);
  Result := string(pc);
  Result := ChangeFileExt(Result, ext);
  StrDispose(pc);
end;

function AtivarDesativarServico(NomeServico: string; Acao: Integer): Boolean;
begin
  if Acao = AcaoAtivarServico then
    ExecutarComandoEAguardar(Format('NET START %s', [NomeServico]))
  else
    ExecutarComandoEAguardar(Format('NET STOP %s', [NomeServico]));
  Result := True;  
end;

function DescServidorBanco(StringConexao: string): string;
var
  stlLista: TStringList;
  FServidor, FBanco: string;
begin
  FServidor := EmptyStr;
  FBanco := EmptyStr;
  stlLista := TStringList.Create;
  try
    stlLista.Delimiter := ';';
    stlLista.DelimitedText := StringReplace(UpperCase(StringConexao), ' ', '_', [rfReplaceAll]);
    FServidor := stlLista.Values['DATA_SOURCE'];
    FBanco := stlLista.Values['INITIAL_CATALOG'];
  finally
    stlLista.Free;
  end;
  Result := Format('%s.%s', [FServidor, FBanco]);
end;

function TransformarCdsXml(PathXML, NomeArquivo, Dados: string): string;
var
  XmlTransf: TXMLTransform;
  FArquivo: string;
begin
  FArquivo := Format('%s\%s', [PathXML, NomeArquivo]);
  if not FileExists(FArquivo) then
    Result := EmptyStr
  else
  begin
    XmlTransf := TXMLTransform.Create(nil);
    try
      XmlTransf.SourceXml := Dados;
      XmlTransf.TransformationFile := FArquivo;
      Result := XmlTransf.Data;
    finally
      XmlTransf.Free;
    end;
  end;
end;

function ServicoAtivo(DescServico: string): Boolean;
var
  FSCManager: TJclSCManager; // Container de Serviços
  Servico: TJCLNTService;
begin
  //  Result := False;
  FSCManager := TJclSCManager.Create;
  try
    // SQL
    FSCManager.Active := True;
    FSCManager.Refresh(True);
    FSCManager.FindService(DescServico, Servico);
    Result := (Assigned(Servico)) and (Servico.ServiceState = ssRunning);
  finally
    FSCManager.Free;
  end;
end;

function ServidorEmailConectado(ParamEmail: TParametrosEmail; var MsgErro: string): Boolean;
var
  smpEmail: TIdSMTP;
  SSLEmail: TIdSSLIOHandlerSocketOpenSSL;
begin
  Result := False;
  MsgErro := EmptyStr;
  try
    smpEmail := TIdSMTP.Create(nil);
    SSLEmail := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    try
      smpEmail.Host := ParamEmail.Servidor;
      smpEmail.Username := ParamEmail.Usuario;
      smpEmail.Password := ParamEmail.Senha;
      smpEmail.HeloName := EmptyStr;
      smpEmail.Port := StrToIntDef(ParamEmail.Porta, 0);
      smpEmail.AuthType := satDefault;

      if (ParamEmail.SSL) then
        smpEmail.IOHandler := SSLEmail;

      smpEmail.UseTLS := utUseImplicitTLS;
      SSLEmail.SSLOptions.Mode := sslmClient;
      SSLEmail.SSLOptions.Method := sslvSSLv3;

      // Enviar
      smpEmail.ConnectTimeout := 50000;
      smpEmail.Connect;
      smpEmail.Authenticate;
      smpEmail.Disconnect;

      Result := True; // Conexão OK
    finally
      SSLEmail.Free;
      smpEmail.Free;
    end;
  except on E: Exception do
    MsgErro := E.Message;
  end;
end;

// Se Erro no Envio retorna Msg
function EnviarEmail(ParamEmail: TParametrosEmail; EmailsDestino, Assunto, Msg: string;
  ConfLeitura: Boolean = False; Anexos: string = ''; CopiasOcultas: string = ''): string;
var
  i: Integer;
  smpEmail: TIdSMTP;
  idmMessagem: TIdMessage;
  ListaAnexos: TStringList;
  Html: TIdText;
  SSLEmail: TIdSSLIOHandlerSocketOpenSSL;
  Anexo: TIdAttachmentFile;
  NomeArqAnexo: string;
begin
  Result := EmptyStr;
  try
    smpEmail := TIdSMTP.Create(nil);
    idmMessagem := TIdMessage.Create(nil);
    ListaAnexos := TStringList.Create;
    SSLEmail := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    try
      smpEmail.Host := ParamEmail.Servidor;
      smpEmail.Username := ParamEmail.Usuario;
      smpEmail.Password := ParamEmail.Senha;
      smpEmail.HeloName := EmptyStr;
      smpEmail.Port := StrToIntDef(ParamEmail.Porta, 0);
      smpEmail.AuthType := satDefault;

      if (ParamEmail.SSL) then
        smpEmail.IOHandler := SSLEmail;

      smpEmail.UseTLS := utUseImplicitTLS;
      SSLEmail.SSLOptions.Mode := sslmClient;
      SSLEmail.SSLOptions.Method := sslvSSLv3;

      idmMessagem.Encoding := meMIME;
      idmMessagem.From.Address := ParamEmail.EmailOrigem;
      idmMessagem.From.Name := ParamEmail.NomeEmailOrigem;
      idmMessagem.Recipients.EMailAddresses := EmailsDestino;
      idmMessagem.BccList.EMailAddresses := CopiasOcultas;

      idmMessagem.Subject := Assunto;
      idmMessagem.ContentType := 'multipart/related';
      idmMessagem.AttachmentEncoding := 'MIME';

      Html := TIdText.Create(idmMessagem.MessageParts);
      Html.Body.Text := Msg;
      Html.ContentType := 'text/html';

      // Conf. Leitura
      if ConfLeitura then
        idmMessagem.ReceiptRecipient.Address := idmMessagem.From.Address;

      // Anexos
      ListaAnexos.Delimiter := ';';
      ListaAnexos.DelimitedText := StringReplace(Anexos, ' ', '|', [rfReplaceAll]);
      for i := 0 to ListaAnexos.Count - 1 do
      begin
        NomeArqAnexo := StringReplace(ListaAnexos[i], '|', ' ', [rfReplaceAll]);
        if FileExists(NomeArqAnexo) then
        begin
          Anexo := TIdAttachmentFile.Create(idmMessagem.MessageParts, NomeArqAnexo);
          Anexo.ContentType := 'image/jpeg';
          Anexo.FileName := ExtractFileName(NomeArqAnexo);
          Anexo.ContentID := Format('<%s>', [ExtractFileName(NomeArqAnexo)]);
        end;
      end;

      // Enviar
      smpEmail.ConnectTimeout := 60000;
      smpEmail.Connect;
      smpEmail.Send(idmMessagem);
      smpEmail.Disconnect;
    finally
      ListaAnexos.Free;
      idmMessagem.Free;
      SSLEmail.Free;
      smpEmail.Free;
    end;
  except on E: Exception do
    Result := E.Message;
  end;
end;

function PercentualUsoCPU(MetodoAppProcMsg: TMetodoAppProcessMessage): Integer;
var
  SysBaseInfo: TSystem_Basic_Information;
  SysPerfInfo: TSystem_Performance_Information;
  SysTimeInfo: TSystem_Time_Information;
  status: Longint;
  dbSystemTime: Double;
  dbIdleTime: Double;

  ContUso: Integer;
  UsoCPU: Integer;

  function Li2Double(x: LARGE_INTEGER): Double;
  begin
    Result := x.HighPart * 4.294967296E9 + x.LowPart
  end;

begin
  UsoCPU := 0;
  Result := 0;
  if @NtQuerySystemInformation = nil then
    NtQuerySystemInformation := GetProcAddress(GetModuleHandle('ntdll.dll'),
      'NtQuerySystemInformation');

  // Número de processos ativos
  status := NtQuerySystemInformation(SystemBasicInformation, @SysBaseInfo, SizeOf(SysBaseInfo), nil);
  if status <> 0 then
    Exit;

  ContUso := 1;

  while ContUso <= 3 do
  begin

    // get new system time
    status := NtQuerySystemInformation(SystemTimeInformation, @SysTimeInfo, SizeOf(SysTimeInfo), nil);
    if status <> 0 then
      Exit;

    // get new CPU's idle time
    status := NtQuerySystemInformation(SystemPerformanceInformation, @SysPerfInfo, SizeOf(SysPerfInfo), nil);
    if status <> 0 then
      Exit;

    // if it's a first call - skip it
    if (liOldIdleTime.QuadPart <> 0) then
    begin

      // CurrentValue = NewValue - OldValue
      dbIdleTime := Li2Double(SysPerfInfo.liIdleTime) - Li2Double(liOldIdleTime);
      dbSystemTime := Li2Double(SysTimeInfo.liKeSystemTime) - Li2Double(liOldSystemTime);

      // CurrentCpuIdle = IdleTime / SystemTime
      dbIdleTime := dbIdleTime / dbSystemTime;

      // CurrentCpuUsage% = 100 - (CurrentCpuIdle * 100) / NumberOfProcessors
      dbIdleTime := 100.0 - dbIdleTime * 100.0 / SysBaseInfo.bKeNumberProcessors + 0.5;

      // Percentual
      UsoCPU := Trunc(dbIdleTime);

      // Process Message
      if Assigned(MetodoAppProcMsg) then
        MetodoAppProcMsg;
    end;

    // store new CPU's idle and system time
    liOldIdleTime := SysPerfInfo.liIdleTime;
    liOldSystemTime := SysTimeInfo.liKeSystemTime;

    Sleep(1000);
    Inc(ContUso);
  end;
  Result := UsoCPU;
end;

function AplicativoEmExecucao(ClassePrincipal: string): Boolean;
begin
  Result := (FindWindow('TAppBuilder', nil) = 0) and (FindWindow(PChar(ClassePrincipal), nil) <> 0);
end;

function RemoverCaracteresEspeciais(Str: string): string;
const
  Especiais = '"!@#$%¨&*&*=+><^`~|,;\?°£¢¬§üäåïåÅæÆöÿÖÜø£¤×ƒ¿®¤¦©¢¥¶ðÐËÏ§¯ßµþÞ´±¾÷°¹²³';
var
  i: Integer;
begin
  ;
  Result := EmptyStr;
  for i := 1 to Length(Str) do
  begin
    if Pos(Str[i], Especiais) = 0 then
      Result := Result + Str[i];
  end;
end;

procedure CompactarArquivos(ArquivosOrigem: TStrings; ArquivoDestino: string);
var
  zipArqs: TZipMaster;
begin
  zipArqs := TZipMaster.Create(nil);

  try
    // Destino
    zipArqs.ZipFileName := ArquivoDestino;

    // Origem
    zipArqs.FSpecArgs.Assign(ArquivosOrigem);

    // Adicionar
    zipArqs.Add;
  finally
    zipArqs.Free;
  end;
end;

procedure CompactarArquivos(PastaOrigem: string; ArquivoDestino: string); overload;
var
  zipArqs: TZipMaster;
begin
  zipArqs := TZipMaster.Create(nil);

  try
    // Configurações
    zipArqs.AddOptions := [AddDirNames, AddRecurseDirs];

    // Destino
    zipArqs.ZipFileName := ArquivoDestino;

    // Origem
    zipArqs.FSpecArgs.Add(PastaOrigem + '\*.*');

    // Adicionar
    zipArqs.Add;
  finally
    zipArqs.Free;
  end;
end;

procedure DescompactarArquivos(ArquivoOrigem: string; PathDestino: string);
var
  zipArqs: TZipMaster;
begin
  zipArqs := TZipMaster.Create(nil);

  try
   
    // Configurações
    zipArqs.ExtrOptions := [ExtrDirNames, ExtrOverWrite, ExtrForceDirs];

    // Origem
    zipArqs.ZipFileName := ArquivoOrigem;

    // Destino
    zipArqs.ExtrBaseDir := PathDestino;

    // Extrair
    zipArqs.Extract;
  finally
    zipArqs.Free;
  end;
end;

function PastaVazia(Pasta: string): Boolean;
var
  FileSearch: TSearchRec;
begin
  Result := (FindFirst(Pasta, faDirectory, FileSearch) <> 0);
end;

procedure EsvaziarPasta(Pasta: string);
var
  fopArquivos: TJvSHFileOperation;
begin
  fopArquivos := TJvSHFileOperation.Create(nil);
  try
    fopArquivos.Options := [fofNoConfirmation, fofSilent];
    fopArquivos.SourceFiles.Text := Pasta;
    fopArquivos.Operation := foDelete;
    fopArquivos.Execute;
  finally
    fopArquivos.Free;
  end;
end;


function ValorChaveRegistroStr(Chave: HKEY; SubChave: string; Atributo: string; ValorDefault: string = ''): string;
var
  Registro: TJvRegistry;
begin
  Result := EmptyStr;
  Registro := TJvRegistry.Create;
  try
    try
      Registro.RootKey := Chave;
      if Registro.OpenKey(SubChave, False) then
        Result := Registro.ReadString(Atributo);
    except;
      Registro.Free;
    end;
  finally
    if (Result = EmptyStr) and (ValorDefault <> EmptyStr) then
      Result := ValorDefault;
  end
end;

function ValorChaveRegistroInt(Chave: HKEY; SubChave: string; Atributo: string; ValorDefault: Integer = 0): integer;
var
  Registro: TJvRegistry;
begin
  Result := 0;
  Registro := TJvRegistry.Create;
  try
    try
      Registro.RootKey := Chave;
      if Registro.OpenKey(SubChave, False) then
        Result := Registro.ReadInteger(Atributo);
    except;
      Registro.Free;
    end;
  finally
    if (Result = 0) and (ValorDefault <> 0) then
      Result := ValorDefault;
  end;  
end;
      
function PersistirChaveRegistroStr(Chave: HKEY; SubChave, Atributo, NovoValor: string): string; overload;
var
  Registro: TJvRegistry;
begin
  Result := EmptyStr;
  Registro := TJvRegistry.Create;
  try
    Registro.RootKey := Chave;
    if Registro.OpenKey(SubChave, False) then
      Registro.WriteString(Atributo, NovoValor);
  except;
    Registro.Free;
  end;
end;

function PersistirChaveRegistroInt(Chave: HKEY; SubChave, Atributo: string; NovoValor: integer): string; overload;
var
  Registro: TJvRegistry;
begin
  Result := EmptyStr;
  Registro := TJvRegistry.Create;
  try
    Registro.RootKey := Chave;
    if Registro.OpenKey(SubChave, False) then
      Registro.WriteInteger(Atributo, NovoValor);
  except;
    Registro.Free;
  end;
end;

function ExisteChaveRegistro(Chave: HKEY; SubChave: string): Boolean;
var
  Registro: TJvRegistry;
begin
  Result := False;
  Registro := TJvRegistry.Create(KEY_READ or KEY_WOW64_32KEY);
  try
    try
      Registro.RootKey := Chave;
      Result := Registro.OpenKey(SubChave, False);
    except
      raise;
    end;
  finally
    Registro.Free;
  end;
end;

procedure ExcluirChaveRegistroStr(Chave: HKEY; SubChave, Atributo: string);
var
  Registro: TJvRegistry;
begin
  Registro := TJvRegistry.Create(KEY_READ or KEY_WOW64_32KEY);
  try
    Registro.RootKey := Chave;
    if Registro.OpenKey(SubChave, False) then
      Registro.DeleteValue(Atributo);
  except;
    Registro.Free;
  end;
end;

procedure ExcluirChaveRegistroStr(Chave: HKEY; SubChave: string);
var
  Registro: TJvRegistry;
begin
  Registro := TJvRegistry.Create(KEY_READ or KEY_WOW64_32KEY);
  try
    Registro.RootKey := Chave;
    Registro.DeleteKey(SubChave);
  except;
    Registro.Free;
  end;
end;

function ValorNumerico(Str: string; VlrDefault: Integer = -1): Int64;
var
  i: Integer;
  VlrNumero: string;
begin
  VlrNumero := EmptyStr;

  for i := 1 to Length(Str) do
  begin
    if Str[i] in ['0'..'9'] then
      VlrNumero := VlrNumero + Str[i]
  end;

  Result := StrToInt64Def(VlrNumero, VlrDefault);
end;

function CompartilharPasta(Servidor, Pasta, NomeRecurso, Descricao: string): Boolean;
var
  Erro: Integer;
  Parametros: TShareInfo2;

  WServidor: array[0..1024] of WideChar;
  WPasta: array[0..1024] of WideChar;
  WNomeRecurso: array[0..1024] of WideChar;
  WDescricao: array[0..1024] of WideChar;

begin
  StringToWideChar(Servidor, WServidor, SizeOf(WServidor) div 2);
  StringToWideChar(Pasta, WPasta, SizeOf(WPasta) div 2);
  StringToWideChar(NomeRecurso, WNomeRecurso, SizeOf(WNomeRecurso) div 2);
  StringToWideChar(Descricao, WDescricao, SizeOf(WDescricao) div 2);

  Parametros.shi2_netname := @WNomeRecurso;
  Parametros.shi2_type := STYPE_DISKTREE;
  Parametros.shi2_remark := @WDescricao;
  Parametros.shi2_permissions :=  High(Cardinal);
  Parametros.shi2_path := @WPasta;
  Parametros.shi2_max_uses := High(Cardinal);
  Parametros.shi2_current_uses := High(Cardinal);

  NetShareAdd(WServidor, 2, @Parametros, Erro);

  Result := (Erro = 0);  // Verifica Sucesso

end;

procedure CancelarCompartilhamentoPasta(NomeCompartilhamento, Pasta: string);
var
  cmd: string;
begin
  cmd := 'NET SHARE ' + NomeCompartilhamento + ' "'+ pasta + '" ' + '/DELETE ';
  ExecutarComandoEAguardar(cmd, nil, False);
end;

function ConteudoArquivoUnicode(Arquivo: string): string;
var
  FArquivo: TStream;
  ConteudoArq: TStringList;
  UnicodeString: WideString;
  UnicodeSign: Word;
  TamanhoArq: Cardinal;
begin
  Result := EmptyStr;

  ConteudoArq := TStringList.Create;
  try
    FArquivo := TFileStream.Create(Arquivo, fmOpenRead);
    try
      TamanhoArq := FArquivo.Size;
      if TamanhoArq >= SizeOf(UnicodeSign) then
      begin
        FArquivo.ReadBuffer(UnicodeSign, SizeOf(UnicodeSign));
        if UnicodeSign = $FEFF then
        begin
          Dec(TamanhoArq, SizeOf(UnicodeSign));
          SetLength(UnicodeString, TamanhoArq div SizeOf(WideChar));
          FArquivo.ReadBuffer(UnicodeString[1], TamanhoArq);
          ConteudoArq.Text := UnicodeString;
        end;
      end;
    finally
      FArquivo.Free;
    end;

    Result := ConteudoArq.Text;
  finally
    ConteudoArq.Free;
  end;
end;

function EhArquivoUnicode(Arquivo: string): Boolean;
var
  FArquivo: TStream;
  UnicodeSign: Word;
  TamanhoArq: Integer;
begin
  Result := False;

  FArquivo := TFileStream.Create(Arquivo, fmOpenRead);
  try
    TamanhoArq := FArquivo.Size;
    if TamanhoArq >= SizeOf(UnicodeSign) then
    begin
      FArquivo.ReadBuffer(UnicodeSign, SizeOf(UnicodeSign));
      Result := (UnicodeSign = $FEFF);
    end;
  finally
    FArquivo.Free;
  end;
end;

function ConteudoPaginaHTML(Url: string; ServidorProxy: string = ''; PortaProxy: string = ''; UsuarioProxy: string = ''; SenhaProxy: string = '';
  UsarProxy: Boolean = false): string;
{var
  IdHTTP: TIdHTTP;}
begin
 { IdHTTP := TIdHTTP.Create(nil);
  IdHTTP.Host := Url;

  // Dados do Proxy, se necessário
  if UsarProxy then
  begin
    IdHTTP.ProxyParams.ProxyPort := StrToIntDef(PortaProxy, 0);
    IdHTTP.ProxyParams.ProxyServer := ServidorProxy;
    IdHTTP.ProxyParams.ProxyUsername := UsuarioProxy;
    IdHTTP.ProxyParams.ProxyPassword := SenhaProxy;
  end;

  Result := IdHTTP.Get(Url);}
end;

function CompletarLadoStr(Lado, StrNova, StrOriginal: string; TamFinal: integer): string;
var
  tam : integer;
  Pronta,
  lc : string;
begin
  Lado := UpperCase(Lado);
  lc := 'D';
  tam := Length(StrOriginal);
  pronta := StrOriginal;
  if lado = 'D' then
  begin
    while tam < TamFinal do
    begin
      pronta := pronta + StrNova;
      tam := tam + 1;
    end;
  end
  else if lado = 'E' then
  begin
    while tam < TamFinal do
    begin
      pronta := StrNova + pronta;
      tam := tam + 1;
    end;
  end
  else
  begin
    while tam < TamFinal do
    begin
      if lc = 'D' then
      begin
        lc := 'E';
        pronta := pronta + StrNova;
        tam := tam + 1;
      end
      else
      begin
        lc := 'D';
        pronta := StrNova + pronta;
        tam := tam + 1;
      end;
    end;
  end;
  Result := Pronta;
end;

function RemoveCaracterNuloStr(str: string) : string;
var
  i: integer;
  temp: string;
begin
  Result := EmptyStr;

  if (Length(str) > 0) then
  begin
    for i := 1 to length(str) do
    begin
      if (str[i] <> #0) then
        temp := temp + str[i]
      else temp := temp + ' ';
    end;
    Result := temp;
  end;
end;


function NomeComputador: string;
var
  lpBuffer: PChar;
  nSize: DWord;
const
  Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
begin
  nSize := Buff_Size;
  lpBuffer := StrAlloc(Buff_Size);
  GetComputerName(lpBuffer, nSize);
  Result := string(lpBuffer);
  StrDispose(lpBuffer);
end;

function Split(Str: string; Separador: Char; Posicao: Integer): string;
var
  ListaStr: TStringList;
begin
  ListaStr := TStringList.Create;
  try
    ExtractStrings([Separador], [], PChar(Str), ListaStr);

    try
      Result := ListaStr[Posicao];
    except // EmptyStr qdo estouro índice
      Result := EmptyStr;
    end
  finally
    ListaStr.Free;
  end;  
end;

function ListaArquivosPasta(Pasta: string; Mascaras: string = ''): string;
var
  Lista: TStringList;
  PesqArquivos: TJvSearchFiles;
begin
  PesqArquivos := TJvSearchFiles.Create(nil);  
  Lista := TStringList.Create;
  try
    PesqArquivos.RootDirectory := Pasta;
    PesqArquivos.FileParams.FileMasks.Delimiter := '|';
    PesqArquivos.FileParams.FileMasks.DelimitedText := Mascaras;
    PesqArquivos.FileParams.SearchTypes := [stFileMask];

    PesqArquivos.Search;
    Lista.Assign(PesqArquivos.Files);

    Result := Lista.CommaText;
  finally
    Lista.Free;
    PesqArquivos.Free;
  end;
end;

function DownloadArquivo(HostProxy, UsuarioProxy, SenhaProxy, Host, Usuario, Senha, NomeArqOrigem, NomeArqDestino: string; Substituir: Boolean = True): Boolean;
var
  Ftp: TIdFTP;
begin
  Result := False;

  Ftp := TIdFTP.Create(nil);
  try
    Ftp.Passive := True;

    Ftp.Host := Host;
    Ftp.Username := Usuario;
    Ftp.Password := Senha;
    Ftp.TransferType := ftBinary;

    // Proxy
    Ftp.ProxySettings.Host := HostProxy;
    Ftp.ProxySettings.UserName := UsuarioProxy;
    Ftp.ProxySettings.Password := SenhaProxy;
    try
      Ftp.Connect;

      // Tentativa Download
      Ftp.Get(NomeArqOrigem, NomeArqDestino, Substituir);
      Result := True;
    except
      ;  // Silencia Exceção
    end;
  finally
    Ftp.Free;
  end;
end;

function UploadArquivo(HostProxy, UsuarioProxy, SenhaProxy, Host, Usuario, Senha, NomeArqOrigem, NomeArqDestino: string): Boolean;
var
  Ftp: TIdFTP;
begin
  Result := False;

  Ftp := TIdFTP.Create(nil);
  try
    Ftp.Passive := True;

    Ftp.Host := Host;
    Ftp.Username := Usuario;
    Ftp.Password := Senha;

    // Proxy
    Ftp.ProxySettings.Host := HostProxy;
    Ftp.ProxySettings.UserName := UsuarioProxy;
    Ftp.ProxySettings.Password := SenhaProxy;

    try
      Ftp.Connect;

      // Tentativa Upload
      Ftp.Put(NomeArqOrigem, NomeArqDestino);
      Result := True;
    except
      ;  // Silencia Exceção
    end;
  finally
    Ftp.Free;
  end;
end;

function ValorExtenso(vlr: real): string;
const
  unidade: array[1..19] of string = ('um', 'dois', 'três', 'quatro', 'cinco',
             'seis', 'sete', 'oito', 'nove', 'dez', 'onze',
             'doze', 'treze', 'quatorze', 'quinze', 'dezesseis',
             'dezessete', 'dezoito', 'dezenove');

  centena: array[1..9] of string = ('cento', 'duzentos', 'trezentos',
             'quatrocentos', 'quinhentos', 'seiscentos',
             'setecentos', 'oitocentos', 'novecentos');

  dezena: array[2..9] of string = ('vinte', 'trinta', 'quarenta', 'cinquenta',
             'sessenta', 'setenta', 'oitenta', 'noventa');

  qualificaS: array[0..4] of string = ('', 'mil', 'milhão', 'bilhão', 'trilhão');
  qualificaP: array[0..4] of string = ('', 'mil', 'milhões', 'bilhões', 'trilhões');
var
  inteiro: Int64;
  resto: real;
  vlrS, s, saux, vlrP, centavos: string;
  n, unid, dez, cent, tam, i: integer;
  umReal, tem: boolean;
begin
  if (vlr <= 0)
     then begin
            ValorExtenso := 'zero';
            exit;
          end;

  inteiro := trunc(vlr); // parte inteira do valor
  resto := vlr - inteiro; // parte fracionária do valor
  vlrS := inttostr(inteiro);
  if (length(vlrS) > 15)
     then begin
            ValorExtenso := 'Erro: valor superior a 999 trilhões.';
            exit;
          end;
 
  s := '';
  centavos := inttostr(round(resto * 100));
 
// definindo o extenso da parte inteira do valor
  i := 0;
  umReal := false; tem := false;
  while (vlrS <> '0') do
  begin
    tam := length(vlrS);
// retira do valor a 1a. parte, 2a. parte, por exemplo, para 123456789:
// 1a. parte = 789 (centena)
// 2a. parte = 456 (mil)
// 3a. parte = 123 (milhões)
    if (tam > 3)
       then begin
              vlrP := copy(vlrS, tam-2, tam);
              vlrS := copy(vlrS, 1, tam-3);
            end
    else begin // última parte do valor
           vlrP := vlrS;
           vlrS := '0';
         end;
    if (vlrP <> '000')
       then begin
              saux := '';
              if (vlrP = '100')
                 then saux := 'cem'
              else begin
                     n := strtoint(vlrP);        // para n = 371, tem-se:
                     cent := n div 100;          // cent = 3 (centena trezentos)
                     dez := (n mod 100) div 10;  // dez  = 7 (dezena setenta)
                     unid := (n mod 100) mod 10; // unid = 1 (unidade um)
                     if (cent <> 0)
                        then saux := centena[cent];
                     if ((dez <> 0) or (unid <> 0))
                        then begin
                               if ((n mod 100) <= 19)
                                  then begin
                                         if (length(saux) <> 0)
                                            then saux := saux + ' e ' + unidade[n mod 100]
                                         else saux := unidade[n mod 100];
                                       end
                               else begin
                                      if (length(saux) <> 0)
                                         then saux := saux + ' e ' + dezena[dez]
                                      else saux := dezena[dez];
                                      if (unid <> 0)
                                         then if (length(saux) <> 0)
                                                 then saux := saux + ' e ' + unidade[unid]
                                              else saux := unidade[unid];
                                    end;
                             end;
                   end;
              if ((vlrP = '1') or (vlrP = '001'))
                 then begin
                        if (i = 0) // 1a. parte do valor (um real)
                           then umReal := true
                        else saux := saux + ' ' + qualificaS[i];
                      end
              else if (i <> 0)
                      then saux := saux + ' ' + qualificaP[i];
              if (length(s) <> 0)
                 then s := saux + ', ' + s
              else s := saux;
            end;
    if (((i = 0) or (i = 1)) and (length(s) <> 0))
       then tem := true; // tem centena ou mil no valor
    i := i + 1; // próximo qualificador: 1- mil, 2- milhão, 3- bilhão, ...
  end;
 
  if (length(s) <> 0)
     then begin
            if (umReal)
               then s := s + ' real'
            else if (tem)
                    then s := s + ' reais'
                 else s := s + ' de reais';
          end;
// definindo o extenso dos centavos do valor
  if (centavos <> '0') // valor com centavos
     then begin
            if (length(s) <> 0) // se não é valor somente com centavos
               then s := s + ' e ';
            if (centavos = '1')
               then s := s + 'um centavo'
            else begin
                   n := strtoint(centavos);
                   if (n <= 19)
                      then s := s + unidade[n]
                   else begin                 // para n = 37, tem-se:
                          unid := n mod 10;   // unid = 37 % 10 = 7 (unidade sete)
                          dez := n div 10;    // dez  = 37 / 10 = 3 (dezena trinta)
                          s := s + dezena[dez];
                          if (unid <> 0)
                             then s := s + ' e ' + unidade[unid];
                       end;
                   s := s + ' centavos';
                 end;
          end;
  ValorExtenso := s;
end;

function NumeroExtenso(Numero: Real; GeneroFeminino: Boolean = False): string;
var
  Valor: string;
begin
  Valor := ValorExtenso(Numero);

  // Retirar Textos Moeda
  Valor := StringReplace(Valor, ' de reais', EmptyStr, [rfReplaceAll]);
  Valor := StringReplace(Valor, ' reais', EmptyStr, [rfReplaceAll]);
  Valor := StringReplace(Valor, ' real', EmptyStr, [rfReplaceAll]);
  Valor := StringReplace(Valor, ' centavos', EmptyStr, [rfReplaceAll]);
  Valor := StringReplace(Valor, ' centavo', EmptyStr, [rfReplaceAll]);

  if (GeneroFeminino) then
  begin
    Valor := StringReplace(Valor, 'um', 'uma', [rfReplaceAll]);
    Valor := StringReplace(Valor, 'dois', 'duas', [rfReplaceAll]);
  end;
  
  Result := Valor;
end;
    
function ExisteServico(Nome: string): Boolean;
begin
  Result := (ValorChaveRegistroStr(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Services\' + Nome, 'ImagePath') <> EmptyStr);
end;

function WebConectado: boolean;
var
 flags : DWORD;
begin
 // verifica se está conectado a internet usando a API do Windows, é preciso declarar a uses WinInet.

 if not InternetGetConnectedState(@flags, 0) then
    result := false
 else
    result := true;
end;


function MacAdress: string;
var
  MacAddressStrings: TStringList;
begin
  MacAddressStrings := TStringList.Create();
  JclSysInfo.GetMacAddresses('', MacAddressStrings);
  Result := MacAddressStrings[0];
  MacAddressStrings.Free;
end;
                                    
function MD5(const Input: String): string;
var
  hCryptProvider: HCRYPTPROV;
  hHash: HCRYPTHASH;
  bHash: array[0..$7f] of Byte;
  dwHashBytes: Cardinal;
  pbContent: PByte;
  i: Integer;
begin
  dwHashBytes := 16;
  pbContent := Pointer(PChar(Input));

  Result := '';

  if CryptAcquireContext(hCryptProvider, nil, nil, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT or CRYPT_MACHINE_KEYSET) then
  begin
    if CryptCreateHash(hCryptProvider, CALG_MD5, 0, 0, hHash) then
    begin
      if CryptHashData(hHash, pbContent, Length(Input) * sizeof(Char), 0) then
      begin
        if CryptGetHashParam(hHash, HP_HASHVAL, @bHash[0], dwHashBytes, 0) then
        begin
          for i := 0 to dwHashBytes - 1 do
          begin
            Result := Result + Format('%.2x', [bHash[i]]);
          end;
        end;
      end;
      CryptDestroyHash(hHash);
    end;

    CryptReleaseContext(hCryptProvider, 0);
  end;

  Result := AnsiLowerCase(Result);
end;
               
// Devolve um array de strings
function ArrayString(S: String;separador: char): TStringList;
var
  conta : integer; // variáveis auxiliares
  resultado : TStringList; // variáveis auxiliares
  Saux : string; // variáveis auxiliares
begin
    resultado := TStringList.Create; // inicializa variavel
    conta := pos(separador,S); //pega posição do separador
    if conta <> 0 then begin  // verifica se existe o separador caso contrario trata apenas //como uma única linha
        while trim(S) <> '' do begin // enquanto S não for nulo executa
            Saux := copy(S,1,conta-1); // Variável Saux recebe primeiro valor
            delete(S,1,conta); //deleta primeiro valor
            if conta = 0 then begin //se não ouver mais separador Saux equivale ao resto da //linha
                Saux := S + '  ';
                S := '';
            end;
        resultado.Add(Saux); // adiciona linhas na string lista
        conta := pos(separador,S); //pega posição do separador
        end;
        end
    else begin
        Saux := S;
        resultado.Add(Saux);
    end;
    Result := resultado; // retorna resultado como uma lista indexada
end;

function ConteudoArqTexto(Path: string): string;
var
  Conteudo: TStringList;
begin
  Conteudo := TStringList.Create;
  try
    Conteudo.LoadFromFile(Path);
    Result := Conteudo.Text;
  finally
    Conteudo.Free;
  end;
end;

function StreamToString(Stream: TStream): string;
var
  ms: TMemoryStream;
begin
  Result := '';
  ms := TMemoryStream.Create;
  try
    ms.LoadFromStream(Stream);
    SetString(Result, PChar(ms.memory), ms.Size);
  finally
    ms.Free;
  end;
end;
    
procedure SincronizarHora(Servidor: string); // SNTP:Porta :: Sincroniza 
var
 IdSNTP: TIdSNTP;
begin
  IdSNTP := TIdSNTP.Create;
  try
    IdSNTP.Host := Split(Servidor, ':', 0);
    IdSNTP.Port := StrToIntDef(Split(Servidor, ':', 0), 123);
    IdSNTP.Connect;

    if Abs(MinutesBetween(IdSNTP.DateTime, Now)) >= 1 then
      IdSNTP.SyncTime;
  finally
    IdSNTP.Free;
  end;
end;

function PastaWindows: string;
begin
  Result := GetWindowsFolder;
end;

function ProcessoCarregado(PathExeProc: string): Boolean;
var
  ListaProc: TStringList;
begin
  ListaProc := TStringList.Create;
  try
    RunningProcessesList(ListaProc);
    ListaProc.Sorted := True;

    Result := (ListaProc.IndexOf(PathExeProc) <> -1);
  finally
    ListaProc.Free;
  end;
end;

procedure EncerrarProcesso(NomeProc: string);
begin
  KillProcessByName(NomeProc);
end;

procedure Boot;
begin
  RebootOS;
end;

function ExisteArquivo(Arquivo: string): Boolean;
var
  searchResult : TSearchRec;
begin
  Result := (FindFirst(Arquivo, faAnyFile, searchResult) = 0);
end;

function GetCurrentUserSid: string;
var
  hAccessToken: THandle;
  bSuccess: BOOL;
  dwBufferLen: DWORD;
  szSid: array[0..260] of Char;

  const
    HEAP_ZERO_MEMORY = $00000008;
    SID_REVISION     = 1; // Current revision level

  type
    PTokenUser = ^TTokenUser;
    TTokenUser = packed record
      User: TSidAndAttributes;
    end;


  function ConvertSid(Sid: PSID; pszSidText: PChar; var dwBufferLen: DWORD): BOOL;
  var
    psia: PSIDIdentifierAuthority;
    dwSubAuthorities: DWORD;
    dwSidRev: DWORD;
    dwCounter: DWORD;
    dwSidSize: DWORD;
  begin
    Result := False;

    dwSidRev := SID_REVISION;

    if not IsValidSid(Sid) then Exit;

    psia := Windows.GetSidIdentifierAuthority(Sid);

    dwSubAuthorities := GetSidSubAuthorityCount(Sid)^;

    dwSidSize := (15 + 12 + (12 * dwSubAuthorities) + 1) * SizeOf(Char);

    if (dwBufferLen < dwSidSize) then
    begin
      dwBufferLen := dwSidSize;
      SetLastError(ERROR_INSUFFICIENT_BUFFER);
      Exit;
    end;

    StrFmt(pszSidText, 'S-%u-', [dwSidRev]);

    if (psia.Value[0] <> 0) or (psia.Value[1] <> 0) then
      StrFmt(pszSidText + StrLen(pszSidText),
        '0x%.2x%.2x%.2x%.2x%.2x%.2x',
        [psia.Value[0], psia.Value[1], psia.Value[2],
        psia.Value[3], psia.Value[4], psia.Value[5]])
    else
      StrFmt(pszSidText + StrLen(pszSidText),
        '%u',
        [DWORD(psia.Value[5]) +
        DWORD(psia.Value[4] shl 8) +
        DWORD(psia.Value[3] shl 16) +
        DWORD(psia.Value[2] shl 24)]);

    dwSidSize := StrLen(pszSidText);

    for dwCounter := 0 to dwSubAuthorities - 1 do
    begin
      StrFmt(pszSidText + dwSidSize, '-%u',
        [GetSidSubAuthority(Sid, dwCounter)^]);
      dwSidSize := StrLen(pszSidText);
    end;

    Result := True;
  end;

  function ObtainTextSid(hToken: THandle; pszSid: PChar;
    var dwBufferLen: DWORD): BOOL;
  var
    dwReturnLength: DWORD;
    dwTokenUserLength: DWORD;
    tic: TTokenInformationClass;
    ptu: Pointer;
  begin
    Result := False;
    dwReturnLength := 0;
    dwTokenUserLength := 0;
    tic := TokenUser;
    ptu := nil;

    if not Windows.GetTokenInformation(hToken, tic, ptu, dwTokenUserLength,
      dwReturnLength) then
    begin
      if GetLastError = ERROR_INSUFFICIENT_BUFFER then
      begin
        ptu := HeapAlloc(GetProcessHeap, HEAP_ZERO_MEMORY, dwReturnLength);
        if ptu = nil then Exit;
        dwTokenUserLength := dwReturnLength;
        dwReturnLength    := 0;

        if not Windows.GetTokenInformation(hToken, tic, ptu, dwTokenUserLength,
          dwReturnLength) then Exit;
      end
      else
        Exit;
    end;

    if not ConvertSid((PTokenUser(ptu).User).Sid, pszSid, dwBufferLen) then Exit;

    if not HeapFree(GetProcessHeap, 0, ptu) then Exit;

    Result := True;
  end;


begin
  Result := '';

  bSuccess := OpenThreadToken(GetCurrentThread, TOKEN_QUERY, True,
    hAccessToken);
  if not bSuccess then
  begin
    if GetLastError = ERROR_NO_TOKEN then
      bSuccess := OpenProcessToken(GetCurrentProcess, TOKEN_QUERY,
        hAccessToken);
  end;
  if bSuccess then
  begin
    ZeroMemory(@szSid, SizeOf(szSid));
    dwBufferLen := SizeOf(szSid);

    if ObtainTextSid(hAccessToken, szSid, dwBufferLen) then
      Result := szSid;
    CloseHandle(hAccessToken);
  end;
end;


end.



