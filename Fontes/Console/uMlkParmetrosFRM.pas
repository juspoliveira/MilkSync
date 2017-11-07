unit uMlkParmetrosFRM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmCadastro, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, Menus, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxPageControlProducer, dxSkinsdxBarPainter, ImgList, dxPSCore,
  dxPScxCommon, dxPScxGrid6Lnk, StdActns, DBActns, DBClientActns, ActnList,
  ExtCtrls, JvExControls, JvGradientHeaderPanel, StdCtrls, cxButtons, ToolWin,
  ComCtrls, JvExComCtrls, JvToolBar, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxContainer, cxCheckBox, cxDBEdit, cxMaskEdit, cxSpinEdit, cxTextEdit,
  cxDropDownEdit, cxImageComboBox, cxCurrencyEdit, cxCalendar, ShlObj,
  cxShellCommon, cxShellComboBox, cxDBShellComboBox;

type
  TMlkParmetrosFRM = class(TfrmCadastro)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    cxLabel5: TLabel;
    cxLabel10: TLabel;
    cxLabel9: TLabel;
    sLabel4: TLabel;
    sLabel5: TLabel;
    sLabel1: TLabel;
    edtServidor: TcxDBTextEdit;
    edtIdErp: TcxDBTextEdit;
    edtTempo: TcxDBSpinEdit;
    edtCad: TcxDBSpinEdit;
    chkCargaMultiEmpresa: TcxDBCheckBox;
    chkDropTable: TcxDBCheckBox;
    chkLog: TcxDBCheckBox;
    cxDBCheckBox1: TcxDBCheckBox;
    edtConta: TcxDBTextEdit;
    edtNomeEmpresa: TcxDBTextEdit;
    cxLabel4: TLabel;
    cxLabel6: TLabel;
    cxLabel7: TLabel;
    cxLabel8: TLabel;
    ckbProxy: TcxDBCheckBox;
    edtProxyUrl: TcxDBTextEdit;
    edtProxyPorta: TcxDBTextEdit;
    edtProxyUsu: TcxDBTextEdit;
    edtProxySenha: TcxDBTextEdit;
    cbxMagis: TcxDBImageComboBox;
    cbxDatasul: TcxDBImageComboBox;
    cbxRm: TcxDBImageComboBox;
    cbxMeta: TcxDBImageComboBox;
    cbxSiga: TcxDBImageComboBox;
    cbxScl: TcxDBImageComboBox;
    ckbDatasul: TcxDBCheckBox;
    ckbRm: TcxDBCheckBox;
    ckbMagis: TcxDBCheckBox;
    ckbMeta: TcxDBCheckBox;
    ckbSiga: TcxDBCheckBox;
    cxDBCheckBox7: TcxDBCheckBox;
    cxLabel11: TLabel;
    ckbNotificaAtesto: TcxDBCheckBox;
    edtDifAtesto: TcxDBCurrencyEdit;
    lbl6: TLabel;
    cxLabel3: TLabel;
    cxLabel14: TLabel;
    edtIniLeitura: TcxDBDateEdit;
    edtUltLeitura: TcxDBDateEdit;
    cxDBCheckBox2: TcxDBCheckBox;
    tabsArquivos: TTabSheet;
    tabsCarga: TTabSheet;
    s: TGroupBox;
    lbl1: TLabel;
    lbl17: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    sLabel3: TLabel;
    cxDBShellComboBox1: TcxDBShellComboBox;
    cxDBShellComboBox2: TcxDBShellComboBox;
    cxDBShellComboBox3: TcxDBShellComboBox;
    cxDBShellComboBox4: TcxDBShellComboBox;
    cxDBShellComboBox5: TcxDBShellComboBox;
    cxDBShellComboBox6: TcxDBShellComboBox;
    cxDBShellComboBox7: TcxDBShellComboBox;
    GroupBox6: TGroupBox;
    sLabel6: TLabel;
    lbl8: TLabel;
    cxDBShellComboBox8: TcxDBShellComboBox;
    cxDBShellComboBox9: TcxDBShellComboBox;
    procedure FormCreate(Sender: TObject);
    procedure acInsertExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlkParmetrosFRM: TMlkParmetrosFRM;

implementation

uses
  uMlkPrincipalDTM, uConstantesComuns;

{$R *.dfm}

procedure TMlkParmetrosFRM.acInsertExecute(Sender: TObject);
begin
  inherited;
  MlkPrincipalDTM.InserirVlrDefaultConta;
  ActiveControl := edtNomeEmpresa;
end;

procedure TMlkParmetrosFRM.FormCreate(Sender: TObject);
begin
  inherited;
   GetDados := MlkPrincipalDTM.PesquisarConta;
   SetDados := MlkPrincipalDTM.SalvarConta;
   MlkPrincipalDTM.PesquisarConta(FiltroInicial);
end;

end.
