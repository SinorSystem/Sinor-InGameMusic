let sound;

window.addEventListener('message', function (event) {
    let data = event.data;
    if (data.type === "play") {
        playMusic(data.url, data.volume);
    } else if (data.type === "stop") {
        stopMusic();
    }
});

function playMusic(url, volume) {
    try {
        if (sound) sound.unload(); // Unload previous sound if any

        console.log("Attempting to play:", url); // Debug log

        sound = new Howl({
            src: [url],
            volume: volume,
            html5: true,
            onend: function() {
                console.log("Song finished. Triggering the next song.");
                // Notify the client script that the song has finished playing
                fetch(`https://${GetParentResourceName()}/songEnded`, { method: "POST" });
            },
            onloaderror: function(id, error) {
                console.error("Howler load error:", error, "URL:", url); // Log load errors with URL
            },
            onplayerror: function(id, error) {
                console.error("Howler play error:", error); // Log play errors
            }
        });

        sound.play();
        console.log("Music should now be playing."); // Confirm play attempt
    } catch (e) {
        console.error("Error in playMusic function:", e); // Catch any unexpected errors
    }
}

function stopMusic() {
    if (sound) {
        sound.stop();
        sound.unload();
        sound = null;
        console.log("Music stopped."); // Confirm stop
    }
}
