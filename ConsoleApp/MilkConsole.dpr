program MilkConsole;

{$APPTYPE CONSOLE}

uses
  SysUtils, Classes,ShellAPI,Windows,
  uGlobal in '..\..\..\FWDelphiS2\Comum\uGlobal.pas';

var
  pathNotificacao, pathMilkSync, Arqsaida: string;
  Arqconf, Arqformated : TStringList ;
  delimiter: Char;
  i: Integer;
  v_Liberado : Boolean;

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
        pathMilkSync := Arqconf.Strings[1];
        delimiter := ';';
        Arqsaida := pathNotificacao + '\sync.txt';
        Writeln('Monitorando: ' + pathNotificacao);
      end
      else
      begin
        Writeln('arquivo de configuracao [config.ini] nao localizado');
        Abort;;
      end;
      v_Liberado := False;
      for i := 0 to 3 do
      begin
        if not (ProcessExists('MilkSync.exe')) then
        begin
          Shellexecute(0,nil, PChar(pathMilkSync),'',nil,SW_SHOWNORMAL);
          sleep(15000);
          if (ProcessExists('MilkSync.exe')) then
          begin
            v_Liberado := True;
            Exit;
          end;
        end
        else
          v_Liberado := True;
      end;
      if not v_Liberado then
        Writeln('MilkSync nao esta em execucao !');

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
