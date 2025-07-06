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
  Signature : 1cc59c0460450bc366eeddeb131230de02bc4428
  ***************************************************************************
*)

unit faccueil;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uTplDialog, FMX.Controls.Presentation, FMX.Layouts, FMX.Objects, FMX.ImgList,
  uGameButton, cMotsEnImages;

type
  TfrmAccueil = class(TtplDialog)
    btnJouer: TGameButton;
    btnCredits: TGameButton;
    btnOptions: TGameButton;
    btnChallenge: TGameButton;
    btnScores: TGameButton;
    btnQuitter: TGameButton;
    procedure btnJouerClick(Sender: TObject);
    procedure btnChallengeClick(Sender: TObject);
    procedure btnScoresClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure btnCreditsClick(Sender: TObject);
    procedure btnQuitterClick(Sender: TObject);
    procedure FrameResize(Sender: TObject);
  private
    { Déclarations privées }
    procedure positionner_bouton(btn_a_bouger, btn_du_dessus: TGameButton);
  public
    { Déclarations publiques }
    class function Current: TfrmAccueil;
  end;

implementation

{$R *.fmx}

uses udivers;

var
  frmAccueil: TfrmAccueil;

procedure TfrmAccueil.btnChallengeClick(Sender: TObject);
begin
  frmmain.ecran := tecrantype.challenge;
end;

procedure TfrmAccueil.btnCreditsClick(Sender: TObject);
begin
  frmmain.ecran := tecrantype.credits;
end;

procedure TfrmAccueil.btnJouerClick(Sender: TObject);
begin
  frmmain.ecran := tecrantype.jeu;
end;

procedure TfrmAccueil.btnOptionsClick(Sender: TObject);
begin
  frmmain.ecran := tecrantype.options;
end;

procedure TfrmAccueil.btnQuitterClick(Sender: TObject);
begin
  frmmain.Close;
end;

procedure TfrmAccueil.btnScoresClick(Sender: TObject);
begin
  frmmain.ecran := tecrantype.scores;
end;

class function TfrmAccueil.Current: TfrmAccueil;
begin
  if not assigned(frmAccueil) then
    frmAccueil := TfrmAccueil.Create(application.mainform);
  result := frmAccueil;
end;

procedure TfrmAccueil.FrameResize(Sender: TObject);
begin
  inherited;
  positionner_bouton(btnJouer, nil);
  positionner_bouton(btnChallenge, btnJouer);
  // TODO : réactiver les positions en fonction des boutons visibles
  btnScores.visible := false;
  // positionner_bouton(btnScores, btnChallenge);
  btnOptions.visible := false;
  // positionner_bouton(btnOptions, btnScores);
  // positionner_bouton(btnCredits, btnOptions);
  positionner_bouton(btnCredits, btnChallenge);
  positionner_bouton(btnQuitter, btnCredits);
end;

procedure TfrmAccueil.positionner_bouton(btn_a_bouger, btn_du_dessus
  : TGameButton);
begin
  btn_a_bouger.Align := talignlayout.None;
  btn_a_bouger.Width := zoneTexte.Width - zoneTexte.Padding.Left -
    zoneTexte.Padding.Right;
  btn_a_bouger.Position.X := 0;
  if assigned(btn_du_dessus) then
    btn_a_bouger.Position.Y := btn_du_dessus.Position.Y + btn_du_dessus.Height +
      btn_du_dessus.Margins.Top + btn_du_dessus.Margins.Bottom
  else
    btn_a_bouger.Position.Y := 0;
end;

initialization

frmAccueil := nil;

end.
