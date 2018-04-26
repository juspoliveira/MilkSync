unit uVSSCLRCnExport;

interface
uses
  SysUtils, Classes;
const
  CreateTableRetornoSCA =
  'CREATE TABLE [lancamentos] ( ' +
  '[_id] INTEGER PRIMARY KEY AUTOINCREMENT, ' +
  '[codigo] TEXT(6), '+
  '[fazenda] TEXT(2), '+
  '[materia] TEXT(3), '+
  '[linha] TEXT(4), '+
  '[data] TEXT, '+
  '[hora] TEXT, '+
  '[volume] double, '+
  '[ntanque] int, '+
  '[temperatura] double);';
const
  InsertTableRetornoSCA =
  ' Insert into lancamentos( '+
  ' codigo, fazenda, materia, linha, data, hora, volume, ntanque, temperatura) '+
  ' values(:codigo, :fazenda, :materia, :linha, :data, :hora, :volume, :ntanque, '+
  ' :temperatura);';
type
  TAbrirBanco = class
    criou : Boolean;
    success : Boolean;
    exists : Boolean;
  end;
type
  TMovimentoRM = class   // // Movimento RM
    tipoLinha : string; // [01]
    codFilial : Integer;
    codDepartamento: string; //[30];
    codLocal: string; //[15];
    codLocalEntrega: string; //[15];
    codLocalDestino: string; //[15];
    codClienteFornecedor: string; //[25];
    codClienteFornecedorFluxus: string; //[25];
    numeroMovimento: string; //[35];
    serie: string;//[08];
    codTipoMovimento: string; //[10];
    tipo: string;//[1];
    status: string; //[1];
    movImpressao: Byte;
    docImpressao: Byte;
    faturaImpressao: Byte;
    dataEmissao: string; //[10];
    dataSaida: string; //[10];
    dataExtra1: string;//[10];
    dataExtra2: string; //[10];
    codRepresentante: string; //[15];
    comissaoRepresentante: Double;
    numeroOrdem: string; //[20];
    codCondPagamento: string; //[05];
    numeroTributos: Integer;
    valorBruto: Double;
    valorLiquido: Double;
    valorOutros: Double;
    observacao: string; //[60];
    percentualFrete: Double;
    valorFrete: Double;
    percentualSeguro: Double;
    valorSeguro: Double;
    percentualDesconto: Double;
    valorDesconto: Double;
    percentualDespesa: Double;
    valorDespesa: Double;
    percentualExtra1: Double;
    valorExtra1: Double;
    percentualExtra2: Double;
    valorExtra2: Double;
    codFuncionario1: string; //[16];
    percComisFuncionario: Double;
    codMensagem: string; //[05];
    codMensagem2: string; //[05];
    viaTransporte: string; //[15];
    placa: string; //[10];
    codEstadoPlaca: string; //[02];
    pesoLiquido: Double;
    pesoBruto: Double;
    marca: string; //[10];
    numero: Integer;
    quantidade: Double;
    especie: string; //[15];
    codTabelaEstoque1: string; //[10];
    codTabelaEstoque2: string; //[10];
    codTabelaEstoque3: string; //[10];
    codTabelaEstoque4: string; //[10];
    codTabelaEstoque5: string; //[10];
    codTabelaFaturamento1: string; //[25];
    codTabelaFaturamento2: string; //[25];
    codTabelaFaturamento3: string; //[25];
    codTabelaFaturamento4: string; //[25];
    codTabelaFaturamento5: string; //[25];
    campoLivre1: string; //[100];
    campoLivre2: string; //[100];
    campoLivre3: string; //[100];
    codMoeda: string; //[10];
    dataBaseMovimento: string; //[10];
    dataMovimento: string; //[10];
    numeroLancamentoGerado: Integer;
    gerouFatura: Integer;
    numeroLancamentoAberto: Integer;
    codFuncionario2: string; //[16];
    codUsuario: string; //[20];
    flagExportacao: Integer;
    emiteBoleta: string; //[1];
    codMensagemDesconto: string; //[05];
    codMensagemDespesa: string; //[05];
    codMensagemFrete: string; //[05];
    freteCifFob: Integer;
    usaDespesasFinanceiras: Integer;
    identificadorNatureza: Integer;
    flagExportacaoFisc: Integer;
    flagExportacaoSecFazenda: Integer;
    codFuncionario3: string; //[16];
    codFuncionario4: string; //[16];
    percComisFuncionario2: Double;
    identificadorNatureza2: Integer;
    valorAdiantamento: Double;
    codTransportadora: string; //[05];
    codTransportadora2: string; //[05];
    statusLiberacao: Integer;
    itensAgrupados: Integer;
    flagImpressaoFaturamento: string; //[1];
    dataCancelamentoMovimento: string; //[10];
    segundoNumeto: Integer;
    codCentroCusto: string; //[25];
    codColigadaCtaCaixa: Integer;
    codCtaCaixa: string; //[10];
    codFilialDestino: Integer;
    codCentroCustoDestino: string; //[25];
    codColigadaClienteFornecedor: Integer;
    coligadaCFNatureza: Integer;
    idMovLancamentoFluxus: Integer;
    dataEntrega: string; //[10];
    numeroCaixa: Integer;
    numeroCupom: Integer;
    horaEmissaoMovimento: string; //[20];
    codFilialEntregaSaida: Integer;
    codnatureza: string; //[20];
    codnatureza2: string; //[20];
    campoCnpj: string; //[20];
    dataContabilizacao: string; //[10];
    codServico: Integer;
    municipioPrestacaoServico: Integer;
    codEstadoMunicipio: Integer;
    pontoVenda: string; //[10];
    codEvento: Integer;
    codTipoDocumento: string; //[10];
    codRetencaoIrrf: string; //[10];
    percDeducaoIrrf: Double;
    percBaseInssEmpregado: Double;
    percBaseGeracaoInss: Double;
    codigoProjeto: string; //[24];
    revisao: Integer;
    subSerie: string; //[08];
    contatoEntrega: string; //[10];
    valorInssOutrasEmpresas: Double;
    apropMovRmSolum: string; //[05];
    datalancamento: string; //[10];
    contadorReinicioOperacao: Integer;
    coo: Integer;
    numeroReducaoZ: Integer;
    horarioEntradaSaidaMov: string; //[20];
    tipoEntrega: string; //[15];
    statusRecibo: Integer;
    tipoRecibo: Integer;
    situacaoRecibo: string; //[1];
    numeroAutorizacao: Integer;
    private

    public
      procedure setValoresDefault;
      function toString:string;
  end;
 type

  // Itens do Movimento RM

  TItensMovimentoRM = class
    tipoLinha : string; //[1];
    codigoProduto: string; //[30];
    numeroSequencial: Integer;
    codTipoProduto: string; //[10];
    quantidade: Double;
    precoUnitario: Double;
    precoTabela: Double;
    percDesconto: Double;
    valorDesconto: Double;
    percDespesa: Double;
    valorDespesa: Double;
    dataEmissao: string; //[10];
    codMensagem: string; //[05];
    numeroTributos: Integer;
    codTabelaEstoque1: string; //[10];
    codTabelaEstoque2: string; //[10];
    codTabelaEstoque3: string; //[10];
    codTabelaEstoque4: string; //[10];
    codTabelaEstoque5: string; //[10];
    codTabelaFaturamento1: string; //[25];
    codTabelaFaturamento2: string; //[25];
    codTabelaFaturamento3: string ;//[25];
    codTabelaFaturamento4: string; //[25];
    codTabelaFaturamento5: string; //[25];
    campoLivre: string; //[15];
    codUnidade: string; //[05];
    quantidadeReceber: Double;
    identificacaoNatureza: Integer;
    codCondicaoPagamento: string; //[05];
    dataEntrega: string; //[10];
    prateleira: string; //[15];
    identificadorContrato: Integer;
    seqItemContrato: Integer;
    valorTotalItem: Double;
    centroCusto: string; //[25];
    codigoNatureza: string; //[20];
    representante: string; //[15];
    codigoProduto1: string; //[30];
    codigoDepartamento: string; //[25];
    tributacaoEcf: string; //[10];
    valorEscrituracao: string; //[20];
    valorCodigoProduto: Double;
    tipoCodigoProduto: string; //[05];
    codigoSituacaoTributaria: Integer;
    codigoTarefa: string; //[60];
    codTabNatOrcamento: string; //[10];
    valorOpcionalFormula1: Double;
    valorOpcionalFormula2: Double;
    cancelado: string; //[1];
    valorUnitarioMovimento: Double;
    valorOrcamento: Double;
    percComisRepresentante: Integer;
    qtdeUnidadePedido: Integer;
    codFilial: Integer;
    codLocalEstoque: string; //[15];
    valorLiquidoItem: Double;
    codFuncionario: string; //[16];
    comisFuncionarioItem: Double;

    private

    public
      procedure setValoresDefault;
      function toString:string;
  end;
