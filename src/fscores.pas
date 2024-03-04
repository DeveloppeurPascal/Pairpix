unit fscores;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uTplDialog, FMX.Controls.Presentation, FMX.Layouts, FMX.Objects,FMX.ImgList;

type
  TfrmScores = class(TtplDialog)
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    class function Current: TfrmScores;
  end;

implementation

{$R *.fmx}

var
  frmScores: TfrmScores;

class function TfrmScores.Current: TfrmScores;
begin
  if not assigned(frmScores) then
    frmScores := TfrmScores.Create(application.mainform);
  result := frmScores;
end;

initialization

frmScores := nil;

finalization

// libération faite par la fiche principale
// if assigned(frmScores) then
// freeandnil(frmScores);

end.
