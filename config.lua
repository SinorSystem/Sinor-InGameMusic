Config = {}

Config.Framework = "QBCore" -- Choose either 'ESX' or 'QBCore'
Config.PlayMusicOnPlayerLoaded = true -- Set to true to play music when the player loads
Config.DefaultVolume = 0.1 -- Volume level between 0.1 and 1.0
Config.PlayMusicMode = "random" -- Options: 'random' or 'order'
Config.CommandToPlay = "playmusic" -- Command to manually start the music (can still be used if needed)
Config.CommandToStop = "stopmusic" -- Command to stop the music
Config.DebugPrint = false -- Set to true to enable debug printing, false to disable

Config.MusicList = {
    "nui://Sinor-InGameMusic/html/song1.mp3",
    "nui://Sinor-InGameMusic/html/DaysGone3.mp3",
    "nui://Sinor-InGameMusic/html/DaysGone2.mp3",
    "nui://Sinor-InGameMusic/html/DaysGone1.mp3",
    "nui://Sinor-InGameMusic/html/Minecraft2.mp3",
    "nui://Sinor-InGameMusic/html/Minecraft1.mp3"
    -- Add more songs as needed
}