// Registros de Mapa de coleta TOTVS - Datasul
type
{ Dados da Viagem}
  TCargaRural = class
    CodigoRegistro : Integer;
    Carga : string; //[15];
    Estabelecimento: string; //[5];
    Rota: string; //[12];
    NomeMotorista : string; //[50];
    CodigoTransportador : Integer;
    CodigoVeiculo: string; //[15];
    Placa: string; //[10];
    UfPlaca: string; //[2];
    HodometroInicial: Double;
    HodometroFinal: Double;
    Item: string; //[15];
    Referencia: string; //[8];
    PesoBruto: Double;
    Densidade: Double;
    DataTransacao: string; //[10];
    QtdeCompartimentos: Integer;

    public
     procedure setValoresDefaul;
     function toString: string;
    private

  end;

 type
{Registros de Coletas}
  TProdutorCarga = class
    CodigoRegistro: Integer;
    Carga: string; //[15];
    Produtor: string; //[20];
    PontoColeta: string; //[12];
    QtdeColetada: Double;
    Compartimento: Integer;
    Temperatura: Double;
    Observacoes: string; //[150];
    Repostiorio: Integer;
    Amostra: string; //[20];
    Lacre: string; //[20];
    Propriedade: string; //[30];
    MotivoNaoColeta: string; //[20];
    Regua: Double;
    DataColeta: string; //[10];
    HoraColeta: string; //[6]
    public
      procedure setValoresDefault;
      function toString: string;

    private
  end;

type
  TSendMessage = class
    conta: string;
    rota: string;
    prioridade: string;
    titulo: string;
    data: string;
    NomeRota: string;
    NomeLinha: String;
    AgenteColeta: string;
    PlacaVeiculo: string;
    Mensangem: string;
    public
      procedure clear;
      function dataToJson: TStringList;
      function dataToArray: TStringList;
  end;
