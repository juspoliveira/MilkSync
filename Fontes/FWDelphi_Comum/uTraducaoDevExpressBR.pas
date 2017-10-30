unit uTraducaoDevExpressBR;

interface

uses cxClasses,cxGridStrs,cxFilterControlStrs, cxEditConsts,cxLibraryStrs;

Procedure SetResorcePortugues;

implementation

Procedure SetResorcePortugues;

begin

  cxSetResourceString(@cxSFilterBoolOperatorAnd,'AND');

  cxSetResourceString(@cxSFilterBoolOperatorOr,'OR');

  cxSetResourceString(@cxSFilterBoolOperatorNotAnd,'NOT AND');

  cxSetResourceString(@cxSFilterBoolOperatorNotOr,'NOT OR');

  cxSetResourceString(@cxSFilterRootButtonCaption,'Filtro');

  cxSetResourceString(@cxSFilterAddCondition,'inclui &Condição');

  cxSetResourceString(@cxSFilterAddGroup, 'Inclui &Group0');

  cxSetResourceString(@cxSFilterRemoveRow, '&Remove linha');

  cxSetResourceString(@cxSFilterClearAll, 'Apaga &Todos');

  cxSetResourceString(@cxSFilterFooterAddCondition, 'Precione o botão p/ nova condição');


  cxSetResourceString(@cxSFilterGroupCaption, 'aplica-se às seguintes condições');

  cxSetResourceString(@cxSFilterRootGroupCaption, '');

  cxSetResourceString(@cxSFilterControlNullString, '');

  cxSetResourceString(@cxSFilterErrorBuilding, 'Can''t build filter from source');

  //FilterDialog

  cxSetResourceString(@cxSFilterDialogCaption, 'Configurar Filtro');

  cxSetResourceString(@cxSFilterDialogInvalidValue, 'Valor invalido');

  cxSetResourceString(@cxSFilterDialogUse, 'Usar');

  cxSetResourceString(@cxSFilterDialogSingleCharacter, 'to represent any single character');

  cxSetResourceString(@cxSFilterDialogCharactersSeries, 'to represent any series of characters');


  cxSetResourceString(@cxSFilterDialogOperationAnd, 'AND');

  cxSetResourceString(@cxSFilterDialogOperationOr, 'OR');

  cxSetResourceString(@cxSFilterDialogRows, 'Criar filtro para:');


  // FilterControlDialog

  cxSetResourceString(@cxSFilterControlDialogCaption, 'Construtor de filtro');

  cxSetResourceString(@cxSFilterControlDialogNewFile, 'untitled.flt');

  cxSetResourceString(@cxSFilterControlDialogOpenDialogCaption, 'Open an existing filter');

  cxSetResourceString(@cxSFilterControlDialogSaveDialogCaption, 'Save the active filter to file');

  cxSetResourceString(@cxSFilterControlDialogActionSaveCaption, '&Savar como...');

  cxSetResourceString(@cxSFilterControlDialogActionOpenCaption, '&Abrir...');

  cxSetResourceString(@cxSFilterControlDialogActionApplyCaption, '&Aplicar');

  cxSetResourceString(@cxSFilterControlDialogActionOkCaption, 'OK');

  cxSetResourceString(@cxSFilterControlDialogActionCancelCaption, 'Cancelar');

  cxSetResourceString(@cxSFilterControlDialogFileExt, 'flt');

  cxSetResourceString(@cxSFilterControlDialogFileFilter, 'Filters(*.flt)|*.flt');

  // cxGrid

  cxSetResourceString(@scxGridRecursiveLevels, 'You cannot create recursive levels');

  cxSetResourceString(@scxGridDeletingConfirmationCaption, 'Confirme');

  cxSetResourceString(@scxGridDeletingFocusedConfirmationText, 'Delete registro?');

  cxSetResourceString(@scxGridDeletingSelectedConfirmationText, 'Detele todos os registros selecionados?');

  cxSetResourceString(@scxGridNewItemRowInfoText, 'Click aqui para adicionar uma Coluna nova');

  cxSetResourceString(@scxGridFilterIsEmpty, '');

  cxSetResourceString(@scxGridCustomizationFormCaption, 'Configuraçao');

  cxSetResourceString(@scxGridCustomizationFormColumnsPageCaption, 'Colunas');

  cxSetResourceString(@scxGridGroupByBoxCaption, 'Arraste o cabeçalho da coluna aqui para agrupar por ela');

  cxSetResourceString(@scxGridFilterCustomizeButtonCaption, 'Configure...');

  cxSetResourceString(@scxGridCustomizationFormBandsPageCaption, 'Faixas');

  cxSetResourceString(@scxGridConverterIntermediaryMissing,'Faltando um componente!'#13#10'Por favor adicione um componente de %s ao formulário');

  cxSetResourceString(@scxGridConverterNotExistGrid, 'Grade não existe');

  cxSetResourceString(@scxGridConverterNotExistComponent, 'Componente não existe');

  cxSetResourceString(@scxImportErrorCaption, 'Erro ao importar');

  cxSetResourceString(@scxNotExistGridView, 'Visualização da grade não existe');

  cxSetResourceString(@scxNotExistGridLevel, 'O nível ativo da grade não existe');

  cxSetResourceString(@scxCantCreateExportOutputFile, 'Não posso criar arquivo de exportação');

  cxSetResourceString(@cxSEditRepositoryExtLookupComboBoxItem,

'ExtLookupComboBox|Representa um lookup ultra-avançado que usa o QuantumGrid como base');

{
cxSEditInvalidRepositoryItem = 'The repository item is not acceptable';
084
  cxSEditNumericValueConvertError = 'Could not convert to numeric value';
085
  cxSEditPopupCircularReferencingError = 'Circular referencing is not allowed';
086
  cxSEditPostError = 'An error occured during posting edit value';
087
  cxSEditTimeConvertError = 'Could not convert to time';
088
  cxSEditValidateErrorText = 'Invalid input value. Use escape key to abandon
089
changes';
090
  cxSEditValueOutOfBounds = 'Value out of bounds';
091
 }

// TODO

  cxSetResourceString(@cxSEditCheckBoxChecked,'Verdadeiro');

  cxSetResourceString(@cxSEditCheckBoxGrayed,'');

  cxSetResourceString(@cxSEditCheckBoxUnchecked,'Falso');

  cxSetResourceString(@cxSRadioGroupDefaultCaption,'');

  cxSetResourceString(@cxSTextTrue,'Verdadeiro');

  cxSetResourceString(@cxSTextFalse,'Falso');

  // blob

  cxSetResourceString(@cxSBlobButtonOK         ,'&OK');

  cxSetResourceString(@cxSBlobButtonCancel     ,'&Cancelar');

  cxSetResourceString(@cxSBlobButtonClose      ,'&Close');

  cxSetResourceString(@cxSBlobMemo             ,'(MEMO)');

  cxSetResourceString(@cxSBlobMemoEmpty        ,'(memo)');

  cxSetResourceString(@cxSBlobPicture          ,'(PICTURE)');

  cxSetResourceString(@cxSBlobPictureEmpty     ,'(picture)');

  // popup menu items

  cxSetResourceString(@cxSMenuItemCaptionCut   ,'Cu&t');

  cxSetResourceString(@cxSMenuItemCaptionCopy  ,'&Copiar');

  cxSetResourceString(@cxSMenuItemCaptionPaste ,'&Colar');

  cxSetResourceString(@cxSMenuItemCaptionDelete,'&Apagar');

  cxSetResourceString(@cxSMenuItemCaptionLoad  ,'&Abrir...');

  cxSetResourceString(@cxSMenuItemCaptionSave  ,'Salvar como...');

  // date

  cxSetResourceString(@cxSDatePopupToday, 'Hoje');

  cxSetResourceString(@cxSDatePopupClear, 'Apagar');

  cxSetResourceString(@cxSDateError     , 'Data Inválida');

  // smart input consts

  cxSetResourceString(@cxSDateToday     , 'Hoje');

  cxSetResourceString(@cxSDateYesterday , 'Ontem');

  cxSetResourceString(@cxSDateTomorrow  , 'Amanhã');

  cxSetResourceString(@cxSDateSunday    , 'Domingo');

  cxSetResourceString(@cxSDateMonday    , 'Segunda');

  cxSetResourceString(@cxSDateTuesday   , 'Terça');

  cxSetResourceString(@cxSDateWednesday , 'Quarta');

  cxSetResourceString(@cxSDateThursday  , 'Quinta');

  cxSetResourceString(@cxSDateFriday    , 'Sexta');

  cxSetResourceString(@cxSDateSaturday  , 'Sábado');

  cxSetResourceString(@cxSDateFirst     , 'Primeiro');

  cxSetResourceString(@cxSDateSecond    , 'segundos');

  cxSetResourceString(@cxSDateThird     , 'Terceiro');

  cxSetResourceString(@cxSDateFourth    , 'Quarto');

  cxSetResourceString(@cxSDateFifth     , 'Quinto');

  cxSetResourceString(@cxSDateSixth     , 'Sexto');

  cxSetResourceString(@cxSDateSeventh   , 'Sétimo');

  cxSetResourceString(@cxSDateBOM       , 'bom');

  cxSetResourceString(@cxSDateEOM       , 'eom');

  cxSetResourceString(@cxSDateNow       , 'Agora');

{  // calculator
145
  cxSetResourceString(@scxSCalcError                      = 'Error';
146

147
  // edit repository
148
  cxSetResourceString(@scxSEditRepositoryBlobItem         =
149
'BlobEdit|Represents the BLOB editor';
150
  cxSetResourceString(@scxSEditRepositoryButtonItem       =
151
'ButtonEdit|Represents an edit control with embedded buttons';
152
  cxSetResourceString(@scxSEditRepositoryCalcItem         =
153
'CalcEdit|Represents an edit control with a dropdown calculator window';
154
  cxSetResourceString(@scxSEditRepositoryCheckBoxItem     =
155
'CheckBox|Represents a check box control that allows selecting an option';
156
  cxSetResourceString(@scxSEditRepositoryComboBoxItem     =
157
'ComboBox|Represents the combo box editor';
158
  cxSetResourceString(@scxSEditRepositoryCurrencyItem     =
159
'CurrencyEdit|Represents an editor enabling editing currency data';
160
  cxSetResourceString(@scxSEditRepositoryDateItem         =
161
'DateEdit|Represents an edit control with a dropdown calendar';
162
  cxSetResourceString(@scxSEditRepositoryHyperLinkItem    =
163
'HyperLink|Represents a text editor with hyperlink functionality';
164
  cxSetResourceString(@scxSEditRepositoryImageComboBoxItem =
165
'ImageComboBox|Represents an editor displaying the list of images and text
166
strings within the dropdown window';
167
  cxSetResourceString(@scxSEditRepositoryImageItem        = 'Image|Represents
168
an image editor';
169
  cxSetResourceString(@scxSEditRepositoryLookupComboBoxItem =
170
'LookupComboBox|Represents a lookup combo box control';
171
  cxSetResourceString(@scxSEditRepositoryMaskItem         =
172
'MaskEdit|Represents a generic masked edit control.';
173
  cxSetResourceString(@scxSEditRepositoryMemoItem         = 'Memo|Represents an
174
edit control that allows editing memo data';
175
  cxSetResourceString(@scxSEditRepositoryMRUItem          = 'MRUEdit|Represents
176
a text editor displaying the list of most recently used items (MRU) within a
177
dropdown window';
178
  cxSetResourceString(@scxSEditRepositoryPopupItem        =
179
'PopupEdit|Represents an edit control with a dropdown list';
180
  cxSetResourceString(@scxSEditRepositorySpinItem         =
181
'SpinEdit|Represents a spin editor';
182
  cxSetResourceString(@scxSEditRepositoryRadioGroupItem   =
183
'RadioGroup|Represents a group of radio buttons';
184
  cxSetResourceString(@scxSEditRepositoryTextItem         =
185
'TextEdit|Represents a single line text editor';
186
  cxSetResourceString(@scxSEditRepositoryTimeItem         =
187
'TimeEdit|Represents an editor displaying time values';
188

189
  cxSetResourceString(@scxRegExprLine = 'Line';
190
  cxSetResourceString(@scxRegExprChar = 'Char';
191
  cxSetResourceString(@scxRegExprNotAssignedSourceStream = 'The source stream
192
is not assigned';
193
  cxSetResourceString(@scxRegExprEmptySourceStream = 'The source stream is
194
empty';
195
  cxSetResourceString(@scxRegExprCantUsePlusQuantifier = 'The ''+'' quantifier
196
cannot be applied here';
197
  cxSetResourceString(@scxRegExprCantUseStarQuantifier = 'The ''*'' quantifier
198
cannot be applied here';
199
  cxSetResourceString(@scxRegExprCantCreateEmptyAlt = 'The alternative should
200
not be empty';
201
  cxSetResourceString(@scxRegExprCantCreateEmptyBlock = 'The block should not
202
be empty';
203
  cxSetResourceString(@scxRegExprIllegalSymbol = 'Illegal ''%s''';
204
  cxSetResourceString(@scxRegExprIllegalQuantifier = 'Illegal quantifier
205
''%s''';
206
  cxSetResourceString(@scxRegExprNotSupportQuantifier = 'The parameter
207
quantifiers are not supported';
208
  cxSetResourceString(@scxRegExprIllegalIntegerValue = 'Illegal integer value';
209
  cxSetResourceString(@scxRegExprTooBigReferenceNumber = 'Too big reference
210
number';
211
  cxSetResourceString(@scxRegExprCantCreateEmptyEnum = 'Can''t create empty
212
enumeration';
213
  cxSetResourceString(@scxRegExprSubrangeOrder = 'The starting character of the
214
subrange must be less than the finishing one';
215
  cxSetResourceString(@scxRegExprHexNumberExpected0 = 'Hexadecimal number
216
expected';
217
  cxSetResourceString(@scxRegExprHexNumberExpected = 'Hexadecimal number
218
expected but ''%s'' found';
219
  cxSetResourceString(@scxRegExprMissing = 'Missing ''%s''';
220
  cxSetResourceString(@scxRegExprUnnecessary = 'Unnecessary ''%s''';
221
  cxSetResourceString(@scxRegExprIncorrectSpace = 'The space character is not
222
allowed after ''\''';
223
  cxSetResourceString(@scxRegExprNotCompiled = 'Regular expression is not
224
compiled';
225
  cxSetResourceString(@scxRegExprIncorrectParameterQuantifier = 'Incorrect
226
parameter quantifier';
227
  cxSetResourceString(@scxRegExprCantUseParameterQuantifier = 'The parameter
228
quantifier cannot be applied here';
229

230
  cxSetResourceString(@scxMaskEditRegExprError = 'Regular expression errors:';
231
  cxSetResourceString(@scxMaskEditInvalidEditValue = 'The edit value is
232
invalid';
233
  cxSetResourceString(@scxMaskEditNoMask = 'None';
234
  cxSetResourceString(@scxMaskEditIllegalFileFormat = 'Illegal file format';
235
  cxSetResourceString(@scxMaskEditEmptyMaskCollectionFile = 'The mask
236
collection file is empty';
237
  cxSetResourceString(@scxMaskEditMaskCollectionFiles = 'Mask collection
238
files';}

end;
end.
