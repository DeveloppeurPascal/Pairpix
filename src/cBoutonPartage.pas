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
  File last update : 2025-07-03T10:44:17.175+02:00
  Signature : 77d0e00cd2c1c4ce1d8a3f308e929798d5d63a08
  ***************************************************************************
*)

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