type
  TResumoViagem = class
    id : Integer;
    dataInicio: TDateTime;
    dataFim: TDateTime;
    kmInicio: Integer;
    kmFinal: Integer;
    distancia: Integer;
    veiculoCodigo: string;
    veiculoPlaca: string;
    linhaCodigo: string;
    linhaNome: string;
    rotaCodigo: string;
    rotaNome: string;
    coletorCodigo: string;
    coletorNome: string;
    tecnicoCodigo: string;
    tecnicoNome: string;
    volumeInformado: Integer;
    volumeAferido: Integer;
    volumeDescartado: Integer;
    atesto: Integer;
    tipoDescarga: string; // B- Balanca, M-Medidor Vazao , A-Ambos
    qtdeVisitas: Integer;
    qtdeCancelados: Integer;
    qtdeNaoRealizados: Integer;
    descarregada : string;
    repositoriosVeiculo: record
      bocas: array[0..6] of Char;
      qtdeBocas: array[0..6] of Integer;
      tempBocas: array[0..6] of Double;
    end;
    destinoVolume : record
      silos: array[0..5] of string;
      qtdeSilo: array [0..5] of Integer;
    end;
    public
      public constructor Create();
      public destructor Destroy;  override;
      function buildColunsName(separador: char): string;
      function toString (separador: Char) : string;
  end;


procedure createParametros;
procedure populaParametros;
procedure destroiParametros;

var
TParametros, TValores : TStringList;

implementation

uses uGlobal;


// Inicializa parametros sistema SCA
procedure createParametros;
begin
  TParametros := TStringList.Create;
  TValores := TStringList.Create;
end;
procedure populaParametros;
begin
  TParametros.Clear;
  Tparametros.Add('codigo');
  Tparametros.Add('fazenda');
  Tparametros.Add('materia');
  Tparametros.Add('linha');
  Tparametros.Add('data');
  Tparametros.Add('hora');
  Tparametros.Add('volume');
  Tparametros.Add('ntanque');
  Tparametros.Add('temperatura');
  // Inicializa
  TValores.Clear;
  TValores.Add(EmptyStr);
  TValores.Add(EmptyStr);
  TValores.Add(EmptyStr);
  TValores.Add(EmptyStr);
  TValores.Add(EmptyStr);
  TValores.Add(EmptyStr);
  TValores.Add(EmptyStr);
  TValores.Add(EmptyStr);
  TValores.Add(EmptyStr);
end;
procedure destroiParametros;
begin
  TParametros.Destroy;
  TValores.Destroy;
end;

{ TMovimentoRM }


