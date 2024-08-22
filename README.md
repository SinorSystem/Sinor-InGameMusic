# Sinor In-Game Music
This resource automatically plays music when a player loads into the server, with options for random or sequential playback. It supports both QBCore and ESX frameworks and allows full configuration 

# Features

* Automatic music playback when a player logs in.
* Continuous playlist cycling with options for random or ordered playback.
* Configurable volume and playback settings.
* Manual control with in-game commands.


# Dependencies

- Requires QBCore or ESX framework.

# Config
```lua
Config = {}

Config.Framework = "QBCore" -- Choose either 'ESX' or 'QBCore'
Config.PlayMusicOnPlayerLoaded = true -- Set to true to play music when the player loads
Config.DefaultVolume = 0.5 -- Volume level between 0.1 and 1.0
Config.PlayMusicMode = "random" -- Options: 'random' or 'order'
Config.CommandToPlay = "playmusic" -- Command to manually start the music (can still be used if needed)
Config.CommandToStop = "stopmusic" -- Command to stop the music
Config.DebugPrint = true -- Set to true to enable debug printing, false to disable

Config.MusicList = {
    "nui://Sinor-InGameMusic/html/song1.mp3",
    "nui://Sinor-InGameMusic/html/song2.mp3",
    -- Add more songs as needed
}
```
# Installation

- Download and Install:

- Place the Sinor-InGameMusic folder in your resources directory.

- Add the following line to your server.cfg:

``ensure Sinor-InGameMusic``

- Ensure the Correct Folder Name:

- Verify that the folder name matches exactly with the resource name used in your configuration and URLs.

# Adding Music Files

- Place your music files (e.g., song1.mp3, song2.mp3) in the html/ directory within this resource.

- Update Config.MusicList in config.lua with the correct paths:
```lua
Config.MusicList = {
    "nui://Sinor-InGameMusic/html/song1.mp3",
    "nui://Sinor-InGameMusic/html/song2.mp3"
}

```

# In-Game Commands

- Start Music Manually: ``/playmusic``
- Stop Music Manually: ``/stopmusic``

# Troubleshooting

- Verify that the file paths are correct and match your resource folder name.
- Check if the debug printing is enabled (Config.DebugPrint = true) and view the console logs (F8) for detailed information.
- Test the file accessibility by opening the URL in a browser: ``nui://Sinor-InGameMusic/html/song1.mp3``

# Known Issues

- Network Error (Howler.js Error Code 2): This is typically caused by incorrect file paths. Ensure the resource name matches exactly and that the file is included in fxmanifest.lua.


