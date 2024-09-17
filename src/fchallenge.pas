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
/// File last update : 2024-09-17T19:00:44.682+02:00
/// Signature : 3112b0ce01c430af46a47d39a10da0fce7592d70
/// ***************************************************************************
/// </summary>

unit fchallenge;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fjeu, FMX.Controls.Presentation, FMX.Layouts, FMX.ImgList, cNombreEnImages,
  cMotsEnImages;

type
  TfrmChallenge = class(TfrmJeu)
    Chronometre: TTimer;
    AffichageTemps: TNombreEnImages;
    AfficheMotTemps: TMotsEnImages;
    procedure ChronometreTimer(Sender: TObject);
  private
    FTempsRestant: integer;
    BlocageEcranFinDePartie: tlayout;
    procedure SetTempsRestant(const Value: integer);
    { Déclarations privées }
    procedure BoutonPartageClick(Sender: TObject);
  protected
    procedure FinDuNiveau; override;
    procedure FinDePartie; override;
    procedure ScoreAnnulationCarte; override;
    procedure ScoreMauvaisePaire; override;
    procedure ScorePaireTrouvee; override;
  public
    { Déclarations publiques }
    property TempsRestant: integer read FTempsRestant write SetTempsRestant;
    procedure init; override;
    procedure ArretPartie; override;
    procedure ReprendrePartie; override;
    class function Current: TfrmChallenge;
  end;

var
  frmChallenge: TfrmChallenge;

implementation

{$R *.fmx}

uses
  FMX.MediaLibrary, FMX.Platform, fmain, cBoutonPartage;

procedure TfrmChallenge.FinDePartie;
var
  ZoneAffichageScoreFinal, ZoneHaut, ZoneBas: tlayout;
  VotreScore: TMotsEnImages;
  ValeurScore: TNombreEnImages;
  BoutonPartage: TBoutonPartage;
begin
  if assigned(BlocageEcranFinDePartie) then
    FreeAndNil(BlocageEcranFinDePartie);

  BlocageEcranFinDePartie := tlayout.Create(self);
  BlocageEcranFinDePartie.Parent := zoneDeJeu;
  BlocageEcranFinDePartie.Align := talignlayout.contents;
  BlocageEcranFinDePartie.HitTest := true;

  if TPlatformServices.Current.SupportsPlatformService
    (IFMXShareSheetActionsService) then
  begin
    BoutonPartage := TBoutonPartage.Create(BlocageEcranFinDePartie);
    BoutonPartage.Parent := self;
    BoutonPartage.Align := talignlayout.Center;
    BoutonPartage.OnClick := BoutonPartageClick;
  end;

  ZoneAffichageScoreFinal := tlayout.Create(BlocageEcranFinDePartie);
  ZoneAffichageScoreFinal.Parent := self;
  ZoneAffichageScoreFinal.HitTest := false;
  ZoneAffichageScoreFinal.Height := 180;
  ZoneAffichageScoreFinal.Align := talignlayout.top;
  if (position.Y > 50) then
    ZoneAffichageScoreFinal.Margins.top := 50 - position.Y
  else
    ZoneAffichageScoreFinal.Margins.top := 5 - position.Y;

  ZoneHaut := tlayout.Create(BlocageEcranFinDePartie);
  ZoneHaut.Parent := ZoneAffichageScoreFinal;
  ZoneHaut.HitTest := false;
  ZoneHaut.Height := 80;
  ZoneHaut.Align := talignlayout.top;

  VotreScore := TMotsEnImages.Create(BlocageEcranFinDePartie);
  VotreScore.name := '';
  VotreScore.Parent := ZoneHaut;
  VotreScore.HitTest := false;
  VotreScore.Height := 80;
  VotreScore.Align := talignlayout.Center;
  VotreScore.Value := 'Score final:';
  if VotreScore.Width > ZoneAffichageScoreFinal.Width then
    ZoneAffichageScoreFinal.Width := VotreScore.Width;

  ZoneBas := tlayout.Create(BlocageEcranFinDePartie);
  ZoneBas.Parent := ZoneAffichageScoreFinal;
  ZoneBas.HitTest := false;
  ZoneBas.Height := 80;
  ZoneBas.Align := talignlayout.bottom;

  ValeurScore := TNombreEnImages.Create(BlocageEcranFinDePartie);
  ValeurScore.name := '';
  ValeurScore.Parent := ZoneBas;
  VotreScore.HitTest := false;
  ValeurScore.Height := 80;
  ValeurScore.Align := talignlayout.Center;
  ValeurScore.Value := score;
  if ValeurScore.Width > ZoneAffichageScoreFinal.Width then
    ZoneAffichageScoreFinal.Width := ValeurScore.Width;

  ZoneScore.Visible := false;