procedure TMovimentoRM.setValoresDefault;
begin
  Self.tipoLinha := 'M';
  Self.codFilial := 4;
  Self.codDepartamento := PreencheEspacoDireita('',30);
  Self.codLocal := '017'+ PreencheEspacoDireita('',12);
  Self.codLocalEntrega := PreencheEspacoDireita('',15);
  Self.codLocalDestino := '017'+ PreencheEspacoDireita('',12);
  Self.codClienteFornecedor := PreencheEspacoDireita('',25);
  Self.codClienteFornecedorFluxus := PreencheEspacoDireita('',25);
  Self.numeroMovimento := PreencheEspacoDireita('',35);
  Self.serie := 'SCL' + PreencheEspacoDireita('',05);
  Self.codTipoMovimento := '1.1.01' + PreencheEspacoDireita('',06);
  Self.tipo := 'P';
  Self.status := 'A';
  Self.movImpressao :=0;
  Self.docImpressao := 0;
  Self.faturaImpressao := 0;
  Self.dataEmissao := PreencheEspacoDireita('',10);
  Self.dataSaida := PreencheEspacoDireita('',10);
  Self.dataExtra1 := PreencheEspacoDireita('',10);
  Self.dataExtra2 := PreencheEspacoDireita('',10);
  Self.codRepresentante := PreencheEspacoDireita('',15);
  Self.comissaoRepresentante := 0;
  Self.numeroOrdem := PreencheEspacoDireita('',20);
  Self.codCondPagamento := PreencheEspacoDireita('',05); //  Self.codCondPagamento := '11'+ PreencheEspacoDireita('',03);
  Self.numeroTributos := 0;
  Self.valorBruto := 0.00;
  Self.valorLiquido := 0.00;
  Self.valorOutros := 0.00;
  Self.observacao := PreencheEspacoDireita('', 60);
  Self.valorFrete := 0.00;
  Self.percentualSeguro := 0.00;
  Self.valorSeguro := 0.00;
  Self.percentualDesconto := 0.00;
  Self.valorDesconto := 0.00;
  Self.percentualDespesa := 0.00;
  Self.valorDespesa := 0.00;
  Self.percentualExtra1 := 0.00;
  Self.valorExtra1 := 0.00;
  Self.percentualExtra2 := 0.00;
  Self.valorExtra2 := 0.00;
  Self.codFuncionario1 := PreencheEspacoDireita('',16);
  Self.percComisFuncionario := 0.00;
  Self.codMensagem := PreencheEspacoDireita('',05);
  Self.codMensagem2 := PreencheEspacoDireita('',05);
  Self.viaTransporte := PreencheEspacoDireita('',15);
  Self.placa := PreencheEspacoDireita('',10);
  Self.codEstadoPlaca := PreencheEspacoDireita('',02);
  Self.pesoLiquido := 0.00;
  Self.pesoBruto := 0.00;
  Self.marca := PreencheEspacoDireita('',10);
  Self.numero := 0;
  Self.quantidade := 0.00;
  Self.especie := PreencheEspacoDireita('',15);
  Self.codTabelaEstoque1 := PreencheEspacoDireita('',10);
  Self.codTabelaEstoque2 := PreencheEspacoDireita('',10);
  Self.codTabelaEstoque3 := PreencheEspacoDireita('',10);
  Self.codTabelaEstoque4 := PreencheEspacoDireita('',10);
  Self.codTabelaEstoque5 := PreencheEspacoDireita('',10);
  Self.codTabelaFaturamento1 := PreencheEspacoDireita('',25);
  Self.codTabelaFaturamento2 := PreencheEspacoDireita('',25);
  Self.codTabelaFaturamento3 := PreencheEspacoDireita('',25);
  Self.codTabelaFaturamento4 := PreencheEspacoDireita('',25);
  Self.codTabelaFaturamento5 := PreencheEspacoDireita('',25);
  Self.campoLivre1 := PreencheEspacoDireita('',100);
  Self.campoLivre2 := PreencheEspacoDireita('',100);
  Self.campoLivre3 := PreencheEspacoDireita('',100);
  Self.codMoeda := 'R$'+ PreencheEspacoDireita('',08);
  Self.dataBaseMovimento := PreencheEspacoDireita('',10);
  Self.dataMovimento := PreencheEspacoDireita('',10);
  Self.numeroLancamentoGerado := 0;
  Self.gerouFatura :=0;
  Self.numeroLancamentoAberto := 0;
  Self.codFuncionario2 := PreencheEspacoDireita('',16);
  Self.codUsuario := PreencheEspacoDireita('',20);
  Self.flagExportacao := 0;
  Self.emiteBoleta := PreencheEspacoDireita('',01);
  Self.codMensagemDesconto := PreencheEspacoDireita('',05);
  Self.codMensagemDespesa := PreencheEspacoDireita('',05);
  Self.codMensagemFrete := PreencheEspacoDireita('',05);
  Self.freteCifFob := 0;
  Self.usaDespesasFinanceiras := 0;
  Self.identificadorNatureza := 514;
  Self.flagExportacaoFisc := 0;
  Self.flagExportacaoSecFazenda := 0;
  Self.codFuncionario3 := PreencheEspacoDireita('',16);
  Self.codFuncionario4 := PreencheEspacoDireita('',16);
  Self.percComisFuncionario2 := 0.00;
  self.identificadorNatureza2 := 0;
  Self.valorAdiantamento := 0.00;
  Self.codTransportadora := PreencheEspacoDireita('',05);
  self.codTransportadora2 := PreencheEspacoDireita('',05);
  Self.statusLiberacao := 0;
  Self.itensAgrupados := 0;
  Self.flagImpressaoFaturamento := PreencheEspacoDireita('',01);
  self.dataCancelamentoMovimento := PreencheEspacoDireita('',10);
  Self.segundoNumeto := 0;
  Self.codCentroCusto := PreencheEspacoDireita('',25); //Self.codCentroCusto := '099' + PreencheEspacoDireita('',22);
  Self.codColigadaCtaCaixa := 0;
  Self.codCtaCaixa := PreencheEspacoDireita('',10);
  Self.codFilialDestino := 4;
  Self.codCentroCustoDestino := PreencheEspacoDireita('',25);
  self.codColigadaClienteFornecedor := 1;
  Self.coligadaCFNatureza := 0;
  Self.idMovLancamentoFluxus := 0;
  Self.dataEntrega := PreencheEspacoDireita('',10);
  Self.numeroCaixa := 0;
  Self.numeroCupom := 0;
  Self.horaEmissaoMovimento := PreencheEspacoDireita('',20);
  Self.codFilialEntregaSaida := 0;
  Self.codnatureza := '1.101.07' + PreencheEspacoDireita('',12);
  Self.codnatureza2 := PreencheEspacoDireita('',20);
  Self.campoCnpj := PreencheEspacoDireita('',20);
  Self.dataContabilizacao := PreencheEspacoDireita('',10);
  Self.codServico := 0;
  Self.municipioPrestacaoServico := 0;
  Self.codEstadoMunicipio := 0;
  Self.pontoVenda := PreencheEspacoDireita('',10);
  Self.codEvento := 0;
  Self.codTipoDocumento := PreencheEspacoDireita('',10);
  Self.codRetencaoIrrf := PreencheEspacoDireita('',10);
  Self.percDeducaoIrrf := 0.00;
  Self.percBaseInssEmpregado := 0.00;
  Self.percBaseGeracaoInss := 0.00;
  Self.codigoProjeto := PreencheEspacoDireita('',24);
  Self.revisao := 0;
  Self.subSerie := PreencheEspacoDireita('',08);
  Self.contatoEntrega := PreencheEspacoDireita('',10);
  Self.valorInssOutrasEmpresas := 0.00;
  Self.apropMovRmSolum := PreencheEspacoDireita('',05);
  Self.datalancamento := PreencheEspacoDireita('',10);
  Self.contadorReinicioOperacao := 0;
  Self.coo := 0;
  Self.numeroReducaoZ := 0;
  Self.horarioEntradaSaidaMov := PreencheEspacoDireita('',20);
  Self.tipoEntrega := PreencheEspacoDireita('',15);
  Self.statusRecibo := 0;
  Self.tipoRecibo := 0;
  Self.situacaoRecibo := PreencheEspacoDireita('',01);
  Self.numeroAutorizacao := 0;
end;

