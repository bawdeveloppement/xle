# Basic Examples
Here are some basic examples of **Love2D-ECS**.

> :bulb: **Note:** these examples are output-based templates from **Love2D-ECS** after compilation, but can be edited manually (not recommended).

## SceneTemplate
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

## GameObjectTemplate
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
