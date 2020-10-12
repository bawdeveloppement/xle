# Love2d - EntityComponentSystem (Documentation en cours)

See README_us.md for english version.

Cette librairie à pour but de donnés aux développeur la possibilité de développer un jeux vidéo sous le moteur Love2d avec un systéme ECS presque identique à celui d'Unity3d.

# Les objectifs.

See the Project section on github for TODOLISt

Finir les composants dynamique de base comme Transform, RigidBody, Text, Sprite.
Les classes Config, SceneManager, KeyboardManager.
Pouvoir développer un jeu uniquement en json.

# SceneTemplate
```json
{
  "sceneId": "MainMenu",
  "scenesObjects": [
    "ButtonPlay",
    "ButtonOption",
        "ButtonQuit",
  ]
}
```

# GameObjectTemplate
```json
{
  "gameObjectId": "ButtonPlay",
  "components": [
    {
      "componentId": "Transform",
      "data": {
        "position": { "x": "var_screen.width / 2 - self.width / 2"}
      }
    },
    {
      "componentId": "Text",
      "data": {
        "value": "Play"
      },
      "events": [
        { "eventId": "onClick", "action": "ft_changeScene('Game')"}
      ]
    }
  ]
}
```
