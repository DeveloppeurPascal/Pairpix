# Pairpix

[Cette page en français.](LISEZMOI.md)

Classic memory game with cards from which one must form pairs. This version uses animal drawings as patterns.

Two game modes are available: a classic one that scrolls through the screens, and a timed challenge to win a maximum of points.

This code repository contains a project developed in Object Pascal language under Delphi. You don't know what Delphi is and where to download it ? You'll learn more [on this web site](https://delphi-resources.developpeur-pascal.fr/).

## Talks and conferences

### Twitch

Follow my development streams of software, video games, mobile applications and websites on [my Twitch channel](https://www.twitch.tv/patrickpremartin) or as replays on [Serial Streameur](https://serialstreameur.fr/jv-pairpix.php) mostly in French.

## Download and use this game

This software is available in a directly installable or executable production version.

[Itch.io (Windows)](https://gamolf.itch.io/pairpix)

[Google Play Store (Android)](https://play.google.com/store/apps/details?id=fr.gamolf.pairpix)

[Amazon (Android)](https://www.amazon.com/gp/product/B09XLS7H45)

[App Store (iOS et macOS)](https://apps.apple.com/app/pairpix/id1618671148)

[Microsoft Store](https://www.microsoft.com/store/apps/9N6K4W1FQ16H)

You can also [visit the software website](https://pairpix.gamolf.fr) to find out more about how it works, access videos and articles, find out about the different versions available and their features, contact user support...

## How to play ?

### Classic game mode

Game mode with score calculation. The number of pairs on the screen may vary.

A found pair earns 2 points.
A mistake loses 1 point.
Showing and hiding a card counts as an error.

The end of one tableau moves on to the next, with no time countdown.

### Challenge mode

Game mode with score calculation. The number of pairs on the screen can vary.
The aim is to achieve the highest score within 1 minute.

A found pair earns 2 points for the number of seconds remaining.
An error results in a loss of 1 point for the number of seconds remaining.
Showing and then hiding a card counts as an error.

The end of a tableau moves on to the next tableau within the time limit.

## Development notes

- 4 to 16 mixed pairs on screen
- progressive levels
- images from device library or list (inApp on some)

Screens :
- home
- game
- end of level
- end of game
- scores
- options (with choice of photo series)
- credits

Options :
- music on/off + volume
- sound effects on/off + volume
- list of photo series available for purchase/download

Home menu :
- play
- challenge
- scores
- credits
- options

home 0/1/2, credits 3/4/5, scores 6/7/8, play 9/10/11, options 12/13/14, leave 15/16/17, break 18/19/20

## Source code installation

To download this code repository, we recommend using "git", but you can also download a ZIP file directly from [its GitHub repository](https://github.com/DeveloppeurPascal/Pairpix).

This project uses dependencies in the form of sub-modules. They will be absent from the ZIP file. You'll have to download them by hand.

* no submodule

Some formatted text is displayed using the [Delphi HTML Components](https://delphihtmlcomponents.com/) library. A license for this library is required if you wish to recompile the project as is.

## Compatibility

As an [Embarcadero MVP](https://www.embarcadero.com/resources/partners/mvp-directory), I benefit from the latest versions of [Delphi](https://www.embarcadero.com/products/delphi) and [C++ Builder](https://www.embarcadero.com/products/cbuilder) in [RAD Studio](https://www.embarcadero.com/products/rad-studio) as soon as they are released. I therefore work with these versions.

Normally, my libraries and components should also run on at least the current version of [Delphi Community Edition](https://www.embarcadero.com/products/delphi/starter).

There's no guarantee of compatibility with earlier versions, even though I try to keep my code clean and avoid using too many of the new ways of writing in it (type inference, inline var and multiline strings).

If you detect any anomalies on earlier versions, please don't hesitate to [report them](https://github.com/DeveloppeurPascal/Pairpix/issues) so that I can test and try to correct or provide a workaround.

## License to use this code repository and its contents

This source code is distributed under the [AGPL 3.0 or later license](https://choosealicense.com/licenses/agpl-3.0/).

You are generally free to use the contents of this code repository anywhere, provided that:
* you mention it in your projects
* distribute the modifications made to the files supplied in this project under the AGPL license (leaving the original copyright notices (author, link to this repository, license) which must be supplemented by your own)
* to distribute the source code of your creations under the AGPL license.

If this license doesn't suit your needs, you can purchase the right to use this project under the [Apache License 2.0](https://choosealicense.com/licenses/apache-2.0/) or a dedicated commercial license ([contact the author](https://developpeur-pascal.fr/nous-contacter.php) to explain your needs).

These source codes are provided as is, without warranty of any kind.

Certain elements included in this repository may be subject to third-party usage rights (images, sounds, etc.). They are not reusable in your projects unless otherwise stated.

## How to ask a new feature, report a bug or a security issue ?

If you want an answer from the project owner the best way to ask for a new feature or report a bug is to go to [the GitHub repository](https://github.com/DeveloppeurPascal/Pairpix) and [open a new issue](https://github.com/DeveloppeurPascal/Pairpix/issues).

If you found a security issue please don't report it publicly before a patch is available. Explain the case by [sending a private message to the author](https://developpeur-pascal.fr/nous-contacter.php).

You also can fork the repository and contribute by submitting pull requests if you want to help. Please read the [CONTRIBUTING.md](CONTRIBUTING.md) file.

## Support the project and its author

If you think this project is useful and want to support it, please make a donation to [its author](https://github.com/DeveloppeurPascal). It will help to maintain the code and binaries.

You can use one of those services :

* [GitHub Sponsors](https://github.com/sponsors/DeveloppeurPascal)
* [Liberapay](https://liberapay.com/PatrickPremartin)
* [Patreon](https://www.patreon.com/patrickpremartin)
* [Paypal](https://www.paypal.com/paypalme/patrickpremartin)

or if you speack french you can [subscribe to Zone Abo](https://zone-abo.fr/nos-abonnements.php) on a monthly or yearly basis and get a lot of resources as videos and articles.
