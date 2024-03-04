unit foptions;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uTplDialog, FMX.Controls.Presentation, FMX.Layouts, FMX.Objects, FMX.ImgList;

type
  TfrmOptions = class(TtplDialog)
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    class function Current: TfrmOptions;
  end;

implementation

{$R *.fmx}

var
  frmOptions: TfrmOptions;

class function TfrmOptions.Current: TfrmOptions;
begin
  if not assigned(frmOptions) then
    frmOptions := TfrmOptions.Create(application.mainform);
  result := frmOptions;
end;

initialization

frmOptions := nil;

finalization

// libération faite par la fiche principale
// if assigned(frmOptions) then
//  freeandnil(frmOptions);

end.
