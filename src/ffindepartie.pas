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
  Signature : 5a01cfdd4d5f5dc0462f92e6f773489f293612ac
  ***************************************************************************
*)

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
