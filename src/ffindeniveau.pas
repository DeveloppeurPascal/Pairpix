unit ffindeniveau;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uTplDialog, FMX.Controls.Presentation, FMX.Layouts, FMX.Objects,FMX.ImgList;

type
  TfrmFinDeNiveau = class(TtplDialog)
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    class function Current: TfrmFinDeNiveau;
  end;

implementation

{$R *.fmx}

var
  frmFinDeNiveau: TfrmFinDeNiveau;

class function TfrmFinDeNiveau.Current: TfrmFinDeNiveau;
begin
  if not assigned(frmFinDeNiveau) then
    frmFinDeNiveau := TfrmFinDeNiveau.Create(application.mainform);
  result := frmFinDeNiveau;
end;

initialization

frmFinDeNiveau := nil;

finalization

// libération faite par la fiche principale
// if assigned(frmFinDeNiveau) then
// freeandnil(frmFinDeNiveau);

end.
