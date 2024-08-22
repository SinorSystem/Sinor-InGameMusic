fx_version 'cerulean'
game 'gta5'

author 'SinorSystem'
description 'Advanced IN Game Music Script (ESX/QBCore)'
lua54 'yes'

shared_scripts {
    'config.lua'
}

client_scripts {
    "client/main.lua"
}


ui_page 'html/index.html'

files {
    'html/index.html',
    'html/scripts.js',
    'html/*.mp3' -- Add your local MP3 files here
}

-- escrow_ignore {
--     'config.lua',    
--   }
