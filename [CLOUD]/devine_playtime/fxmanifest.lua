fx_version 'cerulean'
game 'gta5'

author 'Devine'
version '1.0.0'
lua54 'yes'

client_script 'client/client.lua'
server_script 'server/server.lua'
shared_script 'config.lua'

server_export 'getPlayTime'
server_export 'getLastUpdate'
server_export 'insertOrUpdatePlayTime'

escrow_ignore {
    'config.lua'
}