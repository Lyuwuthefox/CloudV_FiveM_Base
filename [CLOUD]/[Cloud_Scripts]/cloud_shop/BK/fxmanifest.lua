fx_version 'adamant'
game 'gta5'

client_scripts {
  'config.lua',
  'client/*.lua'
}

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'config.lua',
  'server/cron.lua',
  'server/server.lua',
}

author 'btwlouis'
version '1.0.0'
description 'bc_shops'

ui_page {
  'html/index.html'
}

files {
  'html/index.html',
  'html/**/*.*'
}