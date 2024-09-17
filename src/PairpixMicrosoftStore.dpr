/// <summary>
/// ***************************************************************************
///
/// Pairpix
///
/// Copyright 2022-2024 Patrick Prémartin under AGPL 3.0 license.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
/// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
/// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
/// DEALINGS IN THE SOFTWARE.
///
/// ***************************************************************************
///
/// Author(s) :
/// Patrick PREMARTIN
///
/// Site :
/// https://pairpix.gamolf.fr/
///
/// Project site :
/// https://github.com/DeveloppeurPascal/Pairpix
///
/// ***************************************************************************
/// File last update : 2024-09-17T19:00:44.663+02:00
/// Signature : 7acdd008c9d41bc036ae1c65cf6c905e3a5e2486
/// ***************************************************************************
/// </summary>

program PairpixMicrosoftStore;

uses
  System.StartUpCopy,
  FMX.Forms,
  fmain in 'fmain.pas' {frmMain},
  udivers in 'udivers.pas',
  uTplDialog in 'uTplDialog.pas' {tplDialog: TFrame},
  uTplFondDuJeu in 'uTplFondDuJeu.pas' {tplFondDuJeu: TFrame},
  faccueil in 'faccueil.pas' {frmAccueil: TFrame},
  fcredits in 'fcredits.pas' {frmCredits: TFrame},
  ffindeniveau in 'ffindeniveau.pas' {frmFinDeNiveau: TFrame},
  ffindepartie in 'ffindepartie.pas' {frmFinDePartie: TFrame},
  fjeu in 'fjeu.pas' {frmJeu: TFrame},
  foptions in 'foptions.pas' {frmOptions: TFrame},
  fscores in 'fscores.pas' {frmScores: TFrame},
  cCarteDuJeu in 'cCarteDuJeu.pas' {CarteDuJeu: TFrame},
  fchallenge in 'fchallenge.pas' {frmChallenge: TFrame},
  cNombreEnImages in 'cNombreEnImages.pas' {NombreEnImages: TFrame},
  cMotsEnImages in 'cMotsEnImages.pas' {MotsEnImages: TFrame},
  cBoutonPartage in 'cBoutonPartage.pas' {BoutonPartage: TFrame},
  uDMFonteDeCaracteres in '..\_PRIVATE\src\uDMFonteDeCaracteres.pas' {DMFonteDeCaracteres: TDataModule},
  uDmImgDecors in '..\_PRIVATE\src\uDmImgDecors.pas' {dmImgDecors: TDataModule},
  uDmImgJeu in '..\_PRIVATE\src\uDmImgJeu.pas' {dmImgJeu: TDataModule},
  uDmImgMemoryComponents in '..\_PRIVATE\src\uDmImgMemoryComponents.pas' {dmImgMemoryComponents: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDMFonteDeCaracteres, DMFonteDeCaracteres);
  Application.CreateForm(TdmImgDecors, dmImgDecors);
  Application.CreateForm(TdmImgJeu, dmImgJeu);
  Application.Run;
end.
