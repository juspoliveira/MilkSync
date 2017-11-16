program MilkSync;

uses
  Forms,
  uMlkPrincipalFRM in 'uMlkPrincipalFRM.pas' {MksPrincipalFRM},
  uMlkPrincipalDTM in 'uMlkPrincipalDTM.pas' {MlkPrincipalDTM: TDataModule},
  uConexao in '..\FWDelphi_Comum\uConexao.pas',
  ufrmCadastro in '..\FWDelphi_Comum\ufrmCadastro.pas' {frmCadastro},
  uMlkParmetrosFRM in 'uMlkParmetrosFRM.pas' {MlkParmetrosFRM},
  uGlobal in '..\FWDelphi_Comum\uGlobal.pas',
  uConstantesComuns in '..\..\..\..\FWDelphiS2\Comum\uConstantesComuns.pas',
  uVSSCLRotaComum in '..\Comum\uVSSCLRotaComum.pas',
  uLkJSON in '..\Comum\uLkJSON.pas',
  uVSSCLRCnExport in '..\Comum\uVSSCLRCnExport.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMlkPrincipalDTM, MlkPrincipalDTM);
  Application.CreateForm(TMksPrincipalFRM, MksPrincipalFRM);
  Application.ShowMainForm := False;
  Application.Run;
end.
