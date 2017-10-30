program SCLRotaIntegrador;

uses
  Forms,
  uVSSCLRotaConsoleFRM in 'uVSSCLRotaConsoleFRM.pas' {VSSCLRotaConsoleFRM},
  uVSSCLRotaConsoleDTM in 'uVSSCLRotaConsoleDTM.pas' {VSSCLRotaConsoleDTM: TDataModule},
  uVSSCLRotaComum in '..\Comum\uVSSCLRotaComum.pas',
  uVSSCLRotaDialogosFRM in 'uVSSCLRotaDialogosFRM.pas' {VSDialogosFRM},
  uJSON in '..\Comum\uJSON.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TVSSCLRotaConsoleFRM, VSSCLRotaConsoleFRM);
  Application.CreateForm(TVSSCLRotaConsoleDTM, VSSCLRotaConsoleDTM);
  Application.Run;
end.
