fx_version 'adamant'

game 'gta5'

version '1.0.0'



server_scripts {
'server/server.lua',
}

client_scripts {
  'client/client.lua',
}
ui_page 'html/index.html'
files {
	'html/*.*',
	'html/img/*.*',
  'html/img/itemImages/*.*',
  'html/img/notifyImages/cancel.png',
  'html/img/notifyImages/info.png',
  'html/img/notifyImages/success.png',
  'html/img/notifyImages/warning.png',
  'html/fonts',
  'html/css/*.*',
  'html/js/*.*',
  'html/js/*.*.*',
  'html/media/*.*',
  'html/media/*.mp3',
  'html/media/*.wav',
  'html/fonts/*.*'
}