program SCLRotaIntegrador;

uses
  Forms,
  uVSSCLRotaConsoleFRM in 'uVSSCLRotaConsoleFRM.pas' {VSSCLRotaConsoleFRM},
  uVSSCLRotaConsoleDTM in 'uVSSCLRotaConsoleDTM.pas' {VSSCLRotaConsoleDTM: TDataModule},
  uVSSCLRotaComum in '..\Comum\uVSSCLRotaComum.pas',
  uVSSCLRotaDialogosFRM in 'uVSSCLRotaDialogosFRM.pas' {VSDialogosFRM},
  uJSON in '..\Comum\uJSON.pas',
  uVSSCLRCnExport in '..\Comum\uVSSCLRCnExport.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TVSSCLRotaConsoleDTM, VSSCLRotaConsoleDTM);
  Application.CreateForm(TVSSCLRotaConsoleFRM, VSSCLRotaConsoleFRM);
  Application.Run;
end.
