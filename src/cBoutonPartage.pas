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
/// File last update : 2024-09-17T19:00:44.663+02:00
/// Signature : 3e3ac2fd240c20e6e8feee100954bdb766577f08
/// ***************************************************************************
/// </summary>

unit cBoutonPartage;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uGameButton, FMX.Objects, FMX.Effects;

type
  TBoutonPartage = class(TFrame)
    imgBackground: TImage;
    GameButton1: TGameButton;
    ShadowEffect1: TShadowEffect;
    procedure GameButton1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }

  end;

implementation

{$R *.fmx}

procedure TBoutonPartage.GameButton1Click(Sender: TObject);
begin
  if assigned(self.onclick) then
    self.onclick(self);
end;

end.
