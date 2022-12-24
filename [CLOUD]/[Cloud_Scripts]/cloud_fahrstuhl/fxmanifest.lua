fx_version 'adamant'
game 'gta5'
lua54 'yes'

version '1.0.2'
author 'RΛSMUS#9999'
description 'RiP-Development | FiveM Scripts & More'
url 'https://discord.development.rip'

shared_scripts {
  'config.lua',
  '@es_extended/imports.lua'
}

client_scripts {
  'client/*.lua',
  'config.lua',
  'notify.lua'
}

ui_page 'html/index.html'

files {
  'html/*.html',
  'html/*.css', 
  'html/*.js',
  'html/sound/*.mp3'
}

escrow_ignore {
  'config.lua'
}
dependency '/assetpacks'