function TMovimentoRM.toString: string;
begin
   Result :=
     Self.tipoLinha +
     RetZero( IntToStr(Self.codFilial),5) +
     Self.codDepartamento +
     Self.codLocal +
     Self.codLocalEntrega +
     Self.codLocalDestino +
     Self.codClienteFornecedor +
     Self.codClienteFornecedorFluxus +
     Self.numeroMovimento +
     Self.serie +
     Self.codTipoMovimento +
     Self.tipo +
     Self.status +
     IntToStr(Self.movImpressao) +
     IntToStr(Self.docImpressao) +
     IntToStr(Self.faturaImpressao) +
     Self.dataEmissao +
     Self.dataSaida +
     Self.dataExtra1 +
     Self.dataExtra2 +
     Self.codRepresentante +
     RetZero( FloatToStr(Self.comissaoRepresentante),20) +
     Self.numeroOrdem +
     Self.codCondPagamento +
     RetZero(FloatToStr(Self.numeroTributos),05) +
     RetZero(FloatToStr(Self.valorBruto),20) +
     RetZero(FloatToStr(Self.valorLiquido),20) +
     RetZero(FloatToStr(Self.valorOutros),20) +
     Self.observacao +
     RetZero(FloatToStr(Self.percentualFrete),20) +
     RetZero(FloatToStr(Self.valorFrete),20) +
     RetZero(FloatToStr(Self.percentualSeguro),20) +
     RetZero(FloatToStr(Self.valorSeguro),20) +
     RetZero(FloatToStr(Self.percentualDesconto),20) +
     RetZero(FloatToStr(Self.valorDesconto),20) +
     RetZero(FloatToStr(Self.percentualDespesa),20) +
     RetZero(FloatToStr(Self.valorDespesa),20) +
     RetZero(FloatToStr(Self.percentualExtra1),20) +
     RetZero(FloatToStr(Self.valorExtra1),20) +
     RetZero(FloatToStr(Self.percentualExtra2),20) +
     RetZero(FloatToStr(Self.valorExtra2),20) +
     Self.codFuncionario1 +
     RetZero(FloatToStr(Self.percComisFuncionario),20) +
     Self.codMensagem +
     Self.codMensagem2 +
     Self.viaTransporte +
     Self.placa +
     Self.codEstadoPlaca +
     RetZero(FloatToStr(Self.pesoLiquido),20) +
     RetZero(FloatToStr(Self.pesoBruto),20) +
     Self.marca +
     RetZero(IntToStr(Self.numero),10) +
     RetZero(FloatToStr(Self.quantidade),10) +
     Self.especie +
     Self.codTabelaEstoque1 +
     Self.codTabelaEstoque2 +
     Self.codTabelaEstoque3 +
     Self.codTabelaEstoque4 +
     Self.codTabelaEstoque5 +
     Self.codTabelaFaturamento1 +
     Self.codTabelaFaturamento2 +
     Self.codTabelaFaturamento3 +
     Self.codTabelaFaturamento4 +
     Self.codTabelaFaturamento5 +
     Self.campoLivre1 +
     Self.campoLivre2 +
     Self.campoLivre3 +
     Self.codMoeda +
     Self.dataBaseMovimento +
     Self.dataMovimento +
     RetZero(IntToStr(Self.numeroLancamentoGerado),05) +
     RetZero(IntToStr(Self.gerouFatura),05) +
     RetZero(IntToStr(Self.numeroLancamentoAberto),05) +
     Self.codFuncionario2 +
     Self.codUsuario +
     RetZero(IntToStr(Self.flagExportacao),05) +
     Self.emiteBoleta +
     Self.codMensagemDesconto +
     Self.codMensagemDespesa +
     Self.codMensagemFrete +
     RetZero(IntToStr(Self.freteCifFob),05) +
     RetZero(IntToStr(Self.usaDespesasFinanceiras),05) +
     RetZero(IntToStr(Self.identificadorNatureza),05) +
     RetZero(IntToStr(Self.flagExportacaoFisc),05) +
     RetZero(IntToStr(Self.flagExportacaoSecFazenda),05) +
     Self.codFuncionario3 +
     Self.codFuncionario4 +
     RetZero(FloatToStr(Self.percComisFuncionario2),20) +
     PreencheEspacoDireita('',5) + // retZero(IntToStr(Self.identificadorNatureza2),05) +
     RetZero(FloatToStr(Self.valorAdiantamento),20) +
     Self.codTransportadora +
     Self.codTransportadora2 +
     RetZero(IntToStr(Self.statusLiberacao),05) +
     RetZero(IntToStr(Self.itensAgrupados),05) +
     Self.flagImpressaoFaturamento +
     Self.dataCancelamentoMovimento +
     RetZero(IntToStr(Self.segundoNumeto),20) +
     Self.codCentroCusto +
     RetZero(IntToStr(Self.codColigadaCtaCaixa),05) +
     Self.codCtaCaixa +
     RetZero(IntToStr(Self.codFilialDestino),05) +
     Self.codCentroCustoDestino +
     RetZero(IntToStr(Self.codColigadaClienteFornecedor),05) +
     RetZero(IntToStr(Self.coligadaCFNatureza),05) +
     RetZero(IntToStr(Self.idMovLancamentoFluxus),10) +
     Self.dataEntrega +
     RetZero(IntToStr(Self.numeroCaixa),10) +
     RetZero(IntToStr(Self.numeroCupom),10) +
     Self.horaEmissaoMovimento +
     '     '+ //RetZero(IntToStr(Self.codFilialEntregaSaida),05) +
     Self.codnatureza +
     Self.codnatureza2 +
     Self.campoCnpj +
     Self.dataContabilizacao +
     PreencheEspacoDireita('',15) + //RetZero(IntToStr(Self.codServico),15) +
     PreencheEspacoDireita('',20) + //RetZero(IntToStr(Self.municipioPrestacaoServico),20) +
     PreencheEspacoDireita('',02) + //RetZero(IntToStr(Self.codEstadoMunicipio),02) +
     Self.pontoVenda +
     PreencheEspacoDireita('',10) + //RetZero(IntToStr(Self.codEvento),10) +
     Self.codTipoDocumento +
     Self.codRetencaoIrrf +
     RetZero(FloatToStr(Self.percDeducaoIrrf),20) +
     RetZero(FloatToStr(Self.percBaseInssEmpregado),20) +
     RetZero(FloatToStr(Self.percBaseGeracaoInss),20) +
     Self.codigoProjeto +
     RetZero(IntToStr(Self.revisao),05) +
     Self.subSerie +
     Self.contatoEntrega +
     RetZero(FloatToStr(Self.valorInssOutrasEmpresas),20) +
     RetZero('0',5)+ // Self.apropMovRmSolum +
     Self.datalancamento +
     PreencheEspacoDireita('',10) + //RetZero(IntToStr(Self.contadorReinicioOperacao),10) +
     RetZero('0',10) +  //RetZero(IntToStr(Self.coo),10) +
     RetZero(IntToStr(Self.numeroReducaoZ),10) +
     Self.horarioEntradaSaidaMov +
     Self.tipoEntrega +
     '0    ' + // RetZero(IntToStr(Self.statusRecibo),05) +
     RetZero(IntToStr(Self.tipoRecibo),05) +
     '0    ' + //Self.situacaoRecibo +
     PreencheEspacoDireita('',29); // RetZero(IntToStr(Self.numeroAutorizacao),30)
