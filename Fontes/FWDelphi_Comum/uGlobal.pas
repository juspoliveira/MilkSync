(*Constantes Globais*)
unit uGlobal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, ComCtrls, ExtCtrls, IBQuery, XMLDoc, XMLIntf, WinInet;


// Utilizado na Tradução dos Verbetes
type
  TIdioma = (idPortugues, idIngles, idEspanhol);

var
  GEmpresa : Integer;
  GEmpNome : String;
  GDataBaseName : String;
  // Nome,senha e codigo do Operador que fez login
  GUsuarioSeq : Integer;
  GUsuarioNome : String;
  GSuperUsuario :Boolean;
  GValorFrete : Double;
  GICMS : Double;
  GMsgErro: String;
  GValidade: integer;
  GTransacao : Integer;
  GPedeSenha : Boolean;
const
 Unidades: array[1..9] of string = ('Um', 'Dois', 'Tres', 'Quatro', 'Cinco',
                                    'Seis', 'Sete', 'Oito', 'Nove');
 Dez: array[1..9] of string = ('Onze', 'Doze', 'Treze', 'Quatorze', 'Quinze',
                               'Dezesseis', 'Dezessete', 'Dezoito', 'Dezenove');
 Dezenas: array[1..9] of string = ('Dez', 'Vinte', 'Trinta', 'Quarenta',
                                   'Cinquenta', 'Sessenta', 'Setenta',
                                   'Oitenta', 'Noventa');
 Centenas: array[1..9] of string = ('Cento', 'Duzentos', 'Trezentos',
                                    'Quatrocentos', 'Quinhentos', 'Seiscentos',
                                    'Setecentos', 'Oitocentos', 'Novecentos');
 GPastaSkin = '\VISIONSCP\Skins\';


procedure InicializaGlobais;
procedure MostraMsgErro(Msg :string);
procedure MostraMsgInfo(Msg :string);
function MostraMsgConf(msg :string) :Boolean;
function DataHoraAtual :TDateTime;
function PreencheEspacoDireita(Str :String; Tamanho :Integer) :String;
function cpf(num: string): boolean;
function cgc(num: string): boolean;
function RetZero(ZEROS:string;QUANT:integer):String;
function Valuf(mUF: string): boolean;
function MesExtenso(mMES: Integer): string;
function IncData(DtaBase: TDate; Dia : String; NovoMes: Boolean): TDate;
function extenso (valor: real): string;
function ifs(Expressao: Boolean; CasoVerdadeiro, CasoFalso: String): String;
function MiniExtenso (trio: string): string;
function ValidaPIS(PIS :String): Boolean;
function TestaCnpj(xCNPJ: String):Boolean;
{ Funcao de codificacao de senha }
function Codifica(S: string): string;
function IdiomaToString(Idioma : TIdioma) :String;
function Criptografia(Senha :String) :String;
function Descriptografia(Senha :String) :String;
function EncryptSTR(const InString:string; StartKey,MultKey,AddKey:Integer): string;
function DecryptSTR(const InString:string; StartKey,MultKey,AddKey:Integer): string;
function DtPrev_Ok(dtcomp,dtprev :TDate ):boolean;
function Datafinal(dataini:tdatetime; dias_uteis:integer):tdatetime;
function DateMais(Dat:TDateTime;Numdias:Integer): TDateTime;
function AtribuiDia ( const data: TDateTime; const diaAtrib: Word ): TDateTime;
function Maiuscula(Texto:String): String;
function Elimina(Text,Busca : string) : string;
function WebConectado: boolean;
function WSDisponivel: boolean;

function RemoveAcento(Str: string): string;
function ValidarData(Data: TDateTime): Boolean;
procedure ExpXML(DataSet : TDataSet; Arq : string);
function GeraGUID:String;
function LimpaGUID(GUID: string): string;
function TrocaVirgPPto(Valor: string): String;
function TrocaPtoPVirg(Valor: string): String;
function arraystring(S: String;  separador: char): TStringList;

implementation

uses StrUtils, DateUtils, ComObj;

procedure InicializaGlobais;
begin
  DecimalSeparator := ',' ;
  ThousandSeparator := '.'  ;
  ShortDateFormat := 'dd/mm/yyyy';
  LongDateFormat := 'dd/mm/yyyy hh:mm:ss';
  NegCurrFormat := 1;
  GTransacao := 1;
  GValidade := 1;
