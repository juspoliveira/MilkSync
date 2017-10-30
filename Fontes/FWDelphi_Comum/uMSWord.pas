{Classe TWord
 Autor: Evanio Silva
}

unit uMSWord;

interface

uses
 Windows, OleServer, Variants, Word2010, JvVCLUtils;

const
  TextoNormal = 0;
  TextoNegrito = 1;
  TextoItalico = 2;
  TextoNegritoItalico = 3;
  InicioParagrafo = 5; //wdLine
  InicioTexto = 6;  //wdStory
  MoveLinhaAcima = -1;
  MoveLinhaAbaixo = 1;
  VersaoWord97 = '8.0';
  VersaoWord2000 = '9.0';
  VersaoWord2002 = '10.0';
  VersaoWord2003 = '11.0';
  VersaoWord2007 = '12.0';
  VersaoWord2010 = '14.0';
  VersaoWord2013 = '15.0';
  AjusteAutomaticoConteudo = 1;
  MesclarNovoDocumento = 0;
  TipoArqWord = 0;
  TipoArqHTML = 8;
  TipoArqPDF = 17;
type
  TWord = class
    private
      FAplicacao: TWordApplication;
      FDocumento: TWordDocument;
      FVersao: String;
      FCaption: String;
    procedure SetCaption(const Value: String);
    public         procedure GetFirstPageAsImage;

      constructor Create; overload;
      constructor Create(Aplicacao: TWordApplication; Documento: TWordDocument); overload;
      destructor Destroy; override;
      function QtdCampoMesclagem: Integer;
      function ObterTextoSelecionado: OleVariant;
      procedure Novo(Template: OleVariant);
      procedure Abrir(Arquivo: OleVariant; Visivel: Boolean = True);
      procedure SalvarComo2000(Nome: OleVariant);
      procedure SalvarComo(Nome: OleVariant; TipoArquivo: Integer = TipoArqWord);
      procedure Fechar;
      procedure Imprimir;
      procedure Substituir(TextoVelho, TextoNovo: OleVariant);
      procedure AdicionarCampoMesclagem(Campo: OleVariant);
      procedure Exibir;
      procedure Esconder;
      procedure InserirTexto(Texto: OleVariant);
      procedure InserirParagrafo(Quantidade: Integer);
      procedure AlterarTamanhoFonte(Tamanho: Integer);
      procedure AlterarTipoFonte(Tipo: Integer);
      procedure PosicionarCursor(Posicao: Integer);
      procedure Indentar(Caracteres: Integer);
      procedure SelecionarCampoMesclagem(Campo: Integer);
      procedure AlterarTextoSelecionado(Texto: OleVariant);
      procedure ExcluirLinhaAtual;
      procedure ExcluirCaracter;
      procedure MoverLinha(Direcao: Integer);
      procedure ReiniciarParagrafo;
      function CriarTabela(NumLinhas, NumColunas: Integer; AjusteAutomaticoColunas: OleVariant): Table;
      procedure SelecionarProximoItemTabela;
      procedure SelecionarItemAnteriorTabela;
      procedure Desconectar;
      procedure SetFocus;

      property Aplicacao: TWordApplication read FAplicacao;
      property Documento: TWordDocument read FDocumento;
      property Caption: String read FCaption write SetCaption;
      property Versao: String read FVersao write FVersao;
  end;

var
  FOpcional, FFalse, FTrue: OleVariant;

implementation

uses SysUtils, uRotinasComuns;

{ TWord }

procedure TWord.Abrir(Arquivo: OleVariant; Visivel: Boolean = True);
var
  FVisivel: OleVariant;
begin
  try
    FVisivel := Visivel;
    FAplicacao.Visible := Visivel;
    FDocumento.Disconnect;
    if FileExists(Arquivo) then
    begin
      FDocumento.ConnectTo(FAplicacao.Documents.Open(Arquivo, EmptyParam, EmptyParam,
        EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
        EmptyParam, EmptyParam, FVisivel, EmptyParam, EmptyParam, EmptyParam, EmptyParam));

      if not FVisivel then
        FDocumento.Activate;
      
      FAplicacao.Options.CheckSpellingAsYouType := False;
      FAplicacao.Options.CheckGrammarAsYouType := False;
    end;
  except
    raise Exception.Create(Format('Não foi possível abrir o arquivo %s.', [Arquivo]));
  end;
end;

