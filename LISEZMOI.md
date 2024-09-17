# Pairpix

[This page in English.](README.md)

Jeu de mémoire classique avec des cartes à partir desquelles on doit former des paires. Cette version utilise des dessins d'animaux comme motifs.

Deux modes de jeu sont disponibles : un classique qui fait défiler les écrans, un challenge chronométré pour gagner un max de points.

Ce dépôt de code contient un projet développé en langage Pascal Objet sous Delphi. Vous ne savez pas ce qu'est Dephi ni où le télécharger ? Vous en saurez plus [sur ce site web](https://delphi-resources.developpeur-pascal.fr/).

## Présentations et conférences

### Twitch

Suivez mes streams de développement de logiciels, jeux vidéo, applications mobiles et sites web sur [ma chaîne Twitch](https://www.twitch.tv/patrickpremartin) ou en rediffusion sur [Serial Streameur](https://serialstreameur.fr/jv-pairpix.php) la plupart du temps en français.

## Télécharger et utiliser ce jeu vidéo

Ce logiciel est disponible dans une version de production directement installable ou exécutable.

[Itch.io (Windows)](https://gamolf.itch.io/pairpix)

[Google Play Store (Android)](https://play.google.com/store/apps/details?id=fr.gamolf.pairpix)

[Amazon (Android)](https://www.amazon.com/gp/product/B09XLS7H45)

[App Store (iOS et macOS)](https://apps.apple.com/app/pairpix/id1618671148)

[Microsoft Store](https://www.microsoft.com/store/apps/9N6K4W1FQ16H)

Vous pouvez aussi [consulter le site du logiciel](https://pairpix.gamolf.fr) pour en savoir plus sur son fonctionnement, accéder à des vidéos et articles, connaître les différentes versions disponibles et leurs fonctionnalités, contacter le support utilisateurs...

## Comment jouer ?

### Mode de jeu classique

Mode de jeu avec un calcul du score. Le nombre de paires à l'écran peut varier.

Un paire trouvée rapporte 2 points.
Une erreur fait perdre 1 point.
Le fait d'afficher puis masquer une carte compte comme une erreur.

La fin d'un tableau passe au tableau suivant, sans décompte de temps.

### Mode de jeu challenge

Mode de jeu avec un calcul du score. Le nombre de paires à l'écran peut varier.
On doit obtenir le plus grand score en 1 minute.

Un paire trouvée rapporte 2 points par le nombre de secondes restantes.
Une erreur fait perdre 1 point par le nombre de secondes restantes.
Le fait d'afficher puis masquer une carte compte comme une erreur.

La fin d'un tableau passe au tableau suivant dans la limite du délai imparti.

## Notes de développement

- 4 à 16 paires mélangées à l'écran
- niveaux progressifs
- images à piocher dans la bibliothèque du périphérique ou sur une liste (inApp sur certaines)

Ecrans :
- accueil
- jeu
- fin de niveau
- fin de partie
- scores
- options (avec choix des séries de photos)
- crédits

Options :
- musique on/off + volume
- bruitages on/off + volume
- liste des séries de photos disponibles et achat/téléchargement possible

Menu accueil :
- jouer
- challenge
- scores
- crédits
- options

accueil 0/1/2, credits 3/4/5, scores 6/7/8, jeu 9/10/11, options 12/13/14, quitter 15/16/17, pause 18/19/20

## Installation des codes sources

Pour télécharger ce dépôt de code il est recommandé de passer par "git" mais vous pouvez aussi télécharger un ZIP directement depuis [son dépôt GitHub](https://github.com/DeveloppeurPascal/Pairpix).

Ce projet utilise des dépendances sous forme de sous modules. Ils seront absents du fichier ZIP. Vous devrez les télécharger à la main.

* aucun sous module

L'affichage de certains textes mis en forme se fait à l'aide de la librarie [Delphi HTML Components](https://delphihtmlcomponents.com/). Une licence de cette librairie est nécessaire si vous désirez recompiler le projet tel quel.

## Compatibilité

En tant que [MVP Embarcadero](https://www.embarcadero.com/resources/partners/mvp-directory) je bénéficie dès qu'elles sortent des dernières versions de [Delphi](https://www.embarcadero.com/products/delphi) et [C++ Builder](https://www.embarcadero.com/products/cbuilder) dans [RAD Studio](https://www.embarcadero.com/products/rad-studio). C'est donc dans ces versions que je travaille.

Normalement mes librairies et composants doivent aussi fonctionner au moins sur la version en cours de [Delphi Community Edition](https://www.embarcadero.com/products/delphi/starter).

Aucune garantie de compatibilité avec des versions antérieures n'est fournie même si je m'efforce de faire du code propre et ne pas trop utiliser les nouvelles façons d'écrire dedans (type inference, inline var et multilines strings).

Si vous détectez des anomalies sur des versions antérieures n'hésitez pas à [les rapporter](https://github.com/DeveloppeurPascal/Pairpix/issues) pour que je teste et tente de corriger ou fournir un contournement.

## Licence d'utilisation de ce dépôt de code et de son contenu

Ces codes sources sont distribués sous licence [AGPL 3.0 ou ultérieure](https://choosealicense.com/licenses/agpl-3.0/).

Vous êtes globalement libre d'utiliser le contenu de ce dépôt de code n'importe où à condition :
* d'en faire mention dans vos projets
* de diffuser les modifications apportées aux fichiers fournis dans ce projet sous licence AGPL (en y laissant les mentions de copyright d'origine (auteur, lien vers ce dépôt, licence) obligatoirement complétées par les vôtres)
* de diffuser les codes sources de vos créations sous licence AGPL

Si cette licence ne convient pas à vos besoins vous pouvez acheter un droit d'utilisation de ce projet sous la licence [Apache License 2.0](https://choosealicense.com/licenses/apache-2.0/) ou une licence commerciale dédiée ([contactez l'auteur](https://developpeur-pascal.fr/nous-contacter.php) pour discuter de vos besoins).

Ces codes sources sont fournis en l'état sans garantie d'aucune sorte.

Certains éléments inclus dans ce dépôt peuvent dépendre de droits d'utilisation de tiers (images, sons, ...). Ils ne sont pas réutilisables dans vos projets sauf mention contraire.

## Comment demander une nouvelle fonctionnalité, signaler un bogue ou une faille de sécurité ?

Si vous voulez une réponse du propriétaire de ce dépôt la meilleure façon de procéder pour demander une nouvelle fonctionnalité ou signaler une anomalie est d'aller sur [le dépôt de code sur GitHub](https://github.com/DeveloppeurPascal/Pairpix) et [d'ouvrir un ticket](https://github.com/DeveloppeurPascal/Pairpix/issues).

Si vous avez trouvé une faille de sécurité n'en parlez pas en public avant qu'un correctif n'ait été déployé ou soit disponible. [Contactez l'auteur du dépôt en privé](https://developpeur-pascal.fr/nous-contacter.php) pour expliquer votre trouvaille.

Vous pouvez aussi cloner ce dépôt de code et participer à ses évolutions en soumettant vos modifications si vous le désirez. Lisez les explications dans le fichier [CONTRIBUTING.md](CONTRIBUTING.md).

## Supportez ce projet et son auteur

Si vous trouvez ce dépôt de code utile et voulez le montrer, merci de faire une donation [à son auteur](https://github.com/DeveloppeurPascal). Ca aidera à maintenir le projet (codes sources et binaires).

Vous pouvez utiliser l'un de ces services :

* [GitHub Sponsors](https://github.com/sponsors/DeveloppeurPascal)
* [Liberapay](https://liberapay.com/PatrickPremartin)
* [Patreon](https://www.patreon.com/patrickpremartin)
* [Paypal](https://www.paypal.com/paypalme/patrickpremartin)

ou si vous parlez français vous pouvez [vous abonner à Zone Abo](https://zone-abo.fr/nos-abonnements.php) sur une base mensuelle ou annuelle et avoir en plus accès à de nombreuses ressources en ligne (vidéos et articles).
