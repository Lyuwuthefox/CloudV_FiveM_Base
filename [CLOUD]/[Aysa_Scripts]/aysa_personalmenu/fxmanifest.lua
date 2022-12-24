fx_version 'cerulean'
game 'gta5'

author 'Fly'
description 'Cloud-V Custom Menu'
version '1.0.0'

shared_script '@es_extended/imports.lua'
client_scripts {
  '@NativeUI/NativeUI.lua',
  'client/main.lua'
}

server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'server/main.lua'
}

shared_script 'config.lua'
