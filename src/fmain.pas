unit fmain;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  udivers,
  FMX.Layouts,
  FMX.Objects,
  FMX.Menus,
  uDmImgDecors,
  FMX.ImgList,
  uGameButton;

type
  TfrmMain = class(TForm)
    lBackground: TLayout;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lBackgroundResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormSaveState(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    Fecran: tecrantype;
    FFond: tframe;
    procedure Setecran(const Value: tecrantype);
    { Déclarations privées }
    procedure btnAccueilClick(Sender: TObject);
    procedure calculer_zone_ecran;
    procedure sauver_parametres;
    procedure charger_parametres;
  public
    { Déclarations publiques }
    btnAccueil: TGameButton;
    property ecran: tecrantype read Fecran write Setecran;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses
  FMX.ani,
  faccueil,
  fcredits,
  ffindeniveau,
  ffindepartie,
  fjeu,
  foptions,
  fscores,
  uTplFondDuJeu,
  fchallenge,
  uTplDialog;

procedure TfrmMain.btnAccueilClick(Sender: TObject);
begin
  if (Fecran = tecrantype.jeu) and (FFond is tfrmjeu) then
    (FFond as tfrmjeu).ArretPartie
  else if (Fecran = tecrantype.challenge) and (FFond is TfrmChallenge) then
    (FFond as TfrmChallenge).ArretPartie;
  frmMain.ecran := tecrantype.accueil;
end;

procedure TfrmMain.calculer_zone_ecran;
var
  echelle: single;
begin
  if assigned(FFond) then
  begin
    echelle := 1;
    while ((FFond.Width * echelle > lBackground.Width) or
      (FFond.Height * echelle > lBackground.Height)) and (echelle > 0.1) do
    begin
      echelle := echelle - 0.1;
    end;
    FFond.Scale.X := echelle;
    FFond.Scale.y := echelle;
    FFond.Align := talignlayout.Center;
  end;
end;

procedure TfrmMain.charger_parametres;
begin
  { TODO : à compléter }
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  sauver_parametres;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Fecran in [tecrantype.jeu, tecrantype.challenge] then
  begin
    CanClose := true; { TODO : demander confirmation de fermeture en plein jeu }
  end
  else
    CanClose := true;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Fecran := tecrantype.accueil;
  FFond := nil;
  btnAccueil := TGameButton.create(self);
  btnAccueil.parent := self;
  btnAccueil.Align := talignlayout.None;
  btnAccueil.Position.X := 10;
  btnAccueil.Position.y := 10;
  btnAccueil.TextVisible := false;
  btnAccueil.Width := btnAccueil.Height;
  btnAccueil.Kind := tgamebuttonkind.accueil;
  btnAccueil.OnClick := btnAccueilClick;
  fill.Kind := tbrushkind.Bitmap;
  fill.Bitmap.WrapMode := twrapmode.TileStretch;
  fill.Bitmap.Bitmap := dmimgdecors.images.Destination[0].Layers[0]
    .MultiResBitmap.Items[0].Bitmap;
end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key in [vkhardwareback, vkescape] then
  begin
    Key := 0;
    KeyChar := #0;
    if btnAccueil.Visible then
      btnAccueil.OnClick(Sender)
    else
      close;
  end;
end;

procedure TfrmMain.FormSaveState(Sender: TObject);
begin
  if btnAccueil.Visible then
    btnAccueil.OnClick(Sender);
  sauver_parametres;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  ecran := tecrantype.accueil;
  charger_parametres;
end;

procedure TfrmMain.lBackgroundResize(Sender: TObject);
begin
  calculer_zone_ecran;
end;

procedure TfrmMain.sauver_parametres;
begin
  { TODO : à compléter }
end;

procedure TfrmMain.Setecran(const Value: tecrantype);
var
  old_fond: tframe;
  delai_affichage: single;
begin
  delai_affichage := 0.2;
  if (Fecran = Value) and assigned(FFond) then
    FFond.BringToFront
  else
  begin
    if assigned(FFond) then
    begin
      old_fond := FFond;
      tthread.CreateAnonymousThread(
        procedure
        begin
          sleep(trunc(delai_affichage * 1000));
          tthread.Synchronize(nil,
            procedure
            begin
              old_fond.Visible := false;
              Invalidate;
            end);
        end).Start;
    end;
    Fecran := Value;
    case Fecran of
      tecrantype.credits:
        FFond := tfrmCredits.current;
      tecrantype.options:
        FFond := tfrmOptions.current;
      tecrantype.scores:
        FFond := tfrmScores.current;
      tecrantype.findeniveau:
        FFond := tfrmFinDeNiveau.current;
      tecrantype.findepartie:
        FFond := tfrmFinDePartie.current;
      tecrantype.jeu:
        FFond := tfrmjeu.current;
      tecrantype.challenge:
        FFond := TfrmChallenge.current;
    else
      FFond := TfrmAccueil.current;
    end;
    FFond.Name := '';
    FFond.parent := lBackground;
    calculer_zone_ecran;
    FFond.Visible := true;
    FFond.Opacity := 0;
    FFond.BringToFront;
    if (FFond is TtplFondDuJeu) then
      (FFond as TtplFondDuJeu).init
    else if (FFond is TtplDialog) then
      (FFond as TtplDialog).init;
    tanimator.AnimateFloat(FFond, 'opacity', 1, delai_affichage);
    btnAccueil.Visible := Fecran <> tecrantype.accueil;
  end;
end;

initialization

{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$ENDIF}

end.
