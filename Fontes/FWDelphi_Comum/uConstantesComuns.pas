unit uConstantesComuns;

interface

const

  // Cores
  AmareloClaro = $00DFFFFF;
  CinzaClaro = $00F5F5F5;
  VermelhoClaro = $00C1C9FD;
  LaranjaClaro = $00E6F2FF;
  VerdeEscuro = $00002B00;
  AzulClaro = $00FFF0E1;

  PerfilAdmin = 1;

  //Ações de Inclusão, Alteração e Exclusão
  AcaoInclusao = 0;
  AcaoAlteracao = 1;
  AcaoExclusao = 2;

  // Genéricos
  SituacaoAtivo = 'A';
  SituacaoInativo = 'I';

  SexoMasculino = 'M';
  SexoFeminino = 'F';
  SexoAmbos = 'A';

  FlagSim = 'S';
  FlagNao = 'N';
  FlgTrue = 1;
  FlgFalse = 0;
  TipoDadoNumerico = 1;
  TipoDadoCaracter = 2;
  TipoDadoData = 3;
  TipoDadoMemo = 4;

  TamTipoDadoInteiro  = 2147483647;
  TamTipoDadoTinyInt  = 255;
  FiltroBaseTXT = 'TXT|*.txt';
  FiltroBaseCSV = 'CSV|*.csv';
  FiltroBaseACCESS = 'Access|*.mdb';
  FiltroBaseDBASE = 'DBase|*.dbf';

  FiltroArqCSV = '*.csv';
  FiltroArqExcel = '*.xls|*.xlsx';
  FiltroArqWord = '*.doc|*.docx';

  VersaoSQL2000 = '8.00';
  VersaoSQL2005 = '9.00';
  VersaoSQL2008 = '10.0';

  // Segurança Web
  ChaveCabecalhoAutenticacaoWeb = 'POChaveWEB';

  // Formato Data/Hora
  FormatoData = 'dd/MM/yyyy';
  FormatoDataHora = 'dd/MM/yyyy HH:mm:ss';

  FormatoDataInterno = 'yyyy/MM/dd';
  FormatoDataHoraInterno = 'yyyy/MM/dd HH:mm:ss';  

  FormatoDataSemMascara = 'yyyyMMdd';
  FormatoDataHoraSemMascara = 'yyyyMMddHHmmss';

  FiltroInicial = 'and 1=2';
 
implementation

end.
