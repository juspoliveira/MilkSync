unit uExcel;

interface

uses
  Windows, OleServer, Variants, Excel2000;

const
  VersaoExcel97 = '8.0';
  VersaoExcel2000 = '9.0';
  VersaoExcel2002 = '10.0';
  VersaoExcel2003 = '11.0';
  VersaoExcel2007 = '12.0';
  AlinhamentoEsquerda = 1;
  AlinhamentoDireita = 2;
  AlinhamentoCentralizado = 3;
  OrientacaoRetrato = 1;
  OrientacaoPaisagem = 2;
  TextoNormal = 0;
  TextoNegrito = 1;
  TextoItalico = 2;
  TextoNegritoItalico = 3;
  TipoNumerico = 1;
  TipoCaracter = 2;
  TipoData = 3;
  TipoHora = 4;
  TipoDataHora = 5;
  TipoMoeda = 6;
  TipoBordaInferior = 1;
  TipoBordaSuperior = 2;
  TipoBordaEsquerda = 3;
  TipoBordaDireita = 4;

type
  TExcel = class
  private
    FAplicacao: TExcelApplication;
    FWorkbook: TExcelWorkbook;
    FWorksheet: TExcelWorksheet;
    FLCID: Integer;
    FVersao: string;
    FCaption: string;
    FVisivel: OleVariant;

    procedure SetCaption(const Value: string);
    function FormatoTexto(Tipo: Integer): string;
  public
    constructor Create; overload;
    constructor Create(Aplicacao: TExcelApplication; Workbook: TExcelWorkbook; Worksheet: TExcelWorksheet); overload;
    destructor Destroy; override;

    procedure Abrir(Arquivo: OleVariant; Visivel: Boolean = True);
    procedure Novo(Template: OleVariant);
    procedure Fechar;
    procedure Salvar;
    procedure SalvarComo(Nome: OleVariant);
    procedure Exibir;
    procedure Esconder;
    procedure Desconectar;
    procedure PreencherCelula(Celula: string; Valor: OleVariant; Tipo: Integer = TipoCaracter;
      Adicionar: Boolean = False);
    procedure ExportarCSV(Nome: OleVariant); 

    function PegarLetraColuna(IntNumber: Integer): string;
    function PegarNumeroLetra(Coluna: string): Integer;
    function PegarLinha(Coluna: string): Integer;
    procedure CorFundoCelula(CelulaInicial, CelulaFinal: string; Cor: OleVariant);
    procedure AjustarTamanhoColunas;
    procedure AdicionarBordas(CelulaInicial, CelulaFinal: string);
    procedure AdicionarBordaParcial(CelulaInicial, CelulaFinal: string; TipoBorda: Integer);
    procedure Merge(CelulaInicial, CelulaFinal: string);
    procedure AdicionarImagem(Arquivo: string; LinkArquivo, SalvarComDocumento,
      PosicaoX, PosicaoY, Largura, Comprimento: Integer);
    procedure OrientacaoPagina(Orientacao: Integer);
    procedure ConfigurarMargens(Esquerda, Direita, Superior, Inferior, Cabecalho, Rodape: Double);
    procedure AlterarTipoFonte(CelulaInicial, CelulaFinal: string; Tipo: Integer);
    procedure AlterarAlturaLinha(Celula: string; Valor: Integer);
    procedure AlterarTamanhoCelula(Celula: string; Valor: Integer);
    procedure OrientacaoCelula(Celula: string; Orientacao: Integer);
    procedure QuebrarTextoAutomaticamente(Celula: string);
    procedure RenomearPlanilha(Nome: string);
    procedure ConectarPlanilha(Planilha: Integer);
    procedure AdicionarPlanilhas(NumeroMaximo: Integer);
    procedure AlinharCelulas(CelulaInicial, CelulaFinal: string;
      AlinhamentoVertical, AlinhamentoHorizontal: Integer);
    procedure CorFonteCelula(CelulaInicial, CelulaFinal: string; Cor: OleVariant);
    procedure ExibirLinhaGrade(Exibir: Boolean);
    procedure Media(CelulaMedia, CelulaInicial, CelulaFinal: string);
    procedure Soma(CelulaSoma, CelulaInicial, CelulaFinal: string);    
    procedure AdicionarComentario(Celula, Comentario: string);
    procedure AjustarTextoCelula(Celula: string);
    procedure RemoverPlanilhaAtual;

    property Aplicacao: TExcelApplication read FAplicacao;
    property Workbook: TExcelWorkbook read FWorkbook;
    property Worksheet: TExcelWorksheet read FWorksheet;
    property LCID: Integer read FLCID write FLCID;
    property Versao: string read FVersao write FVersao;
    property Caption: string read FCaption write SetCaption;
  end;