constructor TWord.Create;
begin
  inherited;
  // Cria objeto associado ao Word
  FAplicacao := TWordApplication.Create(nil);
  FDocumento := TWordDocument.Create(nil);

  FAplicacao.ConnectKind := ckRunningOrNew;
//  FDocumento.ConnectKind := ckAttachToInterface;
  FAplicacao.Connect;

  FVersao := Trim(FAplicacao.Version);
end;

constructor TWord.Create(Aplicacao: TWordApplication;
  Documento: TWordDocument);
begin
  inherited Create;
  FAplicacao := Aplicacao;
  FDocumento := Documento;

  FAplicacao.ConnectKind := ckNewInstance;
  FDocumento.ConnectKind := ckAttachToInterface;
  FAplicacao.Connect;

  FVersao := Trim(FAplicacao.Version);
end;

destructor TWord.Destroy;
begin
  // Fecha o Word
  try
    FAplicacao.Quit(FFalse, FFalse, FFalse);
  except
  end;
  inherited;
end;

procedure TWord.Fechar;
begin
  try
    FDocumento.Close(FFalse, FFalse, FFalse);
  except
    ;// Silencia Exceção
  end;
end;

procedure TWord.Imprimir;
begin
  FDocumento.PrintOut(FFalse, FOpcional, FOpcional, FOpcional, FOpcional, FOpcional,
    FOpcional, FOpcional, FOpcional, FOpcional, FOpcional, FOpcional,
    FOpcional, FOpcional, FOpcional, FOpcional, FOpcional, FOpcional);
end;

procedure TWord.Novo(Template: OleVariant);
begin
  try
    Documento.ConnectTo(Aplicacao.Documents.Add(Template, EmptyParam, EmptyParam, EmptyParam));
  except
    raise Exception.Create('Não foi possível criar arquivo.');
  end;
end;

procedure TWord.SalvarComo(Nome: OleVariant; TipoArquivo: Integer = TipoArqWord);
var
  TipoArq: OleVariant;
begin
  TipoArq := TipoArquivo;

  if (TipoArq = TipoArqWord) then
   FDocumento.SaveAs(Nome)
  else
   FDocumento.SaveAs(Nome, TipoArq);
end;

procedure TWord.SalvarComo2000(Nome: OleVariant);
var
  FNome: Olevariant;
begin
  FNome := Nome;
  FDocumento.SaveAs(FNome, FOpcional, FOpcional, FOpcional, FOpcional, FOpcional,
    FOpcional, FOpcional, FOpcional);
end;

procedure TWord.Substituir(TextoVelho, TextoNovo: OleVariant);
var
  FTextoVelho, FTextoNovo, FSubstituirTodos: OleVariant;
begin
  try
    FTextoVelho := TextoVelho;
    FTextoNovo := TextoNovo;
    FSubstituirTodos := wdReplaceAll;
    FDocumento.Content.Find.Execute(FTextoVelho, FFalse, FFalse, FFalse, FFalse,
      FFalse, FFalse, FOpcional, FOpcional, FTextoNovo, FSubstituirTodos,
      FOpcional, FOpcional, FOpcional, FOpcional);
  except
    raise Exception.Create('Não foi possível substituir texto(s) no arquivo.');
  end;
end;

procedure TWord.Esconder;
begin
  FAplicacao.Visible := False;
end;

procedure TWord.Exibir;
begin
  FAplicacao.Visible := True;
end;

procedure TWord.AlterarTamanhoFonte(Tamanho: Integer);
begin
  if Tamanho > 0 then
    FAplicacao.Selection.Font.Size := Tamanho;
end;

procedure TWord.AlterarTipoFonte(Tipo: Integer);
begin
  case Tipo of
    TextoNormal:
      begin
        FAplicacao.Selection.Font.Bold := 0;
        FAplicacao.Selection.Font.Italic := 0;
      end;
    TextoNegrito:
      begin
        FAplicacao.Selection.Font.Bold := 1;
        FAplicacao.Selection.Font.Italic := 0;
      end;
    TextoItalico:
      begin
        FAplicacao.Selection.Font.Bold := 0;
        FAplicacao.Selection.Font.Italic := 1;
      end;
    TextoNegritoItalico:
      begin
        FAplicacao.Selection.Font.Bold := 1;
        FAplicacao.Selection.Font.Italic := 1;
      end;
  end;
end;

procedure TWord.Indentar(Caracteres: Integer);
begin
  if Caracteres > 0 then
    FAplicacao.Selection.Paragraphs.IndentCharWidth(Caracteres);
end;

