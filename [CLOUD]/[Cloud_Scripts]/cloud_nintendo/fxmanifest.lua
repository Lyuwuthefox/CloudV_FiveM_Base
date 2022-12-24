fx_version 'adamant'

game 'gta5'

client_script { 
"config.lua",
"main/client.lua"
}

server_script {
"main/server.lua",
'@mysql-async/lib/MySQL.lua',
"config.lua"
} 

ui_page "html/index.html"
files {
    'html/index.html',
    'html/*.js',
    'html/*.css',
    'html/images/*.png',
    'qua_nintendo.ytyp',
    'html/images/games/*.png',
    'html/images/games/*.jpg'
}

lua54 'yes'

escrow_ignore {
    'config.lua',
}

data_file 'DLC_ITYP_REQUEST' 'qua_nintendo.ytyp'