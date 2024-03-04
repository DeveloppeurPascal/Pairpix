unit uGameButton;

interface

uses
  System.SysUtils, System.Classes, FMX.Types, FMX.Controls, FMX.Imglist,
  FMX.StdCtrls;

type
{$SCOPEDENUMS on}
  TGameButtonKind = (accueil, credits, scores, jeu, options, quitter,
    pause, capture);

  [ComponentPlatformsAttribute(pfidWindows or pfidOSX or pfidLinux or
    pfidAndroid or pfidiOS)]
  TGameButton = class(TControl)
  private
    { Déclarations privées }
    FImgButton: TGlyph;
    FTxtButton: TLabel;
    FKind: TGameButtonKind;
    FEnabled: boolean;
    FTextVisible: boolean;
    FText: string;
    procedure SetKind(const Value: TGameButtonKind);
    procedure SetEnabled(const Value: boolean); override;
    procedure SetText(const Value: string);
    procedure SetTextVisible(const Value: boolean);
  protected
    { Déclarations protégées }
    FImgOn, FImgOff, FImgOver: integer;
    procedure MouseEnter(Sender: TObject);
    procedure MouseLeave(Sender: TObject);
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Déclarations publiées }
    property Kind: TGameButtonKind read FKind write SetKind
      default TGameButtonKind.accueil;
    property OnClick;
    property Align default talignlayout.top;
    property Width;
    property parent;
    property Text: string read FText write SetText;
    property TextVisible: boolean read FTextVisible write SetTextVisible
      default true;
    property Enabled: boolean read FEnabled write SetEnabled default true;
    property Visible;
  end;

procedure Register;

implementation

uses uDmImgMemoryComponents, System.UITypes;

procedure Register;
begin
  RegisterComponents('Gamolf-Memory', [TGameButton]);
end;
{ TODO : ajouter un style sur le focus }
{ TGameButton }

constructor TGameButton.Create(AOwner: TComponent);
begin
  inherited;
  FEnabled := true;
  FTextVisible := true;
  FText := 'MyGameButton';
  Width := 300;
  Height := 44;
  Align := talignlayout.top;
  HitTest := true;
  Margins.top := 5;
  Margins.right := 5;
  Margins.Bottom := 5;
  Margins.Left := 5;
  onmouseenter := MouseEnter;
  onmouseleave := MouseLeave;

  FImgButton := TGlyph.Create(Self);
  FImgButton.Stored := false;
  FImgButton.parent := Self;
  FImgButton.Name := Name + 'Glyph';
  FImgButton.Images := TdmImgMemoryComponents.Current.Images;
  FImgButton.Stretch := true;
  FImgButton.Width := 44;
  FImgButton.Height := 44;
  FImgButton.HitTest := false;
  FImgButton.Align := talignlayout.Left;
  FImgButton.Locked := false;

  FTxtButton := TLabel.Create(Self);
  FTxtButton.Stored := false;
  FTxtButton.parent := Self;
  FTxtButton.Name := Name + 'Text';
  FTxtButton.Margins.Left := 10;
  FTxtButton.Align := talignlayout.Client;
  FTxtButton.Text := FText;
  FTxtButton.TextSettings.HorzAlign := ttextalign.Leading;
  FTxtButton.TextSettings.VertAlign := ttextalign.Center;
  FTxtButton.TextSettings.Font.Size := 30;
  FTxtButton.TextSettings.Fontcolor := talphacolors.cornsilk;
  FTxtButton.Visible := FTextVisible;
  FTxtButton.HitTest := false;
  FTxtButton.Locked := false;

  Kind := TGameButtonKind.accueil;
end;

destructor TGameButton.Destroy;
begin
  if assigned(FTxtButton) then
    freeandnil(FTxtButton);
  if assigned(FImgButton) then
    freeandnil(FImgButton);
  inherited;
end;

procedure TGameButton.MouseEnter(Sender: TObject);
begin
  if FEnabled then
    FImgButton.ImageIndex := FImgOver;
end;

procedure TGameButton.MouseLeave(Sender: TObject);
begin
  if FEnabled then
    FImgButton.ImageIndex := FImgOn
  else
    FImgButton.ImageIndex := FImgOff;
end;

procedure TGameButton.SetEnabled(const Value: boolean);
begin
  FEnabled := Value;
  if assigned(FImgButton) then
    if FEnabled then
      FImgButton.ImageIndex := FImgOn
    else
      FImgButton.ImageIndex := FImgOff;
  if assigned(FTxtButton) then
    FTxtButton.Enabled := FEnabled;
end;

procedure TGameButton.SetKind(const Value: TGameButtonKind);
begin
  FKind := Value;
  case FKind of
    TGameButtonKind.accueil:
      begin
        FImgOn := 0;
        FImgOff := 1;
        FImgOver := 2;
      end;
    TGameButtonKind.credits:
      begin
        FImgOn := 3;
        FImgOff := 4;
        FImgOver := 5;
      end;
    TGameButtonKind.scores:
      begin
        FImgOn := 6;
        FImgOff := 7;
        FImgOver := 8;
      end;
    TGameButtonKind.jeu:
      begin
        FImgOn := 9;
        FImgOff := 10;
        FImgOver := 11;
      end;
    TGameButtonKind.options:
      begin
        FImgOn := 12;
        FImgOff := 13;
        FImgOver := 14;
      end;
    TGameButtonKind.quitter:
      begin
        FImgOn := 15;
        FImgOff := 16;
        FImgOver := 17;
      end;
    TGameButtonKind.pause:
      begin
        FImgOn := 18;
        FImgOff := 19;
        FImgOver := 20;
      end;
    TGameButtonKind.capture:
      begin
        FImgOn := 21;
        FImgOff := 22;
        FImgOver := 23;
      end;
  else
    FImgOn := -1;
    FImgOff := -1;
    FImgOver := -1;
  end;
  if assigned(FImgButton) then
    if FEnabled then
      FImgButton.ImageIndex := FImgOn
    else
      FImgButton.ImageIndex := FImgOff;
  Visible := true;
{$IF Defined(ANDROID) or Defined(IOS)}
  if FKind = TGameButtonKind.quitter then
    Visible := false;
{$ELSE IF Defined(MSWINDOWS) or Defined(MACOS) or Defined(LINUX)}
{$ELSE}
{$MESSAGE FATAL 'Système d''exploitation non pris en charge'}
{$ENDIF}
end;

procedure TGameButton.SetText(const Value: string);
begin
  FText := Value;
  if assigned(FTxtButton) then
    FTxtButton.Text := FText;
end;

procedure TGameButton.SetTextVisible(const Value: boolean);
begin
  FTextVisible := Value;
  if assigned(FTxtButton) then
    FTxtButton.Visible := FTextVisible;
end;

end.