end;

procedure TfrmChallenge.FinDuNiveau;
begin
  case NiveauDeJeu of
    TNiveauDeJeu.facile:
      NiveauDeJeu := TNiveauDeJeu.moyen;
    TNiveauDeJeu.moyen:
      NiveauDeJeu := TNiveauDeJeu.difficile;
    TNiveauDeJeu.difficile:
      NiveauDeJeu := TNiveauDeJeu.hard;
  end;
  InitialisePlateauDuJeu;
end;

procedure TfrmChallenge.init;
begin
  if assigned(BlocageEcranFinDePartie) then
    FreeAndNil(BlocageEcranFinDePartie);
  ZoneScore.Visible := true;
  inherited;
  TempsRestant := 60;
  Chronometre.Enabled := true;
end;

procedure TfrmChallenge.ReprendrePartie;
begin
  inherited;
  Chronometre.Enabled := true;
  // TODO : à compléter
end;

procedure TfrmChallenge.ScoreAnnulationCarte;
begin
  ScoreMauvaisePaire;
end;

procedure TfrmChallenge.ScoreMauvaisePaire;
begin
  score := score - FTempsRestant;
end;

procedure TfrmChallenge.ScorePaireTrouvee;
begin
  score := score + 2 * FTempsRestant;
end;

procedure TfrmChallenge.SetTempsRestant(const Value: integer);
begin
  FTempsRestant := Value;
  if (FTempsRestant < 0) then
  begin
    Chronometre.Enabled := false;
    FinDePartie;
  end
  else
    AffichageTemps.Value := FTempsRestant;
  if AfficheMotTemps.Value.IsEmpty then
    AfficheMotTemps.Value := 'Temps:';
end;

procedure TfrmChallenge.ArretPartie;
begin
  inherited;
  Chronometre.Enabled := false;
  // TODO : à compléter
end;

procedure TfrmChallenge.BoutonPartageClick(Sender: TObject);
var
  partage: IFMXShareSheetActionsService;
  ctrl: tcontrol;
  texte: string;
  bmp: tbitmap;
  frm: TfrmMain;
  oldBtnAccueilVisible: boolean;
begin
  // https://developpeur-pascal.fr/utiliser-les-fonctionnalites-de-partage-social-des-smartphones-et-tablettes.html
  if TPlatformServices.Current.SupportsPlatformService
    (IFMXShareSheetActionsService, partage) then
  begin
    if Sender is tcontrol then
      ctrl := Sender as tcontrol
    else
      ctrl := nil;
    texte := 'Mon dernier score en mode challenge est de ' + score.ToString +
      '. Feras-tu mieux sur #Pairpix ? https://pairpix.gamolf.fr';
    bmp := tbitmap.Create(application.MainForm.Width,
      application.MainForm.Height);
    try
      if (application.MainForm is TfrmMain) then
      begin
        frm := application.MainForm as TfrmMain;
        oldBtnAccueilVisible := frm.btnAccueil.Visible;
        frm.btnAccueil.Visible := false;
      end
      else
        frm := nil;

      if (Sender is TBoutonPartage) then
        (Sender as TBoutonPartage).Visible := false;

      // "Capture" de l'écran
      (application.MainForm as tform).paintto(bmp.canvas);

      if (Sender is TBoutonPartage) then
        (Sender as TBoutonPartage).Visible := true;

      if assigned(frm) then
        frm.btnAccueil.Visible := oldBtnAccueilVisible;

      // Déclenchement du partage sur l'OS
      partage.Share(ctrl, texte, bmp);
    finally
      bmp.Free;
    end;
  end;
end;

procedure TfrmChallenge.ChronometreTimer(Sender: TObject);
begin
  TempsRestant := TempsRestant - 1;
end;

class function TfrmChallenge.Current: TfrmChallenge;
begin
  if not assigned(frmChallenge) then
    frmChallenge := TfrmChallenge.Create(application.MainForm);
  result := frmChallenge;
end;

end.