end;

{ TItensMovimentoRM }


procedure TItensMovimentoRM.setValoresDefault;
begin
  Self.tipoLinha := 'I';
  Self.codigoProduto := '4.0000132'+ PreencheEspacoDireita('',21);
  Self.numeroSequencial := 1;
  Self.codTipoProduto := PreencheEspacoDireita('',10);
  Self.quantidade := 0.00;
  Self.precoUnitario := 0.00;
  Self.precoTabela := 0.00;
  Self.percDesconto := 0.00;
  Self.valorDesconto := 0.00;
  Self.percDespesa := 0.00;
  Self.valorDespesa :=0.00;
  Self.dataEmissao := PreencheEspacoDireita('',10);
  Self.codMensagem := PreencheEspacoDireita('',05);
  Self.numeroTributos := 0;
  Self.codTabelaEstoque1 := PreencheEspacoDireita('',10);
  Self.codTabelaEstoque2 := PreencheEspacoDireita('',10);
  Self.codTabelaEstoque3 := PreencheEspacoDireita('',10);
  Self.codTabelaEstoque4 := PreencheEspacoDireita('',10);
  Self.codTabelaEstoque5 := PreencheEspacoDireita('',10);
  Self.codTabelaFaturamento1 := PreencheEspacoDireita('',25);
  Self.codTabelaFaturamento2 := PreencheEspacoDireita('',25);
  Self.codTabelaFaturamento3 := PreencheEspacoDireita('',25);
  Self.codTabelaFaturamento4 := PreencheEspacoDireita('',25);
  Self.codTabelaFaturamento5 := PreencheEspacoDireita('',25);
  Self.campoLivre := PreencheEspacoDireita('',15);
  Self.codUnidade := PreencheEspacoDireita('',05);
  Self.quantidadeReceber := 0.00;
  Self.identificacaoNatureza :=514;
  Self.codCondicaoPagamento := PreencheEspacoDireita('',05);
  Self.dataEntrega := PreencheEspacoDireita('',10);
  Self.prateleira := PreencheEspacoDireita('',15);
  Self.identificadorContrato := 0;
  Self.seqItemContrato := 0;
  Self.valorTotalItem := 0.00;
  Self.centroCusto := PreencheEspacoDireita('099',25);
  Self.codigoNatureza := '1.101.07' + PreencheEspacoDireita('',12);
  Self.representante := PreencheEspacoDireita('',15);
  Self.codigoProduto1 := '4.0000132'+ PreencheEspacoDireita('',21); // PreencheEspacoDireita('',30);
  Self.codigoDepartamento := PreencheEspacoDireita('',25);
  Self.tributacaoEcf := PreencheEspacoDireita('',10);
  Self.valorEscrituracao := PreencheEspacoDireita('',19) + '0';
  Self.valorCodigoProduto := 0.00;
  Self.tipoCodigoProduto := PreencheEspacoDireita('00000',05);
  Self.codigoSituacaoTributaria := 0;
  Self.codigoTarefa := PreencheEspacoDireita('',60);
  Self.codTabNatOrcamento := PreencheEspacoDireita('',10);
  Self.valorOpcionalFormula1 := 0.00;
  Self.valorOpcionalFormula2 := 0.00;
  Self.cancelado := 'N';
  Self.valorUnitarioMovimento := 0.00;
  Self.valorOrcamento := 0.00;
  Self.percComisRepresentante := 0;
  Self.qtdeUnidadePedido := 0;
  Self.codFilial := 4;
  Self.codLocalEstoque := '004' + PreencheEspacoDireita('',12);
  Self.valorLiquidoItem := 0.00;
  Self.codFuncionario := PreencheEspacoDireita('',16);
  Self.comisFuncionarioItem := 0.00;
end;

