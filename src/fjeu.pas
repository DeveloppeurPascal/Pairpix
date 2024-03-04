unit fjeu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms,
  FMX.Dialogs, FMX.StdCtrls, uTplFondDuJeu, uGameButton, FMX.Layouts,
  FMX.ImgList, cCarteDuJeu, FMX.Controls.Presentation,
  cNombreEnImages, cMotsEnImages;

type
{$SCOPEDENUMS on}
  TNiveauDeJeu = (facile = 1, moyen = 2, difficile = 3, hard = 4);

  TfrmJeu = class(TtplFondDuJeu)
    zoneCartesDuJeu: TFlowLayout;
    VerrouEcran: TLayout;
    ZoneScore: TLayout;
    AffichageScore: TNombreEnImages;
    AfficheMotScore: TMotsEnImages;
  private
    { Déclarations privées }
    PremiereCarteCliquee: tcartedujeu;
    FNiveauDeJeu: TNiveauDeJeu;
    FNombrePairesRestantes: integer;
    FScore: integer;
    FNbEcransACeNiveau: integer;
    procedure SetNiveauDeJeu(const Value: TNiveauDeJeu);
    procedure SetNombrePairesRestantes(const Value: integer);
    procedure SetScore(const Value: integer);
    procedure SetNbEcransACeNiveau(const Value: integer);
  protected
    procedure ScorePaireTrouvee; virtual;
    procedure ScoreMauvaisePaire; virtual;
    procedure ScoreAnnulationCarte; virtual;
    procedure FinDuNiveau; virtual;
    procedure FinDePartie; virtual;
  public
    { Déclarations publiques }
    property NbEcransACeNiveau: integer read FNbEcransACeNiveau
      write SetNbEcransACeNiveau;
    property NiveauDeJeu: TNiveauDeJeu read FNiveauDeJeu write SetNiveauDeJeu;
    property NombrePairesRestantes: integer read FNombrePairesRestantes
      write SetNombrePairesRestantes;
    property Score: integer read FScore write SetScore;
    class function Current: TfrmJeu;
    procedure init; override;
    procedure onClickSurCarte(CarteCliquee: tcartedujeu; Affichage: boolean);
    procedure VerrouilleEcran;
    procedure DeVerrouilleEcran;
    procedure InitialisePlateauDuJeu;
    procedure ArretPartie; virtual;
    procedure ReprendrePartie; virtual;
  end;

implementation

{$R *.fmx}

uses uDmImgJeu, System.Math;

var
  frmJeu: TfrmJeu;

procedure TfrmJeu.ReprendrePartie;
begin
  // TODO : à compléter
end;

class function TfrmJeu.Current: TfrmJeu;
begin
  if not assigned(frmJeu) then
    frmJeu := TfrmJeu.Create(application.mainform);
  result := frmJeu;
end;

procedure TfrmJeu.DeVerrouilleEcran;
begin
  VerrouEcran.Visible := false;
end;

procedure TfrmJeu.FinDePartie;
begin
  // TODO : à compléter si nécessaire au niveau du jeu classique
end;

procedure TfrmJeu.FinDuNiveau;
begin
  NbEcransACeNiveau := FNbEcransACeNiveau + 1;
  if NbEcransACeNiveau >= (ord(NiveauDeJeu) * 2) then // 2, 4, 6, 8, ...
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

procedure TfrmJeu.init;
begin
  inherited;
  NiveauDeJeu := TNiveauDeJeu.facile;
  Score := 0;
  InitialisePlateauDuJeu;
end;

procedure TfrmJeu.InitialisePlateauDuJeu;
var
  carte: tcartedujeu;
  i, j: integer;
  TypeCarte: integer;
  tab: array of integer;
  //trouve: boolean;
  TailleCarte: integer;
  NbCol, NbLig: integer;
  NombreCartes: integer;
begin
  DeVerrouilleEcran;

  // initialiser la zone de jeu
  while (zoneCartesDuJeu.ChildrenCount > 0) do
    zoneCartesDuJeu.Children[0].Free;

  // Détermination des différents éléments du jeu (taille des cartes, nombre de paires maxi, ...)
  case NiveauDeJeu of
    TNiveauDeJeu.facile:
      begin // 6 cartes, 3 paires
        NbCol := 3;
        NbLig := 2;
      end;
    TNiveauDeJeu.moyen:
      begin // 12 cartes, 6 paires
        NbCol := 4;
        NbLig := 3;
      end;
    TNiveauDeJeu.difficile:
      begin // 20 cartes, 10 paires
        NbCol := 5;
        NbLig := 4;
      end;
    TNiveauDeJeu.hard:
      begin // 30 cartes, 15 paires
        NbCol := 6;
        NbLig := 5;
      end;
  else
    raise exception.Create('Niveau de jeu non défini.');
  end;
  TailleCarte := trunc(min((zoneDeJeu.Width - 10 * NbCol) / NbCol,
    (zoneDeJeu.height - 10 * NbLig) / NbLig));
  zoneCartesDuJeu.Width := NbCol * (10 + TailleCarte);
  zoneCartesDuJeu.height := NbLig * (10 + TailleCarte);
  NombreCartes := NbCol * NbLig;
  NombrePairesRestantes := NombreCartes div 2;

  // définit la liste des motifs et leur attribue une carte
  setlength(tab, NombreCartes);
  for i := 0 to NombreCartes - 1 do
    tab[i] := -1;
  TypeCarte := -1;
  for i := 0 to NombreCartes - 1 do
  begin
    // Une carte sur 2 on choisit le motif (=> animal)
    if (i mod 2) = 0 then
    begin
      TypeCarte := random(dmImgJeu.imgFacesCartes.Count);
      { **********
        Bloquer le nombre de visuels possibles est bien trop compliqué en multipliant le nombre de cartes.
        **********

        repeat
        trouve := false;
        // paire unique si niveaux de jeu Difficile ou Hard
        if NiveauDeJeu in [TNiveauDeJeu.difficile, TNiveauDeJeu.hard] then
        for j := 0 to NombreCartes - 1 do
        trouve := trouve or (tab[j] = TypeCarte);
        // Si carte déjà dans la liste, on tente le motif précédent
        if trouve then
        if TypeCarte > 0 then
        dec(TypeCarte)
        else
        TypeCarte := dmImgJeu.imgFacesCartes.Count - 1;
        until not trouve;
        ********** }
    end;
    // On range au hasard dans la liste des cartes disponibles.
    j := random(NombreCartes);
    // while not tab[j] = -1 do // (not tab[j]) = -1
    while not(tab[j] = -1) do
      if j > 0 then
        dec(j)
      else
        j := NombreCartes - 1;
    // Emplacement et type de carte ok
    tab[j] := TypeCarte;
  end;

  // Ajoute les cartes dans leur ordre d'affichage à l'écran
  for i := 0 to NombreCartes - 1 do
  begin
    carte := tcartedujeu.Create(self);
    carte.Parent := zoneCartesDuJeu;
    carte.Margins.Left := 10;
    carte.Margins.top := 10;
    carte.Sens := tcdjsens.horizontal;
    carte.Cote := tcdjCote.dos;
    carte.TypeCarte := tab[i];
    carte.onClickSurCarte := onClickSurCarte;
    carte.Largeur := TailleCarte;
    carte.Hauteur := TailleCarte;
  end;

  // initialise les variables de gestion du jeu
  PremiereCarteCliquee := nil;
