# Test technique Mobiapps

[![Language](https://img.shields.io/badge/Swift-5.0-brightgreen.svg)](http://swift.org)
[![Xcode](https://img.shields.io/badge/Xcode-10.2-brightgreen.svg)](https://developer.apple.com/download/more/)


## Informations de contact
- Nom : Quentin Eude
- Email : quentineude@gmail.com
- LinkedIn : [Lien](https://www.linkedin.com/in/quentineude/)

## 🏛 Architecture

J'ai choisi une architecture MVC pour cette application car c'est celle qui est conseillée par les guidelines Apple.
J'ai aussi fait ce choix car elle permet de séparer et de structurer simplement son code même sans avoir une connaissance avancée du langage utilisé. (ce qui était le cas ici)

## 📦 Dépendances
- [Alamofire](https://github.com/Alamofire/Alamofire) : Permet de rendre la couche d'appels réseaux bien plus claire et simple à mettre en place. Permet aussi d'utiliser de manière plus simple le type `Result` de Swift 5.0.
- [Kingfisher](https://github.com/onevcat/Kingfisher) : Permet de récupérer les images de manière asynchrone et de les garder en cache de manière simple.

## 💡 Améliorations possibles

- Changer la méthode de récupération des catégories pour chaque groupe et faire du Lazy Loading par rapport au scroll de la `TableView`.
- Utiliser une architecture MVVM plutôt que MVC pour permettre une meilleure séparation entre les différentes couches. Cela permettrait notamment une meilleure testabilité.
- Ajouter des tests UI.

## 🛠 Difficultés rencontrées
- API de GuildWars2 qui ne fonctionnait pas toujours : impossibilité de récupérer les catégories ou les achievements durant le weekend.
- Difficultés dans un premier temps a consommer l'API et donc besoin d'exécuter des requêtes HTTP en chaine dans certains cas. (récupération des catégories contenues dans les groupes)
- Pas de réelle expérience en Swift avant cet exercice.