implementation

uses
  SysUtils;

{ TExcel }

constructor TExcel.Create;
begin
  inherited;
  // Cria objeto associado ao Excel
  FAplicacao := TExcelApplication.Create(nil);
  FWorkbook := TExcelWorkbook.Create(nil);
  FWorksheet := TExcelWorksheet.Create(nil);

  FAplicacao.ConnectKind := ckNewInstance;
  FWorkbook.ConnectKind := ckAttachToInterface;
  FWorksheet.ConnectKind := ckAttachToInterface;

  FAplicacao.AutoConnect := False;
  FAplicacao.AutoQuit := False;

  FAplicacao.Connect;
  FLCID := GetUserDefaultLCID;
  FAplicacao.DisplayAlerts[FLCID] := False;

  FVersao := Trim(FAplicacao.Version[FLCID]);
end;

procedure TExcel.Abrir(Arquivo: OleVariant; Visivel: Boolean);
begin
  try
    FVisivel := Visivel;
    FAplicacao.Visible[FLCID] := Visivel;
    FWorkbook.Disconnect;
    FWorksheet.Disconnect;

    if FileExists(Arquivo) then
    begin
      if (FVersao = VersaoExcel97) or (FVersao = VersaoExcel2000) or (FVersao = VersaoExcel2002) or
        (FVersao = VersaoExcel2003) or (FVersao = VersaoExcel2007) then
      begin
        FWorkbook.ConnectTo(
          FAplicacao.Workbooks.Open(Arquivo, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
          EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
          EmptyParam, FLCID));
        Self.ConectarPlanilha(1);
      end;
    end;
  except
    raise Exception.Create(Format('Não foi possível abrir o arquivo %s.', [Arquivo]));
  end;
end;

constructor TExcel.Create(Aplicacao: TExcelApplication;
  Workbook: TExcelWorkbook; Worksheet: TExcelWorksheet);
begin
  inherited Create;

  FAplicacao := Aplicacao;
  FWorkbook := Workbook;
  FWorksheet := Worksheet;

  FAplicacao.ConnectKind := ckNewInstance;
  FWorkbook.ConnectKind := ckAttachToInterface;
  FWorksheet.ConnectKind := ckAttachToInterface;

  FAplicacao.AutoConnect := False;
  FAplicacao.AutoQuit := False;

  FAplicacao.Connect;
  FLCID := GetUserDefaultLCID;
  FAplicacao.DisplayAlerts[FLCID] := False;

  FVersao := Trim(FAplicacao.Version[FLCID]);
end;

procedure TExcel.Desconectar;
begin
  FAplicacao.Disconnect;
end;

destructor TExcel.Destroy;
begin
  // Fecha o Excel
  try
    FAplicacao.Quit;
  except
  end;
  inherited;
end;

procedure TExcel.Esconder;
begin
  FAplicacao.Visible[FLCID] := False;
  FVisivel := False;
end;

procedure TExcel.Exibir;
begin
  FAplicacao.Visible[FLCID] := True;
  FVisivel := True;
end;

procedure TExcel.Novo(Template: OleVariant);
begin
  try
    FAplicacao.Workbooks.Add(Template, FLCID);
    FWorkbook.ConnectTo(FAplicacao.Workbooks[1] as _WorkBook);
    FWorksheet.ConnectTo(FWorkbook.Worksheets[1] as _Worksheet);

    FWorksheet.Activate(FLCID);
    FAplicacao.ScreenUpdating[FLCID] := True;
  except
    raise Exception.Create('Não foi possível criar arquivo.');
  end;
end;

procedure TExcel.SetCaption(const Value: string);
begin
  FCaption := Value;
  FAplicacao.ActiveWindow.Caption := FCaption;
