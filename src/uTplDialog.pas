unit uTplDialog;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Controls.Presentation, FMX.Objects, uDmImgDecors,
  FMX.ImgList, fmain,
  cMotsEnImages;

type
  TtplDialog = class(TFrame)
    zoneTitre: TLayout;
    lblTitre: TLabel;
    zoneTexte: TVertScrollBox;
    imgFond: TGlyph;
    MotsEnImages1: TMotsEnImages;
  private
    function GetfrmMain: TFrmMain;
  protected
    procedure Loaded; override;
    { Déclarations privées }
  public
    { Déclarations publiques }
    procedure init; virtual;
    property frmMain: TFrmMain read GetfrmMain;
  end;

implementation

{$R *.fmx}

uses udivers;
{ TtplDialog }

function TtplDialog.GetfrmMain: TFrmMain;
begin
  if (application.MainForm is TFrmMain) then
    result := (application.MainForm as TFrmMain)
  else
    result := nil;
end;

procedure TtplDialog.init;
begin

end;

procedure TtplDialog.Loaded;
begin
  inherited;
  lblTitre.Visible := false;
  MotsEnImages1.Value := lblTitre.Text;
end;

end.
