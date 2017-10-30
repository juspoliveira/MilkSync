// PDFCreator as ComObject
// © 2010..2011 by tm - Thomas Melchert

unit uPDFUtil;

interface

uses
  Windows, Classes, ActiveX, Forms, Printers;

type
  // 0 = PDF, 1 = PNG, 2 = JPEG, 3 = BMP, 4 = PCX, 5 = TIFF, 6 = PS, 7 = EPS, 8 = TXT, 9 = PDF/A-1b, 10 = PDF/X, 11 = PSD, 12 = PCL, 13 = RAW
  TTypeFormat = (tfPDF, tfPNG, tfJPEG, tfBMP, tfPCX, tfTIFF, tfPS, tfEPS, tfTXT, tfPDFA1b, tfPDFX, tfPSD, tfPCL, tfRAW);

  TPDFComObj=class
  private
    fPDF        :OleVariant;
    fPrinter    :WideString;
    fMerkPrinter:WideString;
    fOk         :Bool;
    fFormatTyp  :Integer;
    function  GetFileName():String;
    procedure SetFileName(const Value:String);
    procedure FreePDF();
    procedure OpenPDF();
  public
    constructor Create(const aPrinter:WideString='PDFCreator'); virtual;
    destructor  Destroy(); override;

    procedure   Cancel();
    procedure   Print(const aFileName:String); overload;
    procedure   Print(aFiles:TStrings); overload;
    property    FileName:String read GetFileName write SetFileName;
    property    FormatTyp:Integer read fFormatTyp write fFormatTyp;
    property    IsPrinterAvailable:Bool read fOk;
    procedure Convert(FileConv: string; TypeConv: TTypeFormat = tfPDF);
  end; // TPDFComObj

implementation


uses
  ComObj, SysUtils, Dialogs, Variants;


const
  maxTime = 10; // in seconds
  sleepTime =250; // in milliseconds

// ----- TPDFComObj
procedure TPDFComObj.Cancel();
begin
  fPDF.cPrinterStop:=True;
end; // TPDFComObj.Cancel

procedure TPDFComObj.Convert(FileConv: string; TypeConv: TTypeFormat = tfPDF);
Const
  maxTime = 5;    //' in seconds
  sleepTime = 500; //' in milliseconds
var
  NameDestFile: string;
begin
  fPDF.cOption('UseAutosave') := 1 ;
  fPDF.cOption('UseAutosaveDirectory') := 1;
  fPDF.cOption('AutosaveFormat') := Ord(TypeConv);
  fPDF.cDefaultprinter := 'PDFCreator';
  Printer.PrinterIndex:= Printer.Printers.IndexOf('PDFCreator');
  fPDF.cClearcache;
  fPDF.cPrinterStop := False;

  if FileExists(FileConv) then
  begin
    fPDF.cOption('AutosaveDirectory') := ExtractFilePath(FileConv);

    NameDestFile := FileConv;

    case TypeConv of
      tfPDF: NameDestFile := ChangeFileExt(FileConv, '.pdf');
      tfJPEG: NameDestFile := ChangeFileExt(ExtractFileName(FileConv), '.jpg');
    end; // case

    fPDF.cOption('AutosaveFilename'):= NameDestFile;

    fPDF.cPrintfile(FileConv);
    Sleep(10000);
         {
    c:=0;
    Application.ProcessMessages;
    While (c < (maxTime * 1000 / sleepTime)) do
    begin
      c := c + 1;
      Sleep(sleepTime);
    end;
          }
  end;
end;

constructor TPDFComObj.Create(const aPrinter:WideString);
begin
  inherited Create();
  fPDF := null;
  fPrinter := aPrinter;
  fFormatTyp := 0;
  OpenPDF();
end; // TPDFComObj.Create


destructor TPDFComObj.Destroy();
begin
  FreePDF();
  inherited Destroy();
end; // TPDFComObj.Destroy


procedure TPDFComObj.Print(const aFileName:String);
begin
  Printer.PrinterIndex := Printer.Printers.IndexOf('PDFCreator');

  if fPDF.cIsPrintable(aFileName) then
  begin
    fPDF.cClearCache;
    FileName := aFileName;
    fPDF.cPrintFile(aFileName);
    fPDF.cPrinterStop := False;
    while not FileExists(FileName) do
    begin
      Sleep(sleepTime);
      Application.ProcessMessages();
    end; // while
  end else MessageDlg(Format('File "%s" is not printable!', [aFileName]), mtError, [mbOk], 0);
  Sleep(200);
  Application.ProcessMessages();
end; // TPDFComObj.Print
        
procedure TPDFComObj.Print(aFiles:TStrings);
var i:Integer;
begin
  for i:=0 to aFiles.Count-1 do Print(aFiles[i]);
end; // TPDFComObj.Print
                    
procedure TPDFComObj.FreePDF();
begin
  if (not VarIsNull(fPDF)) then
  begin
    fPDF.cDefaultprinter:=fMerkPrinter;
    fPDF.cClearCache;
    Sleep(200);
    fPDF.cClose;
    fPDF:=null;
  end; // if
end; // TPDFComObj.FreePDF


function TPDFComObj.GetFileName():String;
begin
  Result:=
    IncludeTrailingPathDelimiter(fPDF.cOption['AutosaveDirectory'])+
    fPDF.cOption['AutosaveFilename']
end; // TPDFComObj.GetFileName


procedure TPDFComObj.OpenPDF();
begin
  fOk:=True;
  try
    fPDF:=CreateOleObject('PDFCreator.clsPDFCreator');
    fPDF.cStart('/NoProcessingAtStartup', False);
    fMerkPrinter:=fPDF.cDefaultprinter;
    fPDF.cDefaultPrinter:=fPrinter;
    //fPDF.cWindowState:=1;
  except
    on E:Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOk], 0);
      fOk:=False;
    end; // on
  end; // try
end; // TPDFComObj.OpenPDF


procedure TPDFComObj.SetFileName(const Value:String);
begin
  fPDF.cOption('AutosaveFormat'):= fFormatTyp;
  fPDF.cOption('UseAutosave'):= 1;
  fPDF.cOption('UseAutosaveDirectory'):=1;
  fPDF.cDefaultprinter := 'PDFCreator';
  Printer.PrinterIndex:= Printer.Printers.IndexOf('PDFCreator');
  fPDF.cClearcache;
  fPDF.cPrinterStop := false;
  fPDF.cOption('AutosaveDirectory'):=ExtractFilePath(Value);
  case fFormatTyp of
    0:fPDF.cOption('AutosaveFilename'):=ChangeFileExt(ExtractFileName(Value), '.pdf');
    2:fPDF.cOption('AutosaveFilename'):=ChangeFileExt(ExtractFileName(Value), '.jpg');
    3:fPDF.cOption('AutosaveFilename'):=ChangeFileExt(ExtractFileName(Value), '.bmp');
  end; // case

  Application.ProcessMessages();
end; // TPDFComObj.GetFileName

end.
