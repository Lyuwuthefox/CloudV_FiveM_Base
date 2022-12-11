fx_version 'adamant'

game 'gta5'

version '1.0.0'

client_scripts {
  'config.lua',
  'client/main.lua',
}

server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'config.lua',
  'server/main.lua'
}

lua54 'yes'

escrow_ignore {
  'config.lua',
  'readme.md',

}

ui_page 'html/index.html'
files {
	'html/*.*',
	'html/img/*.*',
  'html/img/items/*.*',
  'html/fonts',
  'html/css/*.*',
  'html/js/*.*',
  'html/js/*.*.*',
  'html/media/*.*',
  'html/media/*.mp3',
  'html/media/*.wav',
  'html/fonts/*.*'
}
dependency '/assetpacks'