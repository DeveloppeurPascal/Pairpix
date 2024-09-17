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
/// Signature : 58511160e49a63533f930b40376c69dd6d4a2a3b
/// ***************************************************************************
/// </summary>

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
