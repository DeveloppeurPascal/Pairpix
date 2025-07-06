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
  File last update : 2025-07-03T10:44:17.175+02:00
  Signature : 6a4999d9df613ab485dda22fe252da30d3c61d24
  ***************************************************************************
*)

unit cCarteDuJeu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.ImgList;

type
{$SCOPEDENUMS ON}
  tcdjSens = (horizontal, vertical);
  tcdjCote = (face, dos);

  TCarteDuJeu = class;

  TcdjOnClick = procedure(CarteCliquee: TCarteDuJeu; Affichage: boolean)
    of object;

  TCarteDuJeu = class(TFrame)
    dos: TRectangle;
    face: TRectangle;
    imgFace: TGlyph;
    procedure DosClick(Sender: TObject);
    procedure FaceClick(Sender: TObject);
  private
    FSens: tcdjSens;
    FCote: tcdjCote;
    FTypeCarte: integer;
    FonClickSurCarte: TcdjOnClick;
    FClicAutorise: boolean;
    FHauteur: Single;
    FLargeur: Single;
    procedure SetSens(const Value: tcdjSens);
    procedure SetCote(const Value: tcdjCote);
    procedure SetTypeCarte(const Value: integer);
    procedure SetonClickSurCarte(const Value: TcdjOnClick);
    procedure SetClicAutorise(const Value: boolean);
    procedure SetHauteur(const Value: Single);
    procedure SetLargeur(const Value: Single);
    procedure AdapteLargeurHauteurSens;
    { Déclarations privées }
  public
    { Déclarations publiques }
    property Sens: tcdjSens read FSens write SetSens;
    property Cote: tcdjCote read FCote write SetCote;
    property TypeCarte: integer read FTypeCarte write SetTypeCarte;
    property ClicAutorise: boolean read FClicAutorise write SetClicAutorise;
    property Largeur: Single read FLargeur write SetLargeur;
    property Hauteur: Single read FHauteur write SetHauteur;
    property onClickSurCarte: TcdjOnClick read FonClickSurCarte
      write SetonClickSurCarte;
    constructor Create(AOwner: TComponent); override;
    procedure Retourne;
    procedure Verrouille;
  end;

implementation

{$R *.fmx}

uses uDmImgJeu;
{ TCarteDuJeu }

constructor TCarteDuJeu.Create(AOwner: TComponent);
begin
  inherited;
  name := '';
  Sens := tcdjSens.vertical;
  Cote := tcdjCote.dos;
  TypeCarte := -1;
  ClicAutorise := true;
end;

procedure TCarteDuJeu.DosClick(Sender: TObject);
begin
  if not ClicAutorise then
    exit;

  Cote := tcdjCote.face;

  if assigned(FonClickSurCarte) then
    FonClickSurCarte(self, true);
end;

procedure TCarteDuJeu.FaceClick(Sender: TObject);
begin
  if not ClicAutorise then
    exit;

  Cote := tcdjCote.dos;

  if assigned(FonClickSurCarte) then
    FonClickSurCarte(self, false);
end;

procedure TCarteDuJeu.Retourne;
begin
  if FCote = tcdjCote.face then
    Cote := tcdjCote.dos
  else
    Cote := tcdjCote.face;
end;

procedure TCarteDuJeu.SetClicAutorise(const Value: boolean);
begin
  FClicAutorise := Value;
end;

procedure TCarteDuJeu.SetCote(const Value: tcdjCote);
begin
  FCote := Value;
  dos.Visible := (FCote = tcdjCote.dos);
  face.Visible := (FCote = tcdjCote.face);
end;

procedure TCarteDuJeu.SetHauteur(const Value: Single);
begin
  FHauteur := Value;
  AdapteLargeurHauteurSens;
end;

procedure TCarteDuJeu.SetLargeur(const Value: Single);
begin
  FLargeur := Value;
  AdapteLargeurHauteurSens;
end;

procedure TCarteDuJeu.SetonClickSurCarte(const Value: TcdjOnClick);
begin
  FonClickSurCarte := Value;
end;

procedure TCarteDuJeu.SetSens(const Value: tcdjSens);
begin
  FSens := Value;
  AdapteLargeurHauteurSens;
end;

procedure TCarteDuJeu.SetTypeCarte(const Value: integer);
begin
  if (Value >= 0) and (Value < dmImgJeu.imgFacesCartes.Count) then
  begin
    FTypeCarte := Value;
    imgFace.images := dmImgJeu.imgFacesCartes;
    imgFace.ImageIndex := FTypeCarte;
  end
  else
  begin
    FTypeCarte := -1;
    imgFace.images := dmImgJeu.imgFacesCartes;
    imgFace.ImageIndex := FTypeCarte;
  end;
end;

procedure TCarteDuJeu.Verrouille;
begin
  ClicAutorise := false;
  enabled := false;
end;

procedure TCarteDuJeu.AdapteLargeurHauteurSens;
begin
  if (FLargeur >= FHauteur) then
    case FSens of
      tcdjSens.horizontal:
        begin
          width := FLargeur;
          height := FHauteur;
        end
    else
      width := FHauteur;
      height := FLargeur;
    end
  else // FHauteur > FLargeur
    case FSens of
      tcdjSens.vertical:
        begin
          width := FLargeur;
          height := FHauteur;
        end
    else
      width := FHauteur;
      height := FLargeur;
    end;

  // Partant du principe que les images sont en carré de 140x140 pixels
  if 140 > FLargeur then
  begin
    imgFace.width := FLargeur;
    imgFace.height := FLargeur;
  end
  else
  begin
    imgFace.width := 140;
    imgFace.height := 140;
  end;
  if imgFace.height > FHauteur then
  begin
    imgFace.width := FHauteur;
    imgFace.height := FHauteur;
  end;
end;

end.
