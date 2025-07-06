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
  Signature : 85a0ec42bc1f348ca3486f68ea5588eb5cf093bb
  ***************************************************************************
*)

unit cMotsEnImages;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.ImageList, FMX.ImgList;

type
  TMotsEnImages = class(TFrame)
  private
    FValue: string;
    procedure SetValue(const Value: string);
    { Déclarations privées }
    function AjoutImageEtRetourneLargeur(AImages: TCustomImageList;
      AImageIndex: TImageIndex; AX: single): single;
  public
    { Déclarations publiques }
    property Value: string read FValue write SetValue;
  end;

implementation

{$R *.fmx}

uses uDMFonteDeCaracteres;

function TMotsEnImages.AjoutImageEtRetourneLargeur(AImages: TCustomImageList;
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

procedure TMotsEnImages.SetValue(const Value: string);
var
  i: integer;
  x: single;
begin
  FValue := Value.Trim;

  for i := childrencount - 1 downto 0 do
    if (children[i] is tglyph) then
      children[i].Free;

  x := 0;
  for i := 0 to FValue.Length - 1 do
    if charinset(FValue.Chars[i], ['A' .. 'Z']) then
      x := x + AjoutImageEtRetourneLargeur
        (DMFonteDeCaracteres.imgLettresMajuscules, ord(FValue.Chars[i]) -
        ord('A'), x)
    else if charinset(FValue.Chars[i], ['a' .. 'z']) then
      x := x + AjoutImageEtRetourneLargeur
        (DMFonteDeCaracteres.imgLettresMinuscules, ord(FValue.Chars[i]) -
        ord('a'), x)
    else if charinset(FValue.Chars[i], ['à', 'ä', 'â']) then
      x := x + AjoutImageEtRetourneLargeur
        (DMFonteDeCaracteres.imgLettresMinuscules, ord('a') - ord('a'), x)
    else if charinset(FValue.Chars[i], ['é', 'è', 'ê', 'ë']) then
      x := x + AjoutImageEtRetourneLargeur
        (DMFonteDeCaracteres.imgLettresMinuscules, ord('e') - ord('a'), x)
    else if charinset(FValue.Chars[i], ['ï', 'î']) then
      x := x + AjoutImageEtRetourneLargeur
        (DMFonteDeCaracteres.imgLettresMinuscules, ord('i') - ord('a'), x)
    else if charinset(FValue.Chars[i], ['ô', 'ö']) then
      x := x + AjoutImageEtRetourneLargeur
        (DMFonteDeCaracteres.imgLettresMinuscules, ord('o') - ord('a'), x)
    else if charinset(FValue.Chars[i], ['ù', 'û', 'ü']) then
      x := x + AjoutImageEtRetourneLargeur
        (DMFonteDeCaracteres.imgLettresMinuscules, ord('u') - ord('a'), x)
    else if charinset(FValue.Chars[i], ['ÿ']) then
      x := x + AjoutImageEtRetourneLargeur
        (DMFonteDeCaracteres.imgLettresMinuscules, ord('y') - ord('a'), x)
    else if (FValue.Chars[i] = '!') then
      x := x + AjoutImageEtRetourneLargeur
        (DMFonteDeCaracteres.imgPonctuation, 0, x)
    else if (FValue.Chars[i] = '.') then
      x := x + AjoutImageEtRetourneLargeur
        (DMFonteDeCaracteres.imgPonctuation, 1, x)
    else if (FValue.Chars[i] = ':') then
      x := x + AjoutImageEtRetourneLargeur
        (DMFonteDeCaracteres.imgPonctuation, 2, x)
    else if (FValue.Chars[i] = '-') then
      x := x + AjoutImageEtRetourneLargeur
        (DMFonteDeCaracteres.imgPonctuation, 3, x)
    else if (FValue.Chars[i] = ',') then
      x := x + AjoutImageEtRetourneLargeur
        (DMFonteDeCaracteres.imgPonctuation, 4, x)
    else if (FValue.Chars[i] = '?') then
      x := x + AjoutImageEtRetourneLargeur
        (DMFonteDeCaracteres.imgPonctuation, 5, x)
    else if (FValue.Chars[i] = ' ') then
      x := x + 20;

  Width := x;
end;

// TODO : gérer changement de taille des chiffres en cas de resize de la zone

end.
