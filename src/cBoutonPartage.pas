unit cBoutonPartage;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uGameButton, FMX.Objects, FMX.Effects;

type
  TBoutonPartage = class(TFrame)
    imgBackground: TImage;
    GameButton1: TGameButton;
    ShadowEffect1: TShadowEffect;
    procedure GameButton1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }

  end;

implementation

{$R *.fmx}

procedure TBoutonPartage.GameButton1Click(Sender: TObject);
begin
  if assigned(self.onclick) then
    self.onclick(self);
end;

end.
