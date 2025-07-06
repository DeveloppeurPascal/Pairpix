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
  File last update : 2025-07-03T10:44:17.196+02:00
  Signature : 1b75a485dca56353fa92b2fd1dab0f35a9e5e068
  ***************************************************************************
*)

unit uTplDialog;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Controls.Presentation, FMX.Objects, uDmImgDecors,
  FMX.ImgList, fmain,
  cMotsEnImages;

type
  TtplDialog = class(TFrame)
    zoneTitre: TLayout;
    lblTitre: TLabel;
    zoneTexte: TVertScrollBox;
    imgFond: TGlyph;
    MotsEnImages1: TMotsEnImages;
  private
    function GetfrmMain: TFrmMain;
  protected
    procedure Loaded; override;
    { Déclarations privées }
  public
    { Déclarations publiques }
    procedure init; virtual;
    property frmMain: TFrmMain read GetfrmMain;
  end;

implementation

{$R *.fmx}

uses udivers;
{ TtplDialog }

function TtplDialog.GetfrmMain: TFrmMain;
begin
  if (application.MainForm is TFrmMain) then
    result := (application.MainForm as TFrmMain)
  else
    result := nil;
end;

procedure TtplDialog.init;
begin

end;

procedure TtplDialog.Loaded;
begin
  inherited;
  lblTitre.Visible := false;
  MotsEnImages1.Value := lblTitre.Text;
end;

end.
