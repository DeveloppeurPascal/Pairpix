unit uTplFondDuJeu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, uDmImgDecors, FMX.ImgList, FMX.Layouts, fmain, uGameButton;

type
  TtplFondDuJeu = class(TFrame)
    imgFond: TGlyph;
    zoneDeJeu: TLayout;
  private
    function GetfrmMain: TFrmMain;
    { Déclarations privées }
  public
    { Déclarations publiques }
    procedure init; virtual;
    property frmMain: TFrmMain read GetfrmMain;
  end;

implementation

{$R *.fmx}

uses udivers;

{ TtplFondDuJeu }

function TtplFondDuJeu.GetfrmMain: TFrmMain;
begin
  if (application.MainForm is TFrmMain) then
    result := (application.MainForm as TFrmMain)
  else
    result := nil;
end;

procedure TtplFondDuJeu.init;
begin

end;

end.