procedure TWord.InserirParagrafo(Quantidade: Integer);
var
  i: Integer;
begin
  for i := 1 to Quantidade do
    FAplicacao.Selection.TypeParagraph;
end;

procedure TWord.InserirTexto(Texto: OleVariant);
begin
  FAplicacao.Selection.TypeText(Texto);
end;

procedure TWord.PosicionarCursor(Posicao: Integer);
var
  FUnit, FExtend: OleVariant;
begin
  FUnit := Posicao;
  FExtend := wdMove;
  FAplicacao.Selection.HomeKey(FUnit, FExtend);
end;

function TWord.QtdCampoMesclagem: Integer;
begin
  Result := FDocumento.MailMerge.Fields.Count;
end;

procedure TWord.SelecionarCampoMesclagem(Campo: Integer);
begin
  FDocumento.MailMerge.Fields.Item(Campo).Select;
end;

function TWord.ObterTextoSelecionado: OleVariant;
begin
  Result := FAplicacao.Selection.Text;
end;

procedure TWord.AlterarTextoSelecionado(Texto: OleVariant);
begin
  FAplicacao.Selection.Text := Texto;
end;

procedure TWord.ExcluirLinhaAtual;
var
  FUnit, FValue, FExtend: OleVariant;
begin
  FUnit := InicioParagrafo;
  FValue := 1;
  FExtend := wdMove;

  //Posiciona o cursor no começo da linha
  FAplicacao.Selection.HomeKey(FUnit, FExtend);
  //Seleciona a linha, do ponto em que o cursor está até o final da linha
  FAplicacao.Selection.MoveEnd(FUnit, FValue);

  //Deleta a linha selecionada
  FUnit := wdCharacter;
  FAplicacao.Selection.Delete(fUnit, fValue);
end;

procedure TWord.ExcluirCaracter;
var
  FUnit, FValue: OleVariant;
begin
  FUnit := wdCharacter;
  FValue := 1;
  FAplicacao.Selection.Delete(fUnit, fValue);
end;

procedure TWord.MoverLinha(Direcao: Integer);
var
  FUnit, FValue: OleVariant;
begin
  //Usar as Constantes:
    //MoveLinhaAcima
    //MoveLinhaAbaixo
  FUnit := wdLine;
  FValue := Direcao;
  FAplicacao.Selection.Move(fUnit, fValue);
end;

procedure TWord.ReiniciarParagrafo;
begin
  FAplicacao.Selection.Paragraphs.Reset;
end;

procedure TWord.AdicionarCampoMesclagem(Campo: OleVariant);
begin
  FDocumento.MailMerge.Fields.Add(FAplicacao.Selection.Range, Campo);
  //Seleciona o próximo parágrafo (linha de baixo)
  //  FAplicacao.Selection.TypeParagraph;
end;

function TWord.CriarTabela(NumLinhas, NumColunas: Integer; AjusteAutomaticoColunas: OleVariant): Table;
begin
  Result := FAplicacao.Selection.Tables.Add(FAplicacao.Selection.Range, NumLinhas, NumColunas,
    EmptyParam, AjusteAutomaticoColunas);
end;

procedure TWord.SelecionarProximoItemTabela;
var
  FUnidade, FNumero: OleVariant;
begin
  FUnidade := wdCell;
  FNumero := 1;
  FAplicacao.Selection.MoveRight(FUnidade, FNumero, EmptyParam);
end;

procedure TWord.SelecionarItemAnteriorTabela;
var
  FUnidade, FNumero: OleVariant;
begin
  FAplicacao.Selection.MoveLeft(FUnidade, FNumero, EmptyParam);
end;

procedure TWord.SetCaption(const Value: String);
begin
  FCaption := Value;
  FDocumento.ActiveWindow.Caption := FCaption;
end;

procedure TWord.Desconectar;
begin
  FAplicacao.Disconnect;
end;

procedure TWord.SetFocus;
var
  WordHandle: HWND;
begin
  { Find the Word window handle }
  WordHandle := FindWindow('OpusApp', nil);

  SwitchToWindow(WordHandle, False);
end;

procedure TWord.GetFirstPageAsImage;
begin
  FAplicacao.Selection.WholeStory;
  FAplicacao.Selection.CopyAsPicture;

end;

initialization
  // Inicializa variáveis globais
  FTrue := True;
  FFalse := False;
  TvarData(FOpcional).VType := varERROR;
  TvarData(FOpcional).VInteger:= DISP_E_PARAMNOTFOUND;
end.