end;

procedure AtualizaGlobais;
begin

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

function DataHoraAtual :TDateTime;
begin
  Result := Now;
end;

function PreencheEspacoDireita(Str :String; Tamanho :Integer) :String;
var
 i :integer;
begin
  Result := Str;
  for i := 1 to (Tamanho - Length(Str)) do
    Result := Result + ' ';
end;

// Calcula digito verificador de cpf
function cpf(num: string): boolean;
var
	n1,n2,n3,n4,n5,n6,n7,n8,n9: integer;
	d1,d2: integer;
	digitado, calculado: string;
begin
	n1:=StrToInt(num[1]);
	n2:=StrToInt(num[2]);
	n3:=StrToInt(num[3]);
	n4:=StrToInt(num[4]);
	n5:=StrToInt(num[5]);
	n6:=StrToInt(num[6]);
	n7:=StrToInt(num[7]);
 	n8:=StrToInt(num[8]);
 	n9:=StrToInt(num[9]);
 	d1:=n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
 	d1:=11-(d1 mod 11);
 	if d1>=10 then d1:=0;
 	d2:=d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
 	d2:=11-(d2 mod 11);
 	if d2>=10 then d2:=0;
 	calculado:=inttostr(d1)+inttostr(d2);
 	digitado:=num[10]+num[11];
 	if calculado=digitado then
   		cpf:=true
  	else
          if num = '11111111111' then
             Cpf := True
          Else
           cpf:=false;
end;

// Calcula digito verificador de cgc

function cgc(num: string): boolean;
var
 	n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12: integer;
 	d1,d2: integer;
 	digitado, calculado: string;
begin

  if (Num <> '11111111111111') and (Num <> '') then
    begin
 	n1:=StrToInt(num[1]);
	n2:=StrToInt(num[2]);
 	n3:=StrToInt(num[3]);
 	n4:=StrToInt(num[4]);
 	n5:=StrToInt(num[5]);
 	n6:=StrToInt(num[6]);
 	n7:=StrToInt(num[7]);
 	n8:=StrToInt(num[8]);
 	n9:=StrToInt(num[9]);
 	n10:=StrToInt(num[10]);
 	n11:=StrToInt(num[11]);
 	n12:=StrToInt(num[12]);
 	d1:=n12*2+n11*3+n10*4+n9*5+n8*6+n7*7+n6*8+n5*9+n4*2+n3*3+n2*4+n1*5;
 	d1:=11-(d1 mod 11);
 	if d1>=10 then d1:=0;
 	d2:=d1*2+n12*3+n11*4+n10*5+n9*6+n8*7+n7*8+n6*9+n5*2+n4*3+n3*4+n2*5+n1*6;
 	d2:=11-(d2 mod 11);
 	if d2>=10 then d2:=0;
 	calculado:=inttostr(d1)+inttostr(d2);
 	digitado:=num[13]+num[14];
 	if calculado=digitado then
   		cgc:=true
  	else
   		cgc:=false;
    end
    else
      if Num = '' then
        begin
         MostraMsgInfo('Digite o C.N.P.J. Válido.');
         cgc := False;
        end
      else
         cgc := True;
end;
// Preenche string com zeros a esquerda
function RetZero(Zeros:string;Quant:integer):String;
var
   I,Tamanho:integer;
   aux: string;
begin
  aux:=zeros;
  Tamanho:=length(Zeros);
  Zeros:='';
    for I:=1 to quant-tamanho do
        Zeros := Zeros + '0';
  Aux := Zeros+aux;
  RetZero:= Aux;
end;
// Valida Estados Brasileiros
function Valuf(mUF: string): boolean;
Var
  Estados :String;
  Position : Integer;
Begin
  Estados := 'SP,MG,RJ,GO,PA,RS,ES,TO,RD,RO,AM,AP,SE,PB,AC,BA,DF,SC,PR,MT,MS,MA,CE,PE,RN,PI';
  Position := Pos(mUf,Estados);
   If Position > 0 then
     Valuf := True
   Else
     Valuf := False;
end;
function IncData(DtaBase: TDate; Dia : String; NovoMes: Boolean ): TDate;
Var
  nDia, nMes, nAno : String;