function TItensMovimentoRM.toString: string;
begin
   Result :=
    Self.tipoLinha +
    Self.codigoProduto +
    RetZero(IntToStr(Self.numeroSequencial),05) +
    Self.codTipoProduto +
    RetZero( FloatToStr(Self.quantidade),20) +
    RetZero(TrocaVirgPPto(FloatToStr(Self.precoUnitario)),20) +
    RetZero(TrocaVirgPPto(FloatToStr(Self.precoTabela)),20) +
    RetZero( FloatToStr(Self.percDesconto),20) +
    RetZero( FloatToStr(Self.valorDesconto),20) +
    RetZero( FloatToStr(Self.percDespesa),20) +
    RetZero( FloatToStr(Self.valorDespesa),20) +
    Self.dataEmissao +
    Self.codMensagem +
    RetZero(IntToStr(Self.numeroTributos),05) +
    Self.codTabelaEstoque1 +
    Self.codTabelaEstoque2 +
    Self.codTabelaEstoque3 +
    Self.codTabelaEstoque4 +
    Self.codTabelaEstoque5 +
    Self.codTabelaFaturamento1 +
    Self.codTabelaFaturamento2 +
    Self.codTabelaFaturamento3 +
    Self.codTabelaFaturamento4 +
    Self.codTabelaFaturamento5 +
    Self.campoLivre +
    Self.codUnidade +
    RetZero( FloatToStr(Self.quantidadeReceber),20) +
    RetZero(IntToStr(Self.identificacaoNatureza),05) +
    Self.codCondicaoPagamento +
    Self.dataEntrega +
    Self.prateleira +
    PreencheEspacoDireita('',10) +  //RetZero(IntToStr(Self.identificadorContrato),10) +
    RetZero(IntToStr(Self.seqItemContrato),05) +
    RetZero(TrocaVirgPPto(FloatToStr(Self.valorTotalItem)),20) +
    Self.centroCusto +
    Self.codigoNatureza +
    Self.representante +
    Self.codigoProduto1 +
    Self.codigoDepartamento +
    Self.tributacaoEcf +
    Self.valorEscrituracao +
    PreencheEspacoDireita('',60) +  //RetZero(FloatToStr(Self.valorCodigoProduto),60) +
    Self.tipoCodigoProduto +
    RetZero(IntToStr(Self.codigoSituacaoTributaria),03) +
    Self.codigoTarefa +
    Self.codTabNatOrcamento +
    RetZero(FloatToStr(Self.valorOpcionalFormula1),20) +
    RetZero(FloatToStr(Self.valorOpcionalFormula2),20) +
    Self.cancelado +
    RetZero(FloatToStr(Self.valorUnitarioMovimento),20) +
    PreencheEspacoDireita('',10) +  //RetZero(FloatToStr(Self.valorOrcamento),10) +
    RetZero(IntToStr(Self.percComisRepresentante),20)+
    RetZero(IntToStr(Self.qtdeUnidadePedido),20)+
    RetZero(IntToStr(Self.codFilial),05)+
    Self.codLocalEstoque +
    RetZero(FloatToStr(Self.valorLiquidoItem),20) +
    Self.codFuncionario +
    RetZero(FloatToStr(Self.comisFuncionarioItem),20)
end;

{ TCargaRural }



procedure TCargaRural.setValoresDefaul;
begin
  Self.CodigoRegistro := 1;
  Self.Item := '01.001.0001';
  Self.Referencia := EmptyStr;
  Self.Densidade := 0;
end;

function TCargaRural.toString: string;
var
  _Separador : Char;
begin
  _Separador := ';';
  Result :=
   IntToStr(Self.CodigoRegistro) + _Separador +
   Self.Carga + _Separador +
   Self.Estabelecimento + _Separador +
   Self.Rota + _Separador +
   Self.NomeMotorista + _Separador +
   IntToStr(Self.CodigoTransportador) + _Separador +
   Self.CodigoVeiculo + _Separador +
   Self.Placa + _Separador +
   Self.UfPlaca + _Separador +
   FormatFloat('#######000',(Self.HodometroInicial * 1000)) + _Separador +
   FormatFloat('#######000',(Self.HodometroFinal * 1000)) + _Separador +
   Self.Item + _Separador +
   Self.Referencia + _Separador +
   FormatFloat('##########',(Self.PesoBruto * 10000)) + _Separador +
   FormatFloat('##########',(Self.Densidade * 100000)) + _Separador +
   Self.DataTransacao + _Separador +
   IntToStr(Self.QtdeCompartimentos)
end;

{ TProdutorCarga }


procedure TProdutorCarga.setValoresDefault;
begin
   Self.CodigoRegistro := 2;
end;

function TProdutorCarga.toString: string;
var
 _Separador: Char;
begin
  _Separador := ';';

  Result :=
   IntToStr(Self.CodigoRegistro) + _Separador +
   Self.Carga + _Separador +
   Self.Produtor + _Separador +
   Self.PontoColeta + _Separador +
   FormatFloat('##########', (Self.QtdeColetada * 10000)) + _Separador +
   IntToStr(Self.Compartimento) + _Separador +
   FormatFloat('###########', (Self.Temperatura * 10000)) + _Separador +
   Self.Observacoes + _Separador +
   IntToStr(Self.Repostiorio) + _Separador +
   Self.Amostra + _Separador +
   Self.Lacre + _Separador +
   Self.Propriedade + _Separador +
   Self.MotivoNaoColeta + _Separador +
   FormatFloat('##########',(Self.Regua * 10000)) + _Separador +
   Self.DataColeta + _Separador +
   Self.HoraColeta
end;

procedure TSendMessage.clear;
begin
  Self.conta := EmptyStr;
  Self.rota := EmptyStr;
  Self.prioridade := EmptyStr;
  Self.titulo := EmptyStr;
  Self.data := EmptyStr;
  Self.NomeRota := EmptyStr;
  Self.NomeLinha := EmptyStr;
  Self.AgenteColeta := EmptyStr;
  Self.PlacaVeiculo := EmptyStr;
  Self.Mensangem := EmptyStr;
end;
{ TSendMessage }
function TSendMessage.dataToArray: TStringList;
var
  Dado : string;
  Aspas, Ponto : Char;
