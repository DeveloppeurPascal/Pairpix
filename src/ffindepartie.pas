unit ffindepartie;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uTplDialog, FMX.Controls.Presentation, FMX.Layouts, FMX.Objects,FMX.ImgList;

type
  TfrmFinDePartie = class(TtplDialog)
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    class function Current: TfrmFinDePartie;
  end;

implementation

{$R *.fmx}

var
  frmFinDePartie: TfrmFinDePartie;

class function TfrmFinDePartie.Current: TfrmFinDePartie;
begin
  if not assigned(frmFinDePartie) then
    frmFinDePartie := TfrmFinDePartie.Create(application.mainform);
  result := frmFinDePartie;
end;

initialization

frmFinDePartie := nil;

finalization

// libération faite par la fiche principale
// if assigned(frmFinDePartie) then
// freeandnil(frmFinDePartie);

end.
