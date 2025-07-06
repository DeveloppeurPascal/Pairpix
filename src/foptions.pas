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
  File last update : 2025-07-03T10:44:17.187+02:00
  Signature : afe97446bf3f34bf03a3bfa4c9606da7f78c3db9
  ***************************************************************************
*)

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
