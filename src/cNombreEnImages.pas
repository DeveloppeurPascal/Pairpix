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
  Signature : a3cacc54f130101ed7c78344d79ef4a1b4a5871f
  ***************************************************************************
*)

unit cNombreEnImages;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ImgList, System.ImageList;

type
  TNombreEnImages = class(TFrame)
  private
    FValue: integer;
    procedure SetValue(const Value: integer);
    { Déclarations privées }
    function AjoutImageEtRetourneLargeur(AImages: TCustomImageList;
      AImageIndex: TImageIndex; AX: single): single;
  public
    { Déclarations publiques }
    property Value: integer read FValue write SetValue;
  end;

implementation

{$R *.fmx}

uses uDMFonteDeCaracteres;
{ TNombreEnImages }

function TNombreEnImages.AjoutImageEtRetourneLargeur(AImages: TCustomImageList;
  AImageIndex: TImageIndex; AX: single): single;
var
  g: tglyph;
  wi, hi: single;
begin
  g := tglyph.Create(self);
  g.Parent := self;
  wi := AImages.Destination[AImageIndex].Layers[0].MultiResBitmap[0].Width;
  hi := AImages.Destination[AImageIndex].Layers[0].MultiResBitmap[0].height;
  g.height := height;
  g.Width := g.height * wi / hi;
  g.Images := AImages;
  g.ImageIndex := AImageIndex;
  g.Position.x := AX;
  g.Position.y := 0;
  result := g.Width;
end;

procedure TNombreEnImages.SetValue(const Value: integer);
var
  i: integer;
  s: string;
  x: single;
begin
  FValue := Value;

  for i := childrencount - 1 downto 0 do
    if (children[i] is tglyph) then
      children[i].Free;

  x := 0;
  s := FValue.ToString;
  for i := 0 to s.Length - 1 do
    if CharInSet(s.Chars[i], ['0' .. '9']) then
      x := x + AjoutImageEtRetourneLargeur(DMFonteDeCaracteres.imgNombres,
        ord(s.Chars[i]) - ord('0'), x)
    else if s.Chars[i] = '-' then
      x := x + AjoutImageEtRetourneLargeur
        (DMFonteDeCaracteres.imgNombres, 10, x);

  Width := x;
end;

// TODO : gérer changement de taille des chiffres en cas de resize de la zone

end.