end;

procedure TfrmJeu.onClickSurCarte(CarteCliquee: tcartedujeu;
  Affichage: boolean);
begin
  if not assigned(CarteCliquee) then
    exit;

  if Affichage then
  begin
    // On dévoile une carte.
    if assigned(PremiereCarteCliquee) then
    begin
      // On a cliqué sur une deuxième carte.
      if PremiereCarteCliquee.TypeCarte = CarteCliquee.TypeCarte then
      begin
        // On a les mêmes cartes, on les bloque, on gagne des points.
        ScorePaireTrouvee;
        PremiereCarteCliquee.Verrouille;
        PremiereCarteCliquee := nil;
        CarteCliquee.Verrouille;
        NombrePairesRestantes := NombrePairesRestantes - 1;
      end
      else
      begin
        // Ce ne sont pas les mêmes cartes, on gère les erreurs.
        ScoreMauvaisePaire;
        VerrouilleEcran;
        tthread.CreateAnonymousThread(
          procedure
          begin
            sleep(500); // 0.5 seconde avant de retourner les cartes
            tthread.Synchronize(nil,
              procedure
              begin
                PremiereCarteCliquee.Retourne;
                PremiereCarteCliquee := nil;
                CarteCliquee.Retourne;
                DeVerrouilleEcran;
              end);
          end).Start;
      end;
    end
    else
    begin
      // On a cliqué sur la première carte.
      PremiereCarteCliquee := CarteCliquee;
    end;
  end
  else
  begin
    // On masque une carte.
    ScoreAnnulationCarte;
    if (PremiereCarteCliquee = CarteCliquee) then
      PremiereCarteCliquee := nil
    else
      raise exception.Create('Masquage d''une carte secondaire !');
  end;
end;

procedure TfrmJeu.ArretPartie;
begin
  // TODO : à compléter
end;

procedure TfrmJeu.ScoreAnnulationCarte;
begin
  ScoreMauvaisePaire;
end;

procedure TfrmJeu.ScoreMauvaisePaire;
begin
  Score := Score - 1;
end;

procedure TfrmJeu.ScorePaireTrouvee;
begin
  Score := Score + 2;
end;

procedure TfrmJeu.SetNbEcransACeNiveau(const Value: integer);
begin
  FNbEcransACeNiveau := Value;
end;

procedure TfrmJeu.SetNiveauDeJeu(const Value: TNiveauDeJeu);
begin
  FNiveauDeJeu := Value;
  NbEcransACeNiveau := 0;
end;

procedure TfrmJeu.SetNombrePairesRestantes(const Value: integer);
var
  bravo: TMotsEnImages;
begin
  FNombrePairesRestantes := Value;
  if (FNombrePairesRestantes < 1) then
  begin
    bravo := TMotsEnImages.Create(self);
    bravo.Name := '';
    bravo.Parent := self;
    bravo.Align := talignlayout.Center;
    bravo.height := 120;
    bravo.Value := 'Bravo !';
    VerrouilleEcran;
    tthread.CreateAnonymousThread(
      procedure
      begin
        sleep(1000); // 0.5 seconde avant de retourner les cartes
        tthread.Synchronize(nil,
          procedure
          begin
            bravo.Free;
            DeVerrouilleEcran;
            FinDuNiveau;
          end);
      end).Start;
  end;
end;

procedure TfrmJeu.SetScore(const Value: integer);
begin
  FScore := Value;
  AffichageScore.Value := FScore;
  if AfficheMotScore.Value.IsEmpty then
    AfficheMotScore.Value := 'Score:';
end;

procedure TfrmJeu.VerrouilleEcran;
begin
  VerrouEcran.Visible := true;
  VerrouEcran.BringToFront;
end;

initialization

randomize;
frmJeu := nil;

finalization

// libération faite par la fiche principale
// if assigned(frmJeu) then
// freeandnil(frmJeu);

end.
