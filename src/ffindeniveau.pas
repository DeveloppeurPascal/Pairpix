/// <summary>
/// ***************************************************************************
///
/// Pairpix
///
/// Copyright 2022-2024 Patrick Prémartin under AGPL 3.0 license.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
/// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
/// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
/// DEALINGS IN THE SOFTWARE.
///
/// ***************************************************************************
///
/// Author(s) :
/// Patrick PREMARTIN
///
/// Site :
/// https://pairpix.gamolf.fr/
///
/// Project site :
/// https://github.com/DeveloppeurPascal/Pairpix
///
/// ***************************************************************************
/// File last update : 2024-09-17T19:00:44.693+02:00
/// Signature : 11cb3208cefcf0e91a297ceabc789cf78b122753
/// ***************************************************************************
/// </summary>

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
