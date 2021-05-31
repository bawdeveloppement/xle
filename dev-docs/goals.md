OK, so that's how i imagine this engine working.

In the view of the client (user) :

When a user launch the game there is an endpoint bind into the client that the client should request and get the latest version of data.

This data is the description of the game and at the same the version checker.

```json
{
    // For more information about how to structure the game.json data see 
    // game.schema.json
    "title": "Realm of the mad god",
    "version": "1.0",
    "public_url": "http://realofthemadgod/"
}
```

- First the client download resources to run correctly.

- The client check if the folder of game exist
 if not the client create a folder with the name accordingly to the title (game.schema.json) 

- The client concat(public_url,"api/resources") and make a request to it this result to get all
data in form of json. 


```json
{
    // resources.shemas.json
    "$id": "Resources",
    "images": [
        "knight", // Sure we can make an object for referencing to a resource [see resource.schema.json
        "monster"
    ],
    "songs": [
        "hit",
        "play"
    ]
}
```

When we get the remote data for the game, the client compare the version of each ressource with local ressource exist, if doesnt exist the client download.

After theses step. we can setup screens. Each screen have their EntityComponentSystem object