end;

procedure TExcel.Fechar;
begin
  try
    FWorkbook.Close;
  except
  end;
end;

procedure TExcel.Salvar;
begin
  FWorkbook.Save(FLCID);
end;

procedure TExcel.SalvarComo(Nome: OleVariant);
begin
  FWorkbook.SaveAs(Nome, xlWorkbookNormal, EmptyParam, EmptyParam, False, False, xlNoChange,
    xlLocalSessionChanges, True, 0, 0, FLCID);
end;

function TExcel.PegarLetraColuna(IntNumber: Integer): string;
begin
  if IntNumber < 1 then
    Result := 'A'
  else
  begin
    if IntNumber > 256 then
      Result := 'IV'
    else
    begin
      if IntNumber > 26 then
      begin
        Result := Chr(64 + (IntNumber div 26));
        Result := Result + Chr(64 + (IntNumber mod 26));
      end
      else
        Result := Chr(64 + IntNumber);
    end;
  end;
end;

procedure TExcel.CorFundoCelula(CelulaInicial, CelulaFinal: string; Cor: OleVariant);
begin
  Worksheet.Range[CelulaInicial, CelulaFinal].Interior.Color := Cor;
end;

procedure TExcel.AjustarTamanhoColunas;
begin
  Worksheet.Cells.EntireColumn.AutoFit;
end;

procedure TExcel.AdicionarBordas(CelulaInicial, CelulaFinal: string);
begin
  //xlHairline
  //xlThin
  //xlMedium
  //xlThick
  Worksheet.Range[CelulaInicial, CelulaFinal].Borders.Weight := xlThin;
end;

procedure TExcel.Merge(CelulaInicial, CelulaFinal: string);
begin
  Worksheet.Range[CelulaInicial, CelulaFinal].Merge(False);
end;

procedure TExcel.AdicionarImagem(Arquivo: string; LinkArquivo,
  SalvarComDocumento, PosicaoX, PosicaoY, Largura, Comprimento: Integer);
begin
  if FileExists(Arquivo) then
  begin
    FWorksheet.Shapes.AddPicture(Arquivo, LinkArquivo, SalvarComDocumento, PosicaoX, PosicaoY,
      Largura, Comprimento);
  end;
end;

procedure TExcel.OrientacaoPagina(Orientacao: Integer);
begin
  if Orientacao = OrientacaoRetrato then
    FWorksheet.PageSetup.Orientation := xlPortrait
  else if Orientacao = OrientacaoPaisagem then
    FWorksheet.PageSetup.Orientation := xlLandscape;
end;

procedure TExcel.ConfigurarMargens(Esquerda, Direita, Superior, Inferior,
  Cabecalho, Rodape: Double);
begin
  FWorksheet.PageSetup.LeftMargin := FAplicacao.InchesToPoints(Esquerda, FLCID);
  FWorksheet.PageSetup.RightMargin := FAplicacao.InchesToPoints(Direita, FLCID);
  FWorksheet.PageSetup.TopMargin := FAplicacao.InchesToPoints(Superior, FLCID);
  FWorksheet.PageSetup.BottomMargin := FAplicacao.InchesToPoints(Inferior, FLCID);
  FWorksheet.PageSetup.HeaderMargin := FAplicacao.InchesToPoints(Cabecalho, FLCID);
  FWorksheet.PageSetup.FooterMargin := FAplicacao.InchesToPoints(Rodape, FLCID);
end;

procedure TExcel.AlterarTipoFonte(CelulaInicial, CelulaFinal: string; Tipo: Integer);
begin
  case Tipo of
    TextoNormal:
      begin
        FWorksheet.Range[CelulaInicial, CelulaFinal].Font.Bold := False;
        FWorksheet.Range[CelulaInicial, CelulaFinal].Font.Italic := False;
      end;
    TextoNegrito:
      begin
        FWorksheet.Range[CelulaInicial, CelulaFinal].Font.Bold := True;
        FWorksheet.Range[CelulaInicial, CelulaFinal].Font.Italic := False;
      end;
    TextoItalico:
      begin
        FWorksheet.Range[CelulaInicial, CelulaFinal].Font.Bold := False;
        FWorksheet.Range[CelulaInicial, CelulaFinal].Font.Italic := True;
      end;
    TextoNegritoItalico:
      begin
        FWorksheet.Range[CelulaInicial, CelulaFinal].Font.Bold := True;
        FWorksheet.Range[CelulaInicial, CelulaFinal].Font.Italic := True;
      end;
  end;
