fx_version 'cerulean'
game 'gta5'

files {
  'html/assets/**',
  'html/index.html',
}

loadscreen 'html/index.html'

server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'server/main.lua',
}

dependencies {
    'devine_playtime'
}