program MilkConsole;

{$APPTYPE CONSOLE}

uses
  SysUtils, Classes,
  uGlobal in '..\..\..\FWDelphiS2\Comum\uGlobal.pas';

var
  pathNotificacao, Arqsaida: string;
  Arqconf, Arqformated : TStringList ;
  delimiter: Char;
  i: Integer;

begin
  try
    try
      Arqconf := TStringList.Create;
      Arqformated := TStringList.Create;
      // Le as configuracoes iniciais
      if FileExists('config.ini') then
      begin

        Arqconf.LoadFromFile('config.ini');
        pathNotificacao :=  Arqconf.Strings[0];
        delimiter := ';';
        Arqsaida := pathNotificacao + '\sync.txt';
        Writeln('Monitorando: ' + pathNotificacao);
      end
      else
      begin
        Writeln('arquivo de configuracao [config.ini] nao localizado');
        Abort;;
      end;
      if ParamStr(1) <> EmptyStr then
      begin
        Arqformated := arraystring(ParamStr(1),delimiter);
        Writeln(Arqformated.DelimitedText);
        if (Arqconf.Count <=  0) then
        begin
          Writeln('parametros incorretos!');
          Abort;
        end;
        Arqconf.Clear;
        for i := 0 to Arqformated.Count -1 do
        begin
          Arqconf.Add( Arqformated.Strings[i]);
        end;
        if Arqconf.Count > 0 then
          Arqconf.SaveToFile(Arqsaida);
      end;
    except
      on E: Exception do
        Writeln(E.ClassName, ': ', E.Message);
    end;
  finally
    Arqconf.Destroy;
    Arqformated.Destroy;
  end;
end.