end;

procedure TExcel.AlterarAlturaLinha(Celula: string; Valor: Integer);
begin
  FWorksheet.Range[Celula, Celula].RowHeight := Valor;
end;

procedure TExcel.OrientacaoCelula(Celula: string; Orientacao: Integer);
begin
  FWorksheet.Range[Celula, Celula].Orientation := Orientacao;

  //  FWorksheet.Range[Celula, Celula].RowHeight := 30;
end;

procedure TExcel.QuebrarTextoAutomaticamente(Celula: string);
begin
  FWorksheet.Range[Celula, Celula].WrapText := True;
end;

procedure TExcel.RenomearPlanilha(Nome: string);
begin
  FWorksheet.Name := Nome;
end;

procedure TExcel.ConectarPlanilha(Planilha: integer);
begin
  FWorksheet.ConnectTo(FWorkbook.Worksheets[Planilha] as _Worksheet);
  //  if FVisivel then
  FWorksheet.Activate(FLCID);
end;

procedure TExcel.AdicionarPlanilhas(NumeroMaximo: Integer);
var
  i: Integer;
begin
  for i := 1 to NumeroMaximo do
  begin
    if FAplicacao.Worksheets.Count = NumeroMaximo then
      break;
    FAplicacao.Worksheets.Add(EmptyParam, EmptyParam, EmptyParam, EmptyParam, FLCID);
  end;
end;

procedure TExcel.AlinharCelulas(CelulaInicial, CelulaFinal: string;
  AlinhamentoVertical, AlinhamentoHorizontal: Integer);
begin
  case AlinhamentoVertical of
    AlinhamentoEsquerda:
      Worksheet.Range[CelulaInicial, CelulaFinal].VerticalAlignment := xlLeft;
    AlinhamentoDireita:
      Worksheet.Range[CelulaInicial, CelulaFinal].VerticalAlignment := xlRight;
    AlinhamentoCentralizado:
      Worksheet.Range[CelulaInicial, CelulaFinal].VerticalAlignment := xlCenter;
  end;

  case AlinhamentoHorizontal of
    AlinhamentoEsquerda:
      Worksheet.Range[CelulaInicial, CelulaFinal].HorizontalAlignment := xlLeft;
    AlinhamentoDireita:
      Worksheet.Range[CelulaInicial, CelulaFinal].HorizontalAlignment := xlRight;
    AlinhamentoCentralizado:
      Worksheet.Range[CelulaInicial, CelulaFinal].HorizontalAlignment := xlCenter;
  end;

end;

function TExcel.FormatoTexto(Tipo: Integer): string;
var
  Formato: string;
begin
  Formato := EmptyStr;
  //Tipo = TipoNumerico é o Default. Não preciso passar
  if Tipo = TipoNumerico then
  else if Tipo = TipoCaracter then
    Formato := '@'
  else if Tipo = TipoData then
    Formato := 'dd/mm/aaaa'
  else if Tipo = TipoHora then
    Formato := 'hh:mm:ss'
  else if Tipo = TipoDataHora then
    Formato := 'dd/mm/aaaa hh:mm:ss'
  else if Tipo = TipoMoeda then
    Formato := 'R$ #.##0,00';

  Result := Formato;
end;

procedure TExcel.PreencherCelula(Celula: string; Valor: OleVariant;
  Tipo: Integer; Adicionar: Boolean);
var
  FFormato: string;
begin
  FFormato := Self.FormatoTexto(Tipo);

  if FFormato <> EmptyStr then
    Worksheet.Range[Celula, Celula].NumberFormat := FFormato;
  if Adicionar then
    Worksheet.Range[Celula, Celula].Value2 := Worksheet.Range[Celula, Celula].Value2 + Valor
  else
    Worksheet.Range[Celula, Celula].Value2 := Valor;
end;

procedure TExcel.AlterarTamanhoCelula(Celula: string; Valor: Integer);
begin
  FWorksheet.Range[Celula, Celula].Font.Size := Valor;
