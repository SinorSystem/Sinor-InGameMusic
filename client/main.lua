local QBCore = nil
local ESX = nil
local framework = Config.Framework
local musicPlaying = false
local currentIndex = 1

-- Utility function for controlled printing based on the config
local function debugPrint(msg)
    if Config.DebugPrint then
        print(msg)
    end
end

-- Load the correct framework
if framework == "QBCore" then
    QBCore = exports['qb-core']:GetCoreObject()
    debugPrint("QBCore framework loaded.")
elseif framework == "ESX" then
    ESX = exports['es_extended']:getSharedObject()
    debugPrint("ESX framework loaded.")
else
    debugPrint("Error: Unsupported framework specified in config.lua")
end

-- Automatically play music when the player loads
AddEventHandler('playerSpawned', function()
    if Config.PlayMusicOnPlayerLoaded then
        PlayMusicLoop()
    end
end)

-- Command to manually start the music
RegisterCommand(Config.CommandToPlay, function()
    PlayMusicLoop()
end, false)

-- Command to stop the music
RegisterCommand(Config.CommandToStop, function()
    StopMusic()
end, false)

-- Function to play the next song in the playlist
function PlayMusicLoop()
    if musicPlaying then
        debugPrint("Music is already playing, skipping play command.")
        return
    end

    musicPlaying = true
    PlayNextSong()
end

-- Function to stop the music
function StopMusic()
    if not musicPlaying then
        debugPrint("No music is currently playing, skipping stop command.")
        return
    end

    musicPlaying = false
    debugPrint("Stopping music.")
    
    -- Send NUI message to stop music
    SendNUIMessage({
        type = "stop"
    })
    debugPrint("NUI message sent to stop music.")
end

-- Function to play the next song
function PlayNextSong()
    if not musicPlaying then return end

    local musicUrl = GetMusicUrl()
    debugPrint("Playing music from URL: " .. musicUrl)
    
    -- Send NUI message to play the dynamically selected music URL
    SendNUIMessage({
        type = "play",
        url = musicUrl,
        volume = Config.DefaultVolume
    })
    debugPrint("NUI message sent to play music.")
end

-- Get the next music URL based on config
function GetMusicUrl()
    if Config.PlayMusicMode == "random" then
        currentIndex = math.random(1, #Config.MusicList)
    else
        currentIndex = (currentIndex % #Config.MusicList) + 1
    end
    debugPrint("Selected music URL index: " .. currentIndex)
    return Config.MusicList[currentIndex]
end

-- Handle the NUI callback when the song ends
RegisterNUICallback('songEnded', function(data, cb)
    debugPrint("Song ended event received in client.lua. Playing next song...")
    PlayNextSong()
    cb('ok')
end)

