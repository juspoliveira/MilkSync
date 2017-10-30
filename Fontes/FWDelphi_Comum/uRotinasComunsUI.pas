// Evanio R. Silva
// Rotinas Comuns para Interface
unit uRotinasComunsUI;

interface
uses

  Windows, SysUtils, Classes, JvComputerInfoEx, Controls, Forms, Messages, JvCalc, ExtActns;

type

  TRotinasComunsUI = class
  private
    FInfoComputador: TJvComputerInfoEx;
    FCalculadora: TJvCalculator;
  public
    constructor Create;
    destructor Destroy; override;
    property InfoComputador: TJvComputerInfoEx read FInfoComputador;
    property Calculadora: TJvCalculator read FCalculadora;
    procedure TratarBotaoCentralMouse(ScrollBox: TScrollBox; MousePos: TPoint; Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean);
    procedure AplicarMascaraCampoTextoSimples(Sender: TObject; var Key: Char);
    procedure AplicarMascaraCampoNumero(Sender: TObject; var Key: Char);
    function Mensagem(Mensagem, Titulo: string; Botao, Tipo: Integer; Abortar: Boolean = false): Integer;
    procedure ExibirArquivo(Arquivo: string);
  end;

function RotinasComunsUI: TRotinasComunsUI;

const
  //Constantes para a função Mensagem()
  MensagemErro = 0;
  MensagemAviso = 1;
  MensagemInformacao = 2;
  MensagemConfirmacao = 3;
  BotaoOK = 0;
  BotaoOKCancela = 1;
  BotaoSimNao = 2;
  
implementation

var
  FRotinasComunsUI: TRotinasComunsUI;

procedure TRotinasComunsUI.AplicarMascaraCampoNumero(Sender: TObject; var Key: Char);
begin
  if (Ord(Key) <> VK_SPACE) and (Ord(Key) <> VK_BACK) and (Ord(Key) <> 3) and
     (Ord(Key) <> 24) and (Ord(Key) <> 26) then   // Ignora teclas edição
  begin
   if not((Key in ['a'..'z']) or (Key in ['A'..'Z'])) then
     Key := #0;
  end;
end;


procedure TRotinasComunsUI.AplicarMascaraCampoTextoSimples(Sender: TObject; var Key: Char);
begin
  if (Ord(Key) <> VK_SPACE) and (Ord(Key) <> VK_BACK) and (Ord(Key) <> 3) and 
     (Ord(Key) <> 24) and (Ord(Key) <> 26) then   // Ignora teclas edição
  begin
   if not((Key in ['a'..'z']) or (Key in ['A'..'Z'])) then
     Key := #0;
  end;
end;

constructor TRotinasComunsUI.Create;
begin
  FInfoComputador := TJvComputerInfoEx.Create(nil);
  FCalculadora := TJvCalculator.Create(nil);
end;

destructor TRotinasComunsUI.Destroy;
begin
  FInfoComputador.Free;
  FCalculadora.Free;
end;

function RotinasComunsUI: TRotinasComunsUI;
begin
  if FRotinasComunsUI = nil then
    FRotinasComunsUI := TRotinasComunsUI.Create;

  Result := FRotinasComunsUI;
end;
procedure TRotinasComunsUI.TratarBotaoCentralMouse(ScrollBox: TScrollBox; MousePos: TPoint; Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean);
var
  msg: Cardinal;
  code: Cardinal;
  i, n: Integer;
begin
  Handled := true;
  if ssShift in Shift then
    msg := WM_HSCROLL
  else
    msg := WM_VSCROLL;

  if WheelDelta < 0 then
    code := SB_LINEDOWN
  else
    code := SB_LINEUP;

  n := Mouse.WheelScrollLines;
  for i := 1 to n do
    ScrollBox.Perform(msg, code, 0);
  ScrollBox.Perform(msg, SB_ENDSCROLL, 0);
end;

function TRotinasComunsUI.Mensagem(Mensagem, Titulo: string; Botao, Tipo: Integer; Abortar: Boolean): Integer;
var
  FTipo: Integer;
begin
  FTipo := 0;

  if Tipo = MensagemErro then
  begin
    if Botao = BotaoOK then
      FTipo := 16
    else if Botao = BotaoOKCancela then
      FTipo := 17
    else if Botao = BotaoSimNao then
      FTipo := 20;
  end
  else if Tipo = MensagemAviso then
  begin
    if Botao = BotaoOK then
      FTipo := 48
    else if Botao = BotaoOKCancela then
      FTipo := 49
    else if Botao = BotaoSimNao then
      FTipo := 52;
  end
  else if Tipo = MensagemInformacao then
  begin
    if Botao = BotaoOK then
      FTipo := 64
    else if Botao = BotaoOKCancela then
      FTipo := 65
    else if Botao = BotaoSimNao then
      FTipo := 68;
  end
  else if Tipo = MensagemConfirmacao then
  begin
    if Botao = BotaoOK then
      FTipo := 32
    else if Botao = BotaoOKCancela then
      FTipo := 33
    else if Botao = BotaoSimNao then
      FTipo := 36;
  end;
  Result := Application.MessageBox(PAnsiChar(Mensagem), PAnsiChar(Titulo), FTipo);

  if Abortar then
    Abort;
end;

procedure TRotinasComunsUI.ExibirArquivo(Arquivo: string);
var actFileRun: TFileRun;
begin
  actFileRun := TFileRun.Create(nil);
  try
    actFileRun.FileName := Arquivo;
    actFileRun.Operation := 'open';
    actFileRun.Directory := ExtractFilePath(Arquivo);
    actFileRun.Execute;
  finally
    FreeAndNil(actFileRun);
  end;
end;

end.