end;

function TExcel.PegarNumeroLetra(Coluna: string): Integer;
var
  FLetra: string;
  i: integer;
begin
  Result := -1;
  for i := 1 to Length(Coluna) do
  begin
    if not (Coluna[i] in ['0'..'9']) then
      FLetra := FLetra + Coluna[i];
  end;
  UpperCase(FLetra);

  if Length(FLetra) = 1 then
    Result := Ord(FLetra[1]) - 64
  else if Length(FLetra) = 2 then
  begin
    Result := (26 * (Ord(FLetra[1]) - 64)) + (Ord(FLetra[2]) - 64);
  end;
end;

procedure TExcel.CorFonteCelula(CelulaInicial, CelulaFinal: string; Cor: OleVariant);
begin
  Worksheet.Range[CelulaInicial, CelulaFinal].Font.Color := Cor;
end;

procedure TExcel.ExibirLinhaGrade(Exibir: Boolean);
begin
  FAplicacao.ActiveWindow.DisplayGridlines := Exibir;
end;

function TExcel.PegarLinha(Coluna: string): Integer;
var
  FNumero: string;
  i: Integer;
begin
  for i := 1 to Length(Coluna) do
  begin
    if (Coluna[i] in ['0'..'9']) then
      FNumero := FNumero + Coluna[i];
  end;
  Result := StrToIntDef(FNumero, -1);
end;

procedure TExcel.Media(CelulaMedia, CelulaInicial, CelulaFinal: string);
begin
  Worksheet.Range[CelulaMedia, CelulaMedia].Formula := Format('=AVERAGE(%s:%s)', [CelulaInicial, CelulaFinal]);
end;

procedure TExcel.AdicionarComentario(Celula, Comentario: string);
begin
  Worksheet.Range[Celula, Celula].AddComment(Comentario);
end;

procedure TExcel.AdicionarBordaParcial(CelulaInicial, CelulaFinal: string; TipoBorda: Integer);
begin
  //   FExcel.Worksheet.Range['B2', 'd2'].Borders[(xlDiagonalDown)].LineStyle := xlContinuous;
  //   FExcel.Worksheet.Range['B4', 'd4'].Borders[(xlDiagonalUp)].LineStyle := xlContinuous;
  //   FExcel.Worksheet.Range['B14', 'b16'].Borders[(xlInsideHorizontal)].LineStyle := xlContinuous;
  //   FExcel.Worksheet.Range['B16', 'd16'].Borders[(xlInsideVertical)].LineStyle := xlContinuous;
  
  if TipoBorda = TipoBordaInferior then
    Worksheet.Range[CelulaInicial, CelulaFinal].Borders[(xlEdgeBottom)].LineStyle := xlContinuous
  else if TipoBorda = TipoBordaSuperior then
    Worksheet.Range[CelulaInicial, CelulaFinal].Borders[(xlEdgeTop)].LineStyle := xlContinuous
  else if TipoBorda = TipoBordaEsquerda then
    Worksheet.Range[CelulaInicial, CelulaFinal].Borders[(xlEdgeLeft)].LineStyle := xlContinuous
  else if TipoBorda = TipoBordaDireita then
    Worksheet.Range[CelulaInicial, CelulaFinal].Borders[(xlEdgeRight)].LineStyle := xlContinuous;
end;

procedure TExcel.AjustarTextoCelula(Celula: string);
begin
  Worksheet.Range[Celula, Celula].ShrinkToFit := True;
end;

procedure TExcel.RemoverPlanilhaAtual;
begin
  Worksheet.Delete;
end;
procedure TPOExcel.ExportarCSV(Nome: OleVariant);
begin
  FWorkbook.SaveAs(ChangeFileExt(Nome, '.CSV'), xlCSVMSDOS, EmptyParam, EmptyParam, False, False, xlNoChange,
    xlLocalSessionChanges, True, 0, 0, FLCID);
end;

procedure TPOExcel.Soma(CelulaSoma, CelulaInicial, CelulaFinal: string);
begin
  Worksheet.Range[CelulaSoma, CelulaSoma].Formula := Format('=SUM(%s:%s)', [CelulaInicial, CelulaFinal]);
end;

end.