begin
   try
     Aspas := '''';
     Ponto := '=';
     Result := TStringList.Create;
     Result.Clear;

     Result.Append('conta_id'+ Ponto + Self.conta);
     Result.Append('rota_id' + Ponto + Self.rota);
     Result.Append('prioridade' + Ponto + Self.prioridade);
     Result.Append('titulo' +  Ponto + Self.titulo);
     Result.Append('data' + Ponto + Self.data);
     Result.Append('rota'+ Ponto + Self.NomeRota);
     Result.Append('linha' + Ponto + Self.NomeLinha);
     Result.Append('motorista' + Ponto + Self.AgenteColeta);
     Result.Append('placa' + Ponto + Self.PlacaVeiculo);
     Result.Append('mensagem' +  Ponto + Self.Mensangem);
   finally
    ;
   end;
end;

function TSendMessage.dataToJson: TStringList ;
var
  Dado : string;
  Aspas, Ponto : Char;
begin
   try
     Aspas := '"';
     Ponto := ':';
     Result := TStringList.Create;
     Result.Clear;
     Dado := '{' +
       AnsiQuotedStr('conta_id',Aspas) + Ponto + AnsiQuotedStr(Self.conta,Aspas) + ',' +
       AnsiQuotedStr('rota_id', Aspas) + Ponto + AnsiQuotedStr(Self.rota,Aspas) + ',' +
       AnsiQuotedStr('prioridade', Aspas) + Ponto + AnsiQuotedStr(Self.prioridade, Aspas) + ',' +
       AnsiQuotedStr('titulo',Aspas) +  Ponto + AnsiQuotedStr(Self.titulo, Aspas) + ',' +
       AnsiQuotedStr('data', Aspas) + Ponto + AnsiQuotedStr(Self.data, Aspas) + ',' +
       AnsiQuotedStr('rota', Aspas) + Ponto + AnsiQuotedStr(Self.NomeRota, Aspas) + ',' +
       AnsiQuotedStr('linha', Aspas) + Ponto + AnsiQuotedStr(Self.NomeLinha, Aspas) + ',' +
       AnsiQuotedStr('motorista', Aspas) + Ponto + AnsiQuotedStr(Self.AgenteColeta, Aspas) + ',' +
       AnsiQuotedStr('placa', Aspas) + Ponto + AnsiQuotedStr(Self.PlacaVeiculo, Aspas) + ',' +
       AnsiQuotedStr('mensagem', Aspas) +  Ponto + AnsiQuotedStr(Self.Mensangem, Aspas) + '}';

     Result.Add(dado);
   finally
    ;
   end;
end;

{ TResumoViagem }

function TResumoViagem.buildColunsName(separador: char): string;
var
i: Integer;
aux : string;
begin
  Result :=
  'Id_Viagem' + separador +
  'Dt_Inicio' + separador +
  'Dt_Fim' + separador +
  'Km_Inicial' + separador +
  'Km_Final' + separador +
  'Distancia' + separador +
  'Codigo_Veiculo' + separador +
  'Placa_Veiculo' + separador +
  'Codigo_Linha' + separador +
  'Nome_Linha' + separador +
  'Codigo_Rota' + separador +
  'Nome_Rota' + separador +
  'Codigo_Coletor' + separador +
  'Nome_Coletor' + separador +
  'Codigo_Tecnico' + separador +
  'Nome_Tecnico' + separador +
  'Volume_Informado' + separador +
  'Volume_Aferido' + separador +
  'Volume_Descartado' + separador +
  'Atesto' + separador +
  'Tipo_Descarga' + separador +
  'Coletas_realizadas' + separador +
  'Coletas_Cancelados' + separador +
  'Coletas_Pendentes' + separador +
  'Descarregada' + separador;
   for i := 0 to Length(Self.repositoriosVeiculo.bocas) - 1 do
   begin
      aux := EmptyStr;
      if (Self.repositoriosVeiculo.bocas[i] <> '') then
      begin
        aux := aux + 'Boca (' + IntToStr(i) + ')' + separador +
                     'Volume (' +  IntToStr(i) + ')' + separador +
                     'Temperatura (' + IntToStr(i) + ')' + separador;
      end;
     if aux <> EmptyStr then
       Result := Result + aux + separador;
   end;
end;

constructor TResumoViagem.Create;
begin
 inherited;
end;

destructor TResumoViagem.Destroy;
begin
  inherited;
end;

function TResumoViagem.toString(separador: Char): string;
var
i: Integer;
aux : string;
begin
 Result :=
   IntToStr(Self.id) + separador +
   FormatDateTime('dd/MM/yyyy hh:mm:ss', Self.dataInicio)+ separador +
   FormatDateTime('dd/MM/yyyy hh:mm:ss',Self.dataFim)+ separador +
   IntToStr(Self.kmInicio) + separador +
   IntToStr(self.kmFinal) + separador+
   IntToStr(self.distancia) + separador+
   Self.veiculoCodigo + separador+
   Self.veiculoPlaca + separador+
   self.linhaCodigo + separador+
   Self.linhaNome + separador +
   self.rotaCodigo + separador +
   self.rotaNome + separador+
   self.coletorCodigo + separador +
   self.coletorNome + separador +
   self.tecnicoCodigo + separador +
   Self.tecnicoNome + separador +
   IntToStr(Self.volumeInformado) + separador +
   IntToStr(Self.volumeAferido) + separador +
   IntToStr(self.volumeDescartado) + separador +
   IntToStr(self.atesto) + separador +
   self.tipoDescarga + separador +
   IntToStr(self.qtdeVisitas) + separador +
   IntToStr(self.qtdeCancelados) + separador+
   IntToStr(self.qtdeNaoRealizados) + separador +
   Self.descarregada + separador;
   for i := 0 to Length(Self.repositoriosVeiculo.bocas) - 1 do
   begin
      aux := EmptyStr;
      if (Self.repositoriosVeiculo.bocas[i] <> '') then
      begin
        aux := aux + Self.repositoriosVeiculo.bocas[i] + separador +
        IntToStr(Self.repositoriosVeiculo.qtdeBocas[i]) + separador +
        FloatToStr(Self.repositoriosVeiculo.tempBocas[i]) + separador;
      end;
     if aux <> EmptyStr then
       Result := Result + aux + separador;
   end;
end;

end.

