program MilkSync;

uses
  Forms,
  uMlkParmetrosFRM in 'Fontes\Console\uMlkParmetrosFRM.pas',
  uMlkPrincipalDTM in 'Fontes\Console\uMlkPrincipalDTM.pas' {MlkPrincipalDTM: TDataModule},
  uMlkPrincipalFRM in 'Fontes\Console\uMlkPrincipalFRM.pas' {MksPrincipalFRM},
  ufrmCadastro in 'Fontes\FWDelphi_Comum\ufrmCadastro.pas' {frmCadastro},
  uJSON in 'Fontes\Comum\uJSON.pas',
  uVSSCLRCnExport in 'Fontes\Comum\uVSSCLRCnExport.pas',
  uVSSCLRotaComum in 'Fontes\Comum\uVSSCLRotaComum.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'MilkSync';
  Application.CreateForm(TMksPrincipalFRM, MksPrincipalFRM);
  Application.Run;
end.