begin
  // Separa a Data Recebida
  nDia := Copy(FormatDateTime('dd/mm/yyyy', Dtabase),1,2);
  nMes := Copy(FormatDateTime('dd/mm/yyyy', Dtabase),4,2);
  nAno := Copy(FormatDateTime('dd/mm/yyyy', Dtabase),7,4);
  // Monta a Nova Data e Inclementa o mes se necessário
  If Novomes then
    begin
      nDia := Dia;
      If StrToInt(nMes) = 12 then
        begin
         nMes := '01';
         nAno := InttoStr((StrtoInt(nAno)+1));
        end
      else
        nMes := IntToStr((StrToInt(nMes)+1));

      IncData := StrToDate(nDia+'/'+nMes+'/'+nAno);
    end
  else
    begin
      nDia := Dia;
      IncData := StrToDate(nDia+'/'+nMes+'/'+nAno);
    end;
end;
function MesExtenso(mMES: Integer): string;
Begin
  Case mMes of
    1: MesExtenso := 'Janeiro';
    2: MesExtenso := 'Fevereiro';
    3: MesExtenso := 'Março';
    4: MesExtenso := 'Abril';
    5: MesExtenso := 'Maio';
    6: MesExtenso := 'Junho';
    7: MesExtenso := 'Julho';
    8: MesExtenso := 'Agosto';
    9: MesExtenso := 'Setembro';
    10: MesExtenso := 'Outubro';
    11: MesExtenso := 'Novembro';
    12: MesExtenso := 'Dezembro';
  end;
end;

// ------------------------------------------ //

function ifs(Expressao: Boolean; CasoVerdadeiro, CasoFalso: String): String;
begin
 if Expressao
  then Result:=CasoVerdadeiro
  else Result:=CasoFalso;
end;

function MiniExtenso (trio: string): string;
var
Unidade, Dezena, Centena: string;
begin
Unidade:='';
Dezena:='';
Centena:='';
if (trio[2]='1') and (trio[3]<>'0') then
 begin
  Unidade:=Dez[strtoint(trio[3])];
  Dezena:='';
 end
else
 begin
  if trio[2]<>'0' then Dezena:=Dezenas[strtoint(trio[2])];
  if trio[3]<>'0' then Unidade:=Unidades[strtoint(trio[3])];
 end;
if (trio[1]='1') and (Unidade='') and (Dezena='')
 then Centena:='cem'
else
 if trio[1]<>'0'
  then Centena:=Centenas[strtoint(trio[1])]
  else Centena:='';
 Result:= Centena + ifs((Centena<>'') and ((Dezena<>'') or (Unidade<>'')), ' e ', '')
          + Dezena + ifs((Dezena<>'') and (Unidade<>''),' e ', '') + Unidade;
end;


function Extenso (valor: real): string;
var
 Centavos, Centena, Milhar, Texto, msg: string;

begin
if (valor>999999.99) or (valor<0) then
 begin
  msg:='O valor está fora do intervalo permitido.';
  msg:=msg+'O número deve ser maior ou igual a zero e menor que 999.999,99.';
  msg:=msg+' Se não for corrigido o número não será escrito por extenso.';
  showmessage(msg);
  Result:='';
  exit;
 end;
if valor=0 then
 begin
  Result:='';
  Exit;
 end;
Texto:=formatfloat('000000.00',valor);
Milhar:=MiniExtenso(Copy(Texto,1,3));
Centena:=MiniExtenso(Copy(Texto,4,3));
Centavos:=MiniExtenso('0'+Copy(Texto,8,2));

Result:=Milhar;
if Milhar<>'' then
  if copy(texto,4,3)='000' then
   Result:=Result+' Mil Reais'
  else
   Result:=Result+' Mil, ';
if (((copy(texto,4,2)='00') and (Milhar<>'')
    and (copy(texto,6,1)<>'0')) or (centavos=''))
    and (Copy(Texto,4,1)<>'0')
then begin
       If result <> ''then Result:=Result+' e ';
     end;

//    and (Centena<>'') then Result:=Result+' e ';
if (Milhar+Centena <>'') then Result:=Result+Centena;
if (Milhar='') and (copy(texto,4,3)='001') then
  Result:=Result+' Real'
 else
  if (copy(texto,4,3)<>'000') then Result:=Result+' Reais';
if Centavos='' then
 begin
  Result:=Result+'.';
  Exit;
 end
else
 begin
  if Milhar+Centena='' then
    Result:=Centavos
   else
    Result:=Result+', e '+Centavos;
