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
