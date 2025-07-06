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
  File last update : 2025-07-03T10:44:17.185+02:00
  Signature : a553c520a0b93d9cb8660b6fc1a25f3278e9b126
  ***************************************************************************
*)

unit fcredits;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  uTplDialog,
  FMX.Controls.Presentation,
  FMX.Layouts,
  FMX.Objects,
  FMX.ImgList,
  cMotsEnImages,
  FMX.fhtmlcomp;

type
  TfrmCredits = class(TtplDialog)
    txtHTML: THtLabel;
  private
    { Déclarations privées }
    page_a_afficher: string;
    procedure ajoute_titre(titre: string);
    procedure ajoute_paragraphe(texte: string = '');
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
    procedure init; override;
    class function Current: TfrmCredits;
  end;

implementation

{$R *.fmx}

var
  frmCredits: TfrmCredits;

constructor TfrmCredits.Create(AOwner: TComponent);
begin
  inherited;
  page_a_afficher := '';
  // Infos sur le jeu
  ajoute_titre('A propos de ce jeu');
  ajoute_paragraphe
    ('Pairpix est un jeu Gamolf édité par la société Olf Software.');
  ajoute_paragraphe
    ('Ce logiciel est fourni en l''état. L''éditeur ne saurait être tenu responsable pour tout défaut ou perte de données liées à une mauvaise utilisation du programme.');
  // A propos de l'auteur
  ajoute_titre('A propos de l''auteur');
  ajoute_paragraphe
    ('Le développement a été réalisé sous Delphi avec Firemonkey par Patrick Prémartin.');
  // A propos de l'éditeur
  ajoute_titre('A propos de l''éditeur');
  ajoute_paragraphe
    ('Ce jeu est édité par la société Olf Software immatriculée au RCS de Paris (France) sous le numéro 439521725.');
  ajoute_paragraphe
    ('Pour contacter l''éditeur écrivez à cette adresse :<br>Olf Software<br>14 rue Chales V<br>75004 Paris<br>France');
  ajoute_paragraphe
    ('Vous pouvez également utiliser <a href="https://olfsoftware.fr/contact/">ce formulaire de contact</a>.');
  // Propriété intellectuelle
  ajoute_titre('Licences et droit d''auteur');
  ajoute_paragraphe
    ('Les images du jeu sont sous copyright de Patrick Prémartin, Cartoon Smart, Adobe Stock et The Game Creators.');
  // ajoute_paragraphe
  // ('Les sons du jeu sont sous copyright de The Game Creators.');
  // ajoute_paragraphe
  // ('Les musiques d''ambiance du jeu sont sous copyright de XXX.');
  ajoute_paragraphe
    ('Ce jeu et tous ses éléments (logiciels, graphiques et sonores) sont protégés par les lois internationales sur les droits d''auteur. Vous n''êtes pas autorisé à en utiliser des éléments sans accord écrit préalable.<br>'
    + 'Seules exceptions à cette règle : des captures d''écrans et des vidéos de démos ou présentations peuvent être réalisées librement si c''est pour illustrer une utilisation du jeu ou un texte qui en parle.');
  // Utilisation des données personnelles
  ajoute_titre('Vie privée et données personnelles');
  ajoute_paragraphe
    ('Nous ne récoltons aucune donnée personnelle (ou autre) lors de l''installation ou l''utilisation de ce jeu vidéo.');
  // ajoute_paragraphe
  // ('Pour des raisons de statistiques et d''adaptation du logiciel à votre configuration, nous pouvons récupérer le modèle de votre appareil, la version de son système d''exploitation et la résolution de votre écran. '
  // + 'Cette transmission se fait une seule fois, lors de l''installation du logiciel et uniquement après votre accord.');
  // Remerciements
  ajoute_titre('Remerciements');
  ajoute_paragraphe
    ('Tout d''abord merci à vous d''avoir choisi d''installer notre jeu. Nous espérons qu''il vous fera passer de bons moments partagés entre amis ou en famille.');
  ajoute_paragraphe
    ('Le développeur du logiciel tient également à remercier son papa et sa maman pour lui avoir acheté un TO7-70 il y a de cela fort longtemps et lui avoir permis ainsi de se lancer dans le développement de '
    + 'logiciels "sérieux" mais aussi de jeux plus funs.');
  ajoute_paragraphe
    ('Et merci à <a href="https://delphihtmlcomponents.com/contacts.html">Alexander Sviridenkov</a> pour sa librairie <a href="https://delphihtmlcomponents.com/">Delphi HTML Components</a> sans qui cet écran serait très plat.');
  // Liens
  ajoute_titre('Vers Internet et au delà...');
  ajoute_paragraphe
    ('Et si vous voulez en savoir plus sur nous et les outils utilisés pour créer ce programme, voici quelques liens :');
  ajoute_paragraphe
    ('<a href="https://pairpix.gamolf.fr">Pairpix</a> : pour en savoir plus sur ce jeu ou partager son lien avec votre famille ou vos amis.');
  ajoute_paragraphe
    ('<a href="https://gamolf.fr">Gamolf</a> : retrouvez-y tous nos jeux pour toute la famille.');
  ajoute_paragraphe
    ('<a href="https://olfsoftware.fr">Olf Software</a> : des informations sur l''éditeur du jeu.');
  ajoute_paragraphe
    ('<a href="https://patrick.premartin.fr">Patrick Prémartin</a> : le site du développeur de ce jeu, freelance, disponible si vous avez des développements web, desktop ou mobiles à lui confier.');
  ajoute_paragraphe
    ('<a href="https://developpeur-pascal.fr/delphi.html">Delphi</a> : plus d''informations sur le logiciel de développement et le langage utilisés pour créer ce jeu.');
  ajoute_paragraphe
    ('<a href="https://developpeur-pascal.fr/fmx.html">Firemonkey</a> : plus d''informations pour les développements multiplateforme avec Delphi.');
  txtHTML.text := page_a_afficher;
end;

class function TfrmCredits.Current: TfrmCredits;
begin
  if not assigned(frmCredits) then
    frmCredits := TfrmCredits.Create(application.mainform);
  result := frmCredits;
end;

procedure TfrmCredits.init;
begin
  inherited;
  // Réinitialise la position de l'ascenseur pour éviter de rester à l'emplacement lors du précédent affichage
  zonetexte.Scrollby(0, zonetexte.ViewportPosition.Y);
end;

procedure TfrmCredits.ajoute_paragraphe(texte: string);
begin
  page_a_afficher := page_a_afficher + '<p>'+texte + '</p>';
end;

procedure TfrmCredits.ajoute_titre(titre: string);
begin
  page_a_afficher := page_a_afficher + '<h1>' + titre +
    '</h1>';
end;

initialization

frmCredits := nil;

end.