if (copy(texto,8,2)='01') and (Centavos<>'') then
  Result:=Result+' Centavo.'
 else
  Result:=Result+' Centavos.';
end;
end;

{Codifica string para uso em senhas}
function Codifica(S: string): string;
var
  Cod: string;
  I: integer;
begin
  S := S + #13 + '          ';
  Cod := '';
  for I := 9 downto 1 do
    Cod := Cod + Copy( S, I, 1 );
  S := Copy( Cod, 4, 3 ) +
       Copy( Cod, 1, 3 ) +
       Copy( Cod, 7, 3 );
  Cod := '';
  for I := 1 to 9 do
  begin
    if (I mod 2) = 0 then
    begin
      if ord( S[I] ) = 255 then
        Cod := Cod + #0
      else
        Cod := Cod + chr( ord( S[I] ) + 1 );
    end
    else
    begin
      if ord( S[I] ) = 0 then
        Cod := Cod + chr( 255 )
      else
        Cod := Cod + chr( ord( S[I] ) - 1 );
    end;
  end;
  Codifica := Cod;
end;

// ------------------------------------------ //

{Testa se o número do pis é válido ou não}
function ValidaPIS(PIS :String) :Boolean;
var
  i, wsoma, Wm11, Wdv,wdigito : Integer;
begin
Result := False;
if Trim(PIS) <> '' Then

   begin
   wdv := strtoint(copy(PIS, 11, 1));
   wsoma := 0;
   wm11 := 2;
   for i := 1 to 10 do
       begin
       wsoma := wsoma + (wm11 *strtoint(copy(PIS,11 - I, 1)));
       if wm11 < 9 then
          begin
          wm11 := wm11+1
          end
       else
          begin
          wm11 := 2;
          end;
       end;
   wdigito := 11 - (wsoma MOD 11);
   if wdigito > 9 then
      wdigito := 0;
   if wdv = wdigito then
        Result := True
   else
        Result := False;
   end;
end;
{Testa se o CNPJ é válido ou não}
function TestaCNPJ(xCNPJ: String):Boolean;

Var
d1,d4,xx,nCount,fator,resto,digito1,digito2 : Integer;
Check : String;
begin
d1 := 0;
d4 := 0;
xx := 1;
for nCount := 1 to Length( XCNPJ )-2 do
    begin
    if Pos( Copy( XCNPJ, nCount, 1 ), '/-.' ) = 0 then
       begin
       if xx < 5 then
          begin
          fator := 6 - xx;
          end
       else
          begin
          fator := 14 - xx;
          end;
       d1 := d1 + StrToInt( Copy( XCNPJ, nCount, 1 ) ) * fator;
       if xx < 6 then
          begin
          fator := 7 - xx;
          end
       else
          begin
          fator := 15 - xx;
          end;
       d4 := d4 + StrToInt( Copy( XCNPJ, nCount, 1 ) ) * fator;
       xx := xx+1;
       end;
    end;
    resto := (d1 mod 11);
    if resto < 2 then
       begin
       digito1 := 0;
       end
   else
       begin
       digito1 := 11 - resto;
       end;
   d4 := d4 + 2 * digito1;
   resto := (d4 mod 11);
   if resto < 2 then
      begin
      digito2 := 0;
      end
   else
      begin
      digito2 := 11 - resto;
      end;
   Check := IntToStr(Digito1) + IntToStr(Digito2);
   if Check <> copy(XCNPJ,succ(length(XCNPJ)-2),2) then
      begin
      Result := False;
      end
   else
      begin
      Result := True;
      end;
end;
// Descrição Idioma
function IdiomaToString(Idioma : TIdioma) :String;
begin
  case Idioma of
    idPortugues: Result := 'Port';
    idIngles: Result := 'Ingle';
    idEspanhol: Result := 'Espan';
  end;
end;
// Criptografia
function Criptografia(Senha :String) :String;
begin
  Result := ReverseString(Senha);
end;
// Descriptografia
function Descriptografia(Senha :String) :String;
begin
  Result := ReverseString(Senha);
end;
{$R-} {$Q-}
function EncryptSTR(const InString:string; StartKey,MultKey,AddKey:Integer): string;
var I : Byte;
begin
  Result := '';
  for I := 1 to Length(InString) do
  begin
   // Result := Result +  CHAR(Byte(InString[I]) xor (StartKey shr 8));
    StartKey := (Byte(Result[I]) + StartKey) * MultKey + AddKey;
  end;
