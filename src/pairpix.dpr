(* C2PP
  ***************************************************************************

  Pairpix

  Copyright 2022-2025 Patrick Prémartin under AGPL 3.0 license.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  DEALINGS IN THE SOFTWARE.

  ***************************************************************************

  Author(s) :
  Patrick PREMARTIN

  Site :
  https://pairpix.gamolf.fr/

  Project site :
  https://github.com/DeveloppeurPascal/Pairpix

  ***************************************************************************
  File last update : 2025-07-03T10:44:17.196+02:00
  Signature : c754baea4a05e10c4355ea987c3687703629ad2b
  ***************************************************************************
*)

program pairpix;

uses
  System.StartUpCopy,
  FMX.Forms,
  fmain in 'fmain.pas' {frmMain},
  udivers in 'udivers.pas',
  uDmImgDecors in '..\_PRIVATE\src\uDmImgDecors.pas' {dmImgDecors: TDataModule},
  uDmImgJeu in '..\_PRIVATE\src\uDmImgJeu.pas' {dmImgJeu: TDataModule},
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
  uDMFonteDeCaracteres in '..\_PRIVATE\src\uDMFonteDeCaracteres.pas' {DMFonteDeCaracteres: TDataModule},
  cBoutonPartage in 'cBoutonPartage.pas' {BoutonPartage: TFrame},
  uDmImgMemoryComponents in '..\_PRIVATE\src\uDmImgMemoryComponents.pas' {dmImgMemoryComponents: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmImgDecors, dmImgDecors);
  Application.CreateForm(TdmImgJeu, dmImgJeu);
  Application.CreateForm(TDMFonteDeCaracteres, DMFonteDeCaracteres);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
