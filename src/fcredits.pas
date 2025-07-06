(* C2PP
  ***************************************************************************

  Pairpix

  Copyright 2022-2025 Patrick Pr�martin under AGPL 3.0 license.

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
    { D�clarations priv�es }
    page_a_afficher: string;
    procedure ajoute_titre(titre: string);
    procedure ajoute_paragraphe(texte: string = '');
  public
    { D�clarations publiques }
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
    ('Pairpix est un jeu Gamolf �dit� par la soci�t� Olf Software.');
  ajoute_paragraphe
    ('Ce logiciel est fourni en l''�tat. L''�diteur ne saurait �tre tenu responsable pour tout d�faut ou perte de donn�es li�es � une mauvaise utilisation du programme.');
  // A propos de l'auteur
  ajoute_titre('A propos de l''auteur');
  ajoute_paragraphe
    ('Le d�veloppement a �t� r�alis� sous Delphi avec Firemonkey par Patrick Pr�martin.');
  // A propos de l'�diteur
  ajoute_titre('A propos de l''�diteur');
  ajoute_paragraphe
    ('Ce jeu est �dit� par la soci�t� Olf Software immatricul�e au RCS de Paris (France) sous le num�ro 439521725.');
  ajoute_paragraphe
    ('Pour contacter l''�diteur �crivez � cette adresse :<br>Olf Software<br>14 rue Chales V<br>75004 Paris<br>France');
  ajoute_paragraphe
    ('Vous pouvez �galement utiliser <a href="https://olfsoftware.fr/contact/">ce formulaire de contact</a>.');
  // Propri�t� intellectuelle
  ajoute_titre('Licences et droit d''auteur');
  ajoute_paragraphe
    ('Les images du jeu sont sous copyright de Patrick Pr�martin, Cartoon Smart, Adobe Stock et The Game Creators.');
  // ajoute_paragraphe
  // ('Les sons du jeu sont sous copyright de The Game Creators.');
  // ajoute_paragraphe
  // ('Les musiques d''ambiance du jeu sont sous copyright de XXX.');
  ajoute_paragraphe
    ('Ce jeu et tous ses �l�ments (logiciels, graphiques et sonores) sont prot�g�s par les lois internationales sur les droits d''auteur. Vous n''�tes pas autoris� � en utiliser des �l�ments sans accord �crit pr�alable.<br>'
    + 'Seules exceptions � cette r�gle : des captures d''�crans et des vid�os de d�mos ou pr�sentations peuvent �tre r�alis�es librement si c''est pour illustrer une utilisation du jeu ou un texte qui en parle.');
  // Utilisation des donn�es personnelles
  ajoute_titre('Vie priv�e et donn�es personnelles');
  ajoute_paragraphe
    ('Nous ne r�coltons aucune donn�e personnelle (ou autre) lors de l''installation ou l''utilisation de ce jeu vid�o.');
  // ajoute_paragraphe
  // ('Pour des raisons de statistiques et d''adaptation du logiciel � votre configuration, nous pouvons r�cup�rer le mod�le de votre appareil, la version de son syst�me d''exploitation et la r�solution de votre �cran. '
  // + 'Cette transmission se fait une seule fois, lors de l''installation du logiciel et uniquement apr�s votre accord.');
  // Remerciements
  ajoute_titre('Remerciements');
  ajoute_paragraphe
    ('Tout d''abord merci � vous d''avoir choisi d''installer notre jeu. Nous esp�rons qu''il vous fera passer de bons moments partag�s entre amis ou en famille.');
  ajoute_paragraphe
    ('Le d�veloppeur du logiciel tient �galement � remercier son papa et sa maman pour lui avoir achet� un TO7-70 il y a de cela fort longtemps et lui avoir permis ainsi de se lancer dans le d�veloppement de '
    + 'logiciels "s�rieux" mais aussi de jeux plus funs.');
  ajoute_paragraphe
    ('Et merci � <a href="https://delphihtmlcomponents.com/contacts.html">Alexander Sviridenkov</a> pour sa librairie <a href="https://delphihtmlcomponents.com/">Delphi HTML Components</a> sans qui cet �cran serait tr�s plat.');
  // Liens
  ajoute_titre('Vers Internet et au del�...');
  ajoute_paragraphe
    ('Et si vous voulez en savoir plus sur nous et les outils utilis�s pour cr�er ce programme, voici quelques liens :');
  ajoute_paragraphe
    ('<a href="https://pairpix.gamolf.fr">Pairpix</a> : pour en savoir plus sur ce jeu ou partager son lien avec votre famille ou vos amis.');
  ajoute_paragraphe
    ('<a href="https://gamolf.fr">Gamolf</a> : retrouvez-y tous nos jeux pour toute la famille.');
  ajoute_paragraphe
    ('<a href="https://olfsoftware.fr">Olf Software</a> : des informations sur l''�diteur du jeu.');
  ajoute_paragraphe
    ('<a href="https://patrick.premartin.fr">Patrick Pr�martin</a> : le site du d�veloppeur de ce jeu, freelance, disponible si vous avez des d�veloppements web, desktop ou mobiles � lui confier.');
  ajoute_paragraphe
    ('<a href="https://developpeur-pascal.fr/delphi.html">Delphi</a> : plus d''informations sur le logiciel de d�veloppement et le langage utilis�s pour cr�er ce jeu.');
  ajoute_paragraphe
    ('<a href="https://developpeur-pascal.fr/fmx.html">Firemonkey</a> : plus d''informations pour les d�veloppements multiplateforme avec Delphi.');
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
  // R�initialise la position de l'ascenseur pour �viter de rester � l'emplacement lors du pr�c�dent affichage
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