end;

function DecryptSTR(const InString:string; StartKey,MultKey,AddKey:Integer): string;
var I : Byte;
begin
  Result := '';
  for I := 1 to Length(InString) do
  begin
   // Result := Result + CHAR(Byte(InString[I]) xor (StartKey shr 8));
    StartKey := (Byte(InString[I]) + StartKey) * MultKey + AddKey;
  end;
end;
{$R+} {$Q+}

function DtPrev_Ok(dtcomp,dtprev :TDate ):boolean;
begin
  if (dtcomp > dtprev) then
     begin
        MostraMsgErro('Data Previsao Inválida');
        Dtprev_ok := False;
     end
  else
     DtPrev_Ok := true;
end;
function Datafinal(dataini:tdatetime; dias_uteis:integer):tdatetime;
//
// Retorna uma data acresçida de mais um certo número de dias
// uteis descontando os fins de semana
//
var dw:integer;
begin
  dw := DayOfWeek(dataini)-1;
  result := dataini+dias_uteis+((dias_uteis-1+dw) div 5)*2;
end;
function DateMais(Dat:TDateTime;Numdias:Integer): TDateTime;
{ Soma um determinado número de dias à data atual }
begin
 Dat := Dat + Numdias;
 Result := Dat;
end;
function AtribuiDia ( const data: TDateTime; const diaAtrib: Word ): TDateTime;
//
// Atribui à força o dia a uma data.
//
var
dia, mes, ano: Word;
begin
  DecodeDate ( data, ano, mes, dia );
  Result := EncodeDate ( ano, mes, diaAtrib );
end;
{Converte a primeira letra do texto especificado para
 maiuscula e as restantes para minuscula}
function Maiuscula(Texto:String): String;
begin
if Texto <> '' then
    begin
    Texto := UpperCase(Copy(Texto,1,1))+LowerCase(Copy(Texto,2,Length(Texto)));
    Result := Texto;
    end;
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
// Validar data
Function ValidarData(Data: TDateTime): Boolean;
Var
   Ano, Mes, Dia : Word;
Begin

   Result := False;

   DecodeDate(Data, Ano, Mes, Dia);

   If IsValidDate(Ano, Mes, Dia) Then

     Result := True;

end;
{ O código abaixo usa DOM, ou seja, o objeto XMLDocumento do Delphi para criar uma estrutura XML em memória, que posteriormente é salva em disco }

procedure ExpXML(DataSet : TDataSet; Arq : string);
var
  i: integer;
  xml: TXMLDocument;
  reg, campo: IXMLNode;
begin
  xml := TXMLDocument.Create(nil);
  try
    xml.Active := True;
    DataSet.First;
    xml.DocumentElement :=
      xml.CreateElement('DataSet','');
    DataSet.First;
    while not DataSet.Eof do
    begin
      reg := xml.DocumentElement.AddChild('row');
      for i := 0 to DataSet.Fields.Count - 1 do
      begin
        campo := reg.AddChild(
          DataSet.Fields[i].FieldName);
        campo.Text := DataSet.Fields[i].DisplayText;
      end;
      DataSet.Next;
    end;
    xml.SaveToFile(Arq);
  finally
    xml.free;
  end;
end;
// Verifica se o equipamento esta conextado a WEB
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
// Verifica a disponibilidade do WS
function WSDisponivel: Boolean;
begin
  try
    //MobileServico.HelloWorld;
    Result := True;
  except
    Result := False;
  end;
end;
// Gera uma identificação GUID
function GeraGUID: String;
var
 FGUID: TGUID;
begin
  CreateGUID(FGUID);
  Result := LimpaGUID(GUIDToString(FGUID));
end ;

// Limap GUID
function LimpaGUID(GUID: string): string;
var
FTexto: string;
begin
  FTexto := GUID;
  FTexto := Elimina(FTexto,'{');
  FTexto := Elimina(FTexto,'}');
  FTexto := Elimina(FTexto,'-');
  FTexto := Elimina(FTexto,'[');
  FTexto := Elimina(FTexto,']');
  Result := FTexto;
end;
// Substituição de Virgula e ponto
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

// Devolve um array de strings
function arraystring(S: String;
  separador: char): TStringList;
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

